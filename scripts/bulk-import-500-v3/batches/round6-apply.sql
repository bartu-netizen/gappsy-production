-- Enrichment batch: LevelEleven, Clari, Aviso, Gong, Chorus.ai, Avoma, Jiminny, Salesloft, Outreach, QuickMail, PersistIQ, ContactOut, Dropcontact, FullEnrich, Commsor, Bettermode, Circle, Mighty Networks, Discourse, Hivebrite, Higher Logic Vanilla, Khoros Communities, Disciple, Skool, Heartbeat, Geneva, Forumbee, Flarum, NodeBB, MyBB, phpBB, Loomio, Decidim, Polis, Crowdcast, Butter, WebinarJam, EverWebinar, BigMarker, Airmeet, Goldcast, Bizzabo, SpotMe, Whova, Cvent, EventMobi, Swapcard, Brella, Grip, Sched, Sessionize, Pretalx, Tito, Ticket Tailor, Humanitix, Lu.ma, Partiful, Zuddl, Vimeo Events, StreamYard, Riverside, Zencastr, SquadCast, Cleanfeed, Boomcaster, Alitu, Hindenburg, Transistor
-- Publishes 68 bulk-imported tool(s) with full editorial content.

-- ── LevelEleven ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sales performance management software that turns Salesforce data into scorecards, coaching views, and team competitions.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Detroit, MI, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LevelEleven is sales gamification and performance management software built on Salesforce data, now part of Ascent Cloud.$q$,
  og_description = $q$LevelEleven is sales gamification and performance management software built on Salesforce data, now part of Ascent Cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'db13d6f8-fa65-4d11-8578-05ad62a17ca6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Performance scorecards$q$, $q$Turns sales goals into daily tracking metrics so reps can see progress against targets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Coaching views$q$, $q$Gives managers visibility into rep activity and outcomes to support consistent 1:1 coaching.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Sales competitions$q$, $q$Runs leaderboards and recognition-based competitions to drive specific selling behaviors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$KPI tracking$q$, $q$Tracks pipeline activity and conversion metrics pulled directly from Salesforce.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Salesforce-native$q$, $q$Built to work primarily with Salesforce CRM data, available on the Salesforce AppExchange.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Deep, native integration with Salesforce data$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Established product with a large installed base of 1,000+ sales teams$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Highly rated on TrustRadius, Salesforce AppExchange, and Capterra$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Combines coaching, scorecards, and gamified competitions in one tool$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$No public pricing; requires a custom quote through Ascent Cloud$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Primarily built around Salesforce, limiting value for non-Salesforce shops$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Now sold as part of the broader Ascent Cloud suite rather than as a fully standalone product$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Is LevelEleven still a standalone product?$q$, $q$LevelEleven is now offered as one of the products within the Ascent Cloud suite, alongside Territory Planner and Geopointe, though it is still marketed under the LevelEleven name.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$What CRM does LevelEleven work with?$q$, $q$LevelEleven is built to work primarily with Salesforce CRM data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Is there a free trial?$q$, $q$LevelEleven is available as a free trial through the Salesforce AppExchange.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$How is LevelEleven priced?$q$, $q$Pricing is not published; Ascent Cloud provides custom quotes based on team size and which products (LevelEleven, Territory Planner, Geopointe, Insights) you select.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Sales coaching cadence$q$, $q$Managers use scorecards and activity visibility to run consistent coaching conversations with reps.$q$, $q$Sales managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$Driving specific behaviors$q$, $q$Teams run time-boxed competitions and leaderboards to push activities like outbound calls or demos scheduled.$q$, $q$Sales operations and enablement teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$overview$q$, $q$What is LevelEleven?$q$, 2, ARRAY[$q$LevelEleven is sales performance management software that converts Salesforce activity data into scorecards, coaching dashboards, and gamified competitions.$q$, $q$The product is now part of Ascent Cloud, where it operates alongside Territory Planner and Geopointe under a 'Plan-Execute-Grow' framework, but continues to be marketed under the LevelEleven name.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', $q$who-its-for$q$, $q$Who LevelEleven is for$q$, 2, ARRAY[$q$LevelEleven suits Salesforce-based sales organizations that want to translate pipeline and activity data into daily coaching routines and team competitions, rather than teams looking for a CRM-agnostic tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db13d6f8-fa65-4d11-8578-05ad62a17ca6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Clari ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Revenue orchestration platform combining AI revenue agents, forecasting, and pipeline inspection for enterprise sales teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Clari is an AI-powered revenue orchestration platform used by 1,500+ companies for forecasting, pipeline inspection, and deal intelligence.$q$,
  og_description = $q$Clari is an AI-powered revenue orchestration platform used by 1,500+ companies for forecasting, pipeline inspection, and deal intelligence.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6c40226a-eb4f-4492-897b-fa93c0ac4f4c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Revenue AI Agents$q$, $q$Automated agents that monitor deals, flag risk, and support forecasting across the sales cycle.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Forecast$q$, $q$Forecasting and pipeline management tools built to give revenue leaders predictable, up-to-date projections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Inspect$q$, $q$Opportunity management that surfaces deal risk and data quality issues directly from CRM activity.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Copilot$q$, $q$Conversation intelligence and coaching drawn from recorded sales calls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Groove$q$, $q$Sales engagement and prospecting workflows built into the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Revenue Database (RevDB)$q$, $q$A unified data layer that captures revenue activity across sales, marketing, and post-sales.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Used by 1,500+ customers managing a reported $5 trillion in revenue$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Named a 2025 G2 Best Sales Software Winner and a Leader in Gartner's Magic Quadrant for Revenue Action Orchestration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Combines forecasting, conversation intelligence, and engagement in one platform rather than separate point tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Built for enterprise, cross-functional revenue teams (sales, RevOps, marketing, finance)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$No public pricing; requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Positioned for large/enterprise organizations, which may be more than smaller teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Founding year and headquarters are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$How much does Clari cost?$q$, $q$Clari does not publish pricing; prospective customers must request a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Who uses Clari?$q$, $q$Clari is used by revenue operations, sales, marketing, post-sales, and finance teams, primarily at larger and enterprise organizations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Does Clari include conversation intelligence?$q$, $q$Yes, Clari Copilot provides conversation intelligence and coaching based on recorded sales calls.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Does Clari do sales forecasting?$q$, $q$Yes, Clari Forecast is a dedicated module for pipeline and revenue forecasting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Revenue forecasting$q$, $q$RevOps and sales leadership use Clari Forecast to build and track forecasts against pipeline data.$q$, $q$RevOps and sales leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Deal inspection$q$, $q$Managers use Clari Inspect and Revenue AI Agents to spot at-risk deals before they slip.$q$, $q$Sales managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$Call coaching$q$, $q$Teams use Clari Copilot to review recorded calls and coach reps on messaging.$q$, $q$Sales enablement teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$overview$q$, $q$What is Clari?$q$, 2, ARRAY[$q$Clari is a revenue orchestration platform that pairs AI-driven revenue agents with forecasting, opportunity inspection, conversation intelligence, and sales engagement tools.$q$, $q$The platform is built around a unified Revenue Database that pulls activity from CRM, calls, and other revenue tools so agents can monitor deals across every stage.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', $q$who-its-for$q$, $q$Who Clari is for$q$, 2, ARRAY[$q$Clari targets larger and enterprise revenue organizations that need cross-functional visibility across sales, RevOps, marketing, finance, and post-sales, rather than single-rep or very small-team use.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c40226a-eb4f-4492-897b-fa93c0ac4f4c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Aviso ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI revenue platform combining forecasting, conversation intelligence, and deal guidance agents for go-to-market teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Aviso is an AI revenue platform offering forecasting, conversation intelligence, and no-code AI agents for revenue teams.$q$,
  og_description = $q$Aviso is an AI revenue platform offering forecasting, conversation intelligence, and no-code AI agents for revenue teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1e0adaa0-bc6f-4974-9a54-f5f303694cb7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Real-time AI avatars$q$, $q$Role-specific AI agents that provide deal guidance and prospect engagement support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$No-code Agent Studio$q$, $q$Lets teams build and deploy custom AI agents for revenue workflows without engineering help.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Conversation intelligence$q$, $q$Analyzes sales calls to surface seller performance insights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Relationship intelligence$q$, $q$Tracks multi-threaded stakeholder relationships within deals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Revenue forecasting$q$, $q$Advanced forecasting models for pipeline and revenue projections.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Pipeline inspection$q$, $q$Analyzes early-stage and mature pipeline to flag deals needing acceleration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Mobile app$q$, $q$Gives reps and managers an AI-powered revenue view from a mobile device.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Combines forecasting, conversation intelligence, and agent-building tools in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Reports being used by 450+ revenue teams$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$No-code Agent Studio allows non-technical teams to build custom AI workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Offers 30+ pre-built GTM workflows and 13-week cadences$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$No public pricing; requires a custom proposal$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Founding year, headquarters, and company size are not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Reported performance statistics (e.g., win-rate increases) are self-reported case study figures, not independently verified$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$How much does Aviso cost?$q$, $q$Aviso does not publish pricing; you request a tailored proposal through its site.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Does Aviso offer a free trial?$q$, $q$This is not stated on the site; pricing and access are handled via a custom proposal process.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Can I build custom AI agents in Aviso?$q$, $q$Yes, Aviso's no-code Agent Studio lets teams build and deploy AI agents without engineering resources.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Does Aviso include conversation intelligence?$q$, $q$Yes, Aviso includes conversation intelligence for analyzing sales calls and seller performance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Revenue forecasting$q$, $q$Revenue leaders use Aviso's forecasting models to build more accurate pipeline projections.$q$, $q$CROs and RevOps leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Deal acceleration$q$, $q$Sales managers use pipeline inspection to identify at-risk deals early and mature-stage deals needing a push.$q$, $q$Sales managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$Custom AI workflows$q$, $q$RevOps teams build custom agents in Agent Studio for tasks specific to their sales process.$q$, $q$RevOps teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$overview$q$, $q$What is Aviso?$q$, 2, ARRAY[$q$Aviso is an AI revenue platform that combines forecasting, conversation intelligence, relationship intelligence, and a no-code agent builder for go-to-market teams.$q$, $q$The platform includes role-specific AI agents intended to guide deals and engage prospects, alongside pre-built workflows and cadences for common revenue processes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', $q$who-its-for$q$, $q$Who Aviso is for$q$, 2, ARRAY[$q$Aviso is aimed at revenue teams (BDRs, SDRs, account executives, and C-suite revenue leaders) at mid-market and enterprise companies that want AI-driven forecasting and deal guidance beyond a single point tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e0adaa0-bc6f-4974-9a54-f5f303694cb7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Gong ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered revenue platform that captures sales calls and customer interactions to power forecasting, coaching, and deal insights.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Gong is an AI revenue platform used by 5,000+ companies for call recording, forecasting, sales enablement, and deal intelligence.$q$,
  og_description = $q$Gong is an AI revenue platform used by 5,000+ companies for call recording, forecasting, sales enablement, and deal intelligence.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e0177a50-1ba8-4919-b2dc-e93170edc86f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Gong Engage$q$, $q$AI-driven sales engagement and outreach personalization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Gong Forecast$q$, $q$Revenue forecasting powered by predictive analytics drawn from deal and call data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Gong Enable$q$, $q$AI-powered sales enablement and training built on real call data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Gong Agents$q$, $q$Automated agents that handle tasks like follow-ups, pipeline updates, and enablement workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Revenue Graph$q$, $q$A unified data network that captures customer interactions across the business.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Gong Collective$q$, $q$An ecosystem of 400+ integrations connecting Gong to other revenue tools.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Rated 4.9/5 across more than 6,200 G2 reviews$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Used by 5,000+ customers, including large enterprise accounts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Recognized as a Forrester Wave leader$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Broad integration ecosystem (400+ integrations via Gong Collective)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$No public pricing; licensing includes a platform fee plus per-user pricing, quoted individually$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Aimed at organizations large enough to need forecasting, enablement, and engagement in one platform, which can be more than very small teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Founding year and employee count are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$How is Gong priced?$q$, $q$Gong prices licenses per user plus a platform fee based on the number of users supported; exact pricing requires a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$What does Gong do?$q$, $q$Gong captures customer interactions like calls and meetings, analyzes them with AI, and turns the insights into forecasting, coaching, and workflow automation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Does Gong offer sales forecasting?$q$, $q$Yes, Gong Forecast provides revenue forecasting based on predictive analytics.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$How many customers does Gong have?$q$, $q$Gong reports more than 5,000 customers, including Fortune 10 companies.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Conversation intelligence$q$, $q$Sales teams record and analyze calls to understand what messaging and behaviors close deals.$q$, $q$Sales reps and managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Revenue forecasting$q$, $q$RevOps and sales leadership use Gong Forecast to build predictive, data-backed forecasts.$q$, $q$RevOps and CROs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$Sales enablement$q$, $q$Enablement teams use Gong Enable to build training programs grounded in real call data.$q$, $q$Sales enablement teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$overview$q$, $q$What is Gong?$q$, 2, ARRAY[$q$Gong is an AI-powered revenue platform that captures customer interactions such as calls, meetings, and emails, then analyzes them to surface forecasting, coaching, and deal insights.$q$, $q$The platform includes dedicated modules for engagement (Gong Engage), forecasting (Gong Forecast), and enablement (Gong Enable), tied together by a shared Revenue Graph and automated agents.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', $q$who-its-for$q$, $q$Who Gong is for$q$, 2, ARRAY[$q$Gong serves revenue leadership, sales teams and managers, RevOps, customer success, and sales enablement functions, primarily at mid-market and enterprise organizations across industries like technology, financial services, healthcare, and manufacturing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0177a50-1ba8-4919-b2dc-e93170edc86f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chorus.ai ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Conversation intelligence software that records and analyzes sales calls, now sold as Chorus by ZoomInfo.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Chorus (formerly Chorus.ai) is conversation intelligence software from ZoomInfo that records and analyzes sales calls for coaching and deal insight.$q$,
  og_description = $q$Chorus (formerly Chorus.ai) is conversation intelligence software from ZoomInfo that records and analyzes sales calls for coaching and deal insight.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a2732f6-450c-43e0-9cb0-a1752605865d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a2732f6-450c-43e0-9cb0-a1752605865d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Call transcription and analysis$q$, $q$Automatically transcribes and analyzes customer calls, meetings, and emails.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Sales coaching$q$, $q$Tracks team performance and surfaces coaching opportunities from recorded conversations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Deal intelligence$q$, $q$Analyzes relationship and deal dynamics to give reps and managers visibility into deal health.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Competitive win/loss analysis$q$, $q$Identifies competitor mentions and patterns across calls to inform win/loss analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$CRM and Zoom integration$q$, $q$Automatically connects to Zoom and syncs contacts and communications to the CRM.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$ZoomInfo data integration$q$, $q$Connects conversation data with ZoomInfo's B2B contact and company database.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Backed by 14 technology patents in machine-learning-based conversation analysis$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Won G2 awards for 'Easiest Admin - SMB' and 'Best Results - MM'$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Direct integration with ZoomInfo's contact and company database$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Automatic Zoom call capture with no manual setup$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Now sold only as part of ZoomInfo's platform (Chorus by ZoomInfo) rather than as an independent product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$No public pricing; requires a demo or free-trial request to get a quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Founding year and headquarters are not published on the current product page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Is Chorus.ai still available as a standalone product?$q$, $q$Chorus.ai was acquired by ZoomInfo and is now sold as 'Chorus' (Chorus by ZoomInfo), integrated with ZoomInfo's broader platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$What does Chorus do?$q$, $q$Chorus records, transcribes, and analyzes sales calls and meetings to provide coaching insights, deal intelligence, and win/loss analysis.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Does Chorus integrate with Zoom?$q$, $q$Yes, Chorus automatically connects to Zoom to capture calls.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$How is Chorus priced?$q$, $q$Pricing is not published; the site directs users to request a demo or free trial for a quote.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Call coaching$q$, $q$Sales managers review transcribed and scored calls to coach reps on messaging and objection handling.$q$, $q$Sales managers and enablement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$Deal risk visibility$q$, $q$Reps and managers use deal intelligence to track relationship health and competitive mentions within a deal.$q$, $q$Sales reps and RevOps$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$overview$q$, $q$What is Chorus.ai?$q$, 2, ARRAY[$q$Chorus.ai is conversation intelligence software that records, transcribes, and analyzes customer calls, meetings, and emails to give sales teams visibility into deals and coaching opportunities.$q$, $q$The product was acquired by ZoomInfo and is now marketed as Chorus by ZoomInfo, integrated with ZoomInfo's contact and company database and workflow automation tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', $q$who-its-for$q$, $q$Who Chorus.ai is for$q$, 2, ARRAY[$q$Chorus targets sales teams, revenue enablement managers, and coaching functions at enterprise and mid-market organizations that already use or plan to use ZoomInfo's broader data platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a2732f6-450c-43e0-9cb0-a1752605865d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Avoma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI meeting assistant and revenue intelligence platform offering transcription, coaching, scheduling, and pipeline insights.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/user/month (annual billing)$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$Palo Alto, CA, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Avoma is an AI meeting assistant with transcription, coaching, and revenue intelligence, starting at $19/user/month billed annually.$q$,
  og_description = $q$Avoma is an AI meeting assistant with transcription, coaching, and revenue intelligence, starting at $19/user/month billed annually.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a70ed10a-92ff-4ae6-a48d-ff9752035a19' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$AI Meeting Assistant$q$, $q$Auto-records and transcribes meetings in real time, supporting 40+ languages, and generates AI notes and summaries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Scheduler & Lead Router$q$, $q$Automates meeting scheduling and routes inbound leads to the right rep.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Conversation intelligence$q$, $q$Scores calls and analyzes talk patterns to power personalized coaching.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Revenue intelligence$q$, $q$Surfaces deal risk alerts, pipeline visibility, win-loss analysis, and churn prediction.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Ask Avoma$q$, $q$An AI copilot that answers questions about recorded conversations and deal history.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Free view-only seats$q$, $q$Lets collaborators view meeting notes and recordings without a full paid seat.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Transparent published pricing starting at $19/user/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$14-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Supports transcription in 40+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Over 1,000 integrations, including major CRMs, conferencing tools, and dialers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Available on web with iOS and Android mobile apps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Full conversation intelligence requires the higher $29/user/month tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Company size is not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Performance claims like '40% win rate increase' are self-reported$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$How much does Avoma cost?$q$, $q$Avoma's AI Meeting Assistant starts at $19/user/month billed annually; adding Conversation Intelligence brings it to $29/user/month billed annually.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Is there a free trial?$q$, $q$Yes, Avoma offers a 14-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Does Avoma have a free plan?$q$, $q$Avoma offers free view-only seats for collaborators who need to view notes and recordings without a full paid seat.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$What CRMs does Avoma integrate with?$q$, $q$Avoma integrates with CRMs including Salesforce, HubSpot, and Pipedrive, among 1,000+ total integrations.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$When was Avoma founded?$q$, $q$Avoma was founded in late 2017 in Palo Alto, CA.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Meeting notes and follow-up$q$, $q$Teams use Avoma to auto-record, transcribe, and summarize customer meetings so reps spend less time on manual notes.$q$, $q$Sales and customer success teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Call coaching$q$, $q$Managers use call scoring and talk-pattern analysis to coach reps on their calls.$q$, $q$Sales managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$Pipeline and deal risk visibility$q$, $q$RevOps uses Avoma's revenue intelligence to flag at-risk deals and analyze win/loss patterns.$q$, $q$RevOps teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$AI Meeting Assistant$q$, $q$$19/user/month$q$, $q$annual$q$, $q$["Auto-recording and transcription","AI-generated notes and summaries","Scheduler & Lead Router"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$AI Meeting Assistant + Conversation Intelligence$q$, $q$$29/user/month$q$, $q$annual$q$, $q$["Everything in AI Meeting Assistant","Call scoring","Coaching and talk pattern analysis"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$overview$q$, $q$What is Avoma?$q$, 2, ARRAY[$q$Avoma is an AI meeting assistant and revenue intelligence platform that automates note-taking, scheduling, and coaching for sales and customer success teams.$q$, $q$Founded in late 2017 in Palo Alto, California, Avoma combines meeting transcription with conversation intelligence and pipeline-level revenue intelligence in a single subscription.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', $q$who-its-for$q$, $q$Who Avoma is for$q$, 2, ARRAY[$q$Avoma is built for sales leaders, RevOps, sales enablement, account executives, and customer success leaders at organizations ranging from SMBs to enterprises that want meeting transcription and coaching without stitching together separate tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a70ed10a-92ff-4ae6-a48d-ff9752035a19', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Jiminny ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Conversation and revenue intelligence platform that records calls, emails, and video meetings and syncs AI-extracted insights to the CRM.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Jiminny is a conversation and revenue intelligence platform offering call recording, AI insights, and CRM sync, with a 14-day free trial.$q$,
  og_description = $q$Jiminny is a conversation and revenue intelligence platform offering call recording, AI insights, and CRM sync, with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '846a442d-c466-4a1c-ae5e-3ccb660753fb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '846a442d-c466-4a1c-ae5e-3ccb660753fb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$AI call recording and transcription$q$, $q$Records and transcribes phone calls, video meetings, and emails automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Automated CRM logging$q$, $q$Syncs extracted insights, notes, and activity data directly to the CRM.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Sales coaching insights$q$, $q$Surfaces coaching opportunities and performance analysis from recorded conversations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Competitive intelligence tracking$q$, $q$Flags competitor mentions across calls to support competitive analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Pipeline risk detection$q$, $q$Analyzes deal conversations to identify pipeline and deal risk.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$AI notetaker$q$, $q$Automatically captures notes during video and phone conversations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Rated 4.6 out of 5 by users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$14-day free trial with full feature access and no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$SOC 2 Type II certified and GDPR, CCPA, and HIPAA compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Hosted on AWS with a 99.9% uptime guarantee$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Integrates with CRM and communication tools including HubSpot and Aircall$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$No public pricing tiers; exact plan costs are not disclosed on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Founding year, headquarters, and company size are not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Reported case-study results (e.g., ARR growth, churn reduction) are customer-specific, not guaranteed outcomes$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Does Jiminny offer a free trial?$q$, $q$Yes, Jiminny offers a 14-day free trial with full feature access and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$How much does Jiminny cost?$q$, $q$Specific pricing tiers are not disclosed on the website; you need to sign up or contact Jiminny for pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Is Jiminny compliant with data regulations?$q$, $q$Yes, Jiminny is SOC 2 Type II certified and compliant with GDPR, CCPA, and HIPAA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$What does Jiminny integrate with?$q$, $q$Jiminny integrates with CRM and communication tools including HubSpot and Aircall, among others.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Automated CRM updates$q$, $q$Reps use Jiminny to automatically log call and meeting data to the CRM, reducing manual admin work.$q$, $q$Sales reps$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Call coaching$q$, $q$Managers review AI-analyzed calls to coach reps and track performance trends.$q$, $q$Sales managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$Deal risk tracking$q$, $q$RevOps teams use pipeline risk detection to flag deals that need attention.$q$, $q$Revenue operations teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$overview$q$, $q$What is Jiminny?$q$, 2, ARRAY[$q$Jiminny is a conversation and revenue intelligence platform that captures phone calls, video meetings, and emails, then uses AI to extract insights and sync them automatically to the CRM.$q$, $q$The platform focuses on reducing sales admin work while giving managers visibility into deal progress, competitive mentions, and coaching opportunities.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', $q$who-its-for$q$, $q$Who Jiminny is for$q$, 2, ARRAY[$q$Jiminny is aimed at sales reps, sales managers, and revenue operations teams that want automated call capture and CRM logging without manual note-taking.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('846a442d-c466-4a1c-ae5e-3ccb660753fb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Salesloft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Revenue orchestration platform combining sales engagement cadences, conversation intelligence, and AI agents for go-to-market teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Atlanta, GA, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Salesloft is a revenue orchestration platform used by 4,000+ companies for sales cadences, forecasting, and conversation intelligence.$q$,
  og_description = $q$Salesloft is a revenue orchestration platform used by 4,000+ companies for sales cadences, forecasting, and conversation intelligence.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0f4afdee-5f6e-4f90-abf7-5fd32937393b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Cadence automation$q$, $q$Builds and nurtures sales pipeline through automated multi-step outreach sequences.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Rhythm$q$, $q$An action recommendation engine that prioritizes what reps should do next.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Conversation intelligence$q$, $q$Surfaces insights about buyer and seller behavior from recorded sales conversations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Deals management$q$, $q$Tracks and manages sales opportunities through to close.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Sales forecasting$q$, $q$Predictive revenue forecasting built on pipeline and activity data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Chat agents$q$, $q$AI agents that convert website visitors into pipeline.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$AI agents for email$q$, $q$Automates email workflows and other repetitive outreach tasks.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Used by 4,000+ customers, including IBM, Stripe, Siemens, and 3M$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Combines sales engagement, forecasting, and conversation intelligence in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Has an integrations marketplace for connecting additional tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Established headquarters and multiple offices (Atlanta, London, Mexico)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$No public pricing; requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Founding year and company size are not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Case study results (e.g., '3M closed deals 2.5x faster') are customer-specific outcomes, not guarantees$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$How much does Salesloft cost?$q$, $q$Salesloft does not publish pricing; you need to contact sales for a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Where is Salesloft headquartered?$q$, $q$Salesloft is headquartered in Atlanta, Georgia, with additional offices in London and Mexico.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Does Salesloft include conversation intelligence?$q$, $q$Yes, Salesloft includes conversation intelligence that surfaces insights about buyer and seller behavior from sales calls.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Does Salesloft have an integrations marketplace?$q$, $q$Yes, Salesloft has an integrations marketplace at marketplace.salesloft.com for connecting third-party tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Outbound sales cadences$q$, $q$SDRs and AEs use cadence automation to run consistent, multi-step outreach sequences.$q$, $q$Sales development reps and account executives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Deal and pipeline management$q$, $q$Sales teams track opportunities and get next-best-action guidance through Rhythm.$q$, $q$Sales reps and managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$Website visitor conversion$q$, $q$Marketing and sales teams use Chat Agents to convert website visitors into pipeline.$q$, $q$Marketing and sales teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$overview$q$, $q$What is Salesloft?$q$, 2, ARRAY[$q$Salesloft is a revenue orchestration platform that connects revenue data with AI agents to help go-to-market teams prioritize actions from first contact through renewal and expansion.$q$, $q$The platform combines cadence automation, an action recommendation engine (Rhythm), conversation intelligence, deal management, and forecasting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', $q$who-its-for$q$, $q$Who Salesloft is for$q$, 2, ARRAY[$q$Salesloft is built for sales leaders, RevOps teams, account executives, SDRs, and customer success managers, and is used by enterprise companies including IBM, Stripe, and 3M.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0f4afdee-5f6e-4f90-abf7-5fd32937393b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Outreach ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Agentic AI revenue orchestration platform for prospecting, deal management, forecasting, and coaching.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Outreach is an agentic AI revenue orchestration platform for prospecting, deal management, forecasting, coaching, and account expansion.$q$,
  og_description = $q$Outreach is an agentic AI revenue orchestration platform for prospecting, deal management, forecasting, coaching, and account expansion.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7afd1993-2c5f-430d-bd16-ce044308f9b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7afd1993-2c5f-430d-bd16-ce044308f9b1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$AI sales agents$q$, $q$AI agents work every deal and account for every rep simultaneously across the sales cycle.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Outreach Omni$q$, $q$A universal conversational agent for asking questions across accounts and opportunities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Agent Studio$q$, $q$A visual canvas for configuring intelligent workflow automation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Meeting Prep Agent$q$, $q$Generates automated briefings covering account history, recent activity, and open opportunities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Conversation intelligence$q$, $q$AI analysis of sales conversations at scale to surface coaching opportunities and performance patterns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Forecasting tools$q$, $q$AI-assisted forecast modeling that validates calls and compares outcomes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Knowledge base$q$, $q$Teams can upload case studies, white papers, and competitive battlecards for agents to reference.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Outreach MCP$q$, $q$Lets information and actions flow across a company's go-to-market tech stack.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Broad platform covering prospecting, deal management, forecasting, and coaching in one system$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Used by large, well-known enterprises including Zoom, Snowflake, ServiceNow, and Okta$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Reports helping sellers close over 2 million opportunities every month$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$AI agents and MCP support for connecting to a broader GTM stack$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Positioned toward larger revenue teams, which may be more than small sales teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Full agentic feature set likely requires onboarding and setup investment$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$What is Outreach?$q$, $q$Outreach is an agentic AI revenue orchestration platform for prospecting, managing deals, forecasting, coaching, and expanding accounts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Who uses Outreach?$q$, $q$Sales, marketing, RevOps, and customer success teams at companies including Zoom, Snowflake, ServiceNow, and Okta use Outreach.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Does Outreach publish its pricing?$q$, $q$No, Outreach does not publish pricing on its website; prospective customers must request pricing information.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$When was Outreach founded?$q$, $q$Outreach was founded in 2014.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Sales prospecting automation$q$, $q$AI agents help reps prioritize and work accounts and deals at scale.$q$, $q$Sales development and account executive teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Revenue forecasting$q$, $q$AI-assisted forecast modeling compares calls and outcomes to improve forecast accuracy.$q$, $q$RevOps and sales leadership$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$Rep coaching$q$, $q$Conversation intelligence surfaces coaching opportunities from sales calls at scale.$q$, $q$Sales managers and enablement teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$overview$q$, $q$What is Outreach?$q$, 2, ARRAY[$q$Outreach is an agentic AI revenue orchestration platform built for prospecting, managing deals, forecasting, coaching reps, and expanding accounts. It brings AI agents such as Outreach Omni and Agent Studio into the sales workflow to work deals and accounts alongside sales reps.$q$, $q$The platform includes conversation intelligence for surfacing coaching opportunities, forecasting tools for validating pipeline, and an MCP integration layer for connecting Outreach to the rest of a company's go-to-market tech stack.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', $q$who-its-for$q$, $q$Who Outreach is for$q$, 2, ARRAY[$q$Outreach is built for sales, marketing, RevOps, and customer success teams at companies that need a single platform for prospecting, deal management, forecasting, and coaching. Its customer base includes large enterprises such as Zoom, Snowflake, ServiceNow, and Okta.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7afd1993-2c5f-430d-bd16-ce044308f9b1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── QuickMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cold outreach platform for multi-channel email and LinkedIn campaigns with deliverability monitoring.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$49/month$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$QuickMail runs multi-channel cold email and LinkedIn campaigns with deliverability monitoring, inbox rotation, and CRM sync. Plans start at $49/month.$q$,
  og_description = $q$QuickMail runs multi-channel cold email and LinkedIn campaigns with deliverability monitoring, inbox rotation, and CRM sync. Plans start at $49/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bf18ee80-5dd1-4c12-9e38-a3430262d485' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Multi-channel campaigns$q$, $q$Combine email and LinkedIn connection automation in the same outreach sequence, with ICP filtering.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Deliverability monitoring$q$, $q$Includes email warming, sender rotation, and blacklist monitoring to protect sending reputation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Inbox Rotation$q$, $q$QuickMail's Inbox Rotation technology distributes sends across multiple mailboxes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Unified inbox$q$, $q$Manage email and LinkedIn replies from a single unified inbox.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Reword with AI$q$, $q$An AI feature to rewrite outreach message copy.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$CRM sync$q$, $q$Native two-way sync with HubSpot and Pipedrive, plus Zapier and API access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Campaign analytics$q$, $q$Advanced analytics and automated deliverability insights for tracking campaign performance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Combines email and LinkedIn outreach in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Built-in deliverability tools like email warming, sender rotation, and blacklist monitoring$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Native two-way sync with HubSpot and Pipedrive$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$14-day free trial with no automatic charge after it ends$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Won G2 Best Estimated ROI and High Performer badges in Spring 2024$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Entry plan caps uploaded contacts at 1,000 and emails sent at 5,000/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$API and webhook access are reserved for higher-tier Growth and Agency plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Additional workspaces on the Agency plan cost extra per workspace$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$What is QuickMail?$q$, $q$QuickMail is a cold outreach platform for running multi-channel email and LinkedIn campaigns to generate leads.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$How much does QuickMail cost?$q$, $q$QuickMail's Starter plan is $49/month, Growth is $99/month, and Agency is $299/month, each with a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Does QuickMail integrate with a CRM?$q$, $q$Yes, QuickMail has native two-way sync with HubSpot and Pipedrive, plus Zapier and API access on higher plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$When was QuickMail founded?$q$, $q$QuickMail states it has operated since 2014.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Cold email outreach$q$, $q$Run multi-channel email and LinkedIn campaigns with automated sender rotation and warming.$q$, $q$B2B sales and demand generation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Lead generation for agencies$q$, $q$Manage multiple client workspaces and outreach campaigns from one account.$q$, $q$Lead generation agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Starter$q$, $q$$49/mo$q$, $q$monthly$q$, $q$["Unlimited email senders","Unlimited LinkedIn account","1 workspace","1,000 uploaded contacts","5,000 emails sent/mo","Free AutoWarmer","Zapier integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Growth$q$, $q$$99/mo$q$, $q$monthly$q$, $q$["Unlimited email senders","Unlimited LinkedIn accounts","1 workspace","25,000 uploaded contacts","100,000 emails sent/mo","API access","Priority expert support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$Agency$q$, $q$$299/mo$q$, $q$monthly$q$, $q$["Unlimited email and LinkedIn senders","2 workspaces (+$49/extra)","100,000 uploaded contacts","500,000 emails sent/mo","API and webhook access","Priority expert support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$overview$q$, $q$What is QuickMail?$q$, 2, ARRAY[$q$QuickMail is a cold outreach platform that lets sales and growth teams run multi-channel campaigns combining email and LinkedIn. It includes deliverability tools like email warming, sender rotation, and blacklist monitoring, along with an Inbox Rotation feature and a unified inbox for replies.$q$, $q$The platform syncs natively with HubSpot and Pipedrive and offers Zapier, webhook, and API access on higher-tier plans for connecting outreach data to other tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', $q$who-its-for$q$, $q$Who QuickMail is for$q$, 2, ARRAY[$q$QuickMail is aimed at B2B sales teams, demand generation professionals, and lead generation agencies that need to scale outbound email and LinkedIn outreach while protecting sender deliverability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bf18ee80-5dd1-4c12-9e38-a3430262d485', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── PersistIQ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sales engagement platform for small teams to prospect, automate outreach, and sync with a CRM.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PersistIQ is a sales engagement platform for small teams, combining LinkedIn prospecting, automated email campaigns, and CRM sync.$q$,
  og_description = $q$PersistIQ is a sales engagement platform for small teams, combining LinkedIn prospecting, automated email campaigns, and CRM sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Chrome extension prospecting$q$, $q$Build prospect lists from LinkedIn and LinkedIn Sales Navigator, with email finding and automatic campaign addition.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Automated campaigns$q$, $q$Automate personalized emails, calls, and tasks to accelerate the sales pipeline, with A/B testing of messages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$CRM sync$q$, $q$Native bi-directional sync integrations with Salesforce and Copper for contact records and activities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Sales Email AI$q$, $q$An AI tool for generating sales email content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Performance reporting$q$, $q$Tracks tasks completed, replies, reply sentiment, and meetings booked.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Chrome extension pulls prospects directly from LinkedIn and Sales Navigator$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Native bi-directional CRM sync with Salesforce and Copper$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$A/B testing built into campaign messaging$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$14-day free trial available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Public pricing details are not published on the marketing site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$CRM sync is limited to Salesforce and Copper, not other major CRMs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Positioned specifically for small teams, which may limit fit for larger sales orgs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$What is PersistIQ?$q$, $q$PersistIQ is a sales engagement platform for small teams to find prospects, automate outreach, and sync activity with a CRM.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Does PersistIQ have a free trial?$q$, $q$Yes, PersistIQ offers a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Which CRMs does PersistIQ integrate with?$q$, $q$PersistIQ offers native bi-directional sync with Salesforce and Copper.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Is PersistIQ part of a larger company?$q$, $q$PersistIQ operates as a subsidiary of Wishpond.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$LinkedIn prospecting$q$, $q$Build prospect lists from LinkedIn and Sales Navigator using the Chrome extension and add them directly to campaigns.$q$, $q$Sales development representatives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$Multi-touch outreach automation$q$, $q$Automate sequences of personalized emails, calls, and tasks with A/B tested messaging.$q$, $q$Account executives and sales managers on small teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$overview$q$, $q$What is PersistIQ?$q$, 2, ARRAY[$q$PersistIQ is a sales engagement platform built for small sales teams. It combines a Chrome extension for finding prospects on LinkedIn with automated multi-channel campaigns that mix personalized emails, calls, and tasks.$q$, $q$The platform syncs bi-directionally with Salesforce and Copper and includes reporting on tasks completed, replies, reply sentiment, and meetings booked, plus an AI tool for drafting sales emails.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', $q$who-its-for$q$, $q$Who PersistIQ is for$q$, 2, ARRAY[$q$PersistIQ markets itself to account executives, sales managers, and SDRs on small, growing sales teams who need to prospect on LinkedIn and automate outreach without a heavyweight platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4891f9c-1a2c-4ad0-96e4-9cd56abe94d2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── ContactOut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Contact intelligence tool that finds verified emails and phone numbers for 350 million professionals.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ContactOut finds verified emails and phone numbers for 350 million professionals via a Chrome extension, search portal, and API.$q$,
  og_description = $q$ContactOut finds verified emails and phone numbers for 350 million professionals via a Chrome extension, search portal, and API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8a027b3c-fcee-43e5-9956-4c92e51917fc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8a027b3c-fcee-43e5-9956-4c92e51917fc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Professional contact search$q$, $q$Search a database of 350 million professionals across 40 million companies for verified email addresses and phone numbers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Chrome extension$q$, $q$Finds email and phone numbers for professional profiles directly while browsing, including on LinkedIn.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$AI Personalizer$q$, $q$Generates personalized outreach emails, which ContactOut says can increase response rates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Email campaigns$q$, $q$Multi-stage outreach campaigns with personalization built on top of found contact data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Data enrichment$q$, $q$Over 20 searchable data points including job titles, revenue, skills, locations, company size, and technologies used.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$API access$q$, $q$Programmatic access to ContactOut's email, phone, and company records.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Cloud phone dialer$q$, $q$A built-in dialer for calling found phone numbers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Free tier gives 5 free credits daily with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Large claimed database of 350 million professionals and 40 million companies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$SOC 2 certified and states CCPA and GDPR compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Chrome extension has a 4.4-star rating on the Chrome Web Store$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$4.6-star rating on G2$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Full pricing tiers are not clearly broken out on the public pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Contact data accuracy for any individual record can vary despite stated verification claims$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Advanced features like team management and dedicated account managers are limited to higher tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$What is ContactOut?$q$, $q$ContactOut is a contact intelligence tool that finds verified email addresses and phone numbers for professionals.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Does ContactOut have a free plan?$q$, $q$Yes, ContactOut offers 5 free credits daily with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$How does ContactOut find contact data?$q$, $q$ContactOut searches a database it states covers 350 million professionals across 40 million companies, accessible via a Chrome extension, web search portal, and API.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Is ContactOut compliant with data privacy regulations?$q$, $q$ContactOut states it is CCPA and GDPR compliant and SOC 2 certified.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Recruiting sourcing$q$, $q$Find verified contact details for candidates sourced from LinkedIn and other professional profiles.$q$, $q$Recruiters and talent sourcers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Sales prospecting$q$, $q$Build prospect lists with verified emails and phone numbers, then run personalized outreach campaigns.$q$, $q$Sales representatives and SDR teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$Free$q$, $q$$0$q$, NULL, $q$["5 free credits daily","No credit card required"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$overview$q$, $q$What is ContactOut?$q$, 2, ARRAY[$q$ContactOut is a contact intelligence platform that helps recruiters and sales professionals find and verify email addresses and phone numbers. It states its database covers 350 million professionals across 40 million companies, accessible through a Chrome extension, a web search portal, and an API.$q$, $q$The platform also includes an AI Personalizer for drafting outreach emails, multi-stage email campaigns, and a cloud phone dialer for calling found numbers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', $q$who-its-for$q$, $q$Who ContactOut is for$q$, 2, ARRAY[$q$ContactOut is built for recruiters and sales representatives who need to find verified contact details for people they discover on LinkedIn and elsewhere, then reach out directly by email or phone.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a027b3c-fcee-43e5-9956-4c92e51917fc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Dropcontact ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GDPR-compliant B2B email finder and data enrichment tool that cleans and deduplicates CRM contacts.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€79/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Dropcontact finds and verifies GDPR-compliant B2B emails, enriches contact records, and cleans duplicates. Plans start at €79/month.$q$,
  og_description = $q$Dropcontact finds and verifies GDPR-compliant B2B emails, enriches contact records, and cleans duplicates. Plans start at €79/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bb14a945-8442-4aa1-a8a7-f9b5b4d49f38' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Email finder$q$, $q$Finds a GDPR-compliant, verified nominative email address from a website domain, first name, and last name.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Data enrichment$q$, $q$Adds LinkedIn profile URLs, company websites, company size, industry, and French SIREN codes to contact records.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Email verification$q$, $q$Validates B2B emails, including catch-all domain verification, with a stated 98% valid rate.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Duplicate detection$q$, $q$Automatically identifies and merges duplicate contact records.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Company change detection$q$, $q$Detects when a contact changes companies and updates the record automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Data cleaning$q$, $q$Corrects name order, fixes spelling, and removes harmful characters from contact data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$CRM integrations$q$, $q$Native integrations with Pipedrive and HubSpot, plus 1,200+ tools via Zapier, Make, and n8n.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$States 100% GDPR compliance using proprietary algorithms rather than personal data resale$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Native integrations with Pipedrive and HubSpot, plus broad no-code connector support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Free trial with 50 emails to test before paying$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Yearly billing offers a 20% discount$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$G2 Winter Medal, Easy to Use Medal, and High Performer EMEA recognition$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Salesforce and Zoho integrations are listed as coming, not yet native$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Growth-plan features like LinkedIn enrichment are not included on the Starter plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Enterprise pricing requires a minimum of 200,000 credits per month$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$What is Dropcontact?$q$, $q$Dropcontact is a B2B contact data enrichment and cleaning tool that finds and verifies emails, deduplicates records, and updates contact information.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$How much does Dropcontact cost?$q$, $q$Dropcontact's Starter plan is €79/month and its Growth plan is €120/month, both for 500 credits/month, with a 20% discount for yearly billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Is Dropcontact GDPR compliant?$q$, $q$Dropcontact states it is 100% GDPR compliant, using proprietary algorithms instead of personal databases that require consent.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Does Dropcontact have a free trial?$q$, $q$Yes, Dropcontact offers 50 free emails to try before subscribing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$CRM data cleaning$q$, $q$Automatically detect and merge duplicate contacts and correct malformed contact data in a CRM.$q$, $q$Sales operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$B2B email finding$q$, $q$Find and verify professional email addresses from a name and company website for outbound campaigns.$q$, $q$Sales and marketing teams doing lead generation$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Starter$q$, $q$€79/month$q$, $q$monthly$q$, $q$["500 credits/month","B2B email enrichment","Native email validation","Catch-all verification","API and MCP access","Google Sheets add-on"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Growth$q$, $q$€120/month$q$, $q$monthly$q$, $q$["500 credits/month, credits carry over","LinkedIn URL enrichment","AI-powered job classification","Company change detection","Company data enrichment"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$Enterprise$q$, $q$Custom, from 200,000 credits/month$q$, NULL, $q$["Custom volume-based pricing","Priority enrichment","Real-time enrichment notifications","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$overview$q$, $q$What is Dropcontact?$q$, 2, ARRAY[$q$Dropcontact is a B2B contact data enrichment and cleaning platform. From a website domain, first name, and last name, it finds and verifies a nominative email address, then enriches the record with details like LinkedIn profile, company size, industry, and French SIREN codes.$q$, $q$The platform also cleans existing CRM data by correcting name formatting, removing duplicate records, and detecting when a contact changes companies. It integrates natively with Pipedrive and HubSpot, and connects to over 1,200 other tools via Zapier, Make, and n8n.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', $q$who-its-for$q$, $q$Who Dropcontact is for$q$, 2, ARRAY[$q$Dropcontact is aimed at sales and marketing teams that need GDPR-compliant B2B contact data and want to keep CRM records clean and deduplicated, particularly teams operating in or selling into Europe.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bb14a945-8442-4aa1-a8a7-f9b5b4d49f38', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── FullEnrich ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Waterfall contact enrichment tool that aggregates 20+ data sources to find verified emails and phone numbers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€55/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$FullEnrich waterfalls 20+ data providers to find and verify B2B emails and phone numbers, with a free 50-lead trial and plans from €55/month.$q$,
  og_description = $q$FullEnrich waterfalls 20+ data providers to find and verify B2B emails and phone numbers, with a free 50-lead trial and plans from €55/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd4f6d848-146d-4c0c-baaf-da4e04d92eb6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Waterfall enrichment$q$, $q$Aggregates data from 20+ premium providers including Clearbit, Hunter, Wiza, Snov, ContactOut, Anymail Finder, and Crunchbase to maximize find rates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Phone validation$q$, $q$Advanced phone validation compares number ownership with lead names for US and Canada contacts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Catch-all email verification$q$, $q$Verifies catch-all domain emails, claimed at up to 80% accuracy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$CRM sync$q$, $q$Syncs enrichment data with HubSpot and Salesforce.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$AI agent integrations$q$, $q$Connects to Claude via MCP and to OpenAI-based workflows, as well as Zapier, Make, n8n, and Clay.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$API access$q$, $q$Programmatic access to waterfall enrichment for building custom workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Free trial with 50 leads and no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Aggregates multiple third-party data providers in a single waterfall rather than relying on one source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Claims a bounce rate under 1% on delivered emails$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$MCP support for connecting directly to Claude$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$4.8/5 rating on G2$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Find rates vary meaningfully by region (77% in US/Canada versus 71-84% elsewhere)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Enterprise-level volume and custom features require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Relies on third-party data vendors, so results depend on those providers' underlying coverage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$What is FullEnrich?$q$, $q$FullEnrich is a B2B contact enrichment platform that waterfalls over 20 data providers to find and verify email addresses and phone numbers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$How much does FullEnrich cost?$q$, $q$FullEnrich's Pro plan is €55/month for 1,000 credits, with a free trial of 50 credits and no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Does FullEnrich integrate with AI agents?$q$, $q$Yes, FullEnrich supports Claude via MCP and OpenAI-based workflows, in addition to Zapier, Make, n8n, and Clay.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Is FullEnrich compliant with data regulations?$q$, $q$FullEnrich states it is SOC 2 Type II certified and GDPR and CCPA compliant.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Outbound list building$q$, $q$Enrich lists of prospects matching an ideal customer profile with verified work emails and mobile numbers.$q$, $q$B2B sales and outbound teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$AI agent-driven enrichment$q$, $q$Call FullEnrich's waterfall enrichment directly from Claude or other AI agents via MCP.$q$, $q$Revenue operations teams building AI workflows$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Free Trial$q$, $q$$0$q$, NULL, $q$["50 credits to start","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Pro$q$, $q$€55/month$q$, $q$monthly$q$, $q$["1,000 credits/month","Waterfall enrichment across 20+ sources","Work, mobile, and personal email enrichment","Reverse email lookup","CRM integrations","API and MCP Server access","Unlimited users"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$Scale/Enterprise$q$, $q$Custom$q$, NULL, $q$["Negotiable credit volume","Priority support","Dedicated account manager","Custom SSO and security","Reseller agreements"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$overview$q$, $q$What is FullEnrich?$q$, 2, ARRAY[$q$FullEnrich is a B2B contact enrichment platform that runs a waterfall across more than 20 premium data providers, including Clearbit, Hunter, Wiza, Snov, ContactOut, Anymail Finder, and Crunchbase, to find and verify work emails, mobile numbers, and personal emails.$q$, $q$It includes phone validation that compares number ownership against lead names, catch-all email verification, and API and MCP access for connecting enrichment directly into CRMs or AI agent workflows.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', $q$who-its-for$q$, $q$Who FullEnrich is for$q$, 2, ARRAY[$q$FullEnrich serves B2B sales and outbound teams, from solo operators to enterprise sales organizations, who need higher find rates on contact data than a single enrichment provider typically delivers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d4f6d848-146d-4c0c-baaf-da4e04d92eb6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Commsor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Go-to-network platform that surfaces warm introduction paths and network signals for B2B sales teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Commsor is a go-to-network platform that surfaces warm intro paths, automates B2B referrals, and monitors network signals for sales teams.$q$,
  og_description = $q$Commsor is a go-to-network platform that surfaces warm intro paths, automates B2B referrals, and monitors network signals for sales teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f22ba73c-1e88-4f7f-a98a-953343da5e1d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f22ba73c-1e88-4f7f-a98a-953343da5e1d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Warm path discovery$q$, $q$Surfaces connections within investors, advisors, partners, or customers who can provide access to target accounts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Referral automation$q$, $q$Builds scalable B2B referral programs with deal registration, intro boards, and tracked payouts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Network signal monitoring$q$, $q$Monitors intent signals like fundraising, hiring, and posts, and shows relevant network connections tied to those events.$q$, 2);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Focuses specifically on network-sourced pipeline rather than cold outreach$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Reports 2-3x higher close rates on network-sourced deals versus other pipeline$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Reports 35-50% shorter sales cycles when a warm introduction is involved$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$No public pricing page; a demo request is required to learn pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$No details published on integrations, founding year, or headquarters$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Product has repositioned around network-based sales referrals rather than community management$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$What is Commsor?$q$, $q$Commsor is a go-to-network platform that helps B2B sales teams find warm introduction paths and automate referral programs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$How does Commsor pricing work?$q$, $q$Commsor does not publish pricing; prospective customers must book a demo to get pricing information.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$What results does Commsor claim?$q$, $q$Commsor reports 2-3x higher close rates and 35-50% shorter sales cycles on deals sourced through warm network introductions.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Warm introduction sourcing$q$, $q$Identify which investors, advisors, partners, or customers can provide a warm path into a target account.$q$, $q$B2B sales and go-to-market teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$Referral program management$q$, $q$Run a structured referral program with deal registration and tracked payouts.$q$, $q$Revenue and partnerships teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$overview$q$, $q$What is Commsor?$q$, 2, ARRAY[$q$Commsor is a go-to-network platform that helps B2B sales teams use their existing relationships to generate warm introductions into target accounts. It surfaces which investors, advisors, partners, or customers have a connection to a prospect, and automates referral programs with deal registration and tracked payouts.$q$, $q$The platform also monitors network-related intent signals, such as a contact's company fundraising or hiring, and surfaces the relevant network connection when those signals occur.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', $q$who-its-for$q$, $q$Who Commsor is for$q$, 2, ARRAY[$q$Commsor is built for B2B sales and go-to-market teams that want to reduce reliance on cold outreach by routing pipeline through warm, network-sourced introductions instead.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f22ba73c-1e88-4f7f-a98a-953343da5e1d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bettermode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bettermode is an all-in-one branded customer community platform for engagement, support, and knowledge sharing.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$399/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bettermode is a customer community platform with Ask AI search and drag-and-drop customization, starting at $399/month with a 14-day free trial.$q$,
  og_description = $q$Bettermode is a customer community platform with Ask AI search and drag-and-drop customization, starting at $399/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Drag-and-drop customization$q$, $q$Build and customize branded community spaces without developers using drag-and-drop tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Ask AI search$q$, $q$AI-powered federated search helps members find answers across community content (Growth plan and above).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Granular user roles and permissions$q$, $q$Control member access and moderation with configurable roles and permission levels.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Multiple content spaces$q$, $q$Includes Q&A, Discussion, Events, Polls, Wishlist, Changelog, Roadmap, Knowledge base, Academy, and Help center sections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Enterprise integrations$q$, $q$Connects with Salesforce, HubSpot, Intercom, Segment, Notion, and Slack.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$API and webhooks$q$, $q$Custom workflows via API, webhooks, and a sandbox environment (Growth plan and above).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$SOC 2 Type II compliance$q$, $q$Security features including audit logs, SAML, and SOC II compliance on the Premium plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$No-code drag-and-drop customization for branded communities$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Ask AI-powered search included from the Growth tier up$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Pre-built integrations with Salesforce, HubSpot, Intercom, Segment, Notion, and Slack$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$SOC 2 Type II compliance and audit logs available on Premium$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Used by notable companies including IBM, HubSpot, Lenovo, and Webflow$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Starting price of $399/month is high relative to many community platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$No permanent free plan, only a 14-day free trial$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Ask AI, API/webhooks, and branding removal require the Growth plan or higher$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Premium tier pricing is custom/quote-only, requiring a sales conversation$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Does Bettermode offer a free trial?$q$, $q$Yes, both the Starter and Growth plans include a 14-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$How much does Bettermode cost?$q$, $q$The Starter plan starts at $399/month, the Growth plan starts at $1,500/month, and Premium is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Does Bettermode require developers to set up?$q$, $q$No, Bettermode is marketed as requiring no developers, with drag-and-drop customization tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$What integrations does Bettermode support?$q$, $q$Bettermode integrates with Salesforce, HubSpot, Intercom, Segment, Notion, and Slack, plus API and webhook support for custom workflows.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Is Bettermode SOC 2 compliant?$q$, $q$Yes, Bettermode states it is SOC 2 Type II compliant and supports GDPR.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Branded SaaS customer communities$q$, $q$Launch a branded community for product discussions, support, and engagement.$q$, $q$SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Product feedback and roadmap$q$, $q$Collect feedback and share roadmaps and changelogs with customers via dedicated spaces.$q$, $q$Product and customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Self-service knowledge base and help center$q$, $q$Organize help center and academy content alongside community discussions.$q$, $q$Support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Starter$q$, $q$$399/month$q$, $q$monthly$q$, $q$["Up to 10,000 members","5 collaborators","Core apps (Q&A, Discussion, Events, Polls)","Private messaging and chat","Basic analytics","Custom domain","Chat and email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Growth$q$, $q$$1,500/month$q$, $q$monthly$q$, $q$["Up to 25,000 members","10 collaborators","Ask AI and federated search","API, webhooks, sandbox environment","Onboarding support","Remove Bettermode branding"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$Premium$q$, $q$Custom pricing$q$, NULL, $q$["Up to 100,000 members","20 collaborators","Audit logs, SOC II compliance, SAML","Customer success manager","99.9% uptime SLA","Custom billing and security review"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$overview$q$, $q$What is Bettermode?$q$, 2, ARRAY[$q$Bettermode is a branded customer community platform built for engagement, support, and growth. It lets companies host discussions, Q&A, events, polls, a knowledge base, and a product roadmap in one customizable space.$q$, $q$The platform emphasizes no-code, drag-and-drop customization so teams can launch and brand a community without developer involvement, and includes Ask AI-powered search on its higher tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', $q$who-its-for$q$, $q$Who Bettermode is for$q$, 2, ARRAY[$q$Bettermode is aimed at SaaS and B2B companies that want a branded community for customer support, engagement, and feedback, with enterprise features like SOC 2 Type II compliance and SAML on its Premium plan for larger organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64b1d1ff-2ba3-4f6d-b072-c5d804fa6ab3', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Circle ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Circle is an all-in-one platform for building branded communities, online courses, and events with native mobile apps.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$89/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Circle combines communities, courses, and events with AI tools and native iOS/Android apps, starting at $89/month with a 14-day free trial.$q$,
  og_description = $q$Circle combines communities, courses, and events with AI tools and native iOS/Android apps, starting at $89/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '80b9c68e-3f2c-4b1d-93e5-905ec8474aef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '80b9c68e-3f2c-4b1d-93e5-905ec8474aef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Community discussions and feed$q$, $q$Discussion forums with posts, comments, rich media, a personalized feed, messaging, and a searchable member directory.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Courses and events$q$, $q$Host courses and live events, including live streaming and live rooms, alongside community spaces.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Native iOS and Android apps$q$, $q$Branded mobile apps with push notifications on iOS and Android.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Circle AI and AI agents$q$, $q$AI-powered features including a content co-pilot and, on the Circle Plus plan, AI agents and AI workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Website builder$q$, $q$Drag-and-drop website and landing page builder for the community.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Payments and memberships$q$, $q$Branded checkout for one-time purchases, memberships, and subscriptions, with tiered transaction fees.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Workflows and automation$q$, $q$Automated workflows and custom profile fields available on the Business plan and above.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$APIs and headless access$q$, $q$Headless Member API, Admin API, and Circle MCP available on Business and higher plans.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Combines community, courses, events, and payments in one product$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Native branded iOS and Android apps rather than web wrappers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$14-day free trial with no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$30-day, 100% money-back guarantee for paying customers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Used by high-profile creators such as Tim Ferriss and Mel Robbins$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$No permanent free plan; entry price starts at $89/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$API access, workflows, and branding removal require the Business plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$AI Agents and custom SSO are reserved for the top Circle Plus tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Circle Plus pricing is custom/quote-only$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Does Circle offer a free trial?$q$, $q$Yes, all plans include a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$How much does Circle cost?$q$, $q$The Professional plan starts at $89/month, Business is $199/month, and Circle Plus is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Does Circle have native mobile apps?$q$, $q$Yes, Circle offers branded iOS and Android mobile apps with push notifications.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Does Circle refund payments?$q$, $q$Circle offers a 30-day, 100% money-back guarantee for paying customers.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Can I remove Circle branding?$q$, $q$Yes, Circle branding removal is included starting with the Business plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Creator communities$q$, $q$Host a branded community with discussions, events, and paid memberships for an audience.$q$, $q$Content creators and coaches$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Course-based membership businesses$q$, $q$Sell and deliver courses alongside community discussion and live events.$q$, $q$Online educators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Business communities with automation$q$, $q$Use workflows, custom profile fields, and headless APIs to run more complex community operations.$q$, $q$Growing businesses and SaaS companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Professional$q$, $q$$89/month$q$, $q$monthly$q$, $q$["Circle AI","Unlimited members","Courses, discussions, events","Website builder","Live streams and live rooms","Custom branding","Reporting & analytics","Searchable member directory","Paid memberships","Gamification","Custom domain","Payment migration services"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Business$q$, $q$$199/month$q$, $q$monthly$q$, $q$["Everything in Professional","Workflows","Custom profile fields","Circle MCP","Headless Member API","Admin API","Branded email notifications","Content co-pilot","Automated transcriptions","Activity scores","Circle branding removal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$Circle Plus$q$, $q$Custom pricing$q$, NULL, $q$["Everything in Business","AI Agents & AI workflows","Custom SSO","10k Email Hub contacts","0.5% transaction fees","Sandbox community","Priority support","Concierge onboarding","Dedicated Customer Success Manager","Optional branded mobile apps"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$overview$q$, $q$What is Circle?$q$, 2, ARRAY[$q$Circle is an all-in-one platform for building a branded community that combines discussions, courses, live events, a website builder, and payment processing.$q$, $q$It offers native branded iOS and Android mobile apps, AI-assisted tools such as a content co-pilot, and, on its top plan, AI agents and workflows for automating community operations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', $q$who-its-for$q$, $q$Who Circle is for$q$, 2, ARRAY[$q$Circle is positioned for creators, coaches, and businesses that want to run community, course, and event experiences under their own brand, with plans that scale from a $89/month Professional tier up to custom enterprise pricing with dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80b9c68e-3f2c-4b1d-93e5-905ec8474aef', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Mighty Networks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mighty Networks is a community platform for courses, events, and memberships with native iOS and Android apps and an AI Cohost.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$79/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Español$q$, $q$Deutsch$q$, $q$Français$q$, $q$Italiano$q$, $q$Nederlands$q$, $q$Português$q$]::text[],
  seo_meta_description = $q$Mighty Networks hosts communities, courses, and events with native mobile apps and an AI Cohost, starting at $79/month with a 14-day free trial.$q$,
  og_description = $q$Mighty Networks hosts communities, courses, and events with native mobile apps and an AI Cohost, starting at $79/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ab6e1565-807c-46d0-90ce-52da6ac62e1c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ab6e1565-807c-46d0-90ce-52da6ac62e1c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Native iOS and Android apps$q$, $q$Real native mobile apps described by Mighty Networks as "not web wrappers," placed on members' home screens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$AI Cohost$q$, $q$AI assistance tuned to a community's goals to help run and grow the community.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Community Design framework$q$, $q$A proprietary planning framework covering ideal member definition, monthly themes, weekly events, and daily questions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Courses and events$q$, $q$Integrated course delivery, challenges, mini-courses, workshops, and live streaming events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Gamification$q$, $q$Badges, tags, and gamification tools to drive member engagement.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Payment processing$q$, $q$Built-in payment processing for memberships, with transaction fees that decrease at higher plan tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Automations$q$, $q$Basic automations on the Launch plan, with intermediate automations and API/MCP access on Scale.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$True native iOS and Android apps rather than web wrappers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$AI Cohost tuned to community goals included$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Interface available in seven languages including English, Spanish, German, and French$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$14-day free trial with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Unlimited members and spaces included even on the entry-level Launch plan$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$No permanent free plan, only a 14-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$API/MCP access requires the Scale plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Transaction fees apply on payments (2% on Launch, down to 0.5% on Mighty Pro)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Scale plan's annual pricing is not published on the pricing page$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Founding year, headquarters, and company size are not published on the site$q$, 4);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Does Mighty Networks offer a free trial?$q$, $q$Yes, a 14-day free trial is available with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$How much does Mighty Networks cost?$q$, $q$The Launch plan starts at $79/month ($950/year billed annually), the Scale plan is $179/month, and Mighty Pro is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Does Mighty Networks have native mobile apps?$q$, $q$Yes, it offers native iOS and Android apps rather than web-wrapper apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$What languages does Mighty Networks support?$q$, $q$The platform lists support for English, Español, Deutsch, Français, Italiano, Nederlands, and Português.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Does Mighty Networks charge transaction fees?$q$, $q$Yes, transaction fees range from 2% on the Launch plan down to 0.5% on Mighty Pro.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Course creator communities$q$, $q$Sell and deliver courses combined with community engagement and events.$q$, $q$Course creators and educators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Coaching and personal development communities$q$, $q$Run structured member programs using the Community Design framework, challenges, and weekly events.$q$, $q$Coaches and personal development professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Membership businesses at scale$q$, $q$Use API/MCP access and automations to manage larger paid membership communities.$q$, $q$Growing membership businesses$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Launch$q$, $q$$79/month (or $950/year)$q$, $q$monthly$q$, $q$["Courses, Events, Badges & Tags, Gamification","Basic Automations","Unlimited members/spaces","3 Hosts, 10 Moderators","200GB storage","20 streaming hours/month (100 viewers)","2 custom landing pages","2% transaction fees"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Scale$q$, $q$$179/month$q$, $q$monthly$q$, $q$["Everything in Launch","Automated Polls","Kit Integration","Charge for Events","Intermediate Automations","API/MCP Access","5 Hosts, 15 Moderators","500GB storage","30 streaming hours/month (200 viewers)","1% transaction fees"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$Mighty Pro$q$, $q$Custom pricing$q$, NULL, $q$["Everything in Scale","Member Video Upload","Enhanced Gamification","Advanced Automations","Migration and Launch Support","Custom Branded Apps","Dedicated Strategy Team","Unlimited hosts/moderators","4TB storage","0.5% transaction fees"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$overview$q$, $q$What is Mighty Networks?$q$, 2, ARRAY[$q$Mighty Networks is a community platform for hosting communities, courses, events, and paid memberships, built around its own "Community Design" planning framework.$q$, $q$It provides native iOS and Android apps, an AI Cohost for community management, and multilingual support across seven languages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', $q$who-its-for$q$, $q$Who Mighty Networks is for$q$, 2, ARRAY[$q$Mighty Networks targets course creators, coaches, and personal development businesses building paid membership communities, with plans ranging from a $79/month Launch tier to a custom Mighty Pro tier with branded apps and dedicated strategy support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab6e1565-807c-46d0-90ce-52da6ac62e1c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Discourse ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Discourse is an open-source community and discussion platform powering more than 22,000 communities, free to self-host or paid from $100/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$100/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Discourse is an open-source community platform, free to self-host, with a limited free hosted plan and paid plans starting at $100/month.$q$,
  og_description = $q$Discourse is an open-source community platform, free to self-host, with a limited free hosted plan and paid plans starting at $100/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6b5b1e4-ac40-42b0-bab2-d22554c5ce08';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6b5b1e4-ac40-42b0-bab2-d22554c5ce08' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Discussion topics and real-time chat$q$, $q$Threaded discussion topics alongside real-time chat and private messaging.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$AI-assisted moderation$q$, $q$AI-assisted community management features, plus a separate Discourse AI product with AI daily credits included on paid plans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Theme and plugin customization$q$, $q$Custom themes and a plugin ecosystem, with 15+ plugins on Pro and 50+ on Enterprise.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$SSO and social logins$q$, $q$Single sign-on, social logins, and SAML support (Business and Enterprise).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Searchable knowledge base$q$, $q$Searchable public knowledge base and gamification features for community engagement.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$GitHub integration$q$, $q$Connects with GitHub to mirror releases, issues, and pull requests.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Open-source, self-hostable codebase$q$, $q$The entire Discourse codebase is freely available on GitHub for self-hosting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$API and webhooks$q$, $q$API and webhook access included from the Pro plan and up.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Fully open source with a free self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$States it has never sold user data and never will$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Free hosted plan available to explore core functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Extensive plugin ecosystem (15+ on Pro, 50+ on Enterprise)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Used by major organizations including Asana, OpenAI, Zoom, and GitLab$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Free hosted plan is limited (2 staff seats, 10 categories, 5GB storage)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Self-hosting requires technical setup and server management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Enterprise plan pricing is custom/quote-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$No published details on founding year, headquarters, or company size$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Is Discourse free?$q$, $q$Discourse is open source and free to self-host, and also offers a free hosted plan with limits (2 staff seats, 10 categories, 5GB storage).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$How much does hosted Discourse cost?$q$, $q$Paid hosted plans start at Pro for $100/month, Business for $500/month, with Enterprise at custom pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Does Discourse offer a free trial?$q$, $q$Yes, Pro and Business plans offer a free trial with no credit card required up front.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Does Discourse have a mobile app?$q$, $q$Yes, the Discourse Hub mobile app is available on iOS and Android.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Does Discourse sell user data?$q$, $q$No, Discourse states it has never sold user data and never will.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Developer and open-source communities$q$, $q$Host technical discussion forums with GitHub integration for releases, issues, and pull requests.$q$, $q$Developer and open-source projects$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Product feedback and support hubs$q$, $q$Run support and feedback forums with searchable knowledge base content.$q$, $q$Product and support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Team knowledge bases$q$, $q$Use categories, tags, and search to organize internal or public team knowledge.$q$, $q$Internal teams and organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Free (Hosted)$q$, $q$$0$q$, NULL, $q$["2 staff seats","10 categories","5GB storage","Limited functionality for exploring the platform"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Pro$q$, $q$$100/month$q$, $q$monthly$q$, $q$["Unlimited members & chat","Unlimited categories/tags","Custom groups","Email support","Custom themes","Custom domain","API/Webhook access","15+ plugins","5 staff seats","500k monthly page views","20GB storage","100k AI daily credits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Business$q$, $q$$500/month$q$, $q$monthly$q$, $q$["Everything in Pro","Advanced reporting & analytics","Automation","Events","Gamification","SSO","20+ additional plugins","15 staff seats","Priority support","Migration services","100GB storage","1M AI daily credits"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$Enterprise$q$, $q$Custom pricing$q$, NULL, $q$["Everything in Business","Expert design & development","99.9% uptime guarantee","GDPR/CCPA compliance","50+ plugins","Unlimited staff seats","1M+ monthly page views","200GB+ storage","5M AI daily credits"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$overview$q$, $q$What is Discourse?$q$, 2, ARRAY[$q$Discourse is a customizable, scalable community platform powering more than 22,000 communities. Its full codebase is open source and available on GitHub, and it can be self-hosted for free or run on Discourse's managed hosting.$q$, $q$The platform offers discussion topics, real-time chat, AI-assisted moderation features, a searchable knowledge base, and an extensive theme and plugin ecosystem, with paid hosted plans starting at $100/month for Pro.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', $q$who-its-for$q$, $q$Who Discourse is for$q$, 2, ARRAY[$q$Discourse is used by developer and open-source communities, product support and feedback teams, and organizations such as Asana, OpenAI, Zoom, and GitLab that need a self-hostable, data-owning discussion platform with a free entry point.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b5b1e4-ac40-42b0-bab2-d22554c5ce08', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Hivebrite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hivebrite is a community engagement platform for building branded member communities with events, forums, and AI-powered matching.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$895/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hivebrite is an online community platform with AI matching, events, forums, and mobile apps for associations, alumni networks, and nonprofits.$q$,
  og_description = $q$Hivebrite is an online community platform with AI matching, events, forums, and mobile apps for associations, alumni networks, and nonprofits.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '08901206-af95-4614-be7a-942eac7c6ae2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '08901206-af95-4614-be7a-942eac7c6ae2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$AI-Powered Matching$q$, $q$Uses AI to spark 1:1 connections between community members at scale, alongside AI-driven content and people recommendations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$No-Code Page Builder$q$, $q$A drag-and-drop builder lets organizations design and brand their community pages without coding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Member Directory$q$, $q$Advanced search and filtering tools help members find and connect with each other.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Events$q$, $q$Hosts virtual and in-person events with RSVP and check-in functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Forums$q$, $q$Provides discussion spaces for peer learning and community conversation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Multi-language & Live Translation$q$, $q$Supports multiple languages with live translation to help communities reach a global audience.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Native Mobile Apps$q$, $q$Branded native iOS and Android apps extend community engagement to mobile devices.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Community Analytics$q$, $q$Provides performance metrics and engagement insights through a back-office analytics dashboard.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Native iOS and Android mobile apps available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$AI-powered matching and content/people recommendations for members$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$No-code drag-and-drop page builder for branding the community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Multi-language support with live translation for global communities$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$ISO 27001 certified and compliant with GDPR, CCPA, PCI-DSS, and TX-RAMP$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Used by over 2,000 organizations worldwide$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$No free trial or free plan is advertised; the site directs prospects to request a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Entry-level Core plan starts at $895/month billed annually, a high entry cost for small organizations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Higher-tier Prime and Custom Fit plans require a custom quote, so full pricing isn't transparent$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Mobile app, multi-language support, connectors, and mentoring modules are sold as optional add-ons rather than included in base plans$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Does Hivebrite offer a free trial or free plan?$q$, $q$No free trial or free plan is mentioned on Hivebrite's pricing page; prospective customers are directed to request a demo or talk to sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$How much does Hivebrite cost?$q$, $q$Pricing starts at $895/month (billed annually) for the Core plan. The Flex plan starts at $1,995/month, while Prime and Custom Fit plans require a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Does Hivebrite have a mobile app?$q$, $q$Yes, Hivebrite offers native iOS and Android mobile apps, listed as part of its Build and Launch feature sets (and as an add-on depending on plan).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Does Hivebrite support multiple languages?$q$, $q$Yes, Hivebrite offers multi-language support with live translation as a feature, available as an add-on according to the pricing page.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Is Hivebrite secure and compliant?$q$, $q$Hivebrite states it is ISO 27001 certified and compliant with GDPR, CCPA, PCI-DSS, and TX-RAMP, with 24/7 threat monitoring.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Association member communities$q$, $q$Associations use Hivebrite's directory, forums, events, and membership tools to engage members and manage renewals.$q$, $q$Professional and trade associations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Alumni network engagement$q$, $q$Higher education institutions use Hivebrite's mentoring, directory, and mobile app features to keep alumni connected and engaged.$q$, $q$Higher education / alumni relations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Nonprofit and mission-driven communities$q$, $q$Nonprofits use Hivebrite's groups, donations, and communications tools to build and sustain supporter communities.$q$, $q$Nonprofit organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Core$q$, $q$$895/month$q$, $q$annual$q$, $q$["Directory","Events","Memberships","Connections","Monetization"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Flex$q$, $q$$1,995/month$q$, $q$annual$q$, $q$["Everything in Core","Community champions","Group management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Prime$q$, $q$Custom (quote after discovery call)$q$, NULL, $q$["Everything in Flex","Autonomous sub-communities","Governance tools"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$Custom Fit$q$, $q$Custom$q$, NULL, $q$["Everything in Prime","Deep customization","Integrated workflows","Extensibility"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$overview$q$, $q$What is Hivebrite?$q$, 2, ARRAY[$q$Hivebrite is a community engagement platform used by organizations to build branded online communities that combine directories, forums, events, messaging, and membership management in one place.$q$, $q$The platform includes AI-powered matching and recommendation tools designed to connect members with relevant people and content, alongside a no-code page builder for branding and native iOS/Android mobile apps for on-the-go engagement.$q$, $q$Hivebrite states it is used by over 2,000 organizations and holds ISO 27001 certification along with GDPR, CCPA, PCI-DSS, and TX-RAMP compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', $q$who-its-for$q$, $q$Who Hivebrite is for$q$, 2, ARRAY[$q$Hivebrite is built for associations, higher education institutions managing alumni networks, and nonprofit organizations that need to run member directories, events, forums, and mentoring programs within a single branded community platform. Pricing starting at $895/month makes it best suited to organizations with a formal community program budget rather than very small or informal groups.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08901206-af95-4614-be7a-942eac7c6ae2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Higher Logic Vanilla ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$B2B/B2C customer community platform, originally Vanilla Forums (2009), acquired by Higher Logic in 2021.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2009,
  company_size = NULL,
  headquarters = $q$Arlington, VA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Higher Logic Vanilla is a B2B/B2C community platform (formerly Vanilla Forums) offering forums, gamification, and AI-powered community insights.$q$,
  og_description = $q$Higher Logic Vanilla is a B2B/B2C community platform (formerly Vanilla Forums) offering forums, gamification, and AI-powered community insights.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cb2edfa9-9825-4a3e-9d74-500ef6b711a8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cb2edfa9-9825-4a3e-9d74-500ef6b711a8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Self-service & Q&A support$q$, $q$Forums and Q&A tools let members ask questions and share solutions, helping deflect support cases.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Drag-and-drop layout editor$q$, $q$Customize community page layouts without needing developer resources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Gamification$q$, $q$Badges, points, and leaderboards to drive member engagement.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Federated search$q$, $q$Search across the community and other connected content sources from one place.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Polling and product feedback$q$, $q$Collect member input and feature requests directly within the community.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Community analytics$q$, $q$Pre-built and custom reports to track community performance and health.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$AI-powered insights$q$, $q$Monitors sentiment and tracks community health using AI.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$AI Bot Shield$q$, $q$Detects and blocks bot activity within the community.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$AI-powered sentiment and community health monitoring built in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Dedicated AI Bot Shield for bot detection$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Gamification (badges, points, leaderboards) included$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Drag-and-drop customization without developer resources$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Integrates with ChatGPT, Claude, and Cursor via MCP$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Established product lineage dating back to Vanilla Forums, founded 2009$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$No public pricing; three tiers (Corporate, Enterprise, Enterprise Plus) require booking a demo with sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$No free trial or free plan mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Company size and supported languages not disclosed publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Is Higher Logic Vanilla the same as Vanilla Forums?$q$, $q$Yes. Vanilla Forums was founded in 2009 in Montreal, Quebec, Canada, and was acquired by Higher Logic in 2021, which rebranded it as Higher Logic Vanilla.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Does Higher Logic Vanilla offer a free trial?$q$, $q$The pages reviewed do not mention a free trial or free plan; pricing tiers require booking a demo with sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$What pricing plans does Higher Logic Vanilla offer?$q$, $q$Three tiers are listed — Corporate, Enterprise, and Enterprise Plus — differentiated by feature scale, but exact prices are not published and require contacting sales.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Does Higher Logic Vanilla include AI features?$q$, $q$Yes, it offers AI-powered insights for sentiment and community health monitoring, an AI Bot Shield for bot detection, and integrations with ChatGPT, Claude, and Cursor via MCP.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Customer self-service communities$q$, $q$Companies use Higher Logic Vanilla to let customers ask questions, share solutions, and deflect support cases through forums and Q&A.$q$, $q$B2B/B2C support and customer success teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Association and member communities$q$, $q$Professional and trade associations use the platform to host member discussions, gather feedback via polling, and manage engagement.$q$, $q$Professional and trade associations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Corporate$q$, NULL, NULL, $q$["Additional tools to support more advanced community structures and multi-product companies"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Enterprise$q$, NULL, NULL, $q$["Advanced capabilities that scale with large, advanced community use cases"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$Enterprise Plus$q$, NULL, NULL, $q$["Support for the most advanced communities and the most ambitious community use cases"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$overview$q$, $q$What is Higher Logic Vanilla?$q$, 2, ARRAY[$q$Higher Logic Vanilla is a community-first B2B/B2C customer community platform. It originated as Vanilla Forums, founded in 2009 in Montreal, Quebec, Canada, and was acquired by Higher Logic in 2021, which rebranded it as Higher Logic Vanilla.$q$, $q$The platform provides forums, Q&A, gamification, federated search, polling, and community analytics, alongside AI-powered sentiment monitoring and bot detection (AI Bot Shield).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', $q$who-its-for$q$, $q$Who Higher Logic Vanilla is for$q$, 2, ARRAY[$q$It targets B2B and B2C companies, professional and trade associations, and user groups looking to build self-service support and engagement communities, from mid-market to enterprise scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb2edfa9-9825-4a3e-9d74-500ef6b711a8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Khoros Communities ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Khoros Communities (now Khoros Aurora AI) is an enterprise platform for building customer forums, knowledge bases, and idea communities.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Austin, TX, USA$q$,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$Italian$q$, $q$French$q$, $q$German$q$, $q$Czech$q$]::text[],
  seo_meta_description = $q$Khoros Aurora AI is an enterprise community platform with forums, knowledge base, ideas, and AI-powered moderation and answers.$q$,
  og_description = $q$Khoros Aurora AI is an enterprise community platform with forums, knowledge base, ideas, and AI-powered moderation and answers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '09a7538e-340b-43e0-b19c-d39402e0b1c4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '09a7538e-340b-43e0-b19c-d39402e0b1c4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Forums & Q&A$q$, $q$Core discussion forums and Q&A for peer-to-peer support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Knowledge base$q$, $q$Self-service knowledge content to help deflect support cases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Ideas & product feedback$q$, $q$Collect and prioritize member ideas and feedback.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Events and groups$q$, $q$Organize community events and interest- or region-based groups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Human Engine$q$, $q$Gamification, reputation, badges, leaderboards, and expert recognition to drive engagement.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Intelligence Layer$q$, $q$Includes a Community Language Model (CLM), Answer Assist (Beta), AI Moderation (Beta), and Orchestrator (Beta).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Action Layer$q$, $q$Rules-based automation with optional LLM integration for triggered actions.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Long operating history, with 4,000+ communities powered since 2001$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Reports significant self-service cost savings ($500M+) and 2-5x revenue lift from engaged members across its customer base$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Built-in AI features: Answer Assist, AI Moderation, and Orchestrator$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Supports multiple languages: English, Spanish, Italian, French, German, and Czech$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Free migration offer from Community Classic to Aurora AI through the end of 2026 for existing customers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Key AI features (Answer Assist, AI Moderation, Orchestrator) are still in Beta$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$No public pricing published; requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$No free trial or free plan mentioned$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Recent rebrand from 'Community Classic' to 'Aurora AI' may create a naming transition for existing users$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$What is Khoros Aurora AI?$q$, $q$It is Khoros's community platform, built with React and GraphQL, combining forums, knowledge base, ideas, events, and groups with AI-driven engagement tools.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Does Khoros offer a free trial?$q$, $q$The pages reviewed do not disclose a free trial or free plan; pricing is not publicly listed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$What AI features does Khoros Communities include?$q$, $q$The Intelligence Layer includes a Community Language Model (CLM), Answer Assist, AI Moderation, and Orchestrator — all currently in Beta, with more capabilities planned through Q1 2027.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Is there a migration path from older Khoros community products?$q$, $q$Yes, Khoros offers free migration from Community Classic to Aurora AI through the end of 2026 for existing Classic clients.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Enterprise customer support communities$q$, $q$Organizations use Khoros to reduce support costs through self-service forums and knowledge bases.$q$, $q$Enterprise customer support and community teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$Industry-specific engagement communities$q$, $q$Khoros markets tailored solutions for Financial Services, Retail, Technology, Telecommunications, and Travel/Hospitality sectors.$q$, $q$Financial services, retail, technology, telecom, and travel/hospitality brands$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$overview$q$, $q$What is Khoros Communities?$q$, 2, ARRAY[$q$Khoros Communities, now marketed as Khoros Aurora AI, is an enterprise community platform built with React and GraphQL. Khoros, based in Austin, TX, states it has powered 4,000+ communities since 2001.$q$, $q$The platform combines forums, knowledge base, ideas, events, and groups with three layers: a Human Engine for gamification and reputation, an Intelligence Layer with AI features like Answer Assist and AI Moderation, and an Action Layer for rules-based automation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', $q$who-its-for$q$, $q$Who Khoros Communities is for$q$, 2, ARRAY[$q$Khoros markets its community platform to enterprises in Financial Services, Retail, Technology, Telecommunications, and Travel/Hospitality looking to reduce support costs and grow revenue through engaged member communities.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09a7538e-340b-43e0-b19c-d39402e0b1c4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Disciple ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$White-label platform for creators and brands to launch branded iOS, Android, and web community apps.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$399/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Disciple lets creators and brands launch fully white-label iOS, Android, and web community apps with courses, livestreaming, and analytics.$q$,
  og_description = $q$Disciple lets creators and brands launch fully white-label iOS, Android, and web community apps with courses, livestreaming, and analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0754695b-69c5-4fc3-ae4a-a24cfa640353';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0754695b-69c5-4fc3-ae4a-a24cfa640353' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Branded mobile and web apps$q$, $q$Launch a fully white-label iOS, Android, and web app under your own brand, listed in the app stores.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Groups and livestreaming$q$, $q$Organize members into groups with in-app messaging and multi-host livestreaming on higher tiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Course monetization$q$, $q$Sell monetizable courses with video hosting allowances up to 20,000 minutes on the Pro plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Content library$q$, $q$Centralize resources and content so members can access materials inside the branded app.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Member analytics$q$, $q$Track engagement with standard analytics on entry plans or advanced analytics on higher tiers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Integrations and API$q$, $q$Connect with Zapier and Mailchimp, with API access available starting on the Pro plan.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Fully white-label on higher tiers, with no mention of Disciple branding in the app$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Used by recognizable brands including NatWest, BeautyCounter, and Tom Ford$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Rated 4.5-4.7 stars across Capterra, G2, GetApp, and Software Advice per the company's site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Includes livestreaming, course monetization, and analytics without needing separate tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Entry-level plan starts at $399/month, higher than many community platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$No free plan or published free trial listed on the pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$API access and unlimited courses are reserved for the top Branded App Pro tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Organisation-level custom pricing requires a sales conversation$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Does Disciple offer a free trial?$q$, $q$The pricing page does not list a free trial; plans start at $399/month when billed annually.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Can I remove Disciple branding from my app?$q$, $q$Yes, the Branded App Plus tier and above state there is "no mention of Disciple in app."$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Does Disciple support course sales?$q$, $q$Yes, paid tiers include monetizable courses with tiered video-minute allowances.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Is there an API?$q$, $q$API access is included starting with the Branded App Pro plan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Creator membership apps$q$, $q$Creators building a branded membership app with courses, groups, and livestreams.$q$, $q$Content creators and coaches$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Enterprise brand communities$q$, $q$Companies like NatWest running branded member apps for customers or employees.$q$, $q$Enterprise brands$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Branded App$q$, $q$$399/month (billed annually)$q$, $q$annual$q$, $q$["Branded app in app stores and web app","2 admin seats","5 groups","1 non-monetizable course","5,000 video minutes","Standard analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Branded App Plus$q$, $q$$599/month (billed annually)$q$, $q$annual$q$, $q$["Everything in Branded App","5 admin seats","10 groups","Monetizable course","10,000 video minutes","Custom domain","No mention of Disciple in app","Advanced analytics","Zapier integration","Scheduled posts"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Branded App Pro$q$, $q$$999/month (billed annually)$q$, $q$annual$q$, $q$["Everything in Branded App Plus","Unlimited admin seats","Unlimited groups","Unlimited monetized courses","20,000 video minutes","API access","Multi-tier member pricing","Multi-host livestreams"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$Organisation$q$, $q$Custom$q$, NULL, $q$["All Pro features","Bespoke feature development","Strategy sessions","Migration support","Custom security options"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$overview$q$, $q$What is Disciple?$q$, 2, ARRAY[$q$Disciple is a platform that lets creators, brands, and organizations launch their own fully branded community app, listed in the iOS and Android app stores alongside a web version, without writing code.$q$, $q$The platform bundles groups, messaging, livestreaming, a content library, and course monetization into a single independently branded app, so operators are not dependent on third-party social platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', $q$who-its-for$q$, $q$Who Disciple is for$q$, 2, ARRAY[$q$Disciple is aimed at creators, coaches, and established brands that want full ownership of their community experience. It has been used by organizations such as NatWest, BeautyCounter, and Tom Ford to run branded member apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0754695b-69c5-4fc3-ae4a-a24cfa640353', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Skool ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$All-in-one community platform for creators to run paid communities with courses, events, and discussions.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$9/month$q$,
  founded_year = 2019,
  company_size = $q$30 employees$q$,
  headquarters = $q$Los Angeles, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Skool is an all-in-one community platform where creators host paid communities, courses, and events, founded in 2019 and based in Los Angeles.$q$,
  og_description = $q$Skool is an all-in-one community platform where creators host paid communities, courses, and events, founded in 2019 and based in Los Angeles.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '03467347-7168-44c1-be43-606e7826c361';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '03467347-7168-44c1-be43-606e7826c361' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Community discussions$q$, $q$Unlimited members can post and discuss within a single community space on both plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Course hosting$q$, $q$Unlimited course and video content hosted directly inside the community.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Live calls$q$, $q$Unlimited live calls for classes, coaching, or community sessions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Custom URL$q$, $q$Communities get a custom URL on both the Hobby and Pro plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Affiliate program$q$, $q$Built-in affiliate program to help members promote paid communities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Tiered transaction fees$q$, $q$Transaction fee drops from 10% on Hobby to 2.9% on Pro as revenue scales.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Simple flat two-plan pricing structure ($9 or $99/month)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Unlimited members, courses, videos, and live calls on both plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Free trial available before committing to a paid plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Backed by a partnership with Alex Hormozi (Skool Games, 2024)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Hobby plan charges a 10% transaction fee on sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Even the Pro plan retains a 2.9% transaction fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$No perpetually free community tier listed on the pricing page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$What's the difference between Skool's Hobby and Pro plans?$q$, $q$Both include unlimited members, courses, videos, and live calls; the difference is the transaction fee — 10% on Hobby ($9/month) versus 2.9% on Pro ($99/month).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Does Skool offer a free trial?$q$, $q$Yes, both the Hobby and Pro plans offer a free trial before payment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Who founded Skool?$q$, $q$Skool was founded in 2019 by CEO Sam Ovens and CTO Daniel Kang.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Where is Skool based?$q$, $q$Skool is headquartered in Los Angeles with around 30 employees, per its About page.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Paid community and course business$q$, $q$Creators bundling community access with paid courses and live calls in one product.$q$, $q$Course creators and coaches$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Hobby and interest communities$q$, $q$Hobbyists and experts starting a community around a shared interest before monetizing further.$q$, $q$Hobbyists and niche experts$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Hobby$q$, $q$$9/month$q$, $q$monthly$q$, $q$["Unlimited members","Unlimited courses","Unlimited videos","Unlimited live calls","10% transaction fee","Custom URL","Affiliate program"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$Pro$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Unlimited members","Unlimited courses","Unlimited videos","Unlimited live calls","2.9% transaction fee","Custom URL","Affiliate program"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$overview$q$, $q$What is Skool?$q$, 2, ARRAY[$q$Skool is a community platform where creators, artists, hobbyists, and experts can build online communities around subscription memberships or one-time course purchases.$q$, $q$Founded in 2019 by Sam Ovens and Daniel Kang and headquartered in Los Angeles, Skool combines community discussions, course hosting, and live calls in a single product.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('03467347-7168-44c1-be43-606e7826c361', $q$who-its-for$q$, $q$Who Skool is for$q$, 2, ARRAY[$q$Skool targets creators and experts who want to monetize an audience through a paid community and courses, with a flat two-plan pricing structure based on transaction fees rather than feature gating.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03467347-7168-44c1-be43-606e7826c361', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03467347-7168-44c1-be43-606e7826c361', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Heartbeat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$All-in-one monetized community platform combining membership management, courses, events, and payments.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Heartbeat is an all-in-one platform for monetized communities, combining courses, events, and payments, with plans from $49/month and a 14-day trial.$q$,
  og_description = $q$Heartbeat is an all-in-one platform for monetized communities, combining courses, events, and payments, with plans from $49/month and a 14-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3fda2cde-3534-421f-9cdb-eac5fb45b0e6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3fda2cde-3534-421f-9cdb-eac5fb45b0e6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Community spaces$q$, $q$Channels, live rooms, discussions, and a member directory with personalized feeds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Courses$q$, $q$Evergreen and cohort-based courses with video hosting, assignments, and progress tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Events$q$, $q$Ticketed workshops and webinars with Zoom and calendar integration plus attendance tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Payments$q$, $q$Membership tiers, subscriptions, installment plans, and affiliate programs built in.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Pulse AI$q$, $q$Automated community setup, including course creation, page generation, and workflow automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Integrations$q$, $q$Connects with Stripe, Zapier, Zoom, Google Calendar, Notion, and Mailchimp.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Transaction fees decrease as plan tier increases, from 5% down to 1.25%$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Recognized as a G2 Momentum Leader (Spring 2025) with High Performer badges$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Reports processing $23M+ in member payments across 25,000+ communities$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Entry Build plan caps membership at 350 members$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Charges its own transaction fee on top of Stripe's processing fees$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$White-label mobile app is limited to the top-tier Scale plan ($849/month)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$API access requires the Grow plan or higher$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$How much does Heartbeat cost?$q$, $q$Plans run Build ($49/month), Grow ($149/month), and Scale ($849/month), each with lower monthly pricing on annual billing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Is there a free trial?$q$, $q$Yes, a 14-day free trial is offered with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Does Heartbeat charge transaction fees?$q$, $q$Yes, on top of Stripe's processing fees, Heartbeat charges 5% (Build), 2.5% (Grow), or 1.25% (Scale).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$What is Pulse AI?$q$, $q$Heartbeat's built-in AI feature that automates community setup, including course creation, page generation, and workflow automation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Creator-led paid communities$q$, $q$Creators consolidating membership, courses, and events into one branded site instead of multiple tools.$q$, $q$Content creators and course instructors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Coaching and consulting programs$q$, $q$Business coaches running cohort-based courses and ticketed events alongside a community.$q$, $q$Coaches and consultants$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Build$q$, $q$$49/month, or $40/month billed annually$q$, $q$monthly$q$, $q$["Up to 350 members","5 automation workflows","1 custom landing page","Unlimited channels, courses, events, documents & landing pages","Member badges","Community analytics","5% transaction fee"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Grow$q$, $q$$149/month, or $124/month billed annually$q$, $q$monthly$q$, $q$["Up to 5,000 members","Unlimited automation workflows","50 hours native video hosting","15 custom landing pages","White-label emails & customization","API access","2.5% transaction fee"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$Scale$q$, $q$$849/month, or $766/month billed annually$q$, $q$monthly$q$, $q$["Unlimited members","Branded white-label mobile app","Advanced analytics","50 custom landing pages","200 hours native video hosting","Dedicated onboarding expert","1.25% transaction fee"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$overview$q$, $q$What is Heartbeat?$q$, 2, ARRAY[$q$Heartbeat is an all-in-one platform for creators and businesses to build monetized communities, consolidating membership management, course hosting, event coordination, and payment processing into a single branded website.$q$, $q$The platform reports over 25,000 communities built and more than $23M in member payments processed, with a built-in AI feature called Pulse AI that automates community setup.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', $q$who-its-for$q$, $q$Who Heartbeat is for$q$, 2, ARRAY[$q$Heartbeat is built for content creators, course instructors, and business coaches who want to run community, courses, events, and payments from one place instead of stitching together separate tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda2cde-3534-421f-9cdb-eac5fb45b0e6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Geneva ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Consumer app for discovering local interest-based groups and coordinating in-person meetups, now owned by Bumble.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Geneva helps people find and join local interest-based groups for offline meetups, connecting members through messaging and event coordination.$q$,
  og_description = $q$Geneva helps people find and join local interest-based groups for offline meetups, connecting members through messaging and event coordination.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f060f9b6-0029-44ee-a1ce-f641464783dd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f060f9b6-0029-44ee-a1ce-f641464783dd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Location-based group discovery$q$, $q$Browse groups by city, with examples highlighted in Los Angeles, New York, Dallas, and Boston.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Interest-specific communities$q$, $q$Communities organized around shared interests such as running, dining, film, and thrifting.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$In-app messaging$q$, $q$Coordinate offline activities and meetups directly through group chat.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Web and app access$q$, $q$Available as a web app or as a downloadable app.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Focused specifically on turning online groups into real offline meetups$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Wide range of interest categories represented, from fitness to dining to film$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Accessible via both a web app and a downloadable app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Now backed by Bumble Inc. following its acquisition of Geneva$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$No pricing, plans, or monetization details published on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Founding year, headquarters, and team size are not disclosed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Future product direction is uncertain following the Bumble acquisition$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Homepage highlights a limited set of city-based communities rather than global coverage$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Is Geneva owned by Bumble?$q$, $q$Yes, Bumble Inc.'s acquisition of Geneva has officially closed, per Geneva's website.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$What does Geneva do?$q$, $q$Geneva is a platform for finding local, interest-based groups and coordinating in-person meetups.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Can I use Geneva without downloading an app?$q$, $q$Yes, Geneva can be opened directly in a browser in addition to its downloadable app.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$What kinds of groups are on Geneva?$q$, $q$Examples on the site include running clubs, dinner clubs, and film-focused communities in cities like New York and Boston.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Finding local interest groups$q$, $q$People looking to join existing city-based groups organized around a shared hobby or interest.$q$, $q$Individuals seeking local social communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$Coordinating in-person meetups$q$, $q$Group organizers using in-app messaging to plan and coordinate offline activities.$q$, $q$Community and group organizers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$overview$q$, $q$What is Geneva?$q$, 2, ARRAY[$q$Geneva describes itself as "the online place to find your offline people," connecting users to local, interest-based groups for in-person activities such as running clubs and dinner clubs.$q$, $q$The platform is accessible via a web app or a downloadable app, and Bumble Inc. has completed its acquisition of Geneva.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', $q$who-its-for$q$, $q$Who Geneva is for$q$, 2, ARRAY[$q$Geneva is aimed at people who want to find and join existing local communities organized around a shared interest, and then coordinate real-world meetups through group messaging.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f060f9b6-0029-44ee-a1ce-f641464783dd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Forumbee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Community software for discussion forums, Q&A, and knowledge bases used by enterprise support and membership teams.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$250/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Forumbee is community software offering discussion forums, Q&A, and knowledge bases for customer support, starting at $250/month.$q$,
  og_description = $q$Forumbee is community software offering discussion forums, Q&A, and knowledge bases for customer support, starting at $250/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e83b9e49-d147-4636-a644-73eb25d07963';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e83b9e49-d147-4636-a644-73eb25d07963' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Discussion forums$q$, $q$Peer-to-peer discussion spaces for members and customers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Community Q&A$q$, $q$Customer-powered support through community question-and-answer threads.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Knowledge base$q$, $q$Publish and organize help content alongside community discussions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Ideation tools$q$, $q$Collect and prioritize customer feedback and feature ideas.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Community analytics$q$, $q$Reports for tracking member engagement and community activity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Gamification$q$, $q$Badges and leaderboards to encourage participation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$SSO on Enterprise$q$, $q$SAML SSO and Okta support included on the Enterprise plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Used by recognizable organizations including Accenture, Kiva, Turnitin, and Girl Scouts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Combines forums, Q&A, knowledge base, and ideation in one product$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Enterprise plan includes SAML SSO/Okta and a dedicated success manager on annual subscriptions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Custom "Build Your Own" plan available for larger enterprise needs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$No free plan or free trial mentioned on the pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Entry Premium plan starts at $250/month and is capped at 2,000 members$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Gamification module is an additional cost on top of the Enterprise plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Add-ons such as custom themes and account setup carry significant extra fees$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$How much does Forumbee cost?$q$, $q$The Premium plan is $250/month (5 admins, 2,000 members) and Enterprise is $750/month (20 admins, 20,000 members); a custom "Build Your Own" plan is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Does Forumbee include a knowledge base?$q$, $q$Yes, Knowledge Base is a standard feature included on all plans, alongside discussion forums, Q&A, and ideation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Does Forumbee support single sign-on?$q$, $q$SAML SSO and Okta support are included on the Enterprise plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Can I add more members to my plan?$q$, $q$Yes, additional blocks of 5,000 members can be added for $100/month.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Customer support communities$q$, $q$Companies scaling support through peer-to-peer Q&A and a searchable knowledge base.$q$, $q$Customer support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Membership and advocacy organizations$q$, $q$Mission-driven organizations building engagement and knowledge sharing among members.$q$, $q$Membership organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Premium$q$, $q$$250/month$q$, $q$monthly$q$, $q$["5 admin users","2,000 members","All standard features","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Enterprise$q$, $q$$750/month$q$, $q$monthly$q$, $q$["20 admin users","20,000 members","All standard features","SAML SSO & Okta","Dedicated success manager with annual subscription"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$Custom$q$, $q$Build Your Own$q$, NULL, $q$["Extra admin users, members, and page views","Multiple communities","Account customizations","Implementation and training services"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$overview$q$, $q$What is Forumbee?$q$, 2, ARRAY[$q$Forumbee is community software that helps organizations build online communities and knowledge bases, combining discussion forums, community Q&A, a knowledge base, and ideation tools for collecting customer feedback.$q$, $q$The platform is used by organizations including Accenture, Kiva, Turnitin, Girl Scouts, Fox Entertainment, and Cambridge Judge Business School.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', $q$who-its-for$q$, $q$Who Forumbee is for$q$, 2, ARRAY[$q$Forumbee targets companies scaling customer support, organizations focused on client relationships, and membership organizations that want peer-to-peer knowledge sharing alongside a formal knowledge base.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e83b9e49-d147-4636-a644-73eb25d07963', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Flarum ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source forum software built on Laravel with a large community extension ecosystem.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Flarum is free, open-source forum software under the MIT license, built on Laravel with hundreds of community extensions.$q$,
  og_description = $q$Flarum is free, open-source forum software under the MIT license, built on Laravel with hundreds of community extensions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cdf350cb-3f1d-4f22-b2fc-e83f597e6faf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cdf350cb-3f1d-4f22-b2fc-e83f597e6faf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Flexible editing$q$, $q$Lightweight Markdown editing plus an optional full WYSIWYG editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Notifications and digests$q$, $q$In-browser notifications and email digest options to keep members engaged.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Moderation controls$q$, $q$Group-based permissions and built-in flagging for community moderation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Extension ecosystem$q$, $q$Hundreds of community-built extensions available, plus support for custom extension development.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Laravel foundation$q$, $q$Built on the Laravel PHP framework with MySQL, MariaDB, or PostgreSQL support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Performance focus$q$, $q$Recent releases target N+1 query fixes and mobile optimization.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Completely free and open-source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Used by organizations including giffgaff, Sunrise, and Swisscom$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Large extension ecosystem for customization without forking core code$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Actively developed, with recent releases focused on performance and mobile$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Self-hosting requires your own server and database setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$No official hosted or managed version mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Still at a release-candidate stage (2.0.0-rc.3) rather than a marked-stable 2.0 release$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Is Flarum free?$q$, $q$Yes, Flarum is free, open-source software released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$What is Flarum built on?$q$, $q$Flarum is built on the Laravel PHP framework and supports MySQL, MariaDB, and PostgreSQL databases.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Can I extend Flarum's features?$q$, $q$Yes, there are hundreds of community-built extensions, and custom extensions can also be developed.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Is Flarum production-ready?$q$, $q$As of the current release (2.0.0-rc.3), Flarum describes itself as approaching a stable release with a focus on production-readiness.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Self-hosted community forums$q$, $q$Organizations wanting full control over a self-hosted discussion forum without licensing fees.$q$, $q$Developers and technical community managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$Branded support and product forums$q$, $q$Companies like giffgaff and Swisscom running branded support or discussion forums.$q$, $q$Companies running customer or product forums$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$overview$q$, $q$What is Flarum?$q$, 2, ARRAY[$q$Flarum is open-source forum software built on Laravel, designed to be "beautiful, fast, and free," with extensibility as a core focus through a large ecosystem of community-built extensions.$q$, $q$It is released under the MIT license, supports MySQL, MariaDB, and PostgreSQL, and is used by organizations including giffgaff, Sunrise, and Swisscom.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', $q$who-its-for$q$, $q$Who Flarum is for$q$, 2, ARRAY[$q$Flarum suits developers and community managers who want a self-hosted, free forum platform they can customize deeply through extensions and custom CSS, from small hobby forums to larger installations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cdf350cb-3f1d-4f22-b2fc-e83f597e6faf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── NodeBB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modern, mobile-first forum software available as open source or hosted plans starting at $20/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$NodeBB is mobile-first forum software with real-time posts and ActivityPub support, offered free open source or hosted from $20/month.$q$,
  og_description = $q$NodeBB is mobile-first forum software with real-time posts and ActivityPub support, offered free open source or hosted from $20/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8cded24f-f6e3-445f-86fb-dc2b2871d6b2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8cded24f-f6e3-445f-86fb-dc2b2871d6b2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Mobile-first design$q$, $q$Responsive interface designed to work across all devices and screen sizes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Real-time updates$q$, $q$Live streaming of topics, posts, and notifications as they happen.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Built-in chat$q$, $q$Instant messaging and social feed views alongside traditional forum threads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Tag and category system$q$, $q$Flexible content organization with role-based permissions assignable per category.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$ActivityPub support$q$, $q$Fediverse integration for connecting with the broader decentralized social web.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$SEO optimization$q$, $q$Human-readable URLs and semantic HTML for search visibility.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$GDPR compliance$q$, $q$NodeBB states it was the first forum software to achieve GDPR compliance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Free, self-hosted open-source option available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Hosted plans include a 14-day free trial$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Real-time functionality, including live posts and notifications, beyond typical forum software$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Used by established communities including Vivaldi, Opera, and MOZ$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Hosted trial requires a credit card upfront$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Storage and pageview limits scale sharply with plan cost, from $20 to $750/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Self-hosting the open-source version requires technical setup and ongoing maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Is NodeBB free?$q$, $q$NodeBB offers a free, self-hosted open-source version, plus paid hosted plans starting at $20/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Does NodeBB offer a free trial for hosted plans?$q$, $q$Yes, hosted plans include a 14-day free trial, though a credit card is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$What hosted plans does NodeBB offer?$q$, $q$Starter ($20/month), Hamlet ($100/month), Village ($250/month), and City ($750/month), plus custom Enterprise pricing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Does NodeBB support the fediverse?$q$, $q$Yes, NodeBB includes ActivityPub support for fediverse integration.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Self-hosted community forums$q$, $q$Technical teams self-hosting the open-source version for full control over infrastructure.$q$, $q$Developers and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Managed forum hosting$q$, $q$Businesses wanting a hosted forum without managing their own server, choosing a plan based on expected traffic.$q$, $q$Growing businesses and community teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Starter$q$, $q$$20/month$q$, $q$monthly$q$, $q$["50,000 pageviews","5GB storage","Unlimited staff users","Weekly backups","SSL","Custom plugins","Custom domain","Priority support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Hamlet$q$, $q$$100/month$q$, $q$monthly$q$, $q$["500,000 pageviews","20GB storage","Unlimited staff users","Daily backups","SSL","Custom plugins","Custom domain","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$Village$q$, $q$$250/month$q$, $q$monthly$q$, $q$["2,000,000 pageviews","100GB storage","Unlimited staff users","Daily backups","SSL","Custom plugins","Custom domain","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$City$q$, $q$$750/month$q$, $q$monthly$q$, $q$["10,000,000 pageviews","300GB storage","Unlimited staff users","Daily backups","SSL","Custom plugins","Custom domain","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$overview$q$, $q$What is NodeBB?$q$, 2, ARRAY[$q$NodeBB is modern forum software designed for mobile-first, real-time community discussions, offering built-in chat, ActivityPub fediverse support, and a role-based permission system by category.$q$, $q$It's available as free, self-hosted open-source software, as one-click hosted plans starting at $20/month with a 14-day free trial, or as a custom Enterprise solution.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', $q$who-its-for$q$, $q$Who NodeBB is for$q$, 2, ARRAY[$q$NodeBB serves technical teams that want to self-host for free, growing businesses that prefer a managed hosted plan, and larger organizations needing custom enterprise integrations. Established users include Vivaldi, Opera, and MOZ.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8cded24f-f6e3-445f-86fb-dc2b2871d6b2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── MyBB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source forum software maintained by volunteers, in development since 2002.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2002,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MyBB is free, open-source forum software maintained by volunteers since 2002, with plugins, themes, and community translations.$q$,
  og_description = $q$MyBB is free, open-source forum software maintained by volunteers since 2002, with plugins, themes, and community translations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '74a1d6b8-aba9-4709-96d4-eef201241dde';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '74a1d6b8-aba9-4709-96d4-eef201241dde' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Plugins and themes$q$, $q$Hundreds of plugins and themes available for customizing forum functionality and appearance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Community translations$q$, $q$The forum is available in 30+ languages through community-contributed translations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Moderation tools$q$, $q$Tools for forum moderators and staff to manage discussions and members.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Admin dashboard$q$, $q$Full control panel for managing forum settings and users.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Private messaging$q$, $q$Members can participate in private conversations with other registered users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Template editor$q$, $q$Built-in template editing for design customization without external tools.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Completely free and open source, maintained by volunteers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Long track record, in development since 2002$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Large plugin and theme ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Translated into 30+ languages by the community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Relies on volunteer maintenance rather than a dedicated commercial support team$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Self-hosting requires setting up and maintaining your own server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$No official hosted or managed version mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Is MyBB free?$q$, $q$Yes, MyBB is free and open-source software, maintained by volunteers with optional donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$How long has MyBB been around?$q$, $q$MyBB has been in development since 2002, per its website.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Can MyBB be customized?$q$, $q$Yes, hundreds of plugins and themes are available, along with a built-in template editor.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Is MyBB available in languages other than English?$q$, $q$Yes, community translations are available in more than 30 languages.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Self-hosted discussion forums$q$, $q$Community organizers self-hosting a free forum without licensing costs.$q$, $q$Forum administrators and community organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$Multilingual communities$q$, $q$Communities needing a forum available in languages other than English through community translations.$q$, $q$International and multilingual communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$overview$q$, $q$What is MyBB?$q$, 2, ARRAY[$q$MyBB is free, open-source forum software that has been in development since 2002, maintained by volunteers and supported through community donations.$q$, $q$It powers a wide range of community forums, offering plugins, themes, a template editor, and moderation tools out of the box.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', $q$who-its-for$q$, $q$Who MyBB is for$q$, 2, ARRAY[$q$MyBB is aimed at community organizers and forum administrators who want a free, self-hosted forum with a mature plugin and theme ecosystem, including support for over 30 languages via community translations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('74a1d6b8-aba9-4709-96d4-eef201241dde', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── phpBB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$phpBB is free, open-source PHP bulletin board software for self-hosted online forums, released under the GNU GPL.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2000,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$phpBB is free, open-source forum software built in PHP under the GNU GPL, powering self-hosted community forums since 2000.$q$,
  og_description = $q$phpBB is free, open-source forum software built in PHP under the GNU GPL, powering self-hosted community forums since 2000.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c103625-d77b-4769-a06c-01a9300cd28b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c103625-d77b-4769-a06c-01a9300cd28b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Multi-database support$q$, $q$Runs on MariaDB, Microsoft SQL Server, MySQL, PostgreSQL, SQLite, or Oracle Database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Hierarchical subforums$q$, $q$Flat message structure with support for nested subforums to organize discussions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Moderation tools$q$, $q$Topic split, merge, and lock controls along with user group management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Full-text search$q$, $q$Built-in search across posts and topics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Extension system$q$, $q$Self-contained extensions can be installed through the Admin Control Panel (ACP) to add functionality.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Modern password security$q$, $q$Passwords are hashed using Argon2id and Argon2i on supported platforms.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Completely free and open source under GPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Self-hosted, giving full control over data and customization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Mature project with a continuous version history since 2000$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Extensible through a plugin/extension system$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Supports six major database engines$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Requires self-hosting and server/PHP administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Flat, non-threaded discussion structure feels dated next to modern forum UIs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$No official hosted SaaS version — deployment is DIY$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Is phpBB free?$q$, $q$Yes, phpBB is free and open-source software licensed under the GNU GPL v2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$What databases does phpBB support?$q$, $q$phpBB supports MariaDB, Microsoft SQL Server, MySQL, PostgreSQL, SQLite, and Oracle Database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Can I extend phpBB's functionality?$q$, $q$Yes, through self-contained extensions installed via the Admin Control Panel (ACP).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$How long has phpBB been around?$q$, $q$phpBB began in June 2000, with phpBB3 released in December 2007 and ongoing 3.3.x releases since.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Community forums$q$, $q$Organizations and hobbyist communities running self-hosted discussion boards.$q$, $q$Community managers and forum admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Support forums$q$, $q$Companies hosting free-form community support boards for their products.$q$, $q$Software and product support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$Self-hosted$q$, $q$Free$q$, NULL, $q$["Full source code","Unlimited forums and users","Extension system","Community support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$overview$q$, $q$What is phpBB?$q$, 2, ARRAY[$q$phpBB is free, open-source bulletin board software written in PHP. It began in June 2000 and has been continuously developed since, with phpBB3 released in 2007 and ongoing 3.3.x releases maintained by the phpBB project.$q$, $q$The software is self-hosted and runs on top of a PHP-compatible web server and a supported database engine, including MariaDB, MySQL, PostgreSQL, SQLite, Microsoft SQL Server, or Oracle.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', $q$who-its-for$q$, $q$Who phpBB is for$q$, 2, ARRAY[$q$phpBB suits organizations, communities, and hobbyists who want a free, fully self-hosted forum they control end-to-end, and who are comfortable managing their own server and PHP environment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c103625-d77b-4769-a06c-01a9300cd28b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Loomio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Loomio is collaborative decision-making software for groups to discuss, vote, and record transparent decisions.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/month$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$New Zealand$q$,
  languages = '{}',
  seo_meta_description = $q$Loomio helps groups discuss, vote, and document decisions transparently, with plans from $39/month and nonprofit discounts.$q$,
  og_description = $q$Loomio helps groups discuss, vote, and document decisions transparently, with plans from $39/month and nonprofit discounts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Structured discussions$q$, $q$Members post questions with background context and relevant documents attached.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Reasoned voting$q$, $q$Participants share their position and rationale, surfacing support and concerns.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Decision records$q$, $q$Outcomes, reasoning, and next steps stay searchable and accessible after the fact.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Asynchronous participation$q$, $q$Groups can contribute to a discussion across time zones and distance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Unlimited subgroups$q$, $q$Pro plan supports unlimited subgroups for larger organizations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Regional hosting choice$q$, $q$Customers can choose loomio.com (USA) or loomio.eu (Netherlands) for data hosting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Worker-owned, open-source cooperative behind the product$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Nonprofit discounts of up to 50% on Pro$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Choice of US or EU data hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Free trial before committing to a paid plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Purpose-built for transparent group decisions rather than generic chat$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Starter plan is capped at 30 members$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$No permanent free plan for the hosted service — only a trial$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Private Loomio (enterprise) pricing requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Does Loomio have a free trial?$q$, $q$Yes, Loomio offers a free trial to invite people and make a real decision before subscribing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$How much does Loomio cost?$q$, $q$Starter is $39/month or $299/year, and Pro is $99/month or $499/year; nonprofits receive discounted rates.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Where is Loomio's data hosted?$q$, $q$Customers can choose loomio.com (USA) or loomio.eu (Netherlands).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Who runs Loomio?$q$, $q$Loomio Cooperative Limited, a worker-owned and open-source cooperative based in Aotearoa New Zealand, founded in 2011.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Nonprofit and cooperative governance$q$, $q$Groups that need transparent, documented decisions without endless meetings.$q$, $q$Nonprofits, cooperatives, community groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Distributed team decisions$q$, $q$Organizations that need asynchronous, reasoned decision-making across time zones.$q$, $q$Remote and distributed organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Starter$q$, $q$$39/month or $299/year$q$, $q$monthly$q$, $q$["Up to 30 members","One group","Onboarding call and email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Pro$q$, $q$$99/month or $499/year$q$, $q$monthly$q$, $q$["Up to 3,000 members","Unlimited subgroups","Onboarding call and email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$Private Loomio$q$, $q$Custom$q$, NULL, $q$["SAML/OAuth single sign-on","Dedicated server and private database","Unlimited users, groups, and subgroups","Custom branding and domain"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$overview$q$, $q$What is Loomio?$q$, 2, ARRAY[$q$Loomio is collaborative decision-making software that gives groups a dedicated space to discuss, vote on, and document decisions instead of relying on scattered email threads or chat.$q$, $q$Founded in 2011 and run by Loomio Cooperative Limited, a worker-owned and open-source cooperative based in Aotearoa New Zealand, Loomio pairs structured discussion with reasoned voting so groups can see not just what was decided, but why.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', $q$who-its-for$q$, $q$Who Loomio is for$q$, 2, ARRAY[$q$Loomio is aimed at nonprofits, cooperatives, and community or distributed organizations that need transparent, well-documented group decisions and are willing to pay for a hosted or self-managed solution.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b4c556a1-7dd3-4fb8-a70c-2e72bb6659e0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Decidim ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Decidim is free, open-source software for citizen participation, participatory budgeting, and democratic assemblies.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$Spanish$q$, $q$Catalan$q$, $q$Czech$q$, $q$English$q$, $q$Basque$q$, $q$French$q$, $q$German$q$, $q$Hungarian$q$, $q$Japanese$q$, $q$Portuguese$q$, $q$Romanian$q$, $q$Finnish$q$]::text[],
  seo_meta_description = $q$Decidim is free, open-source software for participatory democracy — strategic planning, budgeting, assemblies, and consultations.$q$,
  og_description = $q$Decidim is free, open-source software for participatory democracy — strategic planning, budgeting, assemblies, and consultations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7a37a860-0053-444d-834e-ac1979dd8720';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7a37a860-0053-444d-834e-ac1979dd8720' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Participatory budgeting$q$, $q$Tools for running public budget allocation processes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Assemblies and initiatives$q$, $q$Management of citizen assemblies and initiatives.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Consultations$q$, $q$Structured public consultation and deliberation processes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Strategic planning$q$, $q$Modules for organizational and civic strategic planning.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Transparency safeguards$q$, $q$Traceability features to keep participatory processes accountable.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Multilingual support$q$, $q$Available in 12 languages including English, Spanish, Catalan, French, and Japanese.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Completely free and open source, licensed under Creative Commons BY-SA$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Used by major institutions including Barcelona, New York City, Helsinki, Mexico City, and the European Commission$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Supports 12 languages out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Backed by an established maintainer, the Associació de Software Lliure Decidim$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Requires self-hosting and technical setup like most open-source platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$No commercial support pricing published on the main site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Built specifically for civic/government participation rather than general business use$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Is Decidim free?$q$, $q$Yes, Decidim is free/libre, open-source software licensed under Creative Commons BY-SA.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Who maintains Decidim?$q$, $q$The Associació de Software Lliure Decidim, supported by organizations including Barcelona City Council and the Generalitat de Catalunya.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$What languages does Decidim support?$q$, $q$Decidim supports 12 languages, including English, Spanish, Catalan, French, German, and Japanese.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Who uses Decidim?$q$, $q$Cities and institutions such as Barcelona, New York City, Helsinki, Mexico City, and the European Commission.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Participatory budgeting$q$, $q$Local governments running public budget allocation processes.$q$, $q$City and regional governments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Civic assemblies and consultations$q$, $q$Institutions organizing citizen assemblies and public consultations.$q$, $q$Public institutions and civic organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$Open source (self-hosted)$q$, $q$Free$q$, NULL, $q$["Full source code","Participatory budgeting","Assemblies and consultations","12 languages"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$overview$q$, $q$What is Decidim?$q$, 2, ARRAY[$q$Decidim is free, open-source software that lets citizens, organizations, and public institutions self-organize democratically at scale, covering strategic planning, participatory budgeting, assemblies, initiatives, and consultations.$q$, $q$It is licensed under Creative Commons BY-SA and maintained by the Associació de Software Lliure Decidim, with support from institutions such as Barcelona City Council and the Generalitat de Catalunya.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', $q$who-its-for$q$, $q$Who Decidim is for$q$, 2, ARRAY[$q$Decidim is built for city governments, public institutions, and civic organizations that want to run transparent participatory processes, and are already used by cities like Barcelona, New York City, Helsinki, and Mexico City.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7a37a860-0053-444d-834e-ac1979dd8720', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Polis ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Polis is open-source deliberation software that clusters participant opinions with AI instead of using threaded replies.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Polis is open-source deliberation software that clusters opinions in real time, with a free Basic tier and a custom Pro plan.$q$,
  og_description = $q$Polis is open-source deliberation software that clusters opinions in real time, with a free Basic tier and a custom Pro plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3dea5eed-dd33-4128-91b3-fee23cd6f46a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3dea5eed-dd33-4128-91b3-fee23cd6f46a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Statement-based voting$q$, $q$Participants vote agree, disagree, or pass on statements one at a time instead of replying in threads.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Opinion clustering$q$, $q$Machine learning groups participants by response pattern and surfaces cross-cluster consensus.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Real-time reporting$q$, $q$Automatic web-based reports generate once a conversation reaches a set threshold.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Automatic translation$q$, $q$Statements can be automatically translated for multilingual participation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Bulk data tools (Pro)$q$, $q$Bulk statement uploads via CSV/API and raw data export.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$LLM-enhanced reports (Pro)$q$, $q$Real-time advanced reports with selectable large language model options.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$On-premises deployment (Pro)$q$, $q$Available for large organizations that need custom hosting.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Free Basic tier with core reporting and moderation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Open-source project from the Computational Democracy Project$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Surfaces cross-group consensus rather than amplifying the loudest voices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Automatic translation of statements$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$EU data residency option available on Pro$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Pro plan pricing is not publicly listed and requires an access request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$No threaded discussion or replies by design, which limits some use cases$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$On-premises deployment is reserved for large organizations on Pro$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Is Polis free to use?$q$, $q$Yes, the Basic plan is free and includes basic reporting, moderation, seed statements, and automatic translation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$How does Polis differ from a normal comment forum?$q$, $q$Instead of replies, participants vote agree/disagree/pass on statements, and machine learning clusters participants by opinion pattern.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$What does the Pro plan add?$q$, $q$Real-time advanced reports, enhanced LLM reports, bulk CSV/API uploads, EU data residency, and on-premises deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$How much does Polis Pro cost?$q$, $q$Pricing is not publicly listed; organizations must submit a request-access application.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Public policy deliberation$q$, $q$Governments and institutions gathering structured public input at scale.$q$, $q$Government agencies and policymakers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Large-group consensus finding$q$, $q$Organizations surfacing areas of agreement among large, diverse groups.$q$, $q$Civic tech teams and researchers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Basic$q$, $q$Free$q$, NULL, $q$["Basic reporting","Automatic report generation","Basic moderation","Manual seed statements","Automatic translation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$Pro$q$, $q$Custom (request access)$q$, NULL, $q$["Advanced real-time reports","Enhanced LLM reports","Bulk CSV/API uploads","EU data residency","On-premises deployment"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$overview$q$, $q$What is Polis?$q$, 2, ARRAY[$q$Polis is an open-source platform for large-scale online deliberation, developed by the Computational Democracy Project. Rather than threaded replies, participants respond to statements one at a time with agree, disagree, or pass, and can submit new statements of their own.$q$, $q$Machine learning clusters participants by their response patterns and surfaces the statements that generate agreement across clusters, helping large groups find consensus rather than amplifying the most vocal participants.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', $q$who-its-for$q$, $q$Who Polis is for$q$, 2, ARRAY[$q$Polis suits governments, policymakers, and civic tech teams that need to gather structured input from large, diverse groups and identify genuine areas of consensus.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dea5eed-dd33-4128-91b3-fee23cd6f46a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Crowdcast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Crowdcast is a live-event platform for hosting webinars, workshops, and interactive livestreams with built-in monetization.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Crowdcast hosts live webinars, workshops, and interactive events with chat, polls, and monetization tools from $49/month.$q$,
  og_description = $q$Crowdcast hosts live webinars, workshops, and interactive events with chat, polls, and monetization tools from $49/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a877cfed-31d8-488b-bd3f-59adb9df9eea';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a877cfed-31d8-488b-bd3f-59adb9df9eea' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Customizable Stage$q$, $q$Branded backgrounds and adaptive layouts for live sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Gallery$q$, $q$A preparation space where attendees gather before going live.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Studio production tools$q$, $q$Built-in overlays, video, and slide tools for producing sessions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Live engagement$q$, $q$Live chat, polls, and Q&A for audience participation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Multistream broadcasting$q$, $q$Broadcast simultaneously to Facebook Live, YouTube Live, and Twitch.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Built-in monetization$q$, $q$Ticketing with Stripe and Patreon integration for paid events.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Zapier integration$q$, $q$Connects Crowdcast to other apps for workflow automation.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$14-day free trial with full feature access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Built-in monetization via ticketing, Stripe, and Patreon$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Multistreaming to major platforms without extra software$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Designed for creators and community builders, not just corporate webinars$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Lite plan charges a 5% transaction fee on ticket sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Session length is capped by plan, from 2 to 6 hours depending on tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Extra attendees and streaming hours cost additional fees beyond plan limits$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Stripe processing fees (2.9% + $0.30) apply on top of plan pricing$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Does Crowdcast have a free trial?$q$, $q$Yes, a 14-day trial with all features, capped at 60-minute sessions and 10 live attendees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$How much does Crowdcast cost?$q$, $q$Plans start at $49/month (Lite), with Pro at $89/month and Business at $195/month; annual billing saves 30%.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Can I sell tickets to my events?$q$, $q$Yes, Crowdcast supports ticketing through Stripe and Patreon integrations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$What platforms can I broadcast to?$q$, $q$Crowdcast supports multistreaming to Facebook Live, YouTube Live, and Twitch.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Paid online workshops$q$, $q$Creators monetizing live workshops and classes through built-in ticketing.$q$, $q$Coaches, educators, and creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Community livestream events$q$, $q$Community builders running interactive live shows with chat and polls.$q$, $q$Community managers and content creators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Lite$q$, $q$$49/month$q$, $q$monthly$q$, $q$["100+ live attendees","10 hrs/month streaming","1 team seat","2-hour session limit","5% transaction fee"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Pro$q$, $q$$89/month$q$, $q$monthly$q$, $q$["250+ live attendees","20 hrs/month streaming","2 team seats","4-hour session limit","1 multistream"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$Business$q$, $q$$195/month$q$, $q$monthly$q$, $q$["1000+ live attendees","40 hrs/month streaming","4 team seats","6-hour session limit","2% transaction fee"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$overview$q$, $q$What is Crowdcast?$q$, 2, ARRAY[$q$Crowdcast is a platform for hosting live events such as workshops, webinars, livestreams, and online conferences, positioned as an alternative to traditional corporate webinar software for creators and community builders.$q$, $q$It combines a branded Stage, a pre-show Gallery, and Studio production tools with live chat, polls, Q&A, and multistream broadcasting to Facebook Live, YouTube Live, and Twitch, plus built-in ticketing through Stripe and Patreon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', $q$who-its-for$q$, $q$Who Crowdcast is for$q$, 2, ARRAY[$q$Crowdcast targets creators, coaches, and community builders who want to run and monetize live interactive events without stitching together separate streaming, chat, and payment tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a877cfed-31d8-488b-bd3f-59adb9df9eea', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Butter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Butter is a virtual collaboration platform for running interactive workshops, training sessions, and meetings.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$24/month per seat$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$Copenhagen, Denmark$q$,
  languages = '{}',
  seo_meta_description = $q$Butter is a virtual workshop and meeting platform with a free plan and paid seats from $24/month for interactive sessions.$q$,
  og_description = $q$Butter is a virtual workshop and meeting platform with a free plan and paid seats from $24/month for interactive sessions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd85d55fa-0d1c-4513-9dd7-5d0afd3835fd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd85d55fa-0d1c-4513-9dd7-5d0afd3835fd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Facilitation tools$q$, $q$Purpose-built tools for running interactive workshops and training sessions rather than plain video calls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Unlimited rooms$q$, $q$Paid plans include unlimited session rooms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Session recording$q$, $q$Record sessions for later review, included on paid plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$AI session summaries$q$, $q$Paid plans can generate AI summaries of sessions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Custom branding$q$, $q$Add custom logos and wallpapers to sessions on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Shared team library$q$, $q$Build and reuse a shared library of session content.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Permanent free plan for trying the product$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Purpose-built for facilitation-heavy sessions rather than generic video calls$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$AI summary generation available on paid tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Backed by over $3M in venture funding$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Free plan limited to 60-minute sessions and 20 participants$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Free plan's recap history is limited to 7 days$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Paid pricing is per seat, which can add up for larger teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Does Butter have a free plan?$q$, $q$Yes, the free workspace supports sessions up to 60 minutes with up to 20 participants and 5 free team members.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$How much do Butter's paid plans cost?$q$, $q$Paid workspaces are billed per seat, for example a Starter workspace runs from about $24/month per seat.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$When was Butter founded?$q$, $q$Butter was founded in 2020 and is headquartered in Copenhagen, Denmark.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Does Butter offer AI features?$q$, $q$Paid plans include AI-generated session summaries.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Remote workshops and training$q$, $q$Facilitators running interactive, collaborative sessions with remote teams.$q$, $q$Facilitators and trainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Engaging team meetings$q$, $q$Teams wanting more interactive meetings than standard video calls.$q$, $q$Remote and hybrid teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Free$q$, $q$Free$q$, NULL, $q$["60-minute sessions","20 participants max","5 free team members","7-day recap history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Starter$q$, $q$From $24/month per seat$q$, $q$monthly$q$, $q$["Unlimited session length","Unlimited rooms"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$Unlimited$q$, $q$From $39/month per seat$q$, $q$monthly$q$, $q$["Unlimited rooms and recording","AI session summaries","Custom logos and wallpapers"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$overview$q$, $q$What is Butter?$q$, 2, ARRAY[$q$Butter is a virtual collaboration platform built for running interactive workshops, training sessions, bootcamps, and other facilitation-heavy sessions, rather than standard one-way video calls.$q$, $q$Founded in 2020 and headquartered in Copenhagen, Denmark, Butter offers a free workspace plan alongside per-seat paid plans that add unlimited session length, recording, and AI-generated summaries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', $q$who-its-for$q$, $q$Who Butter is for$q$, 2, ARRAY[$q$Butter is aimed at facilitators, trainers, and remote or hybrid teams that want more interactive, structured sessions than a generic video conferencing tool provides.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d85d55fa-0d1c-4513-9dd7-5d0afd3835fd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── WebinarJam ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WebinarJam is live and automated webinar software for product demos, course sales, and marketing events.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Las Vegas, NV, United States$q$,
  languages = '{}',
  seo_meta_description = $q$WebinarJam hosts live and automated webinars for course sales and product demos, with plans from $39/month and a 14-day trial.$q$,
  og_description = $q$WebinarJam hosts live and automated webinars for course sales and product demos, with plans from $39/month and a 14-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Live webinar hosting$q$, $q$Real-time presentation tools with interactive engagement features.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Automated webinars$q$, $q$Automated scheduling and evergreen replay functionality.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Multi-speaker support$q$, $q$Run events with multiple presenters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Browser-based joining$q$, $q$Attendees join with one click, no downloads required.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Built-in marketing tools$q$, $q$Features for audience growth and monetization within the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Scalable infrastructure$q$, $q$Supports events ranging from small groups to thousands of attendees.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$14-day trial available for $1$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$30-day money-back guarantee on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Annual billing discount on all tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$No attendee downloads required to join a session$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Attendee caps and session duration scale with price tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Entry Starter plan is limited to 100 attendees and 1-hour sessions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Additional team members cost extra above plan allowances$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Does WebinarJam offer a trial?$q$, $q$Yes, a 14-day trial is available for $1.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$How much does WebinarJam cost?$q$, $q$Plans range from $39/month (Starter, billed annually) to $379/month (Enterprise, billed annually).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Who operates WebinarJam?$q$, $q$WebinarJam is operated by Genesis Digital LLC, based in Las Vegas, Nevada.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Is there a refund guarantee?$q$, $q$Yes, WebinarJam offers a 30-day money-back guarantee.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Course and product launches$q$, $q$Creators running live sales webinars to launch courses or products.$q$, $q$Online course creators and marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Multi-presenter events$q$, $q$Teams co-hosting webinars with multiple speakers.$q$, $q$Marketing and sales teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Starter$q$, $q$$49/month or $39/month (annual)$q$, $q$monthly$q$, $q$["100 attendees per webinar","1-hour max duration","1 host"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Basic$q$, $q$$99/month or $79/month (annual)$q$, $q$monthly$q$, $q$["500 attendees per webinar","2-hour max duration","2 hosts"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Professional$q$, $q$$299/month or $229/month (annual)$q$, $q$monthly$q$, $q$["2,000 attendees per webinar","3-hour max duration","4 hosts"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$Enterprise$q$, $q$$499/month or $379/month (annual)$q$, $q$monthly$q$, $q$["5,000 attendees per webinar","4-hour max duration","6 hosts"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$overview$q$, $q$What is WebinarJam?$q$, 2, ARRAY[$q$WebinarJam is live and automated webinar software for hosting online events, product demos, and course sales presentations, operated by Genesis Digital LLC in Las Vegas, Nevada.$q$, $q$It supports both real-time live webinars and automated evergreen replays, with multi-speaker support and browser-based attendee access that requires no software downloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', $q$who-its-for$q$, $q$Who WebinarJam is for$q$, 2, ARRAY[$q$WebinarJam suits marketers, course creators, and sales teams that run webinars to sell products or courses and want built-in monetization and marketing tools alongside the streaming platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fb51e1c-1cc8-4be3-ad0c-336f15ecc8c3', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── EverWebinar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$EverWebinar is automated, evergreen webinar software that replays pre-recorded presentations on a set schedule.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$79/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Las Vegas, NV, United States$q$,
  languages = '{}',
  seo_meta_description = $q$EverWebinar automates evergreen webinar replays on a schedule or just-in-time, priced from $79/month on a 2-year plan.$q$,
  og_description = $q$EverWebinar automates evergreen webinar replays on a schedule or just-in-time, priced from $79/month on a 2-year plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd87ae7b9-660c-4f9e-9f79-7e32216b89fd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd87ae7b9-660c-4f9e-9f79-7e32216b89fd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Automated delivery$q$, $q$Presentations run on scheduled or just-in-time formats, 5-15 minutes after registration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Simulated live engagement$q$, $q$Timed chat messages, polls, handouts, and dynamic attendee counts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Hybrid mode$q$, $q$Pre-recorded video paired with live chat staffing for real-time interaction.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Replica Replay$q$, $q$One-click import of existing WebinarJam sessions, including chat history and offers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Marketing analytics$q$, $q$Conversion optimization and funnel testing tools.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$$1 trial to test the platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$30-day money-back guarantee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$One-click import from WebinarJam sessions including chat history$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Multi-year billing options reduce the effective monthly cost$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Lowest per-month price requires a 2-year prepaid commitment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Monthly plan is the most expensive option per month at $199$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$No permanent free plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Does EverWebinar have a free trial?$q$, $q$Yes, a $1 trial is offered with no long-term commitment.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$How much does EverWebinar cost?$q$, $q$Plans start at $199/month billed monthly, $99/month billed annually, or $79/month billed every 2 years.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Who operates EverWebinar?$q$, $q$EverWebinar is operated by Genesis Digital LLC in Las Vegas, Nevada — the same company behind WebinarJam.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Can I reuse my WebinarJam content?$q$, $q$Yes, Replica Replay lets you one-click import existing WebinarJam sessions including chat history and offers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Evergreen sales funnels$q$, $q$Marketers running always-on automated webinar funnels without hosting live.$q$, $q$Digital marketers and course creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Scaling reach across time zones$q$, $q$Businesses serving a global audience without live scheduling constraints.$q$, $q$Global marketing teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Monthly$q$, $q$$199/month$q$, $q$monthly$q$, $q$["Automated and just-in-time webinars","Live chat simulator","Advanced analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$Annual$q$, $q$$99/month ($1,188/year)$q$, $q$annual$q$, $q$["Automated and just-in-time webinars","Live chat simulator","Advanced analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$2-Year$q$, $q$$79/month ($1,896/2 years)$q$, $q$annual$q$, $q$["Automated and just-in-time webinars","Live chat simulator","Advanced analytics"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$overview$q$, $q$What is EverWebinar?$q$, 2, ARRAY[$q$EverWebinar is automated webinar software that turns pre-recorded presentations into evergreen, always-available events, operated by Genesis Digital LLC in Las Vegas, Nevada — the same company behind WebinarJam.$q$, $q$It delivers presentations on scheduled or just-in-time timing, with simulated live elements like timed chat and polls, and can one-click import existing WebinarJam sessions via Replica Replay.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', $q$who-its-for$q$, $q$Who EverWebinar is for$q$, 2, ARRAY[$q$EverWebinar fits marketers and course creators who want to run always-on, automated webinar funnels for a global audience without scheduling live sessions repeatedly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d87ae7b9-660c-4f9e-9f79-7e32216b89fd', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── BigMarker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$BigMarker is an AI-powered digital experience platform for webinars, virtual, hybrid, and in-person events.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$BigMarker is an AI-powered platform for webinars, virtual, hybrid, and in-person events, with custom pricing via sales.$q$,
  og_description = $q$BigMarker is an AI-powered platform for webinars, virtual, hybrid, and in-person events, with custom pricing via sales.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2958e078-5211-4d10-8a25-a1936a3d292c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2958e078-5211-4d10-8a25-a1936a3d292c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Interactive webinars$q$, $q$Polls, Q&A, reactions, and breakout rooms for live sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$In-person event tools$q$, $q$Registration, badge printing, check-in systems, and mobile apps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Virtual and hybrid events$q$, $q$Unified experiences for combined in-person and virtual audiences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$On-demand content$q$, $q$Video hubs, learning platforms, resource libraries, and community features.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$AI capabilities$q$, $q$Content generation, personalization, insights, and lead scoring.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Full-service email marketing$q$, $q$Built-in invitation and follow-up communications.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$API access$q$, $q$Available on Enterprise and above, alongside Zapier integration.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Rated 4.7/5 on G2, 4.8/5 on Capterra, and 4.9/5 on GetApp$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Supports up to 500,000 live attendees on Enterprise+$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Customers include Amazon, Microsoft, Canva, TED, and PMI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Covers webinars, virtual/hybrid, and in-person events in one platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$No public pricing — every tier requires a sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$No free trial or free plan advertised on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Advanced features like API access, evergreen webinars, and SSO are reserved for higher tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$How much does BigMarker cost?$q$, $q$Pricing is not published; all tiers (Basic, Enterprise, Enterprise+) require contacting sales for a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$How many attendees can BigMarker support?$q$, $q$Up to 10,000 live attendees on Enterprise and up to 500,000 on Enterprise+.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$How long has BigMarker been operating?$q$, $q$BigMarker's site footer indicates operation since 2010.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Does BigMarker offer AI features?$q$, $q$Yes, including AI content generation, personalization, insights, and lead scoring.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Enterprise webinar programs$q$, $q$Large organizations running high-volume webinar and demand-generation programs.$q$, $q$Enterprise marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Hybrid conferences$q$, $q$Organizations combining in-person and virtual attendees in a single event.$q$, $q$Event and conference organizers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Basic$q$, $q$Custom quote$q$, NULL, $q$["Up to 1,000 live attendees","1 host license","Live and on-demand webinars","Basic integrations and analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Enterprise$q$, $q$Custom quote$q$, NULL, $q$["Up to 10,000 live attendees","Evergreen webinars","API access","Zapier integration","Advanced analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$Enterprise+$q$, $q$Custom quote$q$, NULL, $q$["Up to 500,000 live attendees","White-label domains","Live translation","SSO and MFA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$overview$q$, $q$What is BigMarker?$q$, 2, ARRAY[$q$BigMarker is an AI-powered digital experience platform for hosting webinars, virtual events, in-person events, and on-demand content, operating since 2010.$q$, $q$It combines interactive webinar tools with in-person event logistics like registration and badge printing, plus on-demand video hubs, learning features, and AI-driven content generation and lead scoring.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', $q$who-its-for$q$, $q$Who BigMarker is for$q$, 2, ARRAY[$q$BigMarker targets enterprise marketing and events teams running large-scale or hybrid programs, evidenced by customers including Amazon, Microsoft, Canva, TED, and PMI, and support for up to 500,000 attendees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2958e078-5211-4d10-8a25-a1936a3d292c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Airmeet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Airmeet is an AI-powered virtual and hybrid event platform for webinars, conferences, and training programs.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$199/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Covina, California, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Airmeet powers AI-driven virtual and hybrid events, webinars, and training, with plans from $199/month and a free trial.$q$,
  og_description = $q$Airmeet powers AI-driven virtual and hybrid events, webinars, and training, with plans from $199/month and a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be0460f5-eb45-465e-80d3-8e8bfa4a7ffb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$AirGenie AI tools$q$, $q$AI-generated event summaries, blog posts, and social media content from event data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Custom branding$q$, $q$White-labeling and custom branding for events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Live engagement$q$, $q$Polls, Q&A, and emoji reactions during sessions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Breakout rooms and networking$q$, $q$Dedicated networking lounges and breakout rooms for attendees.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Gamification$q$, $q$Leaderboards to drive attendee engagement.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Large-scale capacity$q$, $q$Supports up to 50,000 concurrent attendees.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Mobile apps$q$, $q$iOS and Android apps for attendees.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Integrations$q$, $q$HubSpot integration plus 50+ other app integrations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Rated 4.6/5 on G2 from 750+ reviews; named a Leader for Enterprise and Mid-Market (Winter 2025)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$AI-generated content tools (AirGenie) built into the platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Free trial with no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Used by 4,000+ organizations including Comcast, Kaiser Permanente, and Capgemini$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Higher-tier Events plan requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Managed Events start at $4,999 per event$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Discounted annual pricing requires an upfront commitment$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Does Airmeet have a free trial?$q$, $q$Yes, a free trial is available with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$How much does Airmeet cost?$q$, $q$Premium Webinars starts at $199/month, or $167/month billed annually; the Events tier requires a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Does Airmeet have mobile apps?$q$, $q$Yes, Airmeet offers iOS and Android apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$What is AirGenie?$q$, $q$Airmeet's built-in AI tool that generates event summaries, blog posts, and social media content from event data.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Large-scale webinars$q$, $q$Organizations running webinars for up to 10,000 attendees.$q$, $q$Marketing and demand-generation teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Hybrid conferences and training$q$, $q$Organizations blending in-person and virtual attendees for conferences or training.$q$, $q$Event organizers and L&D teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Premium Webinars$q$, $q$$199/month or $167/month (annual)$q$, $q$monthly$q$, $q$["100-10,000 attendees per webinar","2 team members","Up to 150 events/year","iOS and Android apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Events$q$, $q$Custom quote$q$, NULL, $q$["In-person, virtual, and hybrid formats","5 team members","Up to 250 events/year","Free trial available"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Managed Events$q$, $q$From $4,999 per event$q$, NULL, $q$["Full-service event planning","Professional hosting","Post-event analytics"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$Agency Plan$q$, $q$Custom quote$q$, NULL, $q$["Zero platform fees","Unlimited registrations","Up to 250 events/year"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$overview$q$, $q$What is Airmeet?$q$, 2, ARRAY[$q$Airmeet is an AI-powered virtual and hybrid event platform for webinars, conferences, townhalls, and training programs, headquartered in Covina, California.$q$, $q$Its AirGenie AI tools generate event summaries, blog posts, and social content from event data, alongside core features like breakout rooms, gamified leaderboards, and support for up to 50,000 concurrent attendees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', $q$who-its-for$q$, $q$Who Airmeet is for$q$, 2, ARRAY[$q$Airmeet is used by marketing and event teams running large webinars and hybrid conferences, with a customer base of 4,000+ organizations including Comcast, Kaiser Permanente, and Capgemini.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0460f5-eb45-465e-80d3-8e8bfa4a7ffb', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Goldcast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-first B2B video platform for hosting webinars and virtual events, then repurposing recordings into clips, blogs, and social posts.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Goldcast is an AI B2B video platform for webinars, virtual events, recording, and repurposing content into clips and social posts.$q$,
  og_description = $q$Goldcast is an AI B2B video platform for webinars, virtual events, recording, and repurposing content into clips and social posts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ebccc093-34ed-4258-b26b-8a95b2400c1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Digital Events$q$, $q$Host webinars and virtual events with a polished, Netflix-style presentation experience.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Recording Studio$q$, $q$Capture HD video locally with individual tracks and dynamic scene changes for podcasts and testimonials.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Content Lab$q$, $q$AI agents transform long-form event and recording footage into clips, blogs, and social posts automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Video Hubs$q$, $q$Host on-demand video libraries with built-in engagement tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$AI Search$q$, $q$Makes video content searchable so viewers can find specific moments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Agentic Video Editor$q$, $q$AI-powered editing tools assist with clip creation and brand polishing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Analytics & Dashboards$q$, $q$Measures engagement and reports on webinar and content performance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$AI-driven Content Lab repurposes long-form video into clips, blogs, and social posts automatically$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Native integrations with major marketing and CRM tools including Marketo, HubSpot, Eloqua, and Salesforce$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Combines event hosting, a recording studio, and on-demand video hubs in a single platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Used by recognizable B2B brands such as Intercom, FullStory, Hootsuite, and Brandwatch$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$No public pricing is listed; all plans require a demo or sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Founding year, headquarters, and company size are not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Custom plan features like SSO and multi-language support are gated behind enterprise-tier bundles$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$What is Goldcast used for?$q$, $q$Goldcast is used for hosting B2B webinars and virtual events, recording video content, and automatically repurposing it into clips, blogs, and social posts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Does Goldcast integrate with CRM or marketing automation tools?$q$, $q$Yes, Goldcast has native integrations with Marketo, HubSpot, Eloqua, and Salesforce.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Is Goldcast pricing publicly available?$q$, $q$No, Goldcast's pricing page outlines plan categories (Content Lab, Recording Studio, Digital Events, Custom) but requires contacting sales or requesting a demo for costs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Does Goldcast use AI?$q$, $q$Yes, Goldcast uses AI in its Content Lab for repurposing, an Agentic Video Editor, AI Highlight Reels, and AI Search.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$B2B webinars and virtual events$q$, $q$Host demand-generation webinars and virtual summits with an engaging presentation format.$q$, $q$Demand generation and event marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Video content repurposing$q$, $q$Turn webinar and event recordings into clips, blog posts, and social content using the Content Lab.$q$, $q$Content marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$Podcast and testimonial recording$q$, $q$Use the Recording Studio to capture HD video with individual tracks for podcasts and customer testimonials.$q$, $q$Marketing operations and content creators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$overview$q$, $q$What is Goldcast?$q$, 2, ARRAY[$q$Goldcast is an AI-first B2B video content platform used to host webinars and virtual events, record video with a built-in studio, and repurpose that footage into clips, blogs, and social posts.$q$, $q$Its Content Lab feature uses AI agents to automatically generate multi-modal assets from long-form video, while Video Hubs let teams host on-demand libraries with engagement tracking. Goldcast integrates natively with Marketo, HubSpot, Eloqua, and Salesforce.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', $q$who-its-for$q$, $q$Who Goldcast is for$q$, 2, ARRAY[$q$Goldcast is built for demand generation, event marketing, and content marketing teams that run B2B webinars and virtual events and want to turn that video into ongoing content, rather than for general-purpose video conferencing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebccc093-34ed-4258-b26b-8a95b2400c1e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bizzabo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bizzabo is an Event Experience OS for B2B conferences, offering registration, a mobile app, networking, and Klik SmartBadges.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$17,999/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bizzabo is an event management platform for B2B conferences with registration, a mobile app, networking, and onsite smart badges.$q$,
  og_description = $q$Bizzabo is an event management platform for B2B conferences with registration, a mobile app, networking, and onsite smart badges.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ef81f2cc-5d19-4029-abc4-98bb85afba1c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ef81f2cc-5d19-4029-abc4-98bb85afba1c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Event Experience OS$q$, $q$Core platform for registration, ticketing, contact management, and event website/agenda building.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Bizzy AI attendee copilot$q$, $q$An AI assistant built into the platform to support attendees during events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Branded mobile event app$q$, $q$Mobile app with push notifications and real-time agenda access, customizable to the event brand.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Klik SmartBadges$q$, $q$Wearable contactless badges enabling interactive networking, lead capture, and passive attendee tracking with live analytics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Attendee networking and matchmaking$q$, $q$Tools to connect attendees with relevant peers, speakers, and sponsors.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Video streaming and broadcasting$q$, $q$Supports streaming and broadcast capabilities for hybrid and virtual sessions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Open API and integrations$q$, $q$Embedded integrations plus an open API connecting to 2,500+ core business systems.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Sponsor, exhibitor, and speaker management$q$, $q$Tools for managing sponsor lead capture, exhibitor logistics, and speaker portals.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Recognized as a G2 Leader across multiple enterprise categories with 437+ reviews rated 4.5+ stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Broad integration ecosystem of 2,500+ core business systems plus an open API$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Combines registration, mobile app, networking, streaming, and onsite Klik SmartBadge hardware in one suite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Used by large, recognizable organizations including Amazon, HubSpot, Bloomberg, and Snowflake$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Base Event Experience OS plan starts at $17,999/year with a 3-user minimum, an enterprise-level commitment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Klik SmartBadge hardware and premium add-ons (virtual experience, advanced onsite software, sponsor/speaker portals) are priced separately via custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Founding year, headquarters, and company size are not published on the pages reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$How much does Bizzabo cost?$q$, $q$The core Event Experience Operating System plan starts at $499 per user/month billed annually, with a 3-user minimum, totaling $17,999/year. Klik SmartBadges and premium add-ons are custom-quoted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Does Bizzabo have a mobile app?$q$, $q$Yes, Bizzabo offers a branded mobile event app with push notifications and agenda access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$What is Bizzy?$q$, $q$Bizzy is Bizzabo's AI attendee copilot, built into the platform to enhance the event experience.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Does Bizzabo support onsite or hybrid events?$q$, $q$Yes, through Klik SmartBadges for onsite networking and lead capture, plus video streaming for hybrid and virtual sessions.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Does Bizzabo have an API?$q$, $q$Yes, Bizzabo provides embedded integrations and an open API connecting to 2,500+ business systems.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Large-scale B2B conferences$q$, $q$Run registration, ticketing, agendas, and networking for major B2B conferences.$q$, $q$Event marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Corporate and internal training events$q$, $q$Manage internal company events and training sessions with the same Event Experience OS.$q$, $q$Corporate event teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Association and nonprofit events$q$, $q$Support membership and fundraising events with registration and attendee engagement tools.$q$, $q$Associations and nonprofits$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Higher education events$q$, $q$Run conferences and events for academic institutions.$q$, $q$Higher education event organizers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Event Experience Operating System$q$, $q$$499/user/month (3-user minimum, ~$17,999/year)$q$, $q$annual$q$, $q$["Unlimited events and registrations","Contact management and ticketing","Email campaigns and event website builder","Advanced registration flows and mobile app","Reporting and analytics","Tiered customer support with 24/7/365 availability"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Klik SmartBadge (Experiential Onsite)$q$, $q$Custom quote$q$, NULL, $q$["Branded smart badges with interactive networking","Lead capture and gamification","Passive attendee tracking and live analytics","Third-party app and system integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$Premium Add-ons$q$, $q$Custom quote$q$, NULL, $q$["Virtual event experience","Advanced onsite software","Martech/CRM integrations","Sponsor and speaker portals","Networking tools","Custom-branded apps","API access and SSO"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$overview$q$, $q$What is Bizzabo?$q$, 2, ARRAY[$q$Bizzabo is an event management platform Bizzabo calls an 'Event Experience Operating System,' built for B2B conferences and large-scale corporate events. It covers registration, ticketing, website and agenda creation, a mobile event app, attendee networking, and sponsor/exhibitor/speaker management.$q$, $q$The platform also includes Klik SmartBadges, wearable contactless devices for onsite networking and lead capture, an AI attendee copilot called Bizzy, and an open API connecting to 2,500+ business systems. Its base plan starts at $499 per user/month billed annually with a 3-user minimum.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', $q$who-its-for$q$, $q$Who Bizzabo is for$q$, 2, ARRAY[$q$Bizzabo is aimed at event marketing and corporate event teams running B2B conferences, internal training, association events, or higher education events that need registration, onsite hardware, and networking tools in one enterprise-priced platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ef81f2cc-5d19-4029-abc4-98bb85afba1c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SpotMe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SpotMe is an enterprise event engagement platform, focused on life sciences and pharma, that syncs attendee data to CRM systems.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Lausanne, Switzerland$q$,
  languages = '{}',
  seo_meta_description = $q$SpotMe is an enterprise event platform for life sciences and pharma, with mobile apps, CRM sync, and compliance certifications.$q$,
  og_description = $q$SpotMe is an enterprise event platform for life sciences and pharma, with mobile apps, CRM sync, and compliance certifications.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f78d10ab-b34b-493a-9c96-2e256f6d8c27';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f78d10ab-b34b-493a-9c96-2e256f6d8c27' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Registration and check-in$q$, $q$Streamlined attendee registration and event check-in.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Mobile event app$q$, $q$iOS and Android apps with real-time agenda access for attendees.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Attendee networking and matchmaking$q$, $q$Connects attendees with relevant peers and contacts at events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Interactive engagement tools$q$, $q$Polls, Q&A, gamification, and word clouds to drive session engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Multi-stream agenda management$q$, $q$Manages complex agendas with multiple concurrent session streams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$CRM and MarTech integrations$q$, $q$Connects with Salesforce, HubSpot, Marketo, Pardot, Eloqua, Veeva, RainFocus, and Swoogo.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Post-event content distribution$q$, $q$Delivers on-demand recordings and content after events end.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Analytics$q$, $q$Tracks registration, session engagement, and content consumption data.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Deep focus on life sciences and pharma events, including a Veeva integration for compliance-sensitive workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$GDPR, SOC2 Type II, and ISO 27001 compliant$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Named a Leader in The Forrester Wave: All-In-One Event Management Platforms, Q4 2024$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Supports in-person, hybrid, virtual, webinar, and on-demand formats on one platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Native iOS and Android mobile apps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$No public pricing; all four tiers (Starter, Business, Advanced, Enterprise) require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Plans are capped by event count (e.g., 2 events on Starter, 5 on Business, 25 on Advanced), requiring an upgrade as usage grows$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Production add-on services (onsite coordination, live production, interpretation) cost an additional $3,080-$7,700+$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$What is SpotMe used for?$q$, $q$SpotMe is an enterprise event engagement platform used to run in-person, hybrid, virtual, and on-demand events, with a strong focus on life sciences and pharmaceutical companies.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Does SpotMe have a mobile app?$q$, $q$Yes, SpotMe offers web and mobile apps for both iOS and Android with real-time agenda access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$What integrations does SpotMe support?$q$, $q$SpotMe integrates with Salesforce, HubSpot, Marketo, Pardot, Eloqua, Veeva, RainFocus, and Swoogo.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Is SpotMe compliant with data regulations?$q$, $q$Yes, SpotMe is GDPR, SOC2 Type II, and ISO 27001 compliant.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Does SpotMe publish its pricing?$q$, $q$No, SpotMe offers four tiers (Starter, Business, Advanced, Enterprise) distinguished by event count and features, but all require contacting sales for exact pricing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Life sciences and pharma events$q$, $q$Run compliance-sensitive conferences and roadshows with Veeva integration and certified data security.$q$, $q$Life sciences and pharmaceutical companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Hosted conferences and field marketing events$q$, $q$Manage registration, agendas, and networking for hosted conferences and field marketing programs.$q$, $q$Professional services and enterprise event teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Hybrid and virtual events$q$, $q$Deliver in-person, hybrid, virtual, webinar, and on-demand event formats from one platform.$q$, $q$Enterprise event organizers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Starter$q$, $q$Contact sales$q$, NULL, $q$["Up to 2 events","Unlimited participants and admins","Web and mobile apps (iOS/Android)","80+ engagement features","24/7 support with 30-second response"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Business$q$, $q$Contact sales$q$, NULL, $q$["Up to 5 events","Unlimited participants and admins","Web and mobile apps","80+ engagement features","24/7 support","Marketo, Cvent, and 6 additional integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Advanced$q$, $q$Contact sales$q$, NULL, $q$["Up to 25 events","Branded App Store/Google Play app","App single sign-on","All Business plan features included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$Enterprise$q$, $q$Contact sales$q$, NULL, $q$["Unlimited events","CMS single sign-on","All Advanced plan features included"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$overview$q$, $q$What is SpotMe?$q$, 2, ARRAY[$q$SpotMe is an enterprise event engagement platform headquartered in Lausanne, Switzerland. It provides registration, check-in, mobile apps, networking, and multi-stream agenda tools for in-person, hybrid, virtual, and on-demand events, syncing attendee interaction data to CRM systems.$q$, $q$SpotMe integrates with Salesforce, HubSpot, Marketo, Pardot, Eloqua, Veeva, RainFocus, and Swoogo, and is GDPR, SOC2 Type II, and ISO 27001 compliant. It was named a Leader in The Forrester Wave: All-In-One Event Management Platforms, Q4 2024.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', $q$who-its-for$q$, $q$Who SpotMe is for$q$, 2, ARRAY[$q$SpotMe is built for enterprise organizers running hosted conferences, roadshows, and field marketing events, with particular strength in life sciences and pharmaceutical use cases that require compliance certifications and Veeva integration.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f78d10ab-b34b-493a-9c96-2e256f6d8c27', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Whova ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$All-in-one event management platform with an award-winning app for in-person, hybrid, and virtual events.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Diego, CA, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Whova: event management platform with registration, an award-winning event app, exhibitor tools, and hybrid/virtual streaming.$q$,
  og_description = $q$Whova: event management platform with registration, an award-winning event app, exhibitor tools, and hybrid/virtual streaming.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c5bc7207-b92e-4b19-96fd-fdb155854d9f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c5bc7207-b92e-4b19-96fd-fdb155854d9f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Event App$q$, $q$A top-rated mobile event app that gives attendees personalized agendas, real-time updates, and networking tools, with the goal of helping attendees build more connections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Registration & Ticketing$q$, $q$Flexible online registration and ticketing options for organizers to manage attendee sign-ups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Event Management Tools$q$, $q$Tools for badges, check-in, surveys, and certificates to handle on-site and post-event logistics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Abstract Management / Call for Speakers$q$, $q$Workflow for collecting and managing speaker submissions and abstracts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Event Website Builder$q$, $q$A website builder with 20+ templates for creating an event's public-facing site.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Exhibitor & Sponsor Management$q$, $q$Tools for managing exhibitors and sponsors, including lead retrieval capabilities.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Hybrid & Virtual Events$q$, $q$Live streaming support for running hybrid and virtual event formats alongside in-person events.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$MicroEvents$q$, $q$A feature set for managing smaller, sub-events (MicroEvents) within a larger event program.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Covers the full event lifecycle in one platform: registration, app, on-site tools, and exhibitor/sponsor management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Mobile event app is positioned as award-winning and top-rated for networking$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Recognized with a G2 'Global Top 50' award$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Featured in Forbes, Inc., and San Diego Business Journal, indicating industry recognition$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Offers dedicated tooling for both fully virtual and hybrid event formats, not just in-person$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$No public pricing is listed; organizers must request a quote or book a demo to learn costs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Specific platform support (iOS/Android/web) and language support are not detailed on the marketing pages reviewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$No documented AI features on the pages reviewed$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Free trial is only available by booking a 1:1 demo, not self-serve$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Does Whova publish its pricing?$q$, $q$No. Whova's pricing page directs visitors to request a custom quote based on event format, duration, expected attendees, and annual event frequency, or to book a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Can I try Whova before buying?$q$, $q$Whova's pricing page offers a '20 min 1:1 demo to get a trial,' rather than a self-serve free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$What types of events does Whova support?$q$, $q$Whova is built for in-person, hybrid, and virtual events, including support for smaller MicroEvents within a larger event program.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$What does the Whova event app do?$q$, $q$It gives attendees personalized agendas, real-time updates, live polls, messaging, photo sharing, and live announcements, and is marketed as helping attendees build more connections.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Does Whova support exhibitors and sponsors?$q$, $q$Yes, Whova includes exhibitor and sponsor management tools with lead retrieval capabilities.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Conference and event organizers$q$, $q$Manage registration, ticketing, badges, check-in, and surveys for a single event from one platform.$q$, $q$Event planners and organizers running in-person or hybrid conferences$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Hybrid and virtual event programs$q$, $q$Run live-streamed sessions for remote attendees alongside an in-person event.$q$, $q$Organizations running hybrid or fully virtual events$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Exhibitor and sponsor-driven events$q$, $q$Give exhibitors and sponsors dedicated management tools and lead retrieval within the event app.$q$, $q$Trade shows and sponsor-funded conferences$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$Multi-track or multi-event programs$q$, $q$Use MicroEvents to manage smaller sub-events nested within a larger event program.$q$, $q$Organizers running multi-track conferences or event series$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$overview$q$, $q$What is Whova?$q$, 2, ARRAY[$q$Whova is an all-in-one event management platform for in-person, hybrid, and virtual events, headquartered in San Diego, CA. It combines registration and ticketing, an attendee-facing mobile event app, on-site management tools (badges, check-in, surveys, certificates), an event website builder, and exhibitor/sponsor management with lead retrieval.$q$, $q$The platform has been recognized with a G2 'Global Top 50' award and has been covered by outlets including Forbes, Inc., and the San Diego Business Journal. Whova does not publish self-serve pricing; organizers get a custom quote based on event details or book a demo.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', $q$who-its-for$q$, $q$Who Whova is for$q$, 2, ARRAY[$q$Whova is aimed at event organizers and planners running conferences, trade shows, and multi-track events that need registration, an attendee app, and exhibitor/sponsor tools in one system, spanning in-person, hybrid, and virtual formats.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5bc7207-b92e-4b19-96fd-fdb155854d9f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Cvent ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered event management platform for registration, venue sourcing, mobile apps, and event ROI reporting.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 1999,
  company_size = $q$Approximately 5,500 employees$q$,
  headquarters = $q$Tysons Corner, VA, United States$q$,
  languages = ARRAY[$q$English$q$, $q$Deutsch$q$]::text[],
  seo_meta_description = $q$Cvent: AI-powered event management platform for registration, venue sourcing, mobile apps, check-in, and event ROI reporting.$q$,
  og_description = $q$Cvent: AI-powered event management platform for registration, venue sourcing, mobile apps, check-in, and event ROI reporting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cbe1e28b-dacb-4d22-9f38-e5cc9dceeace';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cbe1e28b-dacb-4d22-9f38-e5cc9dceeace' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Registration & Marketing$q$, $q$Tools for building event registration flows and running event marketing campaigns.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Venue Sourcing$q$, $q$Access to a network of 340,000+ venues and support for sourcing RFPs, with 300,000+ unique RFPs sourced annually across the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Event Diagramming$q$, $q$Tools for creating floor plans and event space diagrams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Speaker Management$q$, $q$Tools for managing speakers as part of event planning.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Mobile Event Apps$q$, $q$Mobile apps for attendees to access event information on-site.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Check-in & Badging$q$, $q$On-site check-in and badge printing tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Trade Show Lead Capture & Lead Retrieval$q$, $q$Tools for exhibitors to capture and retrieve leads at trade shows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$CventIQ (AI)$q$, $q$Cvent's AI layer, described as applying AI across the event program from initial venue search through final ROI reporting.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Broad platform covering the full event lifecycle: sourcing, registration, on-site execution, and reporting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Large venue sourcing network (340,000+ venues) and high RFP volume (300,000+ sourced annually)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Used by 89% of the Fortune 100 and 34,000+ customers globally, per company-stated figures$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$25+ years of operating history in the event technology category (founded 1999)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Dedicated AI layer (CventIQ) built into the platform for venue search through ROI reporting$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Committing $1B+ in product investment between July 2026 and July 2029, per company statements$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$No public self-serve pricing; only a free trial for event registration and demo requests are offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Platform breadth (many modules) may be more than smaller organizers need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Stated language support on the homepage is limited to English and Deutsch$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Does Cvent publish its pricing?$q$, $q$No public pricing is disclosed. Cvent offers a free event registration trial and demo requests instead of listed plan prices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$When was Cvent founded and where is it based?$q$, $q$Cvent was founded in 1999 by Reggie Aggarwal and is headquartered at 1765 Greensboro Station Place, 7th Floor, Tysons Corner, VA 22102.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Does Cvent have AI features?$q$, $q$Yes. Cvent's AI capabilities are branded CventIQ, which the company describes as applying AI across the event program from venue search to final ROI reporting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$How many venues and customers does Cvent's network include?$q$, $q$Cvent states its ecosystem includes 340,000+ venues, 150,000+ active planners, and 34,000+ customers globally, with 8M+ events managed on the platform.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$What does Cvent offer for trade shows and exhibitors?$q$, $q$Cvent provides trade show lead capture and lead retrieval tools for exhibitors.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Corporate event programs$q$, $q$Manage registration, marketing, venue sourcing, and reporting for corporate events at scale.$q$, $q$Enterprise event and marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Venue and RFP sourcing$q$, $q$Search and source venues through Cvent's network of 340,000+ venues and submit RFPs.$q$, $q$Event planners and hospitality/travel managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Trade shows and exhibitions$q$, $q$Run on-site check-in, badging, and exhibitor lead capture/retrieval for trade show events.$q$, $q$Trade show organizers and exhibitors$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$Webinars and virtual experiences$q$, $q$Run virtual experiences and webinars through Cvent's virtual experience platform.$q$, $q$Marketing and event professionals running virtual programs$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$overview$q$, $q$What is Cvent?$q$, 2, ARRAY[$q$Cvent is an AI-powered event management platform founded in 1999 by Reggie Aggarwal and headquartered in Tysons Corner, VA. It covers registration and marketing, venue sourcing and RFPs, event diagramming, speaker management, mobile event apps, check-in and badging, trade show lead capture, virtual experiences, webinars, and event reporting.$q$, $q$The company states its platform has managed 8M+ events, serves 34,000+ customers globally, and is used by 89% of the Fortune 100. Its ecosystem includes 340,000+ venues and 150,000+ active planners, with 300,000+ unique RFPs sourced annually. Cvent's AI capabilities are branded CventIQ, applied from venue search through ROI reporting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', $q$who-its-for$q$, $q$Who Cvent is for$q$, 2, ARRAY[$q$Cvent targets event, marketing, hospitality, and travel management professionals running corporate events, trade shows, and virtual/hybrid programs that need venue sourcing, registration, on-site execution, and ROI reporting in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cbe1e28b-dacb-4d22-9f38-e5cc9dceeace', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── EventMobi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Event management platform for websites, registration, check-in, badge printing, mobile apps, and virtual events.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$3,000/event (or $8,900/year for unlimited events)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Toronto, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$EventMobi: event websites, registration, check-in, badge printing, and virtual/hybrid tools. Plans from $3,000/event or $8,900/year.$q$,
  og_description = $q$EventMobi: event websites, registration, check-in, badge printing, and virtual/hybrid tools. Plans from $3,000/event or $8,900/year.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '23d382d0-21fb-4b8d-ba10-31236baa07ed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '23d382d0-21fb-4b8d-ba10-31236baa07ed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Event websites & registration$q$, $q$Build event websites and manage attendee registration flows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Onsite check-in & badge printing$q$, $q$Check attendees in and print badges onsite, with hardware rental options available.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Event mobile app$q$, $q$A branded mobile app for attendees to navigate the event.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$GoLive virtual event platform$q$, $q$Run virtual or hybrid sessions with streaming and video storage add-ons.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Exhibitor lead capture$q$, $q$Tools for exhibitors to capture and qualify leads onsite.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Gamification & networking$q$, $q$Appointment booking, live polls, and gamification to drive engagement.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$MobiAI / AI Reg Concierge$q$, $q$AI-branded features including an AI-powered registration concierge.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$1000+ integrations$q$, $q$Standard integrations plus a free API and Zapier connection.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Publishes actual starting prices ($3,000/event or $8,900/year) rather than requiring a quote for baseline plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Supports 27 languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$SOC 2 Type II, ISO 27001, GDPR, and PCI-DSS Level 1 compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Free trial available after a personalized demo$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$1000+ integrations including a free API and Zapier connection$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$No self-serve free plan; a demo is required to unlock the free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Additional costs apply for badge hardware rental, streaming/video storage, and custom integrations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Full year-round or multi-event pricing still requires a custom quote$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Founding year and company employee count are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Does EventMobi have a free plan?$q$, $q$No. EventMobi does not offer a free plan, but a free trial is available after a personalized demo and platform walkthrough.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$How much does EventMobi cost?$q$, $q$Per Event pricing starts at $3,000 per event; Per Year pricing for unlimited events starts at $8,900 annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Does EventMobi support multiple languages?$q$, $q$Yes, EventMobi's platform supports 27 languages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Is EventMobi compliant with data security standards?$q$, $q$Yes, EventMobi is SOC 2 Type II certified, ISO 27001 infrastructure, GDPR compliant, and PCI-DSS Level 1 for payments.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Does EventMobi support virtual or hybrid events?$q$, $q$Yes, via its GoLive virtual event platform, with streaming and video storage available as add-ons starting at $500 per event.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Corporate conferences$q$, $q$End-to-end event website, registration, check-in, and app tools for corporate events.$q$, $q$Corporate event teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Association and nonprofit events$q$, $q$Special pricing is available for non-profits and multi-year contracts.$q$, $q$Associations and nonprofits$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Trade shows and exhibitor events$q$, $q$Exhibitor lead capture and badge printing for trade show organizers.$q$, $q$Exhibitors and event organizers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Per Event$q$, $q$$3,000+$q$, NULL, $q$["Registration","Badge printing","Check-in","Event app","Lead capture","Virtual event capabilities","Phone, email, and live chat support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$Per Year$q$, $q$$8,900+$q$, $q$annual$q$, $q$["Unlimited events on the end-to-end platform","Lowest per-attendee cost","Dedicated Event Success Manager","Quarterly business reviews"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$overview$q$, $q$What is EventMobi?$q$, 2, ARRAY[$q$EventMobi is an event management platform that combines event websites, registration, onsite check-in, badge printing, a mobile event app, and a virtual/hybrid platform called GoLive into one system.$q$, $q$The platform publishes baseline starting prices — $3,000 per event or $8,900 per year for unlimited events — rather than requiring a sales quote for every tier, and includes MobiAI-branded features such as an AI Reg Concierge.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', $q$who-its-for$q$, $q$Who EventMobi is for$q$, 2, ARRAY[$q$EventMobi is aimed at associations, nonprofits, corporations, and event agencies running conferences, trade shows, and hybrid events, with special pricing offered for non-profits and multi-year contracts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23d382d0-21fb-4b8d-ba10-31236baa07ed', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Swapcard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered event platform for registration, matchmaking, exhibitor management, and analytics at trade shows.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Swapcard: AI matchmaking, registration, exhibitor tools, and analytics for trade shows and conferences. Starter, Professional, and Enterprise plans.$q$,
  og_description = $q$Swapcard: AI matchmaking, registration, exhibitor tools, and analytics for trade shows and conferences. Starter, Professional, and Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Flexible ticketing & registration$q$, $q$Configure registration flows and flexible ticket pricing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Sherlock AI matchmaking$q$, $q$AI-powered attendee matching and personalized recommendations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Exhibitor management portal & marketplace$q$, $q$Tools for exhibitors to manage presence and participate in a marketplace.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Lead capture & qualification$q$, $q$Capture and qualify leads for exhibitors and sponsors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Mobile app$q$, $q$iOS and Android event app reported to reach 70-80% attendee adoption.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Analytics & reporting$q$, $q$Dashboards covering event and attendee engagement data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Onsite check-in & badge printing$q$, $q$Check attendees in and print badges onsite.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$30+ native integrations$q$, $q$Native integrations including Salesforce and HubSpot.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Sherlock AI provides AI-driven matchmaking and personalized attendee recommendations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Native iOS and Android apps with reported 70-80% attendee adoption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$30+ native integrations including Salesforce and HubSpot$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$SOC 2 Type 2, ISO 27001, and GDPR compliance across all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Starter plan includes a free trial$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$No public pricing for any plan; Starter, Professional, and Enterprise all require custom quotes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Annual billing only, with no monthly option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Downgrades are only permitted at term renewal$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Attendee/exhibitor caps (Starter: 200/year, Professional: 1,000/year) may require paid add-on packages$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Does Swapcard offer a free trial?$q$, $q$Yes, the Starter plan offers a free trial; Professional and Enterprise require scheduling a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$What plans does Swapcard offer?$q$, $q$Starter (up to 200 attendees/year), Professional (up to 1,000 attendees/year), and Enterprise (unlimited attendees).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Does Swapcard have mobile apps?$q$, $q$Yes, native iOS and Android apps are available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$What AI features does Swapcard include?$q$, $q$Sherlock AI powers matchmaking, personalized recommendations, AI agents for attendee support, and predictive analytics.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Is Swapcard billed monthly or annually?$q$, $q$Swapcard uses annual subscriptions only, with Net 30 days payment terms.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Trade show organizers$q$, $q$Exhibitor marketplace, lead capture, and hosted buyer program coordination.$q$, $q$Trade show organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Association & conference events$q$, $q$Registration, session management, and AI matchmaking for conferences.$q$, $q$Associations and conference organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Media and nonprofit events$q$, $q$Analytics and engagement tools for media companies and nonprofits.$q$, $q$Media companies and nonprofits$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Starter$q$, $q$Custom quote$q$, $q$annual$q$, $q$["Up to 200 attendees/year","Organizer Studio with unlimited seats","Free trial available","SOC 2 Type 2, ISO 27001, GDPR compliance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Professional$q$, $q$Custom quote$q$, $q$annual$q$, $q$["Up to 1,000 attendees/year","Organizer Studio with unlimited seats","Added support services"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Enterprise$q$, $q$Custom quote$q$, $q$annual$q$, $q$["Unlimited attendees","Organizer Studio with unlimited seats","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$overview$q$, $q$What is Swapcard?$q$, 2, ARRAY[$q$Swapcard is an event management platform built around AI-powered matchmaking (branded 'Sherlock AI'), covering registration, exhibitor management, lead capture, and analytics for trade shows, conferences, and associations.$q$, $q$It offers three annually billed tiers — Starter (up to 200 attendees/year), Professional (up to 1,000 attendees/year), and Enterprise (unlimited attendees) — with pricing set through a custom quote combining a license fee and attendee/exhibitor volume.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$who-its-for$q$, $q$Who Swapcard is for$q$, 2, ARRAY[$q$Swapcard targets trade show organizers, associations, conference organizers, media companies, and nonprofits that need exhibitor marketplaces, lead qualification, and AI-driven attendee matchmaking.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Brella ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-driven event networking platform with matchmaking, meeting scheduling, and white-labeled event apps.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Brella: AI-driven matchmaking, meeting scheduling, and a white-labeled event app for conferences and tradeshows.$q$,
  og_description = $q$Brella: AI-driven matchmaking, meeting scheduling, and a white-labeled event app for conferences and tradeshows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fe53f9a3-19f4-4579-b9ed-212212081f85';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fe53f9a3-19f4-4579-b9ed-212212081f85' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$White-labeled event app$q$, $q$A customizable, white-labeled app for virtual, physical, and hybrid events.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$AI-driven matchmaking$q$, $q$Intent-based, customizable matchmaking highlighting attendee interests, aimed at high meeting acceptance rates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Lead scanning & meeting ratings$q$, $q$Scan leads and rate meetings during the event.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Group & managed meetings$q$, $q$Schedule group and managed meetings with custom locations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Sponsor booths & matchmaking$q$, $q$Sponsor booth tools with matchmaking for exhibitors.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$500+ integrations & public API$q$, $q$A wide selection of native integrations plus a public API and managed integration services.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Flexible event scheduling$q$, $q$Multiple layout options for scheduling sessions and meetings.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Analytics$q$, $q$Reporting on attendance, engagement, and market trends.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$AI-driven, intent-based matchmaking that highlights attendee interests$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Native iOS and Android apps plus a web app and embeddable widgets$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$500+ integration options with a public API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Reports a 9.5/10 NPS score for its service team$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Used by known event organizers including Bits & Pretzels, Financial Times, Informa Markets, RX, Forbes, and SXSW Sydney$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$No public pricing; requires contacting sales ('Talk to an event expert')$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$No published free trial or free plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Does Brella publish pricing?$q$, $q$No. Brella directs prospects to talk to an event expert or contact sales for a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Does Brella use AI?$q$, $q$Yes, Brella uses intent-based, customizable AI matchmaking and AI-powered prospecting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$What platforms does Brella support?$q$, $q$Native iOS and Android apps, a web app, embeddable widgets, and admin/sponsor portals.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$How many integrations does Brella offer?$q$, $q$Brella offers 500+ integration options plus a public API.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Who uses Brella?$q$, $q$Associations, corporations, conferences, tradeshows, academic events, and internal events; listed clients include Financial Times, Forbes, and SXSW Sydney.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Conference & tradeshow networking$q$, $q$AI matchmaking and meeting scheduling to drive attendee connections.$q$, $q$Conference and tradeshow organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Association & corporate events$q$, $q$White-labeled app and analytics for association, corporate, and academic events.$q$, $q$Associations and corporate event teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$Sponsor & exhibitor engagement$q$, $q$Sponsor booth matchmaking and lead scanning tools.$q$, $q$Sponsors and exhibitors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$overview$q$, $q$What is Brella?$q$, 2, ARRAY[$q$Brella is an event platform focused on networking and matchmaking, offering a white-labeled event app with AI-driven, intent-based matchmaking designed to increase meeting acceptance rates.$q$, $q$It provides group and managed meeting scheduling, lead scanning, sponsor booth matchmaking, 500+ integrations plus a public API, and analytics on attendance, engagement, and market trends. Pricing is not published and requires contacting sales.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', $q$who-its-for$q$, $q$Who Brella is for$q$, 2, ARRAY[$q$Brella is built for associations, corporations, conferences, tradeshows, academic events, and internal events that prioritize attendee networking and AI-driven matchmaking.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe53f9a3-19f4-4579-b9ed-212212081f85', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Grip ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered event platform for matchmaking, pre-scheduled meetings, and exhibitor and lead management.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Grip: AI-powered matchmaking, pre-scheduled meetings, and exhibitor/lead management for events. Founded 2016, London.$q$,
  og_description = $q$Grip: AI-powered matchmaking, pre-scheduled meetings, and exhibitor/lead management for events. Founded 2016, London.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '085a00b0-0152-462a-8236-efd96d4561c7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '085a00b0-0152-462a-8236-efd96d4561c7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$AI-powered matchmaking engine$q$, $q$Connects attendees based on data analysis of interests and preferences.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$AI Assistant$q$, $q$Resolves participant queries during events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Pre-scheduled meeting automation$q$, $q$Automates scheduling of meetings between attendees ahead of the event.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Onsite solutions$q$, $q$Badge printing, entrance scanning, smart badges, and location tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Lead retrieval & scanning$q$, $q$Tools for exhibitors to retrieve and scan leads.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Interactive floor plans & wayfinding$q$, $q$Help attendees navigate the event venue.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Calendar sync & notifications$q$, $q$Syncs meetings to attendee calendars with notifications.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Registration & exhibitor management$q$, $q$Event registration alongside sponsor and exhibitor management tools.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$AI matchmaking engine described by Grip as connecting attendees via data analysis of interests and preferences$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Dedicated AI Assistant for resolving attendee queries during events$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Established track record: founded in 2016, with 5,000+ events powered, 15M+ participants, and 2M+ meetings booked$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Onsite hardware options including smart badges, entrance scanning, and location tracking$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Headquartered in London with a clearly stated founding year$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$No public pricing; requires requesting a demo for a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Company size and supported languages are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Specific integration partners are not detailed publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$When was Grip founded?$q$, $q$Grip was founded in 2016.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Where is Grip headquartered?$q$, $q$Grip is headquartered in London, United Kingdom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Does Grip offer AI features?$q$, $q$Yes, Grip includes an AI-powered matchmaking engine and an AI Assistant for participant queries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$How many events has Grip powered?$q$, $q$Grip states it has powered 5,000+ events with 15 million+ participants and 2 million+ meetings booked.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Is Grip's pricing public?$q$, $q$No, Grip does not publish pricing; prospects must request a demo for a custom quote.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Trade shows & conferences$q$, $q$AI matchmaking and pre-scheduled meetings to drive attendee engagement.$q$, $q$Trade show and conference organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Hosted buyer & confex events$q$, $q$Automated meeting scheduling to facilitate business relationships.$q$, $q$Hosted buyer and confex event organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$Exhibitor lead management$q$, $q$Lead retrieval and scanning tools for sponsors and exhibitors.$q$, $q$Sponsors and exhibitors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$overview$q$, $q$What is Grip?$q$, 2, ARRAY[$q$Grip is an AI-powered event technology platform, founded in 2016 and headquartered in London, built around automated matchmaking and pre-scheduled meetings for commercial events.$q$, $q$The platform combines an AI matchmaking engine, an AI Assistant for participant queries, onsite solutions like smart badges and entrance scanning, and lead retrieval tools, and states it has powered 5,000+ events with 15 million+ participants and 2 million+ meetings booked.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', $q$who-its-for$q$, $q$Who Grip is for$q$, 2, ARRAY[$q$Grip serves event professionals running conferences, trade shows, hosted buyer events, annual meetings, and confex events who want automated, data-driven attendee matchmaking.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('085a00b0-0152-462a-8236-efd96d4561c7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Sched ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sched is an event management platform for registration, scheduling, speaker coordination, and attendee check-in at conferences.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sched: event scheduling, registration, speaker management, and a mobile event app for conferences and PD events.$q$,
  og_description = $q$Sched: event scheduling, registration, speaker management, and a mobile event app for conferences and PD events.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ddaae47-3573-4276-bcc8-70bfee3048e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ddaae47-3573-4276-bcc8-70bfee3048e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Event scheduling & session planning$q$, $q$Build multi-track schedules with room/venue assignments and personalized attendee itineraries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Registration & ticketing$q$, $q$Sell tickets and manage attendee registration directly within the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Event app$q$, $q$A web and mobile event app gives attendees access to schedules, speaker profiles, and networking tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Call for Papers$q$, $q$Collect and manage speaker and session submissions, with an advanced version available on higher tiers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Speaker management$q$, $q$Coordinate speaker profiles, communications, and session assignments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Attendee check-in & lead retrieval$q$, $q$Track attendance, print customizable badges, and capture leads on-site.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$AI event planner$q$, $q$An AI-assisted planning tool is offered to help set up events.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Compliance & security$q$, $q$SOC 2 Type II certified, and GDPR, CCPA, and FERPA compliant.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$SOC 2 Type II certified and GDPR/CCPA/FERPA compliant, relevant for schools and healthcare training organizations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$30-day free trial plus a 60-day money-back guarantee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Unlimited free events for gatherings under 50 attendees (100 on the Ultra plan)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Used by institutions including Yale, Princeton, Stanford, and Harvard$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Combines registration, scheduling, speaker management, and an event app in one platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Paid plan pricing isn't published; tiers require a 250+ attendee minimum and a sales quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Advanced features like enhanced Call for Papers and lead retrieval are locked to higher tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Useful add-on bundles (support, migration, insights) are sold separately at extra cost$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Does Sched have a free plan?$q$, $q$Yes — events with fewer than 50 attendees (100 on the Ultra plan) can run for free.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Is there a free trial?$q$, $q$Sched offers a 30-day free trial, with longer trials available on request, plus a 60-day money-back guarantee.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$What compliance certifications does Sched hold?$q$, $q$SOC 2 Type II, GDPR, CCPA, FERPA, and ISO certification.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Does Sched offer AI features?$q$, $q$Yes, Sched includes an AI event planner tool.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Who uses Sched?$q$, $q$Sched lists customers including Yale, Princeton, Stanford, Harvard, Chicago Public Schools, and the YMCA.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Professional development tracking for schools$q$, $q$K-12 and higher-ed institutions use Sched to schedule PD sessions and track PD hours for compliance reporting.$q$, $q$School districts and universities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Multi-track conferences$q$, $q$Organizers build multi-room, multi-track schedules with speaker profiles and a Call for Papers workflow.$q$, $q$Conference and convention organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Corporate learning events$q$, $q$Corporate L&D teams use Sched's registration, badge printing, and lead retrieval tools for internal training events.$q$, $q$Corporate L&D departments$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Launch$q$, $q$Contact for pricing (quote-based, 250+ attendee minimum)$q$, $q$annual$q$, $q$["Unlimited events","Web & mobile event app","Scheduling tools","Speaker profiles","Registration & ticketing","Basic Call for Papers"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Boost$q$, $q$Contact for pricing (quote-based, 250+ attendee minimum)$q$, $q$annual$q$, $q$["Everything in Launch","Attendee networking & engagement","Attendance tracking & check-in","Customizable badges","Advanced Call for Papers","Lead retrieval"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Ultra$q$, $q$Contact for pricing (quote-based, 250+ attendee minimum)$q$, $q$annual$q$, $q$["Everything in Boost","Larger free small-event allowance","Reduced ticketing fees","Onboarding & training","Priority support","Custom reporting"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["On-premise hosting","Custom features","Dedicated premium support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$overview$q$, $q$What is Sched?$q$, 2, ARRAY[$q$Sched is an event management platform that handles registration, scheduling, speaker coordination, and attendee management for conferences, conventions, professional-development events, and festivals. It has been used to run events since 2008.$q$, $q$The platform combines a web and mobile event app, a Call for Papers tool for collecting speaker submissions, on-site check-in and badge printing, and lead retrieval, alongside SOC 2 Type II, GDPR, CCPA, and FERPA compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', $q$who-its-for$q$, $q$Who Sched is for$q$, 2, ARRAY[$q$Sched is aimed at K-12 schools, higher-education institutions, nonprofits, corporate L&D departments, and healthcare and medical training organizations that need to schedule sessions, register attendees, and track professional-development hours. Sched lists customers including Yale, Princeton, Stanford, Harvard, and Chicago Public Schools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ddaae47-3573-4276-bcc8-70bfee3048e2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Sessionize ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sessionize is a cloud platform for managing conference Call for Papers, speaker submissions, and schedule building.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$499/event (Professional Event plan)$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sessionize: Call for Papers, speaker management, and schedule-building software used by 31,000+ event organizers.$q$,
  og_description = $q$Sessionize: Call for Papers, speaker management, and schedule-building software used by 31,000+ event organizers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ebd42bbd-e0eb-4348-9dec-c85d892145d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ebd42bbd-e0eb-4348-9dec-c85d892145d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Call for Papers$q$, $q$Collect and evaluate session submissions with customizable evaluation workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Speaker management$q$, $q$Communicate with speakers and manage public speaker profiles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Drag-and-drop schedule builder$q$, $q$Build and publish event schedules visually.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Mobile & web apps$q$, $q$Attendees can browse sessions and schedules via mobile and web apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Unlimited team members$q$, $q$Add unlimited collaborators to help manage an event.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Task lists & embedding$q$, $q$Track organizing tasks and embed schedules or CFP forms on external sites.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$JSON/XML export$q$, $q$Export session and schedule data for use in other systems.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Free tier available for qualifying community events$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Test mode available with no credit card required before paying$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Large existing user base: 31,000+ event organizers, 298,000+ speakers, 11,600+ events, 1.1M+ session submissions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$All features included on every paid plan (no feature gating)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Flat one-time event fee rather than a recurring subscription$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Free plan is restricted to community events and excluded for private, promotional, or commercial events$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Professional Event pricing is a flat $499 regardless of event size$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$No AI features mentioned$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Bulk/multi-event pricing requires contacting sales$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Is Sessionize free?$q$, $q$Yes, for qualifying free community events; commercial or private events require the paid Professional Event plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$How much does Sessionize cost for a single event?$q$, $q$The Professional Event plan is $499 USD + tax per event occurrence.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Can I try Sessionize before paying?$q$, $q$Yes, a fully functional test mode is available without a credit card.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Does Sessionize offer volume pricing?$q$, $q$Yes, the Bulk plan offers custom pricing for organizers running 5+ events per year.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$How many organizers use Sessionize?$q$, $q$Sessionize reports over 31,000 event organizers and 298,000 speakers on the platform.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Conference Call for Papers$q$, $q$Organizers open a CFP, collect and evaluate submissions, then convert accepted talks into a published schedule.$q$, $q$Conference organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Community meetups & user groups$q$, $q$Free community events can run their CFP and speaker management at no cost.$q$, $q$Meetup and user-group organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Agencies running multiple events$q$, $q$Agencies purchase Bulk activation codes to manage CFPs across 5+ events per year.$q$, $q$Event agencies and corporations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Community Event$q$, $q$Free$q$, NULL, $q$["All features included","Restricted to free community events","Special mode for meetups/user groups"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Professional Event$q$, $q$$499 USD + tax$q$, NULL, $q$["All features included","Priority email support","Test mode with no credit card required"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$Bulk$q$, $q$Custom$q$, NULL, $q$["Prepaid activation codes","For 5+ events per year","Best value for agencies and corporations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$overview$q$, $q$What is Sessionize?$q$, 2, ARRAY[$q$Sessionize is a cloud-based platform, live since 2016, for managing a conference's Call for Papers, speaker submissions, and schedule building. Organizers use it to collect talk proposals, evaluate them, communicate with speakers, and publish a drag-and-drop schedule.$q$, $q$The platform reports over 31,000 event organizers, 298,000 speakers, and more than 1.1 million session submissions processed through its Call for Papers tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', $q$who-its-for$q$, $q$Who Sessionize is for$q$, 2, ARRAY[$q$Sessionize is built for conference and event organizers who need to run a Call for Papers, from free community meetups and user groups to paid single conferences and agencies coordinating multiple events per year.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebd42bbd-e0eb-4348-9dec-c85d892145d6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pretalx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pretalx is open-source conference management software for Call for Papers, speaker review, and schedule building.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pretalx: open-source Call for Papers and conference schedule software, free to test and self-hostable, used by PyCon and MozFest.$q$,
  og_description = $q$Pretalx: open-source Call for Papers and conference schedule software, free to test and self-hostable, used by PyCon and MozFest.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fdeba438-b86f-4bcf-8da7-e3ebc19236f8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Call for Papers$q$, $q$Customizable CFP forms and submission management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Anonymous or open review$q$, $q$Choose anonymous or open review processes for talk selection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Speaker communication$q$, $q$Email speakers directly from the platform, with proof-reading support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Schedule building$q$, $q$Build multi-track, multi-room schedules with automated change publication.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Self-hosting or managed hosting$q$, $q$Run pretalx on your own infrastructure or use the managed hosting at pretalx.com.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Plugin ecosystem$q$, $q$Extend functionality through community-built plugins.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Open source$q$, $q$Source code is publicly available with an open contributor ecosystem.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Free to test with no hidden costs; you only pay once you make an event public on managed hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Open source, with publicly available source code and a plugin ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Self-hosting option avoids platform fees entirely$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Used by established events like PyCon, MozFest, and PyConCascades$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Supports both anonymous and open review workflows for talk selection$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Exact pricing for public/managed events is not published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Self-hosting requires technical setup and ongoing maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$No AI features mentioned$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$No mobile app is stated$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Is Pretalx free?$q$, $q$Yes, testing is free with no hidden costs; payment is only required to make a managed event public.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Is Pretalx open source?$q$, $q$Yes, pretalx is open-source software with publicly available source code and community contributors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Can I self-host Pretalx?$q$, $q$Yes, self-hosting is available alongside the managed hosting option at pretalx.com.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$What review processes does Pretalx support?$q$, $q$Both anonymous and open review processes for evaluating talk submissions.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Who uses Pretalx?$q$, $q$Events including PyCon, MozFest, and PyConCascades are listed as users.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Running a Call for Papers$q$, $q$Organizers open customizable CFP forms, then review submissions anonymously or openly before building a schedule.$q$, $q$Conference organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$Self-hosted conference management$q$, $q$Technical teams self-host pretalx to run the full CFP-to-schedule workflow on their own infrastructure.$q$, $q$Open-source communities and technical organizers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$overview$q$, $q$What is Pretalx?$q$, 2, ARRAY[$q$Pretalx is open-source conference management software covering the full workflow from Call for Papers to a published schedule. Organizers can customize CFP forms, choose anonymous or open review of submissions, email speakers, and build multi-track schedules that update automatically when changed.$q$, $q$The software can be self-hosted or run on pretalx's managed hosting at pretalx.com, where testing is free and payment is only required once an event goes public. Source code is publicly available, with a plugin ecosystem for further customization.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', $q$who-its-for$q$, $q$Who Pretalx is for$q$, 2, ARRAY[$q$Pretalx is used by conference organizers of various sizes, including established events like PyCon, MozFest, and PyConCascades, as well as smaller community-run conferences that want an open-source, self-hostable alternative to proprietary CFP tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdeba438-b86f-4bcf-8da7-e3ebc19236f8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Tito ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tito is a pay-per-ticket event registration platform with no subscription fees, built for developer and B2B conferences.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$3% per ticket (2.5% for approved charities/nonprofits); free for free events$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Dublin, Ireland$q$,
  languages = '{}',
  seo_meta_description = $q$Tito: pay-per-ticket event registration platform with API access, used by technology, developer, and B2B conferences.$q$,
  og_description = $q$Tito: pay-per-ticket event registration platform with API access, used by technology, developer, and B2B conferences.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a182b645-3634-449e-9ec3-d34c77f3ab09';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a182b645-3634-449e-9ec3-d34c77f3ab09' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Event dashboard$q$, $q$Manage registrations, attendees, and payments from a central dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Attendee event pages$q$, $q$Customizable pages for attendees to register and manage tickets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Developer API$q$, $q$Full API access for custom integrations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Embeddable widget$q$, $q$Add ticket sales to any website with a two-line embed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Custom CSS & JavaScript events$q$, $q$Style the checkout and hook into JavaScript events for custom behavior.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Built-in email$q$, $q$Send emails directly to attendees from the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Self-service receipts$q$, $q$Attendees can access their own receipts without contacting support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$No subscription fees or setup costs; pay only per ticket sold$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Free events incur no platform fee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Discounted 2.5% fee for approved charity, nonprofit, and community events$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Full developer API and embeddable widget for custom integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Reports processing over €600,000,000 in customer sales$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Standard 3% platform fee plus separate payment gateway fees (e.g., Stripe) apply on top$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Charity/nonprofit discount requires an application and approval$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Founding year and company size are not published$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$No AI features mentioned$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$How much does Tito cost?$q$, $q$There's no subscription; Tito charges 3% per ticket on standard paid events (2.5% for approved charities/nonprofits), and nothing for free events.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Where is Tito based?$q$, $q$Tito is headquartered at 27 Frederick Street South, Dublin, Ireland.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Does Tito have an API?$q$, $q$Yes, Tito offers developer API access alongside an embeddable ticket widget.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$What payment processors does Tito support?$q$, $q$Stripe and PayPal, supporting 139 currencies.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Is there a fee cap?$q$, $q$Yes, on paid plans Tito caps its per-ticket fee at €25 for high-priced tickets.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Developer & tech conference ticketing$q$, $q$Technology and B2B conference organizers use Tito's dashboard and API to sell and manage tickets.$q$, $q$Developer and B2B conference organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Embedding ticket sales on an existing site$q$, $q$Organizers embed Tito's widget directly into their own website with two lines of code.$q$, $q$Organizers with an existing event website$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Charity and community events$q$, $q$Approved charity, nonprofit, and community events qualify for a reduced 2.5% ticket fee.$q$, $q$Charities and community organizers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Free events$q$, $q$Free$q$, NULL, $q$["No platform fee on free tickets"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Standard$q$, $q$3% per ticket$q$, NULL, $q$["Full feature access","Developer API","Embeddable widget"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$Charity/Nonprofit$q$, $q$2.5% per ticket$q$, NULL, $q$["Requires application and approval","Same feature set as Standard"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$overview$q$, $q$What is Tito?$q$, 2, ARRAY[$q$Tito is an event registration and ticketing platform for free and paid events. Organizers manage registrations, process payments, and communicate with attendees from a central dashboard, with a developer API and an embeddable ticket widget for adding sales to an existing website.$q$, $q$Rather than charging a subscription, Tito charges per ticket sold: 3% on standard paid events, 2.5% for approved charity, nonprofit, and community events, and nothing on free events. The company is headquartered in Dublin, Ireland, and reports processing more than €600,000,000 in ticket sales for its customers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', $q$who-its-for$q$, $q$Who Tito is for$q$, 2, ARRAY[$q$Tito is aimed at technology, developer, and B2B conference organizers who want registration tooling with an API and embeddable widget rather than a fixed monthly subscription.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a182b645-3634-449e-9ec3-d34c77f3ab09', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ticket Tailor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ticket Tailor is a UK event ticketing platform charging a flat per-ticket fee instead of a percentage-based booking fee.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$From £0.22/ticket (prepaid credits); £0.60/ticket pay-as-you-go$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Ticket Tailor: flat-fee event ticketing software with no booking-fee percentage, founded in 2010 and based in London.$q$,
  og_description = $q$Ticket Tailor: flat-fee event ticketing software with no booking-fee percentage, founded in 2010 and based in London.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '732a7077-9f6e-449a-947d-9f0d056354b8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '732a7077-9f6e-449a-947d-9f0d056354b8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Flat per-ticket fees$q$, $q$Charges a fixed fee per ticket instead of a percentage of the ticket price.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Pay-as-you-go or prepaid credits$q$, $q$Choose pay-as-you-sell pricing or buy discounted ticket credits upfront.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Direct payments$q$, $q$Payments go directly to the organizer's own Stripe, PayPal, or Square account.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$First 5 tickets free$q$, $q$New organizers sell their first 5 tickets at no cost.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Discounts for good causes$q$, $q$Reduced fees for B Corps, PTAs, charities, and not-for-profits.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$No percentage-based booking fee; flat per-ticket pricing keeps costs predictable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$First 5 tickets are free for every organizer$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Certified B Corporation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Discounted fees available for charities, PTAs, and other good-cause organizers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Payments settle directly to the organizer's own payment processor account rather than being held by the platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Payment processing fees (Stripe/PayPal/Square) apply on top of Ticket Tailor's own fee$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Lower per-ticket rates require buying credits in bulk upfront (minimum 100 credits)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$No AI features mentioned$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Company size not publicly disclosed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$How does Ticket Tailor charge for tickets?$q$, $q$A flat fee per ticket rather than a percentage of the ticket price — as low as £0.22/ticket with prepaid credits, or £0.60/ticket pay-as-you-go.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Are the first tickets free?$q$, $q$Yes, organizers can sell their first 5 tickets at no cost.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Where is Ticket Tailor based?$q$, $q$London, United Kingdom; the company was founded in 2010.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Does Ticket Tailor take a cut of my ticket revenue?$q$, $q$No — payments go directly to the organizer's own Stripe, PayPal, or Square account.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Are there discounts for nonprofits?$q$, $q$Yes, discounts are available for good causes, B Corps, PTAs, and not-for-profits.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Small to mid-sized ticketed events$q$, $q$Organizers who want predictable, flat per-ticket costs instead of a percentage cut of ticket revenue.$q$, $q$Independent event organizers and venues$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Charity and community ticketing$q$, $q$Charities, PTAs, and not-for-profits access reduced per-ticket fees.$q$, $q$Charities and community groups$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Pay As You Sell$q$, $q$£0.60/ticket$q$, NULL, $q$["No upfront cost","Pay per ticket sold"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$Prepaid Credits$q$, $q$From £0.22/ticket$q$, NULL, $q$["Buy credits upfront (minimum 100)","Lower per-ticket rate"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$overview$q$, $q$What is Ticket Tailor?$q$, 2, ARRAY[$q$Ticket Tailor is an event ticketing platform, founded in 2010 and headquartered in London, that lets promoters and venues sell tickets online while keeping payments in their own Stripe, PayPal, or Square account rather than routing money through the platform.$q$, $q$Instead of a percentage-based booking fee, Ticket Tailor charges a flat fee per ticket — as low as £0.22 with prepaid credits, or £0.60 on a pay-as-you-sell basis — and every organizer's first 5 tickets are free.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', $q$who-its-for$q$, $q$Who Ticket Tailor is for$q$, 2, ARRAY[$q$Ticket Tailor is aimed at independent organizers, venues, charities, and community groups who want predictable, flat per-ticket pricing and direct control of their payment processing, rather than a percentage-based booking fee.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('732a7077-9f6e-449a-947d-9f0d056354b8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Humanitix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Humanitix is a charity-backed event ticketing platform that directs 100% of its profits to charitable causes.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$2.1% + $0.99 per paid ticket (Standard); free for free events$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Humanitix: event ticketing platform where 100% of profits go to charity, with reduced fees for charities and schools.$q$,
  og_description = $q$Humanitix: event ticketing platform where 100% of profits go to charity, with reduced fees for charities and schools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Free events at no cost$q$, $q$Free events incur zero platform fees.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Standard ticket fee$q$, $q$2.1% + $0.99 per paid ticket, plus payment processing of 2.9% + $0.30.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Charity & school discount$q$, $q$Reduced 1% + $0.99 fee for approved charities and schools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Website integration$q$, $q$Sell tickets directly through an organizer's own website.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Reserved seating & gift cards$q$, $q$Support for reserved seating and gift card sales.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Third-party integrations$q$, $q$Connects with Mailchimp, Salesforce, Facebook, and Canva.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Event discovery marketplace$q$, $q$Public listing and discovery of events by category and location.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$100% of profits go to charity; Humanitix operates as a registered charity itself$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$No subscription fees, contracts, or sign-up costs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Reduced fees for charities and schools (1% + $0.99 vs. standard 2.1% + $0.99)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Free events cost nothing to run$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Built-in integrations with Mailchimp, Salesforce, Facebook, and Canva$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Payment processing fees (2.9% + $0.30) apply in addition to Humanitix's own ticket fee$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Custom/enterprise pricing requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Founding year and headquarters are not published$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$No AI features mentioned$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$How does Humanitix make money for charity?$q$, $q$100% of Humanitix's profits are donated to charity; it operates as a registered charity itself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$What does Humanitix charge for paid tickets?$q$, $q$2.1% + $0.99 per ticket (Standard), plus 2.9% + $0.30 payment processing, or 1% + $0.99 for approved charities and schools.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Is Humanitix free for free events?$q$, $q$Yes, free events incur no ticketing fees.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$What integrations does Humanitix support?$q$, $q$Mailchimp, Salesforce, Facebook, and Canva, among others.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Does Humanitix require a subscription?$q$, $q$No — there are no subscription fees, contracts, or sign-up costs.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Charity and school events$q$, $q$Charities and schools access a reduced 1% + $0.99 per-ticket fee.$q$, $q$Charities and schools$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Free community events$q$, $q$Organizers running free events pay no ticketing fees.$q$, $q$Community event organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Festivals and conferences wanting a cause-driven platform$q$, $q$Organizers who want ticket-fee profits to support charitable causes choose Humanitix over standard for-profit ticketing platforms.$q$, $q$Festival and conference organizers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Free Events$q$, $q$Free$q$, NULL, $q$["No ticketing fees"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Standard$q$, $q$2.1% + $0.99 per ticket + payment processing$q$, NULL, $q$["Full feature access","Website integration","Reserved seating & gift cards"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Charities & Schools$q$, $q$1% + $0.99 per ticket + payment processing$q$, NULL, $q$["Discounted rate for approved charities and schools"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$Custom$q$, $q$Contact sales$q$, NULL, $q$["For larger-scale needs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$overview$q$, $q$What is Humanitix?$q$, 2, ARRAY[$q$Humanitix is an event ticketing platform built around a charitable business model: it describes itself as directing 100% of its profits to charity and operates as a registered charity itself. Organizers use it to sell tickets to festivals, conferences, live shows, and other events.$q$, $q$Pricing is fee-based rather than subscription-based: free events cost nothing, standard paid events are charged 2.1% + $0.99 per ticket plus payment processing, and approved charities and schools receive a reduced 1% + $0.99 rate.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', $q$who-its-for$q$, $q$Who Humanitix is for$q$, 2, ARRAY[$q$Humanitix is aimed at event hosts — including festivals, conferences, live shows, and charities — who want their ticketing fees to fund charitable giving, with additional discounted pricing specifically for charities and schools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f58d22a2-7e1d-4bb6-94f3-ba3ce32f636d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Lu.ma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Luma is a free-forever event page and ticketing platform with a paid Plus plan that removes platform fees.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Free plan); $59/month billed annually (Luma Plus)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Luma (lu.ma): free event page and ticketing platform with a paid Plus plan offering 0% fees, API access, and Zapier.$q$,
  og_description = $q$Luma (lu.ma): free event page and ticketing platform with a paid Plus plan offering 0% fees, API access, and Zapier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c973c5c5-70a6-48ab-b061-1028ca2b9440';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c973c5c5-70a6-48ab-b061-1028ca2b9440' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Event pages$q$, $q$Create a page for an event, invite guests, and sell tickets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Unlimited free events$q$, $q$The Free plan supports unlimited events and guests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Guest check-in$q$, $q$Track and check in attendees at the door.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Ticket types & coupons$q$, $q$Set up multiple ticket types, group purchases, and coupon codes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Zoom integration$q$, $q$Connect events to Zoom on the Free plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Zapier & API access$q$, $q$Luma Plus adds Zapier automation and API access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Custom event URLs & tax collection$q$, $q$Plus plan supports custom event page URLs and tax collection on ticket sales.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Free plan supports unlimited events and guests at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Free plan accepts major cards, Apple Pay, Google Pay, and regional payment methods$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Luma Plus removes the 5% platform fee entirely (0% on paid events)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$API access and Zapier automation available on the Plus plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Multiple weekly-send add-on tiers let high-volume hosts scale their newsletter reach$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Free plan charges a 5% platform fee on paid ticket sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Weekly invite/newsletter sends are capped (500 on Free, 5,000 on Plus, extra tiers cost more)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$API access requires the paid Plus plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Founding year, headquarters, and company size are not published$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Is Luma free?$q$, $q$Yes, the Free plan supports unlimited events and guests, with a 5% platform fee on paid events.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$What does Luma Plus add?$q$, $q$0% platform fee on paid events, tax collection, custom event URLs, Zapier automation, API access, and higher weekly send limits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$How much does Luma Plus cost?$q$, $q$$59/month billed annually.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Does Luma integrate with Zoom?$q$, $q$Yes, Zoom integration is available on the Free plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Can I increase my weekly email sending limit?$q$, $q$Yes, Plus subscribers can purchase add-on packages raising the limit from 5,000 up to 100,000 weekly sends.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Free community events$q$, $q$Hosts use the Free plan to create event pages and manage RSVPs and check-in at no cost.$q$, $q$Community and meetup organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Paid ticketed events without platform fees$q$, $q$Organizers upgrade to Plus to avoid the 5% fee on paid ticket sales and access tax collection.$q$, $q$Recurring or ticketed event hosts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Developers automating event workflows$q$, $q$Plus subscribers use API access and Zapier integration to connect Luma to other tools.$q$, $q$Developers and operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Free$q$, $q$Free$q$, NULL, $q$["Unlimited events & guests","Up to 500 weekly invites","Guest check-in","5% platform fee on paid events","Zoom integration","Up to 3 calendar admins"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Luma Plus$q$, $q$$59/month$q$, $q$annual$q$, $q$["0% platform fee on paid events","Up to 5,000 weekly invites","Tax collection","Custom event URLs","Zapier & API access","5 calendar admins","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom plans on request"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$overview$q$, $q$What is Luma?$q$, 2, ARRAY[$q$Luma (lu.ma) is an event platform for creating an event page, inviting guests, and selling tickets. Its Free plan supports unlimited events and guests, guest check-in, multiple ticket types, and payment acceptance through major cards, Apple Pay, and Google Pay, with a 5% fee applied to paid ticket sales.$q$, $q$A paid tier, Luma Plus, removes that platform fee entirely, and adds tax collection, custom event page URLs, Zapier automation, API access, and higher weekly invite-send limits, priced at $59/month billed annually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', $q$who-its-for$q$, $q$Who Luma is for$q$, 2, ARRAY[$q$Luma suits hosts running free or low-volume events on its no-cost Free plan, as well as recurring or higher-volume ticketed event organizers who upgrade to Plus to eliminate platform fees and connect Luma to other tools via its API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c973c5c5-70a6-48ab-b061-1028ca2b9440', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Partiful ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Partiful is a free event invitation app for planning parties with RSVP tracking, guest chat, and ticketing.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Partiful: free party invitation app with customizable invites, RSVP tracking, guest polls, and ticketing.$q$,
  og_description = $q$Partiful: free party invitation app with customizable invites, RSVP tracking, guest polls, and ticketing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b3922d4-da95-43dc-94df-57b5c18e296d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b3922d4-da95-43dc-94df-57b5c18e296d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Customizable invitations$q$, $q$Design invites with custom backgrounds, fonts, and animations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Guest list & reactions$q$, $q$Guests can see the guest list and leave comments and reactions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Text blast messaging$q$, $q$Send message updates to all guests at once.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Polling$q$, $q$Poll guests to pick a date or time for an event.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Payment collection & ticketing$q$, $q$Collect payments or sell tickets for an event.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$QR code check-in$q$, $q$Check guests in at the door with QR codes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Photo album sharing$q$, $q$Guests can share photos in a shared album after the event.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Entirely free with no paywalls$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Available on web, iOS, and Android$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Highly rated: 5.0 stars across roughly 40,000 App Store ratings, 200,000+ ratings overall$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Supports payment collection and ticket sales despite being free to use$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Invite distribution via email, text, Instagram, WhatsApp, and phone contacts$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$No stated business or enterprise tier for formal conference-scale event management$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Founding year, headquarters, and company size are not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$No AI features mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Is Partiful free?$q$, $q$Yes, Partiful is free to use with no paywalls.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$What platforms is Partiful available on?$q$, $q$Web browser, iOS, and Android.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Can I collect payments through Partiful?$q$, $q$Yes, Partiful supports payment collection and ticket sales for events.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$How do guests check in?$q$, $q$Hosts can use QR code check-in at the event.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$How is Partiful rated?$q$, $q$It has around 40,000 App Store ratings at 5.0 stars, and over 200,000 ratings overall.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Casual social gatherings$q$, $q$Hosts create customizable invites and track RSVPs for parties and casual get-togethers.$q$, $q$Social event planners, particularly Gen Z users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$Ticketed private events$q$, $q$Hosts collect payments or sell tickets for events directly through Partiful invites.$q$, $q$Hosts charging for entry or contributions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$overview$q$, $q$What is Partiful?$q$, 2, ARRAY[$q$Partiful is a free event invitation platform for planning parties and social gatherings. Hosts create customizable invitations with custom backgrounds, fonts, and animations, then track RSVPs, poll guests on timing, and message the full guest list.$q$, $q$Beyond invitations, Partiful supports QR code check-in, payment collection and ticket sales, and post-event photo sharing, and is available on web, iOS, and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', $q$who-its-for$q$, $q$Who Partiful is for$q$, 2, ARRAY[$q$Partiful is aimed at people planning casual social events and parties — the platform notes particular popularity among Gen Z users — who want a free, highly customizable invitation and RSVP tool rather than a formal conference-management system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b3922d4-da95-43dc-94df-57b5c18e296d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Zuddl ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zuddl is a unified B2B event management platform covering ticketing, virtual/hybrid production, onsite tools, and AI agents.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$10,000/year (minimum 2 organizer licenses)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Zuddl: unified event platform for B2B webinars, hybrid, and in-person events with AI agents, starting at $10,000/year.$q$,
  og_description = $q$Zuddl: unified event platform for B2B webinars, hybrid, and in-person events with AI agents, starting at $10,000/year.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '36a4b760-5ccb-4498-b325-7b29a847d7cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '36a4b760-5ccb-4498-b325-7b29a847d7cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Ticketing & registration$q$, $q$Landing page builder for event registration and ticketing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Virtual & hybrid production$q$, $q$Video production and streaming tools for virtual and hybrid events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Onsite tools$q$, $q$Check-in, badge printing, and lead capture for in-person events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Mobile attendee app$q$, $q$Customizable app for attendee networking and engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Speaker & exhibitor portals$q$, $q$Dedicated portals for managing speakers and exhibitors.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Zuddl AI Agents$q$, $q$AI-powered agents built to reduce manual event-operations work.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Native integrations$q$, $q$Direct integrations with sales and martech tools, described as native rather than Zapier-based.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Analytics & gamification$q$, $q$Event analytics, reporting, and gamification features.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Single platform spans digital, field, and full conference event types$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Includes AI-powered agents for event operations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Native integrations with sales and martech tools rather than relying solely on Zapier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Unlimited onsite staff included for check-in and lead capture$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Volume-based pricing that becomes more efficient as attendee and organizer counts scale$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Minimum commitment starts at $10,000/year for 2 organizer licenses — not aimed at small events$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Additional collaborators cost extra ($170/month annually)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Detailed feature-by-tier breakdown, founding year, and headquarters are not published$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$No self-serve or free tier$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$How much does Zuddl cost?$q$, $q$Pricing starts at $10,000/year for a minimum of 2 organizer licenses, scaling with attendee volume.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Does Zuddl have AI features?$q$, $q$Yes, "Zuddl AI Agents" are built into the platform to reduce manual event-operations work.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$What event types does Zuddl support?$q$, $q$Digital (webinars/virtual), field/in-person, and unified conference programs, depending on license tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Are onsite staff limited?$q$, $q$No, unlimited onsite staff are included for check-in and lead capture.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Does Zuddl offer native integrations?$q$, $q$Yes, the platform states it offers native integrations with sales and martech tools rather than relying on Zapier.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$B2B webinars and virtual events$q$, $q$Marketing teams use the Digital License for registration, communications, and analytics on virtual programs.$q$, $q$B2B marketing and event teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Hybrid field events$q$, $q$Organizers combining in-person and digital programming use the Digital + Field License.$q$, $q$Field marketing and event agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Large unified conference programs$q$, $q$Organizations running digital, field, and full conference programs together use the Unified License.$q$, $q$Enterprise event teams and associations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Digital License$q$, $q$Contact sales (from $10,000/year for 2 licenses)$q$, $q$annual$q$, $q$["Registration","Communications","Analytics","Ideal for webinars & virtual events"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Digital + Field License$q$, $q$Contact sales$q$, $q$annual$q$, $q$["Adds field/in-person event capabilities"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$Unified License$q$, $q$Contact sales$q$, $q$annual$q$, $q$["Full access across digital, field, and conference event types"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$overview$q$, $q$What is Zuddl?$q$, 2, ARRAY[$q$Zuddl is a unified event management platform for B2B companies, associations, agencies, and communities, covering ticketing and registration, virtual and hybrid event production, onsite check-in and badge printing, and speaker/exhibitor management from a single system.$q$, $q$The platform includes "Zuddl AI Agents," described as built to reduce manual dependencies and speed up event operations, plus native integrations with sales and martech tools. Licensing starts at $10,000/year for a minimum of 2 organizer licenses, with pricing scaling by attendee volume rather than per event.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', $q$who-its-for$q$, $q$Who Zuddl is for$q$, 2, ARRAY[$q$Zuddl targets B2B marketing and event teams, associations, agencies, and enterprise organizations running webinars, field events, and full conference programs who need one platform across digital and in-person formats rather than separate tools for each.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a4b760-5ccb-4498-b325-7b29a847d7cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Vimeo Events ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vimeo's virtual event platform for hosting livestreams, webinars, and online conferences with analytics and CRM integration.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$75/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vimeo Events lets teams host live webinars and virtual conferences with multi-camera production, chat, polling, and real-time analytics.$q$,
  og_description = $q$Vimeo Events lets teams host live webinars and virtual conferences with multi-camera production, chat, polling, and real-time analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6d990b19-e999-4c82-8ee9-31191d38d1f7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6d990b19-e999-4c82-8ee9-31191d38d1f7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Live streaming & webinars$q$, $q$Host live or pre-recorded events with multi-camera switching and graphics overlays.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Custom branding$q$, $q$Add logos and lower-thirds to events to match company branding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Interactive engagement$q$, $q$Audience polling, live chat, and moderated Q&A during events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Simulive broadcasting$q$, $q$Schedule pre-recorded content to stream as if it were live.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Automatic recording$q$, $q$Streams are automatically saved for on-demand viewing afterward.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Real-time analytics$q$, $q$Track attendance, engagement, and viewer behavior during and after events.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$CRM integration$q$, $q$Connect with HubSpot and Salesforce to capture leads from event registrations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Multi-platform streaming$q$, $q$Broadcast simultaneously to social platforms and custom RTMP destinations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Built on Vimeo's established video infrastructure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$CRM integrations (HubSpot, Salesforce) support lead capture from events$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Simulive lets teams pre-record events while presenting them as live$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Real-time analytics track attendee engagement$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Advanced plan pricing starts at a business-level price point, not aimed at hobbyists$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Enterprise features like SSO require contacting sales for custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Full feature list and lower-tier pricing are not published in detail on the marketing page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$What is Vimeo Events used for?$q$, $q$It is used to host livestreams, webinars, and virtual conferences with production tools, audience engagement features, and analytics.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Does Vimeo Events support pre-recorded content as a live event?$q$, $q$Yes, its Simulive feature lets you schedule pre-recorded content to broadcast as if it were streaming live.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Can Vimeo Events integrate with a CRM?$q$, $q$Yes, it integrates with HubSpot and Salesforce to help capture and route event leads.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$What does the Advanced plan include?$q$, $q$The Advanced plan is $75/month billed annually and includes 10 seats, 7TB of storage, webinar hosting, and analytics.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Is there an Enterprise plan?$q$, $q$Yes, Vimeo offers a custom Enterprise plan with more seats, storage, dedicated support, and SSO authentication.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Marketing webinars$q$, $q$Run branded webinars with lead capture routed directly into a CRM.$q$, $q$Marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Virtual conferences$q$, $q$Produce multi-session virtual conferences with interactive audience features.$q$, $q$Event organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Internal communications$q$, $q$Broadcast company-wide town halls or training sessions with analytics on attendance.$q$, $q$Communications teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Advanced$q$, $q$$75/month$q$, $q$annual$q$, $q$["10 seats","7TB storage","Webinar hosting","Analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["More seats","More storage","Dedicated support","SSO authentication"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$overview$q$, $q$What is Vimeo Events?$q$, 2, ARRAY[$q$Vimeo Events is Vimeo's virtual event platform for hosting livestreams, webinars, and online conferences. It provides multi-camera switching, graphics overlays, and custom branding for professional-looking broadcasts.$q$, $q$Beyond streaming, the platform includes interactive tools like polling, live chat, and moderated Q&A, plus real-time analytics and CRM integrations with HubSpot and Salesforce for lead capture.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', $q$who-its-for$q$, $q$Who Vimeo Events is for$q$, 2, ARRAY[$q$Vimeo Events is built for marketing and communications teams, educators, and enterprise organizations that need to run webinars or virtual conferences with production quality and audience engagement built in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d990b19-e999-4c82-8ee9-31191d38d1f7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── StreamYard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Browser-based live streaming and recording studio for multistreaming to platforms like YouTube and Facebook.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$44.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$StreamYard is a browser-based live streaming studio that lets creators multistream, record, and produce broadcasts without extra equipment.$q$,
  og_description = $q$StreamYard is a browser-based live streaming studio that lets creators multistream, record, and produce broadcasts without extra equipment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '805aa818-8503-43ab-bc29-2447c8f5ac0c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '805aa818-8503-43ab-bc29-2447c8f5ac0c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Browser-based studio$q$, $q$Stream and record directly from a browser with no extra software installation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Multistreaming$q$, $q$Broadcast to multiple destinations at once, including custom RTMP destinations on paid plans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$On-screen participants$q$, $q$Bring guests into a broadcast, with participant limits varying by plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Cloud and local recording$q$, $q$Record streams locally or to the cloud depending on the plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Custom overlays and branding$q$, $q$Add logos, backgrounds, and custom layouts to broadcasts, removing the StreamYard watermark on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$AI clips and backgrounds$q$, $q$AI-assisted clip generation and virtual backgrounds available on the Core plan and above.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$On-Air webinars$q$, $q$Host webinars directly through the platform on the Advanced plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Free plan available with no credit card required to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Runs entirely in the browser with no downloads for hosts or guests$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Multistreams to several destinations simultaneously on paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Used by a large base of creators (StreamYard states 12,000,000+ creators)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Free plan adds a StreamYard watermark and limits local recording to 2 hours/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Multistreaming to more than one destination requires a paid plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Business-level plans require contacting sales for custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Is StreamYard free?$q$, $q$Yes, StreamYard has a free plan with essential studio features, though it includes a StreamYard logo, streaming limits, and only 2 hours of local recording per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$What platforms can StreamYard stream to?$q$, $q$It supports streaming to platforms like Facebook and YouTube, with multistreaming to more destinations on paid plans, plus custom RTMP destinations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Does StreamYard offer a free trial for paid plans?$q$, $q$Yes, both the Core and Advanced plans include a 7-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$What's the difference between the Core and Advanced plans?$q$, $q$Advanced adds 4K local recordings, multistreaming to 8 destinations, more backstage participants, On-Air webinars, custom fonts, and transcript downloads.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Does StreamYard require guests to download software?$q$, $q$No, StreamYard runs in the browser, so guests can join broadcasts without installing anything.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Live podcast recording$q$, $q$Record and stream podcast episodes with guests joining from a browser.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Multi-platform broadcasting$q$, $q$Simultaneously stream a broadcast to several social platforms from one session.$q$, $q$Content creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Webinars$q$, $q$Host On-Air webinars directly within StreamYard on the Advanced plan.$q$, $q$Marketing and sales teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["All essential studio features","StreamYard logo included","2 hours local recording/month","6 on-screen participants","1 seat"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Core$q$, $q$$44.99/month (or $35.99/month billed yearly)$q$, $q$monthly$q$, $q$["Full HD (1080p) streaming","No StreamYard logo","Multistream to 3 destinations","10 on-screen participants","50 hours permanent storage","AI clips and backgrounds"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Advanced$q$, $q$$88.99/month (or $68.99/month billed yearly)$q$, $q$monthly$q$, $q$["4K (2160p) local recordings","Multistream to 8 destinations","15 backstage participants","On-Air webinars","Custom fonts","Transcript downloads"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$Business$q$, $q$Custom$q$, NULL, $q$["For organizations and larger teams"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$overview$q$, $q$What is StreamYard?$q$, 2, ARRAY[$q$StreamYard is a professional live streaming and recording studio that runs entirely in the browser. It lets creators produce broadcasts and record content without specialized equipment or software installation.$q$, $q$The platform supports multistreaming to platforms like YouTube and Facebook, custom branding with logos and overlays, and features like AI clips, cloud recording, and On-Air webinars on higher-tier plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', $q$who-its-for$q$, $q$Who StreamYard is for$q$, 2, ARRAY[$q$StreamYard is built for content creators, podcasters, and businesses who want to livestream or record polished video content without a dedicated studio setup, and it states it is trusted by over 12 million creators.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('805aa818-8503-43ab-bc29-2447c8f5ac0c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Riverside ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered platform for recording, editing, and publishing studio-quality podcasts, video, and webinars remotely.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Riverside is an AI-powered recording and editing platform for podcasts, video interviews, live streams, and webinars.$q$,
  og_description = $q$Riverside is an AI-powered recording and editing platform for podcasts, video interviews, live streams, and webinars.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc81b714-5cd0-41b9-8464-c9eca6e97648';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc81b714-5cd0-41b9-8464-c9eca6e97648' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Local 4K recording$q$, $q$Records each participant's video and audio locally at up to 4K/48kHz for high-quality, sync-safe files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$AI-powered editing$q$, $q$Text-based editor with filler-word removal, speech correction, and auto-layout generation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$AI Co-Creator$q$, $q$Generates clips, thumbnails, and headlines from recorded sessions for promotion.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$AI translation and dubbing$q$, $q$Translates and dubs content into 30+ languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Live streaming$q$, $q$Streams simultaneously to platforms like YouTube, LinkedIn, Instagram, and Twitch.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Podcast hosting$q$, $q$Hosts and publishes podcasts with automatic distribution to major listening apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Webinar hosting$q$, $q$Runs webinars with registration, Q&A, chat, and analytics on the Webinar plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Local recording per participant avoids sync and dropout issues common with browser-based capture$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Extensive AI toolset including translation/dubbing into 30+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Publishes directly to major podcast and video platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$14-day free trial available on paid plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Free plan limited to 2 hours of multi-track recording (one-time) and includes a watermark$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Higher-tier features like webinars and unlimited studios require the more expensive Webinar or Business plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Business plan pricing is custom/quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Is Riverside free to use?$q$, $q$Yes, Riverside offers a free plan with 2 hours of one-time multi-track recording, up to 720p video, and a Riverside watermark.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$What does the Pro plan include?$q$, $q$The Pro plan ($29/month, or $24/month billed annually) includes 1 studio, up to 4K video and 48kHz audio, no watermark, unlimited text-based editing, AI editing, and podcast hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Can Riverside host webinars?$q$, $q$Yes, the Webinar plan ($99/month, or $79/month billed annually) supports webinars with up to 100 registrants, custom branded registration forms, and analytics.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Does Riverside support live streaming?$q$, $q$Yes, from the Grow plan upward it supports Full HD live streaming and multistreaming to unlimited destinations.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$What platforms does Riverside run on?$q$, $q$Riverside is web browser-based and also offers a Mac app and mobile apps for iOS and Android.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Remote podcast recording$q$, $q$Record separate high-quality local tracks with remote guests and edit via a text-based editor.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Video content repurposing$q$, $q$Use AI Co-Creator to turn long recordings into social clips, thumbnails, and headlines.$q$, $q$Content marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Multilingual content distribution$q$, $q$Translate and dub recordings into 30+ languages for international audiences.$q$, $q$Global content teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Webinar hosting$q$, $q$Run branded webinars with registration, Q&A, and lead capture.$q$, $q$Marketing and sales teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["2 hours multi-track recording (one-time)","Up to 720p video","Unlimited single-track recording","Riverside watermark"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Pro$q$, $q$$29/month (or $24/month billed annually)$q$, $q$monthly$q$, $q$["1 studio","15 hours separate track downloads","Up to 4K video, 48kHz audio","No watermark","AI editing & repurposing","Podcast hosting & analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Grow$q$, $q$$39/month (or $34/month billed annually)$q$, $q$monthly$q$, $q$["2 studios","20 hours separate track downloads","Social media scheduling","Podcast hosting for 2 shows","Full HD live streaming","Multistream to unlimited destinations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Webinar$q$, $q$$99/month (or $79/month billed annually)$q$, $q$monthly$q$, $q$["3 studios","Webinars for up to 100 registrants","Custom branded registration forms","Webinar analytics","HubSpot integration"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$Business$q$, $q$Custom$q$, NULL, $q$["Unlimited studios","Up to 10,000 webinar registrants","SSO","SOC2 & ISO27001 compliance","Dedicated customer success manager"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$overview$q$, $q$What is Riverside?$q$, 2, ARRAY[$q$Riverside is an AI-powered platform for recording, editing, repurposing, and distributing video and audio content. It records each participant locally at up to 4K video and 48kHz audio, avoiding the sync issues common with browser-based remote recording.$q$, $q$The platform layers on AI tools for text-based editing, filler-word removal, clip and thumbnail generation, and translation/dubbing into 30+ languages, plus podcast hosting, live streaming, and webinar hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', $q$who-its-for$q$, $q$Who Riverside is for$q$, 2, ARRAY[$q$Riverside targets podcasters, video creators, marketers, and businesses running webinars or interviews who want studio-quality remote recording plus AI-assisted editing and repurposing in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc81b714-5cd0-41b9-8464-c9eca6e97648', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Zencastr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$All-in-one platform for recording, AI editing, hosting, and distributing podcasts and video content.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Zencastr is an all-in-one podcasting platform offering remote recording, AI editing and clipping, hosting, and analytics.$q$,
  og_description = $q$Zencastr is an all-in-one podcasting platform offering remote recording, AI editing and clipping, hosting, and analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '55291a7c-44cc-4c8d-8410-f9af5ea79a43';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '55291a7c-44cc-4c8d-8410-f9af5ea79a43' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Remote recording$q$, $q$Records 4K multi-track video and 48kHz WAV audio on desktop and mobile.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$AI editing (ZenAI)$q$, $q$Text-based editing for audio and video content powered by ZenAI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$AI clipping$q$, $q$Automatically generates social media clips from longer recordings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Transcription$q$, $q$Produces transcriptions the company states are 99% accurate.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Hosting and analytics$q$, $q$Hosts audio and video content with built-in listener/viewer analytics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Monetization tools$q$, $q$Includes built-in earning options for creators.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Team collaboration$q$, $q$Supports multi-user workspaces for teams producing shows together.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Embeddable player & Video RSS$q$, $q$Distribute episodes via an embeddable player or Video RSS feed.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$All-in-one workflow covering recording, editing, hosting, and distribution$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$AI-powered editing and automatic clip generation via ZenAI$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Free tier available to get started$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Supports both audio and 4K video recording$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Detailed pricing tiers and exact costs are not published in an easily accessible format on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$AI features are tied to the ZenAI system, so capabilities depend on plan tier$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$What is Zencastr used for?$q$, $q$Zencastr is used to record, edit, host, and distribute podcasts and video content from a single platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Does Zencastr have AI editing?$q$, $q$Yes, its ZenAI system powers text-based editing and automated social clip generation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Is there a free version of Zencastr?$q$, $q$Yes, Zencastr offers a free tier to get started, alongside paid plans including a Hobbyist tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Can Zencastr record video?$q$, $q$Yes, it supports 4K multi-track video recording in addition to 48kHz WAV audio.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Does Zencastr provide transcripts?$q$, $q$Yes, it offers transcription the company describes as 99% accurate.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Remote podcast recording$q$, $q$Record separate high-quality audio and video tracks with remote guests.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Social clip creation$q$, $q$Use AI clipping to turn long-form episodes into short social media clips.$q$, $q$Content marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$Podcast hosting and distribution$q$, $q$Host episodes and distribute via embeddable player and Video RSS.$q$, $q$Independent creators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$overview$q$, $q$What is Zencastr?$q$, 2, ARRAY[$q$Zencastr is an all-in-one platform for creating, editing, and distributing audio and video content. It combines remote recording of 4K video and 48kHz WAV audio with AI-powered editing and clipping through its ZenAI system.$q$, $q$Beyond recording and editing, Zencastr provides hosting, transcription, an embeddable player, Video RSS distribution, and monetization tools, aiming to reduce the number of separate tools creators need to juggle.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', $q$who-its-for$q$, $q$Who Zencastr is for$q$, 2, ARRAY[$q$Zencastr is built for podcasters, video creators, and interviewers of all skill levels who want recording, AI-assisted editing, hosting, and distribution in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55291a7c-44cc-4c8d-8410-f9af5ea79a43', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SquadCast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based remote recording studio with progressive uploads, multi-track editing, and AI-assisted post-production.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$16/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SquadCast is a cloud recording studio for podcasters with progressive uploads, separate audio/video tracks, and AI tools.$q$,
  og_description = $q$SquadCast is a cloud recording studio for podcasters with progressive uploads, separate audio/video tracks, and AI tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c4d5d81-6ff4-4496-8867-73b2e003226f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Progressive Uploads$q$, $q$Proprietary technology auto-saves recordings during the session to protect against connectivity loss.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Separate audio/video recording$q$, $q$Captures each participant's audio and video separately to avoid drift and sync issues.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Multi-track editing$q$, $q$Adjust individual tracks for cleanup, processing, and volume correction.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Cloud backup$q$, $q$Keeps multiple backup copies of recordings to protect against data loss.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$In-browser interface$q$, $q$Guests join sessions in the browser with no downloads or installation required.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$AI suite$q$, $q$Includes AI features such as transcription and AI speech tools, with usage limits scaling by plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Integrations$q$, $q$Connects with tools including Zapier, Dolby, Dropbox, and Descript.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Free plan available to try the platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Progressive Uploads protect recordings from connectivity failures during a session$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Separate audio/video tracks per participant reduce sync issues$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Used by organizations such as Google, Spotify, NPR, Microsoft, and ESPN per the company's site$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$In-browser guest experience requires no software installation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Free plan limited to 1 recording hour per editor per month and exports with watermarks$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$AI features are capped by monthly usage limits that scale with plan tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Higher recording-hour and team-size needs require the more expensive Business plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Is SquadCast free?$q$, $q$Yes, SquadCast has a free plan offering 1 recording hour per editor per month, 1 show, and exports up to 720p with watermarks.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$What does Progressive Uploads do?$q$, $q$It's SquadCast's proprietary technology that auto-saves recordings during a session, protecting against connectivity loss or technical failures.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Does SquadCast separate audio and video tracks?$q$, $q$Yes, it records each participant's audio and video separately, which the company says eliminates drift and sync issues common in remote recording.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$What's included in the Hobbyist plan?$q$, $q$The Hobbyist plan ($16/month billed annually or $24/month billed monthly) includes 10 recording hours/editor/month, 5 shows, unlimited watermark-free exports up to 1080p, and a basic AI suite.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Do guests need to install software to join a SquadCast session?$q$, $q$No, SquadCast runs in the browser, so guests can join without downloads or installation.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Remote podcast recording$q$, $q$Record separate high-quality audio/video tracks with remote guests, protected by auto-saving uploads.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Audiobook and voice-over recording$q$, $q$Capture studio-quality remote sessions for narration work.$q$, $q$Audiobook narrators and voice-over artists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Video content production$q$, $q$Record video alongside audio for YouTube or other video platforms.$q$, $q$YouTubers and video producers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["1 recording hour/editor/month","1 show","10 participants","Exports up to 720p with watermarks"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Hobbyist$q$, $q$$16/month (annual) or $24/month (monthly)$q$, $q$monthly$q$, $q$["10 recording hours/editor/month","5 shows","Unlimited watermark-free exports up to 1080p","Basic AI suite (20 uses/month)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Creator$q$, $q$$24/month (annual) or $35/month (monthly)$q$, $q$monthly$q$, $q$["30 recording hours/editor/month","Unlimited shows","Unlimited 4K exports","Unlimited basic & advanced AI suite"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Business$q$, $q$$50/month (annual) or $65/month (monthly)$q$, $q$monthly$q$, $q$["40 recording hours/editor/month","Unlimited shows","Full professional AI suite","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$overview$q$, $q$What is SquadCast?$q$, 2, ARRAY[$q$SquadCast is a cloud-based recording studio built for remote collaboration on audio and video content. Its Progressive Uploads technology auto-saves recordings during a session to protect against connectivity loss or technical failures.$q$, $q$The platform records each participant's audio and video separately to avoid drift, offers multi-track editing, cloud backups, and an in-browser guest experience with no downloads required.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$who-its-for$q$, $q$Who SquadCast is for$q$, 2, ARRAY[$q$SquadCast serves podcasters, YouTubers, audiobook narrators, voice-over artists, and producers, with the company citing organizations such as Google, Spotify, NPR, Microsoft, and ESPN among its users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Cleanfeed ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Browser-based software for remote, low-latency, studio-quality audio recording and live interviews.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cleanfeed is browser-based software for low-latency, studio-quality remote audio recording, used by broadcasters and podcasters.$q$,
  og_description = $q$Cleanfeed is browser-based software for low-latency, studio-quality remote audio recording, used by broadcasters and podcasters.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7b313f97-5726-4dc3-822e-2919a68cf2b3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7b313f97-5726-4dc3-822e-2919a68cf2b3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Studio-quality audio recording$q$, $q$Records high-definition audio remotely with minimal latency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Multi-guest support$q$, $q$Records multiple guests with isolated audio tracks per person.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Browser-based access$q$, $q$Runs in the browser without complex setup for hosts or guests.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Multitrack recording$q$, $q$Available on Pro plan for separating and processing individual tracks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Privacy controls, markers, and notes$q$, $q$Studio tools for managing sessions, included on the Pro plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Audio repair and volume controls$q$, $q$Built-in tools to clean up and balance recorded audio on Pro plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Centre-stage video$q$, $q$DCI 2K, 60fps video recording available on the Cinema plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Free tier (Cleanfeed Lite) available, including for commercial use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Low-latency connections designed for live remote interviews$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Won a Primetime Emmy Award for its audio software$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Used by major media organizations including the BBC, Global, Cumulus Media, Warner Bros., Discovery, and NBCUniversal$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Works entirely in the browser with no complex setup required$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Free Lite plan is capped at 2 guests$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Video recording (Centre-stage video) requires the significantly more expensive Cinema plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Enterprise licensing for 5+ seats requires contacting sales for custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Is Cleanfeed free?$q$, $q$Yes, Cleanfeed Lite is a free plan that supports up to 2 guests and unlimited recording time, including for commercial use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$What's included in Cleanfeed Pro?$q$, $q$Cleanfeed Pro (from $12/month personal, $36/month business USD) supports up to 32 guests and adds multitrack recording, privacy controls, markers and notes, audio repair, and volume controls.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Does Cleanfeed support video?$q$, $q$Video recording (Centre-stage video, DCI 2K at 60fps) is available on the Cleanfeed Cinema plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Has Cleanfeed won any awards?$q$, $q$Yes, Cleanfeed won a Primetime Emmy Award for pioneering audio software.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Who uses Cleanfeed?$q$, $q$Cleanfeed is used by podcasters, radio broadcasters, and major media organizations including the BBC, Global, Cumulus Media, Warner Bros., Discovery, and NBCUniversal.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Remote radio interviews$q$, $q$Conduct low-latency, high-definition remote interviews for broadcast.$q$, $q$Radio broadcasters and news organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Podcast recording$q$, $q$Record multi-guest podcast episodes with isolated audio tracks per guest.$q$, $q$Podcasters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Voice-over and film production$q$, $q$Capture professional remote audio sessions for commercial or film production.$q$, $q$Voice actors and film/TV productions$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Cleanfeed Lite$q$, $q$Free$q$, NULL, $q$["2 guests","Unlimited recording time","Commercial use allowed","Clean remote audio"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Cleanfeed Pro$q$, $q$$12/month (personal) or $36/month (business)$q$, $q$monthly$q$, $q$["32 guests","Multitrack recording","Privacy controls","Markers and notes","Audio repair","Volume controls"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Cleanfeed Cinema$q$, $q$$2,500/year (first seat)$q$, $q$annual$q$, $q$["16 guests","All Pro features","Centre-stage video (DCI 2K, 60fps)","Gallery features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["5+ seats","Custom branding","Flexible payment options"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$overview$q$, $q$What is Cleanfeed?$q$, 2, ARRAY[$q$Cleanfeed is browser-based software for remote, low-latency, studio-quality audio recording and live interviews. It lets users record with guests anywhere in the world without complex setup.$q$, $q$The Pro plan adds multitrack recording, privacy controls, audio repair, and volume tools, while the Cinema plan adds high-resolution video recording. Cleanfeed has won a Primetime Emmy Award and is used by major broadcasters including the BBC and NBCUniversal.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', $q$who-its-for$q$, $q$Who Cleanfeed is for$q$, 2, ARRAY[$q$Cleanfeed is built for podcasters, radio broadcasters, voice actors, film and television productions, commercial audio producers, and news organizations that need reliable, low-latency remote recording.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b313f97-5726-4dc3-822e-2919a68cf2b3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Boomcaster ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Remote recording and livestreaming platform with local 4K capture, AI transcript-based editing, and automated post-production.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Boomcaster is a remote recording and livestreaming platform with local 4K capture, AI editing, and automated post-production.$q$,
  og_description = $q$Boomcaster is a remote recording and livestreaming platform with local 4K capture, AI editing, and automated post-production.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '365cb646-7629-4791-a92b-ebcb79d3c233';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '365cb646-7629-4791-a92b-ebcb79d3c233' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Local 4K recording$q$, $q$Captures 4K video at 30fps and uncompressed WAV audio locally on each participant's device to prevent data loss.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Multi-platform livestreaming$q$, $q$Streams to YouTube, LinkedIn, Facebook, Twitch, Instagram, X, and custom RTMP endpoints.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$AI Editor$q$, $q$Transcript-based editing to remove silences and unwanted sections.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$LiveEdit Production Tools$q$, $q$Real-time layout switching, guest controls, and green screen management during a session.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Automatic post-production$q$, $q$Combines tracks, syncs audio, and inserts branding automatically after recording.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Studio customization$q$, $q$Branded logos, backgrounds, and personalized guest links.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Real-time closed captions$q$, $q$Live captions available in 30+ languages.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Free plan available with no credit card required to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Local per-participant recording protects against data loss from dropped connections$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Streams to six major platforms simultaneously plus custom RTMP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$AI transcript-based editing speeds up post-production$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Yearly billing offers 12 months for the price of 10$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Paid plans are metered by recording/livestreaming hours, with per-hour overage charges beyond plan limits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Enterprise features like SSO/SAML and SOC2 compliance require a custom-priced plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Guests limited to 3 backstage participants across the listed plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Is Boomcaster free?$q$, $q$Yes, Boomcaster offers a free plan, described as free forever, with no credit card required to start.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$What does the Starter plan include?$q$, $q$The Starter plan is $20/month and includes 5 hours of studio-quality recording and livestreaming, with $4.20 charged per additional hour.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Does Boomcaster support livestreaming to multiple platforms?$q$, $q$Yes, it can livestream to Facebook, YouTube, LinkedIn, Twitch, Instagram, X, and custom RTMP endpoints simultaneously.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Does Boomcaster offer AI editing?$q$, $q$Yes, its AI Editor provides transcript-based editing to remove silences and unwanted sections, alongside automated transcription.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Is there an Enterprise plan?$q$, $q$Yes, Boomcaster offers a custom-priced Enterprise plan with SSO/SAML integration, SOC2 compliance, and dedicated support.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Remote podcast recording and livestreaming$q$, $q$Record local 4K tracks with guests while simultaneously livestreaming to multiple platforms.$q$, $q$Solo podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Branded content production$q$, $q$Use LiveEdit and studio customization to produce branded marketing videos or webinars.$q$, $q$Agencies and businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Multi-language live events$q$, $q$Deliver real-time closed captions in 30+ languages during live sessions.$q$, $q$International content teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Starter$q$, $q$$20/month$q$, $q$monthly$q$, $q$["5 hours of recording & livestreaming","$4.20 per additional hour"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Indie$q$, $q$$45/month$q$, $q$monthly$q$, $q$["15 hours of recording & livestreaming","$3.60 per additional hour"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Pro$q$, $q$$75/month$q$, $q$monthly$q$, $q$["30 hours of recording & livestreaming","$3.00 per additional hour"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["SSO/SAML integration","SOC2 compliance","Custom infrastructure","Dedicated support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$overview$q$, $q$What is Boomcaster?$q$, 2, ARRAY[$q$Boomcaster is a remote recording and livestreaming platform that captures 4K video and uncompressed WAV audio locally on each participant's device, then automatically syncs and combines the tracks in post-production.$q$, $q$It supports simultaneous livestreaming to platforms like YouTube, LinkedIn, Facebook, Twitch, Instagram, and X, alongside an AI Editor for transcript-based editing and LiveEdit tools for real-time production control.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', $q$who-its-for$q$, $q$Who Boomcaster is for$q$, 2, ARRAY[$q$Boomcaster is designed for solo podcasters, agencies, content networks, and businesses producing marketing videos, webinars, or training content that need reliable local recording plus multi-platform livestreaming.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('365cb646-7629-4791-a92b-ebcb79d3c233', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Alitu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$All-in-one podcast maker that automates recording, audio cleanup, editing, hosting, and publishing.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$38/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Alitu is an all-in-one podcast maker that automates recording, audio cleanup, editing, hosting, and one-click publishing.$q$,
  og_description = $q$Alitu is an all-in-one podcast maker that automates recording, audio cleanup, editing, hosting, and one-click publishing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Built-in recorder$q$, $q$Record audio/video calls directly, or upload recordings from external sources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$AI-assisted editing$q$, $q$Transcript-based editing interface that lets users edit episodes at 2x speed.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Automatic audio cleanup$q$, $q$Removes background noise, normalizes volume, and enhances voice quality automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Magic Filters$q$, $q$Automatically removes filler words and silence from episodes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Podcast hosting$q$, $q$Free hosting up to 1,000 downloads/month, distributing to Apple Podcasts, Spotify, and a custom website.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$AI-generated show notes and transcripts$q$, $q$Generates show notes and transcripts, with transcripts available in 17 languages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$One-click publishing$q$, $q$Schedules and publishes episodes across distribution platforms in one click.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Combines recording, editing, hosting, and publishing in a single tool aimed at non-technical users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Automatic noise removal, normalization, and filler-word cutting reduce manual editing work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Free hosting included up to 1,000 downloads/month$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$7-day free trial with full feature access and a 30-day money-back guarantee$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Premium hosting beyond 1,000 downloads/month costs extra ($10/month for up to 10,000 downloads)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Standard plan is a single-show subscription; additional shows cost extra (2 shows priced at $63/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Done-for-you editing service is a separate, considerably higher-priced add-on starting at $295/month$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$What is Alitu used for?$q$, $q$Alitu is an all-in-one podcast maker that automates recording, audio cleanup, editing, hosting, and publishing so episodes can be produced in about 20 minutes.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$How much does Alitu cost?$q$, $q$The Standard plan is $38/month, or $32/month billed annually, with a 7-day free trial and a 30-day money-back guarantee.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Does Alitu offer podcast hosting?$q$, $q$Yes, free hosting is included for up to 1,000 downloads/month, with premium hosting available for $10/month for up to 10,000 downloads.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Can Alitu produce show notes automatically?$q$, $q$Yes, it generates AI show notes and provides transcripts in 17 languages.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Does Alitu offer a done-for-you editing service?$q$, $q$Yes, a premium editing service is available starting at $295/month (first month $1), with weekly or fortnightly plans and a 4-day turnaround.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Beginner podcast production$q$, $q$Record, automatically clean up, and publish episodes with minimal audio production experience.$q$, $q$Non-technical podcast creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Fast episode turnaround$q$, $q$Use Magic Filters and transcript-based editing to produce episodes in around 20 minutes.$q$, $q$Solo podcasters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Multi-show podcasting$q$, $q$Run more than one show under a multi-show pricing plan.$q$, $q$Podcast networks and hosts with multiple shows$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Standard$q$, $q$$38/month (or $32/month billed annually)$q$, $q$monthly$q$, $q$["Lossless audio recording, 1080p video download","Automatic noise removal","Magic Filters","Drag-and-drop episode builder","Free hosting up to 1,000 downloads/month","AI-generated show notes","Transcripts in 17 languages"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Done-For-You Editing$q$, $q$From $295/month (first month $1)$q$, $q$monthly$q$, $q$["Professional episode editing","Weekly or fortnightly plans","4-day turnaround","All Standard plan features included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$2 Shows$q$, $q$$63/month$q$, $q$monthly$q$, $q$["Multi-show pricing, saves $13/month versus individual plans"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$overview$q$, $q$What is Alitu?$q$, 2, ARRAY[$q$Alitu is an all-in-one podcast maker that automates the technical parts of podcast production, including recording, audio cleanup, transcript-based editing, hosting, and one-click publishing to platforms like Apple Podcasts and Spotify.$q$, $q$Its automatic noise removal, volume normalization, and Magic Filters (which strip filler words and silence) are designed to let creators finish an episode in about 20 minutes without prior audio editing experience.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$who-its-for$q$, $q$Who Alitu is for$q$, 2, ARRAY[$q$Alitu is aimed at non-technical creators who want to reduce the editing workload of podcasting and publish consistently, with a 7-day free trial and 30-day money-back guarantee to try it risk-free.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Hindenburg ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Audio editing software for journalists and podcasters, combining transcript-based and waveform editing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hindenburg PRO is audio editing software for journalists and podcasters, combining transcript-based and waveform editing.$q$,
  og_description = $q$Hindenburg PRO is audio editing software for journalists and podcasters, combining transcript-based and waveform editing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bccb27f4-8fb2-457f-97ab-9ab82be7cb63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bccb27f4-8fb2-457f-97ab-9ab82be7cb63' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Transcript-based editing$q$, $q$Edit audio by editing its transcript, alongside traditional waveform editing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Clipboard System$q$, $q$Organize and navigate large amounts of raw recorded material.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Video Track$q$, $q$Supports audio post-production work for video projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Manuscript$q$, $q$A word processor-style interface for editing audio.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Multitrack recording$q$, $q$Records multitrack sessions for debates or roundtable discussions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Transcription$q$, $q$Built-in transcription supporting 99 languages, with offline processing available; hours per month vary by plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Broadcast-ready loudness$q$, $q$Publishing tools output audio at broadcast-ready loudness levels.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Purpose-built for spoken-word editing (journalism, podcasts, radio) rather than music production$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Combines transcript-based editing with traditional waveform editing in one workspace$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Transcription supports 99 languages with an offline processing option$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Separate Field Recorder iPhone app and Narrator audiobook product extend the product line$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Endorsed publicly by James Cridland, founder of Podnews.net$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Exact subscription and perpetual license prices are not published on the main marketing pages$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Transcription hours are limited on lower tiers (e.g., Plus is capped at 20 hours/month, Premium at 50 hours/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$No free tier is indicated; only a trial is available$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$What is Hindenburg used for?$q$, $q$Hindenburg PRO is audio editing software designed for spoken-word production such as journalism, podcasting, and radio broadcasting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Does Hindenburg offer transcript-based editing?$q$, $q$Yes, it combines a Manuscript-style, word-processor interface for transcript-based editing with traditional waveform editing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Is there a free trial of Hindenburg?$q$, $q$Yes, a trial version is available; Hindenburg does not appear to offer a permanent free tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$What licensing options does Hindenburg offer?$q$, $q$It offers Standard, Plus, and Premium subscription tiers billed monthly or yearly, as well as a perpetual license option, with separate licensing for Personal, Business, and Education use.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Does Hindenburg have a mobile recording app?$q$, $q$Yes, Hindenburg Field Recorder is a separate iPhone app for field recording.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Podcast and radio editing$q$, $q$Edit spoken-word episodes using transcript-based and waveform editing tools.$q$, $q$Independent journalists and podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Field recording$q$, $q$Capture audio in the field using the companion iPhone app.$q$, $q$Radio broadcasters and reporters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Audiobook production$q$, $q$Produce audiobooks using the Narrator product built on the same editing workflow.$q$, $q$Audiobook producers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Standard$q$, $q$Not publicly listed$q$, $q$monthly$q$, $q$["Unlimited transcription","Basic sound library access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Plus$q$, $q$Not publicly listed$q$, $q$monthly$q$, $q$["20 hours/month transcription","Basic sound library access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$Premium$q$, $q$Not publicly listed$q$, $q$monthly$q$, $q$["50 hours/month transcription","Premium sound library access"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$overview$q$, $q$What is Hindenburg?$q$, 2, ARRAY[$q$Hindenburg (Hindenburg PRO) is audio editing software built specifically for spoken-word production rather than music. It combines transcript-based editing with a Manuscript word-processor-style interface and traditional waveform editing.$q$, $q$The product line also includes Narrator for audiobook production and a separate Field Recorder iPhone app, alongside features like multitrack recording, 99-language transcription, and broadcast-ready loudness output for publishing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', $q$who-its-for$q$, $q$Who Hindenburg is for$q$, 2, ARRAY[$q$Hindenburg is aimed at independent journalists, podcasters, radio broadcasters, and audio storytellers, along with educational institutions, organizations, and non-profits that produce spoken-word audio content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bccb27f4-8fb2-457f-97ab-9ab82be7cb63', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Transistor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Podcast hosting platform with unlimited shows, video podcast support, AI transcription, and dynamic ad insertion.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Transistor.fm is a podcast hosting platform offering unlimited shows, video podcast support, analytics, and AI transcription.$q$,
  og_description = $q$Transistor.fm is a podcast hosting platform offering unlimited shows, video podcast support, analytics, and AI transcription.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fc2d5e9c-d0f2-485e-b895-ac90c8c8411f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fc2d5e9c-d0f2-485e-b895-ac90c8c8411f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Unlimited podcast hosting$q$, $q$Hosts an unlimited number of shows on one account without per-show charges.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Video podcast support$q$, $q$Supports video podcasts with HLS distribution.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Private podcasts$q$, $q$Restrict episodes to members-only or team audiences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Automatic distribution$q$, $q$Publishes automatically to major podcast apps and players.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$AI transcription$q$, $q$Generates AI transcripts for episode content, sold as an add-on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Podcast website builder$q$, $q$Automatically generates a podcast website for each show.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Advanced analytics$q$, $q$Tracks downloads, subscribers, and listening trends.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Dynamic ad insertion$q$, $q$Supports pre-roll, mid-roll, and post-roll dynamic ads, available from the Professional plan.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Unlimited shows and team members on every plan, without per-show fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$14-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Supports video podcasts with automatic YouTube posting on Professional plan and above$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Built-in podcast website and network website included$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$API access included for developers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Branding removal requires the Business plan ($99/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$AI transcription is a separate paid add-on rather than included in base plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Usage beyond 250K monthly downloads or 3K private subscribers requires custom Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$How much does Transistor cost?$q$, $q$Plans start at $19/month for the Starter plan (20K monthly downloads), up to $99/month for Business (250K monthly downloads), with custom Enterprise pricing above that.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Does Transistor offer a free trial?$q$, $q$Yes, a 14-day free trial is available with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Can I host multiple podcasts on Transistor?$q$, $q$Yes, all plans include unlimited podcasts and unlimited team members on one account.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Does Transistor support video podcasts?$q$, $q$Yes, it supports video podcasts with HLS distribution, and Professional plan and above can auto-post episodes to YouTube.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Is transcription included in Transistor plans?$q$, $q$AI transcription is available as a paid add-on (5 or 20 hours/month) rather than bundled into the base plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Independent podcast hosting$q$, $q$Host and distribute a podcast to Apple Podcasts, Spotify, and other apps from one dashboard.$q$, $q$Independent podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Private/members-only podcasts$q$, $q$Restrict episode access to paying members or internal teams.$q$, $q$Membership-based creators and businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Podcast networks$q$, $q$Manage multiple shows under one account with a shared network website.$q$, $q$Podcast networks and media companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Starter$q$, $q$$19/month$q$, $q$monthly$q$, $q$["Unlimited podcasts and team members","50 private podcast subscribers","20K monthly downloads","Advanced analytics","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Professional$q$, $q$$49/month$q$, $q$monthly$q$, $q$["500 private podcast subscribers","100K monthly downloads","Dynamic ads","Auto-post to YouTube"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Business$q$, $q$$99/month$q$, $q$monthly$q$, $q$["3K private podcast subscribers","250K monthly downloads","Remove branding"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$Enterprise$q$, $q$$199+/month$q$, $q$monthly$q$, $q$["Custom download and subscriber limits","Contact sales"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$overview$q$, $q$What is Transistor?$q$, 2, ARRAY[$q$Transistor (Transistor.fm) is a podcast hosting and distribution platform that lets creators publish audio and video podcasts to Apple Podcasts, Spotify, YouTube, and Pocket Casts from a single dashboard.$q$, $q$Every plan includes unlimited shows and team members, with paid tiers scaling by monthly download volume and adding features like dynamic ad insertion, private podcasts, and YouTube auto-posting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', $q$who-its-for$q$, $q$Who Transistor is for$q$, 2, ARRAY[$q$Transistor targets independent podcasters, content creators, brands, and podcast networks that want an all-in-one hosting solution without per-show pricing, backed by a 14-day free trial.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc2d5e9c-d0f2-485e-b895-ac90c8c8411f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


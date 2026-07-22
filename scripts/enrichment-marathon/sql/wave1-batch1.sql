-- Enrichment marathon batch: 0 A.D., 15Five, 1Password, 7shifts, 8x8

-- ── 0 A.D. ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$0 A.D. is a free, open-source real-time strategy game covering ancient warfare from roughly 500 BC to 500 AD, built by the volunteer team Wildfire Games for Windows, macOS, and Linux.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$0 A.D.: Free Open-Source RTS Game of Ancient Warfare$q$, seo_title),
  seo_meta_description = COALESCE($q$0 A.D. is a free, open-source real-time strategy game set in ancient warfare with 15+ civilizations. Available for Windows, macOS, and Linux.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$0 A.D. is a free, open-source real-time strategy (RTS) video game set in the period of ancient warfare, roughly 500 BC to 500 AD. It is developed by Wildfire Games, an international team of volunteer contributors, and distributed at no cost with no in-app purchases or advertising. The game's source code is released under the GNU General Public License v2, and its artwork is licensed under Creative Commons Attribution Share-Alike 3.0, meaning players can download, redistribute, modify, and contribute to the project. 0 A.D. features 15 or more playable historical civilizations (including a Germanic civilization added in Release 28), single-player campaign scenarios, and online multiplayer matches, with gameplay emphasizing historically grounded unit and building design, city-building, resource management, and army combat typical of the RTS genre. Release 28, codenamed 'Boiorix' and published in February 2026, marked the game's first non-alpha release after years in the Alpha phase (Alpha 27 shipped January 2025), reflecting a maturing codebase and release cadence. The game runs natively on Windows 10/11 (64-bit), macOS 10.15 and later, and Linux, with Linux builds distributed as AppImage, Snap, and Flatpak packages; the latest release dropped support for Windows 7 and 8.1. 0 A.D. is aimed at strategy-game enthusiasts, history buffs, and open-source hobbyists who want an Age of Empires-style RTS without any cost or monetization, and technically inclined users can contribute code, art, translations, or documentation directly to the Wildfire Games project.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$15+ playable civilizations$q$, $q$Historically themed civilizations, including a Germanic civilization added in Release 28.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Campaign & skirmish modes$q$, $q$Single-player campaign scenarios alongside customizable skirmish matches.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Online multiplayer$q$, $q$Play real-time strategy matches against other players online.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Open-source & moddable$q$, $q$GPLv2-licensed code and CC BY-SA 3.0 artwork that anyone can inspect, modify, or extend.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Cross-platform support$q$, $q$Native builds for Windows, macOS, and Linux (AppImage, Snap, Flatpak).$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Completely free with no purchases, subscriptions, or ads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Fully open source and moddable under GPLv2/CC BY-SA$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Actively developed by a volunteer community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Historically detailed civilizations, units, and buildings$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Only recently exited alpha status (Release 28, February 2026)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$No official studio-run support line — support relies on the volunteer community$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Update pace depends on volunteer contributor availability$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Is 0 A.D. free to play?$q$, $q$Yes, 0 A.D. is completely free, with no purchases, subscriptions, or ads.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$What platforms does 0 A.D. support?$q$, $q$Windows 10/11 (64-bit), macOS 10.15+, and Linux (AppImage, Snap, and Flatpak builds).$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Is 0 A.D. still in alpha?$q$, $q$No. Release 28, 'Boiorix' (February 2026), is the game's first non-alpha release.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Can I modify or contribute to 0 A.D.?$q$, $q$Yes. The code is GPLv2-licensed and the artwork is CC BY-SA 3.0, and Wildfire Games accepts contributions from coders, artists, translators, and testers.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Free alternative to commercial RTS games$q$, $q$A no-cost, ad-free real-time strategy game for players who don't want to pay for a genre entry.$q$, $q$Strategy gamers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$History-themed gaming$q$, $q$Historically grounded civilizations and units set in the ancient world.$q$, $q$History enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Open-source contribution and modding$q$, $q$A GPLv2/CC BY-SA codebase that volunteers can extend, mod, or translate.$q$, $q$Developers & hobbyist modders$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$0 A.D. is a real-time strategy game of ancient warfare, developed and maintained entirely by Wildfire Games, an international volunteer team. The game is completely free, with no purchase price, subscriptions, in-app purchases, or advertising.$q$, $q$The project is fully open source: its code is licensed under the GNU General Public License v2 and its artwork under Creative Commons Attribution Share-Alike 3.0, so anyone can download, redistribute, modify, or contribute to it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The game includes 15 or more playable historical civilizations, with a Germanic civilization added in Release 28. Players can take on single-player campaign scenarios or compete in online multiplayer matches.$q$, $q$Recent releases have added gendered civilian units, direct font rendering to support East Asian languages, and expanded customization options for setting up games, alongside the core city-building, resource-management, and combat gameplay typical of the RTS genre.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$platforms-system-requirements$q$, $q$Platforms$q$, 2, ARRAY[$q$0 A.D. runs natively on Windows 10/11 (64-bit), macOS 10.15 and later, and Linux, where it is distributed as AppImage, Snap, and Flatpak packages. The most recent release dropped support for Windows 7 and 8.1.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$development-history$q$, $q$Development & Release History$q$, 2, ARRAY[$q$0 A.D. spent years in Alpha development, with Alpha 27 shipping in January 2025. Release 28, codenamed 'Boiorix,' launched in February 2026 as the game's first non-alpha release, signaling a more mature, stable codebase and a more regular update cadence going forward.$q$, $q$Wildfire Games actively recruits volunteer contributors across video editing, social media, website design, quality testing, translation, and programming.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$0 A.D. suits strategy-game fans and history enthusiasts who want a detailed, historically themed RTS without any cost, as well as open-source contributors and modders who want to work directly on a community-driven game engine.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── 15Five ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$15Five is an AI-powered performance management platform that unifies performance reviews, engagement surveys, OKRs, and manager coaching for HR and people teams.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (per user/month, billed annually)$q$, pricing_model),
  starting_price = COALESCE($q$$4/user/month (Engage plan, billed annually)$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, CA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$15Five: AI-Powered Performance Management Software$q$, seo_title),
  seo_meta_description = COALESCE($q$15Five combines performance reviews, engagement surveys, OKRs, and AI manager coaching in one platform. Plans start at $4/user/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$15Five is a people-management and performance platform used by HR teams and managers to run performance reviews, measure employee engagement, track OKRs and goals, and coach managers. Founded in 2011 by David Hassell and headquartered in San Francisco, California, the company serves over 3,000 customers and roughly 250,000 employees, including HubSpot, Udemy, MongoDB, and BetterUp. The product is organized into modules customers can combine: Engage (engagement surveys, targeted assessments, action planning, heat maps, and benchmarking), Perform (AI-assisted performance reviews, 360-degree feedback, OKRs, talent matrices, and career paths), and a Total Platform tier that bundles both plus manager-training microlearning. 15Five also sells add-ons, including Kona, an AI coaching and meeting-assistant tool for managers, plus dedicated compensation-management and manager-development content packages. Pricing is per user per month, billed annually: Engage starts at $4/user/month, Perform at $11/user/month, and the Total Platform bundle at $16/user/month, with add-ons priced separately (Kona AI Meeting Assistant at $2/employee/month, Kona AI Coach at $19/manager/month, and Compensation starting at $9/user/month). 15Five is delivered as a web application with companion iOS and Android mobile apps. It is best suited to mid-market and enterprise HR and people teams that want to consolidate performance reviews, engagement measurement, goal tracking, and manager coaching into a single AI-assisted system rather than running separate point tools for each function.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '172aeb66-4aac-42c5-b5fb-820fded05cd2' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$AI-assisted performance reviews$q$, $q$AI helps managers and employees write and calibrate performance reviews.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Engagement surveys$q$, $q$Predictive analytics, targeted assessments, and heat-map breakdowns to measure engagement.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$OKRs & goals$q$, $q$Goal tracking integrated with performance reviews and 360-degree feedback.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Kona AI manager coaching$q$, $q$Add-on AI meeting assistant and coaching tool built for people managers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Compensation management$q$, $q$Pay-range management and salary benchmarking as an add-on module.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Growth Studio$q$, $q$Talent-matrix visualization and succession-planning tools.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Combines performance, engagement, and compensation in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$AI-assisted review writing and dedicated manager coaching (Kona)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Strong analytics and benchmarking for HR leaders$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Modular pricing lets teams start with just Engage or Perform$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Total Platform plus add-ons (Kona, Compensation) can add up in cost for larger organizations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Feature depth is oriented toward mid-market/enterprise HR teams, which may be more than very small teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Some capabilities (Kona Coach, Manager Content) are priced as separate add-ons rather than included$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$How much does 15Five cost?$q$, $q$Billed annually per user/month: Engage is $4, Perform is $11, and Total Platform is $16, plus optional add-ons like Kona AI and Compensation.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Does 15Five have mobile apps?$q$, $q$Yes, iOS and Android apps are available alongside the web platform.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$What is Kona?$q$, $q$Kona is 15Five's AI coaching tool for managers, offered as a paid add-on with meeting-assistant and coaching tiers.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Who uses 15Five?$q$, $q$Companies including HubSpot, Udemy, MongoDB, and BetterUp use 15Five for performance and engagement management.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Performance review cycles$q$, $q$AI-assisted reviews, 360-degree feedback, and calibration for mid-market and enterprise HR teams.$q$, $q$HR & people teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Employee engagement measurement$q$, $q$Engagement surveys, benchmarking, and action planning to track and improve engagement.$q$, $q$People operations leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Manager coaching and development$q$, $q$AI coaching via Kona plus manager-training content to build stronger managers.$q$, $q$People managers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Compensation benchmarking$q$, $q$Pay-range management and salary benchmarking as part of total-rewards planning.$q$, $q$Compensation & HR teams$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Engage$q$, $q$$4$q$, $q$per user/month, billed annually$q$, NULL, $q$["Engagement surveys","Targeted assessments","Action planning","Heat maps & data breakdowns","Benchmarking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Perform$q$, $q$$11$q$, $q$per user/month, billed annually$q$, NULL, $q$["AI-assisted performance reviews","15Five AI Agents","OKRs & goals","360° feedback","Talent matrix","Career paths & plans"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$Total Platform$q$, $q$$16$q$, $q$per user/month, billed annually$q$, NULL, $q$["Everything in Engage","Everything in Perform","Manager training microlearnings"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '172aeb66-4aac-42c5-b5fb-820fded05cd2';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$15Five is a people-management platform that brings performance reviews, employee engagement, goal tracking, and manager coaching into one system. Founded in 2011 by David Hassell and headquartered in San Francisco, the company reports over 3,000 customers and roughly 250,000 employees on the platform, including HubSpot, Udemy, MongoDB, and BetterUp.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform is built around modular products: Engage covers engagement surveys, targeted assessments, action planning, and benchmarking with heat-map data breakdowns. Perform covers AI-assisted performance reviews, 360-degree feedback, OKRs and goals, talent matrices, and career paths and plans.$q$, $q$A Growth Studio module adds talent-matrix visualization and succession planning, while an Outcomes Dashboard gives HR leaders data visualization and strategic analytics across the organization.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$ai-capabilities$q$, $q$AI Capabilities$q$, 2, ARRAY[$q$15Five includes AI Agents that automate workflows such as Focus Briefs and AI-assisted review writing. Kona, a separate AI coaching and meeting-assistant add-on, gives managers real-time coaching and 1-on-1 support.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$All core plans are billed annually per user per month: Engage costs $4, Perform costs $11 (marked as the most popular plan), and Total Platform — which combines Engage and Perform plus manager-training microlearning — costs $16.$q$, $q$Add-ons are priced separately: Manager Products content is $49/manager/month with coaching credits at $399 each; Kona AI runs $2/employee/month for the Meeting Assistant and $19/manager/month for the Coach; and Compensation starts at $9/user/month, or $11/user/month with salary benchmarking included.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$15Five targets mid-market and enterprise organizations that want to improve manager effectiveness, employee retention, and engagement through one connected platform rather than separate review, survey, and coaching tools.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('172aeb66-4aac-42c5-b5fb-820fded05cd2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── 1Password ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$1Password is a password manager and secrets-management platform that stores, generates, and autofills passwords, passkeys, and credentials for individuals, families, and businesses.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid subscription plans$q$, pricing_model),
  starting_price = COALESCE($q$$2.99/month (Individual plan, billed annually)$q$, starting_price),
  founded_year = COALESCE(2005, founded_year),
  company_size = COALESCE($q$~2,950 employees (2026)$q$, company_size),
  headquarters = COALESCE($q$Toronto, Ontario, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$1Password: Password Manager & Secrets Management$q$, seo_title),
  seo_meta_description = COALESCE($q$1Password stores and autofills passwords, passkeys, and secrets for individuals, families, and businesses. Plans start at $2.99/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$1Password is a password manager and identity/secrets-management platform originally built by AgileBits, founded in 2005 and headquartered in Toronto, Ontario, Canada. It stores passwords, passkeys, and other credentials in an encrypted vault and autofills them across browsers and apps, and has expanded from a consumer password manager into a broader access-management platform covering both human and machine/AI-agent credentials. The company states that 180,000+ businesses trust 1Password, with enterprise customers including Canva, Asana, Slack, Salesforce, and IBM. Core products include Individual and Families plans for personal password/passkey storage and secure sharing; a Business tier adding SSO integrations (Okta, Microsoft Entra ID, OneLogin, Duo), role-based permissions, and Watchtower security-posture monitoring; a Secrets Manager for developers and automated systems/CI pipelines; a SaaS Manager for discovering shadow-IT applications and tracking SaaS spend; and Device Trust for endpoint compliance checks. Pricing is subscription-based with a 14-day free trial on every tier: Individual starts around $2.99/month billed annually ($3.99 month-to-month), Families around $4.49/month annually (up to 5 members), a Teams Starter Pack around $24.95/month for 10 members, and Business around $8.99/user/month billed annually, with consumption-based Enterprise pricing (including an MSP edition) for larger organizations. 1Password is available on macOS, Windows, iOS, Android, and Linux, as browser extensions, and via a command-line interface. It suits individuals and families wanting a secure single vault for passwords and passkeys, and IT/security teams needing centralized credential governance, SSO, and secrets management across an organization.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Password & passkey storage with autofill$q$, $q$Encrypted vault with autofill across browsers, apps, and devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Watchtower security monitoring$q$, $q$Flags weak, reused, and breached credentials across an account or organization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Secure item sharing$q$, $q$Shared vaults with granular, role-based permissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$SSO integrations$q$, $q$Business plans integrate with Okta, Microsoft Entra ID, OneLogin, and Duo.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Secrets Manager$q$, $q$Programmatic credential access for developers and CI/CD pipelines via CLI.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$SaaS Manager$q$, $q$Discovers shadow-IT applications and tracks SaaS spend and access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Device Trust$q$, $q$Endpoint compliance checks that gate access by device trust status.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Available on virtually every major platform: desktop, mobile, browser, and CLI$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Extends beyond consumer password management into business SSO, secrets, and device trust$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Every tier includes a 14-day free trial$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Strong enterprise integrations, including major SSO providers$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$No permanent free tier — all plans require payment after the trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Business features (SaaS Manager, Device Trust, Secrets Manager) are positioned and priced separately from core password management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Per-seat team pricing can add up for larger organizations$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$How much does 1Password cost?$q$, $q$Individual starts at $2.99/month billed annually, Families at $4.49/month, and Business at $8.99/user/month billed annually — all with a 14-day free trial.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Is there a free version of 1Password?$q$, $q$There is no permanent free plan; every tier offers a 14-day free trial.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$What platforms does 1Password support?$q$, $q$macOS, Windows, iOS, Android, Linux, browser extensions, and a command-line interface.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Does 1Password support single sign-on (SSO)?$q$, $q$Yes, Business plans integrate with Okta, Microsoft Entra ID, OneLogin, and Duo.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Can developers use 1Password for secrets management?$q$, $q$Yes, via the Secrets Manager and CLI, which support automated systems and CI/CD pipelines.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Personal & family password management$q$, $q$A shared vault for passwords, passkeys, and sensitive documents across family members.$q$, $q$Individuals & families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Business credential governance$q$, $q$Centralized password and access policy enforcement with SSO and Watchtower reporting.$q$, $q$IT & security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Developer secrets management$q$, $q$Programmatic secrets retrieval inside CI/CD pipelines and automated systems.$q$, $q$Developers & DevOps teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$SaaS discovery and spend tracking$q$, $q$Identifying unsanctioned applications and tracking software spend across the org.$q$, $q$IT operations$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Individual$q$, $q$$2.99/month (annual) or $3.99/month (monthly)$q$, $q$per month$q$, NULL, $q$["Password generation","Autosave & autofill","Secure sharing","Multi-device support","Breach alerts","14-day free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Families$q$, $q$$4.49/month (annual) or $5.99/month (monthly)$q$, $q$per month$q$, NULL, $q$["All Individual features","Up to 5 family members","Unlimited shared vaults","Admin controls","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Teams Starter Pack$q$, $q$$24.95/month (includes 10 members)$q$, $q$per month, billed annually$q$, NULL, $q$["Password sharing","Security alerts","Role-based permissions","Developer tools","14-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$Business$q$, $q$$8.99/user/month$q$, $q$per user/month, billed annually$q$, NULL, $q$["All Teams features","SSO integration (Okta, Entra ID, OneLogin, Duo)","Vault sharing with permissions","Watchtower alerts","Custom reporting","14-day free trial"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'ff4fea63-36be-46a2-9ac6-c1325b9d024a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$1Password is a password manager and access-management platform founded in 2005 (originally by AgileBits) and headquartered in Toronto, Ontario, Canada. It stores credentials in an encrypted vault and autofills them across browsers, apps, and devices.$q$, $q$The company says 180,000+ businesses trust 1Password, with enterprise customers including Canva, Asana, Slack, Salesforce, and IBM.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beyond core password and passkey storage, 1Password includes Watchtower, which surfaces weak, reused, and breached credentials, and secure item sharing through shared vaults with granular permissions.$q$, $q$For businesses, it adds SSO integrations with Okta, Microsoft Entra ID, OneLogin, and Duo, plus role-based access controls and custom security reporting.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$secrets-management-devops$q$, $q$Secrets Management for Developers$q$, 2, ARRAY[$q$1Password's Secrets Manager and command-line interface let developers and automated systems retrieve credentials programmatically, making it usable inside CI/CD pipelines rather than only interactive logins.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$saas-manager-device-trust$q$, $q$SaaS Manager & Device Trust$q$, 2, ARRAY[$q$SaaS Manager helps IT teams discover unsanctioned ('shadow IT') applications and track SaaS spend and access across an organization. Device Trust extends endpoint compliance checks so only trusted, compliant devices can access company resources.$q$, $q$The company also markets 'Unified Access' governance for both human and AI-agent credential use, reflecting an expansion beyond traditional password management.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Every 1Password plan includes a 14-day free trial. Individual starts around $2.99/month billed annually ($3.99 month-to-month); Families is around $4.49/month annually for up to 5 members ($5.99 month-to-month).$q$, $q$On the business side, a Teams Starter Pack covers 10 members for about $24.95/month, Business runs about $8.99/user/month billed annually and adds SSO and Watchtower reporting, and larger organizations — including managed service providers — can access consumption-based Enterprise Password Manager pricing.$q$]::text[], 4);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$1Password is available on macOS, Windows, iOS, Android, and Linux, plus browser extensions and a command-line interface, covering nearly every major desktop, mobile, and developer environment.$q$]::text[], 5);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and families who want one secure vault for passwords and passkeys use the personal plans, while IT and security teams use the business tiers for centralized credential governance, SSO enforcement, and developer secrets management.$q$]::text[], 6);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4fea63-36be-46a2-9ac6-c1325b9d024a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── 7shifts ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$7shifts is a restaurant team-management platform combining employee scheduling, hiring, training, payroll, and communication in one system for restaurant operators.$q$, short_description),
  pricing_model = COALESCE($q$Free plan + paid subscription tiers (per location/month)$q$, pricing_model),
  starting_price = COALESCE($q$Free (Comp plan)$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$400+ employees (as of 2024)$q$, company_size),
  headquarters = COALESCE($q$Saskatoon, Saskatchewan, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$7shifts: Restaurant Scheduling & Team Management$q$, seo_title),
  seo_meta_description = COALESCE($q$7shifts helps restaurants schedule staff, run payroll, hire, and train teams. Free Comp plan available; paid plans start around $39.99/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$7shifts is a team-management platform built specifically for restaurants, founded in 2014 by Jordan Boesch and headquartered in Saskatoon, Saskatchewan, Canada. It is used by more than 55,000 restaurants and roughly 1.5 million restaurant professionals, and the company reports processing over $1 billion in payroll through the platform. 7shifts consolidates several restaurant-operations workflows into one system: employee scheduling with demand forecasting and labor-compliance tools, shift swaps with manager approval, hiring (job postings, applicant tracking, digital onboarding), training (course creation, auto-generated quizzes, progress tracking), payroll (automatic wage/tip calculation, tax filing, earned wage access), and employee engagement (post-shift feedback, in-app team communication, performance insights). The platform integrates with major restaurant point-of-sale systems, including Square, Toast, Lightspeed, and TouchBistro. Pricing is structured per location per month: a free Comp plan covers basic scheduling for small operations, followed by paid tiers commonly marketed as Essentials, Pro, and Premium that add time clocking, labor-compliance features, PTO tracking, manager logbooks, and payroll add-ons, with custom Enterprise pricing for multi-location and franchise groups. Plans include a 14-day free trial with no credit card required, and 7shifts does not require long-term contracts. The product is delivered as a web app with iOS and Android mobile apps for managers and staff. It suits independent restaurants and multi-location restaurant groups replacing spreadsheets, paper schedules, or disconnected tools with a single system for scheduling, payroll, and team communication.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Employee scheduling$q$, $q$Demand forecasting, labor-compliance tools, and manager-approved shift swaps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Hiring & onboarding$q$, $q$Job postings, applicant tracking, and digital onboarding documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Training$q$, $q$Course creation from existing documents with auto-generated quizzes and progress tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Payroll$q$, $q$Automatic wage and tip calculation, tax filing, and earned wage access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Employee engagement$q$, $q$Post-shift feedback, performance insights, and in-app team communication.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$POS integrations$q$, $q$Syncs with Square, Toast, Lightspeed, TouchBistro, and other major restaurant POS systems.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Free Comp plan available for small restaurants$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Purpose-built for restaurant operations rather than a generic scheduling tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$No long-term contracts required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Broad POS integration support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Mobile apps for both managers and staff$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Payroll, training, and compliance tools are spread across paid tiers, so smaller operators may need to upgrade to access them$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Per-location pricing can add up for multi-location restaurant groups$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Enterprise pricing (50+ locations) requires a custom sales quote rather than transparent self-serve pricing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Is 7shifts free?$q$, $q$Yes, 7shifts offers a free Comp plan with basic scheduling; paid tiers add payroll, compliance, and training features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Does 7shifts integrate with my POS system?$q$, $q$It integrates with major POS systems including Square, Toast, Lightspeed, and TouchBistro.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Does 7shifts have mobile apps?$q$, $q$Yes, iOS and Android apps are available for managers and staff.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Does 7shifts require a contract?$q$, $q$No, 7shifts does not lock customers into long-term contracts.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Shift scheduling & labor compliance$q$, $q$Demand-based scheduling with built-in labor-compliance checks for independent restaurants.$q$, $q$Independent restaurants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Multi-location workforce management$q$, $q$Centralized scheduling and reporting across multiple restaurant locations or franchise units.$q$, $q$Multi-location & franchise groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Restaurant hiring & onboarding$q$, $q$Job postings, applicant tracking, and digital onboarding for hourly restaurant staff.$q$, $q$Restaurant managers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Payroll & tip calculation$q$, $q$Automated wage and tip payroll processing for hourly restaurant employees.$q$, $q$Restaurant operators$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Comp$q$, $q$Free$q$, $q$per location$q$, NULL, $q$["Basic scheduling","Team communication","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Essentials$q$, $q$$39.99/month (per location, up to 30 employees)$q$, $q$per month$q$, NULL, $q$["Time clocking","Advanced scheduling","Team communication","Customizable permissions"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Pro$q$, $q$$79.99/month (per location, up to 60 employees)$q$, $q$per month$q$, NULL, $q$["PTO accruals & balances","Labor compliance tools","Advanced time clocking","Manager logbook"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Premium$q$, $q$$134.99/month (per location) + $6/employee/month for payroll$q$, $q$per month$q$, NULL, $q$["All Pro features","Payroll add-on"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$Enterprise$q$, $q$Custom (50+ locations)$q$, $q$custom quote$q$, NULL, $q$["Volume pricing","Dedicated sales support"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = 'dab2599f-b02e-47f7-922b-5899a8b3d1c1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$7shifts is a team-management platform built specifically for restaurants, founded in 2014 by Jordan Boesch and headquartered in Saskatoon, Saskatchewan, Canada. The company describes itself as the platform behind restaurant teams, serving as a hub for scheduling, hiring, training, payroll, and communication.$q$, $q$7shifts reports over 55,000 restaurants and roughly 1.5 million restaurant professionals using the platform, with more than $1 billion in payroll processed through the system.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Scheduling includes demand forecasting, labor-compliance tools, and shift swaps that route through manager approval. Hiring covers job postings, applicant tracking, and digital onboarding documentation.$q$, $q$Training tools let managers build courses from existing documents with auto-generated quizzes and progress tracking. Payroll automates wage and tip calculations, tax filing, and earned wage access, while engagement features cover post-shift feedback, performance insights, and in-app communication.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$pos-integrations$q$, $q$POS Integrations$q$, 2, ARRAY[$q$7shifts integrates with major restaurant point-of-sale systems, including Square, Toast, Lightspeed, and TouchBistro, syncing sales and labor data to support scheduling and reporting.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Pricing runs per location per month. A free Comp plan covers basic scheduling and communication with no credit card required. Paid tiers — commonly marketed as Essentials, Pro, and Premium — add features like time clocking, PTO accrual, labor compliance, and manager logbooks as you move up, with payroll available as an add-on. Multi-location and franchise groups (50+ locations) get custom Enterprise pricing through sales.$q$, $q$All new users get a 14-day free trial, and 7shifts does not lock customers into long-term contracts.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$7shifts fits independent restaurants and multi-location or franchise restaurant groups that want to replace spreadsheets, paper schedules, or several disconnected tools with one system for scheduling, payroll, hiring, and communication.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dab2599f-b02e-47f7-922b-5899a8b3d1c1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── 8x8 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$8x8 is a cloud communications platform providing business phone (UCaaS), contact center (CCaaS), video meetings, and messaging APIs (CPaaS) for companies of all sizes.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (per user/month, tiered plans + custom enterprise quotes)$q$, pricing_model),
  starting_price = COALESCE($q$$15/user/month (Express plan, approximate)$q$, starting_price),
  founded_year = COALESCE(1987, founded_year),
  company_size = COALESCE($q$~1,950 employees (2024)$q$, company_size),
  headquarters = COALESCE($q$Campbell, CA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$8x8: Cloud Phone, Contact Center & Video Communications$q$, seo_title),
  seo_meta_description = COALESCE($q$8x8 provides cloud business phone, contact center, video meetings, and messaging APIs. X Series plans start around $15/user/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$8x8, Inc. (Nasdaq: EGHT) is a cloud communications and customer-experience software company founded in 1987 and headquartered in Campbell, California. Originally an integrated-circuit and graphics-accelerator maker under the name Integrated Information Technology, the company pivoted to VoIP in 2000, renamed itself 8x8, and has since built a unified cloud communications platform. Its X Series product line spans Unified Communications as a Service (UCaaS) — cloud business phone, team messaging, and video meetings — Contact Center as a Service (CCaaS) with omnichannel routing, AI-assisted agent tools, workforce engagement, and quality management, and a Communications Platform as a Service (CPaaS) offering SMS, voice, video, and authentication APIs for developers. 8x8 integrates with business tools including Salesforce, ServiceNow, HubSpot, Google Workspace, and Microsoft Teams/365. Pricing is tiered — commonly referred to as Express, X2, and X4, with higher tiers for larger contact-center deployments — priced per user per month with lower rates for annual billing than month-to-month; entry-level plans include unlimited US/Canada calling and basic video meetings, while higher tiers add calling to dozens of countries and larger video-meeting capacity. Many of 8x8's plans, especially contact-center and enterprise tiers, are quoted directly by sales rather than published with fixed self-serve pricing. As of its most recent public financial disclosure, the company reported roughly $729 million in annual revenue and about 1,950 employees. 8x8 serves small businesses up to large enterprises that want a single vendor for phone systems, contact-center software, video conferencing, and communications APIs rather than stitching together separate point solutions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd833b94c-8537-403d-b648-3070a9fce206';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd833b94c-8537-403d-b648-3070a9fce206' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Cloud business phone (UCaaS)$q$, $q$Cloud-hosted business phone system with unlimited-calling tiers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Video meetings$q$, $q$Video conferencing that scales up to 500 participants on higher tiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Team messaging$q$, $q$Built-in chat and messaging alongside calling and video.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Contact Center (CCaaS)$q$, $q$Omnichannel routing with AI-assisted agent tools, workforce engagement, and quality management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Communications APIs (CPaaS)$q$, $q$SMS, voice, video, and authentication APIs for developers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Business tool integrations$q$, $q$Connects with Salesforce, ServiceNow, HubSpot, Google Workspace, and Microsoft Teams/365.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Combines phone system, contact center, video, and APIs under one vendor$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Global calling coverage that expands with higher-tier plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Established, publicly traded company (Nasdaq: EGHT) with decades of telecom experience$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Strong ecosystem of CRM and helpdesk integrations$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Much of current pricing, especially for contact-center and enterprise tiers, is quote-based rather than published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Multiple overlapping product tiers (X Series levels) can make plan selection more complex$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Best value likely requires annual billing and negotiation rather than accepting list pricing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$What is 8x8's X Series?$q$, $q$8x8's tiered UCaaS/CCaaS product line (Express, X2, X4, and higher tiers), bundling phone, video, and messaging with increasing calling coverage and features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Does 8x8 offer an API for developers?$q$, $q$Yes, its CPaaS layer offers SMS, voice, video, and authentication APIs.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Is 8x8 pricing public?$q$, $q$Entry-level UCaaS plans have published starting prices, but contact-center and enterprise tiers are typically quoted by sales.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$What company owns 8x8?$q$, $q$8x8, Inc. is a publicly traded company on Nasdaq under the ticker EGHT.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Replacing on-premise phone systems$q$, $q$Moving from a legacy PBX to a cloud-hosted business phone system.$q$, $q$IT teams & small-to-midsize businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Running omnichannel contact centers$q$, $q$Managing customer support across voice, chat, and other channels with AI-assisted agent tools.$q$, $q$Customer support & contact-center teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Embedding communications in apps$q$, $q$Adding SMS, voice, or video capabilities to custom applications via CPaaS APIs.$q$, $q$Developers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Consolidating communications vendors$q$, $q$Combining phone, video, and contact-center software under a single platform contract.$q$, $q$Enterprise IT$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$Express$q$, $q$~$15/user/month$q$, $q$per month$q$, NULL, $q$["Unlimited US/Canada calling","Basic video meetings","Team messaging","Business phone number"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$X2$q$, $q$~$24/user/month (annual) or ~$28/user/month (monthly)$q$, $q$per month$q$, NULL, $q$["Calling to 14 countries","Video conferencing for up to 500 participants","Salesforce, Zendesk, and NetSuite integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$X4$q$, $q$~$44/user/month (annual) or ~$57/user/month (monthly)$q$, $q$per month$q$, NULL, $q$["Calling to 48 countries","Expanded contact-center-oriented features"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'd833b94c-8537-403d-b648-3070a9fce206';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$8x8, Inc. is a publicly traded cloud communications company (Nasdaq: EGHT), founded in 1987 and headquartered in Campbell, California. It began as a maker of integrated circuits and graphics accelerators under the name Integrated Information Technology, pivoted into VoIP in 2000, and later rebranded as 8x8 as it built out a broader cloud communications business.$q$, $q$The company's most recent public financial disclosure reported roughly $729 million in annual revenue and about 1,950 employees.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$8x8's platform, marketed as the X Series, covers three areas: Unified Communications as a Service (UCaaS) for cloud business phone, team messaging, and video meetings; Contact Center as a Service (CCaaS) with omnichannel routing, AI-assisted agent tools, workforce engagement, and quality management; and Communications Platform as a Service (CPaaS), offering SMS, voice, video, and authentication APIs for developers building custom communication features.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$8x8 integrates with widely used business software, including Salesforce, ServiceNow, HubSpot, Google Workspace, and Microsoft Teams/365, so calling, messaging, and contact-center data can connect with CRM and helpdesk workflows.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$8x8's UCaaS plans are commonly organized into tiers such as Express, X2, and X4, priced per user per month with discounted rates for annual billing versus month-to-month. Entry tiers include unlimited US/Canada calling and basic video meetings, while higher tiers extend calling coverage to dozens of countries and support larger video meetings.$q$, $q$For contact-center capabilities and larger deployments, 8x8 increasingly moves pricing behind a 'contact sales' process rather than publishing fixed self-serve rates, so exact costs for those tiers require a custom quote.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$company-background$q$, $q$Company Background$q$, 2, ARRAY[$q$8x8 has operated since 1987, shifting from hardware (integrated circuits, graphics accelerators) to VoIP services starting in 2000 and eventually into full cloud communications and contact-center software. It trades publicly on Nasdaq under the ticker EGHT.$q$]::text[], 4);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$8x8 fits organizations — from small businesses to large enterprises — that want to consolidate business phone systems, contact-center software, video conferencing, and communications APIs with a single, established vendor instead of combining several separate tools.$q$]::text[], 5);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d833b94c-8537-403d-b648-3070a9fce206', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;


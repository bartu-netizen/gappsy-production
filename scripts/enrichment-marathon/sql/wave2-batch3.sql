-- Enrichment marathon batch: AdventureLog, Adyen, Affine, Agenta, Agile CRM, Agiloft, Agorapulse, Aha!

-- ── AdventureLog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AdventureLog is a free, open-source, self-hosted travel journal app for logging trips, mapping visited places, and planning itineraries.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Italian$q$, $q$Chinese$q$, $q$Dutch$q$, $q$Swedish$q$, $q$Portuguese (Brazil)$q$, $q$Russian$q$]::text[],
  seo_title = COALESCE($q$AdventureLog: Free Open-Source Travel Journal$q$, seo_title),
  seo_meta_description = COALESCE($q$AdventureLog is a free, self-hosted, open-source app for logging adventures, mapping travels, and planning trip itineraries.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AdventureLog is an open-source, self-hosted travel journaling and trip-planning application maintained by Sean Morley and a community of contributors on GitHub, licensed under GPL 3.0. It lets users log individual adventures with photos, ratings, and descriptions, plot visited and planned locations on an interactive world map built with MapLibre, and track travel statistics such as countries, regions, and cities visited. The app supports detailed multi-day trip itineraries, including flight information and checklists, and allows collaborative trip planning with other users. It is built on a SvelteKit and TailwindCSS/DaisyUI frontend with a Django, PostGIS, and Django REST Framework backend. AdventureLog is completely free to use and is distributed only as self-hosted software, deployable via Docker, a curl-based installer, Synology NAS, Proxmox, and other common self-hosting methods; there is no official paid hosted (SaaS) version. A public demo is available at demo.adventurelog.app. The project targets individual travelers, families planning vacations, and digital nomads who want a privacy-respecting, data-owned alternative to closed travel-logging apps. Because it requires self-hosting, it is best suited to users comfortable running their own Docker-based infrastructure rather than non-technical users seeking a managed SaaS product.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Interactive world map$q$, $q$Track visited and planned locations on an interactive map built with MapLibre.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Adventure logging$q$, $q$Record trips with photos, ratings, and written descriptions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Itinerary planning$q$, $q$Plan multi-day trips with flight information and checklists.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Travel statistics dashboard$q$, $q$View stats on countries, regions, and cities visited.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Collaborative planning$q$, $q$Plan trips together with other users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Countries and regions explorer$q$, $q$Browse an interactive explorer of countries and regions.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Completely free and open source (GPL 3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Self-hosted, giving users full ownership of their travel data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Multiple deployment options (Docker, curl installer, Synology NAS, Proxmox)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Supports many languages$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$No official managed/hosted version — requires self-hosting and basic server administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$No dedicated native mobile app confirmed; accessed via web browser$q$, 1);

DELETE FROM tool_faqs WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Is AdventureLog free?$q$, $q$Yes, AdventureLog is completely free and open source under the GPL 3.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Do I need to self-host AdventureLog?$q$, $q$Yes, AdventureLog is only distributed as self-hosted software; there is no official paid hosted version, though a public demo is available.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$How do I install AdventureLog?$q$, $q$It can be installed via Docker, a curl-based installer, or on platforms like Synology NAS and Proxmox.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$What technology is AdventureLog built with?$q$, $q$The frontend uses SvelteKit, TailwindCSS, DaisyUI, and MapLibre; the backend uses Django, PostGIS, and Django REST Framework.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Personal travel journaling$q$, $q$Log trips with photos, ratings, and notes to build a personal travel history.$q$, $q$Individual travelers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Family trip planning$q$, $q$Plan multi-day itineraries with checklists and flight details collaboratively.$q$, $q$Families$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Location tracking for frequent travelers$q$, $q$Map visited countries, regions, and cities and track travel statistics over time.$q$, $q$Digital nomads$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Interactive world map","Adventure logging","Itinerary planning","Travel statistics dashboard","Collaborative planning"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'ae7e7673-dded-4176-856d-7eaad4bbfe3e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AdventureLog is an open-source travel journal and trip-planning application that lets users document adventures, map the places they've visited, and organize multi-day itineraries. It is released under the GPL 3.0 license and developed openly on GitHub.$q$, $q$Unlike hosted travel-logging services, AdventureLog is distributed exclusively as self-hosted software. Users run it themselves via Docker, a curl-based installer, or on platforms like Synology NAS and Proxmox, giving them full control over their own travel data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include an interactive world map for tracking visited and planned locations, adventure entries with photos and ratings, multi-day trip itineraries with flight details and checklists, a travel statistics dashboard, collaborative trip planning, and a countries/regions explorer.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AdventureLog suits travelers, families documenting vacations, and digital nomads who want a self-hosted, privacy-respecting alternative to commercial travel-logging apps. Because it requires running your own server, it is best suited to users with some familiarity with Docker-based self-hosting.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae7e7673-dded-4176-856d-7eaad4bbfe3e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Adyen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adyen is a global enterprise payments platform that lets businesses accept payments, manage payouts, and issue cards through a single integration.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$$0.13 per transaction + payment-method fee$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE($q$4,500+ employees$q$, company_size),
  headquarters = COALESCE($q$Amsterdam, Netherlands$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Adyen: Global Payments Platform for Enterprises$q$, seo_title),
  seo_meta_description = COALESCE($q$Adyen is an Amsterdam-based enterprise payments platform offering unified payment processing, payouts, and embedded finance for global businesses.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adyen is a publicly traded (Euronext Amsterdam: ADYEN) Dutch financial technology company, founded in 2006 by Pieter van der Does and Arnout Schuijff, and headquartered in Amsterdam with offices in roughly 29 locations worldwide and over 4,500 employees. Adyen provides a unified payments platform that lets enterprise businesses accept payments across online, in-app, and in-person channels through a single API integration, supporting 200+ local payment methods and 150+ currencies. Beyond payment acceptance, Adyen offers embedded finance products including card issuing, business accounts, and capital/lending, as well as global payouts, risk and fraud management tools, and data-driven reporting. The company holds banking licenses in the US, UK, and EU and reports processing around €1.4 trillion in transaction volume annually. Pricing is usage-based: Adyen charges a fixed processing fee of $0.13 per transaction plus a variable fee that depends on the payment method (e.g., card networks, wallets, or buy-now-pay-later providers), with Interchange++ pricing for card transactions and custom/negotiated pricing available for large merchants. There are no free or self-serve subscription tiers. Adyen primarily serves large, global enterprises in retail, travel and hospitality, digital media, SaaS, food and beverage, and financial services that need a single platform to manage payments, payouts, and financial operations at scale, rather than small businesses or individual developers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e899f32-2125-4293-9067-e8fb5b563734';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e899f32-2125-4293-9067-e8fb5b563734' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Unified payment acceptance$q$, $q$Accept payments online, in-app, and in-store through a single integration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$200+ local payment methods$q$, $q$Support for major cards, wallets, and region-specific payment methods across 150+ currencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Embedded finance$q$, $q$Issue cards, offer business accounts, and provide capital/lending directly on the platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Global payouts$q$, $q$Move funds to sellers, drivers, or partners with flexible currency and bank account options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Risk and fraud management$q$, $q$Built-in tools to reduce fraud and manage payment risk.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Regulatory compliance$q$, $q$Backed by banking licenses in the US, UK, and EU.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Single integration covers global payment methods, payouts, and embedded finance$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$High reported platform reliability (99.999% historical uptime)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Strong enterprise trust and scale, processing roughly €1.4 trillion annually$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Transparent Interchange++ pricing for card transactions$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$No free or self-serve pricing tier — pricing is usage-based and can require sales contact for custom rates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Not designed for very small businesses or hobbyist developers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Variable fees differ by payment method and region, making total cost less predictable upfront$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Is Adyen a publicly traded company?$q$, $q$Yes, Adyen is listed on Euronext Amsterdam (ADYEN).$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$What is Adyen's pricing model?$q$, $q$Adyen charges per transaction: a fixed fee of $0.13 plus a variable fee that depends on the payment method, with no monthly or setup fees.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Does Adyen support multiple currencies?$q$, $q$Yes, Adyen supports 150+ currencies and 200+ local payment methods.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Is Adyen suited for small businesses?$q$, $q$Adyen is primarily built for large, global enterprises rather than small businesses, though its usage-based pricing has no fixed monthly cost.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Enterprise e-commerce payments$q$, $q$Accept payments across web and mobile checkout with one integration.$q$, $q$Large online retailers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Marketplace and platform payouts$q$, $q$Route funds to sellers, drivers, or partners globally.$q$, $q$Marketplaces and platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Omnichannel retail$q$, $q$Unify online and in-person point-of-sale payments on one platform.$q$, $q$Retail and hospitality businesses$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$Pay-as-you-go$q$, $q$$0.13/transaction + variable payment-method fee$q$, $q$Per transaction$q$, NULL, $q$["No setup fee","No monthly fee","No closure fee","Custom pricing available for large merchants"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '5e899f32-2125-4293-9067-e8fb5b563734';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adyen is a Dutch fintech company, founded in 2006 and headquartered in Amsterdam, that provides a single platform for businesses to accept payments, manage payouts, and move money globally. The company is publicly traded on Euronext Amsterdam and operates from offices in roughly 29 locations worldwide with more than 4,500 employees.$q$, $q$The platform is built for large-scale, global commerce, combining payment acceptance, risk management, and embedded finance products into one integration rather than requiring separate vendors for each function.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Adyen supports payment acceptance across online, in-app, and point-of-sale channels through a single integration, with more than 200 local payment methods and support for 150+ currencies. It also offers embedded finance capabilities such as card issuing, business accounts, and capital/lending, along with global payouts, fraud and risk management tools, and real-time data insights.$q$, $q$Adyen holds banking licenses in the US, UK, and EU, and reports 99.999% historical platform uptime, positioning itself for merchants that need enterprise-grade reliability and compliance.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Adyen uses a usage-based, pay-per-transaction pricing model with no setup, monthly, or account closure fees. Merchants pay a fixed processing fee of $0.13 per transaction plus a variable fee that depends on the payment method used — for example, card payments use Interchange++ pricing plus roughly 0.60%, while methods like Alipay, WeChat Pay, or buy-now-pay-later services carry different variable rates. Custom pricing is negotiable for larger merchants, and there is no free plan.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e899f32-2125-4293-9067-e8fb5b563734', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Affine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AFFiNE is an open-source, local-first workspace combining documents, whiteboards, and databases as an alternative to Notion and Miro.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Singapore$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AFFiNE: Open-Source All-in-One Workspace$q$, seo_title),
  seo_meta_description = COALESCE($q$AFFiNE is an open-source, local-first workspace app combining documents, whiteboards, and databases, with free, Pro, and self-hosted plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AFFiNE is an open-source, local-first workspace application developed by Toeverything Pte. Ltd., a company headquartered in Singapore that describes AFFiNE as being founded in 2022. It combines block-based document editing, an infinite 'Edgeless' whiteboard for visual planning and mind mapping, and lightweight databases for project tracking into a single app, positioning it as an open-source alternative to Notion and Miro. AFFiNE also includes an AI assistant that helps with drafting, summarization, mind map generation, and slide creation. The project is open source (MIT-licensed editor) and has attracted more than 70,000 GitHub stars. It is available as both a cloud-hosted service (app.affine.pro) and self-hosted software, with native apps for Windows, macOS, Linux, iOS, and Android in addition to a web app. Pricing is freemium: a free plan includes unlimited local workspaces plus 10 GB of cloud storage, up to 3 workspace members, and 7-day version history; a Pro plan costs $6.75/month billed annually with expanded storage and version history; a Team plan is priced per seat; a fully free, self-hosted FOSS option is also available; and a one-time 'Believer' lifetime plan and custom Enterprise pricing exist for larger needs. AFFiNE targets individuals, startups, and organizations seeking a privacy-respecting, local-first productivity and collaboration tool, and it has been used by teams at organizations including universities and large tech companies.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b3923df9-f933-42f3-a870-8a16aaef419f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b3923df9-f933-42f3-a870-8a16aaef419f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Block-based docs$q$, $q$Write and organize notes and documents using a flexible block editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Edgeless whiteboard$q$, $q$Plan visually on an infinite canvas for mind maps and brainstorming.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Databases$q$, $q$Track projects and plans using lightweight built-in databases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$AI assistant$q$, $q$Draft content, summarize text, generate mind maps, and create slides with built-in AI.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Templates$q$, $q$Pre-built templates for digital planning, storyboards, Cornell notes, and more.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Self-hosting$q$, $q$Run AFFiNE on your own infrastructure for full data control.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Open source with a local-first, privacy-focused architecture$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Generous free tier plus a fully free self-hosted option$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Cross-platform support across web, desktop, and mobile$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Large, active open-source community (70K+ GitHub stars)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$AI features and expanded storage require paid Pro/Team plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Newer product still maturing relative to established competitors like Notion$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Some team collaboration features (multi-admin, priority support) are gated behind paid tiers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Is AFFiNE free?$q$, $q$Yes, AFFiNE has a free cloud tier and a fully free self-hosted FOSS edition, alongside paid Pro, Team, and Enterprise plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Is AFFiNE open source?$q$, $q$Yes, AFFiNE's editor is open source under the MIT license.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Can I self-host AFFiNE?$q$, $q$Yes, AFFiNE offers a self-hosted FOSS edition as well as a self-hosted Team plan.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$What platforms does AFFiNE support?$q$, $q$AFFiNE is available as a web app and native apps for Windows, macOS, Linux, iOS, and Android.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Individual note-taking and docs$q$, $q$Write and organize personal notes and documents.$q$, $q$Individual users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Team knowledge base and whiteboarding$q$, $q$Collaborate on documents, databases, and visual whiteboards.$q$, $q$Startups and teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Privacy-focused self-hosted deployment$q$, $q$Run AFFiNE on your own servers for full data ownership.$q$, $q$Privacy-conscious organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Unlimited local workspaces","10 GB cloud storage","Up to 3 workspace members","7-day version history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Pro$q$, $q$$6.75/month$q$, $q$Billed annually$q$, NULL, $q$["100 GB storage","Up to 10 members","30-day version history"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Team$q$, $q$$10/seat/month$q$, $q$Monthly$q$, NULL, $q$["100 GB + 20 GB per seat storage","Unlimited team members (10+ seats)","Priority support","Multiple admin roles"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Self-Hosted FOSS$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["MIT-licensed editor","Full data control"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Believer$q$, $q$$499.99 one-time$q$, $q$Lifetime$q$, NULL, $q$["Lifetime personal Pro access","1TB storage"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["100+ seats","For regulated industries"]$q$::jsonb, 5);

DELETE FROM tool_content_blocks WHERE tool_id = 'b3923df9-f933-42f3-a870-8a16aaef419f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AFFiNE is an open-source, local-first workspace built by Toeverything Pte. Ltd., a Singapore-based company that dates the project's founding to 2022. It combines documents, an infinite whiteboard, and lightweight databases into a single app, positioning itself as an open-source alternative to tools like Notion and Miro.$q$, $q$The project is open source (MIT-licensed editor) and has grown to more than 70,000 GitHub stars, with an active community across Discord and other channels.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include block-based document writing, an 'Edgeless' whiteboard for freeform visual planning and mind mapping, databases for project tracking, and a built-in AI assistant that helps draft content, summarize text, generate mind maps, and create slides. AFFiNE also ships with templates for use cases like digital planning, storyboards, and Cornell notes.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$AFFiNE offers a free tier with unlimited local workspaces and 10 GB of cloud storage, a Pro plan at $6.75/month (billed annually) with expanded storage and longer version history, a per-seat Team plan at $10/seat/month, a fully free self-hosted FOSS edition, a one-time $499.99 lifetime 'Believer' plan, and custom Enterprise and code-licensing options for larger organizations.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$AFFiNE is available as a web app, native desktop apps for Windows, macOS, and Linux, and mobile apps for iOS and Android, in addition to a self-hostable version for users who want full control over their data.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3923df9-f933-42f3-a870-8a16aaef419f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Agenta ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Agenta is an open-source LLMOps platform for prompt management, evaluation, and observability of LLM applications.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Berlin, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Agenta: Open-Source LLMOps Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Agenta is an open-source LLMOps platform for prompt management, evaluation, and observability of LLM applications, with free and paid plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Agenta is an open-source LLMOps platform operated by Agentatech UG, a company founded in Berlin, Germany in 2023 by Akrem Abayed and Dr. Mahmoud Mabrouk. It helps AI development teams build and maintain LLM applications by combining prompt management, evaluation, and observability in one product. Prompt management features include centralized, version-controlled prompt storage that works across model providers. Evaluation features support automated testing, including LLM-as-a-judge methods and human feedback collection, to replace informal 'vibe testing' with evidence-based iteration. Observability features provide request tracing, error detection, and live performance monitoring with regression alerts. Agenta also offers a collaboration UI that lets non-engineering domain experts edit and test prompts without writing code, and it integrates with frameworks and providers such as LangChain, LlamaIndex, and OpenAI without vendor lock-in. Agenta is available as a hosted SaaS product (cloud.agenta.ai) and as an open-source, self-hostable codebase on GitHub. Pricing is freemium: a free Hobby plan supports 2 users and 5,000 monthly traces with unlimited prompts and 20 evaluations/month; a Pro plan starts at $49/month; a Business plan starts at $399/month with SOC2 reporting, enterprise SSO, and role-based access control; and a custom Enterprise plan adds bring-your-own-cloud and dedicated support. Agenta is aimed at product managers, developers, and domain experts building and iterating on production LLM applications.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Prompt management$q$, $q$Centralized, version-controlled prompt storage that works across model providers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Automated evaluation$q$, $q$Run automated tests including LLM-as-a-judge evaluations and human feedback.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Observability$q$, $q$Trace requests, detect errors, and monitor live performance with regression alerts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$No-code prompt editing$q$, $q$Let domain experts and PMs edit and test prompts without writing code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Framework-agnostic integration$q$, $q$Works with LangChain, LlamaIndex, OpenAI, and other providers without vendor lock-in.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Self-hosting option$q$, $q$Deploy the open-source codebase on your own infrastructure.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Open source with a self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Free Hobby tier requires no credit card to start$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Combines prompt management, evaluation, and observability in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Framework- and model-agnostic, avoiding vendor lock-in$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Higher usage (traces) on paid plans incurs additional per-unit cost$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Enterprise features like SSO and SOC2 reports require the Business tier or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Smaller, newer company than some established LLMOps competitors$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Is Agenta open source?$q$, $q$Yes, Agenta's codebase is open source and available on GitHub for self-hosting.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Can I self-host Agenta?$q$, $q$Yes, in addition to the hosted cloud.agenta.ai SaaS product, Agenta can be self-hosted.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$What does Agenta cost?$q$, $q$Agenta has a free Hobby plan, a Pro plan starting at $49/month, a Business plan starting at $399/month, and custom Enterprise pricing.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Which LLM providers does Agenta support?$q$, $q$Agenta is model-agnostic and integrates with frameworks and providers such as LangChain, LlamaIndex, and OpenAI.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$LLM prompt engineering and versioning$q$, $q$Manage and version prompts across model providers.$q$, $q$AI developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$AI application evaluation and QA$q$, $q$Run automated and human-in-the-loop evaluations of LLM outputs.$q$, $q$Product managers and QA teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Production LLM observability$q$, $q$Trace and monitor live LLM application performance.$q$, $q$Engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Hobby$q$, $q$Free$q$, $q$Monthly$q$, NULL, $q$["2 users","5,000 traces/month","Unlimited prompts","20 evaluations/month","30-day retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Pro$q$, $q$$49/month$q$, $q$Monthly$q$, NULL, $q$["3 base users, up to 10 seats","10,000 traces/month","Unlimited evaluations","90-day retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Business$q$, $q$$399/month$q$, $q$Monthly$q$, NULL, $q$["Unlimited seats","1M traces/month","SOC2 reports","Enterprise SSO","365-day retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Volume pricing","Audit logs","Bring your own cloud","Dedicated support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'b79d9a0a-1374-4b1d-8cfb-7ea75374f391';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Agenta is an open-source LLMOps platform built by Agentatech UG, founded in Berlin in 2023 by Akrem Abayed and Dr. Mahmoud Mabrouk. It is designed to help AI teams move away from informal 'vibe testing' toward structured, evidence-based iteration on LLM applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Agenta combines prompt management with centralized, version-controlled storage that works across model providers; evaluation tools including automated testing, LLM-as-a-judge scoring, and human feedback collection; and observability features such as request tracing, error detection, and live performance monitoring with regression alerts. A no-code UI lets non-engineering domain experts edit and test prompts directly.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Agenta uses a freemium model. The free Hobby plan includes 2 users and 5,000 monthly traces. The Pro plan starts at $49/month with additional traces billed per 10,000. The Business plan starts at $399/month and adds SOC2 reporting, enterprise SSO, and role-based access control. A custom Enterprise plan adds bring-your-own-cloud deployment and dedicated support.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b79d9a0a-1374-4b1d-8cfb-7ea75374f391', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Agile CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Agile CRM is a cloud-based CRM combining contact management, marketing automation, telephony, and helpdesk tools for small and midsize businesses.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Agile CRM: All-in-One Sales & Marketing CRM$q$, seo_title),
  seo_meta_description = COALESCE($q$Agile CRM is a cloud-based CRM for small and midsize businesses, combining contact management, marketing automation, and telephony tools.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Agile CRM is a cloud-based customer relationship management platform aimed at small and midsize businesses, combining sales, marketing automation, and customer service tools in one product. Core capabilities include contact and deal management, marketing automation such as web pop-ups, email newsletters, autoresponders, and lead scoring, built-in telephony for making and recording calls, appointment scheduling, a landing-page builder, and a helpdesk/knowledge base for customer support. The platform integrates with more than 30 third-party tools, including Zapier, Mailchimp, WordPress, Twilio, QuickBooks, and Meta for Business. Agile CRM offers a free plan supporting up to 10 users, with paid tiers—Starter, Regular, and Enterprise—priced per user per month and varying in cost depending on billing term (monthly, annual, or two-year commitment). Publicly reported founding-year and headquarters details vary across third-party sources, so those specifics are not stated with confidence here. Agile CRM is positioned as a lower-cost, all-in-one alternative to larger CRM suites for small businesses and startups that want sales, marketing, and support functionality without piecing together multiple point tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Contact and deal management$q$, $q$Track contacts and sales deals in a central CRM database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Marketing automation$q$, $q$Build automated campaigns with web pop-ups, autoresponders, and lead scoring.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Built-in telephony$q$, $q$Make, receive, and record calls, and take notes directly in the CRM.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Appointment scheduling$q$, $q$Let prospects and customers book meetings directly.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Landing page builder$q$, $q$Create landing pages to capture and convert leads.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Helpdesk and knowledge base$q$, $q$Handle customer support tickets and self-serve documentation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Third-party integrations$q$, $q$Connect with over 30 tools including Zapier, Mailchimp, WordPress, Twilio, and QuickBooks.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Free plan available for up to 10 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Combines sales, marketing automation, and support in one product$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Built-in telephony without needing a separate calling tool$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Broad third-party integration support$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Pricing varies significantly depending on billing term, which can be confusing to compare$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Interface and UX are considered dated by some reviewers compared to newer CRMs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Fewer AI-driven features than many newer CRM entrants$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Is Agile CRM free?$q$, $q$Yes, Agile CRM offers a free plan that supports up to 10 users.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$What paid plans does Agile CRM offer?$q$, $q$Agile CRM offers Starter, Regular, and Enterprise paid tiers, priced per user per month.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Does Agile CRM include telephony?$q$, $q$Yes, Agile CRM includes built-in telephony for making, receiving, and recording calls.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$What integrations does Agile CRM support?$q$, $q$Agile CRM integrates with over 30 tools, including Zapier, Mailchimp, WordPress, Twilio, and QuickBooks.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Small business sales pipeline management$q$, $q$Track contacts and deals through a sales pipeline.$q$, $q$Small business sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Marketing automation for lead nurturing$q$, $q$Automate email campaigns and lead scoring.$q$, $q$Small business marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Customer support ticketing$q$, $q$Manage support requests through a built-in helpdesk.$q$, $q$Customer support teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Up to 10 users","Core CRM features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Starter$q$, $q$From $8.99/user/month$q$, $q$Varies by billing term (monthly, annual, 2-year)$q$, NULL, $q$["Marketing automation basics","Telephony","Appointment scheduling"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Regular$q$, $q$From $29.99/user/month$q$, $q$Varies by billing term$q$, NULL, $q$["Advanced marketing automation","Landing page builder"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$Enterprise$q$, $q$From $47.99/user/month$q$, $q$Varies by billing term$q$, NULL, $q$["Full feature set","Advanced automation and support tools"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '33a462fe-f0a6-4c70-938b-0538e6e0b70b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Agile CRM is a cloud-based CRM designed for small and midsize businesses that want to manage sales, marketing, and customer service from a single platform rather than stitching together separate tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform covers contact and deal management, marketing automation (web pop-ups, email newsletters, autoresponders, lead scoring, and customer segmentation), built-in telephony for calling and recording, appointment scheduling, a landing-page builder, and a helpdesk/knowledge base. It integrates with more than 30 third-party tools, including Zapier, Mailchimp, WordPress, Twilio, and QuickBooks.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Agile CRM offers a free plan for up to 10 users. Paid plans are called Starter, Regular, and Enterprise, priced per user per month, with the exact rate depending on whether billing is monthly, annual, or on a two-year term.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33a462fe-f0a6-4c70-938b-0538e6e0b70b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Agiloft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Agiloft is an AI-powered contract lifecycle management platform that automates contract creation, negotiation, and obligation tracking for enterprises.$q$, short_description),
  pricing_model = COALESCE($q$Quote-based (contact sales)$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(1991, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Redwood City, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Agiloft: AI-Powered Contract Lifecycle Management$q$, seo_title),
  seo_meta_description = COALESCE($q$Agiloft is an AI-powered CLM platform that automates contract creation, negotiation, and obligation tracking for enterprise legal and procurement teams.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Agiloft is a contract lifecycle management (CLM) platform founded in 1991 and headquartered in Redwood City, California, with roughly 201-500 employees. The company positions its product as a 'data-first CLM and Contracts AI Platform' that turns contracts into business intelligence for legal, procurement, and other enterprise teams. Its core AI capability, Astra AI, provides pre- and post-signature contract intelligence, including automated extraction and analysis of clauses, obligations, and other contract data. The platform supports the full contract lifecycle—creation, negotiation, execution, obligation tracking, and renewal—through customizable, no-code workflows that let teams configure approval chains and processes without engineering help. It includes real-time dashboards for contract analytics and connects to more than 1,000 third-party systems, including Salesforce, SAP, Oracle, DocuSign, and Adobe Sign. Agiloft has been recognized as a Contract Lifecycle Management leader in Gartner's Magic Quadrant for six consecutive years and counts customers such as Dell Technologies, Intel, Moderna, and Stripe. Pricing is not published; prospective customers must request a demo or quote. Agiloft is best suited for legal, procurement, and enterprise teams at mid-market and large organizations across industries such as healthcare, financial services, pharma/biotech, manufacturing, energy, and technology that need to manage contracts at scale with AI-assisted analysis.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Astra AI contract intelligence$q$, $q$AI-powered extraction and analysis of contract clauses, obligations, and data points.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$No-code workflow configuration$q$, $q$Customize contracts, approval chains, and processes without engineering help.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Full lifecycle coverage$q$, $q$Manage contracts from creation and negotiation through execution and renewal.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Advanced search and extraction$q$, $q$AI-powered discovery of clauses, obligations, and key data points across contracts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Real-time dashboards$q$, $q$Analytics and visibility into contract status and metrics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Enterprise integrations$q$, $q$Connects with 1,000+ systems including Salesforce, SAP, Oracle, and DocuSign.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Long track record, founded in 1991 with recognized Gartner CLM leadership$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Highly configurable no-code workflows for complex approval processes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Deep enterprise integration ecosystem (1,000+ integrations)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$AI-driven contract analysis via Astra AI$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Pricing is not published; requires contacting sales or scheduling a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$No-code configurability can mean longer implementation for complex setups$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Geared toward mid-market and enterprise organizations rather than very small businesses$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Is Agiloft's pricing public?$q$, $q$No, Agiloft does not publish pricing; prospective customers must request a demo or quote.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$What is Astra AI?$q$, $q$Astra AI is Agiloft's AI engine for pre- and post-signature contract intelligence, including automated clause and obligation extraction.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Does Agiloft integrate with Salesforce?$q$, $q$Yes, Agiloft integrates with Salesforce along with 1,000+ other systems including SAP, Oracle, and DocuSign.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Who uses Agiloft?$q$, $q$Agiloft is used by enterprise legal and procurement teams; customers include Dell Technologies, Intel, Moderna, and Stripe.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Enterprise contract lifecycle management$q$, $q$Manage contracts from drafting through renewal in one platform.$q$, $q$Legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Clause and obligation tracking$q$, $q$Use AI to extract and monitor contract obligations and clauses.$q$, $q$Legal and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Procurement workflow automation$q$, $q$Automate approval chains and vendor contract processes.$q$, $q$Procurement departments$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Agiloft, founded in 1991 and headquartered in Redwood City, California, is a contract lifecycle management (CLM) platform that uses AI to turn contracts into structured business intelligence for legal, procurement, and other enterprise teams.$q$, $q$The company has been recognized as a Contract Lifecycle Management leader in Gartner's Magic Quadrant for six consecutive years and lists customers including Dell Technologies, Intel, Moderna, and Stripe.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Agiloft's Astra AI provides pre- and post-signature contract intelligence, including automated extraction and analysis of clauses, obligations, and data points. The platform covers the full contract lifecycle—creation, negotiation, execution, obligation tracking, and renewal—supported by customizable, no-code workflows for approvals and processes, plus real-time dashboards for contract analytics.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Agiloft connects with more than 1,000 third-party systems, including Salesforce, SAP, Oracle, DocuSign, and Adobe Sign, allowing it to fit into existing enterprise CRM, ERP, and e-signature workflows.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Agorapulse ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Agorapulse is a social media management platform for scheduling, monitoring, and reporting across Facebook, Instagram, X, LinkedIn, TikTok, and more.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Paris, France$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Agorapulse: Social Media Management Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Agorapulse is a social media management platform for scheduling, inbox management, listening, and reporting across major social networks.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Agorapulse is a social media management platform founded in 2010 and headquartered in Paris, France, with an estimated 51-200 employees. It helps businesses, agencies, and marketers manage, publish, monitor, and report on their social media presence from a centralized dashboard, supporting Facebook, Instagram, X (Twitter), LinkedIn, Pinterest, TikTok, YouTube, Threads, Reddit, and Bluesky. Core features include a unified social inbox for managing comments, messages, and interactions across platforms; a publishing and scheduling calendar; social listening for brand and conversation monitoring; customizable automated reporting; social ROI measurement tied to Google Analytics; and team collaboration tools with task assignment and approval workflows. The company has also introduced 'Agorapulse AI' for AI-assisted content production. Agorapulse offers a free plan for one user with three social profiles and basic features, plus paid tiers—Standard, Professional, and Advanced—priced from $79 to $149 per month when billed annually (higher if billed monthly), and custom pricing for large teams and agencies. Native mobile apps are available for iOS and Android. Agorapulse reports serving more than 31,000 daily users, including brands such as Atari and WD-40, and is used by social media managers, agencies managing multiple client accounts, and marketing teams across e-commerce, B2B, retail, and higher education.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Unified social inbox$q$, $q$Manage comments, messages, and interactions across platforms in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Publishing and scheduling$q$, $q$Plan and schedule content across channels with a shared content calendar.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Social listening$q$, $q$Monitor brand mentions and conversations across social networks, news sites, and blogs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Automated reporting$q$, $q$Generate customizable, automated performance reports.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Social ROI measurement$q$, $q$Track organic social media impact on sales, leads, and traffic via Google Analytics integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Team collaboration$q$, $q$Assign tasks, set approval workflows, and share calendars across teams.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$AI-assisted content$q$, $q$Agorapulse AI helps with content production.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Mobile apps$q$, $q$Native iOS and Android apps for managing social media on the go.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Supports 9+ major social networks in one dashboard$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Free plan available for solo users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Agency-friendly reporting, labels, and multi-client tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Native mobile apps for iOS and Android$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Free plan is limited to 3 social profiles and 1 user$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Advanced features like social listening and ROI analysis are reserved for higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Costs can add up for agencies managing many social profiles across clients$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Does Agorapulse have a free plan?$q$, $q$Yes, Agorapulse offers a free plan for one user with up to three social profiles.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Which social networks does Agorapulse support?$q$, $q$Agorapulse supports Facebook, Instagram, X, LinkedIn, Pinterest, TikTok, YouTube, Threads, Reddit, and Bluesky.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Is there an Agorapulse mobile app?$q$, $q$Yes, Agorapulse has native mobile apps for iOS and Android.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$How much does Agorapulse cost?$q$, $q$Paid plans range from roughly $79 to $149 per month when billed annually, with a custom plan available for larger teams.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Social media scheduling for small businesses$q$, $q$Plan and publish content across multiple networks from one calendar.$q$, $q$Small business marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Agency social media management$q$, $q$Manage multiple client accounts with labels, approvals, and reporting.$q$, $q$Marketing agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Brand monitoring and social listening$q$, $q$Track brand mentions and conversations across social platforms.$q$, $q$Social media managers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["1 user","3 social profiles","Basic scheduling and reporting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Standard$q$, $q$$79/month (annual) / $99/month (monthly)$q$, $q$Annual or monthly$q$, NULL, $q$["Unlimited post scheduling","Basic reporting","Unified inbox for 10 profiles"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Professional$q$, $q$$119/month (annual) / $149/month (monthly)$q$, $q$Annual or monthly$q$, NULL, $q$["Link-in-bio tools","Instagram product tagging","Team assignments"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Advanced$q$, $q$$149/month (annual) / $199/month (monthly)$q$, $q$Annual or monthly$q$, NULL, $q$["Labels and saved replies","Automated moderation","ROI analysis","Competitor benchmarking"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$Custom$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Unlimited profiles","AI-powered reply suggestions","SSO","Dedicated customer success manager"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '28b4fd37-f4bf-45ce-950f-1137fe952d9e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Agorapulse is a social media management platform founded in 2010 and headquartered in Paris, France. It lets businesses, agencies, and marketers manage, analyze, and optimize their social media presence across multiple networks from a single dashboard.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Agorapulse combines a unified social inbox for comments and messages, a publishing and scheduling calendar, social listening for brand monitoring, customizable automated reporting, social ROI measurement linked to Google Analytics, and team collaboration tools with approval workflows. It supports Facebook, Instagram, X, LinkedIn, Pinterest, TikTok, YouTube, Threads, Reddit, and Bluesky, plus native mobile apps for iOS and Android.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Agorapulse offers a free plan for one user with three social profiles. Paid plans—Standard, Professional, and Advanced—range from roughly $79 to $149 per month when billed annually (with monthly billing costing more), and annual billing offers up to 20% savings. A Custom plan with tailored pricing is available for large teams and agencies.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28b4fd37-f4bf-45ce-950f-1137fe952d9e', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Aha! ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Aha! is a suite of product management tools covering roadmapping, idea management, agile delivery, and knowledge bases for product teams.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$9/user/month$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Menlo Park, California, USA (fully remote company)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Aha!: Product Management Software Suite$q$, seo_title),
  seo_meta_description = COALESCE($q$Aha! is a product management software suite for roadmapping, idea management, agile delivery, and knowledge bases, with plans from $9/user/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Aha! is a product management software suite made by Aha! Labs Inc., founded in spring 2013 by Brian de Haaff and Dr. Chris Waters. The company is headquartered in Menlo Park, California, but operates as a fully distributed remote company with no central office. Aha! offers a modular set of products covering the product development lifecycle: Aha! Roadmaps for strategic planning and visual roadmaps, Aha! Ideas for capturing and prioritizing customer feedback, Aha! Discovery for managing customer interviews and research, Aha! Whiteboards for visual brainstorming, Aha! Builder for AI-assisted app and prototype development, Aha! Develop for agile engineering delivery (scrum, kanban, SAFe), Aha! Teamwork for general project management, and Aha! Knowledge for documentation and knowledge bases. An AI assistant named Elle is built into the products to help accelerate tasks like drafting, story writing, and wireframing. Pricing is subscription-based per user per month, ranging from $9/user/month (Whiteboards, Develop, Teamwork) up to $59/user/month (Roadmaps, Builder), with all products offering a free trial (no credit card required) but no permanent free plan. Aha! reports more than 1 million product builders using its tools and customers including Dell, Experian, and Siemens. It is aimed at product managers, engineering and development teams, and program/project managers at organizations ranging from startups to large enterprises.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d3b022c-eecd-4869-9efc-0b614824aa91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d3b022c-eecd-4869-9efc-0b614824aa91' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Roadmaps$q$, $q$Strategic planning and visual roadmap creation linking strategy to product work.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Ideas$q$, $q$Capture and prioritize customer feedback and feature ideas.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Discovery$q$, $q$Manage customer interviews and centralize research.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Develop$q$, $q$Agile delivery management supporting scrum, kanban, and SAFe.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Whiteboards$q$, $q$Visual collaboration space for brainstorming and wireframing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Knowledge$q$, $q$Documentation and self-serve knowledge base publishing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Elle AI assistant$q$, $q$Built-in AI assistant that accelerates drafting, story writing, and other tasks.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$40+ integrations$q$, $q$Connects with tools like Jira, Salesforce, Zendesk, and Azure DevOps.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Modular suite lets teams buy only the products they need$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Deep feature set across strategy, discovery, delivery, and documentation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$AI assistant embedded across the product suite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Free trials on all products with no credit card required$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$No permanent free plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Per-product pricing can add up for teams needing the full suite$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Breadth of features can create a learning curve for new users$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Does Aha! have a free plan?$q$, $q$No, Aha! does not offer a permanent free plan, but all products include a free trial with no credit card required.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$How much does Aha! cost?$q$, $q$Aha! products are priced per user per month, ranging from $9/user/month to $59/user/month depending on the product.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$What is Elle?$q$, $q$Elle is Aha!'s built-in AI assistant that helps accelerate tasks like drafting, story writing, and wireframing across its products.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Can I buy individual Aha! products separately?$q$, $q$Yes, Aha!'s products such as Roadmaps, Develop, Ideas, and Knowledge are sold separately and can be combined as needed.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Product roadmap planning$q$, $q$Build strategic roadmaps that link company strategy to product work.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Customer feedback and idea prioritization$q$, $q$Capture and prioritize feature requests and feedback.$q$, $q$Product and marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Agile engineering delivery$q$, $q$Manage sprints, story points, and delivery tracking.$q$, $q$Engineering and development teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Roadmaps$q$, $q$$59/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Strategy and roadmap planning","Ideas portal","40+ integrations","AI assistant"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Discovery$q$, $q$$39/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Unlimited studies and interviews","AI-powered transcript analysis"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Ideas$q$, $q$$39/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Feedback portals","Salesforce and Zendesk integration"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Whiteboards$q$, $q$$9/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Visual brainstorming","100+ templates","AI-generated wireframes"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Builder$q$, $q$$59/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["AI app/prototype building","Built-in database","Enterprise-grade hosting"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Develop$q$, $q$$9/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Scrum, kanban, and SAFe support","Sprint planning","Agile metrics"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Teamwork$q$, $q$$9/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Task management","Team capacity tracking"]$q$::jsonb, 6);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Knowledge$q$, $q$$18/user/month$q$, $q$Monthly or annual$q$, NULL, $q$["Documentation hub","100+ templates","AI-assisted drafting"]$q$::jsonb, 7);

DELETE FROM tool_content_blocks WHERE tool_id = '1d3b022c-eecd-4869-9efc-0b614824aa91';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aha! is a modular product management software suite from Aha! Labs Inc., founded in spring 2013 by Brian de Haaff and Dr. Chris Waters. The company is headquartered in Menlo Park, California, but operates as a fully remote, distributed team.$q$, $q$Rather than a single monolithic product, Aha! is sold as a set of separate but connected tools that cover the full product development lifecycle, from strategy and discovery through delivery and documentation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The suite includes Aha! Roadmaps for strategic planning and visual roadmaps, Aha! Ideas for feedback capture and prioritization, Aha! Discovery for managing customer interviews, Aha! Whiteboards for visual collaboration, Aha! Builder for AI-assisted app and prototype development, Aha! Develop for agile engineering delivery, Aha! Teamwork for general project management, and Aha! Knowledge for documentation. An AI assistant called Elle is embedded across the products to help accelerate tasks like drafting and story writing.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Aha! prices each product separately on a per-user, per-month subscription basis, ranging from $9/user/month for Whiteboards, Develop, and Teamwork up to $59/user/month for Roadmaps and Builder. All products offer a free trial with no credit card required, but there is no permanent free plan. Annual billing is available via invoice, and Aha! applies a standard cost-of-living price adjustment each year.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


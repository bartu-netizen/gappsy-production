-- Enrichment batch: Hive-Pal, juntagrico, Open Food Network, OpenOlitor, indico, motion.tools (Antragsgrün), OpenSlides, osem, Alfresco Community Edition, Apostrophe, Automad, Bludit, Bolt CMS, CMS Made Simple, Contao, CouchCMS, Drupal, eLabFTW, Joomla!, Localess, MODX, Neos, Pimcore, Plone, Publify, REDAXO, SPIP, Squidex, Superdesk, Textpattern, Typemill, Vvveb CMS, Wagtail, WinterCMS, WonderCMS, Corteza, Django-CRM, Adminer, Azimutt, Bytebase, Chartbrew, ChartDB, CloudBeaver, d9, Databunker, Datasette, Limbas, AdGuard Home, blocky, Maza ad blocking, Pi-hole, Technitium DNS Server, BentoPDF, Gotenberg, I, Librarian, Papra, PdfDing, SimpleDMS, Atsumeru, Calibre, Kapowarr, Kavita, Komga, Stump, DSpace, EPrints, Fedora Commons Repository, InvenioRDM, Islandora, Samvera Hyrax, Evergreen, Koha, RERO ILS, Aimeos, CoreShop, EverShop, Microweber, s-cart, Thelia, CommaFeed
-- Publishes 80 bulk-imported tool(s) with full editorial content.

-- ── Hive-Pal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered, voice-first beekeeping app for recording hive inspections, tracking apiaries, queens, and honey harvests.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Hive-Pal is a free, open-source, voice-first beekeeping app for AI-assisted hive inspections, queen tracking, and honey harvest logs.$q$,
  og_description = $q$Hive-Pal is a free, open-source, voice-first beekeeping app for AI-assisted hive inspections, queen tracking, and honey harvest logs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4b370b9c-680b-4e36-b5eb-96116115e439';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4b370b9c-680b-4e36-b5eb-96116115e439' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Voice inspections$q$, $q$Record an audio note at the hive; the app transcribes it and drafts a structured inspection report automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Apiary management$q$, $q$Organize multiple hive locations with site-specific notes and weather context.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Queen tracking$q$, $q$Monitor queen lineage, performance, and breeding records over time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Harvest logging$q$, $q$Record honey production and yields across seasons per hive or apiary.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Free calculators$q$, $q$Browser-based tools for syrup ratios, brood timelines, swarm management, and colony strength estimation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Self-hosted AI$q$, $q$Runs on open-source speech and language models (faster-whisper, Ollama), so transcription can happen without sending data to a third party.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Free to self-host under an MIT license, or use a free cloud-hosted instance$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Voice-first workflow is faster at the hive than typing notes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$No third-party AI cloud dependency required in self-hosted mode$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Includes practical calculators beyond core record-keeping$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Niche tool focused specifically on beekeeping, not general farm/agriculture management$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Self-hosting AI transcription requires enough local compute (or a Raspberry Pi/small server) for decent performance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Younger project with a smaller community than established agriculture software$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Is Hive-Pal free?$q$, $q$Yes. It is MIT-licensed open-source software that can be self-hosted for free, and the developers also offer a free cloud-hosted version.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Do I need an internet connection for the AI transcription?$q$, $q$In self-hosted mode, transcription runs locally on open-source models (faster-whisper, Ollama), so it does not require sending audio to a third-party cloud AI provider.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Can I run Hive-Pal on a Raspberry Pi?$q$, $q$Yes, the project is designed to run via Docker on hardware ranging from a server or laptop to a Raspberry Pi.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Who is Hive-Pal built for?$q$, $q$Hobbyist and professional beekeepers who want structured, searchable inspection records instead of paper notes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Hive inspection logging$q$, $q$Record a voice memo during a hive check and get a structured inspection report without stopping to write notes.$q$, $q$Hobbyist and semi-professional beekeepers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Multi-apiary tracking$q$, $q$Track hive health, queens, and harvests across several apiary locations from one system.$q$, $q$Beekeepers managing multiple sites$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["MIT-licensed, run via Docker","No third-party AI cloud dependency","Data stays on your own hardware"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$Cloud-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Hosted by the Hive-Pal developers","Automatic updates and monitoring"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Hive-Pal is a beekeeping management tool built around voice-first hive inspections: a beekeeper records an audio note at the hive and the app transcribes it and drafts a structured inspection report using AI (built on open-source models such as faster-whisper and Ollama).$q$, $q$Beyond inspections, it covers apiary-level management (multiple sites with weather context), queen tracking across generations, and harvest logging for honey yields. It also ships a set of free browser-based calculators for syrup ratios, brood timelines, swarm management, and colony strength estimation.$q$, $q$The project is MIT-licensed and can be run entirely on a user's own hardware — a server, laptop, or Raspberry Pi via Docker — with no dependency on third-party cloud AI services, or used through a free cloud-hosted version maintained by the developers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Hive-Pal is aimed at hobbyist and semi-professional beekeepers who want faster, more consistent inspection records than pen-and-paper notes, and who value keeping their apiary data on their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b370b9c-680b-4e36-b5eb-96116115e439', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── juntagrico ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source web platform that handles membership, subscriptions, and administration for Community Supported Agriculture (Solawi) cooperatives.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$German$q$]::text[],
  seo_meta_description = $q$juntagrico is a free, open-source web platform for managing members and subscriptions in Community Supported Agriculture (Solawi) cooperatives.$q$,
  og_description = $q$juntagrico is a free, open-source web platform for managing members and subscriptions in Community Supported Agriculture (Solawi) cooperatives.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6c0d797b-de68-4b90-9beb-fcaefd4f1108';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6c0d797b-de68-4b90-9beb-fcaefd4f1108' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Member management$q$, $q$Track members, their subscriptions, and their participation in the cooperative.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Subscription administration$q$, $q$Manage harvest shares and subscription changes across a growing membership base.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Reduced admin overhead$q$, $q$Consolidates paperwork that CSA organizers previously tracked manually or in spreadsheets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Community-driven development$q$, $q$Maintained openly on GitHub with development priorities shaped by the associated user association.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Purpose-built for the CSA/Solawi organizational model rather than a generic tool adapted for it$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Open source and self-hostable, avoiding vendor lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Backed by an active user community of CSA organizations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Reduces the IT burden on volunteer-run cooperatives$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Documentation and community are primarily German-language, which limits accessibility outside German-speaking regions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Best suited to the specific CSA/Solawi model rather than general farm management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Self-hosting requires basic server/Docker knowledge; hosted options depend on third-party providers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Is juntagrico free to use?$q$, $q$The software itself is open source and free to self-host. Some organizations opt for paid hosting instead of running their own server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$What kind of organizations use juntagrico?$q$, $q$Community Supported Agriculture (CSA/Solawi) cooperatives, primarily in Switzerland, Germany, and Liechtenstein.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$Where can I find the source code?$q$, $q$juntagrico is developed openly on GitHub under the juntagrico organization.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$CSA member and subscription management$q$, $q$Coordinate members, harvest shares, and subscription changes for a farm cooperative in one shared system.$q$, $q$CSA/Solawi organizers and administrators$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$juntagrico is a web application built to reduce the administrative burden that Community Supported Agriculture (known as Solawi in German-speaking regions) organizations take on as they grow. It manages members, subscriptions, and the paperwork that comes with running a shared-harvest cooperative, so organizers can spend more time on the farm and less on spreadsheets.$q$, $q$The software is maintained on GitHub and developed collaboratively, with ongoing development steered by an associated non-profit association (Verein) of the same name. It is already in use by dozens of CSA organizations, mainly across Switzerland, Germany, and Liechtenstein.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$juntagrico is built for CSA/Solawi cooperatives — groups of members who jointly fund and share a farm's harvest — that need a shared system for member management, subscriptions, and coordination without hiring custom software development.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6c0d797b-de68-4b90-9beb-fcaefd4f1108', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Open Food Network ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source online marketplace platform that lets local food producers and community food hubs sell directly to customers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Open Food Network is a free, open-source marketplace platform letting farmers and food hubs sell directly to customers online.$q$,
  og_description = $q$Open Food Network is a free, open-source marketplace platform letting farmers and food hubs sell directly to customers online.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a8beb2a4-e936-455d-aa4d-c21b017173fb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a8beb2a4-e936-455d-aa4d-c21b017173fb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Producer storefronts$q$, $q$Individual farmers and producers can run their own online shop for direct sales to customers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Food hub / aggregated selling$q$, $q$Multiple producers can sell together through a shared hub shop with combined delivery or pickup.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Order and inventory management$q$, $q$Producers manage products, stock, and incoming orders through an admin backend.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$REST/JSON API$q$, $q$A documented API (with an API Handbook) lets developers integrate or build on top of the platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Locally-led global network$q$, $q$Country and regional instances are run by local non-profits and cooperatives worldwide, not a single central vendor.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Self-hosting option$q$, $q$As open-source software, organizations can deploy and run their own instance instead of relying on an existing local network.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Purpose-built for local food commerce rather than a generic ecommerce platform retrofitted for farmers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Open source with a real self-hosting path, avoiding platform lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Supports both single-producer shops and multi-producer food hubs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Backed by an established international non-profit network with over a decade of operation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Feature depth and support quality can vary between local country instances since each is independently run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Self-hosting requires developer resources; most producers instead join an existing local instance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Smaller ecosystem of themes/plugins compared to mainstream ecommerce platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Is Open Food Network free?$q$, $q$The software is open source and free to self-host. Local Open Food Network instances (run by non-profits/cooperatives in each country) often charge producers a small commission or fee to fund operations, which varies by instance.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Can I self-host Open Food Network instead of joining a local instance?$q$, $q$Yes, since the platform is open source, organizations can deploy their own instance instead of using an existing country network.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Does Open Food Network have an API?$q$, $q$Yes, it offers a documented REST/JSON API and an API Handbook for developers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Who runs Open Food Network?$q$, $q$It was founded by the Open Food Foundation (Australia, 2012) and is now operated as a locally-led international network across roughly 20 countries.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Direct-to-consumer farm sales$q$, $q$A single farm sets up an online shop to sell produce directly to local customers.$q$, $q$Independent farmers and small food producers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$Food hub aggregation$q$, $q$Multiple local producers sell together through one shared storefront with combined delivery or pickup logistics.$q$, $q$Community food hubs and buying cooperatives$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Open Food Network is a full-featured, open-source ecommerce platform built specifically for farmers, food producers, and community food hubs to sell directly to customers online. It was started in 2012 in Australia by the Open Food Foundation, a non-profit registered that year to build open-source tools for fairer, more local food systems.$q$, $q$The project has since grown into an international network operating in around 20 countries, with locally-led instances (each often run by a local non-profit or cooperative) rather than a single centralized commercial company. Instances can be run on the shared global platform or self-hosted, since the underlying software is released as open source.$q$, $q$The platform supports several selling models beyond a simple online shop, including aggregated 'hub' shops where multiple producers sell under one delivery/pickup point, which is common in food hub and cooperative buying-group setups.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Open Food Network is aimed at individual farmers and food producers who want to sell directly online, and at community food hubs, cooperatives, and buying groups that aggregate orders from several producers into one marketplace.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8beb2a4-e936-455d-aa4d-c21b017173fb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenOlitor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source administration platform for CSA cooperatives, handling members, delivery planning, and invoicing for subscription farm boxes.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$German$q$]::text[],
  seo_meta_description = $q$OpenOlitor is an open-source AGPL platform for CSA cooperatives to manage members, delivery planning, and invoicing, free to self-host.$q$,
  og_description = $q$OpenOlitor is an open-source AGPL platform for CSA cooperatives to manage members, delivery planning, and invoicing, free to self-host.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0070da27-b0bd-4679-add1-4cfaeb297161';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0070da27-b0bd-4679-add1-4cfaeb297161' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Member and personnel management$q$, $q$Track members, producers, staff, and member absences in one system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Subscription administration$q$, $q$Manage harvest-share subscriptions and project configuration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Delivery planning$q$, $q$Plan harvest distribution logistics and generate related orders.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Invoicing and payments$q$, $q$Create invoices and process payments for subscriptions and orders.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Member portal$q$, $q$Gives members self-service access alongside customizable reporting and PDF document storage.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Purpose-built for CSA/subscription-box farm operations rather than adapted from generic e-commerce software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Open source (AGPL v3) with free self-hosting available$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Covers the full operational chain: members, deliveries, and billing in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Active international contributor base$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Documentation and community are primarily German-language$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Self-hosting requires server management; hosted plans have real recurring costs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Niche fit for the specific CSA/regional contract farming model$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Is OpenOlitor free?$q$, $q$The software is free and open source (AGPL v3) to self-host. Cloud hosting through the project is a paid option, roughly CHF 30/month for an existing Swiss cooperative or about €1 per member/month in Germany.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$What license is OpenOlitor released under?$q$, $q$AGPL v3, with source code publicly available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Who is OpenOlitor for?$q$, $q$CSA (Community Supported Agriculture) cooperatives and regional contract farming operations, mainly in Switzerland, Germany, Austria, and Italy.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$CSA operations management$q$, $q$Run member sign-ups, delivery planning, and invoicing for a subscription farm-box cooperative from one system.$q$, $q$CSA/Solawi cooperatives and regional farms$q$, 0);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["AGPL v3 open-source license","No licensing cost, only server expenses","Full control over updates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Cloud Hosting (existing cooperative)$q$, $q$From ~CHF 30/month (Switzerland) or ~€1/member/month (Germany)$q$, $q$Monthly$q$, $q$["Managed hosting by the project","No server management required"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$Cloud Hosting (new cooperative)$q$, $q$Custom$q$, $q$N/A$q$, $q$["Pricing depends on chosen infrastructure"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenOlitor is a web-based administration platform for regional contract farming and Community Supported Agriculture (CSA/Solawi) operations. It covers the operational chain of a subscription-box farm: managing members, producers, and personnel; planning harvest deliveries; and generating invoices and processing payments.$q$, $q$The software is released under the AGPL v3 license with source code on GitHub, developed by an international team of contributors. It can be self-hosted for free, or organizations can use paid cloud hosting from the project maintainers, priced at roughly CHF 30/month for an existing Swiss cooperative or about €1 per member per month in Germany; pricing for brand-new cooperatives depends on the chosen infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenOlitor targets CSA initiatives, farmers, and agricultural cooperatives running subscription-based produce distribution, mainly across Switzerland, Germany, Austria, and Italy.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0070da27-b0bd-4679-add1-4cfaeb297161', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── indico ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source event management system built at CERN for organizing conferences, meetings, and lectures with registration and scheduling.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Indico is a free, open-source event management system from CERN for conferences, meetings, registration, and paper review.$q$,
  og_description = $q$Indico is a free, open-source event management system from CERN for conferences, meetings, registration, and paper review.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '367a6bce-9b7f-4b10-9faa-47430b894121';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '367a6bce-9b7f-4b10-9faa-47430b894121' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Event lifecycle management$q$, $q$Plan, run, and archive lectures, meetings, workshops, and conferences in one system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Registration and access control$q$, $q$Multi-level access control and attendee registration workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Document management and archival$q$, $q$Upload, retrieve, and permanently archive event materials.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Paper/abstract review$q$, $q$Built-in call-for-papers and review workflows for academic-style events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Room booking and scheduling$q$, $q$Manage room reservations and detailed event agendas.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$REST/HTTP API$q$, $q$A documented HTTP API allows external tools to integrate with Indico events and data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Battle-tested at massive scale by CERN and other large institutions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Covers registration, scheduling, document archival, and paper review in one open-source system$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$MIT-licensed and self-hostable with no per-event or per-user licensing cost$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Public demo sandbox available before committing to deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Self-hosting and configuring a full-featured event system requires real sysadmin/DevOps effort$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Feature depth aimed at conferences/institutions can be more than small teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$No official commercial support channel; relies on community and GitHub issue tracking$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Is Indico free to use?$q$, $q$Yes, it is open-source software under the MIT license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Who built Indico?$q$, $q$It was originally developed at CERN and continues to be maintained as an open-source project with public development on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Does Indico have an API?$q$, $q$Yes, it provides a documented HTTP API for integrating with external tools and systems.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Can I try Indico before installing it?$q$, $q$Yes, a public demo sandbox is available on the Indico website.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Academic conference management$q$, $q$Handle abstract submission, review, registration, and scheduling for a multi-day academic conference.$q$, $q$Universities and research institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$Institutional meeting and room booking$q$, $q$Coordinate recurring internal meetings, room bookings, and document archival across departments.$q$, $q$Large research organizations and institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Indico is a feature-rich, open-source event management system originally built at CERN, the European Organization for Nuclear Research, and released under the MIT license. It covers the full lifecycle of organizing lectures, meetings, workshops, and conferences: planning, registration, room booking and scheduling, document upload and archival, paper/abstract review, and long-term event archiving.$q$, $q$It is used at large scale by CERN itself (reportedly handling hundreds of thousands of events annually) and by other international organizations such as the United Nations for conference and participant management, alongside many academic and research institutions running smaller events.$q$, $q$Indico is self-hosted and open source, with active development and a public demo sandbox available for evaluation before deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Indico suits research institutions, universities, standards bodies, and any organization running conferences, workshops, or recurring meetings that need registration, room booking, and paper/abstract review handled in one system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('367a6bce-9b7f-4b10-9faa-47430b894121', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── motion.tools (Antragsgrün) ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source platform (Antragsgrün) for submitting, discussing, and managing motions, amendments, and resolutions at conventions and assemblies.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_meta_description = $q$Antragsgrün (motion.tools) is a free, open-source platform for managing motions, amendments, and votes at conventions and assemblies.$q$,
  og_description = $q$Antragsgrün (motion.tools) is a free, open-source platform for managing motions, amendments, and votes at conventions and assemblies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2c846e33-a0ef-4fe5-b290-203fbdef22b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2c846e33-a0ef-4fe5-b290-203fbdef22b6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Motion and resolution submission$q$, $q$Members submit motions, resolutions, or candidacies through the platform for review and publication.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Amendment and discussion tools$q$, $q$Structured amendment proposals with commenting and discussion threads.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Print and export templates$q$, $q$Automated formatting for printed agendas and multiple export formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$On-site assembly tools$q$, $q$Agenda administration, speaking lists, roll calls, and voting for live conventions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Customization and branding$q$, $q$Configurable layout, branding, submission policies, and single sign-on integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Privacy-focused hosting$q$, $q$No trackers and minimal data collection, with primary servers in the EU.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Purpose-built for the motion/amendment workflow of political and membership organizations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Free, open-source (AGPL), self-hostable option with no licensing fee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Used in production by well-known European political and advocacy organizations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Privacy-conscious design with EU-based hosting for the managed offering$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Advanced customization, hosting, and support are paid professional services, not included in the free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Documentation and community skew toward German-speaking organizations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Designed around formal assembly/motion processes, less suited to informal use cases$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Is Antragsgrün / motion.tools free?$q$, $q$Yes, the core software is open source (AGPL) and free to self-host. The team also offers paid hosting and custom development services.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Can I try it before self-hosting?$q$, $q$Yes, free trial instances are available for at least three days without requiring registration.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Where is data hosted for the managed service?$q$, $q$Primary servers for the managed offering are located in the EU, and the platform is built to avoid trackers and unnecessary data collection.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Who uses this platform?$q$, $q$Political parties and NGOs such as the European Youth Forum, the German and European Green Party, Volt Europa, and the National Council of German Women's Organizations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Party convention motion management$q$, $q$Run submission, amendment, discussion, and voting on motions for a political party convention.$q$, $q$Political parties and their local chapters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$NGO/association assemblies$q$, $q$Manage resolutions and candidacy submissions for a membership association's general assembly.$q$, $q$NGOs and advocacy organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Open source (AGPL) on GitHub","Full customization and branding","Self-managed installation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Free Trial Instance$q$, $q$Free$q$, $q$N/A$q$, $q$["No registration required","Available for at least 3 days"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$Hosting & Professional Services$q$, $q$Custom, billed hourly$q$, $q$N/A$q$, $q$["Managed hosting on EU servers","Custom programming and feature development"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Antragsgrün (marketed at motion.tools) is an open-source platform for managing the full motion lifecycle at conventions and assemblies: submission and publication of motions, resolutions, and candidacies; amendment proposals; commenting and discussion; automated print templates and export formats; and on-site tools like agenda administration, speaking lists, roll calls, and voting.$q$, $q$It is released as open source under the AGPL license and available on GitHub for free self-hosted installation, with extensive customization options (branding, submission policies, single sign-on). Organizations using it include the European Youth Forum, the German and European Green Party, Volt Europa, and the National Council of German Women's Organizations, reflecting its base of NGOs, political parties, and advocacy groups.$q$, $q$Beyond the free self-hosted option, the team behind the project offers free trial instances (available for at least three days without registration) and paid professional services — custom development, hosting, and feature work — billed hourly, with primary servers located in the EU.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Antragsgrün / motion.tools fits political parties, NGOs, advocacy groups, and membership associations that run assemblies or conventions where members submit and vote on motions and amendments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c846e33-a0ef-4fe5-b290-203fbdef22b6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OpenSlides ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, web-based system for digital motion management, online voting, and committee meetings, used by unions and parliaments.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_meta_description = $q$OpenSlides is a free, open-source, MIT-licensed platform for digital motions, online voting, and committee meeting management.$q$,
  og_description = $q$OpenSlides is a free, open-source, MIT-licensed platform for digital motions, online voting, and committee meeting management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9dee94a4-8e82-47af-beeb-930afb5a54a0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9dee94a4-8e82-47af-beeb-930afb5a54a0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Online voting and elections$q$, $q$Run secret elections and online votes designed for legal compliance in formal assemblies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Motion management$q$, $q$Track proposals and motions through multi-stage approval processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Participant and access management$q$, $q$Manage attendee roles and permissions with differentiated access controls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Agenda and speaker lists$q$, $q$Plan meeting agendas and manage speaker queues in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Live video streaming$q$, $q$Stream meetings live for hybrid or remote participants.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Autopilot mode$q$, $q$Automates routine session-management tasks during live meetings.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Free, MIT-licensed, self-hostable software with no per-seat licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Used in production by major unions, parties, and international NGOs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Covers legally-compliant online voting alongside general meeting management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Optional managed hosting available for organizations that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Self-hosting the full stack (multiple backend services, datastore, Redis) requires real DevOps capacity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Advanced API customization and video integration are offered as paid professional services$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Documentation and primary market skew German/European$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Is OpenSlides free?$q$, $q$Yes, it is Free/Libre Open Source Software under the MIT license and can be self-hosted at no licensing cost. Managed hosting is available as a paid option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Does OpenSlides support online voting?$q$, $q$Yes, including secret elections designed to meet legal requirements for formal assemblies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Who uses OpenSlides?$q$, $q$Unions, political parties, works councils, and NGOs, including the German Trade Union Confederation (DGB), SPD, the Greens, FDP, and Amnesty International.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Can I integrate OpenSlides with other software?$q$, $q$OpenSlides offers API customization services for connecting external software, in addition to its core self-hosted platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Union and works council meetings$q$, $q$Run motions, votes, and elections for a union or works council assembly with a legally-compliant digital process.$q$, $q$Unions and works councils$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Party conventions and elections$q$, $q$Manage agendas, speaker lists, motions, and secret elections at a political party convention.$q$, $q$Political parties and membership associations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["MIT-licensed open source","No licensing cost","Full control over deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$Managed Hosting$q$, $q$Custom (price calculator on site)$q$, $q$N/A$q$, $q$["Hosted and maintained by OpenSlides","Optional API customization and video integration services"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenSlides is a web-based system for digitally organizing meetings, assemblies, and committee structures. It handles online voting and secret elections, motion/proposal management for multi-stage approval processes, participant management with role-based access, agenda planning and speaker lists, file administration, and live video streaming, plus an 'Autopilot' mode for running sessions with less manual operation.$q$, $q$The software is Free/Libre Open Source Software released under the MIT license, self-hostable and free to run without licensing cost. Notable users include the German Trade Union Confederation (DGB), the SPD, the Greens, the FDP, and Amnesty International, reflecting adoption by unions, parties, works councils, and NGOs.$q$, $q$OpenSlides also sells managed hosting and services through its commercial arm, with a public price calculator for hosted deployments, and offers customization of its API for connecting external software plus video-conferencing integration for hybrid or fully virtual meetings.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenSlides fits unions, political parties, works councils, parliaments, and membership associations that need legally-compliant online voting and structured motion management for their meetings and assemblies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9dee94a4-8e82-47af-beeb-930afb5a54a0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── osem ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source event management app tailored for free/open-source software conferences, covering call-for-papers, scheduling, and registration.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OSEM is a free, open-source event management app for FOSS conferences, covering call-for-papers, scheduling, and registration.$q$,
  og_description = $q$OSEM is a free, open-source event management app for FOSS conferences, covering call-for-papers, scheduling, and registration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff42786e-7806-4c57-bfcc-7884411de95a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff42786e-7806-4c57-bfcc-7884411de95a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Call-for-papers management$q$, $q$Receive, categorize, evaluate, and schedule speaker submissions for a conference.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Event landing pages and agendas$q$, $q$Build public-facing pages describing the event and its schedule.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Visitor registration and ticketing$q$, $q$Handle attendee registration with optional ticketing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Session detail pages$q$, $q$Dedicated pages for each talk/session with details for attendees.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Basic analytics$q$, $q$Insights into program development and audience engagement.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Free, open-source, and self-hosted with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Purpose-built for the FOSS conference call-for-papers and scheduling workflow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Proven in production by well-known open-source community events$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Public demo available before committing to a deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Feature set and design assume a community/FOSS-conference context, less suited to commercial event production$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Community-maintained project without a commercial support option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Self-hosting requires developer/sysadmin effort to deploy and maintain$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Is OSEM free?$q$, $q$Yes, it is fully open-source and self-hosted software available at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$What kind of events is OSEM designed for?$q$, $q$Free and open-source software conferences and other community-driven technology events.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Which organizations have used OSEM?$q$, $q$Community events including openSUSE, GNOME, ownCloud, PostgreSQL Conference, and LinuxFest Northwest.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Can I try OSEM before installing it?$q$, $q$Yes, a demo is available, and releases can be downloaded from GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$FOSS conference call-for-papers$q$, $q$Collect, review, and schedule speaker submissions for an open-source software conference.$q$, $q$FOSS conference organizing committees$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$Community event registration$q$, $q$Publish an event landing page and handle attendee registration and optional ticketing.$q$, $q$Community-run tech event organizers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OSEM (Open Source Event Manager) is an open-source event management app built specifically for free and open-source software conferences and community-driven tech events. It handles call-for-papers workflows (receiving, categorizing, evaluating, and scheduling speaker submissions), event marketing tools such as landing pages, agendas, and visitor registration with optional ticketing, and basic analytics on program development and audience engagement.$q$, $q$The software is entirely open source and self-hosted, with a public demo and downloadable releases on GitHub. It has been used by community events including openSUSE conferences, GNOME events, ownCloud events, PostgreSQL Conference, and LinuxFest Northwest.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OSEM is aimed at organizers of free/open-source software conferences and other community-run tech events who need call-for-papers, scheduling, and registration handled by software that is itself open source.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff42786e-7806-4c57-bfcc-7884411de95a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Alfresco Community Edition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source edition of Alfresco's enterprise content management platform for self-hosted document management and workflow.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Alfresco Community Edition is the free, open-source, self-hosted edition of Alfresco's document and content management platform.$q$,
  og_description = $q$Alfresco Community Edition is the free, open-source, self-hosted edition of Alfresco's document and content management platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Document management repository$q$, $q$Store, version, and organize documents and other content in a central repository.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Access control$q$, $q$Manage permissions and access to content across users and groups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Basic process/workflow$q$, $q$Route content through simple approval and review processes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$REST API$q$, $q$Programmatic access to the content repository for integrations and custom applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Self-hosted deployment$q$, $q$Runs on your own infrastructure with no per-user licensing fee for the Community Edition.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Free, open-source (LGPL) alternative to paid enterprise content management platforms$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Mature, long-running project with continued releases into 2025$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$REST API supports custom integrations and application development$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Self-hosted, keeping content data under the organization's own control$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$No official vendor support for Community Edition, unlike Alfresco's paid Enterprise product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Advanced governance, process automation, and enterprise integrations are reserved for the commercial edition$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Deployment and upgrades require in-house technical expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Is Alfresco Community Edition still available and maintained?$q$, $q$Yes, it continues to receive numbered releases (including 23.x and 25.x series through 2025) and is available on GitHub and SourceForge, though without official vendor support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$What license is Alfresco Community Edition released under?$q$, $q$LGPL.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$How does Community Edition differ from Alfresco's paid product?$q$, $q$The paid Enterprise/Content Services product adds official vendor support, advanced governance, more process automation, and enterprise integrations that Community Edition does not include.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Does Alfresco Community Edition have an API?$q$, $q$Yes, it exposes a REST API for building integrations and custom applications on top of the content repository.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Self-hosted document management$q$, $q$Deploy a free, self-hosted content repository for storing and version-controlling organizational documents.$q$, $q$Technical teams and IT departments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Evaluating Alfresco before enterprise adoption$q$, $q$Test the core content services architecture on Community Edition before committing to the paid Enterprise product.$q$, $q$Organizations evaluating ECM platforms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["LGPL open-source license","Self-hosted document/content repository","REST API access","No official vendor support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Alfresco Community Edition is the free, open-source edition of Alfresco's enterprise content services suite, now developed under Hyland (which acquired Alfresco). It provides document management, content repository, and basic process/workflow capabilities that can be self-hosted without a license fee.$q$, $q$The Community Edition is released under LGPL and remains under active development — recent numbered releases (23.x and 25.x series) have continued through 2025 — but it is distributed without official vendor support, unlike Alfresco's paid Enterprise/Content Services products which add governance, advanced process automation, official support, and enterprise integrations.$q$, $q$Source and releases are available via GitHub and SourceForge, and it is commonly used by developers and technical teams evaluating or building on Alfresco's content services architecture before deciding whether to adopt the commercial edition.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Alfresco Community Edition suits developers, technical teams, and organizations that want a free, self-hosted document/content management repository and are comfortable running it without official vendor support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Apostrophe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Node.js CMS with in-context visual editing and headless capabilities, offering a free tier plus paid Pro and hosting plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Philadelphia, Pennsylvania, USA$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ApostropheCMS is an open-source Node.js CMS with visual in-context editing, a free self-hosted tier, and paid Pro/Assembly plans.$q$,
  og_description = $q$ApostropheCMS is an open-source Node.js CMS with visual in-context editing, a free self-hosted tier, and paid Pro/Assembly plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bea71619-57c8-4b82-a974-34977a4a07b2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bea71619-57c8-4b82-a974-34977a4a07b2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$In-context visual editing$q$, $q$Content editors edit pages directly on the live-rendered site rather than through a separate form-based admin panel.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Headless CMS mode$q$, $q$Serve content as data to front ends built with Astro, Gatsby, Nuxt, or other frameworks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Modular, extensible architecture$q$, $q$Developers extend or override core modules to customize functionality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Advanced permissions and document history$q$, $q$Available in Pro: granular editor permissions and version history for content changes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$AI-assisted translation and SEO$q$, $q$Pro tier includes AI-powered translation and SEO tooling for content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Multisite management (Assembly)$q$, $q$Manage many sites from a single codebase with a multitenant dashboard and shared templates.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Free, open-source core edition with unlimited users and content types$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$In-context visual editing is friendlier for non-technical content teams than typical headless CMS admin panels$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Can run traditional or headless depending on the front-end framework in use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Paid tiers add enterprise features (multisite, white-label, advanced permissions) without forking away from the open-source core$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Advanced permissions, version history, AI tools, and multisite management require paid Pro or Assembly plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Built on Node.js/MongoDB, so teams need familiarity with that stack to self-host and extend it$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Managed hosting is a separate paid add-on, not bundled into the free tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Is ApostropheCMS free?$q$, $q$The Open Source/Community Edition is free and self-hosted with unlimited users and content types. Apostrophe Pro starts at $199/month for 5 editors, and Apostrophe Assembly starts at $499/month for 5 sites.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Can ApostropheCMS run headless?$q$, $q$Yes, it supports headless deployment for front ends built with frameworks such as Astro, Gatsby, and Nuxt, in addition to its traditional in-context editing mode.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Who makes ApostropheCMS?$q$, $q$Apostrophe Technologies, based in Philadelphia, Pennsylvania, which spun out of web design firm P'unk Avenue in 2019.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Does Apostrophe offer managed hosting?$q$, $q$Yes, as a separate paid option, with Basic environments starting at $39/month and Performance environments at $89/app server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Agency client website builds$q$, $q$Digital agencies use the open-source or Pro edition to build editable marketing sites for clients.$q$, $q$Web design and digital agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Embedded CMS in a SaaS product$q$, $q$Software companies integrate ApostropheCMS as the content layer inside their own product.$q$, $q$Software companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Multi-brand enterprise sites$q$, $q$Manage several brand or regional websites from one shared codebase using Apostrophe Assembly.$q$, $q$Enterprise marketing and IT teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Open Source Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted","Unlimited users and content types","Headless deployment support","Localization, custom forms, blog, SEO tools, SSO"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Apostrophe Pro$q$, $q$$199/month (5 editors included; +$19/editor)$q$, $q$Monthly$q$, $q$["All Open Source features","Advanced permissions","Document version history","AI-powered translation and SEO","Private support portal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Apostrophe Assembly$q$, $q$From $499/month (5 sites included; +$99/site)$q$, $q$Monthly$q$, $q$["All Pro features","Multitenant dashboard","White-label options","Single codebase, many sites"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Managed Hosting$q$, $q$From $39/month (Basic); $89/app server (Performance); custom for Enterprise$q$, $q$Monthly$q$, $q$["Managed hosting on AWS/MongoDB Atlas"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ApostropheCMS is an open-source content management system built on Node.js, MongoDB, and Vue.js, combining in-context visual editing for content teams with a modular, extensible architecture for developers. It can also run headless, powering front ends built with frameworks like Astro, Gatsby, or Nuxt.$q$, $q$The project traces back to Philadelphia web design firm P'unk Avenue, which spun Apostrophe out into its own company, Apostrophe Technologies, in 2019 after originally building the CMS to power its own client sites. The company remains headquartered in Philadelphia.$q$, $q$The core CMS (Community/Open Source Edition) is free and self-hosted, with unlimited users and content types. Paid tiers — Apostrophe Pro and Apostrophe Assembly — add advanced permissions, document version history, AI-assisted translation and SEO tools, multisite management, and white-label options, alongside optional managed hosting plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ApostropheCMS is used by digital agencies building client websites, software companies embedding a CMS into their own products, and enterprise teams managing multiple brand sites — with self-hosting for cost-sensitive teams and paid Pro/Assembly tiers for teams that want advanced editorial or multisite features plus support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Automad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Flat-file, database-free CMS and template engine for building fast, version-controllable websites.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Automad is a free, open-source flat-file CMS and template engine that stores content in plain text files with no database required.$q$,
  og_description = $q$Automad is a free, open-source flat-file CMS and template engine that stores content in plain text files with no database required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '355c526d-e07b-4c3a-acc9-565c7b6f3d13' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Flat-file storage$q$, $q$Pages and content live in plain text files rather than a database, simplifying backups and version control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Block editor$q$, $q$Browser-based editor for composing pages from reusable content blocks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$In-page editing$q$, $q$Edit content directly on the live page while browsing the site as an admin.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Headless JSON API$q$, $q$Optional read-only API mode for using Automad as a backend to a separate frontend.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$PHP template engine$q$, $q$Custom template language for building themes without a full framework.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Built-in caching$q$, $q$Multi-layer caching designed to keep flat-file sites fast under load.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$No database to install, back up, or maintain$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Content in plain files works cleanly with Git-based workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Free and open source under the MIT license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Lightweight footprint suitable for shared hosting$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Flat-file storage scales less predictably than a database for very large sites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Smaller plugin/theme ecosystem than mainstream CMS platforms like WordPress$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Relies on community/volunteer maintenance rather than a company with formal support contracts$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Is Automad free to use?$q$, $q$Yes. Automad is released under the MIT license and is free to download, self-host, and modify.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Does Automad require a database?$q$, $q$No. Automad stores all content in flat text files, so no database setup is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Can Automad be used headless?$q$, $q$Yes, Automad offers a read-only JSON API mode for use as a headless content backend.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$What do I need to host Automad?$q$, $q$A standard PHP-capable web server is sufficient since there is no database dependency.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Version-controlled marketing sites$q$, $q$Teams that want their entire site content stored as files they can track in Git alongside code.$q$, $q$Developers and small agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$Lightweight blogs and portfolios$q$, $q$Individuals who want a simple CMS without the overhead of installing and maintaining a database.$q$, $q$Freelancers and individual site owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Automad is an open-source, flat-file content management system and template engine that runs without a database. All pages and settings are stored as plain, human-readable text files, which makes an entire site easy to back up, diff, and put under version control with Git.$q$, $q$It ships with a browser-based dashboard that includes a block-style page editor and an in-page editing mode, so content can be adjusted directly while browsing the live site. A built-in caching layer and headless JSON API mode round out the toolset for developers who want to use Automad as a backend for a separate frontend.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Automad suits developers and freelancers building small-to-medium marketing sites, portfolios, or blogs who want a lightweight, database-free alternative to WordPress and prefer keeping content in files they can track with Git.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('355c526d-e07b-4c3a-acc9-565c7b6f3d13', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bludit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Simple, database-free flat-file CMS that stores content as JSON files for fast, self-hosted blogs and sites.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Bludit is a free, open-source flat-file CMS that stores content as JSON files, requiring no database for fast, simple self-hosted sites.$q$,
  og_description = $q$Bludit is a free, open-source flat-file CMS that stores content as JSON files, requiring no database for fast, simple self-hosted sites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2dacf89b-e2ef-4c5b-abc5-d221801f171b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2dacf89b-e2ef-4c5b-abc5-d221801f171b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Flat-file JSON storage$q$, $q$Content is stored as JSON files, eliminating the need for a database server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Markdown and HTML editors$q$, $q$Write content in Markdown or a rich HTML editor, depending on preference.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Themes and plugins$q$, $q$Official repository of themes and plugins for extending site functionality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Built-in SEO tools$q$, $q$On-page SEO fields for titles, descriptions, and friendly URLs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Privacy-first design$q$, $q$No default visitor tracking, aimed at simplifying GDPR-friendly deployments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$No database required, simplifying setup and backups$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Fast page loads due to lightweight flat-file architecture$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Free and open source under the MIT license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Simple admin interface aimed at non-technical editors$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Flat-file architecture can become harder to manage at very large content volumes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Smaller ecosystem of themes/plugins compared to database-driven CMS platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Community-maintained project without an enterprise support contract$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Does Bludit need a database?$q$, $q$No. Bludit stores all content as JSON files on disk, so no database installation is needed.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Is Bludit free?$q$, $q$Yes, Bludit is open source under the MIT license and free to self-host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$What does Bludit require to run?$q$, $q$A web server with PHP support is all that's needed; no database server is required.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Fast personal or business blogs$q$, $q$Sites that want quick load times and simple file-based backups without database overhead.$q$, $q$Bloggers and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$Low-maintenance self-hosted sites$q$, $q$Developers deploying lightweight sites on shared or low-resource hosting.$q$, $q$Developers and site administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bludit is an open-source, flat-file content management system that stores posts and pages as JSON text files instead of relying on a database. It positions itself around simplicity, speed, and security, and only requires a PHP-capable web server to run.$q$, $q$The platform supports both Markdown and HTML editing, ships with an official theme and plugin ecosystem, and includes built-in SEO fields. Bludit emphasizes privacy by default, with no visitor tracking baked into the core software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bludit fits bloggers, small businesses, and developers who want a fast, no-database CMS that's simple to install on shared hosting and easy to back up by copying files.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dacf89b-e2ef-4c5b-abc5-d221801f171b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bolt CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source PHP CMS built on Symfony and Twig with built-in REST and GraphQL APIs for headless use.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Bolt CMS is a free, open-source PHP content management system built on Symfony with built-in REST and GraphQL APIs for headless use.$q$,
  og_description = $q$Bolt CMS is a free, open-source PHP content management system built on Symfony with built-in REST and GraphQL APIs for headless use.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ddf71270-678f-48af-a74a-407a4c5982bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ddf71270-678f-48af-a74a-407a4c5982bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Symfony-based architecture$q$, $q$Built on Symfony components, allowing use of the Symfony bundle ecosystem for extensions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$REST and GraphQL APIs$q$, $q$Built-in APIs enable headless CMS usage alongside traditional page rendering.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Twig templating$q$, $q$Uses the Twig template engine common across Symfony projects for theme development.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Field-level translation$q$, $q$Multi-language support with translation control at the individual field level.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Multiple content editors$q$, $q$Includes both an Article editor and a Redactor rich-text editor for content creation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Extensions marketplace$q$, $q$Directory of community and commercial extensions and developer services.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Native REST and GraphQL APIs for headless or hybrid setups$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Built on Symfony, giving access to a large, mature PHP ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Free and open source$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Structured field-level translation support for multilingual sites$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Requires familiarity with Symfony conventions, raising the learning curve for non-Symfony developers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Smaller community and plugin ecosystem than larger CMS platforms like Drupal or Joomla$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Release cadence has slowed compared to the project's earlier years$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Is Bolt CMS free?$q$, $q$Yes, Bolt CMS is open source and free to download and self-host; commercial developer services are offered separately by community members.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Can Bolt CMS be used headless?$q$, $q$Yes, it includes built-in RESTful and GraphQL APIs for headless or hybrid frontend setups.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$What framework is Bolt CMS built on?$q$, $q$Bolt CMS is built on Symfony and uses Twig for templating.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Headless content backend$q$, $q$Teams that want a PHP-based headless CMS with a ready-made GraphQL API for a decoupled frontend.$q$, $q$Developers building JAMstack or decoupled sites$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$Symfony-based websites$q$, $q$Agencies already working in the Symfony ecosystem who want a CMS layer that fits their existing stack.$q$, $q$PHP/Symfony development shops$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bolt CMS is an open-source content management system built on the Symfony framework and Twig templating. Current versions ship with both RESTful and GraphQL APIs out of the box, making it usable as a traditional CMS or as a headless content backend.$q$, $q$The editing experience includes Article and Redactor content editors, field-level internationalization, dummy content generation for development, and a default Tailwind CSS-based theme. Because it's built on Symfony, Bolt is compatible with the broader Symfony bundle ecosystem.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bolt CMS is aimed at developers already comfortable with the Symfony/PHP ecosystem who want a CMS foundation they can extend with standard Symfony components, or who need a headless-capable CMS with a REST/GraphQL API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddf71270-678f-48af-a74a-407a4c5982bb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── CMS Made Simple ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source PHP/MySQL content management system using the Smarty template engine, maintained by a nonprofit foundation.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = $q$Canada (CMS Made Simple Foundation)$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CMS Made Simple is a free, open-source PHP/MySQL CMS using Smarty templating, maintained by a non-profit foundation since 2004.$q$,
  og_description = $q$CMS Made Simple is a free, open-source PHP/MySQL CMS using Smarty templating, maintained by a non-profit foundation since 2004.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '330370f7-f51f-46b8-a8a2-9d0d70a14749';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '330370f7-f51f-46b8-a8a2-9d0d70a14749' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Smarty templating$q$, $q$Design layer built on the Smarty template engine, separating markup from PHP logic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Module and plugin system$q$, $q$Extensible architecture supporting third-party modules, plugins, and themes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Developer API$q$, $q$Documented API for building custom modules and integrations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Non-profit governance$q$, $q$Maintained by the CMS Made Simple Foundation, a registered Canadian non-profit.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Long-running, mature project with a stable core (latest release series 2.2.x)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Free and open source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Smarty templating gives designers layout control without heavy PHP knowledge$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Governed by a non-profit foundation rather than a single commercial vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Smaller community and extension marketplace than Drupal, Joomla, or WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Requires MySQL/PHP hosting rather than a database-free setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$UI conventions feel dated compared to newer CMS platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Is CMS Made Simple free?$q$, $q$Yes, it's open source and free to download and self-host; the project accepts donations to support the non-profit foundation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Who maintains CMS Made Simple?$q$, $q$The CMS Made Simple Foundation, a registered non-profit organization based in Canada.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$What templating engine does it use?$q$, $q$CMS Made Simple uses the Smarty PHP template engine for its design layer.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Small business websites$q$, $q$Businesses that want a stable, self-hosted CMS without a steep learning curve.$q$, $q$Small businesses and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$Long-term site maintenance$q$, $q$Organizations already on CMS Made Simple that want to continue with a maintained, community-driven platform.$q$, $q$Existing CMS Made Simple site owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CMS Made Simple is an open-source content management system that has been in active development since 2004. It's maintained by the CMS Made Simple Foundation, a registered non-profit organization in Canada, and its codebase moved to GitHub in early 2025 to broaden community collaboration.$q$, $q$It uses the Smarty templating engine for design flexibility, giving designers control over markup without needing deep PHP knowledge, while developers can extend the system with modules, plugins, and a documented API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CMS Made Simple suits small businesses, agencies, and long-time users who want a straightforward, self-hosted PHP CMS without the complexity of larger enterprise platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('330370f7-f51f-46b8-a8a2-9d0d70a14749', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Contao ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, accessibility-focused CMS built on Symfony for professional websites and web applications.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Contao is a free, open-source, accessibility-focused CMS built on Symfony, used for professional websites since 2006 (formerly TYPOlight).$q$,
  og_description = $q$Contao is a free, open-source, accessibility-focused CMS built on Symfony, used for professional websites since 2006 (formerly TYPOlight).$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2ffe72c4-8110-4eaf-b546-5d3899b26ca0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2ffe72c4-8110-4eaf-b546-5d3899b26ca0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Accessibility compliance tooling$q$, $q$Built to support BITV 2.0 and BFSG accessibility standards, with an accessible admin interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Symfony foundation$q$, $q$Built on the Symfony framework, giving access to a large bundle ecosystem for customization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Multi-site management$q$, $q$Run multiple websites from a single Contao installation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Multilingual content$q$, $q$Native support for managing content across multiple languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Modern authentication$q$, $q$Supports passkey and two-factor authentication with automatic lockouts after failed logins.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Performance caching$q$, $q$Supports Varnish HTTP caching and HTTP/2 for high-traffic sites.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Strong accessibility focus, useful for public-sector and compliance-driven sites$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Free and open source under LGPL-3.0, usable in commercial projects$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Built on Symfony, giving access to a mature bundle ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Established project with roots going back to 2006$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Community and documentation skew heavily toward the German-speaking market$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Requires Symfony/PHP familiarity for deeper customization$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Smaller international extension ecosystem than Drupal or Joomla$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Is Contao free to use?$q$, $q$Yes, Contao is licensed under LGPL-3.0 and free to use, including for commercial projects.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$What was Contao previously called?$q$, $q$Contao was originally released in 2006 as TYPOlight and renamed Contao in 2010.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Does Contao support accessibility standards?$q$, $q$Yes, it's built to help sites meet accessibility requirements such as BITV 2.0 and Germany's BFSG law.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Accessibility-compliant public sites$q$, $q$Public sector or institutional sites that must meet formal accessibility regulations.$q$, $q$Government agencies and public institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$Multi-site agency deployments$q$, $q$Agencies managing multiple client websites from a single Contao installation.$q$, $q$Web agencies, especially in the DACH region$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Contao is an open-source content management system, originally released in 2006 as TYPOlight and renamed Contao in 2010. It's licensed under LGPL-3.0 and built on the Symfony framework, giving developers access to thousands of Symfony bundles for extending functionality.$q$, $q$Accessibility is a core design goal: Contao supports building sites that meet standards such as BITV 2.0 and Germany's BFSG accessibility law, and its own admin interface is largely accessible. The platform also supports multiple websites per installation, multilingual content, granular user permissions, HTTP/2, Varnish caching, and automated sitemap generation, alongside modern security features like passkey/2FA login.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Contao is popular with agencies and organizations in the DACH (Germany/Austria/Switzerland) region and with any team that needs to meet formal web accessibility requirements for public-sector or enterprise sites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ffe72c4-8110-4eaf-b546-5d3899b26ca0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── CouchCMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Template-driven, open-source PHP CMS that converts static HTML/CSS templates into editable sites without coding.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CouchCMS is an open-source, template-driven PHP CMS that turns static HTML/CSS templates into editable, client-friendly websites.$q$,
  og_description = $q$CouchCMS is an open-source, template-driven PHP CMS that turns static HTML/CSS templates into editable, client-friendly websites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8ae627ac-41a3-4d2a-80ef-75696ca1cfb2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8ae627ac-41a3-4d2a-80ef-75696ca1cfb2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Editable regions$q$, $q$Mark sections of existing HTML templates as editable using simple tags.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Cloned pages$q$, $q$Generate blog posts, portfolio items, or event listings from a single template.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$SEO-friendly URLs$q$, $q$Nestable virtual folders produce clean, readable URLs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Comments and moderation$q$, $q$Built-in visitor commenting with moderation controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Forms and events$q$, $q$Self-validating forms and an events calendar with map integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$PayPal integration$q$, $q$Sell digital goods directly through the CMS with automated payment handling.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$No PHP knowledge required to build a client-editable site from an HTML template$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Free, open-source core under CPAL 1.0$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Wide range of built-in features (forms, events, search, RSS) without extra plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Optional commercial license for white-labeling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Smaller community and ecosystem compared to major CMS platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Template-tag approach can feel unfamiliar to developers used to standard PHP frameworks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Less frequent public updates than more actively marketed CMS projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Is CouchCMS free?$q$, $q$Yes, the core CMS is open source under the Common Public Attribution License 1.0; a paid commercial license is available for white-labeling.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Do I need to know PHP to use CouchCMS?$q$, $q$No, CouchCMS is designed so front-end designers can make HTML/CSS templates editable using tags, without writing PHP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Can CouchCMS sell digital products?$q$, $q$Yes, it includes built-in PayPal integration for selling digital goods.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Converting static templates to CMS sites$q$, $q$Designers who have a finished HTML/CSS template and want to make it editable for clients.$q$, $q$Freelance web designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Small business sites with blogs/events$q$, $q$Sites needing blog posts, event listings, and forms without a heavy framework.$q$, $q$Small businesses and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, $q$["CPAL 1.0 licensed core CMS","Editable regions, cloned pages, forms, events, search"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$Commercial License$q$, $q$Paid (price not published)$q$, $q$One-time$q$, $q$["Remove CouchCMS branding (white-label)","One month of premium support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CouchCMS is an open-source content management system aimed at web designers who want to turn existing static HTML/CSS templates into editable websites. Instead of writing PHP, designers wrap sections of their markup in special tags to mark them as editable, cloneable, or listable.$q$, $q$It's released under the Common Public Attribution License 1.0, which allows free commercial use with attribution; a paid commercial license is also available to remove branding and add a period of premium support. Core features include editable regions, cloned pages for blogs and portfolios, comment moderation, SEO-friendly nested URLs, form handling, an events calendar, site search, RSS feeds, and PayPal integration for selling digital goods.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CouchCMS is built for front-end designers and freelancers who already have HTML/CSS templates and want to make them client-editable without learning a full PHP framework.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ae627ac-41a3-4d2a-80ef-75696ca1cfb2', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Drupal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Enterprise-grade open-source CMS with a composable, API-first architecture, maintained by the nonprofit Drupal Association.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Drupal is a free, open-source enterprise CMS with a composable, API-first architecture, maintained by the nonprofit Drupal Association.$q$,
  og_description = $q$Drupal is a free, open-source enterprise CMS with a composable, API-first architecture, maintained by the nonprofit Drupal Association.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f8fefc7b-8f41-4745-a164-82c127ab7a0f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f8fefc7b-8f41-4745-a164-82c127ab7a0f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Structured content modeling$q$, $q$Highly flexible content types and fields for modeling complex information architectures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$API-first / composable architecture$q$, $q$Headless and decoupled deployment options via Drupal's built-in APIs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Granular permissions$q$, $q$Fine-grained role and permission system suited to large organizations and multi-editor teams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Large module ecosystem$q$, $q$Thousands of contributed modules extending core functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Enterprise security process$q$, $q$Coordinated security advisory and release process backed by the Drupal Security Team.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Drupal CMS distribution$q$, $q$A curated, easier-to-adopt starting point aimed at marketers and content editors.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Highly flexible for complex, structured, or multi-site content architectures$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Backed by a large community, certified partner network, and a formal security process$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$API-first design supports headless and hybrid delivery$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Steeper learning curve than lighter CMS platforms, especially for non-developers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Can require more hosting resources and technical maintenance than simpler CMS options$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Module quality and maintenance vary since the ecosystem is community-contributed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Is Drupal free?$q$, $q$Yes, Drupal is free, open-source software available as Drupal CMS (for content teams) or Drupal Core (for custom development).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Who maintains Drupal?$q$, $q$Drupal is maintained by a global open-source community, supported by the nonprofit Drupal Association.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Can Drupal be used headless?$q$, $q$Yes, Drupal has an API-first, composable architecture that supports headless and decoupled implementations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$When was Drupal created?$q$, $q$Drupal was created by Dries Buytaert in 2001.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Large institutional and government sites$q$, $q$Organizations needing complex permissions, multi-site management, and a strong security process.$q$, $q$Government, higher education, and enterprise IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$Headless/composable content backends$q$, $q$Teams building decoupled frontends that consume Drupal via its APIs.$q$, $q$Development teams building custom digital experiences$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Drupal is a large, open-source content management system originally created by Dries Buytaert in 2001 and now supported by the nonprofit Drupal Association along with a global community of contributors, certified partners, and thousands of experienced professionals.$q$, $q$It's distributed in two main forms: Drupal CMS, a curated distribution aimed at marketers and content teams, and Drupal Core, the underlying framework for developers building fully custom applications. Drupal's architecture is API-first and composable, supporting structured content, low-code/no-code options, and integrated AI tooling, and it's used to power hundreds of thousands of websites worldwide.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Drupal is best suited to organizations with complex content structures, multi-site needs, or enterprise governance requirements — from government agencies and universities to large media and corporate sites — where its flexibility and security track record justify a steeper setup curve than smaller CMS options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8fefc7b-8f41-4745-a164-82c127ab7a0f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── eLabFTW ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source electronic lab notebook for research teams to log experiments, manage inventory, and book equipment.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = $q$Paris, France (Deltablot)$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$eLabFTW is a free, open-source electronic lab notebook for logging experiments, managing inventory, and booking equipment in research labs.$q$,
  og_description = $q$eLabFTW is a free, open-source electronic lab notebook for logging experiments, managing inventory, and booking equipment in research labs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '40837e93-aef4-40d6-a619-0330eaa64ea6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '40837e93-aef4-40d6-a619-0330eaa64ea6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Electronic lab notebook$q$, $q$Log experiments and protocols with timestamping and digital signatures for auditability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Inventory management$q$, $q$Track lab resources such as plasmids, compounds, and antibodies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Equipment booking$q$, $q$Schedule shared equipment and resources with granular permission controls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Multi-format export$q$, $q$Export data as PDF, CSV, JSON, or the ELN archival format.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Internationalization and accessibility$q$, $q$Available in 21+ languages and designed toward WCAG 2.1 accessibility compliance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Security auditing$q$, $q$Regular code audits and a bug bounty program supporting the security posture of the platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Fully free and open source under AGPLv3 with no feature paywall$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Purpose-built for research compliance: timestamping, digital signatures, audit trails$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Combines lab notebook, inventory, and equipment booking in one system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Managed hosting option available through Deltablot for teams that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Self-hosting requires Linux server administration expertise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Feature depth is focused on lab/research workflows, not general-purpose content management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Managed hosting is a paid service, separate from the free self-hosted software$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Is eLabFTW free?$q$, $q$Yes, the self-hosted software is free and open source under AGPLv3 with all features included, no paywall.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Who develops eLabFTW?$q$, $q$It was created by researcher Nicolas Carpi in 2012 and is maintained by Deltablot, the company he founded in 2019.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Can eLabFTW be hosted for me instead of self-hosting?$q$, $q$Yes, Deltablot offers managed/cloud hosting with PRO support as a paid alternative to self-hosting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$What can eLabFTW track besides experiments?$q$, $q$It also includes inventory management for lab resources and a booking system for shared equipment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Academic research labs$q$, $q$University labs replacing paper notebooks with a searchable, auditable digital record.$q$, $q$Academic researchers and lab managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Industry R&D teams$q$, $q$Companies needing compliant experiment tracking and shared equipment scheduling.$q$, $q$Biotech and industry R&D teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full open-source software, AGPLv3","All features included, no paywall","Requires own server/Linux administration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$Managed Hosting (Deltablot)$q$, $q$Paid (contact for pricing)$q$, $q$Subscription$q$, $q$["Cloud-hosted eLabFTW instance","PRO support","Choice of data hosting region"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$eLabFTW is a free, open-source electronic lab notebook (ELN) created by researcher Nicolas Carpi in 2012 to replace paper lab notebooks. It's released under the AGPLv3 license, with all features available with no paywall, and is maintained today by Deltablot, the company Carpi founded in 2019 to support the growing eLabFTW community.$q$, $q$Beyond experiment logging with timestamping and digital signatures, eLabFTW includes an inventory module for tracking lab resources such as plasmids, compounds, and antibodies, and a booking system for scheduling shared equipment with granular permissions. It supports export to PDF, CSV, JSON, and the ELN archival format, is available in 21+ languages, and aims for WCAG 2.1 accessibility compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$eLabFTW is built for academic and industry research labs that need a compliant, auditable digital record of experiments and shared resources, whether self-hosted on institutional infrastructure or run via Deltablot's managed hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('40837e93-aef4-40d6-a619-0330eaa64ea6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Joomla! ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source CMS for building websites and web applications, built entirely by a volunteer community.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2005,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Joomla! is a free, open-source CMS built by a volunteer community, offering multilingual support and a large extensions ecosystem.$q$,
  og_description = $q$Joomla! is a free, open-source CMS built by a volunteer community, offering multilingual support and a large extensions ecosystem.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b17cb33e-88ec-4a90-a49e-1ba15fca71cb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b17cb33e-88ec-4a90-a49e-1ba15fca71cb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Multilingual support$q$, $q$Built-in tools for managing content across multiple languages without third-party plugins.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Multi-user permission levels$q$, $q$Granular access control for teams with multiple content editors and roles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Extensions ecosystem$q$, $q$Over 10,000 community extensions and templates for adding functionality and design options.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$SEO and mobile friendly defaults$q$, $q$Core designed to be search-engine friendly and responsive out of the box.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Flexible design system$q$, $q$Unlimited template-based design customization.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Free and open source, built and maintained entirely by volunteers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Native multilingual support without requiring extra plugins$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Large extension and template ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Established, long-running project (since 2005) with a large install base$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Smaller professional services/agency market than Drupal or WordPress in some regions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Admin interface has a steeper learning curve for first-time non-technical users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Relies on community-contributed extensions of varying maintenance quality$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Is Joomla! free?$q$, $q$Yes, Joomla! is free and open-source software governed by the nonprofit Open Source Matters, Inc.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Does Joomla! support multiple languages?$q$, $q$Yes, multilingual content management is built into the core.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$When was Joomla! first released?$q$, $q$Joomla! was first released in 2005.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Multilingual organizational websites$q$, $q$Nonprofits, government bodies, or businesses needing native multi-language publishing.$q$, $q$Nonprofits, government sites, and multinational businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$Multi-editor content sites$q$, $q$Teams needing structured, role-based publishing workflows.$q$, $q$Membership sites and multi-author publications$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Joomla! is a free, open-source content management system first released in 2005 and built entirely by a global volunteer community, governed by the nonprofit Open Source Matters, Inc. It's recognized as a Digital Public Good and reports over 155 million downloads and more than 2 million active websites.$q$, $q$The platform is search-engine and mobile friendly out of the box, with multilingual support, flexible design customization, a multi-user permission system, and an extensible architecture backed by more than 10,000 extensions and templates from its community.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Joomla! suits organizations that need multi-user content workflows and multilingual sites out of the box — such as nonprofits, membership sites, and small-to-midsize businesses — without committing to a heavier enterprise platform like Drupal.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b17cb33e-88ec-4a90-a49e-1ba15fca71cb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Localess ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source headless CMS built on Angular and Firebase for managing content, translations, and assets for global teams.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Localess is a free, open-source headless CMS built on Angular and Firebase, with AI-assisted translation and content management for global teams.$q$,
  og_description = $q$Localess is a free, open-source headless CMS built on Angular and Firebase, with AI-assisted translation and content management for global teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba1e26ba-4573-4e22-a55a-4786e0233908';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba1e26ba-4573-4e22-a55a-4786e0233908' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Headless content API$q$, $q$Content is managed centrally and delivered via API for use in any frontend.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Translation workflow management$q$, $q$Assign, review, and approve translations as part of the publishing process.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$AI-assisted translation$q$, $q$Integrates with Google Translate to speed up translating content into multiple languages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Visual schema builder$q$, $q$Define content fields, types, and relationships without writing code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Asset management$q$, $q$Organize images, videos, and documents alongside content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Firebase-native deployment$q$, $q$Runs on Firebase and Google Cloud, using Firestore, Auth, Storage, and Functions.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Free and open source (MIT license); only pay for your own infrastructure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Purpose-built translation management with AI-assisted translation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Visual schema modeling accessible to non-engineers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Fast delivery via Google CDN integration$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Tied to the Firebase/Google Cloud stack, which limits hosting flexibility for non-GCP teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Smaller, newer community compared to established headless CMS options$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Requires familiarity with Firebase deployment concepts to self-host$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Is Localess free?$q$, $q$Yes, Localess is open source under the MIT license; you only pay for the Firebase/Google Cloud infrastructure you deploy it on.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$What stack does Localess run on?$q$, $q$It's built with Angular on the frontend and Firebase (Firestore, Auth, Storage, Functions) plus Google Cloud on the backend.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Does Localess help with translations?$q$, $q$Yes, it includes a translation management workflow with AI-assisted translation via Google Translate.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Multilingual content operations$q$, $q$Global teams that need structured translation review and approval workflows.$q$, $q$Localization and content teams at global companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$Headless content for Firebase apps$q$, $q$Engineering teams already on Firebase/Google Cloud who want a lightweight headless CMS.$q$, $q$Development teams using Firebase$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Localess is an open-source, headless content management system built with Angular and deployed on Firebase (Authentication, Firestore, Storage, and Functions) and Google Cloud infrastructure. It's released under the MIT license and described by its maintainers as free forever, with users only paying for the infrastructure they deploy it on.$q$, $q$The platform focuses on multilingual publishing: it centralizes translation workflows with assignment, review, and approval steps, offers AI-assisted translation through Google Translate integration, and provides visual schema tools so teams can define content fields, types, and relationships without engineering involvement. Content, translations, and assets are managed together, and a Google CDN integration is used to serve content quickly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Localess fits engineering-led teams already using Firebase/Google Cloud who need a lightweight, self-hosted headless CMS with strong multilingual and translation workflow support, without adopting a heavier enterprise CMS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba1e26ba-4573-4e22-a55a-4786e0233908', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── MODX ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MODX is a free, open-source PHP content management framework that gives developers full control over markup with no forced templates.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (open source); MODX Cloud hosting is custom-priced$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MODX is a free, open-source PHP CMS/CMF with no forced templates, full access control, and multi-site support, plus optional MODX Cloud hosting.$q$,
  og_description = $q$MODX is a free, open-source PHP CMS/CMF with no forced templates, full access control, and multi-site support, plus optional MODX Cloud hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba2afed9-4dd0-452e-8365-2334d0c54742';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba2afed9-4dd0-452e-8365-2334d0c54742' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Template, Chunk & Snippet architecture$q$, $q$Build page output from reusable Templates, Chunks, and PHP Snippets instead of a fixed theme engine.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Access Control Lists$q$, $q$Granular user-group and permission policies control who can edit which resources and elements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Contexts for multi-site management$q$, $q$Run multiple related sites or sections from a single MODX install using Contexts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Friendly URLs$q$, $q$Clean, SEO-friendly URL structures configurable per resource.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$MODX Extras repository$q$, $q$Community-built add-ons for e-commerce, forms, SEO, and more, installable via the package manager.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Resource revision history$q$, $q$Track and roll back changes to content resources.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$MODX Cloud hosting$q$, $q$Optional managed hosting with selective staging, a CDN/WAF, and migration tune-ups for MODX sites.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$No forced theme or markup — complete design freedom$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Free, open-source core with no licensing fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Fine-grained access control for multi-editor teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Long-running project (since 2004) with an established community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Native multi-site support via Contexts$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Steeper learning curve than turnkey CMSs like WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Smaller extras/plugin ecosystem than mainstream competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Requires PHP/MySQL server knowledge to self-host$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$MODX Cloud pricing isn't published and requires contacting sales$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Is MODX free to use?$q$, $q$Yes. The MODX CMS/CMF software is free and open source. MODX Cloud managed hosting is a separate, paid service.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$What does MODX run on?$q$, $q$MODX is a PHP content management framework that runs on a standard PHP/MySQL (or MariaDB) server stack.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Does MODX come with built-in themes?$q$, $q$No. MODX has no default front-end theme; developers create the HTML output using Templates, Chunks, and Snippets.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Can I self-host MODX?$q$, $q$Yes, MODX can be installed on any compatible PHP/MySQL server, or run on the official MODX Cloud platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Fully custom marketing websites$q$, $q$Agencies build bespoke sites with exact control over markup, without theme constraints.$q$, $q$Web agencies and freelance developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$Multi-site management$q$, $q$Organizations run several related websites from one MODX install using Contexts.$q$, $q$Businesses managing multiple brands or microsites$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$MODX Open Source$q$, $q$Free$q$, NULL, $q$["Full CMS/CMF source code","Self-hosted on your own server","Community support forums"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$MODX Cloud Pro Site$q$, $q$Custom / contact sales$q$, NULL, $q$["Managed hosting","Selective staging","CDN + web application firewall","Site tune-up during migration"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MODX is an open-source PHP content management framework that began in 2004 as a fork of the Etomite CMS, and later grew into MODX Revolution. Unlike CMSs that ship with fixed themes, MODX has no built-in front-end markup — developers build the HTML output themselves using Templates, Chunks, and Snippets, giving full control over the final page structure.$q$, $q$The core software is free to download and self-host on any PHP/MySQL server. MODX LLC, the company behind the project, also runs MODX Cloud, a separate managed hosting service for MODX-built sites with staging, a CDN, and a web application firewall.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MODX suits web agencies and developers who want to build fully custom marketing sites, portals, or multi-site setups without fighting a CMS's default theme system or plugin conventions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba2afed9-4dd0-452e-8365-2334d0c54742', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Neos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Neos is a free, open-source PHP content management system with inline WYSIWYG editing and multi-site, multi-language publishing.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Neos is a free, open-source PHP CMS with inline WYSIWYG editing, multi-site and multi-language support, built on the Neos Flow framework.$q$,
  og_description = $q$Neos is a free, open-source PHP CMS with inline WYSIWYG editing, multi-site and multi-language support, built on the Neos Flow framework.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fe036b27-0ca6-4aa1-8287-c9d8dafd6b57';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fe036b27-0ca6-4aa1-8287-c9d8dafd6b57' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Inline WYSIWYG editing$q$, $q$Edit content directly on the live page layout rather than in a separate backend form.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Multi-site and multi-language support$q$, $q$Manage several sites and languages from a single Neos installation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Content dimensions$q$, $q$Vary content by language, region, or audience segment for targeting and personalization.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Workspace-based publishing$q$, $q$Draft and review content in isolated workspaces before publishing to the live site.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Role-based access control$q$, $q$Assign editors and administrators permissions scoped to specific content areas.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Flow framework extensibility$q$, $q$Extend Neos with custom packages built on the underlying Neos Flow PHP framework.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Media center$q$, $q$Central asset library for managing images and files across sites.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Free and open source under GPL v3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$True inline editing gives editors a live preview of changes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Strong multi-site and multi-language capabilities$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Backed by a dedicated Neos Foundation and active contributor community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Smaller plugin/theme ecosystem than WordPress or Drupal$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Requires familiarity with the Flow PHP framework, adding a learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Fewer ready-made hosting or support vendors than more mainstream CMSs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Is Neos free?$q$, $q$Yes, Neos CMS is released under the GPL v3 (or later) license and is free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$What is Neos built on?$q$, $q$Neos is built on the Neos Flow PHP framework, which provides both content management and application-development capabilities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Who maintains Neos?$q$, $q$Neos is maintained by the Neos Foundation together with open-source community contributors.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Can Neos manage multiple languages and sites?$q$, $q$Yes, Neos has native multi-site and multi-language support through its content dimensions feature.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Multi-language enterprise sites$q$, $q$Organizations publish content across multiple languages and regions from one install.$q$, $q$Enterprises and public-sector organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$Custom content-driven applications$q$, $q$Developers combine content management with custom application logic via the Flow framework.$q$, $q$PHP developers and digital agencies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Neos is an open-source content management system built on the Neos Flow PHP framework. It grew out of the TYPO3 Phoenix project, was renamed TYPO3 Neos in 2012, and became an independent project (Neos) after splitting from the TYPO3 Association in 2015. It's licensed under GPL v3 or later and maintained by the Neos Foundation and community contributors.$q$, $q$Neos combines true inline WYSIWYG content editing with an application-development layer, so developers can extend it with custom Flow packages rather than being limited to a plugin marketplace.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Neos targets organizations and agencies that need multi-site, multi-language content management with real editorial workflows, and PHP developers comfortable working with the Flow framework.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe036b27-0ca6-4aa1-8287-c9d8dafd6b57', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pimcore ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pimcore is an open-source platform for content management, product information management (PIM), and digital asset management (DAM).$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Community Edition); Professional Edition from $9,900/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Salzburg, Austria$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pimcore is an open-source platform unifying CMS, PIM, MDM, and DAM, with a free Community Edition and paid Professional/Enterprise/PaaS licenses.$q$,
  og_description = $q$Pimcore is an open-source platform unifying CMS, PIM, MDM, and DAM, with a free Community Edition and paid Professional/Enterprise/PaaS licenses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '392c0dc0-952f-4089-9489-2c63d22bd5a1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '392c0dc0-952f-4089-9489-2c63d22bd5a1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Unified data platform$q$, $q$Combines CMS, PIM, MDM, and DAM so product and content data live in one system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Open-core Community Edition$q$, $q$Free, self-hostable core covering the fundamental content and data management capabilities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Pimcore Copilot$q$, $q$AI-driven productivity tooling with customizable, context-aware actions and a job execution engine.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$No seat or asset limits$q$, $q$Licensing isn't tied to user counts or the number of products/assets managed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Pimcore Studio$q$, $q$A modern, React-based admin interface introduced to replace the legacy ExtJS UI.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$E-commerce framework and CDP$q$, $q$Enterprise Edition adds an e-commerce framework and customer data platform module.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Managed PaaS hosting$q$, $q$Fully managed, cloud-hosted deployment option with 24/7 support and monitoring.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Free, open-source Community Edition with the same core as paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Combines CMS, PIM, MDM, and DAM instead of requiring separate tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Flat licensing that doesn't scale with product/asset volume$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Active development, including recent AI-assisted features$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Commercial editions are expensive for smaller teams ($9,900+/year)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Full feature set (e-commerce, CDP, AI extras) requires paid Enterprise or PaaS tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Complex platform with a learning curve for teams new to PIM/DAM systems$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Is Pimcore free?$q$, $q$The Community Edition is free and open source. Professional, Enterprise, and PaaS editions are paid commercial licenses with additional modules and support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$What does Pimcore Professional cost?$q$, $q$According to Pimcore's own pricing page, the Professional Edition starts at $9,900 per year for on-premises deployment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Where is Pimcore based?$q$, $q$Pimcore GmbH is headquartered in Salzburg, Austria.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Does Pimcore have AI features?$q$, $q$Yes, Pimcore has introduced AI-assisted tooling including Pimcore Copilot and an Agent SDK for automating data and content management tasks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Product information management$q$, $q$Centralize and syndicate product data across e-commerce, marketplaces, and print.$q$, $q$Retailers and manufacturers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Digital asset management$q$, $q$Store, tag, and distribute media assets across marketing channels.$q$, $q$Marketing and brand teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Enterprise content management$q$, $q$Manage websites and content alongside product and customer data.$q$, $q$Large enterprises with omnichannel needs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open-core CMS/PIM/DAM/MDM","Self-hosted","No commercial licensing required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Professional Edition$q$, $q$$9,900/year$q$, $q$annual$q$, $q$["On-premises deployment","Commercial license","Access to Pimcore Store"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$Enterprise Edition$q$, $q$$29,900/year$q$, $q$annual$q$, $q$["On-premises or private cloud","E-commerce framework and CDP","Long-term support","24/7 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$PaaS Edition$q$, $q$From $39,900/year$q$, $q$annual$q$, $q$["Fully managed cloud hosting","24/7 support and monitoring","All Enterprise features"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Pimcore is an open-core data and experience management platform combining a CMS, product information management (PIM), master data management (MDM), and digital asset management (DAM) in one system. It's developed by Pimcore GmbH, headquartered in Salzburg, Austria.$q$, $q$The Community Edition is free and open source, built on the same core as the commercial editions. Pimcore also sells Professional, Enterprise, and PaaS licenses that add commercial support, additional modules such as an e-commerce framework and customer data platform (CDP), and managed hosting.$q$, $q$Pimcore has been expanding its AI capabilities under the Pimcore Copilot and Agent SDK initiatives, adding AI-assisted actions, workflow automation, and integrations with external AI/ML providers across its data-management products.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Pimcore fits mid-size to large organizations that need to manage product data, digital assets, and content together — retailers, manufacturers, and enterprises running omnichannel commerce.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('392c0dc0-952f-4089-9489-2c63d22bd5a1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Plone ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Plone is a free, open-source enterprise content management system built on Python, known for its long security track record.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Plone is a free, open-source Python CMS with a REST API, granular workflow permissions, and a long-documented security track record since 2001.$q$,
  og_description = $q$Plone is a free, open-source Python CMS with a REST API, granular workflow permissions, and a long-documented security track record since 2001.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '97866dd0-6dea-4e55-a594-ffa15a710dc6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '97866dd0-6dea-4e55-a594-ffa15a710dc6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Python/Zope architecture$q$, $q$Built on the Zope application server with a modern React-based editing interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$REST API$q$, $q$Native REST API supports headless and decoupled front-end architectures.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Granular permissions and workflow$q$, $q$Fine-grained content workflow and role-based permissions suited to large organizations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Long-term security focus$q$, $q$A security track record the project has maintained for over two decades.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$On-premises or cloud deployment$q$, $q$Can be self-hosted on-premises or deployed in the cloud.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Extensible add-on architecture$q$, $q$Customize and extend functionality through Plone add-ons.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Completely free and open source, forever, per the Plone Foundation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Strong, long-documented security history$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Native REST API for headless use cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Mature workflow and permissions system suited to complex organizations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Backed by a nonprofit foundation rather than a single vendor$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Python/Zope stack is less common than PHP-based CMSs, narrowing the hosting/developer pool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Smaller theme and add-on ecosystem than WordPress$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Steeper setup and hosting requirements than typical shared-hosting CMSs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Is Plone free?$q$, $q$Yes, Plone is 100% open source and free, with no licensing costs, per the Plone Foundation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$What is Plone built with?$q$, $q$Plone runs on the Python-based Zope application server, with a React-based editing UI and a REST API.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$How old is Plone?$q$, $q$Plone was established in 2001 and has been continuously developed since.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Can Plone be used as a headless CMS?$q$, $q$Yes, Plone provides a REST API that supports headless and decoupled front-end architectures.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Government and institutional websites$q$, $q$Organizations with strict security/compliance needs run Plone for public-facing and intranet sites.$q$, $q$Government agencies and universities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$Headless content delivery$q$, $q$Teams use Plone's REST API to power custom front ends while managing content centrally.$q$, $q$Developers building decoupled applications$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Plone is an open-source content management system that has been developed since 2001, built on the Python-based Zope application server with a React front end for its editing interface. It's backed by the nonprofit Plone Foundation and a community of contributors.$q$, $q$Plone is 100% free with no licensing fees, and offers a REST API for headless deployments alongside its traditional server-rendered site management.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Plone is commonly used by government agencies, universities, and organizations with strict security and compliance requirements that value a long-standing, actively maintained open-source CMS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97866dd0-6dea-4e55-a594-ffa15a710dc6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Publify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Publify is a free, open-source Ruby on Rails blogging platform, formerly known as Typo, in active development since 2004.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Publify (formerly Typo) is a free, open-source Ruby on Rails blogging platform with multi-author support, in development since 2004.$q$,
  og_description = $q$Publify (formerly Typo) is a free, open-source Ruby on Rails blogging platform with multi-author support, in development since 2004.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c8c59b52-b5c2-4b4d-9425-6cc9d93670f8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c8c59b52-b5c2-4b4d-9425-6cc9d93670f8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Multi-user blogging$q$, $q$Supports multiple authors publishing to the same blog.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Text-formatting options$q$, $q$Built-in support for Markdown, Textile, and other filtering languages for post content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Theming system$q$, $q$Customizable themes for controlling blog appearance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Widgets and plugins$q$, $q$Extend functionality through a widget and plugin system.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Social sharing integration$q$, $q$Includes short-messaging features connected to services like Twitter/X.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Free and open source, self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$One of the longest-running Ruby on Rails open-source projects$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Multi-author support out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Actively maintained on GitHub$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Much smaller community and plugin ecosystem than WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Ruby on Rails hosting requirements are less beginner-friendly than PHP CMSs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Limited modern documentation compared to mainstream blogging platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Is Publify the same as Typo?$q$, $q$Yes, Publify was originally released as Typo and was later renamed Publify.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Is Publify free?$q$, $q$Yes, Publify is free, open-source software available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$What is Publify built with?$q$, $q$Publify is a Ruby on Rails application, requiring a Rails-compatible hosting environment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Is Publify still maintained?$q$, $q$Yes, its GitHub repository shows ongoing activity and it isn't archived.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$Self-hosted personal or team blogging$q$, $q$Individuals or small teams run their own blog without relying on a hosted platform.$q$, $q$Ruby developers and self-hosters$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Publify (formerly Typo) is an open-source, multi-user blogging engine built on Ruby on Rails, in development since 2004. It bills itself as the oldest Ruby on Rails open-source project still maintained, and remains active on GitHub.$q$, $q$Publify covers self-hosted blogging with built-in text-formatting options (Markdown, Textile), a plugin/widget system, and themeable templates, in keeping with IndieWeb-style self-hosting and content ownership.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Publify suits Ruby developers and self-hosting enthusiasts who want a lightweight, self-owned blogging platform rather than a hosted service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c8c59b52-b5c2-4b4d-9425-6cc9d93670f8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── REDAXO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$REDAXO is a free, open-source PHP content management system originating in Germany, built for sites ranging from small to complex portals.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_meta_description = $q$REDAXO is a free, open-source PHP/MySQL CMS from Germany, in development since 2003, with category-based structure and community AddOns.$q$,
  og_description = $q$REDAXO is a free, open-source PHP/MySQL CMS from Germany, in development since 2003, with category-based structure and community AddOns.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bfc00fd3-6190-4930-b4d3-4453015d69ed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bfc00fd3-6190-4930-b4d3-4453015d69ed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Category-based structure$q$, $q$Organize site content and navigation through a category tree.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Block-based content input$q$, $q$Modular content blocks let editors assemble pages from reusable pieces.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Media pool$q$, $q$Central library for managing images and files across the site.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$AddOn extensibility$q$, $q$Extend core functionality with community-built AddOns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Open GitHub development$q$, $q$Development happens in the open, with community contributions welcomed.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Free and open source, PHP/MySQL based$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Active community (FriendsOfREDAXO) contributing AddOns and support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Flexible content-block system for varied page layouts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Established project with continuous development since 2003$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Documentation and community are primarily German-language$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Smaller international adoption and ecosystem than PHP CMSs like WordPress$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Requires PHP/MySQL server knowledge to self-host$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Is REDAXO free?$q$, $q$Yes, REDAXO is free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$What language is REDAXO's community in?$q$, $q$REDAXO's primary community and much of its documentation are in German, though the software itself is used internationally.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$What does REDAXO run on?$q$, $q$REDAXO is a PHP content management system that requires a MySQL-compatible database.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$How long has REDAXO been developed?$q$, $q$REDAXO has been in development since 2003.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Small business websites$q$, $q$Agencies build lightweight brochure and marketing sites.$q$, $q$Small web agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$Complex content portals$q$, $q$Larger organizations manage structured, category-driven content portals.$q$, $q$Mid-size organizations and public institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$REDAXO is an open-source PHP and MySQL content management system that has been developed since 2003, with a strong community base in Germany (the FriendsOfREDAXO community). It's free to download and self-host.$q$, $q$The system is structured around category-based content organization, block-based content input modules, and a media pool for managing files and images, with functionality extended through community-built AddOns.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$REDAXO is popular with German-speaking web developers and agencies building anything from small brochure sites to larger content portals.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bfc00fd3-6190-4930-b4d3-4453015d69ed', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SPIP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SPIP is a free, open-source French publishing system focused on collaborative editing, multilingual sites, and ease of use.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$French$q$, $q$English$q$]::text[],
  seo_meta_description = $q$SPIP is a free, open-source French publishing system built for collaborative editing and multilingual websites, created in 2001.$q$,
  og_description = $q$SPIP is a free, open-source French publishing system built for collaborative editing and multilingual websites, created in 2001.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f7206e3a-e992-4f4e-b237-ddd3af5fbec1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f7206e3a-e992-4f4e-b237-ddd3af5fbec1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Collaborative publishing workflow$q$, $q$Built around multi-editor, collective content operation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Multilingual support$q$, $q$Interface and content translated into many languages, including French, English, Spanish, German, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$GNU/GPL licensing$q$, $q$Free to use for nonprofit, institutional, personal, or commercial sites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Template language$q$, $q$SPIP's own templating syntax controls page rendering.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Completely free and open source under GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Strong multilingual support out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Designed from the ground up for collaborative/collective editing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Long track record since 2001$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Primary community and much documentation is French-language$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Smaller international ecosystem and plugin base than mainstream CMSs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$SPIP's custom template syntax adds a learning curve for developers used to other CMSs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Is SPIP free?$q$, $q$Yes, SPIP is free, open-source software distributed under the GNU/GPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Who created SPIP?$q$, $q$SPIP was created in 2001 by minirézo, a French collective focused on independent web publishing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Is SPIP only available in French?$q$, $q$No, while SPIP originated in France, it supports many languages including English, Spanish, German, Arabic, and Russian.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$What is SPIP good for?$q$, $q$SPIP is designed for collaborative, multi-editor publishing across nonprofit, institutional, personal, and commercial sites.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Collaborative editorial sites$q$, $q$Teams of editors jointly manage and publish content.$q$, $q$Nonprofits, media collectives, and institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$Multilingual publishing$q$, $q$Organizations publish the same content across several languages.$q$, $q$International or multilingual organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SPIP is a free, open-source web publishing system created in 2001 by minirézo, a French collective advocating for independent web presence and freedom of expression online. It's distributed under the GNU/GPL license.$q$, $q$SPIP emphasizes collaborative publishing, multilingual support, and simplicity, and supports translation into numerous languages beyond its French origin, including English, Spanish, German, Arabic, Russian, and Japanese.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SPIP is used by nonprofit, institutional, personal, and commercial publishers, particularly in French-speaking regions, who need a collaborative editorial workflow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7206e3a-e992-4f4e-b237-ddd3af5fbec1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Squidex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Squidex is an open-source, API-first headless CMS built on .NET, available self-hosted or as a managed cloud service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted, open source)$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Squidex is an open-source, API-first headless CMS built on .NET, free to self-host under MIT license or run on Squidex Cloud.$q$,
  og_description = $q$Squidex is an open-source, API-first headless CMS built on .NET, free to self-host under MIT license or run on Squidex Cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$REST and GraphQL APIs$q$, $q$Content is delivered through modern, developer-friendly API endpoints with OpenAPI support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Content versioning$q$, $q$Full version history with rollback and audit logging.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Configurable workflows$q$, $q$Customizable approval and publishing workflows for content teams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Event-driven architecture$q$, $q$Automate integrations with external systems via events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Kubernetes-ready deployment$q$, $q$Ships with Helm charts for containerized, self-hosted deployments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Open-source self-hosting$q$, $q$Free, MIT-licensed source available on GitHub with Docker-based installation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Free, MIT-licensed self-hosted option with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Modern API-first design with both REST and GraphQL$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Built-in content versioning and audit logs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Kubernetes/Helm support for scalable self-hosted deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Cloud plan pricing isn't published on the homepage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$.NET-based stack may be less familiar to teams standardized on Node/PHP hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Smaller ecosystem than larger headless CMS competitors like Contentful or Strapi$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Is Squidex free?$q$, $q$Yes, the self-hosted version is free and open source under the MIT license. Squidex also offers a paid managed cloud service.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$What is Squidex built with?$q$, $q$Squidex is built on .NET Core and exposes content through REST and GraphQL APIs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Can Squidex be self-hosted?$q$, $q$Yes, Squidex can be deployed via Docker, native binaries, or Kubernetes/Helm charts on your own infrastructure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Who created Squidex?$q$, $q$Squidex was created by Sebastian Stehle.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Headless content delivery$q$, $q$Teams manage structured content and serve it to websites and apps via API.$q$, $q$Developers building multi-channel digital products$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Self-hosted content infrastructure$q$, $q$Organizations that need to keep content infrastructure in-house deploy Squidex via Docker or Kubernetes.$q$, $q$Engineering teams with self-hosting requirements$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["MIT-licensed source code","Docker/Kubernetes deployment","REST and GraphQL APIs"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Squidex Cloud$q$, $q$Contact Squidex for pricing$q$, NULL, $q$["Managed hosting","Free trial available"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Squidex is an open-source, API-first headless CMS created by Sebastian Stehle and released under the MIT license. It's built on .NET Core and lets teams manage structured content and deliver it to websites, apps, and server applications via REST and GraphQL APIs.$q$, $q$The software can be self-hosted for free via Docker or native binaries, or run through Squidex's managed cloud offering (cloud.squidex.io) for teams that don't want to operate their own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Squidex fits development teams building multi-channel content experiences — websites, mobile apps, and other consumers of a content API — who want a self-hostable alternative to commercial headless CMS platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Superdesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Superdesk is an open-source, headless newsroom management system for creating, curating, and publishing news content.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (open source); managed Superdesk Lite from €250/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Prague, Czech Republic$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Superdesk is an open-source, headless newsroom CMS from Sourcefabric for news creation, editorial workflow, and multi-channel publishing.$q$,
  og_description = $q$Superdesk is an open-source, headless newsroom CMS from Sourcefabric for news creation, editorial workflow, and multi-channel publishing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '21706d7e-fb96-4cf7-b074-0ee12931d3ca' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Multi-source story building$q$, $q$Build stories from wire services, RSS, social media, and other inbound sources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Editorial workflow management$q$, $q$Configurable workflows, collaboration tools, and access controls for newsroom teams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Multi-channel publishing$q$, $q$Publish content to web, print, mobile, and social media from one system.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Content and document management$q$, $q$Metadata management, document classification, and version control for stories and assets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Headless architecture$q$, $q$Web-based, headless CMS design lets newsrooms decouple content management from delivery.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Full-text search and filtering$q$, $q$Search and filter across the content library.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Free, open-source core available to any newsroom$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Purpose-built editorial workflow for journalism, not a generic CMS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Scales from small newsrooms to large wire services$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Managed Superdesk Lite option for teams that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Managed hosting (Superdesk Lite) is a paid, subscription add-on$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Niche, newsroom-specific tool not suited to general website content management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Self-hosting requires operational capacity for a specialized headless CMS$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Is Superdesk free?$q$, $q$Yes, the open-source version of Superdesk is free to download and self-host. Sourcefabric also sells managed Superdesk Lite packages starting at €250/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Who develops Superdesk?$q$, $q$Superdesk is developed by Sourcefabric, a nonprofit media technology organization headquartered in Prague, Czech Republic.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Is Superdesk suitable for small newsrooms?$q$, $q$Yes, Sourcefabric offers Superdesk Lite for organizations with up to 25 users, alongside the option to self-host the free open-source version at any scale.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$What kind of content can Superdesk publish to?$q$, $q$Superdesk can publish to web, print, mobile, and social media, and can build stories from wire services, RSS, and social sources.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Newsroom editorial workflow$q$, $q$News organizations manage story creation, review, and publishing in one system.$q$, $q$News agencies and publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Multi-channel news distribution$q$, $q$Publishers distribute the same stories across web, print, mobile, and social.$q$, $q$Wire services and multi-platform newsrooms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Superdesk Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted headless newsroom CMS","Full editorial workflow tools"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$Superdesk Lite$q$, $q$From €250/month$q$, $q$monthly$q$, $q$["Up to 25 users","Fully featured Superdesk instance","Custom workflow setup","Online support and user training"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Superdesk is an open-source, headless content management system purpose-built for newsrooms, developed by Sourcefabric, a nonprofit media technology organization headquartered in Prague, Czech Republic. Sourcefabric itself was spun off in 2010 from the Media Development Investment Fund's Campware project.$q$, $q$Superdesk provides end-to-end tools for news creation, curation, and distribution: content and document management, configurable editorial workflows, multi-source story building (wire services, RSS, social media), and publishing to web, print, mobile, and social channels.$q$, $q$The open-source version is free to self-host. Sourcefabric also offers Superdesk Lite, a managed package for smaller newsrooms of up to 25 users, starting at €250/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Superdesk is built for news agencies and publishers, from small newsrooms to large wire services, that need editorial workflow and multi-channel publishing tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('21706d7e-fb96-4cf7-b074-0ee12931d3ca', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Textpattern ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Textpattern is a free, open-source PHP content management system known for its tag-based templating and lean codebase.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Textpattern is a free, open-source PHP CMS with a tag-based template language, built-in Textile support, and a lean codebase, since 2001.$q$,
  og_description = $q$Textpattern is a free, open-source PHP CMS with a tag-based template language, built-in Textile support, and a lean codebase, since 2001.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Tag-based template language$q$, $q$A dedicated templating syntax for structuring pages and manipulating content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Textile and Markdown formatting$q$, $q$Built-in Textile support, with Markdown available via plugin.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Plugin extensibility$q$, $q$Hundreds of community-built plugins extend core functionality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Lean, fast codebase$q$, $q$Minimal core designed for fast loading and efficient resource use.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Uncluttered admin interface$q$, $q$Administration panels designed to avoid unnecessary clutter and remain accessible.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Free and open source under GPL v2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Lightweight, fast-loading codebase$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Flexible tag-based templating for custom site structures$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Long-running project with over two decades of development$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Smaller plugin and theme ecosystem than WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Tag-based template syntax has a learning curve for newcomers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Less suited to complex, large-scale sites than heavier CMS platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Is Textpattern free?$q$, $q$Yes, Textpattern is completely free, open-source software under the GNU General Public License v2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$When was Textpattern created?$q$, $q$Dean Allen originally built it in 2001, and it was formally announced as Textpattern in 2003.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$What text formatting does Textpattern support?$q$, $q$Textpattern ships with built-in Textile support, and Markdown is available via plugin.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Is Textpattern actively developed?$q$, $q$Yes, development continues on GitHub under the Textpattern project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Personal and professional blogging$q$, $q$Writers publish blogs using Textpattern's lightweight editing and formatting tools.$q$, $q$Bloggers and writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Small to mid-size websites$q$, $q$Developers build lean, fast-loading sites using Textpattern's tag-based templates.$q$, $q$Freelance developers and small agencies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Textpattern originated in 2001 when Dean Allen built it to publish his personal site, and was formally announced as a CMS in 2003. It's free, open-source software licensed under the GNU General Public License v2.0, with development ongoing on GitHub.$q$, $q$The CMS is known for its tag-based template language, built-in Textile text-formatting support (plus Markdown via plugin), and a lean codebase aimed at fast page loads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Textpattern suits writers, bloggers, and developers who want a lightweight, uncluttered CMS with a flexible template language rather than a heavier, plugin-dependent platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Typemill ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source flat-file CMS that turns Markdown files into websites, documentation, and eBooks without a database.$q$,
  pricing_model = $q$Free (open source), with optional paid premium extensions$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Typemill is an open-source, self-hosted flat-file CMS for publishing Markdown documentation, manuals, and eBooks without a database.$q$,
  og_description = $q$Typemill is an open-source, self-hosted flat-file CMS for publishing Markdown documentation, manuals, and eBooks without a database.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '08338430-d0a4-4361-b6b5-4d22262c823c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '08338430-d0a4-4361-b6b5-4d22262c823c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Markdown block editor$q$, $q$Edit content in a structured block editor or switch to raw Markdown for full control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$eBook export$q$, $q$Generate PDF and EPUB files directly from the same Markdown content used for the website.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Flat-file storage$q$, $q$Content is stored as Markdown and YAML files rather than a database, simplifying backups and version control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Multi-project and multi-language$q$, $q$Run several documentation projects and language variants from a single installation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$REST API$q$, $q$Access and manage content programmatically through a built-in REST API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$AI provider integration$q$, $q$Connect Typemill to AI providers such as ChatGPT and Ollama for content assistance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Role-based user management$q$, $q$Configure granular permissions for editors, authors, and administrators.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$No database required, which simplifies hosting and backups$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Free and open source under the MIT license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Generates PDF/EPUB output alongside the website$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$REST API for programmatic content access$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Lightweight and fast to install via ZIP, GitHub, or Docker$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Flat-file architecture is less suited to very large, database-driven sites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Smaller plugin/theme ecosystem than mainstream CMS platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Some advanced features are only available as paid premium extensions$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Is Typemill free?$q$, $q$The core CMS is free and open source under the MIT license. Some premium extensions are sold separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Does Typemill use a database?$q$, $q$No. Content is stored as Markdown and YAML files on disk instead of a relational database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Can Typemill publish eBooks?$q$, $q$Yes, it can generate PDF and EPUB files from the same content used for the website.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$How is Typemill installed?$q$, $q$It can be installed via a ZIP download, from GitHub, or with Docker on an Apache or Nginx server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Technical documentation sites$q$, $q$Publish versioned, Markdown-based manuals and API docs without managing a database.$q$, $q$Software teams and technical writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Company handbooks and knowledge bases$q$, $q$Maintain internal reference material with role-based access control.$q$, $q$Operations and HR teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$eBook publishing$q$, $q$Write once in Markdown and export the same content as a website and as a PDF/EPUB.$q$, $q$Independent authors and small publishers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Typemill Core$q$, $q$Free$q$, $q$N/A$q$, $q$["Flat-file CMS","Markdown editor","PDF/EPUB export","REST API","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Typemill is a lightweight, MIT-licensed CMS built for teams who write in Markdown and need a structured way to publish it. Instead of a relational database, content lives as plain Markdown and YAML files, which makes projects easy to version, back up, and move between servers.$q$, $q$It ships with both a visual block editor and a raw Markdown editor, a media library, multi-project and multi-language support, and role-based user management. Beyond websites, Typemill can export the same content directly to PDF and EPUB, which is why it's frequently used for manuals and handbooks rather than general-purpose blogging.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Typemill is aimed at teams that maintain long-lived reference content: technical documentation, user manuals, internal handbooks, and knowledge bases. Because it's file-based and lightweight, it also suits developers who want a self-hosted, Git-friendly alternative to heavier CMS platforms for informational sites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Vvveb CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source PHP CMS with a drag-and-drop page builder, built-in ecommerce, and headless REST/GraphQL APIs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Vvveb CMS is a free, open-source PHP website builder with drag-and-drop editing, built-in ecommerce, and headless REST/GraphQL APIs.$q$,
  og_description = $q$Vvveb CMS is a free, open-source PHP website builder with drag-and-drop editing, built-in ecommerce, and headless REST/GraphQL APIs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '64642ef0-b3ed-44e3-9e65-2ef843fbfc7e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '64642ef0-b3ed-44e3-9e65-2ef843fbfc7e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Drag-and-drop page builder$q$, $q$Build and customize pages visually without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Built-in ecommerce$q$, $q$Sell products with an included store module rather than a separate plugin.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Headless REST and GraphQL APIs$q$, $q$Use Vvveb as a headless backend for custom frontends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Multi-site management$q$, $q$Run multiple websites from a single Vvveb installation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Multi-language and multi-currency$q$, $q$Publish content and sell products in several languages and currencies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Security hardening$q$, $q$Randomized admin paths, SQL injection protection, integrity checks, and 2FA.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Theme and plugin marketplace$q$, $q$Extend the CMS with community themes and plugins.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$No-code drag-and-drop builder plus headless API option$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Ecommerce included without extra plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Supports MySQL, SQLite, and PostgreSQL$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Built-in security hardening features$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Smaller community and ecosystem than WordPress or larger CMS platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$PHP-based, so it requires PHP hosting knowledge to self-manage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Theme/plugin marketplace is less extensive than mainstream competitors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Is Vvveb CMS free?$q$, $q$Yes, Vvveb is free and open source, with its code available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Can Vvveb be used as a headless CMS?$q$, $q$Yes, it exposes REST and GraphQL APIs so it can serve as a headless backend for custom frontends.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Does Vvveb support ecommerce?$q$, $q$Yes, it includes a built-in ecommerce module for selling products.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$What databases does Vvveb support?$q$, $q$MySQL, SQLite, and PostgreSQL.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$No-code website building$q$, $q$Build brochure sites and portfolios visually without touching code.$q$, $q$Bloggers and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Self-hosted online stores$q$, $q$Run an ecommerce storefront using the built-in store module.$q$, $q$Small online retailers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Headless content backend$q$, $q$Use the REST/GraphQL API to power a custom frontend or app.$q$, $q$Developers building custom sites$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$Vvveb CMS$q$, $q$Free$q$, $q$N/A$q$, $q$["Drag-and-drop builder","Ecommerce","REST/GraphQL APIs","Multi-site support","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Vvveb is a free, open-source PHP content management system that pairs a visual, WYSIWYG drag-and-drop page builder with an integrated ecommerce module. It supports MySQL, SQLite, and PostgreSQL, and can run in either a traditional server-rendered mode or as a headless backend via REST and GraphQL APIs.$q$, $q$The project emphasizes performance and security out of the box, with caching for fast page loads, randomized admin login paths, SQL injection protection, and two-factor authentication. It also includes multi-site management, letting a single installation power more than one website.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Vvveb targets bloggers, small businesses, and online retailers who want a self-hosted, no-code way to build and manage websites and stores, as well as developers who want a hybrid traditional/headless CMS they can self-host on standard PHP hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64642ef0-b3ed-44e3-9e65-2ef843fbfc7e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Wagtail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Python CMS built on Django, used by organizations like NASA and Mozilla for content-heavy websites.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Wagtail is a free, open-source Python CMS built on Django, offering StreamField editing, headless APIs, and enterprise-grade flexibility.$q$,
  og_description = $q$Wagtail is a free, open-source Python CMS built on Django, offering StreamField editing, headless APIs, and enterprise-grade flexibility.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eaf343b7-68ce-48ea-8f63-afd6f23421df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eaf343b7-68ce-48ea-8f63-afd6f23421df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$StreamField editor$q$, $q$Compose flexible page layouts from reusable, structured content blocks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Headless/API mode$q$, $q$Serve content to any frontend through Wagtail's API alongside traditional rendering.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Multi-language publishing$q$, $q$Manage translated content across locales via Wagtail Localize.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Content personalization$q$, $q$Deliver segmented content to different audiences.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Built on Django$q$, $q$Extend the CMS with any Python or Django package, model, or integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Role-based permissions$q$, $q$Control editorial workflows and access at a granular level.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Free, open source, with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Full power of Python/Django available for customization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Proven at enterprise scale with major institutional adopters$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Active development with 200+ contributors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Supports both traditional and headless delivery$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Requires Python/Django expertise to set up and extend$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Steeper learning curve than simpler flat-file or no-code CMS options$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Self-hosting requires managing your own infrastructure and updates$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Is Wagtail free?$q$, $q$Yes, Wagtail is free and open source with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$What is Wagtail built on?$q$, $q$It's built on Django, so any Python/Django code and packages can be used to extend it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Can Wagtail be used as a headless CMS?$q$, $q$Yes, it supports API-driven headless delivery in addition to traditional server-rendered pages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Who maintains Wagtail?$q$, $q$It's maintained by Torchbox with contributions from a large open-source community.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Enterprise and institutional websites$q$, $q$Run large, content-heavy sites with editorial workflows and personalization.$q$, $q$Government, education, and nonprofit organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Headless content delivery$q$, $q$Use Wagtail as an API-driven content source for custom frontends or apps.$q$, $q$Development teams building custom experiences$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Multi-language publishing$q$, $q$Manage and translate content across multiple locales.$q$, $q$Global organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$Wagtail$q$, $q$Free$q$, $q$N/A$q$, $q$["StreamField editor","API/headless mode","Multi-language support","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Wagtail is an open-source content management system built on Django, positioned as a leading Python CMS for organizations that need editorial flexibility combined with developer control. Its StreamField editor lets content teams compose flexible page layouts from reusable blocks, while developers can extend the system using standard Python and Django code.$q$, $q$Wagtail supports both traditional server-rendered sites and headless setups through its API, and offers multi-language publishing via Wagtail Localize and content personalization features. It is maintained by Torchbox with contributions from a large community of over 200 contributors, and is used by organizations including NASA, Google, the NHS, Mozilla, and MIT.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Wagtail suits organizations with in-house Python/Django development capacity that need an enterprise-grade CMS: government agencies, universities, nonprofits, cultural institutions, and larger companies that want full control over their content platform without licensing fees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eaf343b7-68ce-48ea-8f63-afd6f23421df', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── WinterCMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source CMS built on Laravel, forked from October CMS in 2021 to stay community-driven and open.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Winter CMS is a free, open-source Laravel CMS forked from October CMS in 2021, offering plugin extensibility and backwards compatibility.$q$,
  og_description = $q$Winter CMS is a free, open-source Laravel CMS forked from October CMS in 2021, offering plugin extensibility and backwards compatibility.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b894fce3-7970-4562-8f82-502c745c7472';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b894fce3-7970-4562-8f82-502c745c7472' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Laravel foundation$q$, $q$Built on the Laravel PHP framework, giving developers access to Laravel's ecosystem and conventions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Plugin and theme marketplace$q$, $q$Extend sites with community-built plugins and themes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Backwards compatibility$q$, $q$Maintains compatibility with existing October CMS projects and plugins.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Simple front-end development$q$, $q$Build pages primarily with HTML, CSS, and JavaScript.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Open source transparency$q$, $q$Full source code is public, with active issue resolution by maintainers.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Drop-in compatible with existing October CMS sites$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Built on the well-established Laravel framework$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Plugin/theme marketplace for extending functionality$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Community-driven governance after the October CMS split$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Smaller ecosystem than WordPress or Drupal$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Requires PHP/Laravel knowledge to develop and self-host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Paid support is only available through a third-party (Ring HQ), not the core team$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Is Winter CMS related to October CMS?$q$, $q$Yes, Winter CMS is a community fork created in 2021 by October CMS's former maintainers after October became a paid, closed product.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Is Winter CMS free?$q$, $q$Yes, it's free and open source under the MIT license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$What framework is Winter CMS built on?$q$, $q$It's built on the Laravel PHP framework.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Can I migrate an October CMS site to Winter CMS?$q$, $q$Winter CMS was designed to be backwards-compatible with existing October CMS projects and plugins.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Agency client websites$q$, $q$Build and maintain client sites on a stable, plugin-extensible Laravel CMS.$q$, $q$Web development agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Migrating from October CMS$q$, $q$Move existing October CMS projects to a free, open-source, community-governed alternative.$q$, $q$Former October CMS users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Custom Laravel applications$q$, $q$Extend a CMS foundation into more complex, application-like sites.$q$, $q$Laravel developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$Winter CMS$q$, $q$Free$q$, $q$N/A$q$, $q$["Core CMS","Plugin/theme marketplace","Self-hosted","MIT license"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Winter CMS is a free, open-source CMS built on the Laravel PHP framework. It was created in March 2021 when the former maintainers of October CMS forked the project after October's founders decided to make October CMS a closed, paid product, abandoning its open-source community. Winter CMS was built to remain fully compatible with existing October CMS sites while staying free and MIT-licensed.$q$, $q$The project focuses on speed, simplicity, backwards-compatible stability, and security through full source transparency. Developers can build sites with primarily HTML, CSS, and JavaScript, and extend functionality through a plugin and theme marketplace.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Winter CMS is aimed at developers and agencies who want a Laravel-based CMS with plugin/theme extensibility, ranging from small brochure sites to more complex applications, without the licensing costs or lock-in that other Laravel CMS products introduced.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b894fce3-7970-4562-8f82-502c745c7472', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── WonderCMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$The smallest flat-file CMS: a free, open-source website builder that runs on just five files with no database.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$WonderCMS is a free, open-source flat-file CMS that runs on five files with no database, offering inline editing and fast performance.$q$,
  og_description = $q$WonderCMS is a free, open-source flat-file CMS that runs on five files with no database, offering inline editing and fast performance.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd7da54f6-2b64-440b-9f41-a831adbd9e11';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd7da54f6-2b64-440b-9f41-a831adbd9e11' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Five-file installation$q$, $q$No database or configuration; unzip and upload to deploy a working site.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Inline WYSIWYG editing$q$, $q$Click directly on live page content to edit it.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$JSON-based data store$q$, $q$Content and settings are stored in flat JSON files instead of a database.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Plugin and theme system$q$, $q$Extend functionality and change appearance with community plugins and themes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Automatic backups$q$, $q$Built-in backup functionality protects site content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Brute-force login protection$q$, $q$Login security hardening is included by default.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Extremely lightweight and fast, with strong PageSpeed scores by default$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$No database or complex setup required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Free and open source since 2008$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$No ads, tracking, or attribution links$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$One-click updates$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Not suited to large, content-heavy, or highly dynamic sites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Smaller plugin ecosystem than mainstream CMS platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Flat-file storage can be harder to scale for high-traffic sites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Does WonderCMS need a database?$q$, $q$No, it uses a flat, JSON-based data store instead of a relational database.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Is WonderCMS free?$q$, $q$Yes, it's free and open source under the MIT license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$How is WonderCMS installed?$q$, $q$Unzip and upload five files to your server — no configuration step is required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Does WonderCMS support blogging?$q$, $q$Yes, it includes a blog mode alongside standard page publishing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Simple personal or small-business sites$q$, $q$Launch a fast, lightweight website without managing a database.$q$, $q$Individuals and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$Low-maintenance blogging$q$, $q$Run a blog with minimal ongoing administration.$q$, $q$Independent bloggers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$WonderCMS$q$, $q$Free$q$, $q$N/A$q$, $q$["Flat-file CMS","Inline editing","Plugins and themes","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$WonderCMS bills itself as the smallest flat-file CMS available, running on just five files with no database or configuration step required — you unzip and upload it to get a working site. Content is stored in a JSON-based data store rather than a relational database, keeping the footprint minimal and installations fast.$q$, $q$It offers inline WYSIWYG editing, where you click directly on page content to edit it, along with a theme system, a plugin architecture, brute-force login protection, automatic backups, and SEO-friendly URLs. The project has been free and open source (MIT licensed) since 2008, and ships without ads, tracking, or 'powered by' links.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$WonderCMS suits individuals and small businesses who want the simplest possible self-hosted website or blog — one that installs in minutes, loads fast, and doesn't require database administration or ongoing maintenance overhead.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7da54f6-2b64-440b-9f41-a831adbd9e11', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Corteza ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted low-code platform with CRM, case management, workflow automation, and access control.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Corteza is a free, open-source, self-hosted low-code platform offering CRM, case management, workflow automation, and API integration.$q$,
  og_description = $q$Corteza is a free, open-source, self-hosted low-code platform offering CRM, case management, workflow automation, and API integration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '925db15a-65f7-4d4f-bb9d-cd05222b869f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '925db15a-65f7-4d4f-bb9d-cd05222b869f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Low-code application building$q$, $q$Build custom business applications and workflows with minimal custom coding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$CRM and case management$q$, $q$Manage customer relationships and case workflows out of the box.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Fine-grained access control$q$, $q$Role-based and contextual permissions control who can see and do what.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Workflow automation$q$, $q$Automate processes such as email notifications and record handling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Integration Gateway$q$, $q$Connect external systems and APIs into Corteza workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Federation support$q$, $q$Synchronize data across multiple Corteza nodes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Free and open source, self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Combines CRM, case management, and low-code app building in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Fine-grained, role-based access control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Integration Gateway for connecting external systems$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Community-governed via the Commons Conservancy$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Requires self-hosting expertise (Docker or compiled binaries)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$SQLite in-memory storage is unsuitable for production; PostgreSQL or MySQL recommended$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Smaller community than mainstream CRM platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Is Corteza free?$q$, $q$Yes, Corteza is open-source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$What is Corteza used for?$q$, $q$It's a low-code platform used for CRM, case management, and building custom business applications.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$How is Corteza deployed?$q$, $q$It can be self-hosted using Docker or compiled binaries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Who maintains Corteza?$q$, $q$It was originally built by Crust Technology and donated to the Commons Conservancy in 2019 to keep it community-governed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Self-hosted CRM$q$, $q$Manage customer relationships and sales data on infrastructure you control.$q$, $q$Organizations with data sovereignty requirements$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Case management$q$, $q$Track and resolve cases or support tickets with configurable workflows.$q$, $q$Support and service teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Custom low-code applications$q$, $q$Build internal business applications without extensive custom development.$q$, $q$IT and operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$Corteza$q$, $q$Free$q$, $q$N/A$q$, $q$["Low-code platform","CRM module","Workflow automation","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Corteza is an open-source, self-hosted low-code platform originally released by Crust Technology in 2019 and donated to the Commons Conservancy the same year to keep it community-governed. It bundles CRM, case management, and general low-code application building into one platform, with a fine-grained, role-based access control system for defining permissions.$q$, $q$The platform includes workflow automation for building automated processes such as email workflows and record handling, an Integration Gateway for connecting external systems and APIs, and built-in reporting and data discovery tools. It can be self-hosted via Docker or compiled binaries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Corteza is aimed at organizations that want a self-hosted CRM and low-code application platform without vendor lock-in, particularly ones with data sovereignty or security requirements that make hosted CRM SaaS products unsuitable.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('925db15a-65f7-4d4f-bb9d-cd05222b869f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Django-CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source CRM built on Django Admin for managing leads, deals, contacts, tasks, and email campaigns.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Django-CRM is a free, open-source CRM built on Django Admin, offering lead/deal tracking, email campaigns, and a REST API.$q$,
  og_description = $q$Django-CRM is a free, open-source CRM built on Django Admin, offering lead/deal tracking, email campaigns, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cb776dbd-be66-4afc-b3df-cfd58e6b6dd3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cb776dbd-be66-4afc-b3df-cfd58e6b6dd3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Sales pipeline management$q$, $q$Define custom sales stages and track deals as they progress.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Lead capture$q$, $q$Capture leads automatically from web forms or by parsing incoming emails.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Task management$q$, $q$Create and assign tasks to team members for follow-up and collaboration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Email marketing and campaigns$q$, $q$Run email campaigns and keep communication history linked to CRM records.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$CRM analytics$q$, $q$Generate reports on the sales funnel and team performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$REST API$q$, $q$Programmatic access to CRM data with interactive Swagger documentation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Excel import/export$q$, $q$Bulk-handle companies, contacts, leads, and deals for migrations and backups.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Free and open source, no per-user licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Built on Django Admin, familiar to Python developers for customization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$REST API with Swagger docs for integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Available in over 20 languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Includes built-in email marketing and campaign tools$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Requires Python/Django knowledge to install, customize, and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Admin-framework-based UI is less polished than dedicated commercial CRM UIs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Self-hosting means you're responsible for updates and infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Is Django-CRM free?$q$, $q$Yes, it's free, open-source software with no license fees or per-user costs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$What is Django-CRM built on?$q$, $q$It's built entirely on the Django Admin framework.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Does Django-CRM have an API?$q$, $q$Yes, it includes REST API endpoints with interactive Swagger/OpenAPI documentation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Can I self-host Django-CRM?$q$, $q$Yes, it's designed to be deployed on your own server or cloud infrastructure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Sales pipeline tracking$q$, $q$Manage leads and deals through a customizable sales process.$q$, $q$Small and medium-sized sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Email marketing campaigns$q$, $q$Run and track email campaigns linked to CRM contacts.$q$, $q$Marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Custom CRM development$q$, $q$Extend or integrate the CRM using Django/Python skills already on the team.$q$, $q$Python/Django developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$Django-CRM$q$, $q$Free$q$, $q$N/A$q$, $q$["Lead and deal management","Email campaigns","REST API","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Django-CRM is a free, open-source customer relationship management system built directly on the Django Admin framework, so Python/Django developers can understand, customize, and extend it without learning a proprietary system. It handles the core CRM workflow — contacts, leads, and deals — alongside task management, sales pipeline stages, and analytics.$q$, $q$The project includes email integration and campaign tools, automatic and semi-automatic lead capture from web forms and incoming emails, Excel import/export for bulk data handling, and REST API endpoints with interactive Swagger documentation for programmatic access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Django-CRM is aimed at small and medium-sized businesses, and particularly Python/Django teams, who want a self-hosted CRM they can customize directly in code rather than through a vendor's proprietary configuration layer, without per-user licensing costs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb776dbd-be66-4afc-b3df-cfd58e6b6dd3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Adminer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free database management tool distributed as a single PHP file, supporting MySQL, PostgreSQL, SQLite, and more.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2007,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Japanese$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$Adminer is a free, open-source database management tool in a single PHP file, supporting MySQL, PostgreSQL, SQLite, and more.$q$,
  og_description = $q$Adminer is a free, open-source database management tool in a single PHP file, supporting MySQL, PostgreSQL, SQLite, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0e2f15fa-8304-4251-896f-4956273cb503';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0e2f15fa-8304-4251-896f-4956273cb503' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Single-file deployment$q$, $q$The entire tool is one PHP file, making it trivial to upload and run.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Multi-database support$q$, $q$Works with MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB, with plugin support for more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Schema and data editing$q$, $q$View and edit table structures, columns, indexes, foreign keys, views, triggers, and stored procedures.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$SQL command execution$q$, $q$Run custom SQL queries directly from the interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Data export$q$, $q$Export data and structure to SQL or CSV formats.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Relationship visualization$q$, $q$Display database schemas with visualized table relationships.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Free for commercial and non-commercial use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Single-file install makes deployment extremely simple$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Broad database engine support, extensible via plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Available in 46 languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Lighter and faster than phpMyAdmin for many workflows$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Interface is more minimal/utilitarian than modern GUI database clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Requires PHP 5.3+ with sessions enabled on the host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Some database types (MongoDB, Redis, Elasticsearch) need separate plugins$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Is Adminer free?$q$, $q$Yes, it's free for both commercial and non-commercial use under the Apache License or GPL 2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$What databases does Adminer support?$q$, $q$MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB natively, with plugins for others like MongoDB and Redis.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$How do I install Adminer?$q$, $q$Download the single PHP file and place it on any PHP-enabled web server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Is Adminer a replacement for phpMyAdmin?$q$, $q$It's often used as a lighter-weight alternative, with the same site claiming a tidier interface and better performance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Quick database administration$q$, $q$Browse, query, and edit databases without installing a full admin suite.$q$, $q$Developers and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Multi-engine environments$q$, $q$Manage several different database engines from one lightweight tool.$q$, $q$Teams running mixed database stacks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Data migration and export$q$, $q$Export data and schema to SQL or CSV for backups or migrations.$q$, $q$Database administrators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Adminer$q$, $q$Free$q$, $q$N/A$q$, $q$["Single-file PHP tool","Multi-database support","SQL/CSV export","Self-hosted"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adminer is a database management tool distributed as a single PHP file, created by Jakub Vrána starting in 2007 as a lighter-weight alternative to phpMyAdmin. Despite its minimal footprint, it supports a wide range of database engines, including MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB, with additional systems such as Elasticsearch, MongoDB, Redis, and ClickHouse available via plugins.$q$, $q$From its single-file interface, Adminer covers the operations most database administrators need day to day: browsing and editing table structures, indexes, and foreign keys; managing views, stored procedures, triggers, and events; running custom SQL; and exporting data to SQL or CSV. It's released under the Apache License or GPL 2, free for both commercial and non-commercial use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Adminer is built for developers and database administrators who want a fast, no-install database GUI they can drop onto a server as a single file, rather than deploying and maintaining a heavier admin application like phpMyAdmin.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Azimutt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Database exploration and ERD tool for documenting and navigating large, complex databases, with a free self-hosted option.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Azimutt is a database exploration and ERD tool for large, complex databases, with a free self-hosted option and paid team/enterprise plans.$q$,
  og_description = $q$Azimutt is a database exploration and ERD tool for large, complex databases, with a free self-hosted option and paid team/enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4b8c7210-2173-4e7a-95b0-7458564b09fd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Interactive schema visualization$q$, $q$Explore tables, columns, and relationships with customizable, incremental diagrams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$AML design language$q$, $q$A minimal DSL for quickly sketching or documenting database designs as code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Automated path finding$q$, $q$Discover relationships and join paths between tables automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Database linting$q$, $q$Rules that surface common schema and runtime mistakes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Multi-database and warehouse support$q$, $q$Connect to PostgreSQL, MySQL, MongoDB, Snowflake, BigQuery, and more.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Documentation and notes$q$, $q$Attach notes to tables and columns, and save layouts for later reference.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Self-hosted or cloud$q$, $q$Run Azimutt for free via Docker, or use the hosted app with paid tiers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Free self-hosted option under an MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Handles large, messy, real-world schemas well$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Broad database and data-warehouse connector support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$AML DSL enables quick schema documentation as code$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$No signup required to explore the free tier$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Free tier caps table count (10 tables in AML design) and saved projects (0)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$AI and collaboration features are gated behind paid Team plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Self-hosting requires running several services (Phoenix backend, Postgres, gateway)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Is Azimutt free?$q$, $q$Yes, there's a free tier with no signup for exploration, and self-hosting via Docker is free under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$What databases does Azimutt support?$q$, $q$PostgreSQL, MySQL, SQL Server, Oracle, MariaDB, SQLite, MongoDB, Couchbase, and cloud platforms like AWS RDS, Azure SQL, Google Cloud SQL, BigQuery, and Snowflake.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Can Azimutt be self-hosted?$q$, $q$Yes, the full application is open source and can be self-hosted for free via Docker.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$How much do paid Azimutt plans cost?$q$, $q$As of research, Solo is €7/month and Team is €35/user/month (billed annually), with custom Enterprise pricing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Onboarding to a new codebase$q$, $q$Quickly understand an unfamiliar or undocumented database schema.$q$, $q$New developers and consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Database documentation$q$, $q$Maintain living documentation of tables, columns, and relationships.$q$, $q$Database administrators and architects$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Microservice schema mapping$q$, $q$Trace relationships across fragmented, multi-service databases.$q$, $q$Platform and data engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Free$q$, $q$$0$q$, $q$N/A$q$, $q$["Schema and data exploration","Preview database analysis","1 user","Up to 10 tables in AML design"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Solo$q$, $q$€7/month$q$, $q$annual$q$, $q$["Unlimited table design","Custom colors","Schema export","3 saved projects"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Team$q$, $q$€35/user/month$q$, $q$annual$q$, $q$["Database analysis","Collaboration tools","AI features","Up to 5 users","10 projects"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Unlimited users/projects","SSO","API access","On-premise hosting","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Azimutt is an entity-relationship diagram and database exploration tool built for real-world databases that are large and messy rather than clean textbook schemas. It provides an interactive schema visualizer with incremental layout building, an AML domain-specific language for quickly sketching database designs, automated path-finding between tables, and database linting rules that flag common schema and runtime mistakes.$q$, $q$It connects to PostgreSQL, MySQL, SQL Server, Oracle, MariaDB, SQLite, MongoDB, Couchbase, and major cloud data warehouses such as AWS RDS/Aurora, Azure SQL, Google Cloud SQL, BigQuery, and Snowflake. The underlying application (Elixir/Phoenix backend, Elm/TypeScript frontend) is open source under the MIT license and can be self-hosted for free via Docker; hosted plans add collaboration, AI, and enterprise features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Azimutt is aimed at developers joining unfamiliar codebases, database administrators and architects, data analysts, and support/product teams who need to understand and document large or microservice-fragmented databases without deep prior knowledge of the schema.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bytebase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source database DevSecOps platform for change management, access control, and audit across database types.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Bytebase is an open-source database DevSecOps platform for change management, access control, and audit, with a free self-hosted edition.$q$,
  og_description = $q$Bytebase is an open-source database DevSecOps platform for change management, access control, and audit, with a free self-hosted edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Database change management$q$, $q$Plan, review, approve, and deploy schema changes through a structured workflow.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Access control$q$, $q$IAM-style policies, data masking, and just-in-time access exemptions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Immutable audit logs$q$, $q$Track every database change and access event for compliance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Multi-database support$q$, $q$Works across both OLTP and OLAP database types.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$GitOps integration$q$, $q$Integrates with GitOps tools, identity providers, ITSM, and SIEM platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Self-hosted or cloud deployment$q$, $q$Run the free Community edition self-hosted, or use hosted Pro/Enterprise plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Free, MIT-licensed Community edition that's fully self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Structured, reviewable workflow for database schema changes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Immutable audit logging for compliance requirements$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Broad integration support (GitOps, IdPs, ITSM, SIEM)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Backed by a dedicated team shipping regular releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Community edition caps at 20 users and 10 database instances$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Pro plan is cloud-only; self-hosted Enterprise requires a yearly commitment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Advanced compliance features (SCIM, custom roles, HA) are Enterprise-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Is Bytebase free?$q$, $q$Yes, the MIT-licensed Community edition is free to self-host, supporting up to 20 users and 10 database instances.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$How much does Bytebase Pro cost?$q$, $q$As of research, Pro is $20 per user per month, cloud-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Can Bytebase be self-hosted?$q$, $q$Yes, the Community edition and Enterprise edition both support self-hosted deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$What does Bytebase do?$q$, $q$It manages database schema change review/deployment, access control, and audit logging across multiple database types.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Database change review$q$, $q$Route schema changes through approval workflows instead of direct production access.$q$, $q$Engineering and DBA teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Compliance and audit$q$, $q$Maintain immutable logs of who changed or accessed what data, and when.$q$, $q$Security and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Fine-grained database access control$q$, $q$Apply IAM policies and data masking across environments.$q$, $q$Platform engineering teams in regulated industries$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Community$q$, $q$Free$q$, $q$N/A$q$, $q$["Up to 20 users","10 database instances","Change management","Self-hosted","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Pro$q$, $q$$20/user/month$q$, $q$monthly$q$, $q$["Unlimited users","10 database instances","Google/GitHub SSO","Email support","7-day audit log retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Unlimited users and instances","OAuth2/OIDC/LDAP SSO","Unlimited audit log retention","Custom approval workflows","SLA support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bytebase is a database DevSecOps platform, built by former tech leads from Google Cloud SQL and Google's API infrastructure, that unifies how teams plan, review, and deploy database schema changes. It replaces manual scripts and ad-hoc processes with a structured change-management workflow, similar to how GitHub or GitLab manage code review for application code.$q$, $q$Beyond change management, Bytebase provides database access control with IAM-style policies, data masking, and just-in-time access exemptions, plus immutable audit logs for compliance visibility. It follows an open-core model: the MIT-licensed Community edition is free and self-hosted, supporting up to 20 users and 10 database instances, while Pro and Enterprise tiers add SSO, unlimited users, and advanced compliance features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Bytebase serves engineering, DBA, security, and compliance teams — particularly in regulated or larger organizations across financial services, technology, and gaming — that need controlled, auditable database change processes rather than direct production access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4cb53b3b-4fcf-4555-b0b5-3f0bbbd4d8a4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chartbrew ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source dashboard platform for connecting databases, APIs, and analytics tools into live KPI charts.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Chartbrew is an open-source dashboard tool that connects databases and APIs into live, shareable KPI charts. Free to self-host or use hosted.$q$,
  og_description = $q$Chartbrew is an open-source dashboard tool that connects databases and APIs into live, shareable KPI charts. Free to self-host or use hosted.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e940e3d2-e870-4b3e-819f-28d10c4d7db4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e940e3d2-e870-4b3e-819f-28d10c4d7db4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Multi-source connections$q$, $q$Connect PostgreSQL, MongoDB, MySQL, Stripe, Google Analytics, Firestore, Supabase, Airtable, and more as data sources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Reusable datasets$q$, $q$Build a dataset once and reuse it across multiple charts and dashboards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$AI-assisted queries$q$, $q$Built-in AI assistant to help write SQL and build queries for exploring connected data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Automated refresh and alerts$q$, $q$Schedule data refreshes, send dashboard snapshots, and trigger alerts through Slack, email, or webhooks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Flexible sharing$q$, $q$Share dashboards internally, embed charts in products, or grant controlled client access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Self-hosting$q$, $q$Deploy Chartbrew on your own infrastructure using the open-source project for complete data control.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Open-source with a free self-hosted option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Connects to a wide range of databases and business tools out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Dashboard sharing and embedding built in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Automated alerts reduce manual monitoring$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Hosted cloud plans add up quickly for larger teams (Professional plan is $249/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$AI features are metered by monthly credits on paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Self-hosting requires Docker and ongoing maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Is Chartbrew free?$q$, $q$Yes, the core Chartbrew project is open source and can be self-hosted for free. Chartbrew also offers a hosted cloud version with paid plans starting at $24/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Can Chartbrew connect to my database directly?$q$, $q$Yes, Chartbrew supports direct connections to PostgreSQL, MySQL, and MongoDB, along with API-based connections to services like Stripe and Google Analytics.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Does Chartbrew support team collaboration?$q$, $q$Yes, paid plans include multiple team members, with limits ranging from 3 members on the Starter plan to unlimited members on the Professional plan.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Client reporting for agencies$q$, $q$Agencies build client-facing dashboards pulling from ad platforms and databases to report campaign or project metrics.$q$, $q$Agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$SaaS product metrics$q$, $q$Product teams connect Stripe and their app database to track revenue, churn, and usage in one dashboard.$q$, $q$SaaS teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Self-hosted (open source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full dashboard and charting functionality","Unlimited dashboards on your own infrastructure","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Starter$q$, $q$$24/month$q$, $q$monthly ($290/year billed annually)$q$, $q$["10 dashboards","30 charts per dashboard","3 team members","500 data sources","2k monthly AI credits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Growth$q$, $q$$66/month$q$, $q$monthly ($790/year billed annually)$q$, $q$["100 dashboards","60 charts per dashboard","10 team members","Unlimited data sources","10k monthly AI credits"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Professional$q$, $q$$249/month$q$, $q$monthly ($2,990/year billed annually)$q$, $q$["500 dashboards","80 charts per dashboard","Unlimited team members","Unlimited client accounts","50k monthly AI credits"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Unlimited accounts, dashboards, and charts","Custom integrations","Priority support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Chartbrew is an open-source dashboard tool that connects to databases (PostgreSQL, MySQL, MongoDB), APIs, and services like Stripe, Google Analytics, Firestore, Supabase, and Airtable to turn raw data into charts and dashboards.$q$, $q$It is built and maintained by Depomo Ltd, a UK-based team, and is available both as a hosted cloud product and as a self-hosted deployment via Docker for teams that want full control over their data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Chartbrew targets product teams, SaaS companies, and agencies that need shareable, live KPI dashboards without setting up a full business intelligence stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e940e3d2-e870-4b3e-819f-28d10c4d7db4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ChartDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source database schema visualization tool that turns SQL databases into interactive ER diagrams instantly.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ChartDB turns SQL databases into ER diagrams in seconds. Free open-source self-hosted tool with optional paid cloud plans for teams.$q$,
  og_description = $q$ChartDB turns SQL databases into ER diagrams in seconds. Free open-source self-hosted tool with optional paid cloud plans for teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d81dd7e-c136-40e4-8989-d72a34c9daf3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d81dd7e-c136-40e4-8989-d72a34c9daf3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Instant schema import$q$, $q$Generate a full ER diagram from a live database in seconds using a single read-only query.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Broad database support$q$, $q$Works with PostgreSQL, MySQL, MariaDB, SQL Server, SQLite, ClickHouse, CockroachDB, Oracle, Snowflake, and BigQuery.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$AI-assisted diagramming$q$, $q$Generate or adjust ER diagrams from natural-language prompts using the built-in AI assistant (paid tiers).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$SQL export$q$, $q$Export the visualized schema as SQL in multiple database dialects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Real-time collaboration$q$, $q$Multiple team members can view and edit the same diagram together on Teams plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Version history$q$, $q$Track schema changes over time with change logs and versioning on paid plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Free, open-source self-hosted version with no artificial limits on the core diagramming feature$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Supports a wide range of relational and cloud data warehouses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Very fast schema import compared to manually drawing ER diagrams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$SQL export makes diagrams actionable, not just visual$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Free cloud plan is limited to 1 database and 10 tables$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Real-time collaboration and AI assistant require paid Teams plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Advanced features like SSO and audit logs require custom/enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Is ChartDB free?$q$, $q$Yes, ChartDB has a free self-hosted open-source version and a free cloud tier limited to 1 database with up to 10 tables. Paid Pro and Teams plans remove those limits and add collaboration features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Does ChartDB need direct access to my database?$q$, $q$No persistent access is required; ChartDB imports the schema with a single query and does not need a standing connection to generate the diagram.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Can I export the diagram as SQL?$q$, $q$Yes, ChartDB can export the visualized schema as SQL in multiple database dialects.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Onboarding to an unfamiliar database$q$, $q$Engineers new to a codebase generate an ER diagram to quickly understand table relationships.$q$, $q$Software engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Documenting schema for a team$q$, $q$Database architects embed diagrams in internal documentation and keep them synced with schema changes.$q$, $q$Database architects$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Free$q$, $q$$0$q$, $q$N/A$q$, $q$["1 user","1 database","Up to 10 tables per database","Self-hosted or cloud deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Pro$q$, $q$$25/month$q$, $q$monthly or annual (up to 40% discount annually)$q$, $q$["Up to 100 tables per database","DBML editor and schema export","Sticky notes","3-day email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Teams$q$, $q$$59/month$q$, $q$monthly or annual (up to 40% discount annually)$q$, $q$["Up to 3 users, 5 databases","Up to 200 tables per database","Real-time collaboration","Basic AI assistant","Auto-sync and migration tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$Custom$q$, $q$Custom$q$, $q$custom$q$, $q$["SAML SSO","User activity logs","Role-based access control","Procurement and legal review support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ChartDB is a database schema visualization and data-modeling tool that generates entity-relationship (ER) diagrams from a database with a single query, without requiring persistent database access.$q$, $q$It supports PostgreSQL, MySQL, MariaDB, SQL Server, SQLite, ClickHouse, CockroachDB, Oracle, Snowflake, and BigQuery, and is available as free self-hosted open-source software or as a hosted cloud product with paid tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ChartDB is aimed at engineering teams, database architects, and technical leads who need to document, understand, or communicate the structure of complex or unfamiliar databases.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d81dd7e-c136-40e4-8989-d72a34c9daf3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── CloudBeaver ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Web-based database manager from the DBeaver team, letting teams browse and query databases from a browser.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CloudBeaver is a free, open-source, self-hosted web SQL client from the DBeaver team, with a paid Enterprise edition for team access controls.$q$,
  og_description = $q$CloudBeaver is a free, open-source, self-hosted web SQL client from the DBeaver team, with a paid Enterprise edition for team access controls.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d9c68d3-f61e-4d38-95a1-0fda3d821068' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Browser-based SQL client$q$, $q$Query and manage databases entirely from a web browser, with no desktop installation required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Broad database support$q$, $q$Connects to 100+ SQL, NoSQL, and cloud database types, inherited from the DBeaver engine.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Self-hosted deployment$q$, $q$Runs as a self-hosted web server via Docker Compose, deployable on-premises or in the cloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Enterprise authentication$q$, $q$Enterprise edition adds SSO (AWS, GCP, Okta), Kerberos, and multi-factor authentication for secure team access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Team access management$q$, $q$Centralized administration of who can access which database connections.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Free, open-source Community Edition available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$No desktop client installation needed for end users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Supports the same broad range of databases as desktop DBeaver$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Self-hosted, so data stays on your own infrastructure$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Community Edition has fewer features than the desktop DBeaver client$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Enterprise features like SSO and MFA require a paid license ($205/user/year)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Requires running and maintaining a Docker-based server$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Is CloudBeaver free?$q$, $q$Yes, CloudBeaver Community Edition is free and open source under the Apache 2.0 license. A paid Enterprise edition with added security features costs $205 per user per year.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Do I need to install anything to use CloudBeaver?$q$, $q$End users only need a web browser. The CloudBeaver server itself must be deployed by an administrator, typically via Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$How is CloudBeaver different from DBeaver?$q$, $q$DBeaver is a desktop application installed on each user's machine; CloudBeaver is a self-hosted web server that provides browser-based database access for a team.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Shared team database access$q$, $q$Organizations deploy CloudBeaver so analysts and developers can query databases from any browser without local installs.$q$, $q$Data and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Secure enterprise database access$q$, $q$Enterprises use CloudBeaver Enterprise with SSO and MFA to control and audit who can access production databases.$q$, $q$IT and security teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted web-based SQL client","Support for 100+ database types","Apache 2.0 open-source license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$Enterprise Edition$q$, $q$$205/user/year$q$, $q$annual$q$, $q$["SSO (AWS SSO, GCP SSO, Okta)","Kerberos authentication","Multi-factor authentication","Advanced access management"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CloudBeaver is a lightweight, browser-based database management tool built on the DBeaver platform. It brings a subset of DBeaver's SQL client capabilities to a web interface so teams can browse, query, and manage databases without installing desktop software.$q$, $q$The Community Edition is free and open source under the Apache 2.0 license, self-hosted via Docker. DBeaver Corporation also sells a CloudBeaver Enterprise edition with SSO (AWS SSO, GCP SSO, Okta), Kerberos, and multi-factor authentication for organizations, priced at $205 per user per year.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CloudBeaver suits teams that want shared, browser-accessible database access without distributing desktop installs — from individual developers running it locally to organizations that need centralized, access-controlled database management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d9c68d3-f61e-4d38-95a1-0fda3d821068', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── d9 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source data platform forked from Directus 9, generating REST and GraphQL APIs from any SQL database.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$d9 is a free, open-source data platform forked from Directus 9 that generates REST and GraphQL APIs from any SQL database, GPLv3 licensed.$q$,
  og_description = $q$d9 is a free, open-source data platform forked from Directus 9 that generates REST and GraphQL APIs from any SQL database, GPLv3 licensed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b2320603-ad1f-48d1-a744-9445e8269225';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b2320603-ad1f-48d1-a744-9445e8269225' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Auto-generated REST & GraphQL API$q$, $q$Instantly exposes a Node.js REST and GraphQL API layer on top of any connected SQL database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Multi-database support$q$, $q$Works with PostgreSQL, MySQL, SQLite, OracleDB, CockroachDB, MariaDB, and MS-SQL.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$No-code admin interface$q$, $q$Non-technical users can manage data and content through a visual admin panel with role-based permissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Directus 9 compatibility$q$, $q$Uses the same database schema as Directus 9 for drop-in migration from existing Directus 9 projects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Extensible architecture$q$, $q$Modular design supports custom extensions for developers who need to add functionality.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$No vendor lock-in$q$, $q$Direct SQL database access means the platform can be removed at any time without losing data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Completely free and open source under GPLv3, with no premium feature gates$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Drop-in compatible with existing Directus 9 databases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Supports both a no-code interface and a full developer API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$No artificial limits on users, roles, or records$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Maintained by a small independent team rather than a funded company$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Based on the older Directus 9 codebase, so it lacks newer Directus features from later major versions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Self-hosting requires the team to manage infrastructure and updates themselves$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Is d9 the same as Directus?$q$, $q$d9 is an independently maintained open-source fork of Directus 9, created after later Directus versions adopted a premium licensing model. It uses the same database schema as Directus 9.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Is d9 free to use?$q$, $q$Yes, d9 is completely free and open source under the GPLv3 license, with no paid tiers or feature gates.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Can I migrate an existing Directus 9 project to d9?$q$, $q$Yes, because d9 uses the same database schema as Directus 9, existing projects can generally be migrated as a drop-in replacement.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Headless CMS / backend for apps$q$, $q$Developers use d9 to instantly generate REST and GraphQL APIs from an existing SQL database for web or mobile apps.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$Staying on open-source Directus$q$, $q$Teams that adopted Directus 9 use d9 to keep a fully open-source stack instead of upgrading to a paid Directus tier.$q$, $q$Existing Directus 9 users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$d9 is an open-source data platform maintained by La Webcapsule as a continuation of Directus 9, kept GPLv3 licensed after later Directus versions moved to a premium open-source model. It layers REST and GraphQL APIs on top of any SQL database.$q$, $q$d9 shares the same database schema as Directus 9, so existing Directus 9 projects can adopt it as a drop-in replacement without a data migration, while retaining a no-code admin interface, file asset management, and granular permissions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$d9 is built for developers and teams who were using Directus 9 and want to keep a fully open-source, self-hosted data platform without moving to a paid licensing tier, as well as anyone who wants a no-code layer over an existing SQL database.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2320603-ad1f-48d1-a744-9445e8269225', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Databunker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted secure vault that tokenizes and encrypts PII, PHI, and payment data for compliance.$q$,
  pricing_model = $q$Free (open source), with optional paid Pro support$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Databunker is an open-source, self-hosted vault that tokenizes and encrypts PII, PHI, and payment data to support privacy compliance.$q$,
  og_description = $q$Databunker is an open-source, self-hosted vault that tokenizes and encrypts PII, PHI, and payment data to support privacy compliance.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd09c518a-e080-4d5d-83f0-8565089486cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd09c518a-e080-4d5d-83f0-8565089486cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Tokenization engine$q$, $q$Replaces sensitive fields with random tokens so application databases never store raw PII directly.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Encrypted PII vault$q$, $q$Stores encrypted personal records, payment data, and sensitive files with access-controlled retrieval.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Fuzzy search$q$, $q$Search encrypted records by approximate matches, such as misspelled names.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Record versioning and audit logs$q$, $q$Tracks changes to records and logs access for compliance and audit purposes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Key rotation and BYOK$q$, $q$Supports bring-your-own-key encryption with AWS KMS, Azure Key Vault, and HashiCorp Vault.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Multi-tenancy$q$, $q$Database-enforced tenant isolation for platforms serving multiple customers or business units.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Free, open-source core under the permissive MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Self-hosted via Docker Compose, Kubernetes, or OpenShift for full data control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Purpose-built for GDPR-style compliance workflows like DSARs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Handles large-scale production use (reported 20M+ records)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Requires engineering effort to integrate into existing applications$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Advanced support and implementation help are paid, separate from the free core$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Smaller community than general-purpose database or security tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Is Databunker free?$q$, $q$Yes, the core Databunker project is free and open source under the MIT license and can be self-hosted at no cost. A paid Pro edition and implementation support package are also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$What kind of data does Databunker protect?$q$, $q$Databunker is designed to store and tokenize PII, PHI, payment data (PCI), and KYC records, keeping raw sensitive data out of application databases.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Can Databunker help with GDPR requests?$q$, $q$Yes, it includes features aimed at fulfilling Data Subject Access Requests (DSARs) and supporting broader GDPR, SOC 2, and ISO 27001 compliance efforts.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Centralizing PII storage$q$, $q$Engineering teams route sensitive user fields through Databunker so application databases only ever see tokens.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$GDPR/DSAR compliance$q$, $q$Privacy teams use Databunker's audit trails and access controls to respond to data subject access requests.$q$, $q$Compliance and security teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Open source (self-hosted)$q$, $q$Free$q$, $q$N/A$q$, $q$["Encrypted PII/PHI vault","Tokenization engine","Fuzzy search","Audit logging","MIT license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$Data & File Lockdown Sprint$q$, $q$Custom$q$, $q$4-week engagement$q$, $q$["Databunker Pro software","40 hours of senior engineering support","Implementation assistance"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Databunker is a Go-based, self-hosted secure vault for storing and tokenizing personally identifiable information (PII), protected health information (PHI), payment data, and other sensitive records. Application databases store safe random tokens instead of raw sensitive data.$q$, $q$The core project, maintained by Security Bunker, is free and open source under the MIT license. The company also offers a paid Pro edition and a bundled 'Data & File Lockdown Sprint' engagement combining software with implementation support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Databunker is aimed at engineering and security teams — from early-stage startups to larger enterprises — that need to centralize PII handling, reduce breach exposure, and support compliance work such as GDPR data subject access requests.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d09c518a-e080-4d5d-83f0-8565089486cf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Datasette ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source tool by Simon Willison for exploring, querying, and publishing data as interactive websites and APIs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Datasette is a free, open-source tool by Simon Willison that turns CSV, JSON, or SQLite data into browsable websites with a built-in JSON API.$q$,
  og_description = $q$Datasette is a free, open-source tool by Simon Willison that turns CSV, JSON, or SQLite data into browsable websites with a built-in JSON API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd9436d03-14e1-4e93-969b-27951c8697e7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd9436d03-14e1-4e93-969b-27951c8697e7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Instant data exploration$q$, $q$Import CSV, JSON, or SQLite data and immediately browse, filter, and query it through a web UI.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Automatic JSON API$q$, $q$Every table and query is automatically exposed as a JSON API endpoint, with no backend code required.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$One-command publishing$q$, $q$The `datasette publish` command deploys a dataset directly to Google Cloud Run, Heroku, or Vercel.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Stored queries$q$, $q$Save and share custom SQL queries as bookmarkable pages within the published site.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Plugin ecosystem$q$, $q$Over 100 plugins extend Datasette with features like authentication, geospatial support, and visualization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Row editing$q$, $q$Optional write support allows editing rows directly through the interface for permitted users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Completely free and open source (Apache 2.0 license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Extremely fast way to turn a dataset into a public, queryable website$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Large plugin ecosystem for extending functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Backed by an active, well-known maintainer and community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Best suited to SQLite-based datasets rather than large live production databases$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Requires familiarity with SQL to get the most out of custom queries$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$No official managed hosting; publishing relies on third-party cloud platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Is Datasette free?$q$, $q$Yes, Datasette is completely free and open source under the Apache 2.0 license with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Who created Datasette?$q$, $q$Datasette was created by Simon Willison and is maintained as an active open-source project with a wider ecosystem of plugins and companion tools.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Can I publish a dataset publicly with Datasette?$q$, $q$Yes, the `datasette publish` command can deploy a dataset directly to services like Google Cloud Run, Heroku, or Vercel as a public website and API.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Publishing public datasets$q$, $q$Journalists and government agencies publish CSV or database exports as searchable, linkable websites.$q$, $q$Data journalists, local governments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$Rapid API prototyping$q$, $q$Developers spin up a queryable JSON API over a dataset without writing backend code.$q$, $q$Developers, researchers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Datasette is an open-source tool for exploring and publishing data. It takes data from CSVs, JSON files, or SQLite databases and turns it into a browsable website with a built-in JSON API, letting anyone query, filter, and share findings without writing backend code.$q$, $q$Created by Simon Willison, Datasette is released under the Apache 2.0 license and can be self-hosted or published to platforms like Google Cloud Run, Heroku, or Vercel using the built-in `datasette publish` command. It has grown into an ecosystem of dozens of companion tools and over a hundred plugins.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Datasette is popular with data journalists, researchers, museums, archivists, and local governments who need to publish structured datasets publicly, as well as developers who want a fast JSON API over a dataset without building custom backend infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d9436d03-14e1-4e93-969b-27951c8697e7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Limbas ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, PHP-based low-code database framework for building custom business applications with drag-and-drop tools.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Limbas is a free, open-source, low-code database framework for building custom business applications with drag-and-drop tools.$q$,
  og_description = $q$Limbas is a free, open-source, low-code database framework for building custom business applications with drag-and-drop tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a77d14f1-cb26-4d11-9d26-6fc0a6e26e61';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a77d14f1-cb26-4d11-9d26-6fc0a6e26e61' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Drag-and-drop table design$q$, $q$Generate and link database tables and fields visually instead of writing SQL schema by hand.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Form and report generator$q$, $q$Build data entry forms and reports through a visual designer.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Graphical query builder$q$, $q$Construct database queries without writing raw SQL.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Workflow engine$q$, $q$Define business process workflows on top of stored data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Built-in document management$q$, $q$Includes basic DMS functionality alongside the core database tooling.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Granular rights management$q$, $q$Assign permissions flexibly by table, field, and record through user and group management.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Free and open source under GPL v2.0 with no license fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Supports multiple relational database backends$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Low-code approach speeds up building internal business apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Includes workflow and document management beyond basic CRUD$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Smaller community and ecosystem compared to mainstream low-code platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$PHP-based architecture may feel dated compared to newer no-code tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Limited English-language documentation and support outside German-speaking markets$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Is Limbas free?$q$, $q$Yes, the Limbas framework is licensed under GNU GPL v2.0 and is free to use with no license fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$What databases does Limbas support?$q$, $q$Limbas can work with PostgreSQL, MySQL, MS SQL Server, SAP MaxDB, and SAP Hana DB, among others.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Does Limbas require coding?$q$, $q$Limbas is a low-code framework — tables, forms, reports, and queries can be built through drag-and-drop tools, though custom logic may still require development.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Internal business applications$q$, $q$Organizations build custom record-management or workflow apps on Limbas instead of using spreadsheets.$q$, $q$Internal IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$Lightweight document management$q$, $q$Teams use Limbas's built-in DMS features alongside its database tooling to manage business documents.$q$, $q$Small and mid-size organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Limbas is an open-source, low-code database framework for building database-driven business applications. It provides drag-and-drop tools for generating tables, forms, reports, and queries without hand-coding a full application.$q$, $q$The Limbas framework is licensed under the GNU GPL v2.0, with no license fees for the core software. It can work with multiple database backends including PostgreSQL, MySQL, MS SQL Server, SAP MaxDB, and Hana DB, and includes flexible group- and user-level permissions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Limbas is aimed at organizations and developers who want to build internal business applications — such as workflow tools, record management, or simple document management systems — on top of a relational database without starting from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a77d14f1-cb26-4d11-9d26-6fc0a6e26e61', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AdGuard Home ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source network-wide DNS server that blocks ads and trackers for every device on your network.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AdGuard Home is a free, open-source, self-hosted DNS server that blocks ads and trackers for every device on your home network.$q$,
  og_description = $q$AdGuard Home is a free, open-source, self-hosted DNS server that blocks ads and trackers for every device on your home network.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Network-wide ad and tracker blocking$q$, $q$Blocks ads and tracking domains at the DNS level for all connected devices, not just browsers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Parental controls$q$, $q$Enforce Safe Search and content filtering for children's devices across the network.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Custom filter lists$q$, $q$Use community ad-block filter lists or create custom blocking rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$IoT protection$q$, $q$Protects smart-home and IoT devices that don't support individual ad blockers or VPN clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Network activity dashboard$q$, $q$View query logs and statistics on DNS activity across the network.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Multi-platform deployment$q$, $q$Runs on Windows, macOS, Linux, Raspberry Pi, Docker, and OpenWrt routers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Blocks ads for every device on the network, including IoT devices$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Runs on inexpensive hardware like a Raspberry Pi$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Includes parental control and Safe Search enforcement$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$DNS-level blocking can miss ads embedded within apps that bypass system DNS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Requires some networking knowledge to configure as the network's DNS resolver$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Self-hosted, so uptime and updates are the user's responsibility$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Is AdGuard Home free?$q$, $q$Yes, AdGuard Home is free, open-source, self-hosted software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$What platforms does AdGuard Home run on?$q$, $q$AdGuard Home runs on Windows, macOS, and Linux, including Raspberry Pi, and is also available via Docker, OpenWrt, and Home Assistant.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$How is AdGuard Home different from browser ad blockers?$q$, $q$AdGuard Home blocks ads and trackers at the DNS level for every device on the network, whereas browser extensions only block ads within that one browser.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Whole-home ad blocking$q$, $q$Households run AdGuard Home on a Raspberry Pi or home server to block ads across all devices at once.$q$, $q$Home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Protecting IoT and smart-home devices$q$, $q$Self-hosters use AdGuard Home to filter DNS traffic from smart TVs and IoT gadgets that can't run their own ad blockers.$q$, $q$Self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AdGuard Home is a network-wide DNS server that blocks ads, trackers, and malicious domains for every device on a network, without needing per-device apps or browser extensions. It's built and maintained by AdGuard.$q$, $q$It is self-hosted software, deployable on Windows, macOS, Linux, and Raspberry Pi, with official Docker images, an OpenWrt LuCI app, and a Home Assistant add-on, giving it broad options for running on home routers, NAS devices, and small servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AdGuard Home is aimed at home users and self-hosters who want to block ads and trackers across every device on their network at once — including IoT devices and smart TVs that can't run individual ad-blocking apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── blocky ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source DNS proxy and ad-blocker written in Go, with allowlisting, caching, and DoH/DoT support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$blocky is a free, open-source DNS proxy and ad-blocker written in Go, with allowlisting, caching, and encrypted DNS protocol support.$q$,
  og_description = $q$blocky is a free, open-source DNS proxy and ad-blocker written in Go, with allowlisting, caching, and encrypted DNS protocol support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '68da8924-7233-4187-b3c7-8e5486ea5ee0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '68da8924-7233-4187-b3c7-8e5486ea5ee0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Ad and malware blocking$q$, $q$Blocks DNS queries using external block lists with regex support and per-client-group allowlisting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Modern DNS protocol support$q$, $q$Handles DNS over UDP/TCP, DNS-over-HTTPS (DoH), DNS-over-TLS (DoT), DoQ, and DoH3.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$DNS caching and prefetching$q$, $q$Caches responses and prefetches popular domains to speed up DNS resolution.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Conditional forwarding$q$, $q$Routes queries for specific domains to different upstream resolvers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$DNSSEC validation$q$, $q$Validates DNS responses using DNSSEC for added security.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$REST API and Prometheus metrics$q$, $q$Exposes a REST API (with Swagger docs) to control blocking status, plus a Prometheus metrics endpoint for monitoring.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Completely free, open source, with explicitly no telemetry$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Single-binary deployment makes it easy to run on low-power hardware$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Supports modern encrypted DNS protocols (DoH, DoT, DoQ, DoH3)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$REST API and Prometheus metrics support monitoring and automation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Configuration is file/YAML-based, which is less approachable than a GUI-first tool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Maintained as a spare-time project by an individual developer rather than a company$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$No built-in web dashboard as polished as some competing DNS blockers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Is blocky free?$q$, $q$Yes, blocky is free and open source, developed with no telemetry or data collection.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Does blocky support encrypted DNS?$q$, $q$Yes, blocky supports DNS over UDP/TCP as well as encrypted protocols including DoH, DoT, DoQ, and DoH3.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Can I monitor blocky with Prometheus?$q$, $q$Yes, blocky can export metrics for Prometheus and includes an example Grafana dashboard definition.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Homelab DNS-level blocking$q$, $q$Self-hosters run blocky as their network's DNS resolver to block ads and malware for all devices.$q$, $q$Homelab users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$Router-based ad blocking$q$, $q$Users deploy blocky directly on OpenWrt routers or Raspberry Pi for whole-network filtering.$q$, $q$Network administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$blocky is a fast, lightweight DNS proxy and ad-blocker written in Go, designed to block ads and malware domains for a local network while also improving DNS performance through caching and prefetching.$q$, $q$It is developed as a spare-time open-source project with no telemetry or data collection, and is distributed as a single binary or Docker image, making it easy to run on hardware like Raspberry Pi or OpenWrt routers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$blocky is built for network administrators, homelab users, and privacy-conscious households who want fine-grained control over DNS-level blocking and forwarding, including per-client-group policies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('68da8924-7233-4187-b3c7-8e5486ea5ee0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Maza ad blocking ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source local ad blocker for macOS and Linux that runs natively on your device, no server required.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Maza is a free, open-source local ad blocker for macOS and Linux that runs natively on your device without a separate server.$q$,
  og_description = $q$Maza is a free, open-source local ad blocker for macOS and Linux that runs natively on your device without a separate server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff61bcc5-91e7-4059-9a0b-4ca89539d8cb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff61bcc5-91e7-4059-9a0b-4ca89539d8cb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Native local ad blocking$q$, $q$Blocks ads directly on your macOS or Linux machine rather than through a separate network appliance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$No server required$q$, $q$Unlike Pi-hole, Maza doesn't need a dedicated device or network-wide DNS configuration to run.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Lightweight and simple$q$, $q$Focused on straightforward, efficient ad blocking without a complex setup process.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Open-source distribution$q$, $q$Source code and installation instructions are available on GitHub.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Simpler setup than a network-wide solution like Pi-hole$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Runs natively without extra hardware or a dedicated server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Lightweight, focused tool$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Only protects the single device it's installed on, not the whole network$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Limited to macOS and Linux, with no Windows support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Smaller community and feature set compared to established tools like Pi-hole$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Is Maza free?$q$, $q$Yes, Maza is free and open source, distributed via GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$What platforms does Maza support?$q$, $q$Maza supports macOS and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$How is Maza different from Pi-hole?$q$, $q$Pi-hole blocks ads network-wide via a dedicated DNS server, while Maza runs locally on an individual macOS or Linux machine without needing separate server hardware.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Single-device ad blocking$q$, $q$Individual users install Maza to block ads on their personal macOS or Linux computer.$q$, $q$Individual macOS/Linux users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$Simple alternative to Pi-hole$q$, $q$Users who don't want to manage a separate Pi-hole server use Maza for lightweight local blocking instead.$q$, $q$Privacy-conscious individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Maza is a local ad blocker created by developer Andros Fenollosa, described as being like Pi-hole but running natively on your own operating system instead of requiring a separate server or network-wide DNS setup.$q$, $q$It is open source and free, distributed via GitHub, and supports macOS and Linux, giving individual users a lightweight way to block ads without dedicated hardware.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Maza is aimed at individual macOS and Linux users who want simple, device-level ad blocking without setting up a separate DNS server or router-level solution like Pi-hole.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff61bcc5-91e7-4059-9a0b-4ca89539d8cb', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Pi-hole ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A self-hosted DNS sinkhole that blocks ads and trackers network-wide without needing browser extensions.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pi-hole is a free, open-source DNS sinkhole that blocks ads and trackers network-wide for every device, self-hosted on Linux or Docker.$q$,
  og_description = $q$Pi-hole is a free, open-source DNS sinkhole that blocks ads and trackers network-wide for every device, self-hosted on Linux or Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '08450324-4200-4667-af14-f12d8180794b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '08450324-4200-4667-af14-f12d8180794b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$DNS sinkhole ad blocking$q$, $q$Blocks known ad and tracking domains at the DNS resolution stage before any data is downloaded.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Web-based admin dashboard$q$, $q$A browser UI shows real-time query logs, top blocked domains, and per-client statistics, plus an API for building custom extensions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Custom allow/deny lists$q$, $q$Supports whitelisting, blacklisting, and regex-based filtering rules for fine-grained control over what gets blocked.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Built-in DHCP server$q$, $q$Can optionally act as the network's DHCP server so every client automatically uses Pi-hole for DNS.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Long-term query history$q$, $q$Stores DNS query logs in a local database for historical analysis of network activity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Configurable privacy levels$q$, $q$Four privacy modes let admins control how much query and client detail is logged and displayed.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Blocks ads and trackers for every device on the network, not just browsers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Completely free and open source with no paid tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Lightweight enough to run on a Raspberry Pi$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Detailed dashboard and query logging for network visibility$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Requires basic networking knowledge to configure DNS/DHCP correctly$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Does not block ads embedded within the same domain as the content (e.g., some YouTube/Twitch ads)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$A single Pi-hole instance is a single point of failure for DNS unless a secondary is configured$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Is Pi-hole free?$q$, $q$Yes. Pi-hole is completely free and open source; the project accepts optional donations but charges nothing to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Do I need a Raspberry Pi to run Pi-hole?$q$, $q$No. Despite the name, Pi-hole can run on any Linux system or in a Docker container, not just a Raspberry Pi.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Does Pi-hole replace a VPN or antivirus?$q$, $q$No. Pi-hole only blocks DNS requests to known ad/tracking domains; it does not encrypt traffic or scan for malware.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Home network ad blocking$q$, $q$Block ads and trackers across every device on a household network from one central point.$q$, $q$Home users and self-hosting enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$Network-wide DNS visibility$q$, $q$Monitor which domains devices on the network are querying for troubleshooting or parental oversight.$q$, $q$Home-lab admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Pi-hole is a network-wide ad and tracker blocker that works as a DNS sinkhole. Instead of relying on per-browser extensions, it is installed once on a home network (commonly on a Raspberry Pi, but also via Docker or a Linux package) and blocks ad and tracking domains for every device that uses it as their DNS resolver.$q$, $q$Because blocking happens at the DNS level before a connection is even made, Pi-hole reduces bandwidth usage and speeds up page loads on every device on the network, including smart TVs, phones, and IoT devices that can't run ad-blocking extensions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08450324-4200-4667-af14-f12d8180794b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Pi-hole suits home-lab enthusiasts and privacy-conscious households who want one place to block ads and trackers for every device on their network, plus small offices that want basic DNS-level filtering without deploying an endpoint agent on every machine.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08450324-4200-4667-af14-f12d8180794b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08450324-4200-4667-af14-f12d8180794b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08450324-4200-4667-af14-f12d8180794b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Technitium DNS Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, self-hosted authoritative and recursive DNS server with encrypted DNS and built-in ad blocking.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Technitium DNS Server is a free, open-source, self-hosted DNS server with encrypted DNS, DNSSEC, ad blocking, and a full HTTP API.$q$,
  og_description = $q$Technitium DNS Server is a free, open-source, self-hosted DNS server with encrypted DNS, DNSSEC, ad blocking, and a full HTTP API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '324e805f-15ca-4f08-af33-49fee415253c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '324e805f-15ca-4f08-af33-49fee415253c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Authoritative and recursive DNS$q$, $q$Can serve as both an authoritative name server for your own zones and a full recursive resolver, or operate as a forwarder.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Encrypted DNS protocols$q$, $q$Supports DNS-over-TLS, DNS-over-HTTPS, and DNS-over-QUIC for encrypted, private DNS resolution.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Ad and malware blocking$q$, $q$Configurable block list URLs with automatic daily updates, plus REGEX-based custom blocking rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$DNSSEC validation$q$, $q$Validates DNSSEC signatures and protects against DNS rebinding attacks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Built-in DHCP server$q$, $q$Optional integrated DHCP server with clustering support for managing an entire home or office network.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Full HTTP API$q$, $q$A complete API enables automation and third-party integrations, alongside multi-user role-based access and API tokens.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$High-performance async architecture$q$, $q$Built on an async I/O design the project reports handling over 100,000 requests per second, with caching, serve-stale, and prefetching.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Combines authoritative, recursive, and ad-blocking DNS in a single server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Encrypted DNS (DoT, DoH, DoQ) supported out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Cross-platform: Windows, Linux, macOS, Raspberry Pi, and Docker$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Free, open source, and actively maintained$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$More complex to configure than a purely ad-blocking-focused tool given its broader DNS server feature set$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Documentation assumes some familiarity with DNS concepts$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Self-hosted, so uptime and updates are the operator's responsibility$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Is Technitium DNS Server free?$q$, $q$Yes, it's free and open source under the GNU GPLv3 license; the project accepts optional donations via Patreon.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$What platforms does it run on?$q$, $q$Windows (7 SP1+), Linux, macOS, Raspberry Pi, and Docker, using a cross-platform .NET runtime.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Can it block ads like Pi-hole?$q$, $q$Yes, it supports configurable block lists with automatic updates and regex-based blocking, in addition to its full DNS server functionality.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Self-hosted encrypted DNS resolver$q$, $q$Run a private recursive resolver that supports DoH/DoT/DoQ for encrypted client queries.$q$, $q$Privacy-focused self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Authoritative DNS hosting$q$, $q$Host DNS zones for owned domains directly on infrastructure the operator controls.$q$, $q$Network administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$Network ad blocking with DHCP$q$, $q$Combine DNS-level ad blocking with DHCP management for a full home/office network stack.$q$, $q$Home-lab and small office admins$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Technitium DNS Server is an open-source DNS server that can act as an authoritative server, a recursive resolver, or a forwarder, and includes network-wide ad and malware blocking built in. It supports encrypted DNS protocols including DNS-over-TLS, DNS-over-HTTPS, and DNS-over-QUIC, along with DNSSEC validation and protection against DNS rebinding attacks.$q$, $q$The project is written in .NET and is licensed under the GNU GPLv3. Installation is designed to take about a minute with minimal configuration required, and the server includes a web-based admin console, a full HTTP API, and an optional DHCP server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Technitium fits self-hosters, small businesses, and network administrators who want a single DNS server that combines authoritative zone hosting, recursive resolution, encrypted DNS, and ad blocking, rather than stitching together separate tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324e805f-15ca-4f08-af33-49fee415253c', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── BentoPDF ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source, privacy-first PDF toolkit that processes files entirely in the browser with no uploads.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$BentoPDF is a free, open-source PDF toolkit with 40+ tools that processes files entirely in the browser — no uploads, no sign-up, self-hostable.$q$,
  og_description = $q$BentoPDF is a free, open-source PDF toolkit with 40+ tools that processes files entirely in the browser — no uploads, no sign-up, self-hostable.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9411a7fd-0397-45f4-8f2b-8c0aa0a790d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Client-side processing$q$, $q$All PDF operations run locally in the browser via WebAssembly; files are never uploaded to a server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$40+ PDF tools$q$, $q$Covers organization (merge, split, reorder, extract, rotate), editing (page numbers, watermarks, headers/footers, form fill, flatten), and security (compress, encrypt, decrypt, sign, redact, metadata).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Format conversion$q$, $q$Converts images, Markdown, and text files into PDFs, and exports PDF pages as images or greyscale files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Built-in OCR$q$, $q$Includes OCR support for extracting text from scanned PDF pages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Self-hostable via Docker$q$, $q$Ships an official Docker image and docker-compose setup for organizations that want to run their own instance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$No file uploads — everything processes locally in the browser$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Free with no watermarks, sign-ups, or file limits$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Wide range of tools (40+) covering most common PDF tasks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Open source (Apache 2.0) and self-hostable$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Browser-based WebAssembly processing can be slower on very large PDF files than a native desktop app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$As a newer project, community size and third-party plugin ecosystem are limited compared to established PDF suites$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Does BentoPDF upload my files anywhere?$q$, $q$No. All processing happens locally in the browser using WebAssembly; files never leave the device.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Is BentoPDF free?$q$, $q$Yes, all tools are free to use with no sign-up, file limits, or watermarks, and the source code is open under Apache 2.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Can I self-host BentoPDF?$q$, $q$Yes, official Docker images and a docker-compose file are provided for self-hosting.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Private PDF editing$q$, $q$Merge, split, compress, or edit PDFs without sending sensitive documents to a third-party server.$q$, $q$Privacy-conscious individuals and businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$Self-hosted PDF toolkit for teams$q$, $q$Deploy an internal PDF tools instance via Docker so an organization controls the infrastructure entirely.$q$, $q$IT teams and self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$BentoPDF is an open-source PDF toolkit that runs client-side in the browser using WebAssembly, so files never leave the user's device. It offers over 40 tools across organization, editing, format conversion, and security categories, and can be used directly on its hosted site, run locally, or self-hosted via Docker.$q$, $q$The project is licensed under Apache 2.0 and is available on GitHub. Because processing happens entirely in-browser, there are no file uploads, no accounts, no file-size limits enforced server-side, and nothing is logged or stored remotely.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$BentoPDF suits individuals and organizations who need common PDF tasks — merging, splitting, compressing, converting, redacting, or signing — done quickly without uploading potentially sensitive documents to a third-party server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9411a7fd-0397-45f4-8f2b-8c0aa0a790d9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Gotenberg ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source Docker API for converting HTML, Office documents, and Markdown into PDFs, and merging or manipulating PDFs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Gotenberg is a free, open-source Docker API that converts HTML, Office documents, and Markdown to PDF, plus merges and manipulates PDFs.$q$,
  og_description = $q$Gotenberg is a free, open-source Docker API that converts HTML, Office documents, and Markdown to PDF, plus merges and manipulates PDFs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cc56b3f3-f4c5-4009-b322-e2f5719481b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cc56b3f3-f4c5-4009-b322-e2f5719481b6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Chromium-based HTML/URL to PDF$q$, $q$Converts URLs, HTML templates, and Markdown files to PDF with full JavaScript execution and web font rendering.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$LibreOffice document conversion$q$, $q$Converts Word, Excel, PowerPoint, and 100+ other office formats to PDF using an embedded LibreOffice engine.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$PDF manipulation$q$, $q$Merges, splits, encrypts, and inspects PDFs, extracts page ranges, and applies watermarks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$PDF/A compliance$q$, $q$Can produce PDF/A-compliant archival PDFs for long-term document retention requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Cloud storage integration$q$, $q$Fetches source files from and uploads results to S3, MinIO, or Google Cloud Storage directly from the API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Single-container Docker deployment$q$, $q$Ships as one Docker image supporting amd64, arm64, armhf, i386, and ppc64le, with no separate dependency installation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Free and open source (MIT license) with a large, active user base$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Single Docker container replaces managing Chromium and LibreOffice conversion dependencies directly$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Broad format support: HTML, Markdown, and 100+ Office formats$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Built-in cloud storage integration for source and output files$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Requires running and maintaining a Docker container/service rather than a library import$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$No official hosted/managed version — self-hosting and scaling are the operator's responsibility$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Conversion quality for complex Office documents depends on the bundled LibreOffice engine's fidelity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Is Gotenberg free to use?$q$, $q$Yes, Gotenberg is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$How do I run Gotenberg?$q$, $q$Via Docker: `docker run --rm -p 3000:3000 gotenberg/gotenberg:8` starts the API on port 3000.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$What can Gotenberg convert to PDF?$q$, $q$URLs and HTML pages, Markdown files, and Word/Excel/PowerPoint and 100+ other document formats via LibreOffice.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Does Gotenberg offer a hosted API?$q$, $q$No, Gotenberg is distributed as a self-hosted Docker image; there is no official managed cloud service.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Server-side invoice/report generation$q$, $q$Render HTML templates into PDFs for invoices, reports, or receipts inside an application backend.$q$, $q$Backend developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$Office-to-PDF conversion pipelines$q$, $q$Convert uploaded Word, Excel, or PowerPoint files to PDF automatically as part of a document workflow.$q$, $q$SaaS and internal tooling teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Gotenberg is a Docker-based, self-hosted API that converts documents into PDFs so developers don't have to install and manage Chromium, LibreOffice, and PDF libraries themselves. It exposes a RESTful HTTP API with endpoints for converting URLs, HTML templates, and Markdown into PDFs using an embedded Chromium engine, and for converting Word, Excel, PowerPoint, and 100+ other formats using an embedded LibreOffice.$q$, $q$Beyond conversion, Gotenberg can merge, split, and encrypt PDFs, apply watermarks, extract page ranges, produce PDF/A-compliant output, and fetch source files from or upload results to S3, MinIO, or Google Cloud Storage. It's released under the MIT license, runs as a single container (`docker run -p 3000:3000 gotenberg/gotenberg:8`), and supports amd64, arm64, armhf, i386, and ppc64le architectures.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Gotenberg is aimed at developers who need reliable server-side PDF generation — invoices, reports, rendered web pages, converted Office documents — inside an application stack, without bundling browser or Office-conversion dependencies into their own services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cc56b3f3-f4c5-4009-b322-e2f5719481b6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── I, Librarian ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A PDF and reference management platform for research teams, available as a free open-source edition or a paid hosted/self-hosted subscription.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Dallas, TX, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$I, Librarian is a PDF and reference management platform for research teams, with a free open-source edition and paid hosted or on-premises plans.$q$,
  og_description = $q$I, Librarian is a PDF and reference management platform for research teams, with a free open-source edition and paid hosted or on-premises plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff47afbc-51e2-479e-9cbb-45a5ec96314e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff47afbc-51e2-479e-9cbb-45a5ec96314e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Centralized PDF library$q$, $q$Consolidates a team's research PDFs into one searchable database, eliminating duplicate files and fragmented folders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Integrated database search$q$, $q$Searches Crossref, Scopus, NASA, PubMed, IEEE, and patent repositories directly from within the app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Full-text and Boolean search$q$, $q$Faceted, Boolean search across the entire document collection for systematic literature reviews.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$OCR for scanned PDFs$q$, $q$Built-in OCR support covering over 90 languages, with a free monthly page allowance on paid plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$AI paper summaries and Q&A (Pro)$q$, $q$Pro plans add AI-generated summaries, document chat/Q&A, and AI-assisted literature search queries.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Self-hosted / on-premises option$q$, $q$A Pro self-hosted license lets institutions run the platform entirely behind their own firewall for data sovereignty.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Free open-source community edition available for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Deep integration with major academic and patent databases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$OCR support across 90+ languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$On-premises deployment option for institutions with compliance requirements$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$AI features (summaries, chat) are limited to paid Pro plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Per-user plus per-GB pricing can add up for larger research teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Full commercial feature set requires either a paid subscription or a purchased Pro license$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Is I, Librarian free?$q$, $q$There is a free, open-source community edition on GitHub for self-hosting. The hosted Lite/Pro plans and the Pro self-hosted license are paid.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$What's the difference between Lite and Pro?$q$, $q$Pro adds AI-powered paper summaries, document chat, AI-assisted literature search, and offline export on top of the core PDF/reference management features in Lite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Can I self-host I, Librarian for data sovereignty?$q$, $q$Yes, a Pro self-hosted license is available for on-premises deployment behind an institution's firewall, in addition to the free open-source edition.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Academic research paper management$q$, $q$Centralize and search a lab's PDF paper collection with integrated database lookups for systematic reviews.$q$, $q$University research groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Compliant on-premises document research$q$, $q$Run the platform behind an institutional firewall to meet data sovereignty requirements.$q$, $q$Biotech and regulated research teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Community (Open Source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted","Core PDF/reference management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Lite (Online)$q$, $q$From $1.50/user/month + $0.50/GB storage$q$, $q$monthly$q$, $q$["Centrally managed PDF collection","In-browser viewer","Full-text search","Integrated database search","OCR","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Pro (Online)$q$, $q$From $2.50/user/month + $0.50/GB storage$q$, $q$monthly$q$, $q$["Everything in Lite","AI paper summaries and chat","AI-assisted literature search","Offline export","Activity tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$Pro Self-Hosted$q$, $q$$36/year per user or $126 per user (perpetual)$q$, $q$yearly or one-time$q$, $q$["Full data sovereignty","Unlimited libraries","Container-based deployment","Optional support add-ons"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$I, Librarian is a browser-based PDF organizer and reference management platform built for research teams. It centralizes PDF collections in a single searchable database instead of scattered folders, with full-text and Boolean search, bulk tagging, and integrated searches across Crossref, Scopus, NASA, PubMed, IEEE, and patent repositories.$q$, $q$The product is developed by Scilico, LLC and is offered in three ways: a free, community open-source edition available on GitHub for self-hosting; paid online subscription plans (Lite and Pro) billed per user plus storage; and a paid self-hosted Pro license for organizations that need full data sovereignty behind their own firewall. The Pro tier adds AI-powered paper summaries, document Q&A, and AI-assisted literature search on top of the Lite feature set.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$I, Librarian is built for academic research groups, labs, and biotech/engineering teams that manage large PDF/paper collections and need centralized search, OCR, and citation database integration, with the option to self-host for institutional compliance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff47afbc-51e2-479e-9cbb-45a5ec96314e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Papra ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, self-hostable document archiving platform with tagging, full-text search, and email-based document intake.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Papra is an open-source document archiving platform with tagging, full-text search, and email ingestion, self-hostable or available as EU-hosted cloud plans.$q$,
  og_description = $q$Papra is an open-source document archiving platform with tagging, full-text search, and email ingestion, self-hostable or available as EU-hosted cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '993944af-a2d6-42bb-a3a0-2b1c8a4c460d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '993944af-a2d6-42bb-a3a0-2b1c8a4c460d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Unified document storage$q$, $q$Consolidates PDFs, invoices, spreadsheets, code files, and more into one searchable archive.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Tagging and automated rules$q$, $q$Tag documents manually or set up automated tagging rules to classify incoming files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Email ingestion$q$, $q$Generates dedicated email addresses per organization so attachments are automatically imported as documents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Full-text search$q$, $q$Search across the entire document archive to find files without manual folder browsing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Developer API, webhooks, CLI, and SDK$q$, $q$Provides programmatic access for integrating document intake and retrieval into other systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Self-hostable via Docker$q$, $q$Fully open source (AGPL-3.0) with unlimited self-hosted usage — no document, tag, or organization caps.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Free, unlimited self-hosted usage under an open-source AGPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Email-to-document ingestion simplifies capturing invoices and receipts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Includes API, webhooks, CLI, and SDK for automation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$EU-hosted cloud option for teams that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Cloud free tier has limited storage (512MB) and team size (3 members)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Newer project with a smaller community than established DMS tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Built and maintained largely by a single independent developer$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Is Papra free?$q$, $q$Yes, self-hosting is completely free and unlimited under the AGPL-3.0 open-source license. A hosted cloud version has a free tier plus paid Plus and Pro plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Can Papra import documents automatically?$q$, $q$Yes, Papra generates dedicated email addresses that automatically import email attachments as archived documents.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Does Papra have an API?$q$, $q$Yes, it offers a REST API, webhooks, a CLI, and an SDK for integrating with other tools.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Personal invoice and receipt archiving$q$, $q$Automatically capture invoices and receipts via email ingestion and keep them tagged and searchable.$q$, $q$Freelancers and individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Team document archive$q$, $q$Centralize a small team's documents with shared organizations, tags, and full-text search.$q$, $q$Small businesses and teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Unlimited documents, tags, and organizations","Full feature set","Docker deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Free (Cloud)$q$, $q$$0/month$q$, $q$monthly$q$, $q$["512MB storage","3 team members per organization","25MB max upload","1 intake email"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Plus (Cloud)$q$, $q$$9/month ($7.50/month billed annually)$q$, $q$monthly or annual$q$, $q$["5GB storage","10 team members","100MB max upload","10 intake emails","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$Pro (Cloud)$q$, $q$$30/month ($25/month billed annually)$q$, $q$monthly or annual$q$, $q$["50GB storage","50 team members","500MB max upload","100 intake emails","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Papra is an open-source document management and archiving platform for organizing, tagging, and searching files such as PDFs, invoices, spreadsheets, and code files. It supports automated tagging rules, dedicated per-user email addresses that auto-import attachments as documents, and organization structures for teams.$q$, $q$The project is licensed under AGPL-3.0 and can be self-hosted via Docker at no cost with no limits on documents, tags, or organizations. Papra also offers a hosted cloud version with a free tier and paid Plus/Pro tiers priced by storage and team size, with data hosted in Europe. It provides an API, webhooks, a CLI, and an SDK for developers, and is built by independent developer Corentin Thomasset.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Papra suits individuals and small teams who want to stop losing invoices, receipts, and documents across email and folders, and prefer either self-hosting on their own infrastructure or a lightweight EU-hosted cloud alternative to larger document-management suites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('993944af-a2d6-42bb-a3a0-2b1c8a4c460d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── PdfDing ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source, self-hosted PDF manager for organizing, viewing, annotating, and sharing PDFs across devices.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PdfDing is a free, open-source, self-hosted PDF manager with cross-device reading sync, annotations, signing, and shareable links.$q$,
  og_description = $q$PdfDing is a free, open-source, self-hosted PDF manager with cross-device reading sync, annotations, signing, and shareable links.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7407b9cd-1500-4f27-a02b-adda67302c80';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7407b9cd-1500-4f27-a02b-adda67302c80' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Cross-device reading sync$q$, $q$Remembers the last read position for each PDF so reading can continue seamlessly across devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Organization tools$q$, $q$Workspaces, collections, multi-level tagging, and archiving keep large PDF libraries organized.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Annotation and editing$q$, $q$Add text, highlights, and drawings directly on PDFs, plus digital signature support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Shareable links and QR codes$q$, $q$Share PDFs externally via links or QR codes with optional access restrictions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$OIDC SSO and 2FA$q$, $q$Supports OIDC-based single sign-on and two-factor authentication for secure access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Docker-first deployment$q$, $q$Designed to be minimal, fast, and easy to set up with Docker for full data ownership.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Reading position sync across devices out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Built-in annotation, signing, and sharing features$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Simple Docker-based self-hosted deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Requires self-hosting and Docker familiarity — no official managed hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Smaller community/ecosystem compared to larger document management platforms$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Is PdfDing free?$q$, $q$Yes, PdfDing is fully open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Can PdfDing sync my reading progress across devices?$q$, $q$Yes, it remembers the last position read in each PDF and syncs it across devices.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Does PdfDing support single sign-on?$q$, $q$Yes, it supports OIDC-based SSO as well as two-factor authentication.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Personal PDF library$q$, $q$Self-host a personal PDF reading and annotation library with cross-device sync.$q$, $q$Individual self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$Shared document access$q$, $q$Share PDFs with others via links or QR codes with optional access controls.$q$, $q$Small teams and families$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PdfDing is a self-hosted PDF management application that lets users organize, view, and edit PDFs while syncing reading position across devices. It supports workspaces, collections, multi-level tagging, and archiving for organization, plus text, highlight, and drawing annotation tools and digital signatures.$q$, $q$The project is open source and designed to be minimal, fast, and easy to deploy with Docker. It supports sharing PDFs via links or QR codes with optional access restrictions, OIDC-based single sign-on, two-factor authentication, and a customizable dark-mode interface. Development has been funded in part by the NGI0 Commons Fund via NLnet, and it emphasizes data ownership with no vendor lock-in.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$PdfDing fits self-hosters who want a personal or team PDF library — with reading-position sync, annotations, and shareable links — without relying on a third-party cloud PDF service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7407b9cd-1500-4f27-a02b-adda67302c80', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SimpleDMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source document management system for small businesses that organizes documents by tags and metadata instead of folders.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$SimpleDMS is an open-source document management system for small businesses using tags and workspaces, available cloud-hosted or self-hosted.$q$,
  og_description = $q$SimpleDMS is an open-source document management system for small businesses using tags and workspaces, available cloud-hosted or self-hosted.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b160eec3-7dec-4749-aa87-4cbf8e786590';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b160eec3-7dec-4749-aa87-4cbf8e786590' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Tag-based organization$q$, $q$Documents are categorized with tags instead of relying on nested folder structures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Workspaces$q$, $q$Shared or private spaces control which documents are visible to which users or teams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Duplicate detection$q$, $q$Automatically flags duplicate documents to keep the archive clean.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Full-text search$q$, $q$Search across document content, not just filenames or tags.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Document versioning$q$, $q$Tracks revisions of a document over time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Smart inbox$q$, $q$An inbox view suggests metadata for newly added documents to speed up filing.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Open-source codebase available on GitHub for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Tag- and metadata-driven filing avoids manual folder organization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Flexible deployment: cloud subscription, on-premises, or white-label SaaS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$30-day free trial for the cloud version$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Detailed pricing for cloud and on-premises tiers is not fully published and requires contacting the vendor$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Smaller community/ecosystem compared to larger open-source DMS projects$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Is SimpleDMS free?$q$, $q$The self-hosted, open-source codebase is available on GitHub. Cloud hosting is subscription-based with a 30-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Can I self-host SimpleDMS?$q$, $q$Yes, it can be deployed on-premises using the open-source version, in addition to the cloud subscription option.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Does SimpleDMS support white-label reselling?$q$, $q$Yes, a white-label SaaS option is available for businesses that want to offer SimpleDMS under their own brand.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Small business document filing$q$, $q$Replace manual folder-based filing with tag- and metadata-driven document organization.$q$, $q$Small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$Self-hosted on-premises DMS$q$, $q$Run the open-source codebase on internal infrastructure for full data control.$q$, $q$Small businesses with compliance needs$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SimpleDMS is an open-source document management system built for small businesses, organized around a tag system and shared or private workspaces rather than traditional folder hierarchies. It includes duplicate detection, full-text search, document versioning, multiple viewing options, and an inbox that suggests metadata for newly added files.$q$, $q$SimpleDMS can be deployed either in the cloud on a subscription basis (Pro and Unlimited tiers) or self-hosted on-premises using the open-source codebase from GitHub, with a 30-day free trial available for the cloud version. A white-label SaaS option is also offered for businesses that want to resell the platform under their own brand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SimpleDMS targets small businesses that want a lightweight document management system organized around tags and metadata, and want the flexibility to run it either as a cloud subscription or self-hosted on their own servers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b160eec3-7dec-4749-aa87-4cbf8e786590', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Atsumeru ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source, self-hosted media server for organizing and reading manga, comics, and light novels.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Atsumeru is a free, open-source, self-hosted server for manga, comics, and light novels with a web reader and Android app.$q$,
  og_description = $q$Atsumeru is a free, open-source, self-hosted server for manga, comics, and light novels with a web reader and Android app.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95db99cc-d2cd-4227-a213-282aa828ef80';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95db99cc-d2cd-4227-a213-282aa828ef80' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Multi-format library support$q$, $q$Handles CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu files in a single organized library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Web-based reader$q$, $q$Read manga, comics, and light novels directly in the browser via the WebUI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Android app$q$, $q$A dedicated Android app provides native reading with synced history.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Reading history sync$q$, $q$Two-way sync between the WebUI and Android app keeps reading progress consistent across devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Metadata management$q$, $q$Reads and organizes metadata via ComicInfo.xml or the native book_info.json format.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Desktop management app$q$, $q$Atsumeru Manager (Windows/Linux) provides server control and library/metadata editing outside the browser.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Supports a wide range of comic/manga/ebook formats in one library$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Cross-device reading progress sync via WebUI and Android app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Dedicated desktop manager for library administration$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$No official iOS app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Requires self-hosting infrastructure and setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Smaller community compared to larger self-hosted media server projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Is Atsumeru free?$q$, $q$Yes, Atsumeru is completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$What file formats does Atsumeru support?$q$, $q$CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu, with metadata via ComicInfo.xml or its native book_info.json format.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Does Atsumeru sync reading progress across devices?$q$, $q$Yes, two-way reading history synchronization is supported between the WebUI and the Android app.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Self-hosted manga/comic library$q$, $q$Organize and read a personal manga, comic, or light novel collection from a self-hosted server.$q$, $q$Manga and comic readers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Cross-device reading$q$, $q$Start reading on a browser and continue on the Android app with synced progress.$q$, $q$Mobile readers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Atsumeru is a free, open-source, self-hosted media server for personal manga, comic, and light novel libraries. It supports common comic and ebook formats — CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu — and reads metadata from either ComicInfo.xml or its own native book_info.json format.$q$, $q$The server ships with a web-based reading interface (WebUI) and an official Android app, both supporting two-way reading history synchronization so progress stays in sync across devices. A separate Atsumeru Manager desktop application for Windows and Linux lets administrators control the server and edit library metadata.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Atsumeru is built for manga, comic, and light novel readers who want to self-host their own digital library and read it through a browser or dedicated Android app instead of relying on third-party reading services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Calibre ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source ebook management suite for organizing, converting, editing, and serving ebook libraries across devices.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Calibre is a free, open-source ebook manager for organizing, converting, editing, and serving ebook libraries on Windows, macOS, and Linux.$q$,
  og_description = $q$Calibre is a free, open-source ebook manager for organizing, converting, editing, and serving ebook libraries on Windows, macOS, and Linux.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3e99368f-6adc-431d-9ed6-588c0d07395e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3e99368f-6adc-431d-9ed6-588c0d07395e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Library management with metadata$q$, $q$Organizes ebooks with tags, custom columns, and rich metadata editing so large libraries stay searchable.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Format conversion engine$q$, $q$Converts between EPUB, MOBI, AZW3, PDF, and other ebook formats while preserving layout, images, and fonts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$EPUB/AZW3 editor$q$, $q$Built-in editor exposes the underlying HTML/CSS of a book with a live preview for direct edits.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Content server$q$, $q$Serves a library over the network via a browser, functioning as a personal ebook hub accessible from other devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$E-reader syncing$q$, $q$Syncs converted ebooks directly to a wide range of e-reader devices.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$News and RSS to ebook$q$, $q$Fetches news and magazine content from online sources and converts it into ebook format for offline reading.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Plugin ecosystem$q$, $q$A large plugin library extends metadata sources, reading statistics, and other library organization features.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Completely free and open source with no subscription fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Extremely mature and feature-complete ebook conversion engine$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Cross-platform on Windows, macOS, and Linux$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Built-in content server for network-wide access to a library$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Large plugin ecosystem for extending functionality$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Interface is dense and can feel dated compared to modern apps$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Learning curve for advanced features like the editor and conversion options$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$No official mobile app; mobile access relies on the content server or third-party reader apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Is Calibre free?$q$, $q$Yes, Calibre is completely free and open source, though the project accepts donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$What platforms does Calibre run on?$q$, $q$Windows, macOS, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Can Calibre convert ebooks between formats?$q$, $q$Yes, its conversion engine supports EPUB, MOBI, AZW3, PDF, and many other formats, including batch conversion.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Can I access my Calibre library from another device?$q$, $q$Yes, Calibre includes a built-in content server that lets you browse, download, and read your library from a browser on other devices on the network.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Personal ebook library management$q$, $q$Organize a large ebook collection with metadata, tags, and custom columns.$q$, $q$Avid readers and book collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$E-reader format conversion$q$, $q$Convert ebooks between formats to match the requirements of a specific e-reader device.$q$, $q$E-reader owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$Self-hosted ebook access$q$, $q$Serve a personal ebook library over the network via the built-in content server.$q$, $q$Self-hosters$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Calibre is a cross-platform, free and open-source ebook management application maintained by Kovid Goyal. It handles organizing ebook libraries with metadata, tags, and custom columns, converting between formats such as EPUB, MOBI, AZW3, and PDF, editing EPUB and AZW3 files with a live HTML/CSS preview, and syncing books to e-readers.$q$, $q$Calibre also includes a built-in content server that turns a library into a personal ebook hub accessible from a browser on other devices on the network, and can fetch news and magazine content from online sources and convert it into ebook format for offline reading. An extensive plugin ecosystem extends metadata sources, reading statistics, and library organization features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Calibre is the standard tool for anyone managing a personal ebook collection — organizing metadata, converting formats for different e-readers, editing EPUB files, or serving a library to other devices — on Windows, macOS, or Linux.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e99368f-6adc-431d-9ed6-588c0d07395e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Kapowarr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted comic book library manager that automates downloading, organizing, and renaming your collection, in the style of the *arr apps.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kapowarr is a free, open-source self-hosted app that automates comic book library management, downloading, and organizing in the *arr style.$q$,
  og_description = $q$Kapowarr is a free, open-source self-hosted app that automates comic book library management, downloading, and organizing in the *arr style.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '298368f7-68f8-4264-b78c-a684a417a0b3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '298368f7-68f8-4264-b78c-a684a417a0b3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Automated volume monitoring$q$, $q$Monitor entire comic volumes and automatically search for and download new issues as they're released.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$ComicVine metadata matching$q$, $q$Matches comics against the ComicVine database to pull accurate volume and issue metadata.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Multiple download sources$q$, $q$Supports direct download links, Pixeldrain, Mega, and other configured sources for fetching issues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Automatic file organization$q$, $q$Extracts archives and renames/moves downloaded files into a folder structure and naming format you define.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Library import$q$, $q$Import an existing comic collection and match it against ComicVine to build a managed library.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Docker deployment$q$, $q$Ships as a Docker image for straightforward self-hosted deployment alongside other *arr apps.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Free and fully open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Fits naturally into an existing *arr-based home server stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Automates the tedious parts of comic collecting: matching, downloading, and renaming$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Active Discord and subreddit for community support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Requires self-hosting and some technical setup (Docker/manual install)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Relies on the ComicVine API and external download sources being available$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$No official mobile or desktop client — it's a web-based server app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Is Kapowarr free?$q$, $q$Yes, Kapowarr is free and open source, released under the GPL-3.0 license. The developer accepts optional donations via Ko-Fi.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Do I need to self-host Kapowarr?$q$, $q$Yes, Kapowarr is a self-hosted application, typically deployed via Docker on your own server or NAS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Does Kapowarr download comics itself?$q$, $q$Kapowarr automates searching and fetching from configured sources such as direct download links, Pixeldrain, and Mega, then organizes the resulting files for you.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$What metadata source does Kapowarr use?$q$, $q$Kapowarr integrates with the ComicVine API to match and pull metadata for volumes and issues.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Automated comic collection management$q$, $q$Automatically track and download new issues for monitored comic volumes.$q$, $q$Home lab and self-hosted media enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$Organizing an existing comic archive$q$, $q$Import a large existing folder of comics and have Kapowarr match and rename it consistently.$q$, $q$Comic collectors migrating to a managed library$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kapowarr is an open-source, self-hosted application for building and managing a comic book library, built to fit into the *arr suite of software alongside tools like Sonarr and Radarr.$q$, $q$It uses the ComicVine API to match volumes and issues, then searches configured download sources to automatically fetch, extract, rename, and file new comics into a folder structure you control.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Kapowarr is aimed at home lab and self-hosted media enthusiasts who already run other *arr-style automation tools and want the same kind of hands-off library management for digital comics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('298368f7-68f8-4264-b78c-a684a417a0b3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Kavita ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, self-hosted digital library for reading and organizing EPUB, PDF, comics, and manga with dedicated readers and OPDS support.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kavita is a free, self-hosted digital library for EPUB, PDF, comics, and manga, with dedicated readers, OPDS support, and an optional Kavita+ add-on.$q$,
  og_description = $q$Kavita is a free, self-hosted digital library for EPUB, PDF, comics, and manga, with dedicated readers, OPDS support, and an optional Kavita+ add-on.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3e4a075d-f88d-4c7c-b3da-ff99a7d73884';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3e4a075d-f88d-4c7c-b3da-ff99a7d73884' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Multi-format readers$q$, $q$Dedicated reading experiences for EPUB, PDF, comics, and manga, including a webtoon reading mode.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$User management$q$, $q$Multi-user support with granular permissions and OIDC-based authentication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Annotations$q$, $q$Highlight and annotate content, with export capabilities for notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Full-text search and metadata filtering$q$, $q$Search across your library content and filter by rich metadata fields.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$OPDS support$q$, $q$Connect third-party OPDS-compatible reader apps to your Kavita library.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Automatic folder monitoring$q$, $q$Watches your library folders and updates automatically as files are added.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Send-to-Kindle$q$, $q$Send books directly to a Kindle device from within Kavita.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Core server is free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Broad format support across ebooks, comics, and manga in one app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Actively developed with community-driven feature requests$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$OPDS support enables use with many third-party reader apps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Requires self-hosting your own server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Some advanced metadata and sync features require the paid Kavita+ add-on$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$No dedicated first-party native mobile app is highlighted on the site; mobile access relies on OPDS clients or the web UI$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Is Kavita free?$q$, $q$Yes. The Kavita server is free and open source. An optional Kavita+ subscription adds extras like AniList sync and automatic metadata, starting at a discounted first month before renewing at a monthly rate.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$What file formats does Kavita support?$q$, $q$Kavita supports EPUB and PDF ebooks as well as common comic and manga archive formats.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Can I use other reading apps with Kavita?$q$, $q$Yes, Kavita exposes an OPDS feed so it can be used with compatible third-party reader apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Do I need my own server to run Kavita?$q$, $q$Yes, Kavita is self-hosted software that you install and run on your own server or NAS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Personal ebook and comic library$q$, $q$Centralize EPUB, PDF, comic, and manga collections in one self-hosted reader.$q$, $q$Home media and book collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Manga and webtoon reading$q$, $q$Read manga and webtoons with a purpose-built reading mode.$q$, $q$Manga and webtoon readers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Kavita (self-hosted server)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full library server","Multi-format readers","OPDS support","User management"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$Kavita+$q$, $q$From $2 first month, then billed monthly$q$, $q$monthly$q$, $q$["AniList sync","Automatic metadata scraping"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kavita is a self-hosted digital library platform for organizing and reading EPUB books, PDFs, comics, and manga privately on your own server, without relying on third-party cloud services.$q$, $q$It includes format-specific readers (including a dedicated webtoon mode and dual-page spreads), metadata management, full-text search, reading lists, and OPDS support so third-party e-reader apps can connect to your library.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', $q$kavita-plus$q$, $q$Kavita+$q$, 2, ARRAY[$q$The core server is completely free and open source. Kavita+ is an optional paid add-on subscription that unlocks extras such as AniList synchronization and automatic metadata scraping.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e4a075d-f88d-4c7c-b3da-ff99a7d73884', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Komga ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted media server for organizing and reading comics, manga, graphic novels, and eBooks.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Croatian$q$, $q$Chinese$q$, $q$Spanish$q$]::text[],
  seo_meta_description = $q$Komga is a free, open-source self-hosted server for organizing and reading comics, manga, graphic novels, and eBooks.$q$,
  og_description = $q$Komga is a free, open-source self-hosted server for organizing and reading comics, manga, graphic novels, and eBooks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '45a5beb8-a950-4bc0-908e-c7d7b3bef34a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '45a5beb8-a950-4bc0-908e-c7d7b3bef34a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Library and collection organization$q$, $q$Group content into libraries, collections, and custom reading lists.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Multi-format support$q$, $q$Reads CBZ, CBR, PDF, and EPUB files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Integrated web reader$q$, $q$Read directly in the browser without a separate client app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Metadata editing$q$, $q$Edit and manage series and book metadata within the app.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Third-party client support$q$, $q$Compatible with OPDS readers and the Mihon (formerly Tachiyomi) extension.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Multi-language interface$q$, $q$Available in several languages including English, French, Spanish, and Chinese.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Clean, integrated web reader with no extra client required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Broad format support for both comics and ebooks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Active community with Discord and translation support via Crowdin$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Requires self-hosting and basic server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$No official mobile app of its own — mobile access relies on OPDS or Mihon-compatible clients$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Is Komga free?$q$, $q$Yes, Komga is free and open-source software available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$What formats does Komga support?$q$, $q$Komga supports CBZ, CBR, PDF, and EPUB files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Can I read Komga on mobile?$q$, $q$Komga's web reader works in mobile browsers, and it supports third-party OPDS and Mihon-compatible reader apps for a native mobile reading experience.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Does Komga need to be self-hosted?$q$, $q$Yes, Komga runs on your own server or NAS as a self-hosted application.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$Personal comic and manga library$q$, $q$Organize and read a personal collection of comics and manga from any device.$q$, $q$Comic and manga collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$eBook server$q$, $q$Serve EPUB and PDF books alongside comics in one unified library.$q$, $q$Self-hosters managing mixed media libraries$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Komga is a free, open-source media server for organizing and reading comics, manga, graphic novels, magazines, and eBooks from your own storage.$q$, $q$It organizes content into libraries, collections, and reading lists, and includes an integrated web-based reader along with metadata editing tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Komga suits self-hosters who want a centralized, private way to browse and read a personal comic or ebook collection across devices, including through third-party client apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45a5beb8-a950-4bc0-908e-c7d7b3bef34a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Stump ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted comics, manga, and digital book server with OPDS support, built with Rust and React.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Stump is a free, open-source self-hosted server for comics, manga, and digital books with OPDS, e-reader sync, and desktop/mobile clients.$q$,
  og_description = $q$Stump is a free, open-source self-hosted server for comics, manga, and digital books with OPDS, e-reader sync, and desktop/mobile clients.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '002172fd-e41e-488b-88d6-f387f92abea3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '002172fd-e41e-488b-88d6-f387f92abea3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$OPDS v1.2 and v2.0 support$q$, $q$Connect e-readers and third-party OPDS clients directly to your Stump library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Multi-format readers$q$, $q$Built-in readers for EPUB, PDF, CBZ/ZIP, and CBR/RAR files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Multi-user accounts$q$, $q$Permissions and age-based access controls for multiple users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Annotations and highlights$q$, $q$Highlight and annotate EPUB books within the reader.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Kobo and KoReader sync$q$, $q$Sync reading progress with Kobo devices and KoReader.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$OIDC authentication$q$, $q$Supports OpenID Connect for single sign-on.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Multiple client apps$q$, $q$Available as a Docker deployment, pre-built binaries, a Tauri desktop app, and a React Native mobile app.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Free and open source (MIT licensed core)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Lightweight Rust backend with a modern React interface$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Good OPDS and e-reader device sync support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Available across Docker, desktop, and mobile clients$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Still in beta ahead of a 1.0 release, so stability and features can change$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Maintained as a hobby project with no guaranteed development timeline$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Requires self-hosting and technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Is Stump free?$q$, $q$Yes, Stump is free and open source, licensed under MIT (with GPL-3.0 for its mobile app).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Is Stump production-ready?$q$, $q$Stump is under active development but is still considered beta software; it has not yet reached a stable 1.0 release.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Does Stump support e-readers?$q$, $q$Yes, Stump supports OPDS v1.2/v2.0 and syncs reading progress with Kobo devices and KoReader.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$What platforms is Stump available on?$q$, $q$Stump can be deployed via Docker or pre-built binaries, and also offers a Tauri-based desktop app and a React Native mobile app.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$Self-hosted comic and manga server$q$, $q$Host and read a personal comics/manga collection with multi-user access.$q$, $q$Home lab self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$E-reader syncing$q$, $q$Keep reading progress synced across Kobo and KoReader devices.$q$, $q$E-reader owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Stump is a free and open-source, self-hosted server for comics, manga, and digital books, built with Rust and React. It supports EPUB, PDF, CBZ/ZIP, and CBR/RAR formats with built-in readers for each.$q$, $q$The project is under active development but is still officially in beta, ahead of a planned stable 1.0 release, maintained as a hobby project by Aaron Leopold.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Stump appeals to self-hosters who want a lightweight, OPDS-compatible reading server with multi-user support and e-reader syncing, and who are comfortable running beta software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('002172fd-e41e-488b-88d6-f387f92abea3', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── DSpace ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source digital repository platform used by academic, non-profit, and commercial organizations to preserve and share digital content.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$DSpace is a free, open-source digital repository platform for preserving and sharing research and institutional content.$q$,
  og_description = $q$DSpace is a free, open-source digital repository platform for preserving and sharing research and institutional content.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ac2da229-e50c-4b42-a614-0213a13fd14e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ac2da229-e50c-4b42-a614-0213a13fd14e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Digital content preservation$q$, $q$Manages and preserves many file formats, from PDFs and images to audio and video.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Group-based access controls$q$, $q$Granular permissions for managing who can view or manage repository content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Multi-language support$q$, $q$Available in 22 languages for international institutions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$External system integrations$q$, $q$Integrates with services such as ORCID, OpenAIRE, and ROR.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$DSpace-CRIS$q$, $q$A merged platform extension supporting research information management use cases.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Completely free with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Mature project with a large, active community and Lyrasis-backed governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Used by thousands of institutions worldwide$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Strong integrations with scholarly identifier and metadata services$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Requires self-hosting and dedicated IT/systems administration to run and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Setup and customization can require developer expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$No official managed hosting from the core project itself (relies on institutional or third-party hosting)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Is DSpace free?$q$, $q$Yes, DSpace is free and open source under a BSD license, with no subscription fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Who maintains DSpace?$q$, $q$DSpace is developed and supported by its user community, with organizational support from Lyrasis.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$What is DSpace used for?$q$, $q$DSpace is used to build institutional and subject-based repositories for research publications, datasets, and other digital content, mainly by academic and non-profit organizations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Does DSpace support open access compliance?$q$, $q$DSpace integrates with services like ORCID, OpenAIRE, and ROR, which are commonly used to support open access and research reporting requirements.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Institutional repository$q$, $q$Host and preserve a university or organization's research output and publications.$q$, $q$Academic libraries and research institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$Dataset and media repository$q$, $q$Manage subject-based, dataset, or media collections with access controls.$q$, $q$Non-profit and commercial organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$DSpace is an open-source software platform for building and managing digital repositories, used to host, preserve, and share digital content such as PDFs, images, and audio/video files.$q$, $q$It is distributed under a BSD open-source license with no licensing fees, and is developed and supported by its user community with the help of Lyrasis. DSpace is available in 22 languages and includes granular, group-based access controls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$DSpace is widely used by research libraries and institutions to run institutional repositories for publications, datasets, theses, and other scholarly or organizational content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac2da229-e50c-4b42-a614-0213a13fd14e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── EPrints ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source digital repository platform for institutions to manage and share research publications, theses, and other outputs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Southampton, United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$EPrints is an open-source digital repository platform for universities and research institutions to manage publications and support open access.$q$,
  og_description = $q$EPrints is an open-source digital repository platform for universities and research institutions to manage publications and support open access.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '99b70ad3-9af0-4ac2-9da3-d697947ef658';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '99b70ad3-9af0-4ac2-9da3-d697947ef658' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Research output repository$q$, $q$Store and showcase publications, theses, and grey literature in a customizable repository.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Open access compliance support$q$, $q$Helps institutions meet research funder open access requirements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Usage analytics and reporting$q$, $q$Built-in tools for tracking repository usage and generating reports.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Institutional system integration$q$, $q$Integrates with existing institutional infrastructure and systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Customizable design$q$, $q$Repository presentation can be tailored for specialized research communities.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Free, open-source core with over two decades of development$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Optional professional hosting and support available from EPrints Services$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Proven track record with UK universities and other research institutions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Designed specifically around open access and funder compliance needs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Self-hosted deployment requires systems administration expertise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Commercial hosting, storage, and support are paid add-ons, not included free$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Primarily oriented toward academic/research use cases rather than general-purpose content management$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Is EPrints free?$q$, $q$Yes, EPrints is free, open-source software. Optional commercial hosting, storage, and support are available for a fee through EPrints Services.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Who develops EPrints?$q$, $q$EPrints is maintained by EPrints Services at the University of Southampton.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$What is EPrints used for?$q$, $q$EPrints is used by universities and research organizations to build institutional repositories for publications, theses, and other research outputs, and to support open access compliance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Does EPrints offer managed hosting?$q$, $q$Yes, EPrints Services offers optional paid hosting, storage, and support alongside the free open-source software.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$University institutional repository$q$, $q$Host and manage a university's research publications and theses.$q$, $q$Academic libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$Open access compliance$q$, $q$Meet funder open access mandates by publishing research outputs in a compliant repository.$q$, $q$Research institutions and their researchers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$EPrints software$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted open-source repository platform"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$EPrints Services hosting & support$q$, $q$Custom (contact for pricing)$q$, $q$custom$q$, $q$["Managed hosting","Storage","Professional support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$EPrints is an open-source digital repository platform used by research institutions to create repositories for publications, theses, and grey literature, supporting open access compliance.$q$, $q$It has been developed for over two decades and is maintained by EPrints Services at the University of Southampton, which also offers optional commercial hosting, storage, and support services alongside the free software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$EPrints is aimed at universities and research organizations, particularly in the UK, that need to run an institutional repository and meet funder open access requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99b70ad3-9af0-4ac2-9da3-d697947ef658', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Fedora Commons Repository ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modular, open-source repository system for managing and disseminating digital content in libraries, archives, and cultural institutions.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Fedora is a free, open-source, modular repository system used by libraries, archives, and cultural institutions to manage digital content.$q$,
  og_description = $q$Fedora is a free, open-source, modular repository system used by libraries, archives, and cultural institutions to manage digital content.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e5e577d8-a36b-4321-96a7-960980e7373b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e5e577d8-a36b-4321-96a7-960980e7373b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Modular architecture$q$, $q$Flexible, component-based design that can be adapted to different repository needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Complex digital object support$q$, $q$Built to manage large, diverse collections of digital content types.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Specialized access controls$q$, $q$Supports fine-grained access policies for managed content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Ecosystem integration$q$, $q$Commonly used as the storage/preservation layer beneath platforms such as Islandora and Samvera Hyrax.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Backed by Lyrasis with an active community and governance structure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Proven at scale across major libraries, archives, and cultural institutions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Serves as a flexible foundation used by other repository platforms$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Requires significant technical expertise to deploy and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Typically used as infrastructure within a larger application rather than as a standalone end-user tool$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Legacy Fedora 3 and current versions coexist, which can add complexity for new adopters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Is Fedora Commons Repository free?$q$, $q$Yes, Fedora is free and open-source software with no licensing costs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Who maintains Fedora?$q$, $q$Fedora is maintained by Lyrasis, which serves as its organizational home, along with an active community of contributors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Is Fedora a standalone application?$q$, $q$Fedora is typically used as a repository backend, often underlying front-end platforms such as Islandora or Samvera Hyrax, rather than as a standalone consumer application.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Who uses Fedora?$q$, $q$Fedora is used by academic institutions, national libraries, cultural heritage organizations, and government agencies worldwide.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Digital library backend$q$, $q$Provide the preservation and access layer for a digital library or archive.$q$, $q$Libraries and archives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$Foundation for repository platforms$q$, $q$Serve as the underlying repository system for platforms like Islandora and Samvera Hyrax.$q$, $q$Cultural heritage and research institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Fedora (Flexible Extensible Digital Object Repository Architecture) is a robust, modular, open-source repository system for managing and disseminating digital content, used by digital libraries, archives, and organizations with large collections of cultural, historic, and scientific materials.$q$, $q$The project is maintained by Lyrasis as its organizational home, with a dedicated program team, active mailing lists, and a community Slack channel supporting adopters.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Fedora is used by universities, national libraries, cultural heritage organizations, and government agencies that need a flexible backend repository for complex digital collections, often as a component within larger platforms like Islandora or Samvera Hyrax.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5e577d8-a36b-4321-96a7-960980e7373b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── InvenioRDM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, turn-key research data management repository built by CERN and partners for institutions to manage and share research data.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Geneva, Switzerland$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$InvenioRDM is a free, open-source research data management repository led by CERN, with DOI registration, custom metadata, and a REST API.$q$,
  og_description = $q$InvenioRDM is a free, open-source research data management repository led by CERN, with DOI registration, custom metadata, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b860b3a-7f1c-4237-9c04-9f584f03194c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b860b3a-7f1c-4237-9c04-9f584f03194c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Customizable metadata and workflows$q$, $q$Adapt metadata schemas and submission workflows to institutional needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$DOI registration$q$, $q$Register DOIs for published datasets and research outputs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$REST API$q$, $q$Extensive API access for integration with other research systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Search and discovery$q$, $q$Powerful search across deposited research data and metadata.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Community features$q$, $q$Organize submissions and curation workflows around communities within the repository.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Interoperability$q$, $q$Built to interoperate with external systems and standards used in research data management.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Free and open source, led by CERN with active institutional backing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Highly scalable architecture proven in large research contexts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Strong metadata customization and REST API for integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Modern, actively maintained with regular versioned releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Requires self-hosting and technical resources to deploy and operate$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Complex feature set that may be more than smaller institutions need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$No official managed SaaS hosting offered directly by the core project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Is InvenioRDM free?$q$, $q$Yes, InvenioRDM is free and open-source software available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Who develops InvenioRDM?$q$, $q$InvenioRDM is led by CERN, with contributions from Northwestern University and the broader open-source community.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$What is InvenioRDM used for?$q$, $q$InvenioRDM is used by institutions to manage and share research data, register DOIs, and provide standards-based discovery and access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Can I try InvenioRDM before installing it?$q$, $q$Yes, the project maintains a public demo site where you can explore its features before deploying your own instance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Research data repository$q$, $q$Store, organize, and publish research datasets with DOIs and rich metadata.$q$, $q$Universities and research institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$Institutional data management$q$, $q$Provide a standards-compliant platform for managing research outputs across departments.$q$, $q$Research data managers and librarians$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$InvenioRDM is a turn-key research data management repository built to help organizations store, organize, and share research datasets and related materials.$q$, $q$It is free and open source, led by CERN with contributions from Northwestern University and the broader community, and includes a REST API, DOI registration, customizable metadata and vocabularies, and community features for managing submissions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$InvenioRDM is built for research institutions, universities, and scientific organizations that need a scalable, standards-based repository to manage and publish research data with DOIs and rich metadata.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b860b3a-7f1c-4237-9c04-9f584f03194c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Islandora ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source digital asset management platform, built on Drupal, for managing and preserving digital collections in libraries, archives, and museums.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Islandora is a free, open-source, Drupal-based digital asset management platform for libraries, archives, and museums.$q$,
  og_description = $q$Islandora is a free, open-source, Drupal-based digital asset management platform for libraries, archives, and museums.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '014ca794-6131-4f44-a025-a0ff78da3c46';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '014ca794-6131-4f44-a025-a0ff78da3c46' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Drupal-based content management$q$, $q$Built on Drupal CMS, giving institutions a flexible, extensible content management foundation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Apache Solr integration$q$, $q$Enterprise-level indexing and search for large digital collections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Optional Fedora Commons integration$q$, $q$Connects to a Fedora repository for preservation and linked-data support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$IIIF support$q$, $q$Enables large-scale, standards-based access to digital images.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Sandbox environment$q$, $q$A demo environment with sample content for evaluating the platform before deployment.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Free to use and open source, with a permanent commitment to remain so$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Built on the widely-used Drupal ecosystem, giving access to a large module and developer community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Backed by the Islandora Foundation with active governance and community groups$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Strong support for standards like IIIF for image-heavy digital collections$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Requires Drupal and systems administration expertise to deploy and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Optional Fedora integration adds architectural complexity for full preservation features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Best suited to institutions with dedicated technical staff rather than casual self-hosters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Is Islandora free?$q$, $q$Yes, Islandora is released under open-source licenses and the project states it is free to use and always will be.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$What is Islandora built on?$q$, $q$Islandora is built on the Drupal CMS, with Apache Solr for search and optional Fedora Commons integration for preservation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Who maintains Islandora?$q$, $q$Islandora is maintained by the Islandora Foundation and an international community of contributors, with committees and interest groups guiding development.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Who uses Islandora?$q$, $q$Islandora is used by government agencies, libraries, archives, and museums worldwide to manage digital collections.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Digital collections repository$q$, $q$Manage and provide access to large digital collections of images, documents, and other objects.$q$, $q$Libraries, archives, and museums$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$Preservation with Fedora$q$, $q$Pair Islandora's front end with a Fedora Commons backend for long-term digital preservation.$q$, $q$Institutions with formal preservation requirements$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Islandora is an open-source digital asset management platform for the collaborative authoring, management, discovery, and stewardship of digital collections, built on top of the Drupal CMS.$q$, $q$It integrates Apache Solr for indexing and discovery, supports IIIF for large-scale image access, and can optionally connect to a Fedora Commons repository for preservation and linked-data capabilities. It is maintained by the Islandora Foundation and an international community of contributors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Islandora is used across government, library, archive, and museum sectors by institutions that need a customizable, Drupal-based platform for managing and preserving digital collections.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('014ca794-6131-4f44-a025-a0ff78da3c46', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Samvera Hyrax ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Ruby on Rails repository engine from the Samvera community for building customizable institutional digital repositories.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Samvera Hyrax is a free, open-source Ruby on Rails engine for building customizable institutional digital repositories.$q$,
  og_description = $q$Samvera Hyrax is a free, open-source Ruby on Rails engine for building customizable institutional digital repositories.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f31da656-5abb-4ac5-8a10-1c4937d3ecce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f31da656-5abb-4ac5-8a10-1c4937d3ecce' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Rails engine architecture$q$, $q$Mounts as an engine inside a host Rails application, giving developers full control over customization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Custom object types$q$, $q$Define custom repository object types to match institutional content models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Configurable deposit workflows$q$, $q$Set up custom review and approval workflows for content deposit.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Flexible metadata schemas$q$, $q$Adapt metadata models to institutional or domain-specific requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Selective feature toggles$q$, $q$Enable or disable features through an administrative interface as needed.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Free and open source under the permissive Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Highly customizable via its Rails engine architecture$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Backed by the Samvera community with 30+ institutional partners$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Suitable for both commercial and institutional use$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Requires Ruby on Rails development expertise to implement — not a turn-key app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Typically depends on other Samvera ecosystem components (e.g. Fedora, Solr, Blacklight) for a full deployment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Best suited to institutions with dedicated developer resources rather than casual self-hosters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Is Samvera Hyrax free?$q$, $q$Yes, Hyrax is free and open source, licensed under Apache 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Is Hyrax a ready-to-use application?$q$, $q$No — Hyrax is a Ruby on Rails engine that developers mount within their own Rails application to build a customized repository, rather than a standalone installable app.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Who develops Hyrax?$q$, $q$Hyrax is developed by the Samvera community, a collaborative network of institutional partners building shared repository software.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$What is Hyrax used for?$q$, $q$Hyrax is used to build institutional, data, or digital object repositories with custom workflows and metadata.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Custom institutional repository$q$, $q$Build a tailored digital repository application on top of the Hyrax Rails engine.$q$, $q$University and library development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$Research data and digital object management$q$, $q$Implement configurable deposit workflows for varied content types.$q$, $q$Samvera community institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Hyrax is a Ruby on Rails engine built by the Samvera community that provides the foundation for developing digital repository applications. Rather than a standalone application, it's a pluggable engine that institutions mount inside their own Rails app to build a customized repository.$q$, $q$Hyrax supports custom repository object types, configurable deposit workflows, and flexible metadata schemas, with features that can be selectively enabled through an administrative interface. It is licensed under Apache 2.0, making it free for both institutional and commercial use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Hyrax is aimed at institutions and developer teams within the Samvera community who need a flexible, code-level starting point for a custom digital repository rather than an out-of-the-box application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f31da656-5abb-4ac5-8a10-1c4937d3ecce', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Evergreen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source integrated library system (ILS) used by libraries and consortia worldwide for cataloging, circulation, and public search.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Evergreen is a free, open-source ILS for library cataloging, circulation, and consortial resource sharing, used in roughly 1,800 libraries worldwide.$q$,
  og_description = $q$Evergreen is a free, open-source ILS for library cataloging, circulation, and consortial resource sharing, used in roughly 1,800 libraries worldwide.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a72c0059-3aea-470f-b7ae-d8605c64dfda';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a72c0059-3aea-470f-b7ae-d8605c64dfda' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Circulation & patron management$q$, $q$Checkouts, holds, renewals, fines, and patron records across single libraries or large multi-branch consortia.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Public search catalog (OPAC)$q$, $q$A web-based public catalog that lets patrons search, place holds, and manage their own accounts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Consortial resource sharing$q$, $q$Built from the ground up to let many independent libraries share one catalog and circulate items between branches.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Cataloging$q$, $q$MARC-based bibliographic and authority record management for library staff.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Acquisitions & serials$q$, $q$Modules for ordering materials and tracking serial subscriptions alongside circulation data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Reporting$q$, $q$Built-in reporting tools for circulation, collection, and usage statistics.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$No licensing fees — free and open source under the GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Proven at scale across roughly 1,800 library installations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Purpose-built for multi-library consortial resource sharing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Governed by an independent community under the Software Freedom Conservancy$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Requires server administration and technical expertise to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Initial setup and data migration from legacy systems can be complex$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Smaller commercial support ecosystem than proprietary ILS vendors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Is Evergreen free to use?$q$, $q$Yes. Evergreen is free, open-source software released under the GNU General Public License; there are no licensing fees to run it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Who maintains Evergreen?$q$, $q$It is maintained by an open community of libraries and developers under the Software Freedom Conservancy, with commercial support available from partners such as Equinox Software.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Can independent libraries use Evergreen, or is it only for consortia?$q$, $q$Both. Evergreen was designed for multi-library consortia but is also used by individual, standalone libraries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Does Evergreen support MARC cataloging?$q$, $q$Yes, cataloging in Evergreen is based on the MARC bibliographic and authority record standards used throughout the library field.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Statewide library consortia$q$, $q$Share a single catalog and circulation pool across dozens or hundreds of member libraries.$q$, $q$State and regional library systems$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Public library systems$q$, $q$Manage cataloging, circulation, and patron accounts for multi-branch public library systems.$q$, $q$Public libraries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$Academic library networks$q$, $q$Run a shared ILS across affiliated academic or special libraries.$q$, $q$Academic and special libraries$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Evergreen is a free, open-source integrated library system (ILS) originally built by the Georgia Public Library Service in 2004 for PINES, a statewide resource-sharing consortium. It handles cataloging, circulation, acquisitions, serials, and a public search catalog (OPAC), and is released under the GNU General Public License.$q$, $q$The software is now stewarded through the Software Freedom Conservancy with an independent community oversight board, and it powers statewide and regional library consortia as well as individual libraries in roughly 1,800 installations worldwide.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Evergreen is aimed at public, academic, and consortial libraries that need to manage large, multi-branch or multi-library catalogs without paying per-seat ILS licensing fees. It's particularly suited to statewide or regional resource-sharing networks where many libraries need to share a single catalog and circulation pool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a72c0059-3aea-470f-b7ae-d8605c64dfda', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Koha ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$The world's first free and open-source integrated library system, used by libraries globally for cataloging, circulation, and public search.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Koha is the world's first free, open-source integrated library system, offering cataloging, circulation, and OPAC search for libraries of any size.$q$,
  og_description = $q$Koha is the world's first free, open-source integrated library system, offering cataloging, circulation, and OPAC search for libraries of any size.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6642f7be-b54a-4974-8b1c-50cd8c2c2785';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6642f7be-b54a-4974-8b1c-50cd8c2c2785' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Cataloging$q$, $q$MARC21 and UNIMARC-based bibliographic and authority record management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Circulation & patron management$q$, $q$Checkouts, holds, renewals, and patron records across single or multi-branch libraries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Public catalog (OPAC)$q$, $q$A responsive, web-based public search interface for patrons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Acquisitions & serials$q$, $q$Tools for ordering materials and managing serial subscriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Multi-library support$q$, $q$Runs single independent libraries or multi-branch and consortial setups.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$SIP2 & self-checkout support$q$, $q$Integrates with self-checkout stations and third-party patron systems via SIP2.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Completely free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Mature project with over two decades of production use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Large global community plus many commercial support and hosting providers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Highly configurable for libraries of any size$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Self-hosting requires server administration and Perl/technical expertise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Initial configuration and data migration can be involved$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Staff face a learning curve compared to simpler consumer tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Is Koha really free?$q$, $q$Yes, Koha is free and open-source software; there is no license fee to download, install, or modify it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Can I get paid support for Koha?$q$, $q$Yes, numerous independent companies worldwide offer paid hosting, migration, and support services for Koha.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$What library types use Koha?$q$, $q$Public, school, academic, and special libraries of all sizes use Koha, from single-branch libraries to larger consortia.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Does Koha support multiple languages?$q$, $q$Koha has a multilingual community and interface, though exact language availability depends on the version and translation coverage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Public libraries$q$, $q$Run cataloging, circulation, and patron self-service for one or many branches.$q$, $q$Public library systems$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$School and academic libraries$q$, $q$Manage collections and circulation for K-12 or higher-education library collections.$q$, $q$Schools and universities$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$Special and consortial libraries$q$, $q$Support shared cataloging across affiliated or member libraries.$q$, $q$Library consortia$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Koha is a fully-featured, scalable library management system billed by the Koha community as the world's first free and open-source ILS, originally created in New Zealand in 1999. It's free to download, install, and modify, with development backed by libraries of all sizes, volunteer contributors, and a network of commercial support companies worldwide.$q$, $q$The software is responsive across devices and covers the core functions a library needs: cataloging, circulation, acquisitions, serials, and a public-facing search catalog.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Koha suits public, school, academic, and special libraries of any size that want a mature, actively maintained ILS without recurring software licensing costs. Because paid support and hosting are available from many independent vendors, it also works for libraries that want commercial help without vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6642f7be-b54a-4974-8b1c-50cd8c2c2785', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── RERO ILS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Invenio-based integrated library system built in Switzerland for library cataloging, circulation, and multilingual public search.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RERO ILS is an open-source, Invenio-based library system from Switzerland's RERO+ network, offering multilingual cataloging and circulation.$q$,
  og_description = $q$RERO ILS is an open-source, Invenio-based library system from Switzerland's RERO+ network, offering multilingual cataloging and circulation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea0dd7b0-e3e8-4424-afc9-75a3c6224c09';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea0dd7b0-e3e8-4424-afc9-75a3c6224c09' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Invenio-based architecture$q$, $q$Built on the Invenio digital library framework originally developed at CERN.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Natural-language cataloging$q$, $q$Replaces raw MARC field codes with readable, natural-language field labels for catalogers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Multilingual authority file$q$, $q$A shared authority file based on VIAF, with community-driven translation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Authority network integration$q$, $q$Connects to external authority sources including IdRef, GND, and RERO RAMEAU.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Circulation & acquisitions$q$, $q$Standard library workflows for circulation, holds, and document acquisition.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Public search interface$q$, $q$A public-facing catalog for patrons to search the collection.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Modern architecture built on CERN's actively developed Invenio framework$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Strong multilingual and multi-authority-network integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Fully open source under the AGPL with public source code$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$In active production use across dozens of Swiss libraries$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Built primarily around the RERO+ network's workflows and language context$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Smaller community and documentation base than Koha or Evergreen$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Requires familiarity with the Python/Invenio stack to self-host$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Is RERO ILS open source?$q$, $q$Yes, it is released under the GNU Affero General Public License with source code publicly available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$What is RERO ILS built on?$q$, $q$It's built on the Invenio framework originally developed at CERN.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Who uses RERO ILS?$q$, $q$It was developed for and is used by RERO+, a network of libraries across Switzerland; 58 libraries migrated to it in 2021.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Can other libraries outside RERO+ adopt it?$q$, $q$The source code is public on GitHub, so technically any organization can self-host it, though it was designed around RERO+'s network needs.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Regional/cantonal library networks$q$, $q$Run a shared, multilingual ILS across a network of affiliated libraries.$q$, $q$Swiss and European library consortia$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$Academic library networks$q$, $q$Support cataloging and circulation for universities partnering on shared infrastructure.$q$, $q$Academic institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RERO ILS is a next-generation, open-source integrated library system developed in Switzerland by RERO+ in collaboration with the Catholic University of Louvain. Under heavy development since 2017 and released as v1.0 at the end of 2020, it is built on the Invenio framework originally created at CERN and is distributed under the GNU Affero General Public License, with source code hosted publicly on GitHub.$q$, $q$It manages document acquisition, circulation, and cataloging for library networks or independent libraries, and replaces traditional MARC field codes with natural-language labels. It also integrates with authority networks such as IdRef, GND, and RERO RAMEAU, and uses a multilingual authority file based on VIAF.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$RERO ILS was built for the RERO+ network of libraries across Switzerland (58 libraries went live on it in July 2021) and suits library networks — particularly multilingual or cantonal/regional ones — that want a modern, API-driven ILS and are comfortable running a Python/Invenio-based stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea0dd7b0-e3e8-4424-afc9-75a3c6224c09', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Aimeos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, high-performance PHP e-commerce framework for building shops, marketplaces, and B2B platforms on Laravel, Symfony, or TYPO3.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Aimeos is a free, open-source PHP e-commerce framework for Laravel, Symfony, and TYPO3, built for large catalogs, marketplaces, and B2B commerce.$q$,
  og_description = $q$Aimeos is a free, open-source PHP e-commerce framework for Laravel, Symfony, and TYPO3, built for large catalogs, marketplaces, and B2B commerce.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0c1eb1b8-1598-427b-9f30-311ffe09b8d3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$JSON REST & GraphQL APIs$q$, $q$API-first design for headless storefronts and integrations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Multi-vendor, multi-channel, multi-warehouse$q$, $q$Native support for marketplace-style setups with multiple sellers and stock locations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Large catalog scalability$q$, $q$Built to handle catalogs from 1 to roughly a billion items with fast page rendering.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Framework packages$q$, $q$Dedicated integration packages for Laravel, Symfony, and TYPO3.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Flexible product types$q$, $q$Supports bundles, subscriptions, and virtual products alongside standard items.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$100+ payment gateways$q$, $q$Payment integrations via the Omnipay library.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Multi-tenant capability$q$, $q$Can run multiple stores/tenants from a single installation for SaaS-style deployments.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Free, open-source core with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Deep native integration with Laravel, Symfony, and TYPO3$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Proven performance and scalability for large catalogs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Large community (45,000+ GitHub stars) and strong Capterra rating$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Requires PHP/framework development skills — not a no-code storefront builder$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Professional support and some ecosystem extensions are paid$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Less brand recognition among non-developers than platforms like Shopify$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Is Aimeos free to use?$q$, $q$Yes, the core Aimeos framework is free and open source; Aimeos GmbH separately offers paid professional support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$What PHP frameworks does Aimeos support?$q$, $q$It ships with dedicated integration packages for Laravel, Symfony, and TYPO3.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Can Aimeos power a marketplace?$q$, $q$Yes, it natively supports multiple vendors, sales channels, and warehouses.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Does Aimeos have an API?$q$, $q$Yes, it provides both JSON REST and GraphQL APIs.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Custom online shops$q$, $q$Developers building a bespoke storefront on top of Laravel or Symfony.$q$, $q$PHP developers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$Marketplaces$q$, $q$Multi-vendor marketplace platforms needing per-vendor catalogs and fulfillment.$q$, $q$Marketplace operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$B2B commerce$q$, $q$B2B platforms needing complex pricing, bundles, and subscription products.$q$, $q$B2B merchants$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Aimeos is a cloud-native, API-first PHP e-commerce framework developed by a worldwide community since 2015 and available in over 30 languages. It's designed for flexibility, performance, and scale — handling catalogs from a handful of items up to a billion — and ships as native packages for Laravel, Symfony, and TYPO3.$q$, $q$It offers JSON REST and GraphQL APIs, support for multiple vendors, sales channels, and warehouses, subscription and bundle product types, and integration with 100+ payment gateways via Omnipay. The open-source core has 45,000+ GitHub stars and 400,000+ downloads; Aimeos GmbH offers professional support and works with a network of implementation partners.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Aimeos is built for PHP developers and agencies already using Laravel, Symfony, or TYPO3 who need a fast, customizable commerce layer rather than an off-the-shelf storefront — including marketplace operators and B2B platforms needing multi-vendor or multi-warehouse support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c1eb1b8-1598-427b-9f30-311ffe09b8d3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── CoreShop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Symfony-based e-commerce framework built on top of Pimcore, free for small businesses under an open-core commercial license.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CoreShop is a Symfony e-commerce framework built on Pimcore, free for small businesses and non-profits under its open-core CCL license model.$q$,
  og_description = $q$CoreShop is a Symfony e-commerce framework built on Pimcore, free for small businesses and non-profits under its open-core CCL license model.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69b58e37-645a-40d2-a5a2-c859a6b2c481';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69b58e37-645a-40d2-a5a2-c859a6b2c481' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Symfony bundle architecture$q$, $q$Ships as modular Symfony bundles that plug into the full-stack framework.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Pimcore integration$q$, $q$Built directly on Pimcore's PIM/DAM data model for product-data-driven commerce.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Customizable checkout & shipping$q$, $q$Extendable notification, shipping, and checkout logic.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Pimcore Studio admin (React/TypeScript)$q$, $q$A rewritten admin interface with per-bundle Studio plugins using module federation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Doctrine ORM data layer$q$, $q$Standard Symfony/Doctrine persistence layer for extending data models.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Deep, native integration with Pimcore's product information management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Free in production for small businesses, non-profits, and qualifying education use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Highly customizable Symfony/Doctrine architecture$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Actively developed on GitHub with commercial backing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$No longer a traditional open-source license — larger organizations need a paid CCL license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Requires Pimcore plus Symfony/PHP expertise to run$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Licensing model is more complex than a straightforward free/open-source or SaaS pricing structure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Is CoreShop free?$q$, $q$It's free for production use if your organization's annual revenue is under roughly €5 million, or if you qualify as a non-profit or educational organization; larger companies need a paid CCL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Is CoreShop open source?$q$, $q$Its source code is publicly viewable on GitHub, but under the CoreShop Commercial License it is not licensed as traditional open-source software — it follows an open-core model.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Does CoreShop require Pimcore?$q$, $q$Yes, CoreShop is built as a set of Symfony bundles on top of Pimcore's PIM/DAM platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Who is CoreShop best suited for?$q$, $q$Organizations already invested in Pimcore for product data management that want e-commerce built on the same data model.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Pimcore-based commerce$q$, $q$Businesses already using Pimcore for PIM who want commerce on the same platform.$q$, $q$Existing Pimcore users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Custom B2B/B2C shops$q$, $q$Developers building highly customized storefronts on Symfony.$q$, $q$PHP/Symfony developers and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$Free (under revenue threshold)$q$, $q$Free$q$, $q$N/A$q$, $q$["Production use for orgs under ~€5M annual revenue","Free for qualifying non-profits and education","Free for demos and proofs of concept"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$CoreShop Commercial License (CCL)$q$, $q$Custom$q$, $q$custom$q$, $q$["Required for larger enterprises and Pimcore Professional/Enterprise customers","Licensed use of the full CoreShop Suite"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CoreShop is an e-commerce framework built as a set of Symfony bundles on top of Pimcore, the PHP product information management (PIM) and digital asset management (DAM) platform. It's built with Symfony and Doctrine ORM and is designed for deep customization of checkout, shipping, notifications, and localization.$q$, $q$CoreShop's source code is publicly available on GitHub, but as of its CoreShop Commercial License (CCL) it operates on an open-core model rather than a traditional open-source license: production use is free for organizations under roughly €5 million in annual revenue and for qualifying non-profits and educational institutions, while larger enterprises — including those on Pimcore Professional or Enterprise licenses — need a paid CCL license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CoreShop is aimed at businesses already using or planning to use Pimcore for product data management who want commerce functionality built directly on top of it, and at developers comfortable working in a Symfony/Doctrine codebase. Small businesses and non-profits under the revenue threshold can run it in production at no cost.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69b58e37-645a-40d2-a5a2-c859a6b2c481', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── EverShop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source TypeScript e-commerce platform built on Node.js, React, and GraphQL for developers who want full control over their store.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$EverShop is a free, open-source TypeScript e-commerce platform built on Node.js, React, and GraphQL for developer-driven online stores.$q$,
  og_description = $q$EverShop is a free, open-source TypeScript e-commerce platform built on Node.js, React, and GraphQL for developer-driven online stores.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0cb0a80b-0a80-4999-85e6-81d72d140ab9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0cb0a80b-0a80-4999-85e6-81d72d140ab9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$GraphQL API$q$, $q$A GraphQL layer for querying storefront and catalog data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$React-based storefront widgets$q$, $q$Dynamic, customizable widgets for building storefront layouts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Product & catalog management$q$, $q$Tools for managing products, categories, and collections.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Built-in payments$q$, $q$Native support for Stripe and PayPal checkout.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Third-party integrations$q$, $q$Integrates with services such as Mailchimp and Algolia.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Order tracking$q$, $q$Real-time order status and tracking for customers and staff.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Modern TypeScript/Node.js/React stack familiar to web developers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Fully open source (GPL-3.0) with an active GitHub community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$GraphQL-first architecture suited to headless or custom storefronts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$No licensing fees for self-hosting$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$GPL-3.0 copyleft license may restrict proprietary derivative products$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Official cloud-hosted offering is not yet available$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Younger project with a smaller plugin/theme ecosystem than established platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Is EverShop free?$q$, $q$Yes, EverShop is free, open-source software licensed under GPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$What tech stack does EverShop use?$q$, $q$Node.js/Express and PostgreSQL on the backend, React and GraphQL on the frontend, styled with TailwindCSS/Sass.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Is there a hosted/cloud version?$q$, $q$A cloud-hosted option is listed as 'coming soon' on the official EverShop site; currently it's offered as self-hosted software.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Does EverShop support Stripe and PayPal?$q$, $q$Yes, both are supported as built-in payment providers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Custom headless storefronts$q$, $q$Developers building a GraphQL-driven storefront with full control over the frontend.$q$, $q$JavaScript/TypeScript developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$Agency client stores$q$, $q$Agencies building customized Node.js-based stores for clients.$q$, $q$Web development agencies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$EverShop is an open-source e-commerce platform built with TypeScript, Node.js/Express, React, and GraphQL, backed by PostgreSQL and styled with TailwindCSS/Sass. It's released under the GPL-3.0 license and hosted on GitHub, with a modular, fully customizable architecture aimed at developers rather than non-technical store owners.$q$, $q$It includes dynamic storefront widgets, product/category/collection management, and built-in support for Stripe and PayPal payments plus integrations such as Mailchimp and Algolia. A cloud-hosted version is listed as 'coming soon' on the official site, so today the platform is offered as free, self-hosted software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$EverShop targets JavaScript/TypeScript developers and agencies who want a modern, code-first, GraphQL-driven commerce backend they can fully customize, rather than a drag-and-drop or SaaS storefront builder.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0cb0a80b-0a80-4999-85e6-81d72d140ab9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Microweber ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source drag-and-drop CMS and website builder with built-in e-commerce, free to self-host or available on paid cloud hosting plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted) or from $10/month (cloud)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Bulgaria$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Microweber is an open-source drag-and-drop CMS, website builder, and e-commerce platform, free to self-host or available on paid cloud plans from $10/month.$q$,
  og_description = $q$Microweber is an open-source drag-and-drop CMS, website builder, and e-commerce platform, free to self-host or available on paid cloud plans from $10/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa18bfe8-dba3-4e07-9d0c-7fd408d29121';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa18bfe8-dba3-4e07-9d0c-7fd408d29121' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Drag-and-drop builder$q$, $q$Visual, no-code page building interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$450+ layouts and 75+ modules$q$, $q$Large library of pre-built templates and modules to assemble pages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Built-in CMS$q$, $q$Content management for pages, blogs, and site structure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$E-commerce$q$, $q$Built-in online store functionality alongside the CMS and builder.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Multi-language support$q$, $q$Tools for building and managing sites in multiple languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$AI-assisted site building$q$, $q$AI-based tooling positioned to help build functional websites without coding.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Free to self-host with full source access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Drag-and-drop builder lowers the technical barrier to launching a site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Combines CMS, website builder, and e-commerce in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Large install base (100,000+ installations)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Higher-capacity features (more sites, storage, support) require paid cloud plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Drag-and-drop builders can limit deep custom development compared to code-first frameworks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Documentation and marketing are geared more toward agencies/non-developers than engineers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Is Microweber free?$q$, $q$Yes, the open-source version is free to download and self-host. Microweber also sells separate cloud-hosted plans starting at $10/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Can I self-host Microweber?$q$, $q$Yes, the open-source CMS/builder can be downloaded and self-hosted at no cost.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$What do the paid cloud plans include?$q$, $q$Cloud plans add managed hosting, more websites, storage, and support, ranging from a Personal plan up to Business and custom Enterprise tiers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Who runs Microweber?$q$, $q$The project is backed by the Microweber Academy Foundation, a non-profit registered in Bulgaria.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Agency client sites$q$, $q$Web studios and agencies building multiple client websites quickly.$q$, $q$Web agencies and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Small business websites and stores$q$, $q$Non-technical business owners launching a site or online store.$q$, $q$Small businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source code","Self-managed hosting","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Personal$q$, $q$$10/month$q$, $q$monthly$q$, $q$["1 website","Unlimited pages","1GB storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Freelancer$q$, $q$$25/month$q$, $q$monthly$q$, $q$["5 websites","Unlimited pages","5GB storage"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Agency$q$, $q$$50/month$q$, $q$monthly$q$, $q$["10 websites","Unlimited pages","20GB storage"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Business$q$, $q$$75/month$q$, $q$monthly$q$, $q$["15 websites","Unlimited pages","Unlimited storage"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["20+ websites","Unlimited pages","Unlimited storage"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Microweber is an open-source drag-and-drop website builder and CMS that also includes e-commerce functionality, with over 100,000 installations worldwide. It ships with 450+ pre-built layouts and 75+ modules, and can be downloaded and self-hosted for free, or run through Microweber's own cloud-hosted plans.$q$, $q$The project is backed by the Microweber Academy Foundation, a non-profit public benefit organization registered in Bulgaria. Its site positions the product as an AI-assisted platform for building websites without coding knowledge, aimed particularly at web studios and marketing agencies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Microweber suits freelancers, agencies, and small businesses that want a no-code, drag-and-drop way to launch a website, blog, or online store — either self-hosted for free, or on a managed cloud plan for convenience and support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa18bfe8-dba3-4e07-9d0c-7fd408d29121', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── s-cart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Laravel-based shopping cart and CMS platform for building online stores, part of the GP247 ecosystem.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$s-cart is a free, open-source Laravel e-commerce platform with built-in CMS, multi-vendor support, and an API, part of the GP247 ecosystem.$q$,
  og_description = $q$s-cart is a free, open-source Laravel e-commerce platform with built-in CMS, multi-vendor support, and an API, part of the GP247 ecosystem.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '73e6abda-a9cd-47e5-b644-042f92c64ac5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '73e6abda-a9cd-47e5-b644-042f92c64ac5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Laravel-based cart & checkout$q$, $q$Built on the Laravel framework with modern PHP and Tailwind CSS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Built-in CMS$q$, $q$Content management for store pages alongside commerce features.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Multi-language & multi-currency$q$, $q$Supports selling in multiple languages and currencies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Multi-vendor & multi-store$q$, $q$Can run multiple vendors or multiple storefronts from one installation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Role-based admin & audit logging$q$, $q$Granular admin permissions with security audit logs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$API support$q$, $q$APIs for mobile apps and third-party integrations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Discount & tax engine$q$, $q$Built-in tools for discounts and tax calculation.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Fully free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Built on the modern Laravel framework$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Supports multi-vendor and multi-store setups out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Active development on GitHub under the GP247 organization$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Smaller international community/ecosystem than platforms like Magento or WooCommerce$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Documentation and community are less English-centric than larger Western projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Requires PHP/Laravel hosting knowledge to deploy and maintain$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Is s-cart free?$q$, $q$Yes, s-cart is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$What framework is s-cart built on?$q$, $q$It's built on the Laravel PHP framework as part of the GP247 ecosystem.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Can s-cart run multiple stores?$q$, $q$Yes, it supports multi-vendor and multi-store configurations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Where can I get the source code?$q$, $q$The source is hosted on GitHub under the s-cart/GP247 organization.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Budget-friendly online stores$q$, $q$Small businesses launching a store without licensing costs.$q$, $q$Small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Custom Laravel storefronts$q$, $q$Developers wanting a Laravel-native cart to extend and customize.$q$, $q$Laravel/PHP developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$Multi-vendor marketplaces$q$, $q$Builders needing multi-vendor or multi-store support out of the box.$q$, $q$Marketplace operators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$s-cart is a free, open-source e-commerce platform built on the Laravel PHP framework as part of the GP247 ecosystem, licensed under MIT. It combines a shopping cart, checkout, and order management with a built-in CMS, and is maintained on GitHub under the GP247/s-cart organization.$q$, $q$The platform includes multi-language and multi-currency support, multi-vendor and multi-store capability, role-based admin permissions with security audit logging, payment and shipping plugins, and an API for mobile and third-party integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$s-cart is aimed at developers and small businesses who want a free, Laravel-native shopping cart they can self-host and customize, including those building multi-vendor or multi-store setups on a budget.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73e6abda-a9cd-47e5-b644-042f92c64ac5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Thelia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source PHP/Symfony e-commerce platform used since 2005 by 1,500+ merchants, maintained by French company OpenStudio.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2005,
  company_size = $q$~100 employees (OpenStudio, the company behind Thelia)$q$,
  headquarters = $q$France$q$,
  languages = '{}',
  seo_meta_description = $q$Thelia is an open-source PHP/Symfony e-commerce platform used by 1,500+ merchants since 2005, maintained by French company OpenStudio.$q$,
  og_description = $q$Thelia is an open-source PHP/Symfony e-commerce platform used by 1,500+ merchants since 2005, maintained by French company OpenStudio.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3dd97986-493e-470c-90a6-4ef415e3a585';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3dd97986-493e-470c-90a6-4ef415e3a585' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Symfony-based architecture$q$, $q$Built on the Symfony framework for structured, standardized development.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$API Platform integration$q$, $q$Interoperability with ERP, PIM, and CRM systems via API Platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$300+ modules$q$, $q$A module ecosystem for extending checkout, shipping, payments, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Headless/microservices support$q$, $q$Can be run in headless or microservices-based architectures.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Twig + Symfony UX frontend$q$, $q$Modern templating and frontend interactivity via Symfony UX.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$MariaDB data layer$q$, $q$Relational database backend for store and catalog data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Mature project with two decades of production use in French e-commerce$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Backed by an established, certified company (OpenStudio) rather than a loose community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Fully open source and self-hostable with no vendor lock-in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$API-first design for integrating with ERP/PIM/CRM systems$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Smaller international/English-language community than platforms like Magento or PrestaShop$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Primarily French-market focused in its community and module ecosystem$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Requires Symfony/PHP development expertise to run and extend$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Is Thelia free?$q$, $q$Yes, Thelia is open-source software; the code is hosted publicly on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Who maintains Thelia?$q$, $q$OpenStudio, a French software company with about 100 employees, stewards Thelia's development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$What framework is Thelia built on?$q$, $q$PHP and Symfony, with API Platform, MariaDB, and Twig/Symfony UX.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Does Thelia support headless commerce?$q$, $q$Yes, it supports headless and microservices-based architectures.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$French/European online stores$q$, $q$Merchants wanting full control of infrastructure and data.$q$, $q$French and European merchants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$ERP/PIM/CRM-integrated commerce$q$, $q$Businesses needing commerce tightly integrated with existing business systems.$q$, $q$Mid-size and enterprise merchants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$Custom Symfony storefronts$q$, $q$Developers building a bespoke commerce backend on Symfony.$q$, $q$PHP/Symfony developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Thelia is a French open-source e-commerce platform that has powered over 1,500 online stores in France and internationally since 2005. It's built on PHP and Symfony, using API Platform for interoperability with ERP, PIM, and CRM systems, MariaDB for storage, and Twig with Symfony UX for the frontend.$q$, $q$Development is stewarded by OpenStudio, a French software company with roughly 100 employees that holds ISO 9001 and Numérique Responsable certifications and is a member of French Tech. The project's source is hosted on GitHub, with 300+ available modules and support for headless/microservices architectures.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Thelia is aimed at merchants and developers — especially in France and Europe — who want full infrastructure control and an API-first Symfony-based commerce platform that integrates cleanly with existing ERP, PIM, or CRM systems, rather than a hosted SaaS storefront.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3dd97986-493e-470c-90a6-4ef415e3a585', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── CommaFeed ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Google Reader-inspired RSS feed reader that can be self-hosted or used free at commafeed.com.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CommaFeed is a free, open-source, Google Reader-inspired RSS reader you can self-host via Docker or use free at commafeed.com.$q$,
  og_description = $q$CommaFeed is a free, open-source, Google Reader-inspired RSS reader you can self-host via Docker or use free at commafeed.com.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c3476f2a-8c51-4b81-9db1-f7d876d3be6b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c3476f2a-8c51-4b81-9db1-f7d876d3be6b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Self-hosted via Docker$q$, $q$Official Docker images make self-hosting straightforward.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Free public instance$q$, $q$A free, ad-free, donation-funded hosted instance at commafeed.com.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$REST & Fever-compatible API$q$, $q$Lets third-party RSS client apps connect to a CommaFeed instance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$OPML import/export$q$, $q$Move subscriptions in and out of CommaFeed easily.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Multiple layouts & themes$q$, $q$Four layout options plus light and dark themes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Automatic read rules & push notifications$q$, $q$Rule-based automatic marking of items as read, plus push notifications for new content.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Browser extension$q$, $q$A companion browser extension for quick subscribing and reading.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Completely free — self-hosted or on the hosted instance, with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Apache-2.0 open source with active GitHub development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Fever API compatibility works with many existing third-party RSS apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$The public hosted instance is funded by donations, not ads or data sales$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$No official first-party mobile app — relies on the browser or Fever-compatible third-party clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Feature set is simpler than some modern read-it-later/RSS tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Self-hosting means running a Java/Quarkus stack and database$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Is CommaFeed free?$q$, $q$Yes, it's completely free — both to self-host and to use on the public commafeed.com instance.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Can I self-host CommaFeed?$q$, $q$Yes, official Docker images make self-hosting straightforward.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Does CommaFeed have a mobile app?$q$, $q$There's no official first-party mobile app; users typically rely on the responsive web interface or third-party Fever-compatible apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$What is the Fever API used for?$q$, $q$It lets CommaFeed work as a backend for existing RSS client apps that support the Fever API standard.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Personal RSS reading$q$, $q$Individuals wanting a Google Reader-style feed reader.$q$, $q$Individual RSS users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Privacy-focused self-hosting$q$, $q$Users who want to keep their reading data under their own control.$q$, $q$Privacy-conscious self-hosters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$Custom RSS client development$q$, $q$Developers building their own RSS client against CommaFeed's REST/Fever API.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CommaFeed is a free, open-source RSS feed reader inspired by Google Reader, built with a Java/Quarkus backend and a React/TypeScript frontend, and released under the Apache-2.0 license. It can be self-hosted via official Docker images or used through the free public instance at commafeed.com, which the maintainers say has no ads or tracking and is funded entirely by donations.$q$, $q$It offers four customizable layouts, light/dark themes, keyboard shortcuts, OPML import/export, a REST API, a Fever-compatible API for use with existing RSS client apps, automatic read rules, push notifications, and a browser extension. The project is designed to scale to thousands of users and millions of feeds.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CommaFeed suits people who want a Google Reader-style RSS reading experience — either self-hosted for full control and privacy, or via the free hosted instance — as well as developers who want to build custom RSS clients against its REST or Fever-compatible API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3476f2a-8c51-4b81-9db1-f7d876d3be6b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


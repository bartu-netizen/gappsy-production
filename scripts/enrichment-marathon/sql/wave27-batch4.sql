-- Enrichment marathon batch: Suricata, Suroi, SurrealDB, SurveyJS, SurveyMonkey, SvelteKit, Svix, Swapcard

-- ── Suricata ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Suricata is a free, open-source network intrusion detection (IDS), intrusion prevention (IPS), and network security monitoring (NSM) engine maintained by the Open Information Security Foundation (OISF).$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2009, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Suricata: Open-Source Network IDS, IPS and NSM Engine$q$, seo_title),
  seo_meta_description = COALESCE($q$Suricata is a free, open-source network threat detection engine offering IDS, IPS, and NSM. Built and maintained by the nonprofit OISF community.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Suricata is a free, open-source network intrusion detection system (IDS), intrusion prevention system (IPS), and network security monitoring (NSM) engine. It is developed and maintained by the Open Information Security Foundation (OISF), a nonprofit organization that began work on the project around 2007 and released the first public beta at the end of 2009, with initial funding support from the US Department of Homeland Security and a consortium of private security vendors. Suricata is used by enterprises, government agencies, managed security service providers, and commercial security vendors who embed it into their own products. It is multi-threaded for high-performance packet processing, supports deep packet inspection, protocol detection, Lua scripting, JSON (EVE) event output, TLS and JA3 fingerprinting, and file extraction. It is compatible with Snort-style rules and works with community rule sets such as Emerging Threats Open. Suricata is entirely free to download and self-host, released as open source under the GNU General Public License, with no official paid tier from OISF itself, though third-party vendors like Stamus Networks offer commercial support and management platforms built around it. It is best suited for security teams with the networking expertise to deploy and tune an inline or passive detection engine.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6ee44c6e-b374-4911-ad78-9275dc36fec8' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Multi-threaded detection engine$q$, $q$Processes network traffic across multiple CPU cores for higher throughput than legacy single-threaded IDS engines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$IDS, IPS, and NSM modes$q$, $q$Can run passively for detection and monitoring or inline as an intrusion prevention system that actively blocks traffic.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Deep packet inspection$q$, $q$Inspects traffic across many protocols with automatic protocol detection independent of the port used.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$JSON (EVE) logging$q$, $q$Outputs structured event logs that integrate with SIEMs, Elasticsearch, and dashboards like EveBox.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Snort-compatible rule language$q$, $q$Works with existing Snort-style rules and community rule sets such as Emerging Threats Open.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$TLS and JA3 fingerprinting$q$, $q$Identifies encrypted traffic characteristics and client/server fingerprints without decrypting payloads.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Lua scripting$q$, $q$Allows custom detection logic beyond standard rule syntax for advanced use cases.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Hardware acceleration support$q$, $q$Supports AF_PACKET, DPDK, and eBPF/XDP for high-throughput packet capture and processing.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Completely free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$High-performance multi-threaded engine suited for large networks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Vendor-neutral governance backed by a nonprofit foundation and industry consortium$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Flexible deployment as IDS, IPS, or NSM$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Broad ecosystem of compatible rule sets and third-party tooling$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Steep learning curve for writing and tuning detection rules$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Requires strong networking and security expertise to deploy at scale$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$No built-in graphical management console out of the box$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$No official commercial support directly from OISF$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Effective use depends heavily on quality of external rule feeds$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Is Suricata free to use?$q$, $q$Yes. Suricata is fully open source under the GNU General Public License and free to download, deploy, and use without licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$What is Suricata used for?$q$, $q$Suricata is used for network intrusion detection, intrusion prevention, and network security monitoring, helping security teams identify and block malicious network activity.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Who maintains Suricata?$q$, $q$Suricata is developed and maintained by the Open Information Security Foundation (OISF), a nonprofit organization, along with an open community of contributors.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$How is Suricata different from Snort?$q$, $q$Suricata was built as a multi-threaded alternative to Snort, offering higher performance on multi-core hardware while remaining compatible with Snort-style rules.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Can Suricata run inline as an IPS?$q$, $q$Yes, Suricata can be deployed inline to actively block malicious traffic in addition to running passively as a detection and monitoring tool.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Does Suricata include a management dashboard?$q$, $q$No built-in GUI is included, but Suricata integrates with third-party tools like EveBox, Security Onion, and SELKS for visualization and management.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$What rule sets work with Suricata?$q$, $q$Suricata supports Snort-compatible rules and is commonly paired with community rule feeds such as Emerging Threats Open, plus commercial feeds from vendors.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Is commercial support available for Suricata?$q$, $q$OISF itself does not sell commercial support, but third-party vendors such as Stamus Networks offer commercial products and support built on Suricata.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Enterprise network security monitoring$q$, $q$Security teams deploy Suricata to continuously inspect network traffic and detect threats across corporate networks.$q$, $q$Enterprise security and SOC teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Managed security service delivery$q$, $q$MSSPs embed Suricata into their monitoring stack to deliver threat detection services to multiple clients.$q$, $q$Managed security service providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Critical infrastructure and government threat detection$q$, $q$Government agencies and critical infrastructure operators use Suricata for vendor-neutral, auditable network threat detection.$q$, $q$Government and critical infrastructure security teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$Suricata (Open Source)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full IDS, IPS, and NSM engine","Source code available under GPL","Compatible with community rule sets like Emerging Threats Open","Free to self-host indefinitely"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '6ee44c6e-b374-4911-ad78-9275dc36fec8';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$overview$q$, $q$What Is Suricata$q$, 2, ARRAY[$q$Suricata is a high-performance, open-source network analysis and threat detection engine that functions as an intrusion detection system (IDS), intrusion prevention system (IPS), and network security monitoring (NSM) tool. It inspects network traffic in real time, matching packets against rule sets to flag or block malicious activity.$q$, $q$The project is developed and governed by the Open Information Security Foundation (OISF), a 501(c)(3) nonprofit created to build a next-generation, vendor-neutral IDS/IPS engine as an alternative to existing tools. Development began in the mid-to-late 2000s under founders including Matt Jonkman and Victor Julien, with the first public beta released at the end of 2009.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Suricata's multi-threaded architecture allows it to process high volumes of network traffic more efficiently than older single-threaded engines. It supports deep packet inspection across dozens of protocols, automatic protocol detection regardless of port, and a Lua scripting interface for custom detection logic.$q$, $q$Output is available in structured JSON (EVE) format, making it easy to feed into SIEM platforms and tools like Elasticsearch or Security Onion. Suricata also performs file extraction, TLS and JA3/JA3S fingerprinting, and supports hardware acceleration through AF_PACKET, DPDK, and eBPF/XDP for high-throughput deployments.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Suricata is completely free and open source under the GNU General Public License. There is no paid tier, subscription, or license fee from OISF for using the core engine.$q$, $q$Organizations that want commercial support, managed rule feeds, or a bundled management console typically turn to third-party vendors such as Stamus Networks, which build commercial products and services around the open-source Suricata engine.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6ee44c6e-b374-4911-ad78-9275dc36fec8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Suroi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Suroi is a free, open-source 2D battle royale game that runs directly in the browser, inspired by surviv.io.$q$, short_description),
  pricing_model = COALESCE($q$free$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Suroi: Free Open-Source 2D Battle Royale Browser Game$q$, seo_title),
  seo_meta_description = COALESCE($q$Suroi is a free, open-source 2D battle royale game playable instantly in your browser, inspired by surviv.io. No download required.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Suroi is a free, open-source 2D battle royale game that players can access instantly through a web browser without downloading or installing anything. It is developed by HasangerGames, an open-source game development team, with the project's codebase first appearing publicly around 2023. Suroi is explicitly inspired by the earlier browser battle royale game surviv.io and recreates a similar top-down, last-player-standing gameplay loop featuring a shrinking safe zone, a variety of firearms and melee weapons, loot collection, and real-time player statistics such as kills and survival streaks. The game regularly ships limited-time seasonal content, including Halloween and winter-themed events with unique mechanics like ice physics, along with alternate modes such as sniper-only spawns. Suroi's source code is publicly available on GitHub under an open-source license, and the project supports self-hosting for communities that want to run private servers. There is no cost to play, no premium currency, and no company behind it in the traditional sense — it is a community-maintained project rather than a commercial SaaS product. It is best suited for casual browser gamers seeking quick matches and for developers curious about studying or contributing to an open-source multiplayer game engine.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Browser-based gameplay$q$, $q$Play instantly at suroi.io with no download, install, or account setup required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Top-down 2D battle royale$q$, $q$Classic last-player-standing gameplay with a shrinking safe zone and loot-based progression.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Varied weapon loadouts$q$, $q$Includes sniper rifles, bows, shotguns, and melee weapons for different playstyles.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Seasonal limited-time events$q$, $q$Regularly rotating Halloween, winter, and other themed modes with unique mechanics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Open-source codebase$q$, $q$Full source code is publicly available on GitHub for inspection and contribution.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Self-hosting support$q$, $q$Communities can run their own private Suroi server instance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Customizable HUD and graphics$q$, $q$Adjustable graphics quality, crosshairs, emotes, and performance display options.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Active community wiki$q$, $q$A dedicated wiki documents weapons, mechanics, and updates maintained by the community.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Completely free with no purchases or premium currency$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$No download or installation needed to start playing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Open-source and self-hostable for private communities$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Actively updated with new seasonal content$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Lightweight enough to run in most modern browsers$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Still labeled a work in progress with occasional bugs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Smaller player base than major commercial battle royale titles$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$No official monetization means limited dedicated support resources$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Performance can vary depending on device and browser$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Feature set and stability can change quickly between updates$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is Suroi free to play?$q$, $q$Yes, Suroi is completely free with no purchases, subscriptions, or premium currency.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Do I need to download anything to play Suroi?$q$, $q$No, Suroi runs directly in a web browser at suroi.io with no installation required.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Who created Suroi?$q$, $q$Suroi is developed by HasangerGames, an open-source game development team, with its source code hosted on GitHub.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is Suroi open source?$q$, $q$Yes, Suroi's full source code is publicly available and open to community contributions.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Can I self-host Suroi?$q$, $q$Yes, because the code is open source, technically capable users can run their own private server instance.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$What inspired Suroi?$q$, $q$Suroi is explicitly inspired by the earlier browser battle royale game surviv.io.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is there mobile support for Suroi?$q$, $q$The project maintains related repositories exploring iOS and Android access in addition to the core browser game.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is Suroi actively updated?$q$, $q$Yes, the game receives regular updates including seasonal events and new content.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Quick casual matches$q$, $q$Players looking for a fast, no-commitment battle royale match without downloads.$q$, $q$Casual browser gamers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Studying open-source game development$q$, $q$Developers exploring or contributing to a real-world open-source multiplayer game codebase.$q$, $q$Developers and game programming students$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Private community servers$q$, $q$Gaming communities self-hosting their own Suroi instance for private matches.$q$, $q$Gaming communities and server operators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Suroi$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Free browser-based gameplay","No account required to play","Open-source code available on GitHub","Self-hosting option for private servers"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$overview$q$, $q$What Is Suroi$q$, 2, ARRAY[$q$Suroi is a free, open-source 2D battle royale game that runs entirely in a web browser. Players drop into a shrinking map, scavenge weapons and gear, and fight to be the last one standing, in a style directly inspired by the earlier browser hit surviv.io.$q$, $q$The game is built and maintained by HasangerGames, with active development visible on GitHub. Because it is open source, anyone can inspect the code, contribute changes, or self-host their own server instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Suroi offers classic battle royale mechanics: a shrinking safe zone, varied loot including sniper rifles, bows, and melee weapons, and real-time tracking of kills and survival streaks. The interface includes a minimap, gas timer, and configurable HUD and graphics settings ranging from low-end to 1080p.$q$, $q$The developers regularly release limited-time seasonal events, such as Halloween and winter modes with special mechanics like ice physics, as well as alternate spawn and squad configurations to keep matches fresh.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Suroi is entirely free to play with no purchase required, no premium currency, and no paywalled content on the official site.$q$, $q$Because the source code is open, technically inclined users can self-host their own instance at no cost beyond their own server hosting expenses.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SurrealDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SurrealDB is a multi-model database combining document, graph, relational, and vector data in a single engine, usable embedded, self-hosted, or via SurrealDB Cloud.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SurrealDB: Multi-Model Database for Modern Applications$q$, seo_title),
  seo_meta_description = COALESCE($q$SurrealDB is a multi-model database with document, graph, relational, and vector support. Free to self-host or use SurrealDB Cloud from $0.021/hr.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SurrealDB is a multi-model database that unifies document, graph, relational, vector, and time-series data handling within a single engine, aiming to replace the need to combine several specialized databases in one application stack. It was founded in 2021 by brothers Tobie Morgan Hitchcock (CEO) and Jaime Morgan Hitchcock (COO), and is headquartered in London, United Kingdom, with a team of roughly 45 people as of 2025. The company has raised over 40 million dollars in venture funding, including a Series A extension backed by investors such as FirstMark, Georgian, Chalfen Ventures, and Begin Capital. SurrealDB uses its own query language, SurrealQL, supports real-time live queries, ACID transactions, built-in authentication and permissions, and can run embedded in an application, self-hosted on a server, or through the managed SurrealDB Cloud service. It targets serverless, JAMstack, and AI-driven applications that need vector search alongside traditional relational or graph queries. The core database is source-available and free to self-host, while SurrealDB Cloud uses usage-based pricing starting with a free instance and scaling to per-node hourly rates, plus a custom-priced Enterprise tier for self-hosted or private-cloud deployments with SSO, audit logging, and SLA guarantees.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Multi-model data engine$q$, $q$Combines document, graph, relational, vector, and time-series capabilities in one database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$SurrealQL query language$q$, $q$A purpose-built query language designed to express complex multi-model queries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Real-time live queries$q$, $q$Pushes live updates to connected clients as underlying data changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Built-in auth and permissions$q$, $q$Row-level authentication and access control are handled natively in the database.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Flexible deployment$q$, $q$Runs embedded in an app, self-hosted on a server, or as a managed SurrealDB Cloud instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Native vector search$q$, $q$Supports vector data types and search for AI and retrieval-augmented generation use cases.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$ACID transactions$q$, $q$Provides transactional consistency guarantees across multi-model operations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Horizontal and vertical scaling$q$, $q$SurrealDB Cloud scales from a single free instance up to multi-region, multi-node clusters.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Replaces multiple specialized databases with a single multi-model engine$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Flexible deployment options from embedded to fully managed cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Free tier and free self-hosted use for prototyping and small projects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Well-funded with backing from established venture investors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Native vector search suited to modern AI application needs$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Newer database with a shorter production track record than established systems$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Some advanced cloud features like branching and forking are still rolling out$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$SurrealQL requires learning a new query language distinct from standard SQL$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Source-available licensing terms may require review for some enterprise use cases$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Smaller ecosystem of third-party tools and integrations compared to legacy databases$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Is SurrealDB free?$q$, $q$Yes, the core database can be self-hosted for free, and SurrealDB Cloud offers a free starting instance with usage-based pricing beyond that.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$What is SurrealDB used for?$q$, $q$SurrealDB is used to store and query document, graph, relational, and vector data within a single database, commonly for serverless, JAMstack, and AI-powered applications.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Who founded SurrealDB?$q$, $q$SurrealDB was founded in 2021 by brothers Tobie Morgan Hitchcock and Jaime Morgan Hitchcock.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Where is SurrealDB headquartered?$q$, $q$SurrealDB is headquartered in London, United Kingdom.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Can SurrealDB replace Postgres and MongoDB together?$q$, $q$SurrealDB aims to cover relational and document use cases in one engine, though teams should evaluate it against their specific workload requirements before migrating.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Does SurrealDB support vector search for AI?$q$, $q$Yes, SurrealDB includes native vector data types and search capabilities suited to AI and retrieval-augmented generation applications.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Can I self-host SurrealDB?$q$, $q$Yes, SurrealDB can be self-hosted on your own infrastructure at no licensing cost for the core engine.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$What is SurrealQL?$q$, $q$SurrealQL is SurrealDB's purpose-built query language designed to express document, graph, relational, and vector queries.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Unified data layer for serverless apps$q$, $q$Startups use SurrealDB as a single database for document, relational, and graph data in serverless and JAMstack applications.$q$, $q$Startups and application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$AI and retrieval-augmented generation$q$, $q$AI teams combine vector search with relational and graph data in one engine for RAG and semantic search pipelines.$q$, $q$AI and machine learning engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Database consolidation for enterprises$q$, $q$Enterprises use SurrealDB to reduce the number of specialized databases they operate and maintain.$q$, $q$Enterprise engineering and platform teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Source-available core database","Run on your own infrastructure","Full multi-model feature set"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Start (Cloud)$q$, $q$Free instance, then from $0.021/hr$q$, $q$usage-based$q$, NULL, $q$["1GB free storage forever","Vertical scaling to terabytes","Automatic burst scaling","Daily automated backups","Cloud RBAC and ABAC"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Scale (Cloud)$q$, $q$From $0.192/node/hr$q$, $q$usage-based$q$, NULL, $q$["Highly available, fault-tolerant architecture","Multiple availability-zone deployment","Horizontal scaling to petabytes","Multi-region disaster recovery"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Self-hosted or private cloud deployment","Audit logging and compliance","SSO and advanced access controls","SLA-backed uptime guarantees","FIPS-compliant cryptography"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '6c12f04e-e703-497a-b9ff-e4bd73be6bd0';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$overview$q$, $q$What Is SurrealDB$q$, 2, ARRAY[$q$SurrealDB is a multi-model database designed to replace the common pattern of stitching together separate document, graph, relational, and vector databases within a single application. It provides document, graph, relational, and vector capabilities through one unified engine and query language called SurrealQL.$q$, $q$Founded in 2021 by brothers Tobie and Jaime Morgan Hitchcock and headquartered in London, SurrealDB has raised over 40 million dollars from investors including FirstMark and Georgian, and offers the database as an embeddable engine, a self-hosted server, or a managed cloud service called SurrealDB Cloud.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SurrealDB supports real-time live queries that push updates to connected clients as data changes, along with ACID-compliant transactions, built-in row-level authentication and permissions, and native vector search for AI and retrieval-augmented applications.$q$, $q$It can be embedded directly into an application as a single binary or WebAssembly module, deployed self-hosted, or run through SurrealDB Cloud, which offers vertical scaling on its Start tier and horizontal, multi-availability-zone scaling on its Scale tier. Some advanced cloud capabilities, such as database branching and forking, are planned for a future release.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6c12f04e-e703-497a-b9ff-e4bd73be6bd0', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SurrealDB can be self-hosted for free using its source-available core. SurrealDB Cloud offers a Start plan with one free instance and 1GB of free storage, then usage-based pricing beginning around $0.021 per hour.$q$, $q$The Scale plan is priced per node per hour, starting around $0.192, and adds multi-availability-zone deployment and multi-region disaster recovery. An Enterprise tier offers custom pricing for self-hosted or private-cloud deployments with SSO, audit logging, and SLA-backed uptime.$q$]::text[], 2);


-- ── SurveyJS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SurveyJS is an open-source JavaScript library suite that lets developers build and embed custom surveys, forms, and dashboards directly inside their own web applications.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE($q$Tallinn, Estonia$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SurveyJS: Open-Source JavaScript Form and Survey Library$q$, seo_title),
  seo_meta_description = COALESCE($q$SurveyJS is an open-source JS library for embedding custom surveys and forms in your own app. Free Form Library, paid Creator from $569 one-time.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SurveyJS is an open-source suite of JavaScript libraries that developers use to build, render, and embed custom surveys, forms, and dashboards inside their own web applications, rather than hosting surveys on a third-party site. It is developed by Devsoft Baltic OU, a small Estonian software company founded in 2015 and headquartered in Tallinn, Estonia, with a lean team of roughly two to ten people. SurveyJS is distinct from hosted survey products like SurveyMonkey: it is a developer tool that renders forms defined as JSON directly inside a company's own application, so all response data stays on the company's own servers rather than a third-party platform. The core Form Library is MIT-licensed and free to use with unlimited forms, submissions, and file uploads. Paid, one-time perpetual developer licenses unlock additional tools: the Basic tier (starting around 569 US dollars) adds the drag-and-drop Survey Creator, the PRO tier (around 1,029 US dollars) adds a Dashboard and PDF Generator, and a custom-priced Enterprise tier adds dedicated technical support. Licenses include 12 months of updates and support, with optional annual renewal afterward, and are backed by a 90-day money-back guarantee. It works with React, Angular, Vue, and vanilla JavaScript.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Open-source Form Library$q$, $q$MIT-licensed library that renders JSON-defined forms and surveys in any JavaScript application.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Drag-and-drop Survey Creator$q$, $q$A visual, no-code form builder for designing survey layouts and logic.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Dashboard and analytics$q$, $q$Interactive data visualization for analyzing collected survey responses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$PDF Generator$q$, $q$Exports forms and results to PDF, Excel, or CSV.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Framework-agnostic support$q$, $q$Works with React, Angular, Vue, jQuery, and vanilla JavaScript.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Self-hosted data ownership$q$, $q$Response data stays on the developer's own servers rather than a third-party host.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Conditional logic and branching$q$, $q$Supports skip logic, dynamic question visibility, and complex form flows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Perpetual one-time licensing$q$, $q$Paid tiers are one-time developer license purchases rather than forced recurring subscriptions.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Free open-source Form Library covers most embedding use cases$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Full data ownership since forms run inside the developer's own app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$One-time perpetual license model instead of mandatory recurring fees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Works with all major JavaScript frameworks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Highly customizable question types and logic$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Requires development resources to implement, unlike no-code survey tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Commercial tiers require upfront payment for the Creator, Dashboard, and PDF Generator$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Small company size means a slower feature release pace than large SaaS vendors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Documentation is developer-oriented and less accessible to non-technical users$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$No built-in survey distribution or audience/panel features like hosted competitors$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Is SurveyJS free?$q$, $q$Yes, the core Form Library is free and open source under the MIT license. Paid one-time licenses unlock the Survey Creator, Dashboard, and PDF Generator tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$What is the difference between SurveyJS and SurveyMonkey?$q$, $q$SurveyJS is an open-source developer library you embed and self-host inside your own application, while SurveyMonkey is a hosted SaaS platform where surveys and data live on SurveyMonkey's servers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Do I need a license to use the Form Library?$q$, $q$No, the Form Library is MIT-licensed and free to use without a paid license.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$What does the Basic plan include?$q$, $q$The Basic plan is a one-time developer license that adds the drag-and-drop Survey Creator on top of the free Form Library.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Is SurveyJS open source?$q$, $q$The core Form Library, PDF Generator rendering, and Dashboard rendering components are open source under the MIT license; the visual Survey Creator builder is commercially licensed.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Which frameworks does SurveyJS support?$q$, $q$SurveyJS supports React, Angular, Vue, jQuery, and vanilla JavaScript.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Does SurveyJS host my survey data?$q$, $q$No, SurveyJS runs inside your own application, so response data is stored on your own servers rather than a third-party host.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$What is SurveyJS's refund policy?$q$, $q$SurveyJS offers a 90-day unconditional money-back guarantee on its paid developer licenses.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Embedded surveys inside a SaaS product$q$, $q$Software teams add custom surveys and forms directly inside their own product rather than linking out to a third-party tool.$q$, $q$Software and product engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Full data ownership requirements$q$, $q$Organizations with strict data residency or privacy requirements keep all survey response data on their own infrastructure.$q$, $q$Enterprises with data governance requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$White-labeled client form solutions$q$, $q$Agencies build custom-branded form and survey experiences for client projects using SurveyJS as the underlying engine.$q$, $q$Digital agencies and consultancies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Essential$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open-source MIT-licensed Form Library","Unlimited forms and submissions","Unlimited file uploads","Self-hosted data"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Basic$q$, $q$$569 one-time (renews $229/year)$q$, $q$one-time plus optional annual renewal$q$, NULL, $q$["Everything in Essential","Drag-and-drop Survey Creator","12 months of updates and support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$PRO$q$, $q$$1,029 one-time (renews $409/year)$q$, $q$one-time plus optional annual renewal$q$, NULL, $q$["Everything in Basic","Dashboard analytics library","PDF Generator library","Export to Excel, CSV, and PDF"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Enterprise$q$, $q$From $2,299 one-time (renews from $919/year)$q$, $q$one-time plus optional annual renewal$q$, NULL, $q$["Everything in PRO","Dedicated technical account manager","Priority bug fixes","Custom integration sessions"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$overview$q$, $q$What Is SurveyJS$q$, 2, ARRAY[$q$SurveyJS is an open-source JavaScript library suite for developers who need to add custom surveys, forms, or dashboards directly inside their own applications, rather than sending users to a third-party hosted survey site. Forms are defined as JSON and rendered by SurveyJS's MIT-licensed Form Library.$q$, $q$It is built and maintained by Devsoft Baltic OU, a small software company founded in 2015 and based in Tallinn, Estonia. Because SurveyJS runs inside the developer's own application, all response data is stored on the developer's own infrastructure rather than a third-party server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The free, MIT-licensed Form Library renders JSON-defined surveys and forms in any JavaScript application, with support for React, Angular, Vue, and vanilla JS. It includes extensive question types, conditional logic, and branching.$q$, $q$Paid add-ons extend the free library: Survey Creator is a drag-and-drop visual form builder, the Dashboard library provides interactive data visualization and reporting, and the PDF Generator exports completed forms and results to PDF, Excel, or CSV.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The Essential tier is free and includes the open-source Form Library with unlimited forms, submissions, and file uploads, since data is hosted on the developer's own servers.$q$, $q$Paid tiers are one-time perpetual developer licenses rather than recurring subscriptions: Basic starts around 569 US dollars and adds Survey Creator, PRO starts around 1,029 US dollars and adds the Dashboard and PDF Generator, and Enterprise starts around 2,299 US dollars with dedicated support. Each license includes 12 months of updates, with optional annual renewal afterward and a 90-day money-back guarantee.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SurveyMonkey ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SurveyMonkey is a hosted online survey and feedback platform that lets individuals, teams, and enterprises create, distribute, and analyze surveys without writing code.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$$30/user/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Mateo, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SurveyMonkey: Online Survey and Feedback Software$q$, seo_title),
  seo_meta_description = COALESCE($q$SurveyMonkey is a hosted survey platform for creating, distributing, and analyzing surveys. Free plan available; Team plans start at $30/user/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SurveyMonkey is a hosted, no-code online survey and feedback platform founded in 1999 by Ryan and Chris Finley, headquartered in San Mateo, California. Unlike developer-focused libraries such as SurveyJS, SurveyMonkey is a complete SaaS product where surveys are created, hosted, distributed, and analyzed entirely on SurveyMonkey's own servers, targeting non-technical users including market researchers, HR teams, and small businesses. The company briefly rebranded to Momentive Global from 2021 to 2023 to reflect a broader enterprise experience-management product suite, then reverted to the SurveyMonkey name in 2023 after being acquired by an investor group led by Symphony Technology Group. SurveyMonkey offers a free Basic plan with limited features, and paid Team plans starting with Team Advantage at around 30 US dollars per user per month billed annually with a three-user minimum, which includes unlimited surveys and up to 50,000 responses per year. The Team Premier plan, around 75 US dollars per user per month, adds white-label branding, advanced logic, and multilingual surveys. A custom-priced Enterprise plan with a five-user minimum adds SSO, enhanced security, and dedicated support. Responses beyond plan limits are billed per response.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '72810eb6-a04e-4d9e-be96-c79ff510a26e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Drag-and-drop survey builder$q$, $q$No-code interface for building surveys from scratch or from a template library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$300+ survey templates$q$, $q$Pre-built templates covering market research, HR, education, and customer feedback use cases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$AI-assisted survey creation and analysis$q$, $q$AI tools help draft questions and summarize response data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Skip logic and branching$q$, $q$Dynamically shows or hides questions based on prior answers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$White-label branding$q$, $q$Removes SurveyMonkey branding and applies custom branding on higher tiers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Enterprise security and SSO$q$, $q$Single sign-on, user management, and data center options for compliance needs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Integrations$q$, $q$Connects with Salesforce, HubSpot, Slack, and other business tools.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Response analytics and reporting$q$, $q$Built-in charts, filters, and export options for analyzing survey results.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$No technical skill required to build and launch surveys$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Free plan available for basic, low-volume use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Large template and question library$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Strong brand recognition and long operating history since 1999$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Enterprise-grade security options including SSO$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Response and survey limits on lower tiers restrict larger use cases$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Costs rise quickly for teams needing advanced logic or branding$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Extra responses beyond plan limits incur per-response fees$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Team plans require a minimum of three paid seats$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Advanced features are locked behind higher-priced or custom Enterprise plans$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Is SurveyMonkey free?$q$, $q$SurveyMonkey offers a free Basic plan with limited surveys and responses, though paid Team and Enterprise plans unlock higher limits and advanced features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$What is the difference between SurveyMonkey and SurveyJS?$q$, $q$SurveyMonkey is a fully hosted SaaS platform where surveys and data live on SurveyMonkey's own servers, while SurveyJS is an open-source developer library embedded and self-hosted inside a company's own application.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$How much does SurveyMonkey cost per month?$q$, $q$Team Advantage starts around 30 US dollars per user per month billed annually, and Team Premier starts around 75 US dollars per user per month, both with a three-user minimum.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$What happened to Momentive?$q$, $q$SurveyMonkey rebranded to Momentive Global in 2021, then reverted to the SurveyMonkey name in 2023 after being acquired by an investor group led by Symphony Technology Group.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Does SurveyMonkey have a minimum seat requirement?$q$, $q$Yes, Team plans require a minimum of three users and Enterprise plans require a minimum of five users.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Can I export survey data from SurveyMonkey?$q$, $q$Yes, SurveyMonkey supports exporting response data and analytics for further analysis.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Does SurveyMonkey offer enterprise security features?$q$, $q$Yes, the Enterprise plan includes SSO, enhanced security controls, and data center options.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$What is the response limit on paid plans?$q$, $q$Team Advantage includes up to 50,000 responses per year and Team Premier includes up to 100,000 responses per year, with extra responses billed per response.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Customer feedback and market research$q$, $q$Market researchers use SurveyMonkey to design and distribute surveys and analyze customer sentiment.$q$, $q$Market researchers and customer insights teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Employee engagement surveys$q$, $q$HR teams run recurring employee engagement and satisfaction surveys using SurveyMonkey's templates.$q$, $q$HR and people operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Small business customer satisfaction tracking$q$, $q$Small businesses collect customer satisfaction data without needing developer resources.$q$, $q$Small business owners and marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Basic$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Limited surveys and responses","Access to core survey builder","Functions as a free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Team Advantage$q$, $q$$30/user/month$q$, $q$annual, 3-user minimum$q$, NULL, $q$["Unlimited surveys","Up to 50,000 responses per year","AI-assisted analysis","Premium themes and shared brand assets"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Team Premier$q$, $q$$75/user/month$q$, $q$annual, 3-user minimum$q$, NULL, $q$["Everything in Team Advantage","White-label branding","Advanced logic and image click maps","Multilingual surveys","Up to 100,000 responses per year"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$Enterprise$q$, $q$Custom$q$, $q$annual, 5-user minimum$q$, NULL, $q$["Custom response limits","SSO and enhanced security","Data center options","Premium onboarding and support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '72810eb6-a04e-4d9e-be96-c79ff510a26e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$overview$q$, $q$What Is SurveyMonkey$q$, 2, ARRAY[$q$SurveyMonkey is a hosted online survey platform that lets anyone create, distribute, and analyze surveys through a web-based drag-and-drop builder, with no coding required. Founded in 1999 by Ryan and Chris Finley, it is one of the longest-running names in online survey software.$q$, $q$The company briefly operated as Momentive Global from 2021 to 2023 to reflect a broader enterprise experience-management product line, before reverting to the SurveyMonkey brand in 2023 following an acquisition by an investor group led by Symphony Technology Group. It remains headquartered in San Mateo, California.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SurveyMonkey provides a drag-and-drop survey builder, a library of over 300 templates, skip logic and branching, and AI-assisted survey creation and response analysis. Higher tiers add white-label branding, advanced logic, image click maps, and multilingual survey support.$q$, $q$The platform integrates with tools such as Salesforce, HubSpot, and Slack, and Enterprise customers get single sign-on (SSO), custom response limits, and data center options for compliance-sensitive organizations.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72810eb6-a04e-4d9e-be96-c79ff510a26e', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SurveyMonkey offers a free Basic plan with limited surveys and responses, functioning as both an entry point and a trial. Paid Team plans require a minimum of three user seats.$q$, $q$Team Advantage starts around 30 US dollars per user per month when billed annually and includes unlimited surveys with up to 50,000 responses per year. Team Premier, around 75 US dollars per user per month, adds white-label branding and multilingual surveys. Enterprise pricing is custom, with a five-user minimum, and adds SSO and enhanced security controls.$q$]::text[], 2);


-- ── SvelteKit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SvelteKit is a free, open-source web application framework built on top of Svelte that adds file-based routing, server-side rendering, and full-stack app infrastructure.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SvelteKit: Open-Source Full-Stack Framework for Svelte$q$, seo_title),
  seo_meta_description = COALESCE($q$SvelteKit is a free, open-source framework built on Svelte with routing, SSR, and deployment adapters. MIT-licensed and free for any project.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SvelteKit is a free, open-source web application framework built on top of the Svelte component framework, adding file-based routing, server-side rendering, static site generation, data loading, and deployment infrastructure that Svelte alone does not provide. Svelte itself was created by Rich Harris and first released in 2016, while SvelteKit was announced in October 2020, entered beta in March 2021, and reached its 1.0 stable release in December 2022. SvelteKit occupies a role comparable to Next.js for React or Nuxt for Vue, letting developers build full applications rather than just individual UI components. It is powered by Vite for fast development and hot module replacement, supports multiple rendering modes (server-side rendering, client-side rendering, and static prerendering), and ships with adapters for deploying to platforms such as Vercel, Netlify, Cloudflare, and Node servers. Rich Harris now works on Svelte and SvelteKit full-time as an employee of Vercel, though governance of the open-source project remains independent of any single company. SvelteKit is released under the MIT license and is entirely free to use for personal or commercial projects, with no paid tier, subscription, or usage limits imposed by the project itself.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$File-based routing$q$, $q$Maps folder and file structure directly to application routes automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Multiple rendering modes$q$, $q$Supports server-side rendering, client-side rendering, and static prerendering in one app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Built-in data loading$q$, $q$Load functions and form actions handle server-side data fetching and mutations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Vite-powered dev server$q$, $q$Instant hot module replacement and fast builds powered by Vite.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Deployment adapters$q$, $q$Ships with adapters for Vercel, Netlify, Cloudflare, and Node-based hosting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Built-in image optimization$q$, $q$Optimizes images automatically as part of the build pipeline.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$TypeScript support$q$, $q$First-class TypeScript support out of the box.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Offline and service worker support$q$, $q$Enables offline capability through built-in service worker integration.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Fast runtime performance due to Svelte's compiler-based approach$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Flexible rendering modes combined in a single framework$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Strong developer experience with Vite-powered hot module replacement$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Free and open source under the MIT license$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Actively developed with dedicated maintainer support from Vercel$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Smaller plugin and library ecosystem than React or Vue-based frameworks$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Fewer job listings and enterprise adoption than React-based alternatives$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Breaking changes have occurred between major Svelte versions$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Finding developers experienced specifically in Svelte and SvelteKit can be harder$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Some third-party tools and integrations prioritize React or Vue first$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Is SvelteKit free?$q$, $q$Yes, SvelteKit is free and open source under the MIT license with no usage limits or paid tier.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$What is the difference between Svelte and SvelteKit?$q$, $q$Svelte is a component-level UI framework, while SvelteKit is the full application framework built on top of it, adding routing, rendering, and deployment infrastructure.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Who created SvelteKit?$q$, $q$SvelteKit was built by the Svelte core team led by Rich Harris, the original creator of Svelte.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Is SvelteKit production-ready?$q$, $q$Yes, SvelteKit reached its stable 1.0 release in December 2022 and is used in production by many companies.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Can I deploy SvelteKit to Vercel or Netlify?$q$, $q$Yes, SvelteKit ships with official adapters for Vercel, Netlify, Cloudflare, and Node-based hosting.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Does SvelteKit support server-side rendering?$q$, $q$Yes, SvelteKit supports server-side rendering, static prerendering, and client-side rendering within the same application.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$What license is SvelteKit under?$q$, $q$SvelteKit is released under the MIT license.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$How is SvelteKit different from Next.js?$q$, $q$SvelteKit is built on the Svelte compiler rather than React, which generally results in smaller bundle sizes, while offering a comparable feature set of routing, SSR, and data loading.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Performant SSR and SSG web apps$q$, $q$Frontend developers build server-rendered or statically generated sites that need fast load times.$q$, $q$Frontend developers and web agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Lightweight full-stack startup apps$q$, $q$Startups choose SvelteKit as a compact full-stack framework for shipping products quickly.$q$, $q$Startups and small engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$Migrating from Svelte components to a full app$q$, $q$Teams already using Svelte components adopt SvelteKit to add routing and server rendering.$q$, $q$Teams already invested in the Svelte ecosystem$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$SvelteKit$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open source under the MIT license","Free for personal and commercial projects","No usage limits from the framework itself","Deployable to any adapter-supported hosting platform"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'c1bac24a-e6cf-4182-8ac7-8a3fd1004018';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$overview$q$, $q$What Is SvelteKit$q$, 2, ARRAY[$q$SvelteKit is a free, open-source framework for building full web applications using Svelte, adding the routing, rendering, and deployment infrastructure that the Svelte component library alone does not include. It plays a role similar to Next.js for React or Nuxt for Vue.$q$, $q$Svelte was created by Rich Harris and first released in 2016. SvelteKit itself was announced in October 2020, entered beta in March 2021, and reached its 1.0 stable release in December 2022. Rich Harris now works on Svelte full-time as an employee of Vercel, while governance of the open-source project remains independent.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SvelteKit provides file-based routing that maps folder structure directly to application routes, along with built-in data-loading functions and form actions for handling server-side logic. It supports server-side rendering, static prerendering, and client-side rendering, often within the same application.$q$, $q$Development is powered by Vite, giving instant hot module replacement and fast build times. Deployment is handled through adapters for platforms including Vercel, Netlify, Cloudflare, and traditional Node servers, and the framework includes built-in image optimization and full TypeScript support.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SvelteKit is free and open source under the MIT license, with no cost to use for personal or commercial projects and no usage limits imposed by the framework itself.$q$, $q$Any hosting costs come from the deployment platform chosen (such as Vercel or Netlify), not from SvelteKit, which does not sell a paid tier or subscription.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c1bac24a-e6cf-4182-8ac7-8a3fd1004018', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Svix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Svix is a webhooks-as-a-service platform that lets companies send reliable, secure webhooks to their customers without building and maintaining webhook infrastructure in-house.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$New York, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Svix: Enterprise-Ready Webhooks-as-a-Service Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Svix is a webhooks-as-a-service platform with automatic retries, message transformations, and enterprise SLAs. Free tier available; paid from $490/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Svix is a webhooks-as-a-service platform that lets companies add reliable, secure outbound webhooks to their own product without building and maintaining that infrastructure themselves. Founded in 2021 by Tom Hacohen, Svix went through Y Combinator's W21 batch and has raised funding from investors including Andreessen Horowitz (a16z) and Aleph, along with founders and CTOs from companies like GitHub, PagerDuty, Segment, and Lookout. The company operates with a small, distributed team of roughly ten to twelve people. Svix provides managed webhook sending with automatic retries and exponential backoff, an embeddable customer-facing webhook management UI, message transformations and filtering, HMAC payload signing, and typed event schemas. It offers both a free tier, with 200 messages per second and 50,000 included messages per month on a 99.9 percent uptime SLA, and paid Professional plans starting around 490 US dollars per month with higher throughput, longer payload retention, and a 99.99 percent uptime SLA. An Enterprise tier offers custom pricing with a 99.999 percent uptime SLA, on-premises deployment, and SSO. Svix also offers an open-source, self-hostable version of its webhook sending service for teams that want full control over their infrastructure.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Managed webhook delivery$q$, $q$Handles sending webhooks to customer endpoints without requiring in-house infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Automatic retries with backoff$q$, $q$Retries failed webhook deliveries automatically using exponential backoff.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Embeddable management UI$q$, $q$A pre-built webhook management interface companies can embed for their own customers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Message transformations and filtering$q$, $q$Lets customers filter and transform events before they are delivered.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$HMAC payload signing$q$, $q$Signs webhook payloads so receivers can verify authenticity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Typed event schemas$q$, $q$Defines structured event catalogs for consistent webhook payloads.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$OpenTelemetry log streaming$q$, $q$Streams delivery logs for observability on Enterprise plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Open-source self-hosted option$q$, $q$Offers an open-source version of the webhook sending service for self-hosting.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Removes the need to build webhook infrastructure in-house$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Generous free tier suitable for smaller-scale use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Backed by Y Combinator and well-known venture investors$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Open-source self-hosted option available for full control$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$High uptime SLAs on paid tiers for reliability-sensitive use cases$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Professional tier pricing is a significant jump from the free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Small team size compared to larger infrastructure vendors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Enterprise features like SSO and on-premises deployment require custom sales-negotiated pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Niche product category with fewer public case studies than mainstream API tools$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Headquarters and public company details are less documented than larger competitors$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Is Svix free to use?$q$, $q$Yes, Svix offers a free tier with 200 messages per second and 50,000 included messages per month, with no credit card required.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$What does Svix cost at scale?$q$, $q$The Professional plan starts around 490 US dollars per month, with custom Enterprise pricing available for larger-scale or higher-SLA needs.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Is Svix open source?$q$, $q$Svix offers an open-source, self-hostable version of its webhook sending service in addition to its managed cloud offering.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Who founded Svix?$q$, $q$Svix was founded in 2021 by Tom Hacohen and went through Y Combinator's W21 batch.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$What is webhooks-as-a-service?$q$, $q$Webhooks-as-a-service is a managed platform that handles sending, retrying, and monitoring outbound webhooks on behalf of another company's product.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Can I self-host Svix?$q$, $q$Yes, Svix provides an open-source version that can be self-hosted for teams that want full infrastructure control.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Does Svix support retries for failed webhooks?$q$, $q$Yes, Svix automatically retries failed webhook deliveries using exponential backoff.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$What SLA does Svix guarantee?$q$, $q$The Free plan includes a 99.9 percent uptime SLA, Professional includes 99.99 percent, and Enterprise includes 99.999 percent.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Adding webhooks to a SaaS product$q$, $q$SaaS companies use Svix to let their own customers subscribe to real-time event notifications.$q$, $q$SaaS and API product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Reliable event delivery at scale$q$, $q$Platforms use Svix to ensure event delivery with retries, monitoring, and alerting built in.$q$, $q$Platform and infrastructure engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$High-SLA or on-premises webhook needs$q$, $q$Enterprises with strict compliance or uptime requirements use Svix's Enterprise plan for on-premises or high-SLA delivery.$q$, $q$Enterprise engineering and compliance teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["200 messages/second","50,000 included messages/month","30-day payload retention","99.9% uptime SLA","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Professional$q$, $q$From $490/month$q$, $q$monthly$q$, NULL, $q$["Everything in Free","800 messages/second","90-day payload retention","White-label headers and static source IPs","99.99% uptime SLA","SOC 2 Type II report"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Custom rate limits","99.999% uptime SLA","On-premises deployment options","OIDC and SAML SSO","Dedicated account manager"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$overview$q$, $q$What Is Svix$q$, 2, ARRAY[$q$Svix is a webhooks-as-a-service platform that handles the sending, retrying, and monitoring of outbound webhooks on behalf of other companies, so those companies do not need to build and maintain that infrastructure themselves.$q$, $q$Founded in 2021 by Tom Hacohen and backed by Y Combinator (W21), Andreessen Horowitz, and Aleph, Svix serves companies of all sizes that need to notify their own customers of events happening inside their product in real time.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Svix manages webhook delivery with automatic retries and exponential backoff, HMAC signing for payload verification, and message transformations and filtering so customers only receive the events they care about. It also provides an embeddable webhook management UI that companies can drop directly into their own product for their customers.$q$, $q$For larger customers, Svix offers typed event schemas, OpenTelemetry log streaming, and enterprise controls such as OIDC and SAML SSO, static source IPs, and on-premises deployment options.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Svix's Free plan includes 200 messages per second, 50,000 included messages per month, 30-day payload retention, and a 99.9 percent uptime SLA, with no credit card required.$q$, $q$The Professional plan starts around 490 US dollars per month and adds higher throughput, 90-day retention, white-label headers, static source IPs, and a 99.99 percent uptime SLA. Enterprise pricing is custom and adds a 99.999 percent uptime SLA, on-premises deployment, and dedicated account support.$q$]::text[], 2);


-- ── Swapcard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Swapcard is a revenue-first event management platform that helps organizers run in-person, virtual, and hybrid events with AI-powered attendee matchmaking and exhibitor tools.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$610/year$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Paris, France$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Swapcard: AI-Powered Event Management and Networking Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Swapcard is an event management platform with AI matchmaking, exhibitor tools, and hybrid event support. Plans start around $610/year per license.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Swapcard is a revenue-first event management platform built for organizers running in-person, virtual, and hybrid B2B events, conferences, and trade shows. It was founded in 2013 in Paris, France by Baptiste Boulard, Godefroy des Francs, and Damien Courbon, who set out to fix fragmented event technology by unifying operations and attendee engagement into one shared data layer. The company is headquartered in Paris and, according to public company data, employs between roughly 201 and 500 people. Over a twelve-month period, Swapcard has reported supporting more than 4,000 events across over 92 countries, engaging more than 7 million attendees and 120,000 exhibitors. The platform's core differentiator is AI-powered matchmaking that connects attendees and exhibitors based on shared interests, alongside an event app, virtual and hybrid streaming, exhibitor lead capture and qualification, real-time analytics, and revenue reporting for organizers. Swapcard uses annual license-based pricing that scales with attendee volume rather than per-event fees, starting around 610 US dollars per year per license for its Starter tier covering up to 1,000 attendees per year, with Professional and Enterprise tiers requiring a custom quote. The platform holds SOC 2, ISO 27001, and GDPR compliance certifications and offers discounted pricing for qualifying nonprofits.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$AI-powered attendee matchmaking$q$, $q$Connects attendees and exhibitors based on shared interests and goals to drive networking outcomes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Branded event app$q$, $q$A customizable web and mobile app for attendees to navigate agendas, network, and engage during events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Exhibitor lead capture and qualification$q$, $q$Tools for exhibitors to scan, capture, and qualify leads at booths and virtual sessions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Hybrid and virtual event support$q$, $q$Live streaming and virtual engagement tools alongside in-person event features.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Real-time analytics and revenue reporting$q$, $q$Dashboards that track attendance, engagement, and revenue for organizers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Sponsorship and exhibitor management$q$, $q$Tools to manage sponsor packages, booth assignments, and exhibitor communications.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$One-to-one meeting scheduling$q$, $q$Lets attendees and exhibitors book meetings directly within the event app.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$CRM and marketing integrations$q$, $q$Connects event data with CRM and marketing platforms for follow-up and attribution.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Strong AI-driven matchmaking built specifically for B2B networking events$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Supports in-person, virtual, and hybrid event formats in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Proven at scale across thousands of events and millions of attendees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Robust security and compliance certifications including SOC 2 and ISO 27001$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Revenue-focused reporting tailored to event organizer business goals$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Pricing for Professional and Enterprise tiers requires a sales call rather than being published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Annual subscription model may not suit organizers running only a single small event$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Optional add-ons for exhibitor services and support can increase total cost$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Platform depth can create a learning curve for organizers new to the system$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Attendee-volume-based pricing can become costly for very large events$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$How much does Swapcard cost?$q$, $q$Swapcard's Starter tier begins around 610 US dollars per year per license for up to 1,000 attendees per year, while Professional and Enterprise tiers require a custom quote from sales.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Who founded Swapcard?$q$, $q$Swapcard was founded in 2013 in Paris, France, by Baptiste Boulard, Godefroy des Francs, and Damien Courbon.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Does Swapcard support hybrid events?$q$, $q$Yes, Swapcard supports in-person, virtual, and hybrid event formats, including live streaming for remote attendees.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Is there a free trial for Swapcard?$q$, $q$Yes, a free trial is available for the Starter tier.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$What is included in the Starter plan?$q$, $q$The Starter plan covers up to 1,000 attendees per year with core platform access and compliance certifications including SOC 2, ISO 27001, and GDPR.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$How does Swapcard's AI matchmaking work?$q$, $q$Swapcard's AI matches attendees and exhibitors based on shared interests and goals to help them find relevant connections during an event.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Does Swapcard offer nonprofit discounts?$q$, $q$Yes, qualifying nonprofits and NGOs may be eligible for discounted pricing through application.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$What security certifications does Swapcard have?$q$, $q$Swapcard holds SOC 2, ISO 27001, and GDPR compliance certifications.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$B2B conference networking$q$, $q$Conference organizers use Swapcard's AI matchmaking to help attendees find relevant connections and sessions.$q$, $q$B2B conference and summit organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Trade show exhibitor management$q$, $q$Trade show organizers manage exhibitor booths, lead capture, and sponsorship packages through Swapcard.$q$, $q$Trade show and expo organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Hybrid association events$q$, $q$Associations run hybrid events that combine in-person attendance with virtual streaming for remote members.$q$, $q$Associations and membership organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Starter$q$, $q$From $610/year per license$q$, $q$annual$q$, NULL, $q$["Up to 1,000 attendees per year","Free trial available","SOC 2, ISO 27001, and GDPR compliance","Core event management platform access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Professional$q$, $q$Custom (demo required)$q$, $q$annual$q$, NULL, $q$["Up to 10,000 attendees per year","Expanded exhibitor and support add-ons","Advanced platform features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Unlimited attendees","Full security review","MSA support","Access to all premium features"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'fd7d8e1a-3b36-4c58-8e55-51b777324c5b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$overview$q$, $q$What Is Swapcard$q$, 2, ARRAY[$q$Swapcard is a revenue-first event management platform that helps organizers run in-person, virtual, and hybrid B2B events, conferences, and trade shows from a single system. It was founded in 2013 in Paris by Baptiste Boulard, Godefroy des Francs, and Damien Courbon to solve the fragmented systems many large B2B event organizers relied on.$q$, $q$The platform is headquartered in Paris, France, and, according to public company data, employs between roughly 201 and 500 people. Swapcard has reported supporting thousands of events across dozens of countries, engaging millions of attendees and exhibitors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Swapcard's core differentiator is AI-powered matchmaking that connects attendees and exhibitors based on shared interests and goals, supported by a branded event app for web and mobile. The platform supports in-person, virtual, and hybrid formats, including live streaming for remote attendees.$q$, $q$For exhibitors and sponsors, Swapcard provides lead capture and qualification tools, booth analytics, and sponsorship management, while organizers get real-time attendance and revenue reporting alongside CRM and marketing integrations.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7d8e1a-3b36-4c58-8e55-51b777324c5b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Swapcard uses an annual license-based pricing model tied to attendee volume rather than per-event fees. The Starter tier begins around 610 US dollars per year per license and covers up to 1,000 attendees per year, with a free trial available.$q$, $q$The Professional tier covers up to 10,000 attendees per year and requires a sales demo for a custom quote, while the Enterprise tier supports unlimited attendees with a full security review and custom contract terms. Optional add-ons for exhibitor services and support tiers can increase total cost, and discounted pricing is available for qualifying nonprofits.$q$]::text[], 2);



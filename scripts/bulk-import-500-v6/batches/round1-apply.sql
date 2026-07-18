-- Enrichment batch: AWStats, Countly Community Edition, d8a.tech, Daily Stars Explorer, HitKeep, Litlyx, Liwan, Medama Analytics, Offen, Prisme Analytics, Rybbit, Shaper, Superset, Swetrix, Vince, Collective Access - Providence, Eonvelope, Omeka S, Discount Bandit, flowctl, Fredy, HomeButler, Kibitzr, Mylar3, Antville, Ech0, FlatPress, HTMLy, Mataroa, PluXml, Serendipity, Digibunch, Faved, Firefox Account Server, Karakeep, LinkWarden, SyncMarks, Baïkal, DAViCal, Keeper.sh, Manage My Damn Life, Radicale, AnyCable, Centrifugo, Chitchatter, Conduit, Continuwuity, GlobaLeaks, GNUnet, Hyphanet, Jami, Live Helper Chat, Mumble, One Time Secret, OTS, RetroShare, SAMA, Screego, Spectrum 2, Stoat, Tiledesk, Tox, Tuwunel, Typebot, AnonAddy, b1gMail, DebOps, docker-mailserver, Dovel, Inboxen, iRedMail, Mox, SimpleLogin, wildduck, Cyrus IMAP, DavMail, Dovecot, chasquid, Courier MTA, EmailRelay
-- Publishes 80 bulk-imported tool(s) with full editorial content.

-- ── AWStats ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source log analyzer that turns Apache, IIS, FTP, and mail server logs into graphical traffic reports.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AWStats: free, open-source log analyzer that turns Apache, IIS, FTP, and mail logs into graphical traffic and visitor reports.$q$,
  og_description = $q$AWStats: free, open-source log analyzer that turns Apache, IIS, FTP, and mail logs into graphical traffic and visitor reports.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '675b4134-c6dd-4c7a-8480-7fcb63af924a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Log-based analytics$q$, $q$Parses Apache, IIS, WebStar, FTP, and mail server logs directly instead of relying on JavaScript trackers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Visitor and geography reports$q$, $q$Reports unique visitors, visit duration, and country of origin based on IP-to-country detection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Browser and OS detection$q$, $q$Identifies visiting browsers and operating systems from user-agent strings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Search engine and keyword tracking$q$, $q$Recognizes referrals and search keywords from a large list of known search engines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Robot and error detection$q$, $q$Flags bot/crawler traffic and reports HTTP errors found in the logs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$CLI or CGI operation$q$, $q$Runs as a command-line batch job or as a CGI application with dynamic, interactive filtering.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Multi-format export$q$, $q$Exports reports to HTML, XHTML, and PDF.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Load-balanced cluster support$q$, $q$Can merge logs from multiple servers in a load-balanced setup into a single report.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Completely free and open source under the GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$No JavaScript tracker required — works from existing server logs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Long-standing tool widely supported by hosting control panels$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Detailed browser, OS, and search-engine breakdowns out of the box$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$No longer actively maintained by its original author as of the 8.0 release$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Report generation is log-based/batch rather than real-time$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Interface and reporting style feel dated compared to modern analytics tools$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Requires server-level access to log files and a Perl environment$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Is AWStats free?$q$, $q$Yes. AWStats is free, open-source software released under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Does AWStats require a JavaScript tracking snippet?$q$, $q$No. AWStats generates reports by parsing existing server log files, so no client-side tracking code is needed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Is AWStats still maintained?$q$, $q$The original author released version 8.0 in August 2025 and stated it would be his last personal release; community maintenance continues on GitHub, but active development has slowed.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$What server logs can AWStats read?$q$, $q$It supports Apache, IIS, WebStar, FTP, and mail server log formats, among others.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Shared hosting traffic reports$q$, $q$Hosting providers bundle AWStats to give customers basic traffic stats without running a separate analytics service.$q$, $q$Web hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Lightweight log auditing$q$, $q$Sysadmins use AWStats to review error rates, bot traffic, and referrer sources directly from existing logs.$q$, $q$System administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AWStats is a server log analysis tool that parses raw web, FTP, and mail server logs and generates advanced, graphical usage reports. Rather than tracking visitors with client-side JavaScript, it works entirely from log files already produced by Apache, IIS, WebStar, and other servers, so there is no tracking script to add to a site.$q$, $q$Created by Laurent Destailleur and released under the GNU General Public License, AWStats has been a staple of shared-hosting control panels for years. Version 8.0, released in August 2025, was noted by the original author as the last release he personally plans to maintain, with community contributors continuing development on GitHub. The author has publicly pointed users who want an actively developed alternative toward Matomo.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AWStats suits hosting providers and system administrators who already have server log files and want a lightweight, no-JavaScript way to review traffic, errors, and search engine referrals without deploying a database-backed analytics stack.$q$, $q$It is less suited to teams that need real-time dashboards, event tracking, or modern product analytics — its reports are generated from static log parsing, typically run on a schedule.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Countly Community Edition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source edition of Countly's product and web analytics platform for session, event, and crash tracking.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Countly Community Edition: free, self-hosted, open-source analytics with session, event, crash, and push notification tracking.$q$,
  og_description = $q$Countly Community Edition: free, self-hosted, open-source analytics with session, event, crash, and push notification tracking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a59d5166-cc6a-417b-90b1-e5b6c0fb5f11';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a59d5166-cc6a-417b-90b1-e5b6c0fb5f11' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Sessions, views, and events$q$, $q$Collects session data, page/screen views, and custom events across web and mobile SDKs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Crash and error reporting$q$, $q$Captures crash and error reports from SDKs for iOS, Android, React Native, Flutter, Node.js, Unity, Java, and JavaScript.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Push notifications$q$, $q$Sends push notifications to iOS and Android apps from the self-hosted dashboard.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Remote configuration$q$, $q$Supports remote config to change app behavior without shipping a new release.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$In-app ratings$q$, $q$Includes customizable in-app rating widgets.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Dashboards and email reports$q$, $q$Provides built-in, customizable reports and dashboards plus scheduled email reports and alerts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Webhooks and APIs$q$, $q$Offers data webhooks and read/write APIs for integrating Countly data with other systems.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Plugin architecture$q$, $q$A plugin-based system allows extending core functionality.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Free to self-host with full source access$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Broad SDK coverage for web, mobile, and desktop platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Includes crash reporting and push notifications alongside analytics$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Plugin architecture for extending functionality$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Requires operating and maintaining your own server infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$AGPL license with modified terms may need legal review for some commercial uses$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Lacks advanced access controls, SLAs, and support available in the paid Enterprise edition$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Initial setup is more involved than a hosted analytics SaaS$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Is Countly Community Edition free?$q$, $q$Yes, it is free and open source under an AGPL-3.0 license with a modified Section 7.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$How is Community Edition different from Countly Enterprise?$q$, $q$Community Edition (Lite) is self-hosted only and lacks features like granular data access, dedicated SLA, and direct support that come with the paid Enterprise on-premise or Countly Flex hosted offerings.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$How do I install Countly Community Edition?$q$, $q$It can be installed with an automated bash script on Ubuntu/CentOS/RHEL, via Docker, or manually from stable release packages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Which platforms does Countly support?$q$, $q$SDKs are available for web, iOS, Android, React Native, Flutter, Node.js, Unity, Java, and JavaScript, among others.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Self-hosted mobile app analytics$q$, $q$Small teams track app sessions, events, and crashes without sending data to a third-party SaaS.$q$, $q$Mobile app developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Privacy-conscious product analytics$q$, $q$Organizations that need to keep analytics data on their own infrastructure for privacy or compliance reasons.$q$, $q$Privacy-focused engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$Community Edition (Lite)$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted deployment","Sessions, events, and crash reporting","Push notifications","Dashboards and email reports","Read/write APIs"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Countly Community Edition (also referred to as Countly Lite) is the free, self-hosted version of the Countly analytics platform. It collects sessions, views, custom events, and crash/error reports from web, mobile, and other SDKs, and presents them through built-in dashboards and reports that an organization runs entirely on its own infrastructure.$q$, $q$It is released under an AGPL-3.0 license with a modified Section 7, and can be installed via an automated script on Ubuntu/CentOS/RHEL, via Docker, or from stable release packages. Countly also sells hosted (Countly Flex) and on-premise Enterprise editions with additional features such as granular data access controls, SLAs, and dedicated support, which are separate commercial products from the Community Edition.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Countly Community Edition is aimed at individuals and small teams who want to self-host product/web analytics and crash reporting rather than pay for the hosted or Enterprise Countly plans, and who are comfortable maintaining their own server infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a59d5166-cc6a-417b-90b1-e5b6c0fb5f11', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── d8a.tech ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MIT-licensed, GA4-compatible analytics platform that loads existing GA4/Matomo data into your own data warehouse.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$d8a.tech: MIT-licensed analytics platform that loads existing GA4/Matomo data into your own warehouse, self-hosted or cloud.$q$,
  og_description = $q$d8a.tech: MIT-licensed analytics platform that loads existing GA4/Matomo data into your own warehouse, self-hosted or cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5186176-1b9e-4d69-9272-f95fc9700a4c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5186176-1b9e-4d69-9272-f95fc9700a4c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Works with existing GA4/Matomo tracking$q$, $q$Ingests data from tracking implementations already in place without requiring new tagging.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Reporting-ready warehouse schema$q$, $q$Normalizes raw analytics events into flat tables designed for direct SQL analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Multi-destination storage$q$, $q$Supports loading data into BigQuery, ClickHouse, CSV, or Parquet.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Historical GA4 import$q$, $q$Can import historical data from GA4 BigQuery exports.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$AI-assisted exploration$q$, $q$Includes an AI agent for exploratory querying and insight discovery over the normalized data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Flexible deployment$q$, $q$Available as EU-hosted cloud, self-hosted on Kubernetes, or air-gapped for isolated networks.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$MIT licensed and open source with self-hosting available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Keeps analytics data in a customer-owned warehouse instead of a vendor silo$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Works with existing GA4/Matomo setups without re-tagging$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Multiple deployment modes including air-gapped for compliance-heavy environments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Requires an existing GA4 or Matomo implementation to source data from$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Detailed paid-tier pricing is not published on the marketing site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Self-hosted/air-gapped deployment requires Kubernetes and data-engineering expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Is d8a.tech free?$q$, $q$It offers a free EU-hosted cloud tier; self-hosted deployment is also available since the project is MIT licensed and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Does d8a.tech replace Google Analytics tracking?$q$, $q$No. It works alongside an existing GA4 or Matomo implementation and loads that data into a customer-owned warehouse rather than replacing the tracking layer.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Where can data be stored?$q$, $q$Supported destinations include BigQuery, ClickHouse, CSV, and Parquet.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Can it be self-hosted?$q$, $q$Yes, including on a customer's own Kubernetes cluster or in an air-gapped environment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Data sovereignty for regulated industries$q$, $q$Healthcare, government, and financial organizations keep GA4-sourced analytics data inside infrastructure they control.$q$, $q$Compliance and data teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Warehouse-native analytics$q$, $q$Analysts query a normalized, reporting-ready schema directly with SQL instead of relying on a vendor's dashboard UI.$q$, $q$Data analysts and engineers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Cloud (Free)$q$, $q$Free$q$, $q$N/A$q$, $q$["EU-hosted","GA4/Matomo-compatible ingestion"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$Self-hosted / Air-gapped$q$, $q$Free (open source)$q$, $q$N/A$q$, $q$["Deploy on your own Kubernetes cluster","Air-gapped deployment option","MIT licensed source code"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$d8a.tech is an analytics platform built to work alongside existing GA4 or Matomo tracking implementations rather than replace them. It ingests the data those tools already collect and loads it into a reporting-ready schema inside a data warehouse the customer controls — supporting destinations such as BigQuery, ClickHouse, CSV, and Parquet — so organizations keep ownership of the raw data instead of only accessing it through a vendor dashboard.$q$, $q$The project is MIT licensed with code published on GitHub, and it can be deployed as a free EU-hosted cloud tier, self-hosted on a customer's own Kubernetes cluster, or air-gapped for isolated environments. It also includes a dashboard layer and an AI-assisted exploration feature for querying the normalized data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$d8a.tech targets organizations in regulated or data-sensitive sectors — healthcare, government, and financial services are called out specifically — that need to retain full control and sovereignty over analytics data collected via GA4 or Matomo without switching tracking tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5186176-1b9e-4d69-9272-f95fc9700a4c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Daily Stars Explorer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source web app that visualizes a GitHub repository's actual daily star, commit, and activity history over time.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Daily Stars Explorer: free open-source tool showing a GitHub repo's real daily star, commit, and activity history.$q$,
  og_description = $q$Daily Stars Explorer: free open-source tool showing a GitHub repo's real daily star, commit, and activity history.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8d0f250c-fcb6-42a1-ba65-14a33ddeb307';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8d0f250c-fcb6-42a1-ba65-14a33ddeb307' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Daily star history$q$, $q$Shows actual day-by-day star counts for a repository rather than an interpolated trend line.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Hourly tracking with timezone support$q$, $q$Can drill into hourly star activity with timezone-aware timestamps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Repository comparison$q$, $q$Compares star and activity history side-by-side across multiple repositories.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Activity timelines$q$, $q$Charts commits, pull requests, issues, forks, and contributor activity over time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Community mention feed$q$, $q$Surfaces mentions of a repository from Hacker News, Reddit, YouTube, and GitHub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Data export$q$, $q$Exports underlying data as CSV or JSON.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Self-hosting via Docker$q$, $q$Ships an official Docker image for teams that want to run it themselves.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Free, open source, and MIT licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Shows true daily data instead of interpolated star-history lines$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$No signup required to use the hosted version$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Includes broader activity context (commits, PRs, issues, forks) beyond just stars$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Focused specifically on GitHub repository metrics, not general analytics$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Self-hosting requires running the provided Docker image and managing GitHub API access$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Relies on public GitHub data, so private repository insight is limited$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Is Daily Stars Explorer free?$q$, $q$Yes, it's free, open source, and MIT licensed, with a free hosted version and a self-hosted Docker option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Do I need to sign up to use it?$q$, $q$No signup is required to use the hosted version at emanuelef.github.io/daily-stars-explorer.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Can I compare multiple repositories?$q$, $q$Yes, the tool supports side-by-side comparison of star and activity history across repositories.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Can I self-host Daily Stars Explorer?$q$, $q$Yes, an official Docker image is provided for self-hosted deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Open-source growth tracking$q$, $q$Maintainers track how a repository's star count and contributor activity actually grew day-by-day.$q$, $q$Open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$Library due diligence$q$, $q$Developers compare candidate libraries' historical activity before adopting one.$q$, $q$Developers evaluating dependencies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Daily Stars Explorer is an open-source, MIT-licensed web application for exploring the history of any public GitHub repository. Unlike star-history tools that interpolate a straight line between two points in time, it plots actual daily star counts alongside commits, pull requests, issues, forks, and contributor activity, giving a more accurate picture of when a project gained or lost traction.$q$, $q$It is built with a Go backend and a JavaScript/TypeScript frontend, is hosted freely at emanuelef.github.io/daily-stars-explorer with no signup required, and is also distributed as a Docker image for self-hosting. The project is maintained on GitHub, where it has accumulated several hundred stars and accepts community contributions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's aimed at open-source maintainers, developers evaluating libraries, and anyone researching how a GitHub project's popularity and activity evolved day by day rather than relying on a coarse, interpolated star-history chart.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d0f250c-fcb6-42a1-ba65-14a33ddeb307', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── HitKeep ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Privacy-first, MIT-licensed web analytics available as a managed cloud service or a single-binary self-hosted server.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HitKeep: privacy-first, MIT-licensed web analytics with cookieless tracking, free self-hosting, and a managed cloud option.$q$,
  og_description = $q$HitKeep: privacy-first, MIT-licensed web analytics with cookieless tracking, free self-hosting, and a managed cloud option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '908dae33-8b4a-4b73-8ca9-33e3eb8522aa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '908dae33-8b4a-4b73-8ca9-33e3eb8522aa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Cookieless tracking$q$, $q$Tracks visitors and conversions without cookies, configured by default to send no telemetry.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Goal and funnel tracking$q$, $q$Supports goal tracking, multi-step funnels, and ecommerce revenue measurement.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$AI crawler differentiation$q$, $q$Distinguishes AI crawler traffic from human referral traffic for AI-visibility tracking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Scheduled reports and dashboards$q$, $q$Sends scheduled email reports and supports shareable dashboards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Webhooks and REST API$q$, $q$Provides signed outbound webhooks and a REST API for integrating with other systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Full data export$q$, $q$Exports data in JSON, CSV, Parquet, NDJSON, and XLSX formats.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Passkey authentication$q$, $q$Supports WebAuthn/passkey login and role-based access control.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Single-binary self-hosting$q$, $q$Self-hosted deployment runs as one Go binary with embedded DuckDB, no external database required.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$MIT licensed with a genuinely free, perpetual self-hosted option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$No external database or orchestration needed for self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Cloud plans offer EU and US data residency$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Full data export in multiple formats avoids lock-in$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Free cloud tier is limited to 3 sites and 60-day retention$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Self-hosting requires comfort running and maintaining a Go binary on a server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Higher site counts and longer retention require paid Pro or Business plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Is HitKeep free?$q$, $q$The self-hosted version is free and MIT licensed. The cloud service has a free tier (3 sites, 60-day retention) plus paid Pro and Business plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Can HitKeep be self-hosted?$q$, $q$Yes, it runs as a single Go binary with an embedded DuckDB database and no external database or container orchestration required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Does HitKeep use cookies?$q$, $q$No, it is configured by default with no cookies and no telemetry.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$What does the Pro plan cost?$q$, $q$The Pro plan is €150/year (or €15/month), covering 10 sites, 5 team members, and 1-year data retention.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Cookieless site analytics$q$, $q$Site owners track traffic and conversions without cookie banners or consent management overhead.$q$, $q$Privacy-conscious website owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Multi-client agency reporting$q$, $q$Agencies manage analytics across many client sites with scheduled reports and shareable dashboards.$q$, $q$Digital agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Free$q$, $q$€0$q$, $q$monthly$q$, $q$["3 sites","3 team members","60-day data retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Pro$q$, $q$€150/year (or €15/month)$q$, $q$annual or monthly$q$, $q$["10 sites","5 team members","1-year data retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Business$q$, $q$€390/year (or €39/month)$q$, $q$annual or monthly$q$, $q$["50 sites","20 team members","3-year data retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["MIT licensed","Single Go binary with embedded DuckDB","No external database required"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HitKeep is a web analytics platform built around data ownership and privacy. It tracks website traffic, conversions, and search performance without relying on cookies or third-party ad-network data sharing, and it distinguishes crawler traffic (including AI crawlers) from human visits. The product is offered both as a managed cloud service, with EU (Frankfurt) and US (Virginia) hosting regions, and as MIT-licensed, self-hostable software.$q$, $q$The self-hosted build runs as a single Go binary with an embedded DuckDB database and NSQ messaging, requiring no external database or container orchestration, and runs on Linux amd64/arm64. Cloud pricing is tiered by site count, team size, and data retention, while the self-hosted version is free to run indefinitely.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$HitKeep targets privacy-conscious teams, organizations that answer to a data protection officer, and agencies managing analytics for multiple client sites who want either EU/US data residency in the cloud or full control via self-hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('908dae33-8b4a-4b73-8ca9-33e3eb8522aa', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Litlyx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, cookieless European web and product analytics platform with AI-assisted reporting and self-hosting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€8.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Litlyx: open-source, cookieless European analytics platform with AI reporting, self-hosting, and pageview-based pricing.$q$,
  og_description = $q$Litlyx: open-source, cookieless European analytics platform with AI reporting, self-hosting, and pageview-based pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bcaaafb7-ce4e-47a5-9712-f545552b12e7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bcaaafb7-ce4e-47a5-9712-f545552b12e7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Cookieless tracking$q$, $q$Tracks visitors anonymously without cookies, avoiding the need for a consent banner.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Custom events and funnels$q$, $q$Supports defining custom events and analyzing conversion funnels.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$AI data analyst$q$, $q$Includes an AI feature for interpreting analytics data and answering questions about it.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Real-time dashboards$q$, $q$Displays live traffic and event data in real-time dashboards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Branded reports$q$, $q$Generates one-click, shareable branded reports.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$SEO keyword tracking$q$, $q$Monitors SEO keyword performance alongside traffic analytics.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Multi-domain management$q$, $q$Manages analytics across multiple domains from one account.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Self-hosting$q$, $q$Open-source codebase can be self-hosted instead of using the hosted cloud plans.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Open source with a self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Cookieless tracking avoids consent-banner requirements$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Integrates with Shopify, WordPress, Google Tag Manager, and Framer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Includes AI-assisted analysis on top of standard dashboards$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Paid cloud plans are priced by pageview volume, which can grow with traffic$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$AI features and higher data retention require paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$No published free-forever cloud tier beyond the entry Mini plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Is Litlyx free?$q$, $q$Litlyx is open source and can be self-hosted for free; the hosted cloud plans start at €8.99/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Does Litlyx require a cookie consent banner?$q$, $q$No, it uses cookieless, anonymous tracking designed for GDPR compliance without a consent banner.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Can Litlyx be self-hosted?$q$, $q$Yes, the platform is open source on GitHub with a self-hosting option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$What integrations does Litlyx support?$q$, $q$It integrates with Shopify, WordPress, Google Tag Manager, and Framer.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Cookieless website analytics$q$, $q$Site owners get GDPR-friendly traffic analytics without a consent banner.$q$, $q$Small businesses and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Multi-site agency reporting$q$, $q$Agencies manage analytics and branded reports across multiple client domains from one dashboard.$q$, $q$Freelancers and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Mini$q$, $q$€8.99/month$q$, $q$monthly$q$, $q$["Up to 10K pageviews"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Basic$q$, $q$€14.99/month$q$, $q$monthly$q$, $q$["Up to 100K pageviews"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$Pro$q$, $q$€29.99/month$q$, $q$monthly$q$, $q$["Up to 350K pageviews"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Litlyx is a European, privacy-first analytics platform positioned as an alternative to Google Analytics. It tracks website traffic, product usage, SEO keywords, and marketing attribution without cookies or personal-data collection, aiming to be GDPR-compliant without requiring a cookie consent banner.$q$, $q$The project is open source on GitHub, with a self-hosting option in addition to its hosted cloud plans. Cloud pricing is based on monthly pageview volume, and the platform includes an AI-powered assistant for interpreting analytics data alongside real-time dashboards, custom events, funnels, and one-click branded reports.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Litlyx targets small agencies, freelancers, and solopreneurs managing multiple sites, as well as businesses that want GDPR-compliant analytics with a simpler setup than Google Analytics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaaafb7-ce4e-47a5-9712-f545552b12e7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Liwan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Apache 2.0-licensed, single-binary self-hosted web analytics with no cookies, no database, and built-in bot filtering.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Liwan: Apache 2.0-licensed, single-binary self-hosted web analytics with no cookies, no database, and bot filtering.$q$,
  og_description = $q$Liwan: Apache 2.0-licensed, single-binary self-hosted web analytics with no cookies, no database, and bot filtering.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c95b7ac8-c110-41fe-a3fc-2fb5237155d8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c95b7ac8-c110-41fe-a3fc-2fb5237155d8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Single-binary deployment$q$, $q$Ships as one self-contained binary with no external database dependency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Cookieless tracking$q$, $q$Tracks visitors without cookies, cross-site tracking, or persistent identifiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Real-time dashboard$q$, $q$Updates traffic dashboards automatically in real time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Bot and crawler filtering$q$, $q$Filters known bots and crawlers from visitor reports automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Visitor group and referrer tracking$q$, $q$Tracks page views, visitor groups, and referrer sources.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Low resource footprint$q$, $q$Designed to run on budget VPS instances, older hardware, or a Raspberry Pi.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Fully open source under the permissive Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$No database to set up or maintain — single binary handles everything$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Cookieless, privacy-respecting tracking with all data kept on your own server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Very low resource requirements, suitable for cheap or older hardware$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Self-hosting only — no managed cloud option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$No published details on advanced features like funnels or custom event tracking$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Requires comfort with server administration to deploy and maintain$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Is Liwan free?$q$, $q$Yes, Liwan is free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Does Liwan require a database?$q$, $q$No, it runs as a single self-contained binary with no external database dependency.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Does Liwan use cookies?$q$, $q$No, it tracks visitors without cookies, cross-site tracking, or persistent identifiers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Can Liwan run on a Raspberry Pi?$q$, $q$Yes, it is designed to be lightweight enough for budget VPS instances, older computers, or a Raspberry Pi.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$Lightweight self-hosted analytics$q$, $q$Developers deploy Liwan on minimal hardware to get privacy-respecting traffic analytics without third-party services.$q$, $q$Self-hosting developers$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Liwan is a privacy-focused, self-hosted web analytics tool built in Rust with tokio for asynchronous I/O. It runs as a single, self-contained binary with no separate database dependency, tracking page views, visitor groups, and referrers without cookies, cross-site tracking, or persistent identifiers. All collected data stays on the operator's own server.$q$, $q$The project is fully open source under the Apache 2.0 license and is designed to run efficiently on modest hardware, including budget VPS instances, older computers, or a Raspberry Pi. It provides a real-time dashboard that updates automatically and includes built-in filtering of bot and crawler traffic.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Liwan suits developers and site operators who want lightweight, self-hosted analytics with strong data sovereignty and minimal server resource requirements, and who are comfortable deploying and maintaining a self-hosted binary.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c95b7ac8-c110-41fe-a3fc-2fb5237155d8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Medama Analytics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable privacy analytics with a sub-1KB tracker, no cookies, and no IP address collection.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Medama Analytics: open-source, self-hosted privacy analytics with a sub-1KB tracker, no cookies, no IP collection.$q$,
  og_description = $q$Medama Analytics: open-source, self-hosted privacy analytics with a sub-1KB tracker, no cookies, no IP collection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd820a867-fd9f-44d0-a672-841fea19edfc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd820a867-fd9f-44d0-a672-841fea19edfc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Sub-1KB tracker$q$, $q$Ships a lightweight tracking script under 1KB in size.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$No cookies, no IP collection$q$, $q$Tracks visitors without cookies or storing IP addresses.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Real-time monitoring$q$, $q$Provides real-time analytics on website performance and user interactions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$GDPR/PECR-oriented design$q$, $q$Built with GDPR and PECR privacy compliance as a design goal.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$OpenAPI server$q$, $q$Exposes an OpenAPI-based backend for dashboard and integration use.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Single-binary, low-resource deployment$q$, $q$Runs as a single binary requiring as little as 256MB of memory with no external dependencies.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Very lightweight tracker and low server resource requirements$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$No cookies or IP address collection by design$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Simple single-binary self-hosted deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Self-hosting only — no hosted/managed option documented$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$No published pricing since there is no commercial tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Requires server administration knowledge to deploy and maintain$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Is Medama Analytics free?$q$, $q$Yes, it is open source and self-hostable at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Does Medama Analytics collect IP addresses?$q$, $q$No, its documentation states it does not collect IP addresses or use cookies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$How much server resource does Medama Analytics need?$q$, $q$It's designed to run with minimal resources, as little as 256MB of memory, with no external dependencies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Is there a hosted version of Medama Analytics?$q$, $q$The documentation describes it as self-hostable software; no separate hosted SaaS option is documented.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$Privacy-compliant site analytics$q$, $q$Website owners collect basic usage analytics while meeting GDPR/PECR requirements without cookies or IP logging.$q$, $q$Privacy-conscious website owners$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Medama Analytics is a self-hostable, privacy-focused website analytics platform. Its tracking script is under 1KB and does not use cookies or collect IP addresses, and the server is designed for a straightforward single-binary deployment that runs with minimal resources (as little as 256MB of memory) and no external dependencies.$q$, $q$The project targets GDPR and PECR compliance and exposes an OpenAPI-based server for integrating with its dashboard. It is described as open source and self-hostable, with no hosted/SaaS offering mentioned on the project's documentation site.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It is aimed at website owners and operators who want a minimal-footprint, self-hosted analytics tool that avoids cookies and IP collection for GDPR/PECR compliance, and who prefer full control over their analytics infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d820a867-fd9f-44d0-a672-841fea19edfc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Offen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted web analytics that requires opt-in consent and gives users full access to their own data.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Portuguese$q$, $q$Spanish$q$, $q$Vietnamese$q$]::text[],
  seo_meta_description = $q$Offen: free, open-source, self-hosted analytics with opt-in consent, end-to-end encryption, and user data transparency.$q$,
  og_description = $q$Offen: free, open-source, self-hosted analytics with opt-in consent, end-to-end encryption, and user data transparency.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '20af8fc3-9e0e-4ee6-9421-b638361573df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '20af8fc3-9e0e-4ee6-9421-b638361573df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Opt-in only tracking$q$, $q$Visitors must actively consent before any data is collected; nothing is tracked by default.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$End-to-end encryption$q$, $q$All collected user data is end-to-end encrypted.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$User data transparency$q$, $q$Users can view, export, or delete their own collected data at any time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Real-time reporting$q$, $q$Shows page views, key metrics, top pages, and weekly retention in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Filterable analytics$q$, $q$Filters data by URL, location, referrer, UTM parameters, and landing/exit pages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Multi-site support$q$, $q$Manages multiple websites from a single Offen installation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Team sharing$q$, $q$Supports sharing analytics access with a team.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Customizable consent banner$q$, $q$Ships a customizable banner for collecting visitor opt-in consent.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Free, open source, and self-hosted with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Genuine opt-in consent model rather than a cookie-banner workaround$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$End-to-end encrypted, user-accessible data builds real transparency$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Multi-language interface support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Opt-in-only tracking means lower data coverage than consent-agnostic analytics tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Six-month data retention limit may not suit long-term trend analysis$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Self-hosting required — no hosted SaaS version$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Project activity/maintenance cadence should be checked before production use$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Is Offen free?$q$, $q$Yes, Offen is free, open source, and the project states it will always remain free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Does Offen require cookie consent?$q$, $q$Offen uses an opt-in-only model — visitors must actively consent before any tracking occurs, via a customizable consent banner.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$How long does Offen retain data?$q$, $q$Data retention is limited to a maximum of six months.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Can users see their own tracked data?$q$, $q$Yes, users can view, export, or delete their own data at any time through a transparency dashboard.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$Consent-first website analytics$q$, $q$Site operators collect usage analytics based on genuine visitor opt-in rather than a cookie banner that tracks by default.$q$, $q$Privacy-focused website operators$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Offen is an open-source, self-hosted web analytics tool built around a "fair analytics" model: tracking is opt-in only, all collected user data is end-to-end encrypted, and every visitor can view, export, or delete their own data at any time through a transparency dashboard. Development began in 2019 with support from the NLnet Foundation's Next Generation Internet initiative.$q$, $q$The project provides real-time metrics — page views, key metrics, top pages, and weekly retention — filterable by URL, location, referrer, UTM parameters, and landing/exit pages, and supports multiple websites within a single installation. Data is retained for a maximum of six months. Offen's stated commitment is that the core product will always remain free to use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Offen is built for website operators who want GDPR-compliant analytics based on genuine user consent and transparency rather than cookie-banner workarounds, and who are willing to self-host the platform themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20af8fc3-9e0e-4ee6-9421-b638361573df', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Prisme Analytics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, GDPR-compliant web analytics built on Grafana and ClickHouse, available self-hosted or as a single-plan cloud.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$€8.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Prisme Analytics: open-source, GDPR-compliant analytics on Grafana and ClickHouse, self-hosted or single-plan cloud.$q$,
  og_description = $q$Prisme Analytics: open-source, GDPR-compliant analytics on Grafana and ClickHouse, self-hosted or single-plan cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2273c295-f582-4fee-a5d0-42845b0dfade';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2273c295-f582-4fee-a5d0-42845b0dfade' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Real-time analytics$q$, $q$Processes traffic data in real time rather than with the multi-day delay typical of Google Analytics.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Bot and spam filtering$q$, $q$Filters bot and spam traffic to show human-only visit counts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Custom dashboards$q$, $q$Built on Grafana, supporting funnels, histograms, and geomaps as custom visualizations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Custom events$q$, $q$Tracks custom events beyond default pageview metrics.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$SQL query API$q$, $q$Exposes a SQL query API for direct exploration of underlying ClickHouse data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$JavaScript-less tracking option$q$, $q$Supports tracking via a pixel GIF tag as an alternative to JavaScript.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$UTM campaign tracking$q$, $q$Tracks campaign performance via UTM parameters.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$No cookie banner required$q$, $q$Designed to meet GDPR/CCPA/PECR/Schrems II compliance without a cookie consent banner.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Open source with self-hosting available to avoid vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Same feature set in open-source and cloud versions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Real-time reporting instead of a multi-day data delay$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Single, all-inclusive pricing plan with unlimited websites and pageviews on Cloud$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Cloud has a single plan rather than lower-cost entry tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Self-hosting requires running and maintaining Grafana and ClickHouse infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$SQL query API assumes some familiarity with ClickHouse/SQL for advanced use$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Is Prisme Analytics open source?$q$, $q$Yes, it's open source on GitHub and can be self-hosted with the same feature set as the paid Cloud offering.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$How much does Prisme Cloud cost?$q$, $q$Prisme Cloud uses a single all-inclusive plan priced at €8.99/month, with a 30-day free trial and no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Does Prisme Analytics require a cookie banner?$q$, $q$No, it's designed for GDPR/CCPA/PECR/Schrems II compliance without requiring a cookie consent banner.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$What is Prisme Analytics built on?$q$, $q$It's built on Grafana for dashboards and ClickHouse for data storage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Cookie-banner-free site analytics$q$, $q$Website owners get GDPR-compliant traffic analytics without showing a cookie consent banner.$q$, $q$Website owners and content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Self-hosted analytics with SQL access$q$, $q$Technical teams self-host Prisme and query the underlying ClickHouse data directly via SQL.$q$, $q$Data-savvy engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Prisme Cloud$q$, $q$€8.99/month$q$, $q$monthly$q$, $q$["Unlimited websites","Unlimited pageviews and events","Unlimited dashboards","GDPR compliance","30-day free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$Self-hosted$q$, $q$Free (open source)$q$, $q$N/A$q$, $q$["Same features as Prisme Cloud","Built on Grafana and ClickHouse","Full data ownership"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Prisme Analytics is a privacy-focused web analytics platform positioned as an alternative to Google Analytics. It's built on top of Grafana for dashboards and ClickHouse for data storage, processes traffic in real time (versus the 24-48 hour delay typical of Google Analytics), and is designed to operate without a cookie consent banner.$q$, $q$The project is open source and available on GitHub, with the stated goal that all features available in Prisme Cloud are also available in the open-source, self-hosted distribution. The hosted Cloud offering uses a single all-inclusive pricing plan rather than tiered plans, billed monthly with a 30-day free trial and no credit card required to start.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Prisme Analytics suits website owners, content creators, agencies, and e-commerce businesses that want real-time, cookie-banner-free analytics with GDPR/CCPA/PECR compliance, plus the option to self-host to avoid vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2273c295-f582-4fee-a5d0-42845b0dfade', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Rybbit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, cookieless web analytics platform with session replay, funnels, and real-time dashboards.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted, open source); Cloud from $13/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Rybbit is an open-source, cookieless web analytics platform with real-time dashboards, session replay, and funnels.$q$,
  og_description = $q$Rybbit is an open-source, cookieless web analytics platform with real-time dashboards, session replay, and funnels.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2c1b5e9c-512c-48b9-b212-f464f5c0a339';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2c1b5e9c-512c-48b9-b212-f464f5c0a339' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Real-time dashboard$q$, $q$Live visitor tracking and instant updates to traffic data as it happens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Session replay$q$, $q$Watch recorded user sessions to see how visitors actually interact with a site (available on paid plans).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Conversion funnels & user journeys$q$, $q$Visualize where visitors drop off and map full navigation paths through a site.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Web Vitals monitoring$q$, $q$Tracks Core Web Vitals performance metrics for site optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Cookieless, GDPR/CCPA-compliant tracking$q$, $q$Collects analytics data without cookies or personal-data-based tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Custom events & bot blocking$q$, $q$Track custom conversion events like sign-ups and purchases, with filtering to keep bot traffic out of reports.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Full API access$q$, $q$REST API for building custom integrations and pulling analytics data programmatically.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Open source and self-hostable at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$No cookies required, built for GDPR/CCPA compliance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Real-time dashboard with funnels, journeys, and Web Vitals in one tool$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Affordable entry-level paid tier compared to many analytics competitors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$EU-hosted cloud option for data residency$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Session replay is limited to the Pro tier and above$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Cloud pricing scales with number of sites and team members$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$On-premise installation and SSO are gated behind custom Enterprise pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Self-hosting requires running and maintaining your own Docker/ClickHouse infrastructure$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Is Rybbit free to use?$q$, $q$Yes, the self-hosted version is free and open source under AGPL-3.0. Rybbit also offers a paid cloud version starting at $13/month for teams that don't want to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Is Rybbit open source?$q$, $q$Yes, the full codebase is available on GitHub (rybbit-io/rybbit) under an AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Does Rybbit use cookies?$q$, $q$No, Rybbit is designed as a cookieless analytics tool aimed at GDPR and CCPA compliance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Can I self-host Rybbit?$q$, $q$Yes, Rybbit ships with Docker Compose configurations for self-hosted deployment, or you can use their managed cloud offering.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Privacy-conscious website tracking$q$, $q$Track site traffic and behavior without cookies or invasive user tracking.$q$, $q$Small business and website owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Product analytics with session replay$q$, $q$Use funnels, journeys, and session replay to understand user behavior in a web app.$q$, $q$SaaS and product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Self-hosted enterprise analytics$q$, $q$Run Rybbit on-premise with SSO and infinite retention for compliance-sensitive organizations.$q$, $q$Enterprises with data residency requirements$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full self-hosted deployment","Core analytics dashboard","Custom events, funnels, goals, journeys, Web Vitals","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Standard$q$, $q$$13/month$q$, $q$monthly$q$, $q$["Up to 5 websites","Up to 3 team members","3-year data retention","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Pro$q$, $q$$26/month$q$, $q$monthly$q$, $q$["Unlimited websites and team members","Session replays","5-year data retention","10x API rate limit","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Single sign-on (SSO)","Infinite data retention","Dedicated instance","On-premise installation","Whitelabeling"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Rybbit is an open-source web analytics platform positioned as a modern, privacy-friendly alternative to Google Analytics. It tracks visitors without cookies and offers a real-time dashboard, session replay, conversion funnels, user journey mapping, and Core Web Vitals monitoring.$q$, $q$The code is fully open source and available on GitHub under an AGPL-3.0 license, so teams can self-host it on their own infrastructure. Rybbit also offers a managed cloud version hosted on EU infrastructure in Germany for teams that don't want to run their own servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Rybbit suits website owners and product teams who want detailed, privacy-compliant analytics (GDPR/CCPA) without relying on Google Analytics, and who value the option to self-host their analytics stack or use a paid cloud plan for convenience and session replay.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2c1b5e9c-512c-48b9-b212-f464f5c0a339', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Shaper ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, SQL-first BI tool powered by DuckDB for building dashboards, PDF reports, and embedded analytics.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (open source, self-hosted)$q$,
  founded_year = 2024,
  company_size = NULL,
  headquarters = $q$Estonia$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Shaper is an open-source, SQL-first BI tool built on DuckDB for dashboards, PDF reports, and embedded analytics.$q$,
  og_description = $q$Shaper is an open-source, SQL-first BI tool built on DuckDB for dashboards, PDF reports, and embedded analytics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ed136ebf-ec30-4027-aba4-c834b251578e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ed136ebf-ec30-4027-aba4-c834b251578e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$SQL-first dashboards$q$, $q$Build interactive charts and dashboards by writing SQL with special syntax that controls visualization type.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$DuckDB-powered multi-source querying$q$, $q$Query Postgres, S3, Google Sheets, and other sources through DuckDB extensions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Embedded analytics SDKs$q$, $q$JS and React SDKs with JWT-based row-level security for embedding dashboards into your own product.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Automated reporting & exports$q$, $q$Generate PDF, PNG, CSV, and Excel exports, plus scheduled alerts and password-protected shareable links.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Git-based workflow$q$, $q$Manage dashboards as SQL files under version control, deployable via CI/CD pipelines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Self-hosted single-container deployment$q$, $q$Runs as one Docker container (`docker run ... taleshape/shaper`) for quick self-hosted setup.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Open source and self-hostable in a single Docker container$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$No vendor lock-in — you can take your server and data with you$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Powerful, flexible SQL-first approach built on DuckDB$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Built-in embedding and white-labeling for customer-facing analytics$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Git-based, version-controlled 'BI-as-code' workflow$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Requires SQL knowledge; not a no-code/drag-and-drop tool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Newer project (open-sourced in 2025) with a smaller community than established BI tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Managed hosting plan pricing is not publicly listed and requires booking a demo$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Is Shaper free to use?$q$, $q$Yes, the core product is open source under the Mozilla Public License 2.0 and free to self-host. Taleshape also offers paid managed hosting and support plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$What database does Shaper use?$q$, $q$Shaper is powered by DuckDB and can query multiple external data sources through DuckDB extensions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Can Shaper dashboards be embedded in other apps?$q$, $q$Yes, Shaper provides JS and React SDKs with JWT-based access control for embedding dashboards into your own product.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Who built Shaper?$q$, $q$Shaper is built by Taleshape OÜ, founded by Jorin Vogel.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Customer-facing embedded analytics$q$, $q$Embed white-labeled dashboards directly into a SaaS product using the JS/React SDKs.$q$, $q$Developers building customer-facing analytics$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$BI-as-code workflows$q$, $q$Define and version-control dashboards as SQL files, deployed through CI/CD.$q$, $q$Data engineers and technical data teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Automated reporting$q$, $q$Generate scheduled PDF, CSV, and Excel reports and shareable links from SQL queries.$q$, $q$Teams needing recurring data exports$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full self-hosted deployment","SQL-first dashboards and reports","Embedded analytics SDKs","Data exports"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Standard (Managed)$q$, $q$Custom (contact for pricing)$q$, $q$monthly or yearly$q$, $q$["Cloud-hosted, all open-source features","Automatic updates, backups, monitoring","Custom domain","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Pro (Managed)$q$, $q$Custom (contact for pricing)$q$, $q$monthly or yearly$q$, $q$["Everything in Standard","AI data analyst / MCP server integration","Single sign-on (SSO)","Email and video call support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$Enterprise (Managed)$q$, $q$Custom$q$, $q$custom$q$, $q$["Everything in Pro","Compliance support (HIPAA, GDPR, SOC2, C5)","Audit logging, high-availability deployment","Fractional data engineering support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Shaper is an open-source data platform for building dashboards, PDF reports, and data exports entirely by writing SQL, powered by DuckDB as its query engine. It runs as a single Docker container and supports querying across multiple data sources, including Postgres, S3, and Google Sheets, via DuckDB extensions.$q$, $q$Built by Taleshape OÜ, Shaper was made open source under the Mozilla Public License 2.0 in August 2025. Beyond the free self-hosted core, Taleshape offers managed hosting and support plans (Standard, Pro, and Enterprise) for teams that want a fully-managed instance instead of running the infrastructure themselves.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Shaper is aimed at developers and data teams comfortable writing SQL who want a 'BI-as-code' workflow — dashboards defined in version-controlled SQL files, deployable through CI/CD — plus the ability to embed dashboards into their own products via JS/React SDKs with JWT-based access control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed136ebf-ec30-4027-aba4-c834b251578e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Superset ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, Apache-licensed open-source platform for data exploration, SQL querying, and building BI dashboards.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Apache Superset is a free, open-source BI platform for data exploration, SQL querying, and dashboard visualization.$q$,
  og_description = $q$Apache Superset is a free, open-source BI platform for data exploration, SQL querying, and dashboard visualization.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0c430e24-d037-4fa9-9d90-6b483daf4467';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0c430e24-d037-4fa9-9d90-6b483daf4467' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$No-code chart builder$q$, $q$Drag-and-drop interface for rapidly building charts without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$SQL Lab$q$, $q$Web-based SQL editor for advanced, ad-hoc querying against connected databases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$40+ visualization types$q$, $q$Pre-installed chart types ranging from basic charts to geospatial visualizations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Broad database connectivity$q$, $q$Connects to 40+ SQL databases and data engines including Snowflake, BigQuery, Databricks, and PostgreSQL.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Semantic layer$q$, $q$Define reusable custom dimensions and metrics on top of raw data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Dashboard filtering & cross-filters$q$, $q$Interactive filtering, drill-down, and cross-filtering across dashboard charts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Extensible security & RBAC$q$, $q$Configurable authentication and role-based access control.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$REST API$q$, $q$Programmatic access for automation and custom integrations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Completely free and open source under Apache-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Backed by the Apache Software Foundation with an active community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Supports 40+ database connectors out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Highly extensible and customizable (no vendor lock-in)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$No-code chart builder alongside a full SQL editor for advanced users$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Requires self-hosting and infrastructure maintenance — there is no official hosted SaaS from the Apache project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Setup and configuration require technical/DevOps expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Steeper learning curve for non-technical business users compared to some commercial BI tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Is Apache Superset free?$q$, $q$Yes, Superset is fully free and open source under the Apache-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Who maintains Apache Superset?$q$, $q$It is a top-level project of the Apache Software Foundation, developed by an open community; it originated as a hackathon project at Airbnb in 2015.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Does Apache Superset offer a hosted version?$q$, $q$The Apache project itself does not offer official hosting; third-party companies offer managed Superset hosting separately.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$What databases does Superset support?$q$, $q$It connects to 40+ SQL databases and data engines, including PostgreSQL, MySQL, Snowflake, BigQuery, and Databricks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Internal BI dashboards$q$, $q$Build and share dashboards across teams using data already stored in existing databases.$q$, $q$Data and analytics teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$SQL-based data exploration$q$, $q$Use SQL Lab to run ad-hoc queries against connected databases without a separate SQL client.$q$, $q$Data engineers and analysts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$Free alternative to commercial BI tools$q$, $q$Replace paid tools like Tableau or Looker with a self-hosted, open-source platform.$q$, $q$Organizations wanting to avoid BI licensing costs$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache Superset is a modern, open-source data exploration and visualization platform. It provides a drag-and-drop chart builder with 40+ visualization types, a SQL Lab editor for advanced querying, a semantic layer for reusable metrics and dimensions, and connectivity to 40+ SQL databases and data engines including PostgreSQL, MySQL, Snowflake, BigQuery, and Databricks.$q$, $q$The project began as an internal hackathon project at Airbnb in 2015 and was open sourced the following year. It joined the Apache Incubator in 2017 and became a top-level Apache Software Foundation project in January 2021, coinciding with the 1.0 release. It is licensed under Apache-2.0 and developed by an open community rather than a single company.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Superset is built for data teams and engineers who want a free, self-hosted, highly extensible BI platform with broad database support and a REST API, as an alternative to commercial tools like Tableau or Looker.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c430e24-d037-4fa9-9d90-6b483daf4467', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── Swetrix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Privacy-first, open-source web analytics with cookieless tracking, funnels, error tracking, and A/B testing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted Community Edition); Cloud from €17/month$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = $q$United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Swetrix is a privacy-first, open-source web analytics platform with cookieless tracking, funnels, and A/B testing.$q$,
  og_description = $q$Swetrix is a privacy-first, open-source web analytics platform with cookieless tracking, funnels, and A/B testing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dbf0bc1e-5145-4d83-9f13-9dc8858e5f47' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Cookieless, privacy-first tracking$q$, $q$Tracks traffic without cookies or personal data collection, designed for GDPR compliance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Custom events & goals$q$, $q$Track conversions like sign-ups and purchases with custom event and goal definitions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Session replay$q$, $q$Watch recorded user sessions on the Cloud plans to see actual visitor behavior.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Error tracking$q$, $q$Automatic detection and aggregated reporting of JavaScript errors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Funnels & performance monitoring$q$, $q$Visualize conversion funnels and monitor real-user page load performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$A/B testing & feature flags$q$, $q$Run experiments and gradual feature rollouts (available on the Plus plan and above).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Google Search Console integration$q$, $q$Connects with Search Console for combined SEO and traffic insights.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Open-source Community Edition is free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Cookieless tracking designed for GDPR compliance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Bootstrapped, subscriber-funded company with a transparent business model$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Combines analytics with A/B testing, feature flags, and error tracking in one tool$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$14-day free trial on paid Cloud plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Session replay, A/B testing, and feature flags are gated behind paid Cloud plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Self-hosting requires managing a MySQL + ClickHouse + Redis stack$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Cloud pricing scales with monthly event volume$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Smaller community compared to more established analytics tools$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Is Swetrix free?$q$, $q$The self-hosted Community Edition is free and open source (AGPLv3). The Cloud version starts at €17/month with a 14-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Is Swetrix GDPR-compliant?$q$, $q$Yes, Swetrix uses cookieless, privacy-first tracking designed for GDPR and CCPA compliance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Can I self-host Swetrix?$q$, $q$Yes, the Community Edition can be self-hosted via Docker with your own MySQL, ClickHouse, and Redis instances.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Where is Swetrix based?$q$, $q$Swetrix Ltd is based in the UK, with its Cloud infrastructure hosted in Germany via Hetzner.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$GDPR-compliant analytics$q$, $q$Replace Google Analytics with cookieless, privacy-first tracking.$q$, $q$Privacy-conscious businesses and EU-based companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Product experimentation$q$, $q$Run A/B tests and feature flag rollouts alongside standard analytics.$q$, $q$Product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Self-hosted EU analytics$q$, $q$Run the open-source Community Edition on your own infrastructure for full data control.$q$, $q$Developers needing self-hosted, EU-hosted analytics$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Community Edition (Self-Hosted)$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted deployment","Core analytics, events, and goals","Error tracking","Open source, AGPLv3"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Standard$q$, $q$€17/month$q$, $q$monthly$q$, $q$["10 websites","Up to 50M monthly events","Funnels, performance monitoring, error tracking","Advanced bot detection","300 API requests/hour"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Plus$q$, $q$€35/month$q$, $q$monthly$q$, $q$["100 websites","Up to 50M monthly events","Session replays, A/B testing, feature flags","20x higher API rate limits","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Dedicated account manager","Custom event limits","On-premise installation","SAML-based SSO","Enterprise SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Swetrix is a privacy-first, cookieless web analytics platform positioned as an alternative to Google Analytics. It tracks pageviews, visitors, referrers, devices, and countries without collecting personal data, and adds custom events and goals, funnels, error tracking, performance monitoring, A/B testing, and feature flags.$q$, $q$The platform is fully open source, with a self-hostable Community Edition (backend built on Nest.js, MySQL, ClickHouse, and Redis) available under the AGPLv3 license, alongside a paid Cloud version hosted on EU infrastructure (Germany, via Hetzner). Swetrix Ltd is a UK-based, bootstrapped, subscriber-funded company operating since 2021.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Swetrix suits privacy-conscious teams who want GDPR-compliant, cookieless analytics along with product experimentation features like A/B testing and feature flags, whether they prefer a managed cloud plan or self-hosting the Community Edition.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dbf0bc1e-5145-4d83-9f13-9dc8858e5f47', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Vince ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted web analytics platform shipped as a single binary — a privacy-friendly alternative to Google Analytics.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Vince: free, open-source, self-hosted web analytics software shipped as a single binary — a privacy-friendly Google Analytics alternative.$q$,
  og_description = $q$Vince: free, open-source, self-hosted web analytics software shipped as a single binary — a privacy-friendly Google Analytics alternative.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Single-binary deployment$q$, $q$Ships as one binary with everything included — no external dependencies — deployable via Docker, Helm charts, or a direct download.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Cookieless, privacy-friendly tracking$q$, $q$Designed to be GDPR, CCPA, and PECR compliant without requiring cookie consent notices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Custom events and goal conversions$q$, $q$Track custom events and goal/conversion completions in addition to standard pageview metrics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$File download, outbound link, and 404 tracking$q$, $q$Automatically tracks file downloads, outbound link clicks, and 404 page hits.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Unlimited websites and events$q$, $q$No per-site or per-event caps built into the software itself, unlike many hosted analytics tiers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Lightweight tracking script$q$, $q$Official tracking script is under 1KB and is compatible with Plausible Analytics' script format.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Automatic TLS$q$, $q$Built-in automatic TLS certificate provisioning (Let's Encrypt) for self-hosted deployments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Columnar storage with compressed roaring bitmaps$q$, $q$Uses compressed roaring bitmap indexing over columnar storage for query performance at scale.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Free and open source (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Single binary makes self-hosted deployment simple compared to multi-service analytics stacks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$No cookie banners needed due to privacy-first design$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$No artificial limits on sites or tracked events$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Compatible with existing Plausible Analytics tracking scripts, easing migration$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$No official managed/cloud-hosted plan — self-hosting is required, which demands server/ops know-how$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Younger, smaller project (built by a small team/single maintainer credited) with a smaller ecosystem than Google Analytics or Plausible$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$No published pricing or SLA for support since it is community/self-hosted software$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Is Vince free to use?$q$, $q$Yes. Vince is open source under the AGPL-3.0 license and is free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Does Vince offer a hosted/cloud version?$q$, $q$No official cloud-hosted plan is published on the vince website — it is designed for self-hosting via Docker, Helm, or a standalone binary.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Is Vince compatible with Plausible Analytics?$q$, $q$Yes, vince's tracking script is compatible with existing Plausible Analytics setups.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$What license is Vince released under?$q$, $q$Vince is released under the GNU AGPL-3.0 open-source license.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Privacy-compliant analytics without cookie banners$q$, $q$Teams needing GDPR/CCPA/PECR-friendly tracking without displaying cookie consent notices.$q$, $q$Web teams and companies serving EU/privacy-regulated users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Self-hosted analytics with full data ownership$q$, $q$Running analytics infrastructure on infrastructure you control instead of sending data to a third party.$q$, $q$Developers and self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$Migrating from Google Analytics or Plausible$q$, $q$Replacing a paid or tiered analytics tool with an unlimited-site, single-binary self-hosted alternative.$q$, $q$Site owners consolidating analytics without per-tier pricing$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Vince is a self-hosted, open-source web analytics platform built as a privacy-friendly alternative to Google Analytics. It ships as a single binary with no external runtime dependencies, and can be deployed via Docker, Helm, or a direct binary download.$q$, $q$The project was created by developer Geofrey Ernest, who spent time researching how to apply compressed roaring bitmap indexing to web analytics events, which forms the basis of vince's columnar storage engine. Vince is compatible with existing Plausible Analytics tracking scripts, and its official tracking script is under 1KB.$q$, $q$Vince is released under the AGPL-3.0 license and does not currently offer an official managed or cloud-hosted version — it is designed to be self-hosted.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Vince is aimed at developers, site owners, and privacy-conscious teams who want to run their own analytics infrastructure instead of relying on Google Analytics or a paid SaaS analytics vendor.$q$, $q$It suits organizations that need cookieless, GDPR/CCPA/PECR-oriented tracking without cookie consent banners, and that want to track an unlimited number of websites and events without hitting artificial plan limits.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be0219f7-7fe9-4a97-a60c-8c7f5f4a3bdf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Collective Access - Providence ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source cataloguing and collections management software for museums and archives — not an e-signature tool.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Collective Access - Providence is free, open-source cataloguing software for museums and archives — part of the CollectiveAccess suite since 2003.$q$,
  og_description = $q$Collective Access - Providence is free, open-source cataloguing software for museums and archives — part of the CollectiveAccess suite since 2003.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f7ad8964-3bed-4b24-a76a-71a5d1f01f13';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f7ad8964-3bed-4b24-a76a-71a5d1f01f13' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Configurable cataloguing$q$, $q$Pre-configured with popular metadata standards and supports customizable fields, views, and workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Batch import/export$q$, $q$Batch importing and exporting of collection records, plus PDF and spreadsheet report generation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Multi-format media support$q$, $q$Manages documents, images, audio, video, and 3D media formats within a single catalogue.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Multi-language localization$q$, $q$Supports localized user interfaces and multi-lingual metadata via locale codes for both the UI and catalogued data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Authority/vocabulary management$q$, $q$Manage controlled vocabularies and authority records for people, places, subjects, and organizations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Optional public front end (Pawtucket2)$q$, $q$Publish collections online with customizable facets, filters, mapping, timelines, and visualization tools, plus public commenting, tagging, and rating.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Self-hosted deployment$q$, $q$Runs on your own infrastructure, giving institutions full ownership and control of their collection data.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Highly configurable to different metadata standards and institution types$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Mature project in active use since 2003 with ongoing releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Scales from small archives to large museum collections$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Optional Pawtucket2 module for publishing collections publicly online$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Not an e-signature or document-signing tool, despite being listed in that category$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Requires self-hosting and server administration to run$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$High configurability can create a steep learning curve for new users$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Professional hosting, consulting, and support are paid add-on services, not included with the free software$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Is Collective Access - Providence an e-signature tool?$q$, $q$No. Providence is cataloguing and collections-management software for museums and archives, not a document e-signature product.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$What's the difference between Providence and Pawtucket2?$q$, $q$Providence is the back-end cataloguing application used to manage collection records; Pawtucket2 is an optional public-facing front end for publishing collections online.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Is CollectiveAccess free?$q$, $q$Yes, it is free, open-source software released under the GPL-3.0 license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Who maintains CollectiveAccess?$q$, $q$It is maintained by the staff of Whirl-i-Gig along with contributions from the open-source community.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Can I get paid support or hosting?$q$, $q$Yes, Whirl-i-Gig offers consulting, hosting, and support services to institutions for a fee, separate from the free open-source software.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Museum collections cataloguing$q$, $q$Cataloguing objects, artworks, and associated media with configurable metadata standards.$q$, $q$Museum registrars and curators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Archive and library digital collections management$q$, $q$Managing and describing archival and library holdings across multiple media formats.$q$, $q$Archivists and librarians$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$Public online collection portals$q$, $q$Publishing searchable, browsable collections to the public using the optional Pawtucket2 front end.$q$, $q$Institutions wanting to share collections online$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Collective Access - Providence is not an e-signature tool. Providence is the back-end cataloguing and data-management component of CollectiveAccess, a free, open-source software suite for cataloguing and publishing museum and archival collections. It is a framework for the management, description, and discovery of complex digital and physical collections in museum, archival, and research contexts.$q$, $q$CollectiveAccess began in 2003 as a response to a lack of non-commercial, affordable, open-source solutions for digital collections management. It is maintained by the staff of Whirl-i-Gig and contributed to by the open-source community, and is distributed under the GNU GPL-3.0 license.$q$, $q$The suite consists of two applications: Providence, the browser-based cataloguing back end used to manage collection records, and Pawtucket2, an optional public-facing front end for publishing collections online.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Providence is used by museums, archives, libraries, historical societies, and research/catalog raisonné projects that need a configurable system for cataloguing objects, images, audio, video, documents, and 3D media.$q$, $q$It suits institutions of varying sizes and technical sophistication that want a free, self-hosted alternative to commercial collections-management systems, and that are willing to configure metadata standards and workflows to their needs. Whirl-i-Gig also offers paid consulting, hosting, and support services for institutions that want professional implementation help.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7ad8964-3bed-4b24-a76a-71a5d1f01f13', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Eonvelope ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted email archiving tool for IMAP, POP, Exchange, and JMAP mailboxes — not an e-signature product.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2025,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Eonvelope is a free, open-source, self-hosted email archive for IMAP, POP, Exchange, and JMAP mailboxes — not an e-signature tool.$q$,
  og_description = $q$Eonvelope is a free, open-source, self-hosted email archive for IMAP, POP, Exchange, and JMAP mailboxes — not an e-signature tool.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5204669-8ef8-4418-a89c-cac392863262';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5204669-8ef8-4418-a89c-cac392863262' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Multi-protocol mail archiving$q$, $q$Connects to and archives mail from IMAP, POP, Microsoft Exchange, and JMAP accounts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Whole-account or per-folder archiving$q$, $q$Automatically archives mail traffic from single folders or entire mail accounts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Searchable web interface with threading$q$, $q$Browse and search archived mail through a web UI that preserves conversation threads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Mobile-friendly PWA$q$, $q$The web interface is built as a Progressive Web App for mobile-friendly access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Integrations with self-hosted apps$q$, $q$Can send attachments to Paperless-ngx or images to Immich directly from the archive.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Multi-factor authentication$q$, $q$Supports MFA for securing access to the archive.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Compact Docker deployment$q$, $q$Deploys as a small two-container Docker stack, with setup the project describes as taking under five minutes.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Free and open source (AGPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Simple, quick self-hosted setup with a small Docker footprint$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Integrates with other self-hosted tools such as Paperless-ngx and Immich$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Actively developed with public documentation and regular releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Not an e-signature or document-signing tool, despite being listed in that category$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Very young project (created 2025) with a small maintainer/contributor base and limited track record$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Requires self-hosting and Docker/server administration knowledge$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$No hosted/managed version — self-hosting is the only deployment option$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Is Eonvelope an e-signature tool?$q$, $q$No. Eonvelope is a self-hosted email archiving and preservation system, not a document e-signature product.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$What email protocols does Eonvelope support?$q$, $q$IMAP, POP, Microsoft Exchange, and JMAP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Is Eonvelope free?$q$, $q$Yes, it is released under the AGPLv3 open-source license and is self-hosted.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$How is Eonvelope deployed?$q$, $q$Via a small Docker-based stack the project describes as a two-container setup.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Who maintains Eonvelope?$q$, $q$Developer David Aderbauer and the Eonvelope Contributors, with an active GitLab repository (mirrored read-only on GitHub) created in mid-2025.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Personal email preservation$q$, $q$Archiving personal mailboxes for long-term, searchable access outside a provider's retention limits.$q$, $q$Privacy-focused individuals and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Searchable long-term mail records$q$, $q$Keeping a searchable, threaded archive of mail for small teams or organizations.$q$, $q$Small teams needing independent mail record-keeping$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$Home-lab / self-hosted stack integration$q$, $q$Pairing an email archive with other self-hosted services like Paperless-ngx and Immich.$q$, $q$Home-lab and self-hosted-stack users$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Eonvelope is not an e-signature or document-envelope tool. It is a free, open-source, self-hosted email preservation and archiving system that connects to IMAP, POP, Microsoft Exchange, and JMAP accounts and automatically archives mail traffic from individual folders or entire mailboxes.$q$, $q$The project stores messages, attachments, and correspondent information while preserving conversation threads, and provides a web interface (built as a mobile-friendly Progressive Web App) for browsing and searching the archive. It is developed by David Aderbauer and community contributors, licensed under AGPLv3, with its primary repository hosted on GitLab (created June 2025) and a read-only mirror on GitHub.$q$, $q$Eonvelope is deployed as a small Docker-based stack (described by the project as a compact two-container setup) and includes documentation on ReadTheDocs, active releases, and an ongoing translation effort via Weblate.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Eonvelope is aimed at self-hosting enthusiasts and privacy-conscious individuals who want to preserve and search their own email history outside of their mail provider's retention window.$q$, $q$It also fits small teams or home-lab users who already run other self-hosted tools, since Eonvelope integrates with services like Paperless-ngx (for documents) and Immich (for photos) directly from its web interface.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5204669-8ef8-4418-a89c-cac392863262', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Omeka S ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Omeka S is a free, open-source platform for publishing and linking digital cultural heritage collections across multiple sites.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$Vienna, Virginia, US$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Omeka S is a free, open-source, self-hosted platform for publishing and linking digital cultural heritage collections online.$q$,
  og_description = $q$Omeka S is a free, open-source, self-hosted platform for publishing and linking digital cultural heritage collections online.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ed103661-d4a3-4fa4-8ac8-dccb7c67ed04';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ed103661-d4a3-4fa4-8ac8-dccb7c67ed04' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Multi-site management$q$, $q$Run and manage multiple public-facing sites from a single Omeka S installation and admin backend.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Linked open data$q$, $q$Resources are described with RDF and standard vocabularies, making collections publishable as linked open data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Items, item sets, and media$q$, $q$Core content is modeled as items, item sets, and media, described using customizable resource templates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$DPLA-ready templates$q$, $q$Resource templates designed to align with Digital Public Library of America (DPLA) metadata requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Module ecosystem$q$, $q$Extend functionality with modules such as CSV Import, Mapping, IIIF Presentation, Data Visualization, Scripto, and Zotero integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Responsive themes$q$, $q$Customize the public-facing presentation of each site with responsive, configurable themes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Role-based site permissions$q$, $q$Assign user roles and permissions that vary by site within the same installation.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Completely free and open source under the GNU GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Strong support for linked open data and semantic web standards$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Flexible metadata modeling via resource templates and vocabularies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Extensible through a large ecosystem of community modules$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Actively developed on GitHub with an established institutional backer (Digital Scholar)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Requires self-hosting a PHP/MySQL server and ongoing technical maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$No official managed hosting or paid support tier from the core team listed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Steeper learning curve for non-technical users compared to general-purpose website builders$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Is Omeka S free to use?$q$, $q$Yes. Omeka S is open-source software released under the GNU GPL license and can be downloaded and self-hosted at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Is Omeka S an e-signature tool?$q$, $q$No. Omeka S is a web publishing platform for digital cultural heritage collections, not an e-signature or document-signing product.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Who maintains Omeka S?$q$, $q$Omeka S is maintained by Digital Scholar (the Corporation for Digital Scholarship), which originated as part of the Roy Rosenzweig Center for History and New Media at George Mason University.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$What are Omeka S modules?$q$, $q$Modules are optional plugins that extend core functionality, such as CSV Import, Mapping, IIIF Presentation, and Zotero integration.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Can one installation run multiple sites?$q$, $q$Yes, Omeka S is designed so a single installation can host and manage multiple connected public sites.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Digital library and archive publishing$q$, $q$Libraries and archives use Omeka S to describe and publish digitized collections with structured, linkable metadata.$q$, $q$Libraries and archives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Museum digital collections$q$, $q$Museums publish object collections online using linked open data and DPLA-ready templates.$q$, $q$Museums and galleries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$Digital humanities projects$q$, $q$Universities and researchers build multi-site digital humanities projects on a single shared installation.$q$, $q$Academic and research institutions$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Omeka S is a next-generation, open-source web publishing platform for institutions that want to connect digital cultural heritage collections with other resources online. It is maintained by Digital Scholar (the Corporation for Digital Scholarship), which grew out of the Roy Rosenzweig Center for History and New Media (RRCHNM) at George Mason University, the original home of the Omeka project.$q$, $q$Unlike its predecessor Omeka Classic, Omeka S is built around linked open data: content is modeled using RDF and standard vocabularies, and a single installation can manage and publish multiple connected sites. It is distributed under the GNU GPL and is self-hosted, requiring a server running PHP and MySQL.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Omeka S is built for cultural heritage and academic institutions — libraries, archives, museums, galleries, and university digital-humanities projects — that need to describe, organize, and publish digital collections using structured, linkable metadata rather than a general-purpose CMS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed103661-d4a3-4fa4-8ac8-dccb7c67ed04', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Discount Bandit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Discount Bandit is a self-hosted price tracker that monitors Amazon, AliExpress, eBay and more, alerting you to price drops.$q$,
  pricing_model = $q$Free (self-hosted)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Arabic$q$]::text[],
  seo_meta_description = $q$Discount Bandit is a free, self-hosted price tracker for Amazon, AliExpress, eBay and more with custom alerts and Docker deploy.$q$,
  og_description = $q$Discount Bandit is a free, self-hosted price tracker for Amazon, AliExpress, eBay and more with custom alerts and Docker deploy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '09c39a74-1b42-4789-af73-47c7785446b4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '09c39a74-1b42-4789-af73-47c7785446b4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Multi-store price tracking$q$, $q$Track prices on Amazon, AliExpress, eBay, Walmart, Newegg, Noon, and custom stores from one dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Price history and change monitoring$q$, $q$Records historical price data so you can see how a product's price has changed over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Stock availability alerts$q$, $q$Get notified when a tracked product's stock status changes, not just when the price drops.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Customizable alert criteria$q$, $q$Configure multiple notification rules based on your own price and availability criteria.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Multi-user support$q$, $q$The web dashboard supports multiple users tracking their own products and alerts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Flexible self-hosted deployment$q$, $q$Install directly with PHP/Composer/MySQL or SQLite, or deploy via Docker, Docker Compose, or Portainer.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Companion browser extension (planned)$q$, $q$A browser extension for adding tracked products directly from store pages is listed as coming soon.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Free to run and fully self-hosted, keeping your tracked data private$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Supports several major retailers plus custom stores$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Actively developed with regular GitHub releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Multiple deployment options including Docker and Docker Compose$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Multi-user support and a Discord community for help$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Requires self-hosting knowledge (PHP, Composer, a database, and a web server)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$No license file is published in the GitHub repository, so reuse/redistribution terms are unclear$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$The browser companion extension is not yet released$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Smaller community compared to established commercial price trackers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Is Discount Bandit free?$q$, $q$Yes, it is a free, self-hosted application with no published pricing plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Which stores does it support?$q$, $q$Amazon, AliExpress, eBay, Walmart, Newegg, and Noon are supported out of the box, along with custom store configurations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$How do I install it?$q$, $q$You can install it directly with PHP, Composer, and MySQL or SQLite, or deploy it using Docker, Docker Compose, or Portainer.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Is there a browser extension?$q$, $q$A companion browser extension for adding products directly from store pages is planned but listed as coming soon.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Is Discount Bandit open source?$q$, $q$The source code is publicly available on GitHub, though the repository does not currently publish an explicit open-source license.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Personal deal hunting$q$, $q$Track wishlist items across multiple stores and get alerted when the price hits your target.$q$, $q$Individual shoppers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Privacy-conscious price tracking$q$, $q$Self-host your own tracker instead of relying on a third-party commercial service with your purchase interests.$q$, $q$Self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$Shared household or team tracking$q$, $q$Multiple users can track and manage their own product alerts on one shared instance.$q$, $q$Households or small teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Discount Bandit is a free, self-hosted, multi-user price-tracking application built with Laravel and Filament PHP. It monitors product prices across retailers including Amazon, AliExpress, eBay, Walmart, Newegg, and Noon, as well as custom stores, and tracks price history and stock availability over time.$q$, $q$The project is developed in the open on GitHub (cybrarist/discount-bandit), where it has an active release history (version 4.0.4 as of mid-2026) and a Discord community. It can be deployed directly with PHP, Composer, and MySQL/SQLite, or via Docker, Docker Compose, or Portainer using published images on Docker Hub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Discount Bandit is aimed at self-hosting enthusiasts and deal hunters who want to track prices across multiple online stores and receive custom alerts without relying on a third-party commercial price-tracking service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09c39a74-1b42-4789-af73-47c7785446b4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── flowctl ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$flowctl is a free, open-source, self-hosted workflow automation platform with YAML flows, approval gates, and a single binary.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2025,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$flowctl is a free, open-source workflow automation platform: YAML-defined flows, approval gates, RBAC, single-binary deploy.$q$,
  og_description = $q$flowctl is a free, open-source workflow automation platform: YAML-defined flows, approval gates, RBAC, single-binary deploy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4bc25f51-5006-4396-aeab-6860c203eba6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4bc25f51-5006-4396-aeab-6860c203eba6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Single-binary deployment$q$, $q$Ships as one binary with PostgreSQL as the only external dependency, simplifying self-hosted setup.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$YAML/HUML workflow definitions$q$, $q$Define flows through a built-in editor or as YAML/HUML configuration files with inputs and approvals.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Approval gates$q$, $q$Require explicit approval before sensitive workflow steps or operations can execute.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Team-based RBAC$q$, $q$Organize users into teams with role-based access control across user, operator, reviewer, and admin roles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$OIDC-based SSO$q$, $q$Authenticate users through OIDC single sign-on integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Remote execution$q$, $q$Run workflow steps remotely, including SSH-based execution across multiple nodes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Encrypted secret management$q$, $q$Store credentials and secrets encrypted at rest for use within workflows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Scheduled and real-time execution$q$, $q$Trigger flows on a cron schedule and monitor them with real-time streaming logs and notifications via email or webhooks.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Free and open source under the permissive Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Lightweight self-hosted deployment with only PostgreSQL as a dependency$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Built-in approval gates and RBAC suited for sensitive operational tasks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Public live demo lets you evaluate it before installing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Actively developed with frequent releases and recent commit activity$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Young project (created in late 2025), so the ecosystem and community are still small$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Requires self-hosting and a PostgreSQL database, with associated operational overhead$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Documented integrations are currently limited to SSH, email, and webhooks$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Is flowctl free?$q$, $q$Yes, flowctl is free and open source under the Apache 2.0 license, and is self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$What does flowctl require to run?$q$, $q$PostgreSQL is the only external dependency; everything else is included in the single binary.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Can I try flowctl before installing it?$q$, $q$Yes, a live demo is available at demo.flowctl.net.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Does flowctl support scheduled automation?$q$, $q$Yes, flows can be triggered on a cron schedule in addition to manual or approval-gated execution.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$How does flowctl handle access control?$q$, $q$It uses team-based organization with role-based access control (user, operator, reviewer, admin) and supports OIDC-based SSO.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Infrastructure and SSH automation$q$, $q$Run SSH-based provisioning or infrastructure tasks with approval gates before execution.$q$, $q$DevOps and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Self-service internal tooling$q$, $q$Expose controlled, auditable workflows that other teams can trigger themselves without direct system access.$q$, $q$Internal engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$Scheduled operational tasks$q$, $q$Automate recurring processes using cron-based scheduling and real-time execution logs.$q$, $q$Technical/operations teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$flowctl is a self-service workflow execution platform distributed as a single binary (github.com/cvhariharan/flowctl), licensed under Apache 2.0. It lets teams define workflows in a built-in editor or as YAML/HUML configuration, and run them with real-time streaming logs, scheduled cron execution, and approval gates for sensitive operations.$q$, $q$PostgreSQL is the only external dependency; everything else ships in the binary, and deployment is available via Docker or as a standalone executable. The project is actively maintained, with 44 releases and commits as recent as mid-2026, and it offers a public live demo at demo.flowctl.net alongside documentation at flowctl.net/docs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$flowctl targets engineering and operations teams that need controlled, auditable self-service automation — for example running SSH-based provisioning or infrastructure tasks — with team-based organization, role-based access control, and approval workflows for sensitive actions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4bc25f51-5006-4396-aeab-6860c203eba6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Fredy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted crawler that watches German real estate sites like ImmoScout24 and Immowelt, alerting you the moment a matching listing appears.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Fredy is a free, self-hosted crawler that scans German real estate sites and alerts you to new listings via Slack, Telegram, or email.$q$,
  og_description = $q$Fredy is a free, self-hosted crawler that scans German real estate sites and alerts you to new listings via Slack, Telegram, or email.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2315b74d-957e-4a28-a863-32fc0da75242';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2315b74d-957e-4a28-a863-32fc0da75242' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Multi-platform scraping$q$, $q$Continuously checks ImmoScout24, Immowelt, Immonet, eBay Kleinanzeigen, and WG-Gesucht for new listings that match your saved search criteria.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Deduplication$q$, $q$Filters out the same listing when it appears on more than one platform, so you only get notified once.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Multi-channel notifications$q$, $q$Sends new results via Slack, Telegram, email, Discord, or ntfy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Web-based configuration UI$q$, $q$Manage saved searches, notification providers, and run intervals through a browser interface rather than editing config files.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Docker-first deployment$q$, $q$Ships as a Docker image for quick self-hosting, with a Node.js option for manual installs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Built-in MCP server$q$, $q$Recent versions expose an MCP server so AI assistants can query saved searches and results programmatically.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Covers most of the major German real estate portals in one place$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Flexible notification options (Slack, Telegram, Discord, email, ntfy)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Self-hosted, so your search criteria and results stay on your own server$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Active development with recent releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Focused specifically on the German real estate market, not useful elsewhere$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Requires comfort with Docker or Node.js to self-host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Scraping-based approach can break if a source site changes its layout$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Is Fredy free to use?$q$, $q$Yes. Fredy is open-source software released under the Apache 2.0 license and is free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Which real estate sites does Fredy support?$q$, $q$ImmoScout24, Immowelt, Immonet, eBay Kleinanzeigen, and WG-Gesucht, among others listed in its documentation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Does Fredy work outside Germany?$q$, $q$Fredy's built-in scrapers target German real estate platforms; it is not designed for real estate sites in other countries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$How do I get notified of new listings?$q$, $q$You configure one or more notification providers (Slack, Telegram, email, Discord, or ntfy) in Fredy's web UI, and it pushes new matches there.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Apartment hunting$q$, $q$Automatically track new rental listings across several German portals without manually refreshing each site.$q$, $q$Individuals and families searching for a home in Germany$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$Shared flat search$q$, $q$Monitor WG-Gesucht for new room listings that match budget and location criteria.$q$, $q$Students and young professionals looking for shared housing$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Fredy is an open-source, self-hosted application that automates apartment and house hunting on German real estate platforms. Instead of manually refreshing sites like ImmoScout24, Immowelt, Immonet, eBay Kleinanzeigen, and WG-Gesucht, Fredy runs on a schedule, scrapes new listings, removes duplicates that appear across multiple portals, and sends the results straight to you.$q$, $q$The project is maintained by Christian Kellner (orangecoding) and is distributed under the Apache 2.0 license. It ships as a Docker image or can be run directly with Node.js, and includes a web-based UI for configuring search queries and notification channels.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Fredy is built for anyone searching for a flat, house, or shared apartment in Germany who is tired of manually checking multiple listing sites every day, and who is comfortable self-hosting a small Docker service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2315b74d-957e-4a28-a863-32fc0da75242', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── HomeButler ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Single-binary CLI, TUI, and web dashboard for monitoring, backing up, and self-healing homelab servers and Docker containers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HomeButler is a free, self-hosted binary that monitors, backs up, and self-heals your homelab from the CLI, web dashboard, or an AI agent.$q$,
  og_description = $q$HomeButler is a free, self-hosted binary that monitors, backs up, and self-heals your homelab from the CLI, web dashboard, or an AI agent.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c5d35463-736d-427c-b730-eb483d33b643';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c5d35463-736d-427c-b730-eb483d33b643' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$System monitoring$q$, $q$Tracks CPU, memory, disk usage, and uptime across one or more remote servers over SSH.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Docker container management$q$, $q$Lists containers, detects restarts, and captures logs for troubleshooting.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$One-command app installs$q$, $q$Deploys popular self-hosted apps such as Uptime Kuma, Jellyfin, and Pi-hole with a single command.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Crash and flapping detection$q$, $q$Automatically flags containers or services that are restarting in a loop and surfaces log analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Backup restore drills$q$, $q$Runs a 'backup drill' that tests whether a backup can actually be restored in an isolated environment, not just that a backup file exists.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$MCP server for AI agents$q$, $q$Exposes homelab data and actions to AI tools like Claude Desktop through the Model Context Protocol, without giving the AI raw shell access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Web dashboard$q$, $q$Embedded browser interface for real-time monitoring alongside the CLI and TUI.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Single binary with zero external dependencies to install$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$No daemon, database, or always-on service required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Usable from CLI, TUI, web dashboard, or AI agent$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Free and open source under MIT$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Backup restore verification goes beyond simple backup existence checks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$macOS and Linux only, no native Windows build$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Young project with a smaller community than established monitoring tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Aimed at technically comfortable homelab users, not turnkey for beginners$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Is HomeButler free?$q$, $q$Yes, HomeButler is open source under the MIT license with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Does HomeButler require a database or background service?$q$, $q$No. It runs as a single Go binary and does not require a daemon or database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Can I use HomeButler with AI assistants?$q$, $q$Yes, it includes a built-in MCP server so AI tools such as Claude Desktop can query and manage your homelab through structured commands.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$How do I install HomeButler?$q$, $q$It's available via Homebrew, a one-line curl install script, npm, or by building from source with Go.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Homelab health monitoring$q$, $q$Keep track of CPU, memory, disk, and container health across several self-hosted servers from one place.$q$, $q$Homelab operators running multiple physical or virtual servers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$Backup restore verification$q$, $q$Run scheduled restore drills to confirm backups are actually usable before a real failure happens.$q$, $q$Self-hosters who rely on their own backup strategy$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HomeButler is a single Go binary for managing a homelab from the command line, a terminal dashboard, a web UI, or an AI agent — with no daemon, database, or always-on service required. It monitors server health (CPU, memory, disk, uptime), manages Docker containers, detects crash loops, verifies that backups can actually be restored, and can trigger Wake-on-LAN across multiple remote servers over SSH.$q$, $q$The project also ships a built-in MCP server, so tools like Claude Desktop can query and manage a homelab through structured JSON commands rather than raw shell access. HomeButler is released under the MIT license and is developed on GitHub by Higangssh.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$HomeButler targets homelab operators and self-hosters who run several servers or Docker containers and want a lightweight way to check status, catch problems early, and verify backups actually work — from a terminal, a script, or an AI assistant.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5d35463-736d-427c-b730-eb483d33b643', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Kibitzr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted Python bot that checks web pages, commands, or feeds for changes and notifies you through Slack, email, or custom scripts.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kibitzr is a free, self-hosted Python bot that monitors web pages and commands for changes and sends alerts to Slack or email.$q$,
  og_description = $q$Kibitzr is a free, self-hosted Python bot that monitors web pages and commands for changes and sends alerts to Slack or email.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '508967b9-da79-458e-ad83-e0c334e50a8c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '508967b9-da79-458e-ad83-e0c334e50a8c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$YAML task configuration$q$, $q$Define what to check, how often, and what to do on change using plain YAML files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Web page monitoring$q$, $q$Fetches pages via HTTP or a headless browser and extracts content with CSS selectors or XPath.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Command and script triggers$q$, $q$Runs shell, SSH, or custom Python/Bash scripts as part of a monitoring task.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Slack and email notifications$q$, $q$Sends alerts through Slack or MailGun-based email when a watched value changes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Browser automation$q$, $q$Uses Selenium for pages that require JavaScript rendering or interaction to check.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Plugin extensibility$q$, $q$Supports custom Python plugins for use cases beyond the built-in transports and notifiers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Free, open-source, and self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Flexible triggers beyond simple page diffing (commands, SSH, scripts)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Lightweight enough to run on minimal cloud or home server infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Cross-platform (Windows, Linux, macOS)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Configuration is YAML/file-based rather than a graphical UI$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Requires Python familiarity to extend or troubleshoot$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Smaller community compared to modern uptime/change-detection SaaS tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Is Kibitzr free?$q$, $q$Yes, Kibitzr is MIT-licensed open-source software with no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$How do I install Kibitzr?$q$, $q$It can be installed via pip and configured through YAML files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Can Kibitzr monitor pages that require JavaScript?$q$, $q$Yes, it can use Selenium for browser-based scenarios where content is rendered client-side.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Where does Kibitzr send notifications?$q$, $q$Built-in support includes Slack and MailGun-based email, plus custom scripts for other destinations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Release and build monitoring$q$, $q$Watch a page or feed for a new software release or a finished CI build and get notified automatically.$q$, $q$Developers tracking dependencies or CI pipelines$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$Price or availability tracking$q$, $q$Check a product or listing page on a schedule and alert when the tracked value changes.$q$, $q$Self-hosters who want change alerts without a third-party service$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kibitzr is a self-hosted "personal web assistant" that automates recurring monitoring tasks, such as checking whether a page has changed, a build has finished, or a new software release is out. Tasks are defined in YAML configuration files and can pull content from web pages, run shell or SSH commands, or parse HTML with CSS or XPath selectors.$q$, $q$The project is written in Python, uses Selenium for scenarios that need a real browser, and is released under the MIT license. It is installable via pip and is designed to run continuously on a small server, including behind a firewall.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Kibitzr suits developers and technically comfortable users who want to monitor web pages, commands, or feeds on their own infrastructure instead of handing credentials to a third-party monitoring SaaS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('508967b9-da79-458e-ad83-e0c334e50a8c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Mylar3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Automated comic book manager that watches for new issues and downloads them as CBR/CBZ via NZB or torrent clients.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mylar3 is a free, open-source comic book manager that watches series and automatically downloads new CBR/CBZ issues.$q$,
  og_description = $q$Mylar3 is a free, open-source comic book manager that watches series and automatically downloads new CBR/CBZ issues.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a78ce366-8967-4df1-b706-40b8958bb998';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a78ce366-8967-4df1-b706-40b8958bb998' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Series watchlisting$q$, $q$Monitor comic series for new issues, updated metadata, and story arcs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Pull-list tracking$q$, $q$Tracks upcoming releases up to four weeks ahead so downloads are ready close to release.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Download client integration$q$, $q$Works with SABnzbd, NZBGet, and torrent clients, plus multiple newznab indexers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Automatic metadata tagging$q$, $q$Uses ComicTagger to tag downloaded issues with series, issue number, and other metadata.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Failed download handling$q$, $q$Automatically retries or grabs an alternate copy when a download fails.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Library scanning$q$, $q$Scans an existing collection to identify and fill in missing issues.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Fits naturally alongside an existing self-hosted media/download stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Handles trade paperbacks and graphic novels in addition to single issues$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Multi-platform, with an official Docker image$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Actively maintained with regular releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Requires configuring external indexers and download clients to be useful$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Comic-specific; not a general-purpose media manager$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Setup and troubleshooting assume familiarity with the NZB/torrent ecosystem$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Is Mylar3 free?$q$, $q$Yes, Mylar3 is open-source software released under the GPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$What download clients does Mylar3 support?$q$, $q$SABnzbd and NZBGet for NZB downloads, plus torrent clients, alongside newznab-compatible indexers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Does Mylar3 tag downloaded comics?$q$, $q$Yes, it uses ComicTagger to automatically apply metadata such as series and issue number.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Can Mylar3 run in Docker?$q$, $q$Yes, an official image is maintained by LinuxServer.io, alongside native installs for Windows, Linux, macOS, and Raspberry Pi.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Automated comic collecting$q$, $q$Watch ongoing series and automatically download new issues as they become available.$q$, $q$Comic book collectors running a self-hosted download stack$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$Library gap-filling$q$, $q$Scan an existing digital comic library and grab missing issues automatically.$q$, $q$Users migrating or consolidating an existing comic collection$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mylar3 is the Python 3 successor to the original Mylar comic book downloader. It lets you build a watchlist of comic series, tracks upcoming issues and pull lists weeks in advance, and automatically grabs, sorts, renames, and tags new issues as CBR or CBZ files once they're available through your NZB or torrent client.$q$, $q$It integrates with download clients such as SABnzbd and NZBGet, tags files automatically via ComicTagger, and can scan an existing library to find missing issues. Mylar3 is open source under the GPL-3.0 license and runs on Windows, Linux, macOS, and Raspberry Pi, with an official Docker image available through LinuxServer.io.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mylar3 is aimed at comic book collectors who already run a self-hosted download stack (SABnzbd, NZBGet, or torrent clients) and want the same kind of automated, watchlist-driven management that tools like Sonarr or Radarr provide for TV and movies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a78ce366-8967-4df1-b706-40b8958bb998', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Antville ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source weblog hosting platform built on the Helma Object Publisher, running continuously since 2001.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Antville is a free, open-source weblog hosting platform built on Helma Object Publisher, running since 2001.$q$,
  og_description = $q$Antville is a free, open-source weblog hosting platform built on Helma Object Publisher, running since 2001.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Hosted blog network$q$, $q$Create a personal weblog on antville.org with a few clicks, joining a network of other member sites.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Comment system$q$, $q$Readers can comment on posts, with moderation controls for site owners.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Community activity feed$q$, $q$Surfaces recent posts and activity from across the network of hosted sites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Self-hostable codebase$q$, $q$The Antville and Helma source code is published on GitHub, so the platform can be run independently of antville.org.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Open-source Helma runtime$q$, $q$Runs on Helma Object Publisher, a scriptable Java-based web application server that Antville forks and extends.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Very long operating history for a self-hosted blogging platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Fully open-source codebase available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Free hosted option available on antville.org$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Simple site creation for non-technical bloggers on the hosted network$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Built on Helma, a Java-based stack that is uncommon in current web development$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Community and documentation skew toward German-speaking users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Feature set and interface are dated compared to modern CMS platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Is Antville free?$q$, $q$Yes, hosting a site on antville.org is free, and the underlying code is open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Can I self-host Antville instead of using antville.org?$q$, $q$Yes, the Antville and Helma source code is published on GitHub for independent self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$What technology does Antville run on?$q$, $q$It's written in server-side JavaScript on top of Helma Object Publisher, a Java-based application server.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Personal blogging$q$, $q$Start a weblog on the antville.org network without setting up hosting or a database.$q$, $q$Individual bloggers, especially in German-speaking communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Self-hosted Helma deployment$q$, $q$Run the open-source Antville/Helma codebase on your own server for full control.$q$, $q$Developers interested in Helma-based application hosting$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Antville is a weblog hosting system written in server-side JavaScript on top of the Helma Object Publisher, an open-source Java-based application server. Antville.org itself has hosted a network of user blogs since 2001, and the underlying code is published on GitHub so it can be self-hosted independently of the antville.org instance.$q$, $q$Individual sites on the network let users publish posts, accept comments, and see activity from other blogs in the same community. Because the platform predates most modern CMS tooling, it reflects an earlier generation of blogging software architecture built around Helma rather than a typical LAMP or Node.js stack.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Antville is relevant to bloggers who already use the antville.org hosted network, and to developers interested in Helma-based, self-hostable open-source weblog software with a long operating history.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ech0 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight self-hosted publishing platform for short posts and links, with ActivityPub federation and a sub-15MB memory footprint.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$Ech0 is a free, open-source, lightweight self-hosted publishing platform with ActivityPub federation for sharing short posts.$q$,
  og_description = $q$Ech0 is a free, open-source, lightweight self-hosted publishing platform with ActivityPub federation for sharing short posts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0bc21b7f-dfe2-4c44-a7ad-9cac54962d52';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0bc21b7f-dfe2-4c44-a7ad-9cac54962d52' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Minimal resource footprint$q$, $q$Runs with reported memory usage under 15MB and a Docker image under 50MB.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Single-file SQLite storage$q$, $q$Stores all data in one SQLite file, simplifying backup and migration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$ActivityPub federation$q$, $q$Publishes posts so they can be followed and interacted with from other fediverse platforms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Markdown editor with live preview$q$, $q$Write posts in Markdown with a plugin-friendly online editor.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$One-click Docker deployment$q$, $q$Get a running instance with a single Docker command.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Export and backup tooling$q$, $q$Export or back up content through the web UI, a TUI, or the CLI.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Extremely lightweight compared to full-featured CMS platforms$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Fast to self-host with a single Docker command$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Federates into the fediverse via ActivityPub$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$No ads, tracking, or subscription lock-in$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Fully open source under AGPL-3.0$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Young project with a smaller community than established microblogging tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Intentionally minimal feature set, not a full-featured blog CMS$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Documentation and community discussion are primarily in Chinese$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Is Ech0 free?$q$, $q$Yes, Ech0 is open-source software released under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Does Ech0 support the fediverse?$q$, $q$Yes, it supports ActivityPub, allowing posts to federate with platforms like Mastodon.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$How much data does Ech0 require to run?$q$, $q$It's designed to be lightweight, with reported memory usage under 15MB and a single SQLite file for storage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$How do I install Ech0?$q$, $q$The project provides a single Docker command for deployment, described in its GitHub README.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Personal microblogging$q$, $q$Share short notes, thoughts, and links from your own server instead of a third-party platform.$q$, $q$Individuals who want a self-hosted, fediverse-connected alternative to microblogging apps$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$Lightweight self-hosting$q$, $q$Run a publishing platform on low-resource hardware such as a small VPS or single-board computer.$q$, $q$Self-hosters with limited server resources$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ech0 is a self-hosted, federated publishing platform built for quickly sharing short-form thoughts, notes, and links rather than long-form articles. It's designed to be minimal by default: a single SQLite file for storage, a small Docker image, and reported memory usage under 15MB, making it easy to run on modest hardware.$q$, $q$The platform supports the ActivityPub protocol, so posts can federate into the wider fediverse alongside tools like Mastodon. It includes an online Markdown editor with live preview and one-click export or backup via web, TUI, or CLI. Ech0 is developed by lin-snow and released under the AGPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Ech0 fits people who want a lightweight, self-hosted alternative to microblogging services for sharing short notes and links, without ads, tracking, or subscriptions, and who value being reachable from the fediverse via ActivityPub.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0bc21b7f-dfe2-4c44-a7ad-9cac54962d52', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── FlatPress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Databaseless PHP blogging platform that stores every post as a flat file, with themes, plugins, and comment spam protection.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$FlatPress is a free, open-source PHP blogging platform that stores posts as flat files instead of a database.$q$,
  og_description = $q$FlatPress is a free, open-source PHP blogging platform that stores posts as flat files instead of a database.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4e5010c0-47f6-477a-b108-d4572881cb9c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4e5010c0-47f6-477a-b108-d4572881cb9c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$No database required$q$, $q$All content is stored as files, simplifying setup, backup, and hosting requirements.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Plugin and widget system$q$, $q$Extend functionality through plugins and add widgets to the sidebar or other theme areas.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Smarty-based theming$q$, $q$Customize the site's appearance using themes built on the Smarty template engine.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Comment moderation and spam protection$q$, $q$Built-in tools for managing comments and filtering spam.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Simple file-based backup$q$, $q$Because there's no database, backing up a site is as simple as copying its files.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$No database to install, configure, or maintain$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Mature, stable codebase with development ongoing since 2006$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Easy to back up and migrate by copying files$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Free and open source under GPLv2$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Lightweight enough for modest shared hosting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Smaller plugin and theme ecosystem than WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Flat-file storage can become slower at very large post volumes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Admin interface feels dated compared to modern CMS platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Is FlatPress free?$q$, $q$Yes, FlatPress is open-source software released under the GNU GPLv2 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Does FlatPress need a database?$q$, $q$No, it stores all content as flat files instead of using a database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Can I extend FlatPress with plugins?$q$, $q$Yes, it has a plugin and widget system for adding functionality.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$How do I back up a FlatPress site?$q$, $q$Since everything is stored as files, backing up is a matter of copying the site's files and folders.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Simple personal blogging$q$, $q$Run a blog without setting up or maintaining a database.$q$, $q$Independent bloggers on shared or low-resource hosting$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$Portable, easy-to-migrate sites$q$, $q$Move or back up a site by copying its file directory rather than exporting a database.$q$, $q$Site owners who want simple hosting migrations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FlatPress is a blogging platform that stores posts, comments, and settings as flat files instead of using a database, so a full site can be backed up or moved by simply copying its files. It has been in active development since 2006 and is released under the GNU GPLv2 license, with source code maintained on GitHub under flatpressblog/flatpress.$q$, $q$The platform supports themes built with the Smarty templating engine, a plugin and widget system for extending functionality, and built-in comment moderation with spam protection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FlatPress suits independent bloggers and site owners who want a simple, self-managed blog without setting up or maintaining a database, particularly on hosts with limited resources.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5010c0-47f6-477a-b108-d4572881cb9c', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── HTMLy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Databaseless PHP blogging platform and flat-file CMS with fast content indexing, scheduled posts, and two-factor authentication.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HTMLy is a free, open-source, databaseless PHP blogging platform and flat-file CMS with search, tags, and 2FA.$q$,
  og_description = $q$HTMLy is a free, open-source, databaseless PHP blogging platform and flat-file CMS with search, tags, and 2FA.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c23263cf-333f-4561-ac68-e421277a1f58';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c23263cf-333f-4561-ac68-e421277a1f58' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Flat-file, no-database architecture$q$, $q$Stores and indexes posts as files, avoiding database setup and maintenance entirely.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Custom fast indexing$q$, $q$Uses its own algorithm to keep content lookups by date, category, tag, or author performant as a site grows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Scheduled posts and custom fields$q$, $q$Queue posts for future publication and attach custom metadata fields to content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Two-factor authentication$q$, $q$Adds 2FA to the admin login for extra account security.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Menu editor and sitemap generation$q$, $q$Manage site navigation and generate a sitemap from the admin panel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$One-click updates$q$, $q$Update the platform from within the admin interface.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$No database to install or maintain$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Free and open source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Built-in 2FA for admin login security$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Lightweight enough for shared hosting with minimal PHP requirements$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Full-text search and tag/category organization out of the box$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Requires several specific PHP extensions (Mbstring, XML, INTL, GD, ZIP)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Smaller theme and plugin ecosystem than WordPress$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Themes must be downloaded and installed manually rather than through an in-app marketplace$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Is HTMLy free?$q$, $q$Yes, HTMLy is free and open source; its source code is available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Does HTMLy require a database?$q$, $q$No, it's a flat-file CMS that stores and indexes content as files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$What are HTMLy's server requirements?$q$, $q$PHP 7.2 or later with the Mbstring, XML, INTL, GD, and ZIP extensions (ZIP is needed for backup functionality).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Does HTMLy support two-factor authentication?$q$, $q$Yes, it includes built-in 2FA for the admin login.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Lightweight blogging on shared hosting$q$, $q$Run a fast blog without needing database access or administration.$q$, $q$Bloggers on budget or shared hosting plans$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$Large content archives$q$, $q$Organize and search thousands of posts by date, category, tag, or author without a database backend.$q$, $q$Publishers with a large existing archive of posts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HTMLy is an open-source, databaseless PHP blogging platform and flat-file CMS. It uses its own indexing approach to organize content by date, type, category, tag, or author, aiming to stay fast even on shared hosting with modest resources. The project is developed by Danpros and maintained on GitHub as danpros/htmly.$q$, $q$It includes archives, categories, tags, and full-text search, along with scheduled posts, custom fields, a sitemap and menu editor, and two-factor authentication for the admin login. Themes are downloaded and installed separately from the HTMLy site.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$HTMLy is aimed at bloggers and site owners who want a fast, low-resource blogging platform without database administration, especially on shared or minimal hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c23263cf-333f-4561-ac68-e421277a1f58', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Mataroa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Minimalist Markdown blogging platform with no ads or tracking, offering a free tier and a low-cost premium plan for custom domains.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2020,
  company_size = $q$1 (solo maintainer)$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mataroa is a minimalist, ad-free Markdown blogging platform with a free tier and a $9/year premium plan for custom domains.$q$,
  og_description = $q$Mataroa is a minimalist, ad-free Markdown blogging platform with a free tier and a $9/year premium plan for custom domains.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '207eb58f-a5bd-46b7-ad43-c35ea9d0fecf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '207eb58f-a5bd-46b7-ad43-c35ea9d0fecf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Markdown writing$q$, $q$Write posts in Markdown with support for code highlighting, tables, and footnotes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Custom domains (premium)$q$, $q$Connect your own domain instead of using a mataroa.blog subdomain.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Post-by-email (premium)$q$, $q$Publish new posts by sending an email, without opening the web editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$RSS and email newsletters$q$, $q$Readers can subscribe via RSS or receive new posts by email.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Full data export$q$, $q$Export all posts and data at any time for portability or self-hosting elsewhere.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$API access$q$, $q$Interact with the platform programmatically through Mataroa's API.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$No ads, cookies, or tracking$q$, $q$The platform runs without advertising, cookies, or analytics tracking on reader-facing pages.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Genuinely minimal, distraction-free writing and reading experience$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$No ads, cookies, or tracking$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$No email required to sign up$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Full data export and self-hosting option available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Low-cost premium plan at $9/year$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Maintained by a single developer, a noted sustainability risk$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Free tier lacks custom domain and post-by-email support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Intentionally minimal features compared to full-featured blogging platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Is Mataroa free?$q$, $q$Yes, there is a free tier with core blogging features; a $9/year premium plan adds custom domains and post-by-email.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Do I need an email address to sign up?$q$, $q$No, Mataroa does not require an email address to create an account.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Can I self-host Mataroa?$q$, $q$Yes, the platform is 100% open source under the AGPL license with deployment documentation on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Can I export my content?$q$, $q$Yes, full data export is supported at any time.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Minimalist personal blogging$q$, $q$Publish Markdown posts without dealing with themes, plugins, or tracking scripts.$q$, $q$Writers who want a distraction-free publishing tool$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Self-hosted blog platform$q$, $q$Fork or deploy the open-source codebase to run a custom instance.$q$, $q$Developers who want to self-host or build on Mataroa's codebase$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Free$q$, $q$Free$q$, NULL, $q$["Markdown blog on a mataroa.blog subdomain","RSS feed","No ads, cookies, or tracking","Full data export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$Premium$q$, $q$$9$q$, $q$Yearly$q$, $q$["Custom domain support","Post-by-email publishing","All free-tier features","Supports the platform and CO2 removal funding"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mataroa is a deliberately stripped-down blogging platform, described by its creator as a 'naked blogging platform, for minimalists.' Posts are written in Markdown and published on a mataroa.blog subdomain or a connected custom domain, with no ads, cookies, or tracking. Signup doesn't require an email address, and users can export all of their data at any time.$q$, $q$The platform has been running since 2020 and is currently maintained by a single developer. It's 100% open source under the AGPL license, with self-hosting and deployment documentation available on GitHub, and generates revenue through an optional $9/year premium plan, part of which funds carbon removal.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mataroa is built for writers who want a distraction-free, minimal publishing tool and are put off by ad-heavy or feature-bloated blogging platforms. It also appeals to developers who want to self-host or fork a simple, open-source blogging codebase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('207eb58f-a5bd-46b7-ad43-c35ea9d0fecf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── PluXml ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$French-origin, database-free CMS that stores content as XML files, with multi-user permissions and support for 11 languages.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$French$q$, $q$English$q$]::text[],
  seo_meta_description = $q$PluXml is a free, open-source, database-free CMS that stores content as XML files and supports 11 languages.$q$,
  og_description = $q$PluXml is a free, open-source, database-free CMS that stores content as XML files and supports 11 languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eba0f7e5-197a-4285-93b2-3fcbd9da16ba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eba0f7e5-197a-4285-93b2-3fcbd9da16ba' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$XML-based storage$q$, $q$Stores content as XML files rather than in a database, simplifying backup and portability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Multi-user permission levels$q$, $q$Supports five distinct permission levels for managing multiple authors and editors.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Static pages, categories, and tags$q$, $q$Organize content with static pages, categories, tags, and chronological archives.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Media manager$q$, $q$Upload and manage images and documents through a built-in media library.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$RSS feeds$q$, $q$Generates RSS feeds for articles, comments, and categories.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Responsive theming and plugins$q$, $q$Themes support mobile devices, and functionality can be extended through plugins.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$URL rewriting$q$, $q$Supports clean, rewritten URLs for pages and posts.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$No database required, simplifying hosting and backups$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Granular multi-user permissions with five access levels$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Ships with support for 11 languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Free and open source under the GPL$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Lightweight PHP-only server requirements$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Smaller English-language community and documentation than mainstream CMS platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$XML file storage may not scale as well as a database for very large sites$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Smaller plugin and theme ecosystem than WordPress$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Is PluXml free?$q$, $q$Yes, PluXml is open-source software released under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Does PluXml need a database?$q$, $q$No, all content is stored as XML files instead of a database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$What are PluXml's server requirements?$q$, $q$PHP 7.2 or later with the GD image library, running on Apache, Nginx, or Lighttpd.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Does PluXml support multiple languages?$q$, $q$Yes, it ships with support for 11 languages, and originates from a French-speaking development community.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Simple personal or family websites$q$, $q$Build a straightforward website without database setup or technical maintenance.$q$, $q$Individuals, families, and hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$Multi-author small business sites$q$, $q$Run a site with several contributors using role-based permission levels.$q$, $q$Small businesses and teams with multiple content editors$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PluXml is a lightweight content management system that stores every page, post, and setting as XML files instead of relying on a database. Because there's no database, a full site can be copied, backed up, or moved between servers — even via a USB drive — by copying its files.$q$, $q$The platform supports static pages, categories, tags, article archives, comment management, and a media manager for images and documents, with five permission levels for multi-user setups. It's released under the GNU General Public License, requires PHP 7.2+ with the GD library, and runs on Apache, Nginx, or Lighttpd. PluXml ships with support for 11 languages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$PluXml is aimed at individuals, families, and small businesses who want a straightforward website or blog without managing a database, as well as multi-author sites that need simple, role-based permissions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eba0f7e5-197a-4285-93b2-3fcbd9da16ba', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Serendipity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source PHP blogging platform with a plugin and theme ecosystem for building self-hosted blogs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2002,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Serendipity (s9y) is a free, open-source PHP blogging platform with a plugin and theme ecosystem for self-hosted blogs.$q$,
  og_description = $q$Serendipity (s9y) is a free, open-source PHP blogging platform with a plugin and theme ecosystem for self-hosted blogs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba173115-45c7-42cb-850e-739cef0cdccb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba173115-45c7-42cb-850e-739cef0cdccb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Plugin architecture via Spartacus$q$, $q$A dedicated repository of community plugins and themes lets you extend core functionality without modifying Serendipity's codebase.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Multi-database support$q$, $q$Runs on MySQL, PostgreSQL, or SQLite, giving self-hosters flexibility in how they deploy the backend.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Rich entry editor$q$, $q$Includes CK Editor integration for writing and formatting blog entries in the admin dashboard.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Media database$q$, $q$Built-in media management for organizing images and files used in blog posts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Smarty templating$q$, $q$Themes are built on the Smarty template engine, separating presentation from logic for easier customization.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Long-term security track record$q$, $q$The project emphasizes an active history of addressing security issues as one of its core project pillars.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Mature project with over two decades of continuous development$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Flexible plugin and theme system via Spartacus$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Works with multiple database backends (MySQL, PostgreSQL, SQLite)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Fully self-hosted, giving complete control over content and data$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Free under the permissive BSD 3-Clause license$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Smaller plugin/theme ecosystem and community than mainstream platforms like WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Requires basic PHP hosting knowledge to install and maintain$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$No built-in visual page-builder style editing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Is Serendipity free?$q$, $q$Yes, it's free and open source under the BSD 3-Clause license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$What databases does it support?$q$, $q$MySQL, PostgreSQL, and SQLite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Is Serendipity still maintained?$q$, $q$Yes, the project is on version 2.6 and remains actively developed on GitHub, with an active blog and forums.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$How do I add features to my blog?$q$, $q$Through the Spartacus plugin and theme repository, which houses community-contributed extensions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Personal blogging$q$, $q$A lightweight, self-hosted platform for individuals who want full control over their blog without vendor lock-in.$q$, $q$Casual bloggers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$Customized publishing sites$q$, $q$Developers can build tailored blog experiences using the plugin architecture and Smarty templates.$q$, $q$Developers and technical self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Serendipity, commonly abbreviated s9y, is a free, open-source weblog engine written in PHP. The project began in 2002 (originally called jBlog before being renamed Serendipity) and is released under the BSD 3-Clause license.$q$, $q$It supports MySQL, PostgreSQL, and SQLite database backends and uses the Smarty template engine, giving self-hosters a mature, framework-style publishing platform rather than a single fixed blog template. Extensibility comes through the Spartacus plugin and theme repository, which lets site owners add features such as comment handling, media management, and custom editors without touching core code.$q$, $q$The current stable release line is version 2.6, and the project remains actively developed on GitHub with a dedicated blog and support forums.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Serendipity targets both casual bloggers who want a simple out-of-the-box setup and more technical users or developers who need a customizable, self-hosted publishing framework with plugin and theme control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba173115-45c7-42cb-850e-739cef0cdccb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Digibunch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source tool from La Digitale for creating and sharing curated collections of web links.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$French$q$, $q$English$q$]::text[],
  seo_meta_description = $q$Digibunch is a free, open-source tool from La Digitale for creating and sharing curated link collections, popular among teachers.$q$,
  og_description = $q$Digibunch is a free, open-source tool from La Digitale for creating and sharing curated link collections, popular among teachers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b8d19f4f-f413-441c-b903-3a6fd99103e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b8d19f4f-f413-441c-b903-3a6fd99103e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Curated link collections$q$, $q$Build a themed collection ("bouquet") of web links in one place, useful for sitographies and resource lists.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Free and open source$q$, $q$Released under the AGPLv3 license, with source code publicly available on Codeberg.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Part of the La Digitale suite$q$, $q$Works alongside other free, non-commercial educational tools built by the same collective.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$No-cost, ad-free access$q$, $q$Follows La Digitale's model of offering tools free of charge without advertising or data monetization.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Completely free with no ads or data monetization$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Open source and self-hostable via the public Codeberg repository$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Simple, purpose-built interface for a specific, common task$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Backed by an established collective (La Digitale) with a track record of maintaining free edu-tech tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Narrow feature set focused on a single use case$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Documentation and interface are primarily oriented toward French-speaking educators$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Limited public information on the product beyond its source repository and tutorials$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Is Digibunch free?$q$, $q$Yes, it's a free tool published by La Digitale under the AGPLv3 open-source license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Who is Digibunch designed for?$q$, $q$It's primarily built for teachers and educators, though anyone needing a simple way to share a list of links can use it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Is the source code available?$q$, $q$Yes, Digibunch's code is published on Codeberg under the AGPLv3 license.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Classroom resource lists$q$, $q$Teachers compile a sitography or set of reference links for a lesson or project.$q$, $q$Teachers and educators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$Themed link curation$q$, $q$Anyone wanting to gather and share a focused list of web links around a topic.$q$, $q$Students and general users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Digibunch is a free web application published by La Digitale, a French collective that builds non-commercial, open-source digital tools primarily for educators. It lets users create a "bouquet de liens" — a curated collection of web links, often used as a sitography or resource list built around a topic.$q$, $q$The application is released under the GNU AGPLv3 license with its source code hosted on Codeberg, and it sits alongside other La Digitale tools such as Digidrive as part of a broader suite of free, privacy-respecting web utilities.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Digibunch is aimed primarily at teachers and educators who need a simple way to compile and share a set of reference links with students, though its straightforward purpose makes it usable by anyone who wants to curate and share a themed list of URLs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8d19f4f-f413-441c-b903-3a6fd99103e0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Faved ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted bookmark manager with nested tags, instant search, and easy browser import.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Faved is an open-source, self-hosted bookmark manager with nested tags and fast search; free to self-host, with cloud plans from $2.50/month.$q$,
  og_description = $q$Faved is an open-source, self-hosted bookmark manager with nested tags and fast search; free to self-host, with cloud plans from $2.50/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3185965d-fd1d-45c7-a0e1-03ac82f24008';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3185965d-fd1d-45c7-a0e1-03ac82f24008' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Nested tagging system$q$, $q$Organize bookmarks with nested, color-coded tags that can be pinned for frequent use.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Instant search$q$, $q$Search across a bookmark library of any size with fast, one-click results.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Multi-platform capture$q$, $q$Save bookmarks via a Chrome extension, bookmarklet, or native share menus on mobile devices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Duplicate detection$q$, $q$Automatically flags duplicate bookmarks to help keep a library clean.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Import from other tools$q$, $q$Import existing bookmarks from Chrome, Safari, Firefox, Edge, Raindrop, and Pocket while preserving structure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Automatic metadata fetching$q$, $q$Captures and refreshes titles, descriptions, and preview images for saved links.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$PWA support$q$, $q$Installable as a progressive web app with a responsive design across mobile, tablet, and desktop.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Bulk actions$q$, $q$Manage large sets of bookmarks at once with bulk editing and organizing tools.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Self-hosted version is free forever with the full feature set$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Lightweight and fast, with an easy one-command Docker setup$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Flexible nested-tag organization system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Straightforward migration from Chrome, Safari, Firefox, Edge, Raindrop, and Pocket$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Active open-source project with a growing GitHub community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Cloud offering is newer and smaller than more established bookmarking services$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Team/SSO functionality requires contacting sales for custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$No dedicated native mobile apps beyond PWA and share-menu integration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Is Faved free?$q$, $q$Self-hosting Faved is free forever. A managed cloud plan is also available starting at $2.50/month billed yearly, with a 14-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Can I self-host Faved?$q$, $q$Yes, it can be deployed with a single Docker command, giving you complete control over your data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Can I import my existing bookmarks?$q$, $q$Yes, Faved supports importing from Chrome, Safari, Firefox, Edge, Raindrop, and Pocket while preserving folder structure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Is Faved open source?$q$, $q$Yes, its codebase is public on GitHub with over 1,000 stars.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Personal bookmark organization$q$, $q$Keep large bookmark collections structured with nested tags and instant search.$q$, $q$Individuals with large bookmark libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Self-hosted, privacy-first bookmarking$q$, $q$Run Faved on your own server to keep full ownership of your saved links.$q$, $q$Self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Team bookmark sharing$q$, $q$Use the Cloud Team plan for collaborative bookmark management with SSO.$q$, $q$Small teams and organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full feature set","Docker deployment","Complete data control"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Cloud$q$, $q$$2.50/month (billed yearly at $30/year)$q$, $q$yearly$q$, $q$["14-day free trial","50,000 bookmarks","Automatic backups"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$Cloud Team$q$, $q$Custom$q$, $q$custom$q$, $q$["SSO","User management"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Faved is an open-source bookmark manager (1.1K+ GitHub stars) built around a customizable nested-tag system for organizing large bookmark collections. It's designed to be lightweight and fast, with instant search across a user's entire library.$q$, $q$Faved can be self-hosted for free using a single Docker command, keeping all bookmark data under the user's own control, or used via a paid managed cloud offering for people who don't want to run their own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Faved suits people managing large or growing bookmark libraries who want fast, structured organization, as well as self-hosting enthusiasts who want full data ownership and small teams needing a shared bookmark space.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3185965d-fd1d-45c7-a0e1-03ac82f24008', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Firefox Account Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source identity backend behind Firefox Sync that advanced self-hosters can deploy independently of Mozilla.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$The Firefox/Mozilla accounts server (fxa) is Mozilla's open-source identity backend for Firefox Sync, self-hostable by advanced users.$q$,
  og_description = $q$The Firefox/Mozilla accounts server (fxa) is Mozilla's open-source identity backend for Firefox Sync, self-hostable by advanced users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '864fba7c-ef16-406d-a4f4-ba7e53df55cc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '864fba7c-ef16-406d-a4f4-ba7e53df55cc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Auth-server + content-server architecture$q$, $q$Separates account/authentication logic from the web-based account management interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$OAuth-based authentication$q$, $q$Provides the identity layer used by Firefox Sync and other Mozilla services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Open-source Node.js codebase$q$, $q$Publicly maintained on GitHub as the mozilla/fxa monorepo.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Configurable client endpoint$q$, $q$Firefox can be pointed at a custom accounts server via browser configuration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Documented (preliminary) self-hosting path$q$, $q$Mozilla provides instructions for cloning and deploying an independent instance, though the guide is explicitly marked as a work in progress.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Free and open source, built from Mozilla's own production codebase$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Enables full independence from Mozilla-hosted identity infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Actively used and maintained as Mozilla's real accounts system$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Mozilla's own self-hosting documentation is explicitly preliminary and incomplete$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Requires also deploying your own Sync server for full functionality$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Non-trivial deployment involving multiple Node.js services$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Mozilla trademark restrictions apply to the content-server's branding for non-personal use$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Can I self-host the Firefox/Mozilla accounts server?$q$, $q$Yes, Mozilla's own documentation describes cloning the mozilla/fxa repository and deploying your own auth-server and content-server instances.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Is anything else required besides the accounts server?$q$, $q$Yes — self-hosters must also run their own Sync server (sync-1.5), since Mozilla-hosted sync servers won't trust accounts issued by a third-party server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Is this the same thing as Firefox Sync?$q$, $q$No. It's the identity/account layer that Firefox Sync and other Mozilla services authenticate against.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Is the project actively maintained?$q$, $q$Yes, the mozilla/fxa monorepo is Mozilla's production codebase for what is now branded Mozilla accounts.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Independent Firefox-Sync-compatible identity backend$q$, $q$Run your own accounts and sync infrastructure fully separate from Mozilla's hosted services.$q$, $q$Advanced self-hosters and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$Reference architecture$q$, $q$Study a real-world, production OAuth-based account server implementation.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$The Firefox Account Server, now generally referred to as Mozilla accounts (fxa), is the open-source identity and authentication system that powers Firefox Sync and other Mozilla-hosted services. Its codebase, maintained in the mozilla/fxa monorepo, consists of an auth-server that manages account data and authentication and a content-server that provides the web-based account management UI.$q$, $q$By default, Firefox points at Mozilla's own hosted instance at accounts.firefox.com, but Mozilla's own documentation describes how to run an independent instance by cloning the repository and deploying your own auth-server and content-server. Mozilla explicitly notes this self-hosting guide is preliminary and incomplete, and that self-hosters must also run their own Sync server (sync-1.5), since Mozilla's hosted sync servers will not trust account assertions issued by a third-party accounts server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$This is an advanced, infrastructure-level project intended for experienced sysadmins or organizations who want to run their own Firefox-Sync-compatible identity backend independent of Mozilla's hosted service — not something aimed at casual end users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('864fba7c-ef16-406d-a4f4-ba7e53df55cc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Karakeep ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hostable bookmark, note, and image manager with AI-powered auto-tagging and full-text search.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2023,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Karakeep (formerly Hoarder) is an open-source, self-hostable bookmark, note, and image manager with AI auto-tagging and full-text search.$q$,
  og_description = $q$Karakeep (formerly Hoarder) is an open-source, self-hostable bookmark, note, and image manager with AI auto-tagging and full-text search.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fab34bce-400c-45a0-b3be-67931923345e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fab34bce-400c-45a0-b3be-67931923345e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$AI-powered auto-tagging$q$, $q$Automatically tags saved links, notes, and images using AI to speed up later retrieval.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Full-text search$q$, $q$Search across all saved content, including highlighted text from saved pages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$RSS feed subscriptions$q$, $q$Subscribe to feeds so new content is automatically collected into Karakeep.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Automation rules$q$, $q$Set up rules to automatically manage and organize incoming bookmarks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Collaborative collections$q$, $q$Share and collaborate on bookmark collections with others.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$REST API and webhooks$q$, $q$Integrate Karakeep with other tools and services via its API and webhook support.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Broad platform coverage$q$, $q$Available as apps for iOS, Android, Chrome, Firefox, and Safari, plus a web app and CLI tool.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Large, active open-source community (26k+ GitHub stars, 150+ contributors)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$AI tagging reduces manual bookmark organization work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Wide platform coverage across mobile, browser extensions, CLI, and API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Self-hosted version is free and fully featured$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$AI tagging typically requires configuring an external AI provider, which can add cost$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Cloud free tier is very limited (10 bookmarks, 20MB storage)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Self-hosting requires Docker and basic server management skills$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Is Karakeep free?$q$, $q$Self-hosting is free forever and fully featured. Cloud hosting has a limited free tier plus a Pro plan at $4/month ($40/year).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Was Karakeep previously called something else?$q$, $q$Yes, it launched as Hoarder in January 2023 and was rebranded to Karakeep in 2025.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Does Karakeep have an API?$q$, $q$Yes, it offers a REST API with webhook support for integrations and automation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$What license is Karakeep under?$q$, $q$AGPL-3.0.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Personal knowledge management$q$, $q$Centralize links, notes, and images with automatic AI tagging for fast retrieval.$q$, $q$Individuals managing large personal archives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Self-hosted read-it-later alternative$q$, $q$Replace services like Pocket or Raindrop with a self-hosted, open-source option.$q$, $q$Privacy-focused self-hosters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Team bookmark collaboration$q$, $q$Use shared collections and the Corporate plan for organizational bookmark management.$q$, $q$Small teams and organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full feature set","AI tagging with your own AI provider","REST API and webhooks"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Cloud Free$q$, $q$$0$q$, $q$trial$q$, $q$["10 bookmarks","20MB storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Cloud Pro$q$, $q$$4/month ($40/year)$q$, $q$monthly or yearly$q$, $q$["AI tagging","Full-text search","50GB storage"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$Corporate$q$, $q$Custom$q$, $q$custom$q$, $q$["Per-seat pricing","SSO","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Karakeep (formerly Hoarder, launched in January 2023 and rebranded to Karakeep in 2025) is a self-hostable "bookmark everything" app for saving links, notes, images, and PDFs. It uses AI to automatically tag saved content for faster retrieval, and it's fully open source under AGPL-3.0 with 26k+ GitHub stars and 150+ contributors, developed by Localhost Labs Ltd.$q$, $q$Beyond bookmarking, Karakeep supports RSS feed subscriptions, automation rules, highlighting and organizing text from saved pages, and collaborative shared collections, all searchable through a comprehensive full-text search.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Karakeep is built for people who save large volumes of links, notes, and images and want automatic organization rather than manual tagging — including self-hosters looking for an open alternative to services like Pocket or Raindrop.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fab34bce-400c-45a0-b3be-67931923345e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── LinkWarden ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted bookmark manager that preserves full-page snapshots with AI tagging and team collaboration.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Linkwarden is an open-source, self-hosted bookmark manager that archives full web pages with AI tagging, annotation, and team collaboration.$q$,
  og_description = $q$Linkwarden is an open-source, self-hosted bookmark manager that archives full web pages with AI tagging, annotation, and team collaboration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '012e0305-9686-40a7-a4fd-779a85ef6658';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '012e0305-9686-40a7-a4fd-779a85ef6658' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Full-page preservation$q$, $q$Archives full pages in formats like HTML to protect against content disappearing or link rot.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Reader view with annotation$q$, $q$Read saved pages with customizable fonts, highlighting, and annotation tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$AI-powered tagging$q$, $q$Automatically organizes bookmarks using AI-driven tagging and smart search filters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Team and public collections$q$, $q$Share collections privately with a team or publicly with anyone.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$RSS feed integration$q$, $q$Subscribe to RSS feeds directly within a collection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Native mobile apps$q$, $q$Dedicated iOS and Android apps in addition to a browser extension and installable PWA.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Bookmark sync and import/export$q$, $q$Sync bookmarks via Floccus and import or export existing bookmark data.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$REST API$q$, $q$Secure API with access tokens for custom integrations and automation.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Full-page archival goes beyond simple bookmarking to reduce link-rot risk$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Large, active open-source community (18k+ GitHub stars)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Native iOS and Android apps, not just a PWA$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$AI-powered tagging built in$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Self-hosted deployment unlocks all features for free$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Cloud plan is billed per user, which can add up for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Full-page archiving increases storage requirements compared to lightweight bookmarking tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$AI tagging may depend on configuring an external AI provider$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Is Linkwarden free?$q$, $q$Self-hosting is free and open source (AGPL-3.0) with all features unlocked. Cloud hosting starts at $3/month per user with a 14-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Does Linkwarden save the full page, not just the link?$q$, $q$Yes, it archives full pages (e.g., as HTML) to preserve content even if the original page later disappears.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Is there a mobile app?$q$, $q$Yes, native iOS and Android apps are available in addition to a browser extension and PWA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Does Linkwarden have an API?$q$, $q$Yes, a secure REST API with access tokens for custom integrations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Long-term research archival$q$, $q$Preserve full copies of reference material so it remains accessible even if the source page changes or disappears.$q$, $q$Researchers and knowledge workers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Team link collaboration$q$, $q$Build and share collections of preserved, annotated pages with a team.$q$, $q$Small teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Personal read-it-later with annotation$q$, $q$Save, read, and highlight articles in a distraction-free reader view.$q$, $q$Individuals$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["All premium features unlocked","Docker deployment","Unlimited links"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Cloud$q$, $q$$3/month per user$q$, $q$monthly$q$, $q$["14-day free trial","Up to 30,000 links","Priority support","Automatic updates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$Custom/Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Unlimited links","Customizable instances"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Linkwarden is an open-source bookmark manager (18k+ GitHub stars) that goes beyond simple link-saving by capturing full-page archives of saved content, helping guard against link rot. It's licensed under AGPL-3.0, with the entire source code published on GitHub, and can be self-hosted via Docker.$q$, $q$In addition to archiving, Linkwarden offers a reader view with annotation and highlighting, AI-powered automatic tagging, RSS feed integration inside collections, and sharing/collaboration for teams and public collections. Native iOS and Android apps and browser extensions are also available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Linkwarden suits individuals and teams who want to permanently preserve web content — not just bookmark a URL — with searchable, annotated archives, and who value self-hosting for data ownership.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('012e0305-9686-40a7-a4fd-779a85ef6658', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── SyncMarks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted bookmark sync server and browser extension for syncing bookmarks without a cloud account.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SyncMarks is a free, open-source, self-hosted bookmark sync server and browser extension for cross-browser syncing without a cloud account.$q$,
  og_description = $q$SyncMarks is a free, open-source, self-hosted bookmark sync server and browser extension for cross-browser syncing without a cloud account.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ac80e97e-dd85-4267-aa95-dfb4cefc4fc3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Cross-browser sync$q$, $q$Syncs bookmarks across Firefox, Microsoft Edge, and Chrome/Chromium-based browsers via a REST API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Self-hosted backend$q$, $q$Runs entirely on your own PHP/JavaScript server, with no cloud account or third-party service involved.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Standalone web app$q$, $q$The backend can be used as a full bookmark manager on its own, without the browser extension.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Full bookmark management$q$, $q$Add, edit, move, and delete bookmarks from any connected device.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Tab sync$q$, $q$The browser extension also supports syncing open tabs alongside bookmarks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Community translations$q$, $q$Interface translations are maintained through Weblate.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Complete self-hosted control with no cloud dependency or tracking$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Works across multiple browser vendors (Firefox, Edge, Chrome/Chromium)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Actively maintained project with regular releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Usable as a standalone bookmark manager even without the extension$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Requires running your own PHP/database backend$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Smaller community than mainstream browser-sync solutions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Setup requires some technical/self-hosting knowledge$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Is SyncMarks free?$q$, $q$Yes, it's free and open source under the GPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Do I need the browser extension to use SyncMarks?$q$, $q$No, the web app backend can be used standalone as a bookmark manager without installing the extension.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Which browsers does the extension support?$q$, $q$Firefox, Microsoft Edge, and Chrome/Chromium-based browsers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Where is my bookmark data stored?$q$, $q$Entirely on your own self-hosted server — SyncMarks does not use any third-party cloud service.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Cross-browser bookmark sync$q$, $q$Keep bookmarks in sync across different browsers without relying on a vendor's cloud account.$q$, $q$Privacy-conscious self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$Standalone bookmark manager$q$, $q$Use the self-hosted web app on its own as an alternative to browser-native bookmarking.$q$, $q$Individuals wanting full control of their bookmark data$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SyncMarks is an open-source bookmark synchronization system made up of two parts: a browser extension (available for Firefox, Edge, and Chrome/Chromium-based browsers) and a self-hosted PHP/JavaScript web app backend. Together they let users sync bookmarks across browsers and devices via their own server, communicating over a REST API and also supporting tab sync.$q$, $q$The project's philosophy is explicit about privacy: "your server, your data," with no cloud service, no account, and no tracking. It's licensed under GPLv3, with the extension distributed through Mozilla Add-ons and the Edge Store, and source code hosted on Codeberg and GitHub. The web app backend can also be used entirely on its own, as a standalone bookmark manager, without installing the extension.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SyncMarks is aimed at privacy-focused users and self-hosters who want cross-browser bookmark sync without relying on a browser vendor's built-in cloud sync (such as Firefox Sync or Chrome Sync).$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ac80e97e-dd85-4267-aa95-dfb4cefc4fc3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Baïkal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, self-hosted CalDAV and CardDAV server for privately syncing calendars and contacts across devices.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Baïkal is a free, open-source, self-hosted CalDAV/CardDAV server for syncing calendars and contacts, compatible with iOS, macOS, and DAVx5.$q$,
  og_description = $q$Baïkal is a free, open-source, self-hosted CalDAV/CardDAV server for syncing calendars and contacts, compatible with iOS, macOS, and DAVx5.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '140a021c-be44-4b36-b077-68c7c32ded9b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '140a021c-be44-4b36-b077-68c7c32ded9b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$CalDAV and CardDAV protocol support$q$, $q$Syncs both calendars and contacts using the standard CalDAV/CardDAV protocols.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Web admin interface$q$, $q$Manage users, address books, and calendars through a built-in web UI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Broad client compatibility$q$, $q$Works with iOS, macOS, Mozilla Thunderbird, DAVx5 on Android, and other CalDAV/CardDAV clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Minimal server requirements$q$, $q$Runs on any basic PHP-capable web server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Flexible storage backends$q$, $q$Stores data in either MySQL or SQLite.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Built on sabre/dav$q$, $q$Uses the well-established sabre/dav library as its underlying protocol implementation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Very lightweight and quick to install, especially with SQLite$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Broad compatibility with major calendar and contact clients$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Minimal server requirements$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Built on the mature, actively maintained sabre/dav framework$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Basic, utilitarian web interface with no built-in calendar view$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$No native mobile app — relies entirely on third-party CalDAV/CardDAV clients$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Limited sharing/permission granularity compared to full groupware suites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Is Baïkal free?$q$, $q$Yes, it's free open-source software licensed under GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$What database does Baïkal use?$q$, $q$MySQL or SQLite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$What clients work with Baïkal?$q$, $q$Any CalDAV/CardDAV client, including iOS, macOS, Thunderbird, and DAVx5 on Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Who maintains Baïkal?$q$, $q$It's built on the sabre/dav framework, originally developed by Net Gusto and fruux, and now maintained under the sabre.io project with community contributions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Personal or family calendar and contacts sync$q$, $q$Host your own private CalDAV/CardDAV server instead of relying on a third-party cloud provider.$q$, $q$Individuals and households$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Small team calendar sharing$q$, $q$Manage multiple users and shared calendars/address books from a single lightweight server.$q$, $q$Small offices and teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Privacy-focused alternative to cloud calendars$q$, $q$Replace Google Calendar/Contacts sync with a self-hosted option.$q$, $q$Privacy-conscious self-hosters$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Baïkal is a lightweight, self-hosted CalDAV and CardDAV server for managing calendars and contacts across multiple devices while keeping data under the user's own control. It's built on the sabre/dav framework, was originally developed by Net Gusto and fruux, and now lives under the sabre.io project with ongoing community contributions.$q$, $q$Installation is minimal — Baïkal just needs a PHP-capable server plus either a MySQL or SQLite database — and it includes a web interface for managing users, address books, and calendars. It's released under the GNU GPLv3 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Baïkal is aimed at individuals, households, and small teams who want a private, self-hosted alternative to cloud calendar and contact syncing, and who already use CalDAV/CardDAV-capable apps like Apple Calendar/Contacts, Thunderbird, or DAVx5 on Android.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── DAViCal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted CalDAV server for sharing and synchronizing calendars, contacts, and free/busy scheduling.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$DAViCal is a free, open-source, self-hosted CalDAV server for shared calendar sync, delegation, and free/busy meeting scheduling.$q$,
  og_description = $q$DAViCal is a free, open-source, self-hosted CalDAV server for shared calendar sync, delegation, and free/busy meeting scheduling.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1107dc4a-e771-4cc9-887a-5ba99556372b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1107dc4a-e771-4cc9-887a-5ba99556372b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$CalDAV protocol server$q$, $q$Standards-based calendar sync compatible with a wide range of desktop and mobile clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Delegated access$q$, $q$Supports read/write delegation so multiple users can share and edit the same calendars.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Free/busy scheduling$q$, $q$Displays free/busy time to support scheduling meetings across users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$WebDAV access modes$q$, $q$Offers both read-only and read-write WebDAV access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Broad client compatibility$q$, $q$Works with Mozilla Lightning, Evolution, Apple iCal, iOS, and other CalDAV clients.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$PostgreSQL-backed storage$q$, $q$Uses PostgreSQL as its data store for calendar information.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Mature project with a long-running, community-supported history$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Strong multi-user delegation and calendar-sharing model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Works with major desktop and mobile CalDAV clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Free and open source under the GPL$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Documentation and codebase reflect an older PHP 5-era design$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Requires PostgreSQL specifically, less flexible than SQLite-based alternatives$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$The project itself does not recommend running it on Windows$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Is DAViCal free?$q$, $q$Yes, it's free software licensed under the GPL.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$What database does DAViCal require?$q$, $q$PostgreSQL.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$What calendar clients work with DAViCal?$q$, $q$Mozilla Lightning, Evolution, Apple iCal, iOS, and other CalDAV-capable clients.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Who created DAViCal?$q$, $q$Andrew McMillan originally created it; the project moved to a community support model in 2014.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Shared team calendaring$q$, $q$Delegate calendar read/write access across a team or small office.$q$, $q$Small businesses and teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Meeting scheduling with free/busy lookup$q$, $q$Coordinate meetings using free/busy time display without a full Exchange-style server.$q$, $q$Organizations wanting lightweight scheduling$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$Personal calendar hosting$q$, $q$Run a private CalDAV server for individual use.$q$, $q$Individual self-hosters$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$DAViCal is a free, self-hosted CalDAV server for storing and synchronizing calendar data in iCalendar format across multiple users and clients. It was originally created by Andrew McMillan and later moved to a community support model in 2014.$q$, $q$It supports delegated read/write access so multiple users or clients can read and write the same calendar entries over time, along with free/busy time display for meeting scheduling and WebDAV access in either read-only or read-write mode. It runs on any PHP-capable web server backed by PostgreSQL, and works with clients including Mozilla Lightning, Evolution, Apple iCal, and iOS. It's released under the GPL.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$DAViCal suits small businesses, teams, and individual self-hosters who want shared calendaring with delegation and meeting-scheduling features, without adopting a full groupware or Exchange-style server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1107dc4a-e771-4cc9-887a-5ba99556372b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Keeper.sh ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source calendar sync tool that consolidates events across Google Calendar, Outlook, iCloud, and CalDAV.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Keeper.sh is an open-source calendar sync tool that merges Google Calendar, Outlook, iCloud, and CalDAV into one view; free tier available.$q$,
  og_description = $q$Keeper.sh is an open-source calendar sync tool that merges Google Calendar, Outlook, iCloud, and CalDAV into one view; free tier available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f9315862-aea5-4bd1-8365-1d5381cc4337';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f9315862-aea5-4bd1-8365-1d5381cc4337' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Multi-provider sync$q$, $q$Syncs events across Google Calendar, Outlook, iCloud, CalDAV, and generic ICS/iCal feeds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Customizable sync rules$q$, $q$Controls which event details are shared between linked calendars.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Conflict reconciliation$q$, $q$A sync engine that reconciles conflicting changes and prevents orphaned duplicate events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Aggregated iCal feed$q$, $q$Generates a combined, filterable iCal feed from multiple source calendars.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Self-hostable$q$, $q$Deployable via Docker or manual installation using the open-source GitHub repository.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$API access$q$, $q$Available on the Pro plan for programmatic access and automation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Open source (AGPL-3.0) with a genuine self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Simple setup with no complex configuration required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Supports all major calendar providers plus generic CalDAV/ICS feeds$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Affordable Pro tier for users needing frequent sync and API access$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Free tier is limited to 2 linked accounts and a 30-minute sync interval$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Faster 1-minute sync and API access require the paid Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Newer project with a smaller community than established calendar tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Is Keeper.sh free?$q$, $q$There's a free tier with 2 linked accounts and 30-minute sync; the Pro plan is $5/month for unlimited accounts and 1-minute sync.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Can I self-host Keeper.sh?$q$, $q$Yes, it's open source under AGPL-3.0 and can be self-hosted via Docker or manual deployment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Which calendar providers are supported?$q$, $q$Google Calendar, Outlook, iCloud, CalDAV, and ICS/iCal feeds.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Does Keeper.sh have an API?$q$, $q$Yes, API access is included with the Pro plan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Merging personal and work calendars$q$, $q$Keep events across multiple accounts in sync without manually copying entries.$q$, $q$Individuals juggling multiple calendars$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Cross-platform calendar consolidation$q$, $q$Combine calendars from different providers into one view without a full groupware suite.$q$, $q$Freelancers and consultants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Automated calendar workflows$q$, $q$Use the API to build custom automation on top of synced calendar data.$q$, $q$Developers and power users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["30-minute sync interval","Up to 2 linked accounts","3 sync mappings"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$Pro$q$, $q$$5/month$q$, $q$monthly$q$, $q$["1-minute sync interval","Unlimited linked accounts","Unlimited sync mappings","API access"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Keeper.sh is a calendar synchronization tool that aggregates events across personal, work, business, and school calendars and keeps them automatically updated. It supports Google Calendar, Outlook, iCloud, CalDAV, and generic ICS/iCal feeds, with customizable rules controlling which event details are shared between calendars.$q$, $q$It's open source under the AGPL-3.0 license and can be self-hosted via Docker images or manual deployment, or used as a hosted service. A conflict-reconciliation engine prevents orphaned or duplicate events, and it can also generate an aggregated, filterable iCal feed.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Keeper.sh serves both casual users juggling personal, work, and school calendars, and power users who need frequent sync intervals, unlimited linked accounts, and API access for automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9315862-aea5-4bd1-8365-1d5381cc4337', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Manage My Damn Life ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source web front end for managing CalDAV tasks and calendars across multiple accounts.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Manage My Damn Life is a free, open-source, self-hosted web front end for managing CalDAV tasks and calendars from Nextcloud, Baikal, or Radicale.$q$,
  og_description = $q$Manage My Damn Life is a free, open-source, self-hosted web front end for managing CalDAV tasks and calendars from Nextcloud, Baikal, or Radicale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5876a809-20b6-4a29-bd49-189eea244f05';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5876a809-20b6-4a29-bd49-189eea244f05' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Multi-account CalDAV support$q$, $q$Connect several CalDAV accounts and manage them from one interface, using the tsdav library for protocol access.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Multiple task and calendar views$q$, $q$Switch between list, calendar, and Gantt-chart views of the same underlying tasks and events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Subtasks and rich task fields$q$, $q$Tasks support due dates, status, description, and recurrence rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Nextcloud, Baikal, and Radicale compatibility$q$, $q$Tested against these open-source CalDAV servers, with broader server support expected via the tsdav library.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Google Calendar OAuth$q$, $q$Connect a Google Calendar account alongside self-hosted CalDAV accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Docker deployment$q$, $q$Ships with a sample docker-compose file for self-hosting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Free and open source, no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Works with popular self-hosted CalDAV servers you may already run$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Multiple views (list, calendar, Gantt) for the same task data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Supports multiple accounts and both CalDAV and Google Calendar$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Requires you to already run (or set up) a separate CalDAV server such as Nextcloud, Baikal, or Radicale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Small community project — support relies on the GitHub repository rather than dedicated documentation or a company$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Self-hosting and Docker familiarity required to deploy it$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Do I need a CalDAV server to use Manage My Damn Life?$q$, $q$Yes. MMDL is a front end only — it connects to an existing CalDAV server such as Nextcloud, Baikal, or Radicale (or to Google Calendar via OAuth).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Is Manage My Damn Life free?$q$, $q$Yes, it's free and open source, distributed on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$How do I deploy it?$q$, $q$The project provides a sample docker-compose configuration for self-hosted deployment.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Unified task/calendar dashboard$q$, $q$Combine tasks and events from several CalDAV accounts and Google Calendar in one interface.$q$, $q$Self-hosters managing multiple calendar accounts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$Project-style task tracking$q$, $q$Use the Gantt view to plan tasks with due dates and recurrence on top of a CalDAV backend.$q$, $q$Individuals who want lightweight project tracking without a SaaS tool$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Manage My Damn Life (MMDL) is a free, open-source, self-hosted front end for CalDAV tasks and calendars. Rather than replacing your calendar server, it acts as a unified interface that connects to existing CalDAV backends such as Nextcloud, Baikal, and Radicale, plus Google Calendar over OAuth.$q$, $q$The project is built with Next.js and distributed on GitHub under the intri-in organization, with Docker deployment support for people who want to run it on their own infrastructure alongside their existing calendar server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MMDL is aimed at self-hosters who already run a CalDAV server and want a more capable task-and-calendar interface than their server's default web UI, without handing calendar data to a third-party SaaS product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5876a809-20b6-4a29-bd49-189eea244f05', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Radicale ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, free CalDAV and CardDAV server for self-hosting calendars, to-do lists, and contacts.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Radicale is a free, open-source CalDAV and CardDAV server for self-hosting calendars, to-do lists, and contacts with minimal setup.$q$,
  og_description = $q$Radicale is a free, open-source CalDAV and CardDAV server for self-hosting calendars, to-do lists, and contacts with minimal setup.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95330f45-8ddc-4fe4-b00d-c7498b26f5ac';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95330f45-8ddc-4fe4-b00d-c7498b26f5ac' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$CalDAV support$q$, $q$Sync events, to-dos, and journal entries to any standard CalDAV client.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$CardDAV support$q$, $q$Sync contacts/address books to any standard CardDAV client.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Filesystem storage$q$, $q$Data is stored as plain files, simplifying backup and inspection.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Pluggable authentication and rights$q$, $q$Extensible auth, rights-management, storage, and web-interface plugin system.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$TLS support$q$, $q$Secure client connections out of the box.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Cross-platform$q$, $q$Runs on Linux, BSD, macOS, Windows, and via Docker.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Genuinely lightweight — minimal dependencies and simple filesystem-based storage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$No complicated setup required to get a working CalDAV/CardDAV server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Free and open source under GPLv3$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Works with any standard CalDAV/CardDAV client$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$No built-in web UI comparable to full groupware suites — it's a protocol server, not a polished app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Scaling and multi-user administration is more manual than hosted alternatives$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Community-maintained project, not a commercial product with SLAs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Is Radicale free?$q$, $q$Yes, Radicale is free, open-source software licensed under GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$What protocols does Radicale support?$q$, $q$CalDAV for calendars and to-do lists, and CardDAV for contacts.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Does Radicale need a database?$q$, $q$No, it stores data directly on the filesystem.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Can I use Radicale with Apple Calendar or Thunderbird?$q$, $q$Yes, any standard CalDAV/CardDAV client can connect to a Radicale server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Self-hosted calendar sync$q$, $q$Sync calendars and to-do lists across devices without a third-party cloud provider.$q$, $q$Privacy-focused individuals and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$Backend for CalDAV front ends$q$, $q$Serve as the storage backend for other apps and front ends that speak CalDAV/CardDAV.$q$, $q$Self-hosters building a personal productivity stack$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Radicale is a small but capable CalDAV (calendars, to-do lists, journal entries) and CardDAV (contacts) server, released under the GPLv3 license and maintained by the Kozea community. It's written in Python 3.9+ and can run as a standalone HTTP server or as a WSGI application behind another web server.$q$, $q$It stores data directly on the filesystem in a simple folder structure, avoiding a database dependency, and works out of the box with minimal configuration. Radicale supports TLS, pluggable authentication and access-control backends, and runs on Linux, BSD, macOS, and Windows, as well as via Docker (amd64 and arm64).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Radicale suits individuals and small teams who want to self-host calendar and contact sync (compatible with standard CalDAV/CardDAV clients like Apple Calendar/Contacts, Thunderbird, and DAVx5) without running a heavier groupware suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95330f45-8ddc-4fe4-b00d-c7498b26f5ac', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── AnyCable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted realtime WebSocket server with delivery guarantees, built to offload real-time features from web app backends.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AnyCable is a self-hosted, MIT-licensed realtime WebSocket server with delivery guarantees, built by Evil Martians for Rails, Laravel, and Node.js apps.$q$,
  og_description = $q$AnyCable is a self-hosted, MIT-licensed realtime WebSocket server with delivery guarantees, built by Evil Martians for Rails, Laravel, and Node.js apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Delivery guarantees$q$, $q$Automatically recovers messages missed during connectivity interruptions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Connection persistence$q$, $q$Keeps WebSocket connections alive across backend application deployments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$High connection capacity$q$, $q$Designed to support 10,000+ concurrent connections per server instance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Presence tracking$q$, $q$Track which users/clients are currently connected to a channel.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Framework integrations$q$, $q$Native support for Rails/Hotwire/Turbo Streams, plus HTTP API access from Laravel, Node.js, Python, and other backends.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$On-premise deployment$q$, $q$Self-hosted option keeps connection data on your own infrastructure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Open-source core is free and self-hostable under MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Written in Go for low memory overhead on long-lived connections$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Built-in delivery guarantees and reconnection handling reduce custom real-time code$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Strong Rails/Hotwire integration from a well-known Ruby consultancy (Evil Martians)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Advanced features (adaptive scaling, binary compression, dedicated support) are gated behind the paid Pro tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Adds an extra service to operate and monitor alongside your main backend$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Best-documented for Rails/Hotwire; other backend integrations rely on a generic HTTP API$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Is AnyCable free to self-host?$q$, $q$Yes, the open-source core is free and MIT-licensed. A paid Pro tier (listed at $1,490/year) adds features like adaptive scaling and dedicated support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$What frameworks does AnyCable work with?$q$, $q$It has native integration with Rails/Hotwire/Turbo Streams and can be used from Laravel, Node.js, Python, or any backend via its HTTP API.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Who builds AnyCable?$q$, $q$AnyCable is developed by Evil Martians and has been used in production since 2017.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Scaling WebSocket connections$q$, $q$Offload persistent connection handling from a Rails/Hotwire or other backend to a dedicated Go server.$q$, $q$Engineering teams outgrowing built-in WebSocket handling$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Real-time notifications and dashboards$q$, $q$Push live updates (dashboards, tracking, chat) to clients with delivery guarantees.$q$, $q$Product teams building real-time features$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted realtime server","MIT license","Core delivery guarantees and connection handling"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Pro$q$, $q$$1,490/year$q$, $q$yearly$q$, $q$["Unlimited instances","Adaptive scaling","Binary compression","Dedicated support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AnyCable is a standalone realtime server, written in Go, that handles persistent WebSocket connections on behalf of a web application backend. It adds delivery guarantees (recovering messages missed during a disconnect), presence tracking, message ordering, and connection persistence across backend deployments.$q$, $q$It's built and maintained by Evil Martians and released under the MIT license as open-source software, with an optional paid Pro tier and a managed SaaS offering for teams that don't want to operate it themselves. AnyCable integrates with Rails/Hotwire and Turbo Streams natively, and can be used from Laravel, Node.js, Python, or any backend that can call its HTTP API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AnyCable is aimed at engineering teams — particularly Rails/Hotwire shops, but also polyglot teams — who need reliable real-time features (chat, live dashboards, notifications, presence) at a scale where a request/response backend's built-in WebSocket handling (e.g. Action Cable) becomes a bottleneck.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Centrifugo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted real-time messaging server for broadcasting updates over WebSocket and other transports.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Centrifugo is an open-source, self-hosted real-time messaging server for broadcasting over WebSocket, SSE, and gRPC, with an optional PRO edition.$q$,
  og_description = $q$Centrifugo is an open-source, self-hosted real-time messaging server for broadcasting over WebSocket, SSE, and gRPC, with an optional PRO edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1c38ae10-51dd-4efa-aae5-4c2f20863745';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1c38ae10-51dd-4efa-aae5-4c2f20863745' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Multiple transport protocols$q$, $q$WebSocket, HTTP-streaming, Server-Sent Events, WebTransport, and gRPC.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$PUB/SUB and state sync$q$, $q$Broadcast messages and synchronize state to subscribed clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Channel history and presence$q$, $q$Track channel history and which clients are currently online.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Clustering via Redis/PostgreSQL/NATS$q$, $q$Scale across multiple nodes using a supported broker/engine.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Client SDKs$q$, $q$Official SDKs for web and mobile clients, with a language-agnostic backend publishing API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Centrifugo PRO add-ons$q$, $q$Commercial edition adds analytics, tracing, push notification APIs, and SSO integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Open-source core is free, MIT-licensed, and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Language-agnostic — any backend can publish messages via its API$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Built for horizontal scaling to large numbers of concurrent connections$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Supports several transport protocols beyond plain WebSocket$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Advanced operational features (analytics, tracing, SSO) require the paid PRO edition with custom, company-size-based pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Requires running and operating a separate broker (Redis/PostgreSQL/NATS) for multi-node clustering$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Adds infrastructure to manage compared to a fully hosted real-time API$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Is Centrifugo free?$q$, $q$The core Centrifugo server is free and open source under the MIT license. Centrifugo PRO is a separately licensed commercial edition with custom pricing based on company size.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$What transports does Centrifugo support?$q$, $q$WebSocket, HTTP-streaming, Server-Sent Events, WebTransport, and gRPC.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Can Centrifugo scale across multiple servers?$q$, $q$Yes, using Redis, PostgreSQL, or NATS as a broker for clustering.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Live chat and comments$q$, $q$Broadcast chat messages or comment updates to connected clients in real time.$q$, $q$Engineering teams building chat or live-comment features$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Live dashboards and data feeds$q$, $q$Stream analytics, financial, or IoT sensor data to connected clients.$q$, $q$Teams building real-time dashboards$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted messaging server","MIT license","Core PUB/SUB, presence, and history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$Centrifugo PRO$q$, $q$Custom (contact sales)$q$, $q$yearly$q$, $q$["Analytics and real-time tracing","Push notification APIs","SSO integrations","Priority support and updates"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Centrifugo is a self-hosted, MIT-licensed real-time messaging server written in Go. It manages persistent client connections and broadcasts messages over WebSocket, HTTP streaming, SSE, WebTransport, or gRPC, acting as a self-hosted alternative to hosted services like Pusher, Ably, or PubNub.$q$, $q$It supports PUB/SUB messaging, channel history, online presence, and clustering via Redis, PostgreSQL, or NATS as a broker, making it suitable for broadcasting to large numbers of concurrently connected clients. A commercial Centrifugo PRO edition adds features like analytics, real-time tracing, push notification APIs, and SSO, licensed separately from the open-source core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Centrifugo is aimed at backend engineering teams who need to add real-time features — chat, live comments, multiplayer state sync, live dashboards, or AI token streaming — to an existing application without depending on a hosted real-time SaaS provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c38ae10-51dd-4efa-aae5-4c2f20863745', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Chitchatter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source peer-to-peer chat app that runs serverless in the browser with no accounts and no message storage.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Chitchatter is a free, open-source, serverless peer-to-peer chat app with video, screen sharing, and no message storage or sign-up.$q$,
  og_description = $q$Chitchatter is a free, open-source, serverless peer-to-peer chat app with video, screen sharing, and no message storage or sign-up.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dd982ac6-15fa-4c92-86fd-7b3367a55768';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dd982ac6-15fa-4c92-86fd-7b3367a55768' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Serverless peer-to-peer chat$q$, $q$Messages travel directly between browsers over WebRTC with no backend server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Public and private rooms$q$, $q$Create shareable public rooms or private, name-gated rooms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Video, audio, and screen sharing$q$, $q$Supports video/audio chat and screen sharing between peers in a room.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Encrypted file transfer$q$, $q$Files are encrypted before sending and decrypted by the receiver, with no practical size limit.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Markdown messages$q$, $q$Message text supports Markdown formatting and code syntax highlighting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Ephemeral by design$q$, $q$Messages are never persisted to disk and disappear from memory when a peer leaves.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$No account, sign-up, or server-side message storage required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Free and open source under GPLv2, can be self-hosted as a static site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Supports video, audio, screen share, and encrypted file transfer, not just text$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Ephemeral messaging by design reduces data-retention risk$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Relies on public WebTorrent trackers and TURN servers for peer discovery/relay, which are outside your control$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$No message history or persistence — anything not backfilled from a connected peer is lost$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$As a browser-based P2P tool, reliability can vary with network conditions (NAT/firewall traversal)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Does Chitchatter store my messages?$q$, $q$No. Messages exist only in each connected browser's memory and are cleared when you leave a room.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Do I need an account to use Chitchatter?$q$, $q$No, there's no sign-up — you join a room by name and start chatting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Is Chitchatter self-hostable?$q$, $q$Yes, it's open source under GPLv2, so it can be deployed as a static site rather than using the hosted chitchatter.im instance.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Quick private conversation$q$, $q$Spin up a named room for a one-off private chat without creating an account.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$Ad hoc file or screen sharing$q$, $q$Share files or a screen directly between browsers without uploading to a server.$q$, $q$People needing a quick, serverless P2P session$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Chitchatter is a free, open-source, GPLv2-licensed chat application that connects users directly, browser-to-browser, using WebRTC — there's no chat backend storing messages. Rooms are ephemeral: when a peer leaves, messages held only in that peer's memory are gone.$q$, $q$It requires only static hosting (the project itself is served from GitHub Pages) plus public WebTorrent trackers and TURN relay servers to help establish peer connections; no application server or database is needed. Because it's open source, it can also be self-hosted as a static site.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Chitchatter suits people who want a quick, no-signup, privacy-oriented chat room for a conversation, file transfer, or screen share, without relying on a server that could log or retain messages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd982ac6-15fa-4c92-86fd-7b3367a55768', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Conduit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, open-source Matrix homeserver in Rust for self-hosting your own federated chat server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Conduit is a free, open-source, single-binary Matrix homeserver written in Rust for self-hosting your own federated chat server.$q$,
  og_description = $q$Conduit is a free, open-source, single-binary Matrix homeserver written in Rust for self-hosting your own federated chat server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e84117d-d544-4f29-89e5-dcf3d6e9f06a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e84117d-d544-4f29-89e5-dcf3d6e9f06a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Single-binary deployment$q$, $q$Ships as one binary with an embedded RocksDB database, simplifying setup.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Matrix protocol / federation$q$, $q$Federates with the wider Matrix network like other Matrix homeservers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Low system requirements$q$, $q$Built to run on modest hardware compared to larger Matrix homeserver implementations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Bridge compatibility$q$, $q$Can be paired with Matrix bridges to connect to platforms like Discord.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Free, open source (Apache-2.0), and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Simple single-binary setup with no external database to manage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Lower resource footprint than larger Matrix homeserver implementations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Interoperable with the broader federated Matrix network$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Officially labeled beta — some smaller Matrix features may be missing or unreliable$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Smaller contributor base than the reference Synapse homeserver$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Community forks (like Continuwuity) have diverged with additional features and more active recent development$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Is Conduit free?$q$, $q$Yes, Conduit is free, open-source software (Apache-2.0 license); the project also accepts donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$What is Conduit built with?$q$, $q$It's written in Rust and uses an embedded RocksDB database, packaged as a single binary.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Is Conduit production-ready?$q$, $q$The project describes itself as beta — functional for most Matrix use, but potentially missing smaller features.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$Personal or small-community Matrix server$q$, $q$Self-host a lightweight homeserver to chat on the Matrix network under your own domain.$q$, $q$Individuals and small communities self-hosting chat$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Conduit is a Matrix homeserver implementation written in Rust, released under the Apache-2.0 license by developer Timo Koesters. It's designed to be a single binary with an embedded RocksDB database, aiming for low system requirements and a quick setup compared to larger homeservers like Synapse.$q$, $q$Because it implements the Matrix protocol, a self-hosted Conduit server can federate with the wider Matrix network and use bridges to connect to platforms like Discord. The project describes itself as still in beta — most Matrix rooms and features work, but some smaller features may be missing or buggy. It received German government (BMBF/Prototype Fund) funding for part of its development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Conduit is aimed at self-hosters who want a lightweight, low-maintenance Matrix homeserver — for example running a small personal or community Matrix server — without the resource overhead of larger homeserver implementations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e84117d-d544-4f29-89e5-dcf3d6e9f06a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Continuwuity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Community-driven, actively maintained Matrix homeserver in Rust, continuing the Conduwuit/Conduit lineage.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2025,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Continuwuity is a free, open-source, actively maintained Matrix homeserver in Rust that continues the conduwuit/Conduit project.$q$,
  og_description = $q$Continuwuity is a free, open-source, actively maintained Matrix homeserver in Rust that continues the conduwuit/Conduit project.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '35d633ed-e78a-443f-ae86-ab29e7bc10d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '35d633ed-e78a-443f-ae86-ab29e7bc10d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Matrix protocol federation$q$, $q$Functions as a full Matrix homeserver, federating with the wider Matrix network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Drop-in conduwuit migration$q$, $q$Compatible with existing conduwuit deployments — migration is typically just a container image change.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Rust implementation$q$, $q$Built in Rust for performance and memory safety.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Regular release cadence$q$, $q$New releases roughly every one to two weeks from an active community.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Multiple deployment methods$q$, $q$Supports Docker and NixOS deployment, among other methods.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Bridge support$q$, $q$Works with Matrix bridges to platforms like Discord and Telegram.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Actively maintained with a frequent release cadence, unlike the now-abandoned conduwuit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Free, open source, and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Drop-in compatible with existing conduwuit deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Community-governed rather than dependent on a single maintainer$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Very young project (started 2025), with a shorter track record than established homeservers like Synapse$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$As a community fork of a fork, long-term project continuity depends on volunteer contributors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Licensing is mixed across sub-repositories rather than a single unified license$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Is Continuwuity a fork of Conduit?$q$, $q$It's the community continuation of conduwuit, which was itself a hard fork of the original Conduit Matrix homeserver.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Why was Continuwuity created?$q$, $q$conduwuit was abandoned by its maintainers in 2025; Continuwuity was started by community contributors to keep the codebase actively developed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Can I migrate from conduwuit to Continuwuity?$q$, $q$Yes, it's designed as a drop-in replacement — migration is generally just changing the container image name.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$Self-hosted Matrix homeserver$q$, $q$Run your own federated Matrix chat server with active upstream maintenance.$q$, $q$Self-hosters and Matrix communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$conduwuit migration$q$, $q$Move an existing conduwuit deployment to an actively maintained continuation.$q$, $q$Existing conduwuit administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Continuwuity is a Matrix homeserver written in Rust, positioned as the official community-driven continuation of the conduwuit project, which was itself a hard fork of the original Conduit homeserver. It was started in 2025 after conduwuit was abandoned by its maintainers, to keep that codebase alive with ongoing releases.$q$, $q$The project is open source and community-maintained, hosted across Forgejo, Codeberg, and GitHub mirrors, with a stated goal of a new release roughly every one to two weeks. Existing conduwuit users can migrate by simply changing the container image name in their deployment, since Continuwuity aims to stay a drop-in replacement.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Continuwuity is aimed at self-hosters running (or considering) a Matrix homeserver who want an actively maintained option, including existing conduwuit users whose original project stopped receiving updates.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35d633ed-e78a-443f-ae86-ab29e7bc10d2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── GlobaLeaks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source software framework for running a secure, anonymous whistleblowing submission platform.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$Italy$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GlobaLeaks is free, open-source software for running a secure, anonymous whistleblowing platform, developed by the Hermes Center since 2011.$q$,
  og_description = $q$GlobaLeaks is free, open-source software for running a secure, anonymous whistleblowing platform, developed by the Hermes Center since 2011.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3573cac7-ce24-4055-bf17-e0ce515e92a5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3573cac7-ce24-4055-bf17-e0ce515e92a5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Anonymous submission channel$q$, $q$Lets whistleblowers submit reports without revealing their identity.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Customizable intake framework$q$, $q$Organizations configure their own forms, workflows, and questionnaires.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Multilingual support$q$, $q$Available in over 70 languages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Regulatory-oriented design$q$, $q$Built with EU Whistleblowing Directive, ISO 37002, and GDPR considerations in mind.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Self-hosted deployment$q$, $q$Organizations run their own instance rather than relying on a third-party host.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Free, open-source, and self-hostable under the AGPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Purpose-built for anonymity and whistleblower protection, not a repurposed general form tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Widely translated (70+ languages)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Long track record — actively developed since 2011$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Requires self-hosting and ongoing security/administration responsibility, which matters for a tool handling sensitive disclosures$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$As a compliance-adjacent tool, correct configuration for legal requirements in your jurisdiction is the operator's responsibility$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Community/NGO-backed project rather than a commercial vendor with formal SLAs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Is GlobaLeaks free?$q$, $q$Yes, GlobaLeaks is free, open-source software under the AGPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Who maintains GlobaLeaks?$q$, $q$It's developed by the Hermes Center for Transparency and Digital Human Rights, an Italian NGO.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Does GlobaLeaks help with whistleblower law compliance?$q$, $q$It's designed with frameworks such as the EU Whistleblowing Directive, ISO 37002, and GDPR in mind, though correct configuration for a specific jurisdiction is up to the operator.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Corporate whistleblower channel$q$, $q$Run an internal reporting channel to meet whistleblower-protection regulations.$q$, $q$Companies and public agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$Investigative journalism tip line$q$, $q$Offer sources a secure, anonymous way to submit leaks or documents.$q$, $q$Media organizations and journalists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GlobaLeaks is free, open-source software, licensed under the GNU Affero General Public License v3, that lets organizations run their own secure and anonymous whistleblowing platform. The software project began in 2010–2011 and is developed by the Hermes Center for Transparency and Digital Human Rights, an Italian digital-rights NGO.$q$, $q$It's built as a customizable framework rather than a single fixed product: organizations self-host their own instance and configure intake forms, workflows, and anonymity protections for reporters. GlobaLeaks supports over 70 languages and is designed with compliance considerations for standards such as the EU Whistleblowing Directive (2019/1937), ISO 37002, and GDPR.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GlobaLeaks is used by media organizations, activist and civil-society groups, public agencies, and corporations that need to operate a secure channel for anonymous reports or whistleblower disclosures, particularly where legal whistleblower-protection compliance is required.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3573cac7-ce24-4055-bf17-e0ce515e92a5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GNUnet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GNU project's peer-to-peer networking framework for building secure, decentralized, privacy-preserving applications.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GNUnet is a free, open-source GNU project networking framework for building secure, decentralized, privacy-preserving peer-to-peer applications.$q$,
  og_description = $q$GNUnet is a free, open-source GNU project networking framework for building secure, decentralized, privacy-preserving peer-to-peer applications.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '685a2454-07f3-45db-9fc9-03a9a78f0a9b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '685a2454-07f3-45db-9fc9-03a9a78f0a9b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Decentralized peer-to-peer architecture$q$, $q$Self-organizing network with no central point of control.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Metadata-preserving routing$q$, $q$Designed to protect sender/receiver identity and communication patterns, not just message content.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Encrypted communication channels$q$, $q$Provides building blocks for secure, encrypted networking between peers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Naming and resource discovery services$q$, $q$Includes decentralized naming and addressing components for applications built on top of it.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Free software$q$, $q$Released under the GNU AGPLv3+ license as part of the GNU Project.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Free and open source under the GNU AGPLv3+ license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Long-running research and development history (since 2001) backed by academic contributors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Designed around metadata privacy, not just content encryption$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Fully decentralized with no dependency on central servers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$It's a protocol/framework for developers, not a ready-to-use end-user chat or file-sharing app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Smaller ecosystem and user base than mainstream P2P or messaging networks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Requires technical expertise to deploy and build applications on top of it$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Is GNUnet a chat app?$q$, $q$No — it's a decentralized networking framework/protocol stack that applications (including messaging tools) can be built on top of.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Is GNUnet free?$q$, $q$Yes, it's free software released under the GNU AGPLv3+ license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Who develops GNUnet?$q$, $q$It's a GNU project, with development led by Christian Grothoff and contributors since 2001.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Privacy-preserving application development$q$, $q$Build decentralized applications on top of GNUnet's networking, naming, and encryption primitives.$q$, $q$Developers and researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$Censorship-resistant infrastructure$q$, $q$Use GNUnet's decentralized routing to avoid single points of control or failure.$q$, $q$Privacy and digital-rights technologists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GNUnet is a GNU project providing a network protocol stack for building secure, decentralized, and privacy-preserving applications, licensed under the GNU Affero General Public License v3 (or later). It started in 2001, originally as anonymous, censorship-resistant file sharing, and has since grown into a broader set of building blocks for secure peer-to-peer networking, including resource discovery, naming, and encrypted communication channels.$q$, $q$As a decentralized, self-organizing network, GNUnet has no reliance on central servers. It's primarily a developer framework/protocol stack rather than a polished end-user application — applications are built on top of it rather than GNUnet itself being a single consumer product.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GNUnet is aimed at developers and researchers building privacy-preserving, decentralized applications or protocols, and at technically advanced users interested in running peer-to-peer network infrastructure that protects metadata as well as content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('685a2454-07f3-45db-9fc9-03a9a78f0a9b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Hyphanet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, decentralized peer-to-peer network for censorship-resistant, anonymous publishing and communication.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Hyphanet (formerly Freenet, since 1999) is a free, open-source, decentralized peer-to-peer network for censorship-resistant anonymous publishing.$q$,
  og_description = $q$Hyphanet (formerly Freenet, since 1999) is a free, open-source, decentralized peer-to-peer network for censorship-resistant anonymous publishing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e4e15aa2-1586-4029-bdbb-ccdc26761466';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e4e15aa2-1586-4029-bdbb-ccdc26761466' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Decentralized, serverless network$q$, $q$No central authority or server required to publish or retrieve content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Opennet and darknet modes$q$, $q$Connect to the public network or build friend-to-friend trusted links.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Plugin ecosystem$q$, $q$Plugins add personal websites, forums, microblogging, and file/media sharing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Sneakernet bridging$q$, $q$Supports offline data exchange to bridge isolated network segments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Anonymity by design$q$, $q$Built around anonymous publishing and communication rather than added as an afterthought.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Free and open source with a very long operating history (since 1999)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Fully decentralized — no central servers to seize, block, or shut down$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Supports both public (Opennet) and trusted friend-to-friend (darknet) modes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Actively maintained, with builds released through 2025–2026$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Network performance and content availability depend on peer participation, and can be slower than centralized alternatives$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$The 2023 Freenet/Hyphanet rebrand can cause confusion about which project ('Freenet' or 'Hyphanet') a given resource refers to$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Steeper learning curve than mainstream messaging or publishing tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Is Hyphanet the same as Freenet?$q$, $q$Hyphanet is the continuation of the original Freenet codebase (started in 1999), rebranded in 2023 after the Freenet name and organization moved to a separate, newer project.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Is Hyphanet free?$q$, $q$Yes, it's free, open-source software.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Does Hyphanet require central servers?$q$, $q$No, it's a fully decentralized peer-to-peer network.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Censorship-resistant publishing$q$, $q$Publish freesites, forums, or files that remain accessible even if individual peers go offline.$q$, $q$Activists, journalists, and privacy-focused publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$Anonymous communication under surveillance$q$, $q$Communicate and share information without relying on centralized, blockable infrastructure.$q$, $q$Users in high-censorship or high-surveillance environments$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Hyphanet is the continuation of the original Freenet project, which began as Ian Clarke's student project at the University of Edinburgh in 1999 and grew into one of the earliest anonymous, censorship-resistant peer-to-peer publishing networks. In 2023, the original Freenet codebase was spun off under the name Hyphanet, maintained by its existing team, while the Freenet name and organization moved to a separate, newer project.$q$, $q$Hyphanet is a fully decentralized network with no central servers: users can connect to the public Opennet, build trusted friend-to-friend (darknet) links, or bridge offline via sneakernets. A plugin system enables use cases like personal websites (freesites), forums, microblogging, and file sharing on top of the anonymous network layer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Hyphanet suits people who need censorship-resistant publishing or communication — for example under surveillance or content-blocking conditions — and who are willing to trade convenience and speed for a decentralized, anonymous network with no central point of failure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e4e15aa2-1586-4029-bdbb-ccdc26761466', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Jami ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, peer-to-peer messenger with end-to-end encrypted chat, audio, and video calls and no central server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Jami is a free, open-source, peer-to-peer messenger with end-to-end encrypted chat, voice, and video calls across Linux, Windows, macOS, Android, and iOS.$q$,
  og_description = $q$Jami is a free, open-source, peer-to-peer messenger with end-to-end encrypted chat, voice, and video calls across Linux, Windows, macOS, Android, and iOS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '23bab05b-2293-4f46-a717-4934ba3b60c5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '23bab05b-2293-4f46-a717-4934ba3b60c5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Peer-to-peer architecture$q$, $q$Messages and calls travel directly between devices instead of routing through a company-run server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$End-to-end encryption$q$, $q$Communications are protected with end-to-end encryption and perfect forward secrecy, using X.509-based key management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Multi-device accounts$q$, $q$A single Jami account can be linked across multiple devices without a central account server.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Audio, video, and group calls$q$, $q$Supports one-to-one and group voice/video calls, screen sharing, and media streaming.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Plugin platform and SIP support$q$, $q$Extend Jami with plugins, or use it as a SIP client to interoperate with existing telephony systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Cross-platform clients$q$, $q$Official clients are available for Linux, Windows, macOS, Android, Android TV, and iOS.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Completely free with no ads, subscriptions, or feature limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$No mandatory central server to maintain since it runs peer-to-peer$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Strong end-to-end encryption with perfect forward secrecy$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$GNU GPLv3 licensed and backed by the Free Software Foundation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Accounts can be created without handing over personal information$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Peer-to-peer connectivity can be harder to establish behind strict NATs or corporate firewalls$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Smaller user base than mainstream messaging apps, so fewer contacts are already on it$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Directory-style enterprise management requires self-managed infrastructure (e.g., your own account manager or TURN server)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Is Jami free to use?$q$, $q$Yes. Jami is completely free, open source under GPLv3, and has no ads or paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Does Jami require a server?$q$, $q$No central server is required for messaging or calls since Jami is peer-to-peer by design. Organizations can optionally self-host components like an account manager, name server, or TURN server for NAT traversal.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$What platforms does Jami support?$q$, $q$Official clients exist for Linux, Windows, macOS, Android, Android TV, and iOS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Can I do group video calls in Jami?$q$, $q$Yes, Jami supports group audio and video calls along with screen sharing.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Who maintains Jami?$q$, $q$Jami is developed by Savoir-faire Linux as a GNU project and is licensed under GPLv3 or later.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Privacy-first team communication$q$, $q$Distributed teams that want encrypted messaging and calls without routing traffic through a third-party company server.$q$, $q$Privacy-focused teams and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$Personal secure messaging$q$, $q$Individuals who want end-to-end encrypted chat and calls with contacts, without creating an account tied to personal data.$q$, $q$Privacy-conscious individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Jami is a free/libre, end-to-end encrypted communication platform distributed as a GNU project and developed by Savoir-faire Linux. Unlike most chat apps, Jami is built on a fully peer-to-peer architecture: messages, calls, and file transfers travel directly between devices rather than through a company-run server, and accounts can be created without providing any personal information.$q$, $q$The platform covers instant messaging, one-to-one and group audio/video calls, screen sharing, media streaming, and audio/video message recording, all protected by end-to-end encryption with perfect forward secrecy and X.509-based key management. Jami also supports linking multiple devices to a single account, an extension/plugin system, and SIP compatibility for interoperating with traditional telephony systems.$q$, $q$Jami is licensed under the GNU GPLv3 or later and received the Free Software Foundation's Social Benefit Award in 2023.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Jami suits privacy-conscious individuals and organizations that want encrypted messaging and calling without depending on a third-party server, as well as developers who want to build on top of the Jami daemon or its plugin API for custom communication tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23bab05b-2293-4f46-a717-4934ba3b60c5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Live Helper Chat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source live chat and helpdesk software you can self-host for free, with optional AI bots, voice, video, and screen sharing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Live Helper Chat is a free, open-source live chat and helpdesk platform you can self-host, with AI chatbot integrations, voice/video, and mobile apps.$q$,
  og_description = $q$Live Helper Chat is a free, open-source live chat and helpdesk platform you can self-host, with AI chatbot integrations, voice/video, and mobile apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '593f4d82-8400-4cbe-bca8-aa39046b2d53';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '593f4d82-8400-4cbe-bca8-aa39046b2d53' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Multi-channel support$q$, $q$Handle live chat, voice, video calls, and screen sharing from a single operator interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$AI chatbot integrations$q$, $q$Connects to OpenAI ChatGPT, Rasa, Ollama, and Gemini for automated conversation handling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Mobile apps$q$, $q$Native iOS and Android apps let operators respond to visitors on the go.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Unlimited operators and departments$q$, $q$The self-hosted edition supports unlimited operators, chats, and departments at no license cost.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Proactive engagement tools$q$, $q$Includes proactive chat invitations and operator-to-operator messaging.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Visitor tracking$q$, $q$Tracks visitor activity and supports screenshot capture and file uploads during conversations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Self-hosted edition is free and open source with enterprise-level features included$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Full ownership of chat data and infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Built-in AI chatbot integrations across multiple providers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Native mobile apps for operators$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Actively developed with WordPress-compatible installation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Self-hosting requires managing a PHP/MySQL stack (and optionally Elasticsearch, S3, and Node.js for enterprise features)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Interface is less polished than modern SaaS live-chat competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Cloud-hosted pricing is not published upfront and requires contacting the vendor$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Is Live Helper Chat free?$q$, $q$Yes, the self-hosted, open-source version is free to download and use, including features often reserved for paid tiers elsewhere.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Can I use Live Helper Chat without hosting it myself?$q$, $q$Yes, Live Helper Chat also offers a cloud-hosted option where the vendor manages the installation for you.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$What does Live Helper Chat require to self-host?$q$, $q$A standard PHP and MySQL hosting environment; some enterprise features additionally use Elasticsearch, Amazon S3, or Node.js.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Does Live Helper Chat support AI chatbots?$q$, $q$Yes, it integrates with OpenAI ChatGPT, Rasa, Ollama, and Gemini.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Are there mobile apps for operators?$q$, $q$Yes, Live Helper Chat provides iOS and Android apps.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Self-hosted customer support$q$, $q$Support teams that want a free, full-featured live chat platform with complete control over their data.$q$, $q$Support and customer service teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$AI-assisted chat support$q$, $q$Teams that want to combine human operators with AI chatbots (ChatGPT, Ollama, Gemini, Rasa) for first-line responses.$q$, $q$Businesses adding automation to support workflows$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$Self-hosted, no license fee$q$, $q$["Unlimited operators, chats, and departments","Voice, video, and screen sharing","AI chatbot integrations","Mobile apps for operators"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$Cloud Hosted$q$, $q$Contact for pricing$q$, NULL, $q$["Vendor-managed hosting","Same core feature set as self-hosted edition"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Live Helper Chat is an open-source live support platform for real-time customer communication, covering chat, voice, video, and screen sharing. It runs on PHP and MySQL, can be installed on standard web hosting, and the project states that enterprise-level features are free to use in the self-hosted edition, including unlimited operators, chats, and departments.$q$, $q$The platform integrates with AI services including OpenAI's ChatGPT, Rasa, Ollama, and Gemini for chatbot automation, and offers operator-to-operator chat, proactive visitor invitations, visitor tracking, screenshot capture, and file uploads. Optional enterprise-grade features (such as advanced search and scaling) can use Elasticsearch, Amazon S3, and Node.js.$q$, $q$In addition to the self-hosted, free-to-download software, Live Helper Chat offers a cloud-hosted option where the company runs the installation for customers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Live Helper Chat fits support teams and businesses that want a full-featured live chat platform without per-agent SaaS fees, and are comfortable self-hosting a PHP/MySQL application, or that prefer letting the vendor host it for them.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('593f4d82-8400-4cbe-bca8-aa39046b2d53', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mumble ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, low-latency voice chat application with strong encryption, popular for gaming and community voice servers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mumble is a free, open-source, low-latency voice chat app with TLS encryption and positional audio, self-hosted via the Murmur server.$q$,
  og_description = $q$Mumble is a free, open-source, low-latency voice chat app with TLS encryption and positional audio, self-hosted via the Murmur server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Low-latency voice$q$, $q$Uses the Opus codec with a custom protocol to achieve round-trip latency as low as 10-30 milliseconds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$TLS encryption$q$, $q$Voice traffic is encrypted end-to-end between client and server using TLS.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Positional audio$q$, $q$Supports in-game positional audio for a number of games, so voice volume/direction matches in-game position.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Granular permissions$q$, $q$A detailed channel and ACL permission system lets server admins control access down to individual channels and actions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Text chat and channel hierarchy$q$, $q$Includes built-in text chat alongside voice, organized into a channel hierarchy.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Official Docker image$q$, $q$The Murmur server can be deployed quickly using the official mumble-voip/mumble-docker image.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Extremely low voice latency compared to most alternatives$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Free and open source with no subscription or usage caps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Fine-grained channel and permission controls for server admins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Long track record of stability in gaming and community use$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Full data control since you run your own server$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Client interface feels dated compared to modern chat apps like Discord$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$No official first-party mobile client (only community-built apps)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Text chat and community features are minimal compared to full chat platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Requires running and maintaining your own Murmur server$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Is Mumble free?$q$, $q$Yes, both the Mumble client and the Murmur server are free and open source under GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Can I self-host Mumble?$q$, $q$Yes, the Murmur server is designed to be self-hosted, including via an official Docker image.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$What platforms does Mumble support?$q$, $q$Official clients are available for Windows, Linux, and macOS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Is there a Mumble mobile app?$q$, $q$There is no official Mumble mobile client from the core project; mobile access relies on community-built apps.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$How does Mumble compare to Discord for voice quality?$q$, $q$Mumble is specifically engineered for very low latency voice, which is a key reason gaming communities have used it for over a decade, though it lacks Discord's broader social/chat feature set.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Gaming community voice chat$q$, $q$Communities that need reliable, low-latency, positional voice chat for multiplayer gaming.$q$, $q$Gaming clans and communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$Self-hosted team voice server$q$, $q$Organizations wanting a private, encrypted voice server they fully control instead of a third-party SaaS platform.$q$, $q$Privacy-conscious teams and organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mumble is a free, open-source, low-latency, high-quality voice chat application. It uses the Opus codec together with a custom low-latency protocol capable of round-trip times as low as 10-30 milliseconds, and adds TLS encryption, positional audio for supported games, and a granular channel and ACL-based permission system for server administrators.$q$, $q$The server component, Murmur, is self-hosted: administrators run it on their own hardware or a VPS, with an official Docker image available for quick deployment. Both the client and server are free and open source under GPLv3, with no subscriptions, usage caps, or proprietary lock-in — the only cost is whatever hosting you choose to run it on.$q$, $q$Official clients are available for Windows, Linux, and macOS; the server can run on essentially anything that supports Qt.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mumble is a strong fit for gaming communities that need low-latency, positional voice chat, and for privacy-conscious groups or organizations that want to self-host their own voice server instead of relying on a third-party platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a9d5ebe-d9e7-415b-9e53-fcb76b4b4208', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── One Time Secret ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Share sensitive information via self-destructing, one-time-view links, with an open-source self-hosted option and a free plan.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Onetime Secret lets you share sensitive info via self-destructing, one-time-view links, with a free plan, REST API, and open-source self-hosting.$q$,
  og_description = $q$Onetime Secret lets you share sensitive info via self-destructing, one-time-view links, with a free plan, REST API, and open-source self-hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d593e07-ef39-4892-8798-7b56252691bd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d593e07-ef39-4892-8798-7b56252691bd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$One-time viewable links$q$, $q$Secrets automatically self-destruct after being viewed once, or after a configurable expiration period.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Passphrase protection$q$, $q$Add an optional passphrase for an additional layer of security on a shared secret.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Server-side encryption$q$, $q$Secrets are encrypted server-side to protect data at rest.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Custom domains$q$, $q$The Identity Plus plan supports unlimited custom domains and custom branding for a white-labeled experience.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$REST API$q$, $q$Create and retrieve secrets programmatically via the REST API, available even on the free Basic plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Open-source self-hosting$q$, $q$The full codebase is open source, letting teams run their own instance instead of using the hosted service.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Focused, simple tool that solves a specific security problem well$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Open source and self-hostable for teams that want full control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Free Basic plan includes REST API access$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Reduces sensitive data lingering permanently in chat or email history$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Free plan is limited to one custom domain and a maximum 14-day expiration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Identity Plus paid plan is priced in EUR (€35/month) on the published pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Not a full password manager — designed only for single-use, short-lived sharing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Is Onetime Secret free?$q$, $q$Yes, there is a free 'Basic' plan (€0/month) with core secret-sharing features and REST API access; a paid 'Identity Plus' plan (€35/month) adds custom branding, unlimited domains, and longer expirations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$What happens after a secret is viewed?$q$, $q$The secret is automatically destroyed after being viewed once, or after its configured expiration period passes, whichever comes first.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Can I self-host Onetime Secret?$q$, $q$Yes, the project is open source and can be self-hosted instead of using the hosted service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Is there an API?$q$, $q$Yes, a REST API is available for creating and retrieving secrets programmatically, on both free and paid plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$What's the difference between the free and paid plans?$q$, $q$The free Basic plan supports one custom domain and expirations up to 14 days; the paid Identity Plus plan adds unlimited domains, custom branding, expirations up to 30 days, and unlimited team members.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Sharing credentials securely$q$, $q$Sending passwords, API keys, or tokens between team members without leaving them in permanent chat/email history.$q$, $q$IT and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Support and onboarding handoffs$q$, $q$Sending temporary access details to customers or new hires via a link that expires after one view.$q$, $q$Support and IT operations teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Basic$q$, $q$€0/month$q$, $q$Monthly$q$, $q$["One custom domain","Automatic destruction after viewing","Expiration up to 14 days","Email links to recipients","REST API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$Identity Plus$q$, $q$€35/month$q$, $q$Monthly$q$, $q$["Unlimited domains","Custom branding","Expiration up to 30 days","Unlimited members","Homepage access controls and Incoming Secrets"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Onetime Secret is a service for securely sharing sensitive information through links that self-destruct after being viewed once or after a set expiration period. Secrets are protected with server-side encryption and can optionally require a passphrase for an extra layer of protection, with configurable expiration windows.$q$, $q$The codebase is open source and can be self-hosted, and the service also offers a hosted version with a free 'Basic' plan and a paid 'Identity Plus' plan that adds custom domains, branding, longer expiration windows, and team member access. Secrets can be created and retrieved either through the web interface or the REST API, which is available on all plans including the free one.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Onetime Secret suits IT, security, and support teams that need to send passwords, API keys, or other sensitive details without leaving them permanently in chat logs or email inboxes, whether they prefer to self-host or use the free hosted plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d593e07-ef39-4892-8798-7b56252691bd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OTS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted one-time secret sharing tool with client-side AES-256 encryption so the server never sees your data.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OTS (Luzifer/ots) is a free, open-source one-time secret sharing tool with client-side AES-256 encryption and a self-hostable server.$q$,
  og_description = $q$OTS (Luzifer/ots) is a free, open-source one-time secret sharing tool with client-side AES-256 encryption and a self-hostable server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c4d14d8f-274a-43ad-92f6-8e61529bc76c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c4d14d8f-274a-43ad-92f6-8e61529bc76c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Client-side AES-256 encryption$q$, $q$Secrets are encrypted in the browser before being sent, so the server never has access to the plaintext.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$One-time read then deletion$q$, $q$Each secret is permanently deleted immediately after it is retrieved once.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Pluggable storage backends$q$, $q$Supports an in-memory backend for testing and Redis for persistent production deployments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Command-line client$q$, $q$Includes a CLI tool for creating and retrieving secrets, useful for scripting and automation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Free public instance$q$, $q$A hosted instance at ots.fyi is available for anyone who doesn't want to self-host.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Apache-2.0 licensed$q$, $q$The project is fully open source, allowing self-hosting and modification.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Zero-knowledge design — the server never sees your unencrypted secret$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Lightweight and simple to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Free public hosted instance available with no signup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$CLI support makes it easy to integrate into scripts and pipelines$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Fewer polish features than larger competitors (no custom domains or team accounts)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Production deployments depend on Redis for persistent storage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Public-facing documentation on the site itself is minimal$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Is OTS free?$q$, $q$Yes, OTS is free and open source under the Apache-2.0 license, and the public instance at ots.fyi is free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$How is my secret encrypted?$q$, $q$Secrets are encrypted with symmetric 256-bit AES directly in the browser before being sent, so the server only ever stores encrypted data.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Can I self-host OTS?$q$, $q$Yes, the source is available on GitHub (Luzifer/ots) and supports in-memory or Redis-backed storage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Is there a public instance I can use without installing anything?$q$, $q$Yes, ots.fyi is a free public hosted instance of the software.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Is there a CLI?$q$, $q$Yes, OTS includes a command-line client for creating and retrieving secrets.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Developer secret sharing$q$, $q$Sharing API keys, tokens, or credentials with teammates via a disposable, zero-knowledge link.$q$, $q$Developers and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$Lightweight self-hosted deployment$q$, $q$System administrators who want a minimal, self-hosted alternative to larger secret-sharing platforms.$q$, $q$Sysadmins and self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OTS (One-Time-Secret, developed as Luzifer/ots) is an open-source secret-sharing platform that encrypts secrets with symmetric 256-bit AES encryption directly in the browser before they ever reach the server. The server only ever stores the encrypted blob and a unique identifier, never the plaintext or the passphrase, and the secret is permanently deleted after it is read once.$q$, $q$The project supports pluggable storage backends, including an in-memory option for testing and Redis for persistent production use, and ships with a command-line client for creating and retrieving secrets from scripts. It is released under the Apache-2.0 license, and a free public instance is available to use without installing anything at ots.fyi.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OTS is aimed at developers and system administrators who want a lightweight, zero-knowledge, self-hostable alternative for sharing secrets, especially those who value CLI/scripting support over a feature-rich hosted product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4d14d8f-274a-43ad-92f6-8e61529bc76c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── RetroShare ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, encrypted peer-to-peer platform for private chat, mail, file sharing, forums, and channels between trusted friends.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$RetroShare is a free, open-source, encrypted peer-to-peer platform for private chat, mail, file sharing, forums, and channels between friends.$q$,
  og_description = $q$RetroShare is a free, open-source, encrypted peer-to-peer platform for private chat, mail, file sharing, forums, and channels between friends.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '456fbc5c-1126-4664-96da-4a376804c0f8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '456fbc5c-1126-4664-96da-4a376804c0f8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Friend-to-friend encrypted network$q$, $q$Connects directly to trusted contacts' nodes using PGP authentication and TLS with Perfect Forward Secrecy — no central server involved.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Encrypted chat and mail$q$, $q$Includes private and group chat, plus asynchronous mail that is relayed and stored on friends' nodes while you're offline.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Decentralized file sharing$q$, $q$BitTorrent-like swarming file sharing with anonymous tunnels that protect privacy beyond your direct friends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Forums, channels, and boards$q$, $q$Distributed discussion forums, subscribable file-sharing channels, and boards for sharing pictures and links with voting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Optional Tor/I2P routing$q$, $q$Can route traffic through Tor or I2P to hide your IP address even from your own friend nodes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Experimental VoIP/video calling$q$, $q$Supports experimental voice and video calls over the same encrypted network.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Fully decentralized with no central server or company controlling the network$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Strong privacy model via PGP authentication and optional Tor/I2P routing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$No ads, fees, or terms of service$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Combines chat, mail, file sharing, and forums in a single application$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Friend-to-friend model means reach is limited to people you're directly or indirectly connected to$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$VoIP/video calling is explicitly experimental$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$More technical setup than mainstream chat apps, with a smaller user base$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$No official iOS client$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Is RetroShare free?$q$, $q$Yes, RetroShare is completely free and open source, with no ads, fees, or hidden costs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$How does the friend-to-friend network work?$q$, $q$You add trusted contacts as 'friends' using PGP key exchange, and your node connects directly to theirs; data can also relay through mutual friends depending on the feature.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Does RetroShare support Tor or I2P?$q$, $q$Yes, RetroShare can optionally route connections through Tor or I2P to hide a user's IP address, even from their own friends.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$What platforms does RetroShare support?$q$, $q$RetroShare is available for Windows, macOS, Linux, and Android.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Can I use RetroShare for file sharing?$q$, $q$Yes, it supports decentralized, swarming file sharing along with anonymous tunnels for extended privacy.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Decentralized community collaboration$q$, $q$Privacy-focused communities exchanging files, forum posts, and messages without a central server.$q$, $q$Privacy-focused online communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$Encrypted personal communication$q$, $q$Individuals wanting encrypted chat and mail resistant to centralized surveillance or shutdown.$q$, $q$Privacy-conscious individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RetroShare is a decentralized communication platform built around a Friend-to-Friend (F2F) network: users connect their own nodes directly to trusted contacts to exchange data without any central server or corporate infrastructure in between. Authentication uses PGP keys combined with TLS encryption and Perfect Forward Secrecy, and the network runs over TCP, UDP, UPnP/NAT-PMP, with optional DHT discovery.$q$, $q$On top of encrypted chat (including group chat rooms) and asynchronous mail that gets stored on friends' nodes while a recipient is offline, RetroShare provides decentralized, BitTorrent-style file sharing with anonymous tunnels that extend privacy beyond direct friends, plus distributed forums, subscribable channels for publishing files, and boards for sharing pictures and links with voting. Experimental VoIP and video calling are also included.$q$, $q$For added anonymity, RetroShare can optionally route traffic through Tor or I2P to hide a user's IP address even from their own friend nodes. It is free and open-source software, with no ads, hidden costs, or terms of service, and does not generate revenue for its developers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$RetroShare fits privacy-focused individuals and communities that want decentralized, encrypted communication and file sharing without depending on any central server or company, and who are comfortable with a more technical, trust-based network model.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('456fbc5c-1126-4664-96da-4a376804c0f8', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── SAMA ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted chat server for building real-time messaging into mobile and web apps, with clustering built in.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SAMA is an open-source, self-hosted chat server with React and Flutter clients for adding real-time messaging to mobile and web apps.$q$,
  og_description = $q$SAMA is an open-source, self-hosted chat server with React and Flutter clients for adding real-time messaging to mobile and web apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fb62ae2f-72bd-4969-b944-dde6d7d56470';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fb62ae2f-72bd-4969-b944-dde6d7d56470' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Real-time messaging$q$, $q$Supports real-time chat with rich media attachments, powered by a uWebSockets.js-based server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Group chats and user management$q$, $q$Built-in support for group conversations and user account management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Multi-device sync$q$, $q$Keeps conversations in sync across multiple devices for the same user.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Push notifications$q$, $q$Delivers push notifications to keep mobile users informed of new messages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Built-in clustering$q$, $q$Includes clustering support out of the box for scaling and high availability.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Official web and mobile clients$q$, $q$Ships with a React client for web apps and a Flutter client for mobile apps, maintained by the same organization.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Fully open source and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Ready-made React (web) and Flutter (mobile) clients reduce integration work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Clustering built in for scaling without extra tooling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Free to self-host with no per-seat licensing cost$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Public cloud sandbox available for quick evaluation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Primarily a developer toolkit rather than a ready-to-use end-user chat app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Requires engineering effort to deploy, secure, and customize for production$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Smaller community and ecosystem than established commercial chat SDKs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Is SAMA free?$q$, $q$Yes, SAMA is open source and free to self-host; a public cloud sandbox is also available for testing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Can I try SAMA without installing it?$q$, $q$Yes, the SAMA stack can be tested via the public cloud sandbox at app.samacloud.io.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$What clients does SAMA provide?$q$, $q$SAMA offers an official React web client and a Flutter mobile client, both maintained by SAMA-Communications.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Is SAMA suitable for production use?$q$, $q$SAMA includes production-oriented features like clustering and push notifications, but as with any self-hosted infrastructure, deployment and security hardening are the responsibility of the operator.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Where is SAMA's source code?$q$, $q$It is hosted on GitHub under the SAMA-Communications organization, including the sama-server, sama-client, and sama-client-flutter repositories.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Embedded chat for apps$q$, $q$Adding real-time chat to an existing mobile or web product without depending on a third-party hosted chat API.$q$, $q$Developers and product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$Self-hosted chat infrastructure$q$, $q$Startups or companies that want to avoid per-seat or per-message pricing from hosted chat SDKs.$q$, $q$Startups and engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SAMA is an open-source chat server maintained by the SAMA-Communications organization, designed for developers who want to add real-time messaging to their own mobile or web applications instead of building chat infrastructure from scratch. The core server (sama-server) is built on uWebSockets.js, and the project also provides an official React client for the web and a Flutter client for mobile apps.$q$, $q$SAMA supports real-time messaging with rich media, group chats, multi-device sync, push notifications, and built-in clustering for scalability and high availability, alongside developer APIs and SDKs for integration. A public cloud sandbox at app.samacloud.io lets developers try the full stack before self-hosting it themselves.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SAMA is aimed at developers and product teams building chat features into their own mobile or web products who want a self-hosted, open-source alternative to hosted chat APIs like Stream or Sendbird.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb62ae2f-72bd-4969-b944-dde6d7d56470', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Screego ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted screen sharing server for developers, built on WebRTC with a built-in TURN server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Screego is a free, open-source, self-hosted WebRTC screen sharing server for developers, deployable as a single binary or via Docker.$q$,
  og_description = $q$Screego is a free, open-source, self-hosted WebRTC screen sharing server for developers, deployable as a single binary or via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eac79351-70e4-48de-8016-9c64aff91049';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eac79351-70e4-48de-8016-9c64aff91049' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Multi-user screen sharing$q$, $q$An SFU-based architecture lets multiple viewers watch the same shared screen without server-side re-encoding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$WebRTC with encryption$q$, $q$Screen sharing traffic is transported over WebRTC, secured with DTLS for key negotiation and SRTP for media encryption.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Built-in TURN server$q$, $q$Includes its own TURN server so connections can traverse NATs and firewalls without extra infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Single-binary or Docker deployment$q$, $q$Deploys as a single Go binary with no dependencies, or via Docker in under a minute.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Low latency, high resolution$q$, $q$Designed for good quality, low-latency screen sharing suitable for technical work like code review.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Open source$q$, $q$Released under the GPL-3.0 license with an actively developed GitHub repository.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Extremely simple to self-host as a single binary or Docker container$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$No dependency on a third-party screen-sharing service$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Free and open source with no usage limits$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Efficient SFU routing keeps server CPU load low even with multiple viewers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$No built-in persistent text chat or room history$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Requires exposing your own server (and TURN port range) to the internet for remote use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Fewer collaboration features than commercial tools like Zoom or Microsoft Teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Is Screego free?$q$, $q$Yes, Screego is free and open source under the GPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$How do I deploy Screego?$q$, $q$You can run it as a single compiled Go binary or deploy it with Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Does Screego need a separate TURN server?$q$, $q$No, Screego includes its own built-in TURN server for NAT traversal.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Can multiple people view a shared screen at once?$q$, $q$Yes, Screego uses an SFU architecture that supports multiple concurrent viewers efficiently.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$What license is Screego released under?$q$, $q$Screego is released under the GPL-3.0 open-source license.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Developer screen sharing$q$, $q$Teams that want quick, self-hosted screen sharing for pair programming or remote debugging.$q$, $q$Developer and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$Privacy-conscious support tooling$q$, $q$Organizations avoiding third-party screen-share SaaS tools for data-sensitive support sessions.$q$, $q$IT and support teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Screego (screego/server) is an open-source, self-hosted screen sharing tool built for developers who want good quality, low-latency screen sharing without a third-party SaaS tool. It's written in Go, compiles to a single dependency-free binary, and can also be deployed via Docker in under a minute.$q$, $q$The server supports multiple concurrent viewers through an SFU (Selective Forwarding Unit) architecture that routes video streams without re-encoding, preserving quality while keeping CPU overhead low. Media is transported over WebRTC, secured with DTLS for key negotiation and SRTP for encrypting the stream, and Screego includes its own built-in TURN server for NAT traversal. The project is released under the GPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Screego suits developer and engineering teams that want a quick, self-hosted way to share screens — for pair programming, remote debugging, or support — without relying on a third-party screen-sharing service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eac79351-70e4-48de-8016-9c64aff91049', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Spectrum 2 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted XMPP transport/gateway that lets an XMPP server bridge conversations to other messaging networks such as IRC.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Spectrum 2 is a free, open-source, self-hosted XMPP transport/gateway that bridges XMPP servers to other chat networks like IRC.$q$,
  og_description = $q$Spectrum 2 is a free, open-source, self-hosted XMPP transport/gateway that bridges XMPP servers to other chat networks like IRC.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c2a0403-bded-465c-89d4-44577324f0fc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c2a0403-bded-465c-89d4-44577324f0fc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$XMPP transport architecture$q$, $q$Runs as a gateway alongside an existing XMPP server to bridge conversations to other networks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$IRC bridging$q$, $q$Connects XMPP users with IRC networks and channels.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$C++/Swiften backend$q$, $q$Built on the Swiften XMPP library for performance and protocol compliance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Self-hosted deployment$q$, $q$Runs entirely on infrastructure you control, alongside your own XMPP server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Per-network backend modules$q$, $q$Individual backend modules handle the protocol translation for each supported network.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$GPLv2+ open source license$q$, $q$Source code is publicly available and modifiable under the GPLv2 or later license.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Lets XMPP administrators federate with other networks without switching platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Fully self-hosted, giving admins full control over the gateway$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Modular backend design per network$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Most of the proprietary networks it was originally built to bridge (AIM, MSN, Yahoo, ICQ) have since shut down, narrowing today's practical use mostly to IRC$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Development has slowed, with the latest tagged release dating to 2023$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Requires XMPP server administration knowledge to deploy and configure$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Niche use case compared to modern chat platforms$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Is Spectrum 2 still usable today?$q$, $q$Yes, it still runs, but many of the legacy proprietary IM networks it was built to bridge have since shut down, so its remaining practical use is mainly bridging XMPP to networks like IRC.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$What networks can Spectrum 2 bridge to?$q$, $q$It was designed to bridge XMPP to networks including IRC, and historically to now-defunct networks like ICQ, AIM, MSN, Yahoo, and Facebook chat.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Is Spectrum 2 free?$q$, $q$Yes, it's free and open source under the GPLv2 or later license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Do I need my own XMPP server to use Spectrum 2?$q$, $q$Yes, Spectrum 2 is a transport/gateway that runs alongside an existing XMPP server rather than as a standalone chat app.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Is Spectrum 2 actively maintained?$q$, $q$The project's most recent tagged release was in 2023, indicating slower, maintenance-level development rather than active feature growth.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$XMPP-to-IRC bridging$q$, $q$XMPP server administrators who want their users to be able to chat with people on IRC.$q$, $q$XMPP server administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$Protocol consolidation$q$, $q$Self-hosters wanting to consolidate chat across multiple protocols behind a single XMPP server.$q$, $q$Self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Spectrum 2 is an open-source instant messaging transport/gateway that runs alongside an XMPP server, letting users on that server chat with people on other IM networks. It's written in C++ on top of the Swiften XMPP library, is self-hosted, and is released under the GNU GPLv2 or later.$q$, $q$Historically Spectrum bridged to a wide range of proprietary networks such as ICQ, AIM, MSN, Yahoo, and Facebook chat, in addition to IRC and SIP-based SIMPLE. Many of those proprietary networks have since been shut down by their own operators over the years, so in practice today Spectrum 2's main remaining value is bridging XMPP to networks that are still running, such as IRC. The most recent tagged release (2.2.1) dates back to 2023, so it should be treated as a mature, slow-moving project rather than one under active feature development.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Spectrum 2 is aimed at administrators who already run an XMPP server and want to federate it with other still-active chat networks, particularly IRC, rather than teams looking for a modern, actively developed chat platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2a0403-bded-465c-89d4-44577324f0fc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Stoat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Discord alternative for text, voice, and video chat, with a self-hosted deployment option.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Stoat (formerly Revolt Chat) is a free, open-source Discord alternative with text, voice, and video chat, offering a self-hosted deployment option.$q$,
  og_description = $q$Stoat (formerly Revolt Chat) is a free, open-source Discord alternative with text, voice, and video chat, offering a self-hosted deployment option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4ec9cb7b-3758-48d4-b21c-ca4d6d43754e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4ec9cb7b-3758-48d4-b21c-ca4d6d43754e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Text, voice, and video channels$q$, $q$Community 'servers' organize conversations into text channels alongside voice and video chat.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Moderation tools$q$, $q$Includes moderation capabilities for managing community servers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Self-hosted deployment$q$, $q$An official self-hosted repository lets communities run Stoat entirely on their own infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Hosted service option$q$, $q$Communities that don't want to manage infrastructure can use the hosted stoat.chat service instead.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Multi-platform clients$q$, $q$Clients are available for web, desktop, and mobile.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$No paywalled features$q$, $q$All features are free with no subscription tiers or server boosts, unlike Discord Nitro.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Completely free with no subscription tiers or paywalled features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Open source and self-hostable for full data control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Large existing community carried over from Revolt (600,000+ registered users pre-rebrand)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Actively developed with modern web, desktop, and mobile clients$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Rebrand from Revolt to Stoat (2025) can cause confusion with older links, guides, and integrations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Smaller ecosystem of bots and third-party integrations than Discord$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Self-hosting requires managing and updating your own infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Is Stoat free?$q$, $q$Yes, Stoat is completely free with no subscription tiers, server boosts, or paywalled features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$What happened to Revolt Chat?$q$, $q$Revolt Chat rebranded to Stoat in early 2025 after a trademark dispute over the 'Revolt' name; the project and its user base carried over to the new name.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Can I self-host Stoat?$q$, $q$Yes, an official self-hosted deployment repository is available for running Stoat on your own infrastructure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$What platforms does Stoat support?$q$, $q$Stoat provides clients for web, desktop, and mobile.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Is Stoat open source?$q$, $q$Yes, Stoat is open source, with its backend written in Rust.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Discord alternative for communities$q$, $q$Communities migrating away from Discord for privacy, cost, or philosophical reasons.$q$, $q$Online communities and gaming groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$Self-hosted team chat$q$, $q$Teams wanting a free, self-hosted, ad-free platform for text, voice, and video communication.$q$, $q$Privacy-conscious teams and organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Stoat is an open-source communication platform, built with a Rust backend, organized around community 'servers' with text channels, voice, and video, in the same style as Discord. The project was previously known as Revolt Chat and rebranded to Stoat in early 2025 following a trademark dispute over the 'Revolt' name; all official repositories moved to the 'stoatchat' organization on GitHub as part of the rebrand.$q$, $q$Every feature ships free: there are no subscription tiers, no server boosts, and no paywalled features gating functionality. Communities can either use the hosted service at stoat.chat, or self-host the entire platform on their own infrastructure using the official self-hosted deployment repository, so messages never have to leave servers a community controls. The project carried over its user base from Revolt, which had surpassed 600,000 registered users before the rebrand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Stoat is aimed at communities and teams looking for a free, privacy-respecting, open-source alternative to Discord or Slack, whether they want to use the hosted service or run it entirely on their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ec9cb7b-3758-48d4-b21c-ca4d6d43754e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Tiledesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source AI agent platform for building chatbots and automating customer support across web chat, WhatsApp, and other channels.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted, open source)$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$Milan, Italy$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tiledesk is an open-source AI agent platform for building chatbots and automating customer support, self-hostable via Docker or available as a paid cloud service.$q$,
  og_description = $q$Tiledesk is an open-source AI agent platform for building chatbots and automating customer support, self-hostable via Docker or available as a paid cloud service.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2dc99054-a142-46e9-ba1a-fcacb6132ea9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2dc99054-a142-46e9-ba1a-fcacb6132ea9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Visual Design Studio$q$, $q$A no-code flow builder for designing chatbot logic, decision trees, and automated conversation paths.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Multi-channel deployment$q$, $q$Deploy the same bot or live chat widget across a website, WhatsApp Business, Facebook Messenger, SMS, and email.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Knowledge base & RAG$q$, $q$Upload documents to a knowledge base that AI agents search using hybrid full-text and semantic search to ground their answers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Human handoff$q$, $q$Conversations can be escalated from an AI agent to a live human operator without losing context.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Self-hosted or cloud deployment$q$, $q$Run Tiledesk on your own infrastructure via Docker Compose or Kubernetes, or use the managed cloud service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Open API and integrations$q$, $q$REST APIs and integrations with tools like Shopify, Google Calendar, and Outlook for connecting Tiledesk to existing workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Core platform is open source and can be fully self-hosted at no license cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Supports multiple channels (web, WhatsApp, Messenger, SMS, email) from one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$No-code flow builder makes bot design accessible to non-developers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Can connect to self-hosted or open LLMs for organizations that need to keep data on-premises$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Cloud pricing is steep for small teams — paid plans start around €124-149/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Self-hosting requires Docker/Kubernetes knowledge and ongoing maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$The product has shifted heavily toward AI agent automation, so teams wanting a simple live-chat widget may find the interface more complex than earlier versions$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Is Tiledesk free to use?$q$, $q$The self-hosted version is free and open source under licenses published on GitHub. The managed cloud service is paid, with plans starting after a 14-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Can I self-host Tiledesk?$q$, $q$Yes. Tiledesk provides Docker Compose files and a Helm chart so you can install the server, dashboard, and chatbot engine on your own infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$What channels does Tiledesk support?$q$, $q$Web chat widget, WhatsApp Business, Facebook Messenger, SMS, and email, all managed from the same dashboard.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Do I need to know how to code to build a bot?$q$, $q$No. The Design Studio is a visual, no-code flow builder, though custom logic can also be extended with code where needed.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$E-commerce order support$q$, $q$Automate answers to shipping, returns, and order-status questions while escalating complex cases to a human agent.$q$, $q$Online retailers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$On-premises AI support agent$q$, $q$Self-host Tiledesk and connect it to a local or open LLM to keep customer data off third-party AI APIs.$q$, $q$Regulated or privacy-conscious organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$WhatsApp business automation$q$, $q$Route and automate customer conversations coming in through WhatsApp Business alongside the website widget.$q$, $q$SMBs handling high message volume$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Self-hosted (open source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source code on GitHub","Docker Compose / Helm deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Pro$q$, $q$€149/mo (€124/mo billed yearly)$q$, $q$monthly or yearly$q$, $q$["3 users","20 AI agents","5M AI tokens/month","3,000 conversations/month","300 knowledge base items","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Business$q$, $q$€499/mo (€416/mo billed yearly)$q$, $q$monthly or yearly$q$, $q$["5 users","50 AI agents","10M AI tokens/month","5,000 conversations/month","1,000 knowledge base items","Dedicated support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Unlimited users, agents, tokens and conversations","Enterprise SLA","Dedicated account manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tiledesk started as an open-source live chat platform and has evolved into what it now calls an AI agent platform, positioned as an open-source alternative to tools like Voiceflow, Intercom, and Zendesk. The core server, dashboard, chatbot engine, and web widget are published on GitHub under open-source licenses (a mix of MIT and AGPLv3 depending on the repository) and can be self-hosted using Docker Compose or a Helm chart for Kubernetes.$q$, $q$Beyond self-hosting, Tiledesk also runs a hosted cloud service with paid subscription plans. The platform's visual Design Studio lets teams build automated conversation flows without writing code, route conversations between AI agents and human staff, and connect a knowledge base for retrieval-augmented (RAG) responses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Tiledesk suits support and operations teams that want to automate parts of customer service — e-commerce stores handling order questions, SaaS companies fielding repetitive support tickets, or agencies building white-labeled chat automation for clients. Its self-hosting option also appeals to developers and organizations with data residency requirements who want to connect their own LLMs instead of sending data to third-party AI providers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2dc99054-a142-46e9-ba1a-fcacb6132ea9', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Tox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source peer-to-peer protocol for encrypted messaging, voice/video calls, and file transfer with no central servers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tox is a free, open-source peer-to-peer protocol for encrypted messaging, calls, and file transfer with no central server, used via clients like qTox.$q$,
  og_description = $q$Tox is a free, open-source peer-to-peer protocol for encrypted messaging, calls, and file transfer with no central server, used via clients like qTox.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '86a4e6f7-b835-4bf1-b393-2519995d609a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '86a4e6f7-b835-4bf1-b393-2519995d609a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Peer-to-peer architecture$q$, $q$Messages and calls route directly between users' devices over a distributed network, with no central server storing data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$End-to-end encryption$q$, $q$All communications are encrypted using the NaCl cryptography library; encryption cannot be disabled.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Voice and video calls$q$, $q$Supports one-to-one and group audio/video calls plus screen sharing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$File transfer$q$, $q$Send files directly between contacts without size limits imposed by a server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Multiple independent clients$q$, $q$Several client apps, including qTox, are built on the shared toxcore library, giving users a choice of interface.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$No central server means no company can hand over your message history$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Completely free with no ads, subscriptions, or accounts tied to a phone number$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Supports calls, video, screen sharing, and file transfer, not just text$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Fully open-source protocol and clients$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$As a P2P system, both contacts generally need to be reachable for messages and calls to go through reliably$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Smaller user base than mainstream messengers makes it harder to get contacts onto the network$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$No single official mobile app; support on Android and iOS depends on third-party clients of varying maturity$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Less polished UX than commercial messaging apps$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$What is Tox?$q$, $q$Tox is an open-source, peer-to-peer protocol for encrypted messaging, voice/video calls, and file transfer, developed as a decentralized alternative to Skype.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Do I need to run a server to use Tox?$q$, $q$No. Tox is peer-to-peer — each client connects directly to other users' devices over a distributed network rather than through a central server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Which app do I install to use Tox?$q$, $q$You install a Tox client, such as qTox, which implements the toxcore library and provides the messaging interface.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Is Tox free?$q$, $q$Yes, Tox and its clients are free, open-source software with no cost or advertising.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Private one-to-one messaging$q$, $q$Communicate with contacts without routing messages through a company-operated server.$q$, $q$Privacy-focused individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$Encrypted voice/video calls$q$, $q$Make calls and screen-share directly with contacts using end-to-end encryption.$q$, $q$Journalists, activists, technical users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tox is an open-source protocol for encrypted instant messaging, voice and video calls, screen sharing, and file transfer, built as a peer-to-peer alternative to centralized services like Skype. Development began in mid-2013, prompted by concerns over Skype's ties to government surveillance programs that surfaced around the Edward Snowden leaks. Rather than a single application, Tox is a core library (toxcore) that independent client applications build on, the most widely used being qTox.$q$, $q$Because there's no central server relaying messages, Tox connections happen directly between users' devices over a distributed network, encrypted end-to-end using the NaCl cryptography library.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Tox is aimed at privacy-focused users who want end-to-end encrypted communication without trusting a company's servers with their metadata. Because there's no central server to seize, subpoena, or shut down, it appeals to activists, journalists, and technically inclined users comfortable installing a standalone client rather than using a mainstream messaging app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86a4e6f7-b835-4bf1-b393-2519995d609a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Tuwunel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted Matrix homeserver built for high performance, positioned as the official successor to Conduwuit.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tuwunel is a free, open-source, self-hosted Matrix homeserver built for performance, positioned as the official successor to Conduwuit.$q$,
  og_description = $q$Tuwunel is a free, open-source, self-hosted Matrix homeserver built for performance, positioned as the official successor to Conduwuit.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '345a3674-eba8-4d0e-a817-1203b09a6953';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '345a3674-eba8-4d0e-a817-1203b09a6953' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Matrix protocol compliance$q$, $q$Implements the Matrix client-server and federation APIs, working with standard Matrix clients such as Element.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$High throughput, low resource use$q$, $q$Built for efficient message handling with lower CPU and memory usage compared to Synapse, the original Matrix homeserver implementation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Enterprise authentication$q$, $q$Supports OAuth 2.0, OIDC, LDAP, and JWT for integrating with existing identity systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Matrix RTC support$q$, $q$Supports Matrix's real-time communication extensions for voice and video calls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Drop-in Conduwuit migration$q$, $q$Existing Conduwuit deployments can move to Tuwunel by swapping the binary, without a separate data migration step.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Free, open-source, self-hosted Matrix homeserver$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Significantly lighter on server resources than Synapse in independent benchmarks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Federates with the wider Matrix network, so users aren't locked into a single server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Active development backed by real production deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Requires comfort administering server infrastructure — there's no managed hosting offered by the project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$As a newer project (successor to Conduwuit), it has a shorter track record than Synapse$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Full Matrix specification coverage is still catching up in some areas per its own test-suite reporting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Is Tuwunel free?$q$, $q$Yes, Tuwunel is free, open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$How is Tuwunel different from Synapse?$q$, $q$Tuwunel is a from-scratch, performance-focused Matrix homeserver implementation, whereas Synapse is the original Matrix.org reference server. Tuwunel targets lower resource usage and higher throughput.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Can I migrate from Conduwuit to Tuwunel?$q$, $q$Yes, the project describes it as a binary swap — you update to Tuwunel and point your service at the new executable without a separate data migration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Do I need a Matrix client to use Tuwunel?$q$, $q$Yes, Tuwunel is server software; you connect to it using a standard Matrix client such as Element.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Self-hosted team or community chat$q$, $q$Run your own Matrix server for internal team communication instead of depending on a third-party chat provider.$q$, $q$IT teams, communities, government agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$Federated messaging at scale$q$, $q$Serve large user bases with lower server resource requirements than Synapse.$q$, $q$Organizations replacing or scaling past Synapse$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tuwunel is a Matrix homeserver — the server software that powers decentralized, federated chat on the Matrix protocol used by clients like Element. It's built to be fast and resource-efficient, and it describes itself as the official successor to Conduwuit, continuing that project's development after Conduwuit reached a stable, production-ready state. Migrating from Conduwuit to Tuwunel is designed to be a straightforward binary swap since Tuwunel maintains configuration and database compatibility.$q$, $q$Tuwunel targets production, at-scale deployments: its documentation cites usage serving government infrastructure and notes independent benchmark results showing it outperforming Synapse, the original reference Matrix server, in several test scenarios.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Tuwunel is for system administrators and organizations who want to self-host a Matrix homeserver for team or community chat instead of relying on public Matrix.org infrastructure, particularly those who have outgrown Synapse's resource footprint or need enterprise authentication (OAuth 2.0, OIDC, LDAP, JWT) and Matrix RTC voice/video support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('345a3674-eba8-4d0e-a817-1203b09a6953', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Typebot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Source-available, self-hostable chatbot and conversational form builder with a visual, no-code editor.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$France$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Typebot is a self-hostable, no-code chatbot and conversational form builder with a visual flow editor and a free plan for up to 200 chats/month.$q$,
  og_description = $q$Typebot is a self-hostable, no-code chatbot and conversational form builder with a visual flow editor and a free plan for up to 200 chats/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a1d7d4b6-0a0c-446a-a22f-7046fe96be45';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a1d7d4b6-0a0c-446a-a22f-7046fe96be45' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Visual flow builder$q$, $q$Drag-and-drop editor with 45+ input and logic blocks for building multi-step chatbots and forms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Multi-channel deployment$q$, $q$Embed on a website, use a chat bubble or popup, deploy to WhatsApp, or call flows via HTTP request.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Native integrations$q$, $q$Connects to OpenAI, Google Sheets, Zapier, Google Analytics, and Meta Pixel out of the box.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Analytics$q$, $q$Tracks completion and drop-off rates per step, with CSV export of collected results.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Self-hostable$q$, $q$The source is publicly available and can be deployed on your own infrastructure instead of using the hosted cloud service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Custom theming and code$q$, $q$Advanced theming plus custom JavaScript/CSS for tailoring the bot's appearance and behavior.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Generous free plan (200 chats/month, unlimited bots) with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Self-hostable for teams that want full control over data and hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Large block library covers most common form/chatbot needs without coding$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$AI-provider agnostic — works with OpenAI and other providers rather than locking you into one$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$As of 2026 the source code is under the Functional Source License, not a traditional OSI-approved open-source license — commercial competitors are restricted from using it$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Paid cloud plans (Starter at $39/month, Pro at $89/month) are priced for small businesses, not individual hobbyists$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Self-hosting requires running and maintaining your own infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Is Typebot free?$q$, $q$Yes, there's a free plan covering 200 chats/month and unlimited typebots. Paid plans start at $39/month for higher chat volume and extra features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Can I self-host Typebot?$q$, $q$Yes, the source code is publicly available and documented for self-hosting on your own infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Is Typebot open source?$q$, $q$Typebot was historically AGPLv3-licensed; since 2026 its source is published under the Functional Source License (Fair Source), which keeps the code publicly viewable and self-hostable but restricts building a competing commercial product with it.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Does Typebot support AI chatbots?$q$, $q$Yes, it integrates with OpenAI and other LLM providers so you can add AI-generated responses inside a flow.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Lead-capture conversational forms$q$, $q$Replace static web forms with an interactive, multi-step flow that improves completion rates.$q$, $q$Marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$WhatsApp support automation$q$, $q$Deploy a Typebot flow to WhatsApp to answer common questions or qualify leads.$q$, $q$Sales and support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Self-hosted internal tools$q$, $q$Run Typebot on internal infrastructure to build data-collection forms without sending data to a third party.$q$, $q$Developers, privacy-conscious teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Personal (Free)$q$, $q$$0$q$, $q$monthly$q$, $q$["200 chats/month","Unlimited typebots","Native integrations","Webhooks","Custom JS & CSS"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Starter$q$, $q$$39/month$q$, $q$monthly$q$, $q$["2,000 chats/month","2 seats","Branding removal","File upload","Folders","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Pro$q$, $q$$89/month$q$, $q$monthly$q$, $q$["10,000 chats/month","5 seats","WhatsApp integration","Custom domains","In-depth analytics"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, $q$["Custom chat volume and seats","SSO","Dedicated IP","24/7 support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Typebot is a visual builder for chatbots and conversational forms, letting teams design multi-step conversation flows using more than 45 drag-and-drop blocks (text, images, video, buttons, date pickers, payment inputs, and more) without writing code. Bots can be embedded on websites, deployed as a chat bubble or popup, connected to WhatsApp, or triggered over HTTP requests, and results feed into built-in analytics tracking drop-off and completion rates.$q$, $q$Founded by developer Baptiste Arnaud in 2020, Typebot was long distributed as open-source software under AGPLv3. In 2026 the project moved its source code to the Functional Source License, a 'Fair Source' license: the code remains publicly viewable and self-hostable, but competitors are restricted from using it to build a competing product, and it automatically converts to the permissive Apache 2.0 license two years after each release.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Typebot suits marketing, support, and sales teams building lead-capture forms, product quizzes, or support chatbots, as well as developers who want to self-host a chatbot builder instead of paying for a closed SaaS platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1d7d4b6-0a0c-446a-a22f-7046fe96be45', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── AnonAddy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source email alias service that forwards anonymized addresses to your real inbox, self-hostable or usable as addy.io.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AnonAddy (now addy.io) is an open-source email alias service that forwards anonymized addresses to your inbox, free to start or self-hostable.$q$,
  og_description = $q$AnonAddy (now addy.io) is an open-source email alias service that forwards anonymized addresses to your inbox, free to start or self-hostable.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Unlimited alias creation$q$, $q$Generate unique email aliases per website, either based on your username or fully random, that forward to your real inbox.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Anonymous replies$q$, $q$Reply to forwarded messages from an alias without exposing your real email address to the recipient.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Custom domains$q$, $q$Use your own domain name for aliases instead of the shared addy.io domain.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Browser extensions$q$, $q$Extensions for Firefox, Chrome, Edge, Safari, and other Chromium browsers to generate aliases while browsing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Mobile apps$q$, $q$iOS and Android apps for managing aliases on the go.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$GPG/OpenPGP encryption$q$, $q$Optionally encrypt forwarded email content so only you can read it, even from the mail server.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Developer API$q$, $q$REST API for automating alias creation and account management.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Self-hosting$q$, $q$Fully open-source codebase with an official Docker image for running your own instance.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Free tier available with no cost to start protecting your real email address$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Fully open source with an official self-hosting path if you don't want to trust the hosted service$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Browser extensions and mobile apps make alias creation convenient$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Optional PGP encryption adds an extra layer of privacy for forwarded mail$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Free plan is limited to 10 shared-domain aliases, 1 recipient, and 10MB bandwidth$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Self-hosting requires managing your own mail server (Postfix), database, and Redis instance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Anonymous replies from an alias require a paid plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Is AnonAddy the same as addy.io?$q$, $q$Yes. The service rebranded to addy.io in 2023; the open-source project is still often referred to by its original AnonAddy name.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Is AnonAddy free?$q$, $q$There's a free plan with 10 shared-domain aliases and 1 recipient. Paid plans (Lite and Pro) add custom domains, more recipients, and anonymous replies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Can I self-host AnonAddy?$q$, $q$Yes, the source code is open and there's an official Docker image, though you'll need to run your own Postfix mail server, database, and Redis instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Can I reply from an alias without revealing my real address?$q$, $q$Yes, this is supported as a paid feature — replies sent from an alias appear to come from that alias, not your real inbox.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Reducing signup spam$q$, $q$Use a unique alias for every online account so you can identify and disable the address if it starts receiving spam or appears in a breach.$q$, $q$Privacy-conscious consumers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Self-hosted alias infrastructure$q$, $q$Run your own alias/forwarding service on a custom domain instead of trusting a third-party provider with your mail metadata.$q$, $q$Technical users, small teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10 shared-domain aliases","1 recipient","10MB bandwidth"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Lite$q$, $q$$1/month (billed yearly)$q$, $q$yearly$q$, $q$["50 shared-domain aliases","5 recipients","1 custom domain","100MB bandwidth"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$Pro$q$, $q$$3/month (billed yearly) or $4/month$q$, $q$monthly or yearly$q$, $q$["Unlimited shared-domain aliases","30 recipients","20 custom domains","Unlimited bandwidth","Anonymous replies"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AnonAddy is an open-source email forwarding and alias service: instead of giving out your real email address, you generate unique aliases (per website or fully random) that forward incoming mail to your actual inbox, and you can reply from an alias without revealing your real address to the recipient. The project rebranded to addy.io in 2023, though the underlying open-source project and GitHub organization are still commonly referred to by the AnonAddy name.$q$, $q$The software is built on Laravel/PHP with Postfix for mail handling, and it's fully open source, so it can be self-hosted on your own server using the official Docker image instead of using the hosted addy.io service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Privacy-conscious individuals who want to stop giving their real email address to every website they sign up for, reduce spam and the impact of data breaches, and — for technical users — run their own alias infrastructure instead of trusting a third party.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8fb4ef5c-9ae5-4abe-ac5c-b96c18b86dd1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── b1gMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted PHP webmail platform for running your own email service.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$b1gMail is a free, open-source PHP webmail platform for self-hosting your own branded email service on standard web hosting.$q$,
  og_description = $q$b1gMail is a free, open-source PHP webmail platform for self-hosting your own branded email service on standard web hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Web-based mail client$q$, $q$HTML5 webmail interface with drag-and-drop message organization and intelligent folder/filter rules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Bundled productivity tools$q$, $q$Includes an address book, calendar, task manager, notes, and basic cloud storage alongside email.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Spam and virus protection$q$, $q$DNSBL-based filtering and Bayesian spam analysis, with optional ClamAV integration for virus scanning.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Plugin system$q$, $q$Extensible via plugins for adding custom functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Runs on shared PHP hosting$q$, $q$Doesn't require a dedicated root server — deploys on standard PHP-capable web hosting.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Fully free and open source (GPL) since version 7.4.1$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Runs on ordinary PHP web hosting instead of requiring a dedicated mail server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Bundles calendar, contacts, and task tools alongside email in one webmail interface$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Built-in spam and virus filtering$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Interface and community documentation historically skew toward German-speaking users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Managing spam and deliverability on a shared-hosting mail setup takes more effort than a managed mail provider$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Smaller plugin and extension ecosystem than larger mail platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Is b1gMail free?$q$, $q$Yes, since version 7.4.1 b1gMail is licensed under the GPL and its proprietary components were removed, making it free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Do I need a dedicated server to run b1gMail?$q$, $q$No, it's designed to run on standard PHP web hosting rather than requiring a dedicated root server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Does b1gMail include anything besides email?$q$, $q$Yes, it bundles an address book, calendar, task manager, notes, and basic cloud storage alongside the webmail client.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Branded email for a club or small business$q$, $q$Offer @yourdomain email addresses to members or staff without paying for a hosted business email plan.$q$, $q$Clubs, associations, small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Self-hosted webmail on shared hosting$q$, $q$Run a full webmail platform on standard PHP hosting instead of provisioning a dedicated mail server.$q$, $q$Website owners with existing PHP hosting$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$b1gMail is a PHP-based webmail and mail server management platform that lets you run your own email service for a domain — for personal use, a club or organization, or a business — without needing a dedicated root server, since it runs on standard PHP web hosting. It provides a modern web interface with drag-and-drop message handling, along with bundled tools like an address book, calendar, task manager, notes, and basic cloud storage.$q$, $q$Originally distributed as commercial/freeware software by its creator, Patrick Schlangen, b1gMail changed its license to GPL starting with version 7.4.1, removing its proprietary components and making the full platform free and open source.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Website owners, clubs and associations, and small organizations that want to offer branded email addresses on their own domain without paying for a hosted business email plan, and who are comfortable running PHP-based web software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── DebOps ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source collection of Ansible roles and playbooks for automating Debian/Ubuntu infrastructure.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$DebOps is a free, open-source collection of Ansible roles and playbooks for automating Debian and Ubuntu server infrastructure.$q$,
  og_description = $q$DebOps is a free, open-source collection of Ansible roles and playbooks for automating Debian and Ubuntu server infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0f37df20-288c-490c-8a89-5a00b2c6478e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0f37df20-288c-490c-8a89-5a00b2c6478e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Integrated Ansible roles$q$, $q$Dozens of roles for common infrastructure services, designed to work together rather than as isolated one-off scripts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$TLS/certificate management$q$, $q$Automates X.509 certificate issuance and renewal, including Let's Encrypt integration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Self-hosted service playbooks$q$, $q$Includes playbooks for services like GitLab, LibreNMS, and Nextcloud/ownCloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Multi-target deployment$q$, $q$Works against physical servers, VMs, or LXC/Docker containers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Published on Ansible Galaxy$q$, $q$Individual roles can be used independently of the full DebOps playbook collection.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Free and open source with an active project history dating back to 2013$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Covers a broad set of common infrastructure needs out of the box, reducing custom Ansible work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Designed for Debian/Ubuntu specifically, so roles are tuned to those distributions rather than generic$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Roles are reusable individually via Ansible Galaxy$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Debian/Ubuntu-specific — not designed for other Linux distributions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Requires existing familiarity with Ansible to configure and extend$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Documentation and community are smaller than mainstream configuration-management tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$What is DebOps?$q$, $q$DebOps is a free, open-source set of Ansible roles and playbooks for automating the setup and management of Debian/Ubuntu infrastructure.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Does DebOps work with distributions other than Debian/Ubuntu?$q$, $q$It's specifically designed for Debian and Ubuntu-based systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Can I use individual DebOps roles without the whole project?$q$, $q$Yes, roles are published on Ansible Galaxy and can be used independently of the full DebOps playbook set.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Standardized server provisioning$q$, $q$Apply a consistent, tested set of Ansible roles across a fleet of Debian/Ubuntu servers.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$Self-hosted infrastructure automation$q$, $q$Automate deployment of self-hosted services like GitLab, Nextcloud, and monitoring tools.$q$, $q$DevOps teams, homelab operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$DebOps is a collection of Ansible roles and playbooks for bootstrapping and managing IT infrastructure built on Debian or Ubuntu, from a single host to a full data center. Started by Maciej Delmanowski in October 2013, it packages together dozens of integrated Ansible roles covering things like TLS certificate management (with Let's Encrypt), GitLab-based Git hosting, LibreNMS network monitoring, and Nextcloud/ownCloud file sharing, so administrators don't have to write and maintain their own Ansible automation from scratch.$q$, $q$The project can target physical machines, virtual machines, or containers (LXC/Docker), and its roles are also published individually on Ansible Galaxy for use outside the full DebOps playbook set.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators and DevOps engineers managing Debian/Ubuntu server fleets who want a maintained, integrated set of Ansible automation instead of building every role themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0f37df20-288c-490c-8a89-5a00b2c6478e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── docker-mailserver ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Docker image bundling a full mail server (SMTP, IMAP, spam/virus filtering) configured via files, not a database.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$docker-mailserver is a free, open-source Docker image that bundles SMTP, IMAP, anti-spam, and anti-virus into a config-file-based mail server.$q$,
  og_description = $q$docker-mailserver is a free, open-source Docker image that bundles SMTP, IMAP, anti-spam, and anti-virus into a config-file-based mail server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6761ccd8-5a87-4df7-8db5-4222ccd81539';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6761ccd8-5a87-4df7-8db5-4222ccd81539' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Full mail stack in one container$q$, $q$Bundles SMTP, IMAP, and optional LDAP authentication in a single Docker image.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Anti-spam and anti-virus$q$, $q$Includes spam filtering and virus scanning out of the box.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Configuration-file based$q$, $q$Accounts and settings are managed through plain config files rather than a SQL database, making setup easier to version-control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$setup.sh administration script$q$, $q$A bundled CLI script for common tasks like adding mail accounts and managing DKIM keys.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Published to Docker Hub and GHCR$q$, $q$Prebuilt images are available from both Docker Hub (mailserver/docker-mailserver) and GitHub Container Registry.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Free, open-source (MIT license), no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Avoids the complexity of a database-backed mail account system$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Actively maintained with regular image updates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Bundles anti-spam and anti-virus rather than requiring separate setup$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Running your own mail server still requires correctly managing DNS records (SPF, DKIM, DMARC, reverse DNS) for deliverability$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$No graphical admin UI — administration is via config files and the setup.sh CLI$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$You're responsible for your own backups, updates, and abuse/spam monitoring$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Is docker-mailserver free?$q$, $q$Yes, it's free, open-source software under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Does it use a database?$q$, $q$No, it's intentionally configured via flat configuration files instead of a SQL database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Does it include spam and virus filtering?$q$, $q$Yes, anti-spam and anti-virus scanning are included as part of the bundled mail stack.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Where do I get the image?$q$, $q$It's published on Docker Hub as mailserver/docker-mailserver and also on GitHub Container Registry.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Self-hosted personal or business email$q$, $q$Run your own mail server for a domain in a single Docker container instead of using a hosted mail provider.$q$, $q$Self-hosters, small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$Reproducible mail server configuration$q$, $q$Manage mail server settings as version-controlled config files rather than database records.$q$, $q$System administrators, DevOps teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$docker-mailserver (DMS) is a production-ready, containerized mail server bundling SMTP, IMAP, optional LDAP authentication, anti-spam, and anti-virus into a single Docker image. Rather than requiring a SQL database to manage accounts and settings, it's configured through plain configuration files, which the project positions as simpler to version-control and reason about than database-backed mail server stacks.$q$, $q$The project is MIT-licensed and maintained on GitHub by the Docker Mailserver organization, with images published to Docker Hub and GitHub Container Registry. A bundled setup.sh script helps with day-to-day administration tasks like adding accounts and managing DKIM keys.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters and system administrators who want to run their own email server in Docker without configuring Postfix, Dovecot, and spam/antivirus tooling by hand, from hobbyists running a personal domain to admins managing mail for an organization.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6761ccd8-5a87-4df7-8db5-4222ccd81539', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Dovel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, open-source SMTP mail server written in Go, configured with a single JSON file plus an optional web interface.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Dovel is a lightweight, open-source SMTP mail server written in Go, configured with a single JSON file and an optional web interface.$q$,
  og_description = $q$Dovel is a lightweight, open-source SMTP mail server written in Go, configured with a single JSON file and an optional web interface.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd1caaa4a-2950-4499-9b5a-375119656c09';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd1caaa4a-2950-4499-9b5a-375119656c09' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Single-file JSON configuration$q$, $q$The entire server is configured through one JSON file rather than a multi-service stack.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Multi-domain support$q$, $q$Can handle mail for more than one domain from a single instance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$DKIM signing$q$, $q$Supports DKIM by pointing the config at a key file.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$PGP via WKD$q$, $q$Supports PGP encryption discovery using the Web Key Directory standard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Optional web interface$q$, $q$A lightweight built-in web UI for browsing received email without a separate mail client.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Very lightweight — uses only a few MBs of RAM$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Simple, single-file configuration instead of a multi-component mail stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Free and open source under LGPL-3.0$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Built-in DKIM and PGP/WKD support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Explicitly described by its author as early-stage and actively in development, so features and stability are still evolving$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Much smaller community and track record than established mail servers like docker-mailserver or Mailcow$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Documentation is minimal compared to mature self-hosted mail projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Is Dovel free?$q$, $q$Yes, Dovel is free, open-source software under the LGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$What language is Dovel written in?$q$, $q$Go.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Does Dovel have a web interface?$q$, $q$Yes, an optional lightweight web interface is included for browsing your email in a browser.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Is Dovel production-ready?$q$, $q$The project describes itself as being in early, active development, so it may suit hobby or small personal deployments more than mission-critical production mail.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$Lightweight personal mail server$q$, $q$Run a small, low-resource mail server for a personal domain without deploying a full mail-server stack.$q$, $q$Individual self-hosters, developers$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Dovel is a minimalist, self-hosted SMTP server for sending and receiving email, written in Go and licensed under LGPL-3.0. It's configured through a single JSON file, supports handling mail for multiple domains, and includes DKIM signing and PGP support via the Web Key Directory (WKD) standard. An optional lightweight web interface is available for browsing received email in a browser instead of relying solely on a mail client.$q$, $q$The project describes itself as being in early, active development and uses only a few megabytes of RAM, positioning it as a much smaller alternative to full mail-server stacks like docker-mailserver or Mailcow for people who want a simple, low-resource mail server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and self-hosters who want a small, easy-to-configure mail server for a personal domain or a small number of mailboxes, and who are comfortable running early-stage software with a smaller feature set than mature mail server projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1caaa4a-2950-4499-9b5a-375119656c09', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Inboxen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source disposable/anonymous email software; its public hosted instance at inboxen.org has shut down, but the code remains self-hostable.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Inboxen is open-source disposable email software. Its public hosted instance has shut down, but the code remains available to self-host.$q$,
  og_description = $q$Inboxen is open-source disposable email software. Its public hosted instance has shut down, but the code remains available to self-host.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1dea1981-a33c-4b6f-bacd-a384dacee7f2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1dea1981-a33c-4b6f-bacd-a384dacee7f2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Disposable inbox generation$q$, $q$Creates anonymous, disposable email addresses that forward to a real mailbox.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Self-hosted deployment$q$, $q$Source available on Codeberg with setup instructions for running your own instance using Python, PostgreSQL, and Node.js.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Open development$q$, $q$The maintainer continues to accept community pull requests despite the hosted service being retired.$q$, 2);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Source code remains open and self-hostable even after the public service shut down$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Free, no-cost software for anyone willing to run it themselves$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Still accepting community contributions and pull requests$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$The public hosted instance at inboxen.org has permanently shut down, so there's no longer a ready-to-use hosted option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Official maintenance is explicitly reduced since the shutdown$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Self-hosting requires setting up a multi-part stack (Python, PostgreSQL, Node.js) yourself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Is Inboxen still available as a hosted service?$q$, $q$No. The public instance at inboxen.org shut down in 2026 and its hosted user data was deleted. The software itself remains available to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Can I still use Inboxen?$q$, $q$Yes, but only by self-hosting it yourself from the source code published on Codeberg — there is no longer a public sign-up service.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Is the project still maintained?$q$, $q$The maintainer has stated the repository receives fewer updates since the shutdown but is still accepting pull requests.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$Self-hosted disposable email$q$, $q$Run your own instance to generate disposable inboxes for yourself or a small group instead of using a third-party disposable-email service.$q$, $q$Technical self-hosters$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Inboxen is open-source software for generating disposable, anonymous email inboxes that forward to a real address, aimed at letting users sign up for websites without exposing a permanent email identity. The project's public hosted service at inboxen.org shut down in 2026, with the team taking the website offline and deleting hosted user data. The source code, however, remains published (now hosted on Codeberg after moving from GitHub) and continues to accept community pull requests, meaning the software can still be self-hosted even though the original public instance is gone.$q$, $q$Because official maintenance has slowed to a reduced cadence since the shutdown, Inboxen is best understood today as a self-hosted project you run yourself rather than a service you can sign up for.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Technical users who want to run their own disposable-email infrastructure and are comfortable setting up the required stack (Python, PostgreSQL, Node.js) rather than relying on a hosted disposable-email provider.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1dea1981-a33c-4b6f-bacd-a384dacee7f2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── iRedMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source installer that bundles Postfix, Dovecot, and webmail into a complete mail server on Linux and BSD.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2007,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$iRedMail is a free, open-source mail server installer for Linux/BSD bundling Postfix, Dovecot, webmail, antispam, and antivirus.$q$,
  og_description = $q$iRedMail is a free, open-source mail server installer for Linux/BSD bundling Postfix, Dovecot, webmail, antispam, and antivirus.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba51550d-a30f-4ff6-991a-d6db68d152ca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba51550d-a30f-4ff6-991a-d6db68d152ca' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$One-click mail stack installer$q$, $q$A single installer script sets up Postfix, Dovecot, database backend, antispam, and antivirus together.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Webmail included$q$, $q$Ships with Roundcube or SOGo webmail clients out of the box.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$CalDAV/CardDAV via SOGo$q$, $q$Optional SOGo groupware adds calendar and contact sync alongside email.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Antispam and antivirus$q$, $q$Integrates SpamAssassin and ClamAV for filtering incoming mail.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Flexible backend choice$q$, $q$Supports OpenLDAP, MySQL, MariaDB, or PostgreSQL as the storage backend.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$ActiveSync support$q$, $q$Allows mobile devices to sync mail, contacts, and calendars.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$TLS, SPF, DKIM$q$, $q$Built-in support for transport encryption and email authentication standards.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$iRedAdmin-Pro (paid add-on)$q$, $q$Optional commercial web admin panel with extended management features.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Free and open source core edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Saves significant time versus manually configuring Postfix and Dovecot$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Actively maintained since 2007$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Wide distribution support across Linux and BSD$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Requires Linux/BSD system administration skills to install and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Some advanced management features are gated behind the paid iRedAdmin-Pro add-on$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Free edition relies on community support only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Is iRedMail free?$q$, $q$Yes, the open-source edition is free. A commercial Enterprise Edition and iRedAdmin-Pro admin panel are available as paid options.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$What operating systems does iRedMail support?$q$, $q$CentOS Stream, Rocky Linux, AlmaLinux, Debian, Ubuntu, FreeBSD, and OpenBSD.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Does iRedMail include webmail?$q$, $q$Yes, it installs Roundcube or SOGo webmail by default.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Can I use iRedMail to host email for my own domain?$q$, $q$Yes, that is its primary purpose: deploying a complete self-hosted mail server for one or more domains.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Self-hosted business email$q$, $q$Small organizations wanting full control over their mail server instead of using a hosted provider.$q$, $q$Small businesses and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Personal or family mail server$q$, $q$Privacy-conscious individuals running their own domain email.$q$, $q$Self-hosting enthusiasts$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Open Source Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Full mail server stack installer","Postfix + Dovecot + webmail","Antispam and antivirus","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$Enterprise Edition / iRedAdmin-Pro$q$, $q$Paid (contact for pricing)$q$, $q$Custom$q$, $q$["One-click upgrades","Extended admin panel","Commercial support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$iRedMail is an open-source shell script that automates the deployment of a full mail server stack, including Postfix (SMTP), Dovecot (IMAP/POP3), a database backend (OpenLDAP, MySQL, MariaDB, or PostgreSQL), SpamAssassin and ClamAV for antispam/antivirus, and Roundcube or SOGo for webmail.$q$, $q$The project has been maintained since 2007 and supports major Linux distributions (Rocky, AlmaLinux, Debian, Ubuntu, CentOS Stream) as well as FreeBSD and OpenBSD. A commercial Enterprise Edition and iRedAdmin-Pro admin panel are available for organizations wanting one-click upgrades and additional management features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators, small businesses, and hobbyists who want to self-host a complete email platform without manually configuring each component of the mail stack separately.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba51550d-a30f-4ff6-991a-d6db68d152ca', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modern, all-in-one open-source mail server in Go with built-in SMTP, IMAP, spam filtering, and webmail.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mox is a free, open-source all-in-one mail server written in Go with built-in SMTP, IMAP, spam filtering, and webmail.$q$,
  og_description = $q$Mox is a free, open-source all-in-one mail server written in Go with built-in SMTP, IMAP, spam filtering, and webmail.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba65b701-bea2-49e3-a8e6-c127d99725d5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba65b701-bea2-49e3-a8e6-c127d99725d5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$All-in-one binary$q$, $q$SMTP, IMAP, webmail, and spam filtering ship in a single Go binary.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Automatic TLS$q$, $q$Certificates are provisioned automatically via Let's Encrypt.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Modern email security by default$q$, $q$Built-in support for SPF, DKIM, DMARC, MTA-STS, DANE, and DNSSEC.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Spam filtering$q$, $q$Reputation-based and content-based spam filtering are included out of the box.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Quickstart setup$q$, $q$A quickstart tool can get a working mail server running in around 10 minutes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Integrated webmail$q$, $q$Includes a built-in webmail client, no separate install needed.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Internationalization support$q$, $q$Handles internationalized email addresses.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Single binary greatly simplifies deployment compared to a multi-component mail stack$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Modern security standards (DANE, MTA-STS, DNSSEC) enabled by default$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Fast quickstart setup process$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$MIT licensed and actively maintained$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Backed by NLnet and EU NGI program sponsorship$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Newer project, less battle-tested than Postfix/Dovecot in large-scale production$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Prebuilt binaries mainly target Linux x86-64$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Smaller community and ecosystem than legacy mail server tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Is Mox free?$q$, $q$Yes, Mox is released under the MIT license and is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$What protocols does Mox support?$q$, $q$SMTP and IMAP4 for mail, plus SPF, DKIM, DMARC, MTA-STS, DANE, and DNSSEC for security.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Does Mox include a webmail client?$q$, $q$Yes, an integrated webmail client is included.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Who maintains Mox?$q$, $q$It is developed by mjl-, with sponsorship from the NLnet Foundation and the EU NGI program.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Personal or small-domain email server$q$, $q$Running your own domain's email without stitching together Postfix, Dovecot, and Rspamd separately.$q$, $q$Individuals and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$Security-focused self-hosting$q$, $q$Deploying a mail server with DNSSEC, DANE, and MTA-STS support enabled from the start.$q$, $q$Privacy and security-conscious self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mox is a self-hosted email server written in Go by developer mjl-, built to consolidate SMTP, IMAP4, spam filtering, and webmail into a single binary rather than assembling separate components like Postfix, Dovecot, and Rspamd. It implements modern email security standards including SPF, DKIM, DMARC, MTA-STS, DANE, and DNSSEC by default.$q$, $q$The project is sponsored by the NLnet Foundation and the European Commission's NGI (Next Generation Internet) program, and emphasizes code quality through extensive automated and fuzz testing against relevant RFCs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and small teams who want a modern, security-first mail server without manually integrating multiple separate mail components.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba65b701-bea2-49e3-a8e6-c127d99725d5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SimpleLogin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source email alias service that hides your real address behind forwarding aliases, with an option to self-host.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = $q$Switzerland$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SimpleLogin is an open-source email alias service that hides your real address; free plan available, with self-hosting supported.$q$,
  og_description = $q$SimpleLogin is an open-source email alias service that hides your real address; free plan available, with self-hosting supported.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e645d12e-427d-4de8-a46d-9232f2a915d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e645d12e-427d-4de8-a46d-9232f2a915d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Email aliases$q$, $q$Create unique aliases per website; 10 aliases on the free plan, unlimited on Premium.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Two-way alias replies$q$, $q$Reply to or send new mail from an alias without revealing your real address.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Browser extensions$q$, $q$Extensions for Chrome, Firefox, and Safari to generate aliases on the fly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Mobile apps$q$, $q$Native iOS and Android apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Custom domains$q$, $q$Bring your own domain to create branded aliases (unlimited on Premium).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Catch-all aliasing$q$, $q$Wildcard/catch-all domain support for auto-generating aliases.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$PGP encryption$q$, $q$Forwarded mail can be encrypted with PGP.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$TOTP and WebAuthn 2FA$q$, $q$Two-factor authentication options for account security.$q$, 7);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Self-hostable$q$, $q$Full source code is open source and can be deployed on your own server.$q$, 8);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Genuinely open source and self-hostable, not just free-to-use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Generous free plan with 10 aliases and unlimited bandwidth$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Backed by Proton's infrastructure and reputation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Strong security options: PGP encryption, TOTP, and WebAuthn$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Free plan is limited to 10 aliases and 1 mailbox$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Unlimited aliases, custom domains, and PGP require the paid Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Self-hosting requires technical setup and maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Is SimpleLogin free?$q$, $q$Yes, a free plan offers 10 aliases and 1 mailbox. Premium unlocks unlimited aliases and custom domains for $36/year or $4/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Can I self-host SimpleLogin?$q$, $q$Yes, its source code is fully open source and it can be self-hosted on your own server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Who owns SimpleLogin?$q$, $q$SimpleLogin was acquired by Proton AG, the company behind Proton Mail, though it continues to operate as an open-source project.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Does SimpleLogin support custom domains?$q$, $q$Yes, unlimited custom domains are included on the Premium plan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Alias-based privacy protection$q$, $q$Signing up for online services without exposing your real email address, and disabling a single alias to stop spam.$q$, $q$Everyday privacy-conscious users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Self-hosted alias infrastructure$q$, $q$Running your own instance of the aliasing service for full control over data and routing.$q$, $q$Technical users and organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Free$q$, $q$$0$q$, $q$N/A$q$, $q$["10 aliases","1 mailbox","Unlimited bandwidth","Reply from alias","Browser extensions","iOS and Android apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$Premium$q$, $q$$36/year (or $4/month)$q$, $q$Annual or monthly$q$, $q$["Unlimited aliases","Unlimited custom domains","Catch-all domain support","5 subdomains","50 usernames/directories","Unlimited mailboxes","PGP encryption"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SimpleLogin lets users generate unique email aliases for each website or service they sign up for, forwarding messages to their real inbox while keeping the primary address hidden. Founded in 2020 and later acquired by Proton AG (maker of Proton Mail), SimpleLogin remains fully open source, with its full codebase available on GitHub.$q$, $q$Unlike most alias-forwarding services, SimpleLogin can also be self-hosted on your own server, making it one of the few options that combines a polished hosted product with a genuinely self-hostable open-source core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Privacy-conscious individuals who want to avoid exposing their real email address to every website, and technical users who prefer to run their own alias infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e645d12e-427d-4de8-a46d-9232f2a915d2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── wildduck ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Scalable, open-source IMAP/POP3 mail server built on Node.js and MongoDB, designed for API-driven management.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$WildDuck is an open-source, API-driven IMAP/POP3 mail server built on Node.js and MongoDB for scalable self-hosted email.$q$,
  og_description = $q$WildDuck is an open-source, API-driven IMAP/POP3 mail server built on Node.js and MongoDB for scalable self-hosted email.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '591b7aee-2302-4201-805a-465e25e4cfbc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '591b7aee-2302-4201-805a-465e25e4cfbc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Full IMAP4rev1 support$q$, $q$Includes IDLE, CONDSTORE, COMPRESS, and QUOTA extensions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$REST API$q$, $q$Manage accounts, mailboxes, messages, filters, autoreplies, and DKIM keys entirely through an API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$MongoDB-based storage$q$, $q$Uses MongoDB with sharding support for horizontal scale.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Stateless architecture$q$, $q$Designed to avoid single points of failure across the cluster.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$TOTP and WebAuthn MFA$q$, $q$Modern multi-factor authentication options for mailbox accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$PGP encryption support$q$, $q$Can encrypt stored mail with PGP.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Unicode support$q$, $q$Handles internationalized email addresses and folder names.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Audit logging$q$, $q$Tracks account and mailbox activity for auditing.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Fully open source under the EUPL 1.2 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$API-first design well suited to automation and custom mail products$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Built for horizontal scale across large numbers of mailboxes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Modern authentication options (TOTP, WebAuthn)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Requires MongoDB plus additional components (Haraka, ZoneMTA) for a full mail stack$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$More operationally complex than an all-in-one mail server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Best suited to teams with Node.js and MongoDB operations experience$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Is wildduck free?$q$, $q$Yes, it is released under the EUPL 1.2 open-source license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Does wildduck handle SMTP?$q$, $q$No, wildduck handles IMAP/POP3; it's typically paired with Haraka and ZoneMTA for SMTP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Does wildduck have an API?$q$, $q$Yes, a REST API is central to how accounts and mailboxes are managed.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Who maintains wildduck?$q$, $q$Zone Media maintains the project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$Large-scale hosted email platforms$q$, $q$Providers needing horizontal scaling across many mailboxes without a single point of failure.$q$, $q$Email hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$API-driven mail products$q$, $q$Building custom applications on top of a mail server via a REST API rather than config files.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$WildDuck is an open-source IMAP/POP3 email server built with Node.js and MongoDB, maintained by Zone Media. It's designed for horizontal scalability with a stateless, no-single-point-of-failure architecture, targeting deployments with 1,000 or more mailboxes.$q$, $q$WildDuck handles IMAP/POP3 only; it's typically paired with Haraka for inbound SMTP and ZoneMTA for outbound SMTP to form a complete mail stack. Management is designed to happen primarily through a REST API rather than configuration files.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and hosting providers building custom, API-driven email platforms that need to scale horizontally.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('591b7aee-2302-4201-805a-465e25e4cfbc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cyrus IMAP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source IMAP email, contacts, and calendar server used in production since 1993.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1993,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Cyrus IMAP is a free, open-source email, contacts, and calendar server in production use since 1993, built for scale.$q$,
  og_description = $q$Cyrus IMAP is a free, open-source email, contacts, and calendar server in production use since 1993, built for scale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8e2764a7-0bfa-42fa-913d-469e0d66e4ce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8e2764a7-0bfa-42fa-913d-469e0d66e4ce' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$High-performance IMAP server$q$, $q$Built with speed and efficiency as core design goals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$CalDAV and CardDAV$q$, $q$Built-in calendar and contact server alongside IMAP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Sieve scripting$q$, $q$Server-side mail filtering using the Sieve language.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Cyrus SASL authentication$q$, $q$Supports a wide range of authentication mechanisms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$SPF, DKIM, DMARC support$q$, $q$Standard email authentication protocols for deliverability and security.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Replication$q$, $q$Supports replication for high availability deployments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$JMAP support$q$, $q$Implements the modern JMAP protocol in addition to IMAP.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Antivirus/antispam integration$q$, $q$Works with external antivirus and antispam toolkits.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Extremely mature, with over 30 years in production use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Strong performance and scalability track record for large installations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Free and open source$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Supports modern protocols including JMAP alongside CalDAV/CardDAV$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Steeper learning curve for configuration than simpler mail servers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Documentation can be dense for newcomers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Best suited to experienced system administrators rather than casual self-hosters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Is Cyrus IMAP free?$q$, $q$Yes, it is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$How long has Cyrus IMAP been around?$q$, $q$Since 1993, originally developed at Carnegie Mellon University.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Does Cyrus support calendars and contacts?$q$, $q$Yes, via built-in CalDAV and CardDAV support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Does Cyrus support JMAP?$q$, $q$Yes, JMAP is supported alongside IMAP.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Large-scale institutional email$q$, $q$Universities and enterprises needing a proven, high-performance IMAP backend.$q$, $q$Universities and enterprise IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$Combined mail, calendar, and contacts server$q$, $q$Organizations wanting CalDAV/CardDAV alongside IMAP in a single server.$q$, $q$System administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cyrus IMAP is a free and open-source mail, contacts, and calendar server originally developed at Carnegie Mellon University, in active development and production use since 1993. It's built for performance and scalability in large deployments.$q$, $q$The server includes CardDAV and CalDAV support alongside IMAP, Sieve scripting for mail filtering, Cyrus SASL for flexible authentication, and JMAP support, and integrates with antivirus and antispam toolkits.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators and hosting providers running large-scale, high-performance IMAP infrastructure, including universities and enterprises.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8e2764a7-0bfa-42fa-913d-469e0d66e4ce', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── DavMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source gateway that lets standard mail and calendar clients connect to Exchange or Exchange Online.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$DavMail is a free, open-source gateway that lets Thunderbird, Apple Mail, and other clients connect to Exchange via POP/IMAP/CalDAV.$q$,
  og_description = $q$DavMail is a free, open-source gateway that lets Thunderbird, Apple Mail, and other clients connect to Exchange via POP/IMAP/CalDAV.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a42ba043-aed3-4e2a-accc-c2fe75a65c67';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a42ba043-aed3-4e2a-accc-c2fe75a65c67' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$POP and IMAP gateway$q$, $q$Receive Exchange mail through standard POP or IMAP clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$SMTP gateway$q$, $q$Send mail through Exchange using standard SMTP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$CalDAV support$q$, $q$Calendar access including free/busy lookups.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$CardDAV support$q$, $q$Sync personal contacts with standard CardDAV clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$LDAP gateway$q$, $q$Search the Exchange global address book via LDAP.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Cross-platform$q$, $q$Runs on Windows, Linux, and macOS via the JVM.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Exchange Online support$q$, $q$Works with both on-premise Exchange and Exchange Online (Microsoft 365).$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Enables non-Outlook clients like Thunderbird and Apple Mail/iCal to use Exchange$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Actively maintained with recent releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Works across Windows, Linux, and macOS$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Requires running an extra local or server-side gateway process$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Java-based, so a JVM is required$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Initial configuration can be fiddly for less technical users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Is DavMail free?$q$, $q$Yes, it is open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Does DavMail work with Microsoft 365 (Exchange Online)?$q$, $q$Yes, it supports both on-premise Exchange and Exchange Online.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$What email clients work with DavMail?$q$, $q$Any standard POP/IMAP/SMTP/CalDAV/CardDAV client, such as Thunderbird or Apple Mail/iCal.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$What platforms does DavMail run on?$q$, $q$Windows, Linux, and macOS; it can also run headless on a server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Non-Outlook access to Exchange$q$, $q$Employees who prefer Thunderbird, Apple Mail, or other clients but need Exchange connectivity.$q$, $q$Employees on Linux or macOS$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$Cross-platform Exchange calendar sync$q$, $q$Accessing Exchange calendars via CalDAV from non-Windows systems.$q$, $q$IT teams supporting mixed-OS environments$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$DavMail is a Java-based gateway that translates standard email and calendar protocols, including POP, IMAP, SMTP, CalDAV, CardDAV, and LDAP, into calls compatible with on-premise Exchange or Exchange Online. This lets users connect regular clients like Thunderbird or Apple Mail/iCal without relying on Outlook.$q$, $q$The application is cross-platform Java software, tested on Windows, Linux (Ubuntu and Fedora), and macOS, and can run headless on a server for remote or mobile clients.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Users on non-Outlook platforms, particularly Linux and macOS, who need to access a corporate Exchange mailbox using standard mail and calendar apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a42ba043-aed3-4e2a-accc-c2fe75a65c67', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Dovecot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Widely used, high-performance open-source IMAP and POP3 server, with an optional commercial Dovecot Pro edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Dovecot is a widely used, high-performance open-source IMAP/POP3 server, with a paid Dovecot Pro edition for large-scale hosting.$q$,
  og_description = $q$Dovecot is a widely used, high-performance open-source IMAP/POP3 server, with a paid Dovecot Pro edition for large-scale hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$High-performance IMAP/POP3$q$, $q$Optimized for speed and standards compliance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$mbox and Maildir support$q$, $q$Works with both mailbox storage formats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Flexible authentication$q$, $q$Supports many different authentication databases and mechanisms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Self-optimizing indexes$q$, $q$Includes self-healing index behavior for reliability.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Clustering and NFS support$q$, $q$Built for deployment across clustered and networked storage environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Plugin extensibility$q$, $q$Supports plugins and Lua scripting for customization.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Migration tools$q$, $q$Includes tools to migrate from existing IMAP/POP3 servers.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Dovecot Pro$q$, $q$Paid enterprise edition with dynamic scalability and dedicated support for telcos, ISPs, and hosting providers.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Extremely mature and widely deployed across the industry$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Strong performance and standards compliance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Free, open-source core$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Active security disclosure program$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Advanced enterprise scaling features are gated behind the paid Dovecot Pro edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Configuration can be complex for large deployments$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Does not handle SMTP itself; requires pairing with an MTA like Postfix$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Is Dovecot free?$q$, $q$Yes, the core Dovecot software is free and open source; Dovecot Pro is a separate paid enterprise edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Does Dovecot handle sending mail?$q$, $q$No, Dovecot is an IMAP/POP3 server; it is commonly paired with a mail transfer agent like Postfix for SMTP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Who maintains Dovecot?$q$, $q$The dovecot.org website is maintained by Open-Xchange GmbH.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$What mailbox formats does Dovecot support?$q$, $q$Both mbox and Maildir formats.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Self-hosted mail server backend$q$, $q$Pairing Dovecot with Postfix for a complete self-hosted mail stack.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Large-scale hosting or ISP email$q$, $q$Using Dovecot Pro's clustering and support for high-volume IMAP/POP3 deployments.$q$, $q$Telcos, ISPs, and hosting providers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, $q$["IMAP and POP3 server","mbox and Maildir support","Plugin extensibility"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$Dovecot Pro$q$, $q$Contact for pricing$q$, $q$Custom/Enterprise$q$, $q$["Dynamic scalability","High performance at scale","Dedicated support","Built for telcos, ISPs, and hosting providers"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Dovecot is one of the most widely deployed open-source IMAP and POP3 servers, known for performance, standards compliance, and security. The open-source core is free, while Dovecot Pro is a separate commercial, enterprise-grade edition aimed at telcos, ISPs, and large hosting providers that need dynamic scalability and dedicated support.$q$, $q$The dovecot.org website and project are maintained by Open-Xchange GmbH. Dovecot handles IMAP/POP3 only and does not send mail itself; it's commonly paired with a mail transfer agent such as Postfix.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators of all sizes, from individual self-hosters to large hosting providers, who need a reliable IMAP/POP3 backend.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('da8a9e8f-5d1d-43cb-8de7-2ebf5cb6c5b8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── chasquid ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, easy-to-configure open-source SMTP server written in Go, built to avoid common misconfigurations.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$chasquid is a free, open-source SMTP server written in Go, designed for easy, secure configuration on small mail setups.$q$,
  og_description = $q$chasquid is a free, open-source SMTP server written in Go, designed for easy, secure configuration on small mail setups.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd084534-24c8-4496-a272-eb646dc24f55';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd084534-24c8-4496-a272-eb646dc24f55' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Simple configuration$q$, $q$Designed to be easy to set up correctly compared to traditional MTAs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Multiple virtual domains$q$, $q$Supports hosting several domains and user aliases from one server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Internationalized domain names$q$, $q$Supports IDNA for non-ASCII domain names.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Automatic TLS$q$, $q$Integrates with Let's Encrypt for certificate management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$SPF and MTA-STS verification$q$, $q$Built-in checks to improve deliverability and security.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Secure-by-default design$q$, $q$Prevents insecure configurations such as open relays.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Single static binary$q$, $q$Written in Go, simplifying deployment.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Simpler to configure than Postfix or Exim$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Secure defaults reduce the risk of misconfiguration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Free and open source under Apache 2.0$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Built-in Let's Encrypt integration$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Smaller community than Postfix or Exim$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Fewer plugins and extensions than more mature MTAs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Best suited to small-scale rather than large enterprise deployments$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Is chasquid free?$q$, $q$Yes, it is released under the Apache License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Who develops chasquid?$q$, $q$It is created and maintained by Alberto Bertogli.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$What language is chasquid written in?$q$, $q$Go.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Does chasquid support multiple domains?$q$, $q$Yes, it supports multiple virtual domains and user aliases.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Personal domain email server$q$, $q$Individuals wanting a simple, secure SMTP server for their own domain.$q$, $q$Individual self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$Small business mail relay$q$, $q$Small teams needing straightforward SMTP without Postfix's configuration overhead.$q$, $q$Small businesses$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$chasquid is an SMTP server (mail transfer agent) written in Go by developer Alberto Bertogli, offered as an easier-to-configure alternative to Postfix or Exim for individuals and small setups. It's designed so that secure configuration is the default, preventing common issues such as accidental open relays.$q$, $q$The project supports multiple virtual domains, user aliases, internationalized domain names, and automatic TLS certificate management via Let's Encrypt, along with SPF and MTA-STS verification.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and small organizations who want to run their own domain's SMTP server without dealing with the complexity of Postfix or Exim.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd084534-24c8-4496-a272-eb646dc24f55', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Courier MTA ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source integrated mail and groupware server combining ESMTP, IMAP, POP3, webmail, and calendaring.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Courier MTA is a free, open-source integrated mail server combining ESMTP, IMAP, POP3, webmail, and calendaring in one package.$q$,
  og_description = $q$Courier MTA is a free, open-source integrated mail server combining ESMTP, IMAP, POP3, webmail, and calendaring in one package.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd0165e6b-299a-413e-8603-112e26c2317d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd0165e6b-299a-413e-8603-112e26c2317d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Integrated protocol support$q$, $q$ESMTP, IMAP, and POP3 in a single server framework.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Maildir storage$q$, $q$Native maildir format storage, with legacy mbox support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Webmail and admin UI$q$, $q$Includes web-based webmail access and administration tools.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$TLS/SSL and SPF$q$, $q$Supports encrypted connections and Sender Policy Framework validation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Authenticated SMTP relay$q$, $q$Supports authenticated relay configurations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Mailing list management$q$, $q$Built-in tools for running mailing lists.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Mail filtering$q$, $q$Includes message filtering capabilities.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$IMAP/POP3 proxy aggregation$q$, $q$Can aggregate multiple backend mail servers behind a single proxy.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$All-in-one mail and groupware stack in a single project$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Free and open source under the GPL$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Runs on most POSIX systems including Linux, BSD, Solaris, and AIX$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Mature, long-standing project$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Development pace has slowed compared to Postfix and Dovecot$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Smaller community and fewer recent updates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Documentation and interface feel dated$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Is Courier MTA free?$q$, $q$Yes, it is licensed under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$What mailbox format does Courier use?$q$, $q$Maildir natively, with legacy mbox support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$What operating systems does Courier support?$q$, $q$Most POSIX-based systems, including Linux, BSD, Solaris, and AIX.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Does Courier include webmail?$q$, $q$Yes, it includes web-based webmail and administration tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$All-in-one self-hosted mail server$q$, $q$Teams wanting a single integrated package instead of combining separate MTA, IMAP, and webmail tools.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$Mailing list hosting$q$, $q$Organizations needing built-in mailing list management alongside regular email.$q$, $q$Organizations running mailing lists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Courier (Courier MTA) is an open-source, integrated mail and groupware server released under the GNU General Public License. It bundles ESMTP, IMAP, POP3, webmail, and calendar/scheduling services into a single framework rather than requiring separate components.$q$, $q$It stores mail natively in maildir format, with legacy mbox support, and can be configured as a mail relay, a domain-specific server, or a hybrid setup. It compiles on most POSIX-based systems, including Linux, BSD, Solaris, and AIX.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators who want one integrated package rather than assembling separate MTA, IMAP, and webmail components.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0165e6b-299a-413e-8603-112e26c2317d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── EmailRelay ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, open-source store-and-forward SMTP server with POP access, built for simple mail relaying.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$E-MailRelay is a free, open-source, lightweight SMTP store-and-forward server with POP access, for simple mail relaying.$q$,
  og_description = $q$E-MailRelay is a free, open-source, lightweight SMTP store-and-forward server with POP access, for simple mail relaying.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '48dce657-93e5-4f57-b7c7-2ec20c859674';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '48dce657-93e5-4f57-b7c7-2ec20c859674' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Single-process architecture$q$, $q$Uses non-blocking I/O for efficient scalability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Smarthost or MX-based routing$q$, $q$Can forward via a fixed smarthost or standard DNS MX lookups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$SpamAssassin integration$q$, $q$Can route messages through SpamAssassin for spam scoring.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$DNSBL blocking$q$, $q$Blocks connections from IPs listed in DNS-based blocklists.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Address verification$q$, $q$Supports verifying recipient addresses before accepting mail.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$SMTP and POP support$q$, $q$Provides SMTP for relaying and POP access to spooled messages, with maildir-based IMAP integration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Policy-free scripting hooks$q$, $q$Custom handling can be implemented via external scripts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Cross-platform$q$, $q$Runs on Unix-like systems and Windows, including as a Windows Service.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Minimal dependencies and easy to install$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Free and open source under the permissive FSFAP license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Cross-platform, running on both Linux and Windows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Lightweight and efficient for simple relay use cases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Not a full-featured mail server; no built-in IMAP server, only maildir/POP access$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Smaller community than major mail transfer agents$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Best suited to relay and store-and-forward roles rather than full mailbox hosting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Is EmailRelay free?$q$, $q$Yes, it is released under the permissive FSFAP license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$What does EmailRelay do?$q$, $q$It is a store-and-forward SMTP server with POP access to spooled messages, commonly used as a simple mail relay.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Does EmailRelay run on Windows?$q$, $q$Yes, including as a Windows Service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Does EmailRelay include spam filtering?$q$, $q$It integrates with SpamAssassin and supports DNSBL-based connection blocking.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Simple SMTP relay$q$, $q$Applications or servers that need to send outbound mail without running a full mail server.$q$, $q$Developers and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$Store-and-forward mail spooling$q$, $q$Environments needing lightweight message queuing with POP retrieval.$q$, $q$Small infrastructure teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$E-MailRelay (EmailRelay) is a lightweight, single-process SMTP store-and-forward mail server with POP access to spooled messages, released under the permissive FSFAP open-source license. It uses non-blocking I/O for scalability, with an architecture similar to servers like Squid and nginx.$q$, $q$It supports smarthost forwarding or DNS MX-based routing, integrates with SpamAssassin, and can block connections via DNSBLs. Its policy-free design allows custom handling to be implemented through external scripts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and system administrators who need a simple, low-dependency relay or forwarding server rather than a full mail stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48dce657-93e5-4f57-b7c7-2ec20c859674', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;


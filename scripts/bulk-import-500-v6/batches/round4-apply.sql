-- Enrichment batch: Feeds Fun, FreshRSS, JARR, Miniflux, NewsBlur, Newspipe, Readflow, RSSHub, Selfoss, Tiny Tiny RSS, TinyFeed, Upvote RSS, bewCloud, Cloudreve, Git Annex, Kinto, OpenCloud, OpenSSH SFTP server, Puter, Samba, Sync-in, Zenko CloudServer, ZOT OCI Registry, bittorrent-tracker, Deluge, PrivyDrop, qBittorrent, Transmission, 015, Chibisafe, Enclosed, goploader, PictShare, ProjectSend, QuickShare, Safebucket, Slink, XBackBone, Apaxy, ClyoCloud, Directory Lister, FileGator, ResourceSpace, Surfer, TagSpaces, Tiny File Manager, 0 A.D., DDraceNetwork, Digibuzzer, Lila, Luanti, Mindustry, MTA:SA, OpenTTD, Red Eclipse 2, Suroi, Veloren, Zero-K, auto-mcs, Calagopus, Crafty Controller, Drop, EasyWI, GameAP, Gameyfin, Lancache, LinuxGSM, Minus Games, Pelican Panel, Pterodactyl, PufferPanel, RomM, SourceBans++, Sunshine, Genea.app, Genealogy, GeneWeb, Gramps Web, webtrees
-- Publishes 79 bulk-imported tool(s) with full editorial content.

-- ── Feeds Fun ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-assisted RSS reader that automatically tags and scores news entries so you only see relevant stories.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Feeds Fun is an open-source RSS reader that uses AI tagging and custom scoring rules to filter feeds. Free hosted instance or self-host via Docker.$q$,
  og_description = $q$Feeds Fun is an open-source RSS reader that uses AI tagging and custom scoring rules to filter feeds. Free hosted instance or self-host via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6e8f44a2-732d-4807-a318-25a5ce7d982d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6e8f44a2-732d-4807-a318-25a5ce7d982d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Automatic AI tagging$q$, $q$Incoming entries are automatically tagged using a connected LLM (OpenAI, Gemini, or compatible endpoints).$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Custom scoring rules$q$, $q$Users write rules that raise or lower an entry's score based on its tags, effectively creating a personalized relevance filter.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Curated source support$q$, $q$Improved handling for major feed sources including Reddit, GitHub, YouTube, arXiv, and Hacker News.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Free hosted instance$q$, $q$A hosted version at feeds.fun is available at no cost, with users supplying their own LLM API key.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Self-hosted Docker deployment$q$, $q$Single-user and multi-user Docker setups are documented for running Feeds Fun on your own infrastructure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Multi-user support$q$, $q$Supports both personal, single-user setups and shared multi-user deployments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Free to self-host or use on the hosted instance$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$AI tagging removes manual folder/category upkeep$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Custom scoring rules give fine-grained control over what surfaces$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Works well with high-volume aggregator sources like Reddit and Hacker News$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Requires a personal LLM API key (OpenAI or Gemini) for tagging to work, which adds an external cost and dependency$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Smaller community and less documentation than mainstream readers like FreshRSS or Miniflux$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$AI tagging quality depends on the chosen LLM provider and prompt tuning$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Is Feeds Fun free?$q$, $q$Yes, the software is open source and free. The hosted instance at feeds.fun is also free to use, though you need to supply your own OpenAI or Gemini API key for AI tagging.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Do I need an OpenAI account to use Feeds Fun?$q$, $q$To get AI-powered tagging and scoring you need an API key from OpenAI, Google Gemini, or another OpenAI/Gemini-compatible provider. The reader itself will still run without one, but the tagging feature depends on it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Can I self-host Feeds Fun?$q$, $q$Yes, Feeds Fun can be deployed via Docker in single-user or multi-user configurations, in addition to the free hosted instance.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Filtering high-volume tech feeds$q$, $q$Automatically tag and rank a large volume of Hacker News, Reddit, and GitHub activity so only the highest-scoring items surface.$q$, $q$Developers and tech enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$Personal research feed$q$, $q$Track arXiv and blog feeds with custom scoring rules tuned to specific research interests.$q$, $q$Researchers and analysts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Feeds Fun is an open-source news reader built around automatic tagging and scoring rather than folders and manual sorting. Every incoming entry is run through a tagging pipeline, and users write scoring rules that boost or bury stories based on the tags they contain, turning a large firehose of feeds into a ranked, filtered stream.$q$, $q$The project pairs a Python backend (distributed as the `ffun` package) with a Vue/TypeScript frontend. A free hosted instance is available at feeds.fun with curated feed collections, and the same software can be self-hosted via Docker in single-user or multi-user configurations.$q$, $q$Tagging and relevance scoring are powered by large language models: Feeds Fun supports OpenAI (ChatGPT) and Google Gemini APIs, as well as other providers through OpenAI-compatible or Gemini-compatible endpoints. Users supply their own API key, and the LLM cost is billed directly by the model provider rather than by Feeds Fun.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$People who follow a high volume of feeds — Reddit, GitHub, YouTube, arXiv, Hacker News, and general RSS/Atom sources — and want automated relevance filtering instead of manually triaging an inbox-style reader.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6e8f44a2-732d-4807-a318-25a5ce7d982d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── FreshRSS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, self-hostable RSS and Atom feed aggregator with search, filters, extensions, and multi-user support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Spanish$q$, $q$German$q$, $q$and 15+ other languages$q$]::text[],
  seo_meta_description = $q$FreshRSS is a free, self-hosted RSS and Atom feed aggregator with search, filters, extensions, and support for large feed collections.$q$,
  og_description = $q$FreshRSS is a free, self-hosted RSS and Atom feed aggregator with search, filters, extensions, and support for large feed collections.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '98aaa86f-78de-4ac7-a8a6-37ad046c4363';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '98aaa86f-78de-4ac7-a8a6-37ad046c4363' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$RSS/Atom aggregation$q$, $q$Follow websites, podcasts, and video channels through standard feed formats in a single reader.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Built-in search and article reader$q$, $q$Full-text search across subscribed feeds and a distraction-free reading view.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Website scraping for feed generation$q$, $q$Generate feeds for sites that don't natively publish RSS/Atom.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Custom filtered feeds$q$, $q$Create saved search feeds based on filter rules across subscriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$OPML import/export$q$, $q$Migrate subscriptions in and out using the standard OPML format.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Extensions and themes$q$, $q$Extend functionality and customize the interface through an extensions ecosystem.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Third-party mobile app support$q$, $q$Google Reader and Fever API compatibility lets FreshRSS work with many existing RSS mobile apps.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Multi-user support$q$, $q$Runs as a shared instance for multiple accounts on one server.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Completely free, open-source, and self-hosted with no account limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Handles very large numbers of feeds and articles efficiently$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Broad mobile app compatibility via Google Reader/Fever API support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Active extension ecosystem and translated into many languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Requires self-hosting; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$No official first-party mobile app — depends on third-party clients$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Initial server setup (PHP, database) needed before use$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Is FreshRSS free?$q$, $q$Yes, FreshRSS is free and open source under the AGPL 3 license. It has no paid tiers; you self-host it on your own server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Does FreshRSS have a mobile app?$q$, $q$There's no single official native app, but FreshRSS supports the Google Reader and Fever APIs, so it works with many third-party RSS mobile apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Can I try FreshRSS before installing it?$q$, $q$A public demo is available at demo.freshrss.org.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Can multiple people use one FreshRSS install?$q$, $q$Yes, FreshRSS supports multiple user accounts on a single self-hosted instance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Personal RSS hub$q$, $q$Consolidate blogs, podcasts, and video channels into a single self-hosted reading list.$q$, $q$Individual self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Shared team/family feed server$q$, $q$Run one FreshRSS instance with multiple user accounts for a household or small team.$q$, $q$Small teams and households$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$Feed generation for non-RSS sites$q$, $q$Scrape websites lacking native RSS to build custom feeds and filtered views.$q$, $q$Power users and developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FreshRSS is a self-hosted feed aggregator for following websites, podcasts, and video channels from RSS and Atom sources in one place. It ships with a built-in article reader, full-text search, and the ability to generate custom feeds by scraping websites that don't publish RSS natively.$q$, $q$The project is licensed under AGPL 3 and is designed to run efficiently even at large scale, with the project stating it can handle over 1 million articles and 50,000 feeds without slowing down. FreshRSS supports OPML import/export, WebSub for near-real-time updates, and a plugin/extension and theming system for customization.$q$, $q$Because FreshRSS exposes API endpoints compatible with the Google Reader and Fever APIs, it works with a large ecosystem of third-party mobile apps rather than requiring an official native client.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters who want full control over their reading data and are comfortable running a lightweight PHP application on their own server, whether for personal use or a small shared/multi-user instance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('98aaa86f-78de-4ac7-a8a6-37ad046c4363', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── JARR ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted RSS/Atom feed aggregator with a three-column reading interface and readability-based article cleanup.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$JARR is a free, self-hosted RSS and Atom feed reader with a three-column interface, feed categorization, and readability-based article cleanup.$q$,
  og_description = $q$JARR is a free, self-hosted RSS and Atom feed reader with a three-column interface, feed categorization, and readability-based article cleanup.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1030679b-2caa-4c26-9774-5521af246bfb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1030679b-2caa-4c26-9774-5521af246bfb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Three-column reading interface$q$, $q$Feeds/categories, article list, and content viewer are shown side by side for fast browsing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Feed categorization$q$, $q$Group feeds into categories with the ability to fold/collapse them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Readability integration$q$, $q$Cleans up poorly formatted article content for a more consistent reading view.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Queued crawler$q$, $q$A crawler with a queue system fetches feed updates designed to scale without heavy resource use.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Mobile-responsive design$q$, $q$Interface adapts for use on phones and tablets.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Free, open-source, and self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Lightweight crawler designed to handle many feeds efficiently$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Readability cleanup improves articles from poorly formatted sources$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Mobile-responsive interface works without a separate app$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Smaller community and less active development than FreshRSS, Miniflux, or Tiny Tiny RSS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Requires manual PostgreSQL/Python setup to self-host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$No official mobile app or hosted service$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Is JARR free?$q$, $q$Yes, JARR is free, open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$What does JARR require to run?$q$, $q$JARR is built on Python 3, Flask, SQLAlchemy, and PostgreSQL, so it requires a server capable of running a Python application with a PostgreSQL database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Does JARR have a mobile app?$q$, $q$There is no dedicated native mobile app; JARR's web interface is mobile-responsive for use on phones and tablets.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$Self-hosted personal feed reader$q$, $q$Run a private RSS/Atom aggregator on your own server with a compact three-column interface.$q$, $q$Individual self-hosters$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$JARR (Just Another RSS Reader) is a self-hosted web application for aggregating RSS and Atom feeds into a single reading interface. It presents subscriptions in a three-column layout — feed/category list, article list, and content view — and supports folding feeds into categories.$q$, $q$The application includes readability-style cleanup to strip poorly formatted article markup and a crawler with a queue system built to fetch large numbers of feeds without excessive resource use. It's built on Python, Flask, SQLAlchemy, and PostgreSQL, with a ReactJS frontend, and has a mobile-responsive layout for phones and tablets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Technically comfortable self-hosters who want a lightweight, self-run alternative to hosted feed readers and are comfortable deploying a Python/PostgreSQL application themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1030679b-2caa-4c26-9774-5521af246bfb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Miniflux ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Minimalist, privacy-focused RSS and Atom feed reader written in Go, self-hostable or available as a low-cost hosted service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Miniflux is a minimalist, privacy-focused RSS reader written in Go. Free and self-hosted, or hosted for $15/year with a 15-day trial.$q$,
  og_description = $q$Miniflux is a minimalist, privacy-focused RSS reader written in Go. Free and self-hosted, or hosted for $15/year with a 15-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '126ce4f2-e1c8-43fc-b77f-37c96ff7806a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '126ce4f2-e1c8-43fc-b77f-37c96ff7806a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Full-article fetching$q$, $q$Automatically retrieves full article content for feeds that only publish summaries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Privacy protections$q$, $q$Strips tracking pixels and URL tracking parameters and proxies media; the project states it collects no telemetry.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Keyboard shortcuts$q$, $q$Navigate and triage articles quickly without touching the mouse.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Single static binary$q$, $q$Simple installation with a static Go binary, Docker image, or RPM/Debian package.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Minimalist reading interface$q$, $q$Deliberately stripped-down UI focused on article content over visual chrome.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Low-cost hosted option$q$, $q$A managed hosted service is available for $15/year with a 15-day free trial for those who don't want to self-host.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Free and open source for self-hosting, with a very low-cost hosted alternative$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Fast, lightweight, and easy to deploy as a single binary or Docker container$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Strong privacy defaults: no telemetry, tracker/pixel stripping, media proxying$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Full-article fetching improves summary-only feeds$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Minimalist interface may feel bare compared to feature-rich readers like Tiny Tiny RSS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$No official native mobile app (relies on third-party or web clients)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Hosted plan is a paid add-on rather than a free managed tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Is Miniflux free?$q$, $q$The self-hosted software is free and open source under the Apache 2.0 license. Miniflux also offers an optional managed hosted service for $15/year with a 15-day trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Who created Miniflux?$q$, $q$Miniflux is developed by Frédéric Guillot, with source code publicly available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Does Miniflux track users?$q$, $q$The project states it removes tracking pixels and URL tracking parameters, proxies media, and does not collect telemetry.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Self-hosted minimalist reading setup$q$, $q$Deploy a lightweight, distraction-free feed reader on your own server using Docker or a static binary.$q$, $q$Self-hosters and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Low-maintenance hosted reading$q$, $q$Use the $15/year hosted plan to get a privacy-respecting reader without managing a server.$q$, $q$Individuals who don't want to self-host$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source access","Docker/binary/package install","No usage limits"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$Hosted$q$, $q$$15/year$q$, $q$yearly$q$, $q$["Managed hosting","15-day free trial","No server maintenance required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Miniflux is a minimalist feed reader written in Go, built by developer Frédéric Guillot around the philosophy that "the content is the most important thing, everything else is just noise." It strips visual clutter in favor of a fast, keyboard-driven reading experience.$q$, $q$The software is free and open source under the Apache 2.0 license, distributed as a single static binary with Docker images and RPM/Debian packages for self-hosting. Miniflux automatically fetches full article content for feeds that only publish summaries, strips tracking pixels and URL tracking parameters, and proxies media to protect reader privacy — the project states it collects no telemetry.$q$, $q$For people who don't want to self-host, Miniflux also offers a managed hosted version priced at $15/year with a 15-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Readers who want a fast, no-frills, privacy-respecting feed reader — either self-hosted for full control, or via the inexpensive hosted plan for those who don't want to run their own server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('126ce4f2-e1c8-43fc-b77f-37c96ff7806a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── NewsBlur ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source RSS reader that trains on your likes and dislikes to filter stories, with free, paid, and self-hosted options.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$NewsBlur is an open-source RSS reader that trains on your likes and dislikes to filter stories. Free plan, paid tiers, and self-hosting available.$q$,
  og_description = $q$NewsBlur is an open-source RSS reader that trains on your likes and dislikes to filter stories. Free plan, paid tiers, and self-hosting available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '70519451-7711-4cb1-9596-53310b5b53d4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '70519451-7711-4cb1-9596-53310b5b53d4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Intelligence Training$q$, $q$Hide or highlight stories to teach NewsBlur which content to surface, without an opaque algorithm.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Story clustering$q$, $q$Groups duplicate coverage of the same story from different sources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Full-text search$q$, $q$Search across subscribed feeds (available on paid plans).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Web feeds and newsletters$q$, $q$Follow sites without native RSS and receive email newsletters inside the reader.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Native mobile apps$q$, $q$Dedicated iOS and Android apps, plus compatibility with third-party RSS clients.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Self-hosting option$q$, $q$Open-source under the MIT license with a documented single-command Docker self-hosting path.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Free tier available with no credit card required for a 30-day premium trial$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Open source (MIT license) with a self-hosting option for full data ownership$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Non-algorithmic training-based filtering keeps user control over what's surfaced$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Native iOS and Android apps plus broad third-party app compatibility$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Free plan is capped at 64 sites, which is limiting for heavy feed followers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Full feature set (search, archive, fast fetching) requires a paid plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Self-hosting requires running your own Docker infrastructure to match hosted service features$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Is NewsBlur free?$q$, $q$Yes, there is a free plan limited to 64 sites. Paid plans (Premium, Premium Archive, Premium Pro) raise site limits and unlock features like search and faster fetching.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$How much does NewsBlur Premium cost?$q$, $q$Premium is $36/year (1,024 sites), Premium Archive is $99/year (4,096 sites plus full archive and AI features), and Premium Pro is $29/month (10,000 sites with 5-15 minute fetching).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Can I self-host NewsBlur?$q$, $q$Yes, NewsBlur is open source under the MIT license and can be self-hosted via Docker with a documented setup process.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Does NewsBlur have mobile apps?$q$, $q$Yes, native apps are available for iOS and Android, and NewsBlur is also compatible with third-party apps like Reeder, ReadKit, and Unread.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Post-Google Reader feed following$q$, $q$Follow blogs and news sites with a trainable reader instead of an algorithmic feed.$q$, $q$Individual news readers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Heavy feed consumption$q$, $q$Use a paid plan to track thousands of sites with full-text search and a story archive.$q$, $q$Power users and researchers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Self-hosted data ownership$q$, $q$Run NewsBlur's open-source Docker deployment to keep reading data entirely on your own infrastructure.$q$, $q$Privacy-conscious self-hosters$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Free$q$, $q$$0$q$, $q$N/A$q$, $q$["64 sites","Basic training"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Premium$q$, $q$$36/year$q$, $q$yearly$q$, $q$["1,024 sites","Full-text search","Text view"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Premium Archive$q$, $q$$99/year$q$, $q$yearly$q$, $q$["4,096 sites","Full story archive","AI features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$Premium Pro$q$, $q$$29/month$q$, $q$monthly$q$, $q$["10,000 sites","5-15 minute fetching","Regex training"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$NewsBlur is a cloud-based feed reader that emerged as one of the well-known alternatives after Google Reader shut down. Beyond standard RSS/Atom feeds, it supports "web feeds" for sites without RSS and email newsletter subscriptions, and it groups duplicate coverage of the same story from multiple sources.$q$, $q$Its signature feature is 'Intelligence Training': users can hide stories they don't like and highlight ones they do, and NewsBlur applies that training to filter future stories — without relying on an opaque algorithmic feed. Native apps exist for iOS and Android, and the reader is also compatible with third-party RSS apps such as Reeder, ReadKit, and Unread.$q$, $q$NewsBlur is open source under the MIT license and can be self-hosted via Docker, giving users the option of full data ownership instead of using the hosted service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Readers who want a trainable, non-algorithmic alternative to hosted readers, from casual users on the free plan to power users who want full-text search, an article archive, and higher feed limits on paid tiers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('70519451-7711-4cb1-9596-53310b5b53d4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Newspipe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted web news aggregator for managing RSS/Atom feeds, bookmarks, and notes with multi-user and API support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Newspipe is a free, self-hosted RSS/Atom news aggregator with bookmarking, notes, multi-user accounts, and an API, built on Flask and SQLAlchemy.$q$,
  og_description = $q$Newspipe is a free, self-hosted RSS/Atom news aggregator with bookmarking, notes, multi-user accounts, and an API, built on Flask and SQLAlchemy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$RSS/Atom aggregation$q$, $q$Aggregates feeds into a self-hosted reading interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Multi-user accounts$q$, $q$Supports multiple independent user accounts on one instance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Programmatic API$q$, $q$Exposes an API for interacting with feeds and articles programmatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Bookmarks and notes$q$, $q$Save bookmarks with personal notes, including import from Pinboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$JSON data export/import$q$, $q$Full data portability through JSON export and import.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$OPML management$q$, $q$Import and export feed subscriptions in OPML format.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Optional LDAP authentication$q$, $q$Can authenticate users against an existing LDAP directory.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Free, open-source, and self-hosted with an active project maintainer$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Combines feed reading with bookmarking and notes in one tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Data portability via JSON export/import and OPML$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Multi-user and LDAP support suit small shared deployments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Requires Python 3.13+ and manual server setup; no official managed hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Smaller community than FreshRSS, Miniflux, or Tiny Tiny RSS$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$No native mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Is Newspipe free?$q$, $q$Yes, Newspipe is free, open-source software under the AGPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Can I self-host Newspipe?$q$, $q$Yes, it's designed to be self-hosted, built on Flask/asyncio/SQLAlchemy with SQLite or PostgreSQL, and deployed via git, Poetry, and npm.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Does Newspipe support multiple users?$q$, $q$Yes, it supports multi-user accounts on a single instance, plus optional LDAP authentication.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$Self-hosted feeds and bookmarks in one tool$q$, $q$Combine RSS reading with bookmark saving and notes on your own server.$q$, $q$Self-hosters and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$API-driven feed workflows$q$, $q$Use Newspipe's API to build custom tooling or automation around feed data.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Newspipe is a self-hosted web news aggregator built by developer Cédric Bonhomme, described in its own README as letting users "own your feeds, your data, and your reading." It's built on Flask, asyncio, and SQLAlchemy, running on Python 3.13+, and can be deployed with either SQLite or PostgreSQL.$q$, $q$Beyond core feed reading, Newspipe supports multi-user accounts, a programmatic API, JSON export/import for data portability, OPML feed management, full-text search, bookmarking with notes, optional LDAP authentication, and detection of inactive feeds. It also supports importing bookmarks from Pinboard. The interface is available in English, French, and German with light and dark themes.$q$, $q$The project is licensed under the GNU Affero General Public License v3 and remains actively maintained, with source hosted on SourceHut (and mirrored on GitHub) and feed fetching handled via scheduled cron jobs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Privacy-focused self-hosters who want a combined feed reader and bookmarking tool with API access, running on their own Python/PostgreSQL or SQLite server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b15c6e92-8bbd-4dfc-b0c2-c40feb9c903a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Readflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted read-it-later and news reader with offline article saving, categorization, and webhook integrations.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Readflow is a free, self-hosted read-it-later and news reader with offline export, categorization, and webhook integrations.$q$,
  og_description = $q$Readflow is a free, self-hosted read-it-later and news reader with offline export, categorization, and webhook integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b8dd75e-cb27-4973-af45-0de6a657268d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b8dd75e-cb27-4973-af45-0de6a657268d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Offline article saving$q$, $q$Save articles for offline reading or export them locally in HTML, PDF, EPUB, or ZIP formats.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Automatic categorization$q$, $q$Classify incoming articles into categories automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Incoming/outgoing webhooks$q$, $q$Integrate with services like RSS, Pocket, Shaarli, Wallabag, and S3-compatible storage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Scripting engine$q$, $q$Customize article processing behavior with scripts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Progressive Web App$q$, $q$App-like mobile experience without a native app store install.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Ad- and tracker-free$q$, $q$The reader operates without ads or trackers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Free, open source, and self-hosted under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Flexible webhook integrations connect it to other self-hosted tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Multiple export formats for offline reading (HTML, PDF, EPUB, ZIP)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$PWA support gives a native-app-like mobile experience without a store listing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Requires self-hosting via Go binary or Docker; no managed hosted plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Smaller community than mainstream RSS readers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$No dedicated native iOS/Android app (PWA only)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Is Readflow free?$q$, $q$Yes, Readflow is free, open-source software licensed under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Is Readflow an RSS reader or a read-it-later app?$q$, $q$It combines both: it can ingest RSS feeds via webhooks and functions as a read-it-later tool with offline saving, categorization, and export.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Does Readflow have a mobile app?$q$, $q$There's no native app store listing; Readflow is a Progressive Web App that provides an app-like mobile experience with push notifications.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Read-it-later with offline export$q$, $q$Save articles from feeds and other sources for offline reading in HTML, PDF, or EPUB.$q$, $q$Individual readers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$Webhook-connected reading pipeline$q$, $q$Route articles between Readflow, Wallabag, Shaarli, Pocket, and S3 storage using webhooks.$q$, $q$Self-hosters and developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Readflow is a read-it-later and news-reading application built by developer Nicolas Carlier, focused on versatility and simplicity. Articles can be saved for offline reading or exported locally in formats like HTML, PDF, EPUB, or ZIP, and organized into categories with automatic classification.$q$, $q$The tool connects to external services through incoming and outgoing webhooks, supporting sources and destinations such as RSS, Pocket, Shaarli, Wallabag, and S3-compatible storage, plus a scripting engine for customizing how articles are processed. It's written in Go and licensed under AGPL-3.0, and can be installed via Go, a precompiled binary, or Docker/Docker Compose.$q$, $q$Readflow is delivered as a Progressive Web App, giving it an app-like experience on mobile without a native app store listing, and it includes push notifications for new articles.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters who want a read-it-later workflow with webhook-based integrations into other tools (Wallabag, Shaarli, Pocket, RSS sources) rather than a traditional folder-based RSS reader.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8dd75e-cb27-4973-af45-0de6a657268d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── RSSHub ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source RSS feed generator that creates feeds for thousands of sites and services that don't natively offer RSS.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$, $q$and other languages$q$]::text[],
  seo_meta_description = $q$RSSHub is an open-source RSS feed generator with pre-configured routes for thousands of sites that don't natively support RSS.$q$,
  og_description = $q$RSSHub is an open-source RSS feed generator with pre-configured routes for thousands of sites that don't natively support RSS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '97ffdc76-9598-495d-a32e-3ec8c21cde65';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '97ffdc76-9598-495d-a32e-3ec8c21cde65' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Thousands of pre-configured routes$q$, $q$Ready-made feed generators for a wide range of sites and services that lack native RSS support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Public instances$q$, $q$Community-run public instances let users try routes without deploying their own server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Self-hosted deployment$q$, $q$Run your own RSSHub instance for reliability, custom routes, and to avoid shared rate limits.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Open API and ecosystem$q$, $q$Documented APIs support integration with feed readers and other tooling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Large contributor community$q$, $q$Over 1,300 contributors maintain and extend the route library.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Free and open source with a very large library of ready-made feed routes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Public instances let you get started without any setup$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Self-hosting option avoids shared rate limits and adds custom routes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Large, active contributor community keeps routes updated$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Public instances can be rate-limited or occasionally unstable, since they're community-run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Some routes depend on third-party site structures and can break when a source site changes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Self-hosting for reliability requires ongoing server maintenance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Is RSSHub free?$q$, $q$Yes, RSSHub is free and open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Do I need to run my own RSSHub server?$q$, $q$No, community-run public instances are available for immediate use, but self-hosting is recommended for more reliable, rate-limit-free access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$What does RSSHub actually generate feeds from?$q$, $q$RSSHub has pre-configured routes for a very large number of sites and services that don't publish RSS natively, converting their content into standard RSS/Atom feeds.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Following non-RSS sources$q$, $q$Generate an RSS feed for a social account, marketplace listing, or site that has no native feed.$q$, $q$Power users and researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$Feed infrastructure for developers$q$, $q$Self-host RSSHub as backend infrastructure feeding other tools or a custom reader.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RSSHub describes itself as "the world's largest RSS network," generating RSS feeds for websites and services that don't natively publish them. It ships with a very large library of pre-configured routes covering social platforms, news sites, video sites, and more, so users can plug a target URL or ID into a route and get a working feed without writing any code.$q$, $q$The project is open source under the AGPL-3.0 license and is community-driven, with the project stating over 1,300 contributors and maintainers actively supporting it. RSSHub can be used through public instances run by the community, or self-hosted for reliability and to avoid rate limits, and it exposes APIs for developers building on top of it.$q$, $q$RSSHub integrates with the broader RSS ecosystem, including feed readers like Folo, which the RSSHub docs describe as an AI RSS reader built for smarter feed discovery.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and power users who want to turn non-RSS sources (social feeds, marketplaces, forums, and more) into standard RSS/Atom feeds for use in any feed reader.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('97ffdc76-9598-495d-a32e-3ec8c21cde65', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Selfoss ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lightweight, self-hosted PHP web application for aggregating RSS feeds and other content sources into one reader.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$and other languages$q$]::text[],
  seo_meta_description = $q$Selfoss is a free, lightweight, self-hosted PHP RSS reader and content aggregator with a plug-in system and RESTful JSON API.$q$,
  og_description = $q$Selfoss is a free, lightweight, self-hosted PHP RSS reader and content aggregator with a plug-in system and RESTful JSON API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c279c42d-acd3-443e-8e69-69c91b4a2455';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c279c42d-acd3-443e-8e69-69c91b4a2455' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Lightweight PHP install$q$, $q$A roughly 25 MB application designed for simple 'upload and run' deployment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Multiple database backends$q$, $q$Works with MySQL, PostgreSQL, or SQLite.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Plug-in system$q$, $q$Extend functionality through plug-ins.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$OPML import$q$, $q$Migrate existing feed subscriptions into Selfoss.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$RESTful JSON API$q$, $q$Programmatic access for building custom clients or integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Responsive interface$q$, $q$Adapts to desktop, tablet, and mobile browsers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Third-party Android app$q$, $q$An Android client is available via F-Droid.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Free, open source, and very lightweight to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Simple deployment on standard PHP hosting with multiple database options$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$RESTful JSON API enables custom clients and integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Third-party Android app available through F-Droid$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$No official native mobile app; Android support comes from a third-party client$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Requires self-managed PHP hosting; no managed cloud option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Interface and feature set are more basic than some full-featured alternatives$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Is Selfoss free?$q$, $q$Yes, Selfoss is free and open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$What databases does Selfoss support?$q$, $q$Selfoss can run on MySQL, PostgreSQL, or SQLite.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Does Selfoss have a mobile app?$q$, $q$There is a third-party Android app available via F-Droid; the web interface is also responsive for mobile browsers.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Lightweight self-hosted aggregator$q$, $q$Deploy a small-footprint PHP feed reader on existing shared or LAMP hosting.$q$, $q$Self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$Custom feed client development$q$, $q$Build a custom reading client against Selfoss's RESTful JSON API.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Selfoss is a self-hosted, PHP-based web application that describes itself as "the ultimate multi-purpose RSS reader, data stream, mash-up, aggregation web application," consolidating RSS feeds and other content sources into a single interface. It's a small, roughly 25 MB install designed to be simple to deploy — the project describes setup as "just upload and run."$q$, $q$It supports MySQL, PostgreSQL, or SQLite as a database backend, includes a plug-in system for extensibility, OPML import for migrating subscriptions, and a RESTful JSON API for building custom clients or integrations. A responsive layout adapts to desktop, tablet, and mobile browsers, and a third-party Android app is available through F-Droid.$q$, $q$Selfoss is free and open source, with source code hosted on GitHub, and is currently at version 2.19.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters looking for a lightweight, easy-to-deploy PHP feed aggregator, especially those already running a standard LAMP-style hosting stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c279c42d-acd3-443e-8e69-69c91b4a2455', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Tiny Tiny RSS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, self-hosted RSS/Atom news aggregator with plugins, filtering, deduplication, and an API, deployed via Docker.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tiny Tiny RSS is a free, self-hosted RSS/Atom news aggregator with plugins, filtering, deduplication, and a JSON API.$q$,
  og_description = $q$Tiny Tiny RSS is a free, self-hosted RSS/Atom news aggregator with plugins, filtering, deduplication, and a JSON API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f00ab228-25cf-4d37-82c5-5df4bbab3062';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f00ab228-25cf-4d37-82c5-5df4bbab3062' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Hierarchical feed organization$q$, $q$Organize subscriptions into folders and subfolders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Article filtering and deduplication$q$, $q$Filter incoming articles and detect duplicates, including perceptual image hashing for visual duplicates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Plugin and theme system$q$, $q$Customize behavior and appearance through plugins and themes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$JSON API$q$, $q$Programmatic access for building integrations and third-party clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Podcast support$q$, $q$Handles podcast feeds alongside standard article feeds.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$OPML import/export$q$, $q$Migrate subscriptions using the standard OPML format.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Keyboard shortcuts$q$, $q$Navigate and manage feeds efficiently without a mouse.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Free, open source (GPLv3), and self-hosted with no account limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Extensive plugin ecosystem and customizable theming$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Robust article filtering and duplicate detection$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$JSON API supports third-party clients and integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Docker is the recommended deployment path, adding setup overhead for non-Docker users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$No official managed hosted service$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Continuous main-branch development model means less traditional versioned releases$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Is Tiny Tiny RSS free?$q$, $q$Yes, Tiny Tiny RSS is free, open-source software under the GNU GPLv3 license, self-hosted on your own server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$What's the recommended way to install Tiny Tiny RSS?$q$, $q$Docker deployment is the recommended and fully supported installation method.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Does Tiny Tiny RSS have an API?$q$, $q$Yes, it provides a JSON API for building integrations and third-party clients.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$Self-hosted feed reader with plugins$q$, $q$Run a customizable, plugin-extensible RSS/Atom reader entirely on your own infrastructure.$q$, $q$Self-hosters and power users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$API-driven feed client development$q$, $q$Build custom or mobile clients against tt-rss's JSON API.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tiny Tiny RSS (tt-rss) is a free, self-hosted web-based news aggregator for reading RSS, Atom, and other feed formats. It's built to let users "control your own data and protect your privacy instead of relying on third party services," and organizes feeds hierarchically into folders and subfolders.$q$, $q$The project supports article filtering and deduplication (including perceptual image hashing to catch visually duplicate posts), podcast feed support, a JSON API for integrations, and a plugin and theme system for customization. It's licensed under GNU GPLv3 and Docker deployment is the recommended and fully supported installation path.$q$, $q$Tiny Tiny RSS follows a continuous development model where the main branch is considered stable, and users are advised to keep their installations reasonably current with recent updates.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters who want a fully-featured, extensible feed reader with folders, filtering, and an API, and who are comfortable running and maintaining a Docker-based service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f00ab228-25cf-4d37-82c5-5df4bbab3062', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── TinyFeed ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A lightweight CLI tool that turns RSS, Atom, and JSON feeds into a single static HTML page.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TinyFeed is a free, open-source CLI tool that turns RSS, Atom, and JSON feeds into a single lightweight static HTML page.$q$,
  og_description = $q$TinyFeed is a free, open-source CLI tool that turns RSS, Atom, and JSON feeds into a single lightweight static HTML page.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd3359f3-5c52-465c-94cd-46d304141c29';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd3359f3-5c52-465c-94cd-46d304141c29' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Multi-format feed parsing$q$, $q$Reads RSS, Atom, and JSON feeds via the gofeed library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Static HTML output$q$, $q$Generates a plain HTML page with no database or backend service required to serve it.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Custom styling$q$, $q$Override the default stylesheet or supply custom templates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Dark/light theme$q$, $q$Automatically matches the visitor's OS-level theme preference.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Scheduled regeneration$q$, $q$Run via cron, systemd timers, OpenRC, or a GitHub Actions workflow to keep the page current.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Docker support$q$, $q$An official container image is available for containerized deployments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Extremely lightweight -- no database or long-running server process required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Free and open source under the MIT license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Flexible deployment options (cron, Docker, systemd, GitHub Pages/Actions)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Simple to theme and customize with custom templates/CSS$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Command-line only -- no built-in web UI for managing feeds$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$No built-in read-state tracking, search, or per-user accounts since it's a static generator, not a full reader$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Requires an external scheduler (cron/systemd/CI) to keep the page up to date$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Is TinyFeed free?$q$, $q$Yes, TinyFeed is open-source software released under the MIT license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Does TinyFeed require a database?$q$, $q$No. It reads a feed list and generates a static HTML file, so there's nothing to install beyond the binary or container image.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Can I style the output page?$q$, $q$Yes, TinyFeed supports custom stylesheets and templates.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$How do I keep the page updated?$q$, $q$Run TinyFeed on a schedule using cron, systemd timers, OpenRC, or a GitHub Actions workflow.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Personal feed dashboard$q$, $q$Aggregate blogs and news feeds into one static page for personal browsing.$q$, $q$Individuals and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$Public status/link page$q$, $q$Publish a curated public feed page, similar to link-aggregator sites, via GitHub Pages.$q$, $q$Developers and communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$TinyFeed is a command-line tool written in Go that fetches a list of RSS, Atom, and JSON feeds and compiles them into one lightweight, static HTML page. Rather than running a server-side reader backed by a database, it produces a plain webpage that can be hosted anywhere -- a cron job, systemd timer, Docker container, or GitHub Actions workflow can regenerate it on a schedule.$q$, $q$It supports custom stylesheets and templates plus a built-in dark/light theme that follows the visitor's system preference, and needs no infrastructure beyond a place to serve a static file.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters and developers who want a minimal, database-free way to follow multiple feeds on one page -- inspired by tools like tinystatus and community link-aggregation pages -- without deploying a full-featured feed reader.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd3359f3-5c52-465c-94cd-46d304141c29', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Upvote RSS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted tool that generates enriched, filterable RSS feeds from Reddit, Hacker News, Lemmy, and more.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Upvote RSS is a free, open-source self-hosted tool that turns Reddit, Hacker News, Lemmy, and other feeds into filtered, enriched RSS with optional AI summaries.$q$,
  og_description = $q$Upvote RSS is a free, open-source self-hosted tool that turns Reddit, Hacker News, Lemmy, and other feeds into filtered, enriched RSS with optional AI summaries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd63cd81e-6805-4383-b257-12cd36fa4b4c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd63cd81e-6805-4383-b257-12cd36fa4b4c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Multi-source support$q$, $q$Pull from Reddit, Hacker News, Lemmy, Lobsters, PieFed, Mbin, and GitHub.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Score and volume filtering$q$, $q$Set minimum upvote thresholds or posts-per-day limits to cut down on noise.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Content enrichment$q$, $q$Embedded media, parsed article previews, and featured images in each feed item.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$AI article summaries$q$, $q$Optional integration with Ollama, OpenAI, Google Gemini, Anthropic, Mistral, or DeepSeek to summarize linked articles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Top comments$q$, $q$Pull in top comments per post, with optional filtering of pinned moderator comments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$NSFW filtering and custom domains$q$, $q$Blur or hide NSFW content and serve feeds from a custom domain.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Caching backends$q$, $q$Filesystem, Redis, or APCu caching for performance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Free, open-source (MIT license), with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Supports many source platforms beyond just Reddit$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Optional AI summaries reduce time spent clicking through to articles$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Quick to self-host via a single Docker command$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Requires self-hosting (Docker or a PHP 8.2+ environment) -- no managed hosted tier confirmed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$AI summary feature requires bringing your own LLM provider/API key$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$No native mobile app -- consumed through a regular feed reader$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$What platforms can Upvote RSS pull from?$q$, $q$Reddit, Hacker News, Lemmy, Lobsters, PieFed, Mbin, and GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Is Upvote RSS free?$q$, $q$Yes, it's open source under the MIT license and free to self-host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Do I need an LLM API key to use it?$q$, $q$Only if you enable the optional AI article summary feature; core feed generation and filtering work without one.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$How do I deploy it?$q$, $q$The recommended method is Docker (ghcr.io/johnwarne/upvote-rss); manual installation requires PHP 8.2 or newer.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Curated tech news feed$q$, $q$Filter Hacker News, Lemmy, or Lobsters posts by score to cut noise in a feed reader.$q$, $q$Developers and tech readers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$Community monitoring$q$, $q$Track high-engagement posts across specific subreddits or GitHub repositories.$q$, $q$Community managers and researchers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Upvote RSS is an open-source, self-hosted application that builds custom RSS feeds from social aggregation sites -- Reddit, Hacker News, Lemmy, Lobsters, PieFed, Mbin, and GitHub. Instead of consuming a platform's raw firehose, users can filter by minimum score, posts-per-day, or search terms, and the generated feed embeds media, article previews, top comments, and estimated reading time.$q$, $q$It also offers optional AI-generated summaries of linked articles through several LLM providers, including Ollama, OpenAI, Google Gemini, Anthropic, Mistral, and DeepSeek.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$People who want more control over noisy link-aggregator feeds -- filtering out low-engagement posts and reading richer previews in their own feed reader -- and who are comfortable self-hosting a small Docker or Node.js/PHP service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d63cd81e-6805-4383-b257-12cd36fa4b4c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── bewCloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A lightweight, open-source personal cloud alternative to Nextcloud/ownCloud, built with TypeScript and Deno.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$bewCloud is a free, open-source personal cloud app (files, notes, photos, calendar, contacts, expenses) built as a lighter alternative to Nextcloud.$q$,
  og_description = $q$bewCloud is a free, open-source personal cloud app (files, notes, photos, calendar, contacts, expenses) built as a lighter alternative to Nextcloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9f2a9ff-f6e9-415b-8ffe-221f389239e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9f2a9ff-f6e9-415b-8ffe-221f389239e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$File storage$q$, $q$Web-based file browser and storage for personal files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Notes$q$, $q$A built-in notes app for quick documents and text.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Photos$q$, $q$Organize and view photo collections.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Calendar$q$, $q$Personal calendar and scheduling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Contacts$q$, $q$Manage personal contacts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$News$q$, $q$A feed reader for following RSS/news content.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Envelopes$q$, $q$A simple budgeting and expense-tracking tool.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Dashboard$q$, $q$A central hub tying all the bundled apps together.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Lighter resource footprint than Nextcloud/ownCloud, aimed at simpler self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Fully open source and free to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Covers common personal-cloud needs -- files, notes, photos, calendar, contacts, expenses -- in one app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Optional managed VPS hosting available for people who don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Smaller plugin/app ecosystem than Nextcloud, which has a much larger third-party app marketplace$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Newer, smaller project with a single primary maintainer$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Managed hosting pricing isn't published on the marketing site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Is bewCloud free?$q$, $q$Yes, the self-hosted version is free and open source; a paid managed VPS hosting option is also offered for those who don't want to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$What apps does bewCloud include?$q$, $q$Files, Notes, Photos, Calendar, Contacts, News, and an expense tracker called Envelopes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$What's it built with?$q$, $q$TypeScript running on the Deno runtime.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Is it a drop-in Nextcloud replacement?$q$, $q$It covers similar core personal-cloud use cases but has a much smaller feature and app set than Nextcloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Personal cloud for a household$q$, $q$Self-host files, photos, calendar, and contacts on your own server.$q$, $q$Privacy-conscious individuals and families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$Simple budgeting alongside file storage$q$, $q$Use Envelopes for expense tracking next to your files and notes.$q$, $q$Self-hosters wanting an all-in-one personal dashboard$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$bewCloud is an open-source personal cloud platform positioned as a simpler, lighter alternative to Nextcloud and ownCloud. Built entirely in TypeScript on Deno, it bundles a set of everyday personal apps -- file storage, notes, photos, calendar, contacts, a news/feed reader, and an expense tracker called Envelopes -- behind a single dashboard.$q$, $q$It's created and maintained by developer Bruno Bernardino, with support from the NLnet Foundation and GitHub Sponsors. The self-hosted software is free; a managed VPS hosting option is also offered for people who'd rather not run their own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and small households who want a self-hosted alternative to Nextcloud/ownCloud with a lighter resource footprint and a smaller, more focused app set, and who are comfortable running a Deno-based server -- or prefer to pay for a managed VPS instead.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9f2a9ff-f6e9-415b-8ffe-221f389239e2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Cloudreve ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted cloud storage system supporting local disk, S3, OneDrive, and other backends behind one web UI.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$Cloudreve is a free, open-source, self-hosted cloud storage system supporting local disk, S3, OneDrive, and other backends via one web interface.$q$,
  og_description = $q$Cloudreve is a free, open-source, self-hosted cloud storage system supporting local disk, S3, OneDrive, and other backends via one web interface.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c0ffef8-0b61-4153-bb6a-0904755b7f86' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Multiple storage backends$q$, $q$Local disk, S3-compatible storage, OneDrive, Aliyun OSS, Tencent COS, Huawei OBS, and Qiniu Kodo.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$WebDAV support$q$, $q$Access any configured storage backend via WebDAV from standard sync clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Direct client-to-storage transfer$q$, $q$Uploads and downloads can bypass the app server to reduce load.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Background downloading$q$, $q$Integrates with Aria2 or qBittorrent for remote/background downloads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Online preview and editing$q$, $q$View and edit documents, images, Markdown, and Office files directly in the browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Compression and batch operations$q$, $q$Compress, extract, and batch-download files and archives.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Multi-user accounts$q$, $q$User groups and permissions for shared or team deployments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Shareable links$q$, $q$Generate share links with expiration controls.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Supports a wide range of storage backends, not just local disk$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Actively developed, GPL v3 open-source license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$WebDAV compatibility makes it usable from standard file-sync clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Docker-based deployment is straightforward$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Admin/setup requires familiarity with Docker and reverse proxy configuration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Primary documentation and community skew heavily Chinese-language, though English docs exist$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$No official native mobile apps -- accessed via web or WebDAV instead$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Is Cloudreve free?$q$, $q$Yes, it is open source under the GPL v3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$What storage backends does it support?$q$, $q$Local disk plus S3-compatible storage, OneDrive, Aliyun OSS, Tencent COS, Huawei OBS, and Qiniu Kodo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Can I access Cloudreve via WebDAV?$q$, $q$Yes, WebDAV is supported across all configured storage backends.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$How is it deployed?$q$, $q$Typically via Docker, with binaries also available for direct installation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Personal cloud drive on your own object storage$q$, $q$Front an S3-compatible bucket with a Drive-like web UI.$q$, $q$Self-hosters and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$Small team file sharing$q$, $q$Multi-user accounts and shareable links for a small organization.$q$, $q$Small teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudreve is an open-source, self-hosted cloud storage and file-sharing system written in Go with a React front end. It lets you run your own 'cloud drive' backed by local disk storage or a range of third-party object storage providers -- including S3-compatible APIs, OneDrive, Aliyun OSS, Tencent COS, Huawei OBS, and Qiniu Kodo -- through one consistent web interface.$q$, $q$It supports direct client-to-storage transfers, WebDAV access, background downloading via Aria2/qBittorrent, and in-browser previews and editing for documents, images, Markdown, and Office files. The project is licensed under GPL v3.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Self-hosters and small teams who want a Google-Drive-like web interface on top of their own storage -- local disk or cloud object storage -- with multi-user support, sharing links, and WebDAV compatibility.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c0ffef8-0b61-4153-bb6a-0904755b7f86', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Git Annex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A free, open-source Git extension for tracking, syncing, and archiving large files without storing content in Git.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$git-annex is a free, open-source Git extension for tracking, syncing, and archiving large files across devices without storing content in Git.$q$,
  og_description = $q$git-annex is a free, open-source Git extension for tracking, syncing, and archiving large files across devices without storing content in Git.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '89ceb22c-3639-45b9-b003-00aa1f289c00';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '89ceb22c-3639-45b9-b003-00aa1f289c00' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Large-file tracking$q$, $q$Track large files in Git without storing their content in the repository itself.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Distributed sync$q$, $q$Sync file content across multiple repositories, drives, and remote services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Special remotes$q$, $q$Store content in many backends, including encrypted cloud storage remotes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Location tracking$q$, $q$Know which of your repositories currently hold a copy of a given file.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Offline archival$q$, $q$Archive and verify large collections with checksum verification, even offline.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$GUI assistant$q$, $q$An optional graphical assistant for users who prefer not to use the command line.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Git-native workflow$q$, $q$Built directly on top of standard Git commands and repositories.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Free and open source, actively maintained$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Works across Linux, macOS, Windows, and Android$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Strong fit for large-file archival where full copies don't need to live everywhere$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Encryption support for untrusted cloud remotes$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Steeper learning curve than plain Git or typical file-sync tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Command-line-first design; the GUI assistant is more limited$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Requires a working understanding of Git concepts to use effectively$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Is git-annex free?$q$, $q$Yes, it's Free Software written in Haskell.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Does it store my files in Git?$q$, $q$No -- Git only tracks pointers and checksums; the actual file content lives in the configured remotes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$What platforms does it support?$q$, $q$Linux, macOS, Windows, and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Can I encrypt files stored in cloud remotes?$q$, $q$Yes, git-annex supports encryption for its special remotes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Research data archival$q$, $q$Version and distribute large datasets across lab machines without bloating Git history.$q$, $q$Researchers and data teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$Personal media archive$q$, $q$Track and sync large photo/video collections across multiple drives and cloud remotes.$q$, $q$Photographers and archivists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$git-annex extends Git to manage large files -- videos, datasets, disk images -- without storing their content directly in the Git repository. Git tracks only symlinks/pointers and checksums, while the actual file content is distributed across multiple repositories, drives, and remote storage services, including encrypted cloud 'special remotes'.$q$, $q$This lets users sync, back up, and archive large collections across many devices while Git tracks which copies exist where. It's Free Software written in Haskell, with a documentation wiki hosted on Branchable.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Researchers, archivists, photographers, and technical users managing large file collections who want Git-like version tracking and distributed syncing without bloating a Git repository with binary content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89ceb22c-3639-45b9-b003-00aa1f289c00', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Kinto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, self-hosted, minimalist JSON document storage service with built-in synchronization and sharing.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kinto is a free, open-source, self-hosted JSON document storage service with built-in synchronization, sharing, and a full REST API.$q$,
  og_description = $q$Kinto is a free, open-source, self-hosted JSON document storage service with built-in synchronization, sharing, and a full REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e5f2b023-ad94-4d73-8138-8c4e2d679679';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e5f2b023-ad94-4d73-8138-8c4e2d679679' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Generic JSON storage$q$, $q$Store JSON documents organized into buckets, collections, and records.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Built-in synchronization$q$, $q$Sync support designed for offline-capable client applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Inheritable permissions$q$, $q$Fine-grained, inheritable permissions for sharing data between users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Full REST API$q$, $q$An HTTP API covers all storage and permission operations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Admin interface and CLI$q$, $q$Tooling for managing data outside of a custom client application.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Client libraries$q$, $q$Libraries available for building sync-aware applications against Kinto.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Free, open-source, and actively maintained with regular releases$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Simple, generic API that's easy to build custom clients against$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Built-in permissions model for sharing data between users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Lightweight compared to running a full custom backend$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Requires developer effort to build a usable client application on top of it -- it's infrastructure, not an end-user app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Smaller community/ecosystem than larger backend-as-a-service platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Documentation assumes familiarity with REST APIs and self-hosting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Is Kinto free?$q$, $q$Yes, it's open-source software, free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$What kind of data does Kinto store?$q$, $q$Generic JSON documents, organized into buckets, collections, and records.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Does Kinto support syncing offline clients?$q$, $q$Yes, synchronization is a core built-in capability.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Is Kinto still maintained?$q$, $q$Yes, the project continues to publish regular releases.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Backend for a sync-capable app$q$, $q$Use Kinto's HTTP API as the storage and sync layer for a custom web or mobile client.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$Shared configuration/data store$q$, $q$Store and share structured JSON data between services with permission controls.$q$, $q$Backend engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kinto is a lightweight, self-hosted backend service for storing and synchronizing JSON documents over HTTP. Data is organized into buckets, collections, and records, with fine-grained, inheritable permissions controlling who can read or write each level.$q$, $q$It exposes a full REST API and is designed to be a simple, generic storage layer that client applications can sync against, rather than a full application in itself. The project continues to receive regular releases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers building applications that need a simple, self-hosted, syncable JSON data store with sharing and permissions, without standing up a full custom backend from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5f2b023-ad94-4d73-8138-8c4e2d679679', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenCloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted file sharing and collaboration platform built by former ownCloud Infinite Scale engineers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2024,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$OpenCloud is an open-source, self-hosted file sharing and collaboration platform built by the original ownCloud Infinite Scale team, focused on GDPR-friendly hosting.$q$,
  og_description = $q$OpenCloud is an open-source, self-hosted file sharing and collaboration platform built by the original ownCloud Infinite Scale team, focused on GDPR-friendly hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c5146704-2de4-4305-9ffc-65de453586a7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c5146704-2de4-4305-9ffc-65de453586a7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Cloud-native file sharing$q$, $q$File storage and sharing with real-time collaboration, built on the OCIS architecture.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Integrated office suite$q$, $q$Edit documents directly in the browser without a separate office application.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Desktop sync client$q$, $q$Native sync clients for Windows, macOS, and Linux.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$iOS and Android apps$q$, $q$Native mobile apps with offline file access and automatic photo backup.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$End-to-end encryption and 2FA$q$, $q$Encryption and two-factor authentication for account and data security.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Secure versioning$q$, $q$File versioning designed to aid recovery from ransomware incidents.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$GDPR-focused, on-premise deployment$q$, $q$Deploy on your own infrastructure to keep data under EU data-sovereignty requirements.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Backed by an experienced team -- the original ownCloud Infinite Scale engineers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Open source with commercial support available for enterprises$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Full platform coverage: web, desktop (Windows/macOS/Linux), iOS, and Android apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Strong focus on data sovereignty and GDPR compliance for EU organizations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$A young project, founded in 2024 and launched in 2025, so its track record is still being established$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Detailed pricing for enterprise/support tiers isn't published openly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Migrating from ownCloud or other platforms requires planning$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Is OpenCloud free?$q$, $q$The core platform is open source (Apache 2.0/AGPL-3.0) and free to self-host; paid enterprise support and SaaS hosting through partners are also offered.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$How is OpenCloud related to ownCloud?$q$, $q$It's built on a fork of ownCloud Infinite Scale, created by engineers who originally developed that product.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Who develops OpenCloud?$q$, $q$OpenCloud GmbH, founded by the Heinlein Group in Berlin in September 2024.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Does OpenCloud have mobile apps?$q$, $q$Yes, native iOS and Android apps are available alongside the web and desktop clients.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Enterprise file sharing with data sovereignty$q$, $q$Self-host OpenCloud on-premise to keep company data under EU/GDPR control.$q$, $q$Businesses and public-sector organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Research collaboration$q$, $q$Share and collaboratively edit files across research teams.$q$, $q$Universities and research institutions$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Community (self-hosted)$q$, $q$Free$q$, $q$N/A$q$, $q$["Open-source core platform","Self-hosted, on-premise deployment","Web, desktop, iOS, and Android clients"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$Enterprise / Support$q$, $q$Contact for pricing$q$, NULL, $q$["Commercial support","SaaS hosting via partners","Enterprise features and SLAs"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenCloud is an open-source file sharing and collaboration platform built on a fork of ownCloud Infinite Scale (OCIS). It was created by OpenCloud GmbH, founded in September 2024 by the Berlin-based Heinlein Group, after roughly 15 engineers who originally built the Go-based ownCloud Infinite Scale rewrite left to continue the project independently.$q$, $q$OpenCloud is published under the Apache 2.0 and AGPL-3.0 licenses and can be self-hosted on-premise or accessed through SaaS partners, with a commercial support/subscription option for organizations that need it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Businesses, public-sector organizations, educational institutions, and research/science organizations that want a self-hosted, GDPR-compliant file-sharing platform with digital-sovereignty guarantees, backed by a commercial support option.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c5146704-2de4-4305-9ffc-65de453586a7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OpenSSH SFTP server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$The sftp-server component of OpenSSH, providing secure file transfer over SSH on virtually every platform.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenSSH's sftp-server provides free, open-source, encrypted SFTP file transfer as a built-in subsystem of sshd on Linux, macOS, BSD, and Windows.$q$,
  og_description = $q$OpenSSH's sftp-server provides free, open-source, encrypted SFTP file transfer as a built-in subsystem of sshd on Linux, macOS, BSD, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Encrypted file transfer$q$, $q$Secure file transfer over an already-encrypted SSH connection.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Runs as an sshd subsystem$q$, $q$No separate daemon or additional network port is required.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Chroot support$q$, $q$Restrict specific users to a directory using ChrootDirectory.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Fine-grained access control$q$, $q$Control permissions and forced commands per user via sshd_config.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Cross-platform availability$q$, $q$Native on OpenBSD, with portable builds for Linux, macOS, and Windows (Win32-OpenSSH).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Logging and auditing$q$, $q$File transfer activity is logged through sshd.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Free and open source under a permissive BSD-style license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Ships by default or is readily available on nearly every major OS, including Windows 10 and later$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$No separate protocol or port to open -- uses the same encrypted channel as SSH$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Mature, heavily audited codebase maintained by the OpenBSD project$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Configuration is done via text files (sshd_config), with no built-in web UI$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Chroot/jail setup for restricted users can be fiddly to configure correctly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Feature set is deliberately minimal compared to dedicated managed-file-transfer products$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Is the OpenSSH SFTP server free?$q$, $q$Yes, OpenSSH is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Do I need a separate FTP server to use SFTP?$q$, $q$No, sftp-server runs as a subsystem of sshd, the same daemon that handles SSH logins.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$What platforms does it run on?$q$, $q$OpenBSD natively, plus portable builds for Linux, macOS, and Windows (Win32-OpenSSH).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Can I restrict a user to only SFTP with no shell access?$q$, $q$Yes, via sshd_config options such as ForceCommand and ChrootDirectory.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Secure file uploads for a web server$q$, $q$Allow deploy or content users encrypted file transfer without shell access.$q$, $q$Sysadmins and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$Server-to-server backups$q$, $q$Transfer backup archives securely between machines.$q$, $q$Infrastructure teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenSSH is a free, open-source implementation of the SSH protocol suite developed by the OpenBSD project since 1999. Among its components is sftp-server, the server-side process that implements the SFTP (SSH File Transfer Protocol) subsystem, allowing clients to securely browse, upload, download, and manage files over an encrypted SSH connection.$q$, $q$It runs as a subsystem of sshd and requires no separate FTP daemon or unencrypted file-transfer protocol -- file transfer rides on the same encrypted channel used for SSH logins.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators and self-hosters who need secure, encrypted file transfer to a Linux, BSD, macOS, or Windows server without deploying a separate FTP/FTPS service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e5f6c77-3f3a-46b6-8db5-4bd0f9c1c6a9', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Puter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, self-hostable 'internet OS' offering cloud storage, built-in apps, and an AI API in one platform.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Puter is an open-source, self-hostable internet OS offering cloud storage, built-in apps, and an AI API (Puter.js) with a free hosted tier.$q$,
  og_description = $q$Puter is an open-source, self-hostable internet OS offering cloud storage, built-in apps, and an AI API (Puter.js) with a free hosted tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd43ef06f-bad4-42e0-8b7a-9c651d64b167';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd43ef06f-bad4-42e0-8b7a-9c651d64b167' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Web-based desktop environment$q$, $q$Built-in apps such as Notepad, Voice Recorder, Camera, Music Player, and Spreadsheet.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Puter.js developer library$q$, $q$Add cloud storage, a database, and serverless workers to any web app without running your own backend.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$AI Gateway$q$, $q$A single API for chat, text-to-image, image-to-text, text-to-speech, and text-to-video across 500+ models.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$App Store$q$, $q$Developers can publish apps built on Puter and reach its user base.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Self-hosting options$q$, $q$One-line install scripts for Linux/macOS/Windows, or run from the open-source repository.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$User-pays resource model$q$, $q$End users cover their own storage and AI usage, so developers aren't billed for infrastructure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Open source (AGPL-3.0) with a genuine self-hosting path, not just a hosted SaaS$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Free tier available on the hosted puter.com service$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$AI Gateway gives developers access to many models through one simple API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Active project with a large GitHub community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$The user-pays AI/storage model means costs can vary per end user rather than being fixed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$As a broad, multi-purpose platform, some built-in apps are more polished than others$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Self-hosting the full platform requires running a Node.js-based server stack$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Is Puter free?$q$, $q$The hosted version at puter.com has a free tier, and the self-hosted, open-source version is free to run under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Can I self-host Puter?$q$, $q$Yes, via a one-line install script for Linux/macOS/Windows or by cloning and running the open-source repository.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$What is Puter.js?$q$, $q$A JavaScript library that lets developers add cloud storage, a database, serverless workers, and AI capabilities to any web app without managing backend infrastructure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$How does Puter charge for AI usage?$q$, $q$Through a user-pays model -- each authenticated user covers their own AI and storage usage from their Puter account allowance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Personal web-based desktop$q$, $q$Self-host Puter as a private, browser-accessible file and app environment.$q$, $q$Self-hosters and privacy-conscious users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Backend-free app development$q$, $q$Use Puter.js for storage, database, and AI without standing up your own servers.$q$, $q$Frontend and indie developers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Free (hosted)$q$, $q$Free$q$, $q$Monthly allowance$q$, $q$["Cloud storage and apps on puter.com","Free monthly AI/storage allowance","Access to built-in apps and the App Store"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Open-source AGPL-3.0 codebase","Run on your own infrastructure","Full control over storage and AI provider configuration"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Puter is an open-source, self-hostable platform described by its creators as an advanced internet computer -- combining cloud file storage, a desktop-like web interface, built-in apps (Notepad, Voice Recorder, Camera, Music Player, Spreadsheet, and more), and a developer backend called Puter.js that offers cloud storage, a key-value database, serverless workers, and an AI Gateway with access to over 500 AI models.$q$, $q$It's maintained by Puter Technologies Inc. under the AGPL-3.0 license and can be used at puter.com or self-hosted via a one-line install script or by running the open-source code directly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers who want a free backend -- storage, database, AI -- for building web apps without managing their own infrastructure, and self-hosters who want a browser-based personal desktop for files and apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d43ef06f-bad4-42e0-8b7a-9c651d64b167', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Samba ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source implementation of the SMB and Active Directory protocols for file and print sharing on Linux/Unix.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1992,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Samba is a free, open-source implementation of the SMB and Active Directory protocols, enabling Linux/Unix servers to share files with Windows clients.$q$,
  og_description = $q$Samba is a free, open-source implementation of the SMB and Active Directory protocols, enabling Linux/Unix servers to share files with Windows clients.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '592933ba-3f90-4b7b-9d93-73fb6b1fd373';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '592933ba-3f90-4b7b-9d93-73fb6b1fd373' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$SMB/CIFS file and print sharing$q$, $q$Share files and printers between Linux/Unix and Windows clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Active Directory roles$q$, $q$Operate as an AD Domain Controller or as a domain member server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$LDAP and Kerberos authentication$q$, $q$Integrate with standard directory and authentication protocols.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Cluster filesystem support$q$, $q$High-performance distributed filesystem support for large deployments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Access control$q$, $q$Fine-grained share-level and file-level permissions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Broad interoperability$q$, $q$Used as the interoperability layer inside cloud PaaS and software-defined storage products.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Free and open source under the GPL, with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Mature, battle-tested software with decades of production use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Full Active Directory domain controller capability, not just file sharing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Backed by an active community and dedicated funding sources, including the Software Freedom Conservancy and Sovereign Tech Fund$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Configuration (smb.conf) is text-based with a learning curve for AD/domain setups$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Runs on Linux/Unix -- it isn't a Windows-native product, and administration differs from native AD tooling$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Large deployments involving clustering or complex AD topologies require significant Samba-specific expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Is Samba free?$q$, $q$Yes, it's free software distributed under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Can Samba act as an Active Directory domain controller?$q$, $q$Yes, it supports both AD Domain Controller and member server roles.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$What platforms does Samba run on?$q$, $q$Linux and other Unix-like systems, providing interoperability with SMB protocol clients such as Windows.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Who maintains Samba?$q$, $q$An active worldwide open-source community; the project is part of the Software Freedom Conservancy and receives support from the Sovereign Tech Fund.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Cross-platform file server$q$, $q$Share files and printers between Linux servers and Windows desktops.$q$, $q$IT admins and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$Active Directory replacement$q$, $q$Run Samba as a domain controller without a Windows Server license.$q$, $q$System administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Samba is a free, open-source suite that implements the SMB/CIFS networking protocol and Active Directory services, letting Linux and Unix systems share files and printers with Windows clients and integrate into Windows domains. Originally created by Andrew Tridgell in 1992, it can act as a file/print server, a domain controller, or a member server, and supports authentication via LDAP and Kerberos.$q$, $q$Samba is distributed under the GNU General Public License and developed by a worldwide community. It's a member project of the Software Freedom Conservancy and receives funding support from the Sovereign Tech Fund.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$System administrators who need Linux/Unix servers to share files and printers with Windows machines, or who need to run or join an Active Directory domain without a Windows Server license.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('592933ba-3f90-4b7b-9d93-73fb6b1fd373', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Sync-in ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source platform for file storage, sharing, synchronization, and real-time document collaboration.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Sync-in is an open-source, self-hosted platform for file storage, sync, sharing, and real-time document collaboration.$q$,
  og_description = $q$Sync-in is an open-source, self-hosted platform for file storage, sync, sharing, and real-time document collaboration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '89b689d1-3d07-4577-bcb7-a18bdd8ce661' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Collaborative document editing$q$, $q$Real-time co-editing of Office and PDF documents via Collabora Online, OnlyOffice, or Euro-Office integrations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Desktop and CLI sync clients$q$, $q$Native synchronization clients for Windows, macOS, and Linux keep local folders in sync with the server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$WebDAV support$q$, $q$Mount Sync-in storage as a network drive in file explorers, mobile apps, and third-party WebDAV clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Spaces and guest access$q$, $q$Structured team spaces with granular access controls, plus restricted guest accounts for external collaborators.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Full-text search$q$, $q$Search across Office documents, PDFs, and other file formats stored on the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Modern authentication$q$, $q$Supports local accounts, OIDC, LDAP, multi-factor authentication, recovery codes, and application passwords.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Fully open source under AGPL-3.0 with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Self-hosted via Docker, giving organizations full data control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Built-in real-time office document collaboration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Flexible authentication (LDAP, OIDC, MFA) suited to enterprise and public-sector environments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Younger project (public release in 2025) with a smaller community than established alternatives like Nextcloud$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Requires self-hosting expertise; no official managed SaaS offering advertised on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Document co-editing depends on separately deployed Collabora/OnlyOffice servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Is Sync-in free to use?$q$, $q$Yes, Sync-in's server software is free and open source (AGPL-3.0). Enterprise support options are offered separately by the project.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Can I self-host Sync-in?$q$, $q$Yes, Sync-in is designed to be self-hosted and is distributed as Docker images for on-premise or private-cloud deployment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Does Sync-in support real-time document editing?$q$, $q$Yes, it integrates with Collabora Online, OnlyOffice, or Euro-Office for collaborative editing of Office and PDF documents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$What platforms are supported?$q$, $q$Sync-in offers a web interface plus desktop sync clients for Windows, macOS, and Linux, and it supports WebDAV for mounting as a network drive.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Sovereign file storage for the public sector$q$, $q$Government and municipal organizations self-host Sync-in to keep sensitive documents on infrastructure they control.$q$, $q$Public sector IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$Client document collaboration for professional firms$q$, $q$Legal and engineering firms use guest access and spaces to share and co-edit documents with external clients under controlled permissions.$q$, $q$Legal and engineering firms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Sync-in is an open-source, self-hosted platform for file storage, sharing, synchronization, and collaborative document editing, positioned as a sovereign alternative to commercial cloud storage and to other self-hosted suites like Nextcloud.$q$, $q$It integrates with Collabora Online, OnlyOffice, and Euro-Office for real-time in-browser document editing, and offers desktop sync clients for Windows, macOS, and Linux alongside WebDAV support for mounting storage as a network drive. The server component is licensed under AGPL-3.0 and distributed as Docker images.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Sync-in targets organizations that need to keep control of their data, including public-sector bodies, legal and engineering firms, NGOs, and IT teams running distributed or multi-site environments who want an auditable, self-managed alternative to Dropbox, Google Drive, or Nextcloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89b689d1-3d07-4577-bcb7-a18bdd8ce661', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zenko CloudServer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Amazon S3-compatible object storage server you can self-host on-premises or in Docker.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Zenko CloudServer is a free, open-source object storage server offering Amazon S3 API compatibility for self-hosted deployments.$q$,
  og_description = $q$Zenko CloudServer is a free, open-source object storage server offering Amazon S3 API compatibility for self-hosted deployments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '38a2e613-81b8-4dd1-a50b-c900db574bb3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '38a2e613-81b8-4dd1-a50b-c900db574bb3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Amazon S3 API compatibility$q$, $q$Implements the S3 API so existing S3 SDKs, CLI tools, and applications work against a self-hosted backend without code changes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Multi-cloud backend support$q$, $q$Can be configured to use AWS S3, Azure Blob Storage, Google Cloud Storage, or local storage as underlying backends.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Docker deployment$q$, $q$Ships as a Docker image, allowing a working S3-compatible server to be running within minutes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Raw object storage$q$, $q$Stores uploaded data without post-processing such as compression or splitting, keeping it directly readable.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Language SDK support$q$, $q$Works with existing S3 SDKs for Python, Java, Node.js, and .NET.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Free and open source under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Drop-in compatibility with existing S3 tooling and SDKs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Fast to deploy via Docker$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Can bridge multiple cloud storage backends behind one API$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Requires self-hosting and operational management (backups, scaling, security)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Advanced multi-site replication and management features are tied to Scality's broader Zenko/RING ecosystem$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Documentation and community activity are smaller than major cloud storage providers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Is Zenko CloudServer free?$q$, $q$Yes, CloudServer is open-source software released under the Apache License 2.0 and is free to download and self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Is it compatible with the Amazon S3 API?$q$, $q$Yes, CloudServer implements the S3 API, so applications and SDKs written for S3 can point at a self-hosted CloudServer instance instead.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$How is it deployed?$q$, $q$CloudServer is distributed as a Docker image and can also be run directly with Node.js.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Who maintains it?$q$, $q$CloudServer is developed by Scality as part of its Zenko multi-cloud data controller project and is available on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$Local S3 development environment$q$, $q$Developers run CloudServer locally in Docker to test S3-dependent application code without touching a live AWS account.$q$, $q$Application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$On-premises S3-compatible storage$q$, $q$Enterprises deploy CloudServer on their own infrastructure to get S3 API compatibility while keeping data in-house.$q$, $q$Enterprise infrastructure teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Zenko CloudServer is an open-source object storage server, developed by Scality, that implements the Amazon S3 API. It lets developers run S3-compatible storage on their own infrastructure and use existing S3 tooling and SDKs without changing application code.$q$, $q$CloudServer stores objects in their raw form without additional compression or splitting, so data placed in it remains readable through standard cloud storage browsers and S3 client tools. It is distributed under the Apache License 2.0 and can be deployed in minutes as a Docker container.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$CloudServer suits developers building or testing S3-based applications locally, and organizations that want on-premises object storage compatible with the S3 API to avoid cloud vendor lock-in or to bridge multiple storage backends behind a single API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('38a2e613-81b8-4dd1-a50b-c900db574bb3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── ZOT OCI Registry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, vendor-neutral OCI-compliant container image and artifact registry built in Go.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Zot is a free, open-source, vendor-neutral OCI-compliant container registry built in Go for self-hosted deployments.$q$,
  og_description = $q$Zot is a free, open-source, vendor-neutral OCI-compliant container registry built in Go for self-hosted deployments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$OCI distribution spec compliance$q$, $q$Implements the OCI distribution specification for storing and serving container images and artifacts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Vendor-neutral registry$q$, $q$Not tied to any single cloud provider, giving teams a portable self-hosted registry.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Kubernetes and Helm support$q$, $q$Designed to deploy into Kubernetes environments and integrate with Helm-based workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Scale-out deployment$q$, $q$Built for production use cases that require scaling the registry horizontally.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Security scorecard tracking$q$, $q$Maintains public security posture indicators such as OpenSSF Scorecard and CII Best Practices badges.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Free and open source under Apache-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Standards-based OCI distribution spec compliance for broad tool compatibility$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Lightweight, single Go binary makes deployment simple$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Actively maintained with public security posture tracking$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Requires self-hosting and operational management like any self-run registry$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Smaller ecosystem and community compared to registries like Docker Hub or Harbor$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Advanced feature availability depends on keeping up with frequent releases$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Is Zot free to use?$q$, $q$Yes, Zot is open-source software released under the Apache-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Is Zot compatible with Docker and OCI tooling?$q$, $q$Yes, it implements the OCI distribution specification, making it compatible with standard OCI/Docker registry clients.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$How is Zot typically deployed?$q$, $q$Zot is commonly deployed via Kubernetes and Helm, or run as a standalone Go binary, for self-hosted use.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$What language is Zot written in?$q$, $q$Zot is written primarily in Go.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Self-hosted Kubernetes image registry$q$, $q$Platform teams run Zot inside their clusters via Helm as an internal, vendor-neutral container registry.$q$, $q$Platform and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$Vendor-neutral artifact storage$q$, $q$Teams store OCI artifacts (not just container images) in Zot to avoid dependence on a single cloud registry provider.$q$, $q$Cloud-native infrastructure teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Zot is a production-ready, vendor-neutral OCI (Open Container Initiative) image registry. It stores container images and artifacts in the OCI image format and communicates using the OCI distribution specification, so it works as a drop-in replacement wherever a standard OCI/Docker registry is expected.$q$, $q$The project is written in Go and released under the Apache-2.0 license. It is commonly deployed via Kubernetes and Helm as a self-hosted, scale-out registry for storing container images and other OCI artifacts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Zot is aimed at platform and DevOps teams who need a lightweight, standards-compliant container registry they can self-host, integrate into Kubernetes clusters, and run at scale without depending on a proprietary registry vendor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11d0b0ec-f3a5-4cf0-b06c-e3d9fd102172', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── bittorrent-tracker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Node.js BitTorrent tracker implementation with HTTP, UDP, and WebSocket server and client support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$bittorrent-tracker is a free, open-source Node.js BitTorrent tracker server and client supporting HTTP, UDP, and WebSocket.$q$,
  og_description = $q$bittorrent-tracker is a free, open-source Node.js BitTorrent tracker server and client supporting HTTP, UDP, and WebSocket.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2656ef1b-64da-4cfd-a088-8db929a97a0a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2656ef1b-64da-4cfd-a088-8db929a97a0a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$HTTP, UDP, and WebSocket tracker support$q$, $q$Runs multiple tracker protocols simultaneously, including BEP 15 UDP trackers and WebTorrent-style WebSocket trackers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Command-line tracker server$q$, $q$Can be launched instantly from the CLI with `bittorrent-tracker`, starting HTTP, UDP, and WS servers together.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Programmatic client and server API$q$, $q$Exposes a JavaScript API for embedding tracker client or server logic directly into Node.js applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$IPv4 and IPv6 support$q$, $q$Handles peer announcements and scraping over both IP versions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Built-in stats endpoint$q$, $q$Serves tracker statistics via a web page at /stats or as JSON at /stats.json.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Simple to self-host as a standalone tracker via a single CLI command$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Supports the full range of modern tracker protocols (HTTP/UDP/WebSocket)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Actively maintained and used by well-known projects like WebTorrent$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$It is a developer library/CLI tool, not a hosted service or GUI application$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Requires Node.js and command-line familiarity to deploy$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$No built-in web dashboard beyond basic stats reporting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Is bittorrent-tracker free?$q$, $q$Yes, it is open-source software released under the MIT license and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Can I self-host my own BitTorrent tracker with this?$q$, $q$Yes, installing it via npm and running the `bittorrent-tracker` command starts a self-hosted tracker server supporting HTTP, UDP, and WebSocket protocols.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Who maintains this project?$q$, $q$It is maintained by Feross Aboukhadijeh and WebTorrent, LLC, and is used as the tracker implementation behind WebTorrent.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Does it support WebTorrent (browser-based) peers?$q$, $q$Yes, it includes a WebSocket tracker server compatible with WebTorrent's browser-based peer connections.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$Private torrent swarm tracking$q$, $q$Developers run their own tracker instance to coordinate peers for a private or custom torrent distribution.$q$, $q$Developers running P2P file distribution$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$WebTorrent application backend$q$, $q$Web apps built on WebTorrent use this tracker to enable browser-to-browser peer discovery over WebSockets.$q$, $q$Web developers building P2P browser apps$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$bittorrent-tracker is an open-source Node.js implementation of a BitTorrent tracker, providing both client and server code. A BitTorrent tracker is a service that BitTorrent clients report to and query for peer lists, helping peers find each other within a swarm.$q$, $q$The package supports HTTP trackers, UDP trackers (BEP 15), and WebTorrent-compatible WebSocket trackers, over both IPv4 and IPv6. It can be installed globally via npm and run as a standalone self-hosted tracker server from the command line, or embedded programmatically in a Node.js application. It is maintained by Feross Aboukhadijeh and WebTorrent, LLC under the MIT license, and is used by clients such as WebTorrent and peerflix.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$This project is for developers who need to run their own BitTorrent or WebTorrent tracker infrastructure, such as for private torrent swarms, WebTorrent-based applications, or peer discovery in custom P2P tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2656ef1b-64da-4cfd-a088-8db929a97a0a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Deluge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, cross-platform BitTorrent client with a client-server architecture and web, GTK, and console interfaces.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Deluge is a free, open-source, cross-platform BitTorrent client with headless daemon mode, web UI, and a plugin system.$q$,
  og_description = $q$Deluge is a free, open-source, cross-platform BitTorrent client with headless daemon mode, web UI, and a plugin system.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a4888a56-3678-4b59-b919-440fd6bf1847';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a4888a56-3678-4b59-b919-440fd6bf1847' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Client-server architecture$q$, $q$Runs the download daemon separately from the interface, enabling remote control of a headless server instance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Multiple interfaces$q$, $q$Offers GTK desktop, web-based, and console (text) interfaces to the same underlying daemon.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Plugin system$q$, $q$Extends functionality through community-developed plugins covering scheduling, notifications, label management, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$libtorrent-based engine$q$, $q$Uses the libtorrent C++ library for efficient, protocol-compliant BitTorrent networking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Cross-platform support$q$, $q$Runs on Linux, Windows, and macOS.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Runs headlessly with a web UI, well-suited to servers and NAS devices$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Plugin ecosystem for extending core functionality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Lightweight resource usage$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Interface feels dated compared to some newer BitTorrent clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Plugin quality and maintenance vary by plugin author$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Setting up the daemon/remote UI split requires more configuration than a simple desktop client$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Is Deluge free?$q$, $q$Yes, Deluge is free, open-source software licensed under GPL-3.0-or-later.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Can Deluge run headless on a server?$q$, $q$Yes, Deluge's client-server architecture lets the daemon run headlessly on a server or NAS while being controlled via the web UI or a remote GTK client.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$What platforms does Deluge support?$q$, $q$Deluge runs on Linux, Windows, and macOS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Does Deluge support plugins?$q$, $q$Yes, most advanced features are delivered via a plugin system that extends the core client.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Always-on home server torrenting$q$, $q$Users run the Deluge daemon on a NAS or home server and manage downloads remotely through the web interface.$q$, $q$Home server and NAS users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$Seedbox torrent management$q$, $q$Users deploy Deluge on a remote seedbox for continuous seeding and downloading independent of a local machine.$q$, $q$Seedbox operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Deluge is a free and open-source, cross-platform BitTorrent client written in Python, using libtorrent for its core networking logic. Since version 1.0 it has used a client-server (daemon) architecture, letting the download engine run headless on one machine while being controlled remotely through a GTK desktop interface, a web UI, or a console interface.$q$, $q$Most of Deluge's advanced functionality is delivered through a plugin system, which developers have used to extend the client with features beyond the base install. It is released under the GPL-3.0-or-later license and is commonly self-hosted on NAS devices, servers, and seedboxes for always-on downloading.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Deluge suits users who want a lightweight, headless BitTorrent client they can run on a home server, NAS, or seedbox and control remotely through a web browser, rather than a client tied to a single desktop session.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4888a56-3678-4b59-b919-440fd6bf1847', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── PrivyDrop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, browser-based peer-to-peer file and clipboard sharing tool built on WebRTC, with no size limits or sign-up.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$, $q$Spanish$q$, $q$Japanese$q$, $q$German$q$, $q$French$q$, $q$Korean$q$]::text[],
  seo_meta_description = $q$PrivyDrop is a free, open-source, browser-based peer-to-peer file and clipboard sharing tool built on WebRTC.$q$,
  og_description = $q$PrivyDrop is a free, open-source, browser-based peer-to-peer file and clipboard sharing tool built on WebRTC.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7cb48bdf-2a61-44e4-8397-27e42d5d763d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7cb48bdf-2a61-44e4-8397-27e42d5d763d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Peer-to-peer WebRTC transfer$q$, $q$Sends files and text directly between browsers using WebRTC rather than storing data on a central server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$No registration required$q$, $q$Users can create and join a transfer room instantly without an account.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Resumable transfers$q$, $q$Interrupted transfers can resume from where they left off instead of restarting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Multi-receiver rooms$q$, $q$A single share can be picked up by multiple receivers connected to the same room.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Rich text clipboard sharing$q$, $q$Shares formatted text/clipboard content alongside files, not just raw files.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Self-hostable via Docker$q$, $q$Can be deployed on your own server with a single-command Docker setup, including automatic HTTPS via Let's Encrypt.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$No account, file-size limits, or speed limits advertised$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Direct peer-to-peer transfer avoids storing files on a third-party server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Self-hostable for full control over the deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Peer-to-peer transfer requires both sender and receiver to be online simultaneously$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Relies on browser WebRTC support and network conditions (NAT/firewall) that can affect connectivity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Smaller community/track record compared to established file-transfer tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Is PrivyDrop free?$q$, $q$Yes, PrivyDrop is free to use and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Do I need to create an account?$q$, $q$No, PrivyDrop does not require registration to send or receive files and text.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$How does PrivyDrop transfer files?$q$, $q$It uses WebRTC to send data directly between browsers peer-to-peer, rather than uploading files to a central server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Can I self-host PrivyDrop?$q$, $q$Yes, it can be self-hosted via Docker, including configurations for public domains with automatic HTTPS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Quick cross-device file transfer$q$, $q$Users move photos, documents, or clipboard text between their own devices without cables or cloud uploads.$q$, $q$Individuals moving files between devices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$Private ad-hoc sharing with others$q$, $q$Users share a room link or QR code to send files directly to another person without either party creating an account.$q$, $q$People sharing files privately with others$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PrivyDrop is an open-source, privacy-focused peer-to-peer file and text-clipboard sharing tool that transfers data directly between browsers using WebRTC, without routing file contents through a central server. It works as an AirDrop-style tool that works across any device with a browser, not just Apple hardware.$q$, $q$It requires no registration and has no advertised file size or speed limits. Transfers can resume after interruption, and rooms can be shared via link or QR code with support for multiple simultaneous receivers and folder transfers. The project is MIT licensed, with a frontend built on Next.js, React, and TypeScript and a Node.js/Express backend using Redis and Socket.IO for signaling; it can be self-hosted via Docker.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$PrivyDrop is aimed at users who want a quick, private way to move files or text between devices or with other people without creating an account, uploading to a third-party cloud, or dealing with file-size caps, and at self-hosters who want to run their own instance for full control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7cb48bdf-2a61-44e4-8397-27e42d5d763d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── qBittorrent ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, cross-platform BitTorrent client with a built-in web UI, RSS reader, and torrent search.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$qBittorrent is a free, open-source, cross-platform BitTorrent client with a web UI, RSS reader, and built-in torrent search.$q$,
  og_description = $q$qBittorrent is a free, open-source, cross-platform BitTorrent client with a web UI, RSS reader, and built-in torrent search.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7196ce6f-7454-4ae5-8a10-7ac77752c856';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7196ce6f-7454-4ae5-8a10-7ac77752c856' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Web UI for remote control$q$, $q$Manage torrents remotely through a secure browser-based interface, suited to headless server installs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Integrated RSS reader$q$, $q$Subscribes to RSS feeds and applies automatic download filters to fetch new torrents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Built-in torrent search$q$, $q$Searches across multiple torrent sites simultaneously using installable Python-based search plugins.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Bandwidth scheduling$q$, $q$Sets time-based upload/download speed limits to manage network usage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Sequential downloading$q$, $q$Downloads torrent pieces in order to enable approximate media streaming while the torrent is still downloading.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Torrent queuing and prioritization$q$, $q$Controls the order and priority in which multiple torrents and their files download.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Completely free and open source with no ads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Full-featured web UI ideal for remote/server use$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Built-in RSS automation and torrent search reduce the need for external tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Available on all major desktop and server platforms$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Interface can feel less polished than some paid alternatives$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Built-in search plugins depend on third-party torrent site availability$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Resource usage can be heavier than minimalist clients like Transmission$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Is qBittorrent free?$q$, $q$Yes, qBittorrent is free, open-source software licensed under GPL-2.0 with an OpenSSL exception.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Does qBittorrent have a web interface?$q$, $q$Yes, it includes a secure web UI for remotely managing torrents, commonly used for headless server or NAS installs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$What platforms does qBittorrent support?$q$, $q$qBittorrent runs on Linux, Windows, macOS, and FreeBSD.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Does qBittorrent include a search feature?$q$, $q$Yes, it has a built-in torrent search engine that uses installable plugins to query multiple torrent sites at once.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Server/NAS torrent management$q$, $q$Users run qBittorrent headlessly on a NAS or server and manage downloads through the web UI from anywhere on their network.$q$, $q$Home server and NAS users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$Automated RSS-based downloading$q$, $q$Users set up RSS feed subscriptions with download filters so new torrents matching their criteria download automatically.$q$, $q$Users automating recurring downloads$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$qBittorrent is a free, open-source BitTorrent client written in native C++ using the Qt toolkit and the libtorrent-rasterbar library. It was originally created by Christophe Dumez in 2006 as an ad-free alternative to µTorrent, and today runs on Linux, Windows, macOS, and FreeBSD with a consistent feature set across platforms.$q$, $q$It includes bandwidth scheduling, torrent queuing and prioritization, per-file content selection within torrents, an integrated RSS feed reader with automatic download filters, and a torrent search engine powered by installable plugins that queries multiple torrent sites at once. Remote management is available through a secure web UI, and it supports IPv6, Unicode, and roughly 70 languages. It is released under GPL-2.0 (with an OpenSSL linking exception).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$qBittorrent suits users who want a full-featured, ad-free BitTorrent client with strong remote-management options via its web UI, making it popular for both desktop use and headless/server deployments such as NAS boxes and seedboxes.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7196ce6f-7454-4ae5-8a10-7ac77752c856', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Transmission ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, lightweight BitTorrent client for macOS, Windows, and Linux with minimal resource usage.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Transmission is a free, open-source, lightweight BitTorrent client for macOS, Windows, and Linux with a web interface.$q$,
  og_description = $q$Transmission is a free, open-source, lightweight BitTorrent client for macOS, Windows, and Linux with a web interface.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae1278c1-c356-40cb-b81c-795513168fe4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae1278c1-c356-40cb-b81c-795513168fe4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Native platform apps$q$, $q$Ships as a native GTK app on Linux, a Qt app on Windows, and a native macOS app with Apple Silicon support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Web interface$q$, $q$Includes a built-in web UI for remote monitoring and control of the daemon.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Watch directories$q$, $q$Automatically starts torrents added to a designated watch folder.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Bad peer blocklists$q$, $q$Supports blocklists to filter out known bad peers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Speed limits and tracker editing$q$, $q$Lets users cap transfer speeds and edit tracker lists per torrent.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Free, open source, and ad-free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Extremely lightweight, well suited to NAS and embedded devices$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Simple, approachable interface with a low learning curve$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Widely embedded by hardware vendors, indicating strong stability$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Fewer advanced features (e.g., built-in torrent search) compared to clients like qBittorrent$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Less frequent major UI overhauls than some competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$No official mobile app maintained by the core project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Is Transmission free?$q$, $q$Yes, Transmission is free, open-source software with no paid tiers or ads.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$What platforms does Transmission support?$q$, $q$Transmission has native apps for macOS (including Apple Silicon), Windows, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Can I control Transmission remotely?$q$, $q$Yes, Transmission includes a built-in web interface for remote monitoring and control.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Why do NAS devices often include Transmission?$q$, $q$Its low resource usage and stability have made it a common choice for manufacturers like Western Digital, Zyxel, and Belkin to bundle on their devices.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Lightweight desktop torrenting$q$, $q$Users who want a simple, low-resource torrent client for everyday personal downloading choose Transmission.$q$, $q$General desktop users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$Embedded NAS/router torrent client$q$, $q$Hardware vendors and self-hosters run Transmission on NAS devices or routers due to its minimal footprint.$q$, $q$NAS and embedded device users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Transmission is a free, open-source BitTorrent client built for low resource consumption while remaining full-featured. It offers native interfaces on each platform: a GTK interface following GNOME design guidelines on Linux, a Qt-based interface on Windows, and a native macOS app with Apple Silicon support.$q$, $q$Core features include watch directories, bad-peer blocklists, tracker editing, speed limits, and a built-in web interface for remote control. Because of its light footprint, Transmission has been embedded by NAS and router manufacturers including Western Digital, Zyxel, and Belkin, and was historically Ubuntu's default BitTorrent client for its accessible learning curve.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Transmission is a good fit for users who want a simple, low-overhead BitTorrent client for personal use, and for NAS or embedded-device use cases where a minimal resource footprint matters.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae1278c1-c356-40cb-b81c-795513168fe4', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── 015 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted platform for one-time temporary file and text upload and sharing, no registration required.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$015 is a free, open-source, self-hosted platform for temporary, no-registration file and text sharing.$q$,
  og_description = $q$015 is a free, open-source, self-hosted platform for temporary, no-registration file and text sharing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae67381f-84b3-429f-9ba2-4dc9e646db97';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae67381f-84b3-429f-9ba2-4dc9e646db97' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Chunked uploads with instant transfer$q$, $q$Splits large files into chunks and hashes them client-side to detect duplicates and speed up repeat uploads.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$No registration required$q$, $q$Users can upload and share files or text without creating an account.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Password protection and share limits$q$, $q$Shares can be protected with a password and limited in number of downloads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Resume upload support$q$, $q$Interrupted uploads can resume rather than restarting from scratch.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Image compression$q$, $q$Includes built-in image compression and format handling for uploaded images.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$File preview$q$, $q$Previews multiple file types directly in the browser before download.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$No account required to share files or text$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Docker Compose setup makes self-hosting straightforward$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Modern, actively developed tech stack (Vue 3/Nuxt 3/Go)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Small community project with limited English-language documentation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Designed for temporary/one-time sharing rather than long-term storage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$The public demo is hosted on a personal domain, so evaluating it may require self-hosting your own instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Is 015 free to use?$q$, $q$Yes, 015 is open-source software released under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Do I need an account to use 015?$q$, $q$No, 015 is designed for one-time, no-registration file and text sharing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Can I self-host 015?$q$, $q$Yes, it ships with Docker Compose configuration for self-hosted deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Is 015 meant for permanent file storage?$q$, $q$No, it is built for temporary, one-time uploads and sharing rather than long-term storage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Quick, anonymous file sharing$q$, $q$Users share a file or text snippet with someone without setting up accounts on either side.$q$, $q$Individuals sharing files casually$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$Self-hosted temp-file service for a community$q$, $q$Small teams or communities self-host their own instance instead of relying on third-party temp-file websites.$q$, $q$Self-hosters and small teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$015 is an open-source, self-hosted platform focused on temporary, one-time file and text sharing. It lets users upload files or share text without creating an account, and features chunked uploads with client-side hashing so identical files can be recognized and transferred instantly.$q$, $q$The project's frontend is built with Vue 3, Nuxt 3, TypeScript, and Tailwind CSS, with a Go (Echo framework) backend using Redis and Asynq for background processing. It is released under the AGPL-3.0 license, ships with Docker Compose for self-hosted deployment, and its source is maintained on the developer's own Gitea and GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$015 fits individuals and small teams who want a lightweight, self-hosted, no-registration way to share files or text temporarily, such as a personal or small-community alternative to public temp-file services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae67381f-84b3-429f-9ba2-4dc9e646db97', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chibisafe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted file upload and vault service with ShareX support, albums, and a masonry media browser.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Chibisafe is a free, open-source, self-hosted file upload and vault service with ShareX support and an API.$q$,
  og_description = $q$Chibisafe is a free, open-source, self-hosted file upload and vault service with ShareX support and an API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5e4812bd-f938-4e90-be82-f06e39de6ab3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5e4812bd-f938-4e90-be82-f06e39de6ab3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$ShareX integration$q$, $q$Works as a custom uploader destination for the ShareX screenshot tool on Windows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Chunked uploads$q$, $q$Uploads large files in chunks to reduce the impact of network failures.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Albums and shareable links$q$, $q$Organizes uploads into albums/folders with shareable links.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$User management and quotas$q$, $q$Supports public, account-based, or invite-only access with per-user storage quotas.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Built-in URL shortener$q$, $q$Includes a link-shortening feature alongside file hosting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$S3 storage support$q$, $q$Can store uploaded files on S3-compatible object storage instead of local disk.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$REST API$q$, $q$Provides an API for programmatic uploads and integrations, including iOS Shortcuts support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$ShareX and iOS Shortcuts integrations make it easy to plug into existing screenshot/upload workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Supports S3-compatible storage for scalable self-hosted deployments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Active community via Discord and GitHub$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Requires self-hosting and reverse-proxy setup for production use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Migrating between major versions requires manual data-folder migration steps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$No official managed/hosted version offered by the project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Is Chibisafe free?$q$, $q$Yes, Chibisafe is free, open-source software released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Does Chibisafe work with ShareX?$q$, $q$Yes, it supports ShareX as a custom upload destination for screenshots and files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Can Chibisafe use S3 storage?$q$, $q$Yes, it supports S3-compatible object storage in addition to local disk storage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$How do I deploy Chibisafe?$q$, $q$Docker (via Docker Compose) is the recommended deployment method, typically behind a reverse proxy like Caddy or Nginx.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Self-hosted screenshot hosting$q$, $q$Users configure ShareX to upload screenshots directly to their own Chibisafe instance instead of a third-party host.$q$, $q$Users hosting their own screenshots/media$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$Private file vault for a community$q$, $q$Communities run Chibisafe in invite-only or account mode to give members a private, quota-managed file storage space.$q$, $q$Community and small-team admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Chibisafe is an open-source, self-hosted file upload service described by its creators as a beautiful and performant vault for storing files in the cloud. It can run in public, user-account, or invite-only modes, and presents uploaded media in a masonry-style browsing interface.$q$, $q$The project is written in TypeScript, licensed under MIT, and is recommended to be deployed via Docker (Docker Compose) behind a reverse proxy such as Caddy or Nginx. It supports S3-compatible storage backends in addition to local disk storage, and offers a REST API for automated uploads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Chibisafe suits individuals and communities who want to self-host their own file/image hosting service, particularly as a ShareX-compatible upload destination for screenshots, or as a private alternative to public file-hosting sites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5e4812bd-f938-4e90-be82-f06e39de6ab3', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Enclosed ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable app for sending client-side encrypted, self-destructing notes and files.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Enclosed is an open-source, self-hostable app for sending client-side encrypted, self-destructing private notes and files.$q$,
  og_description = $q$Enclosed is an open-source, self-hostable app for sending client-side encrypted, self-destructing private notes and files.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b886551b-23de-40d7-8f48-7bb6d59c286b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b886551b-23de-40d7-8f48-7bb6d59c286b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Client-side AES-GCM encryption$q$, $q$Notes are encrypted in the browser before upload using a 256-bit key derived with PBKDF2, so the server stores only ciphertext.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Read-once self-destruction$q$, $q$Notes can be configured to delete themselves automatically after being opened a single time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Expiration timers$q$, $q$Set a note to automatically expire and become inaccessible after a chosen period.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Password protection$q$, $q$Add an optional password requirement on top of the encrypted link for an extra layer of access control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$File attachments$q$, $q$Attach files to a note, encrypted the same way as the note text itself.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Command-line interface$q$, $q$Create and manage notes directly from the terminal instead of the web UI.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Self-hosting via Docker$q$, $q$Run your own private instance with a single Docker container rather than relying on the public enclosed.cc site.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$True zero-knowledge design — the server never sees unencrypted note content$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Open source (Apache 2.0) with a self-hostable Docker image$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Free hosted instance available with no signup required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Read-once and expiration options limit exposure of shared secrets$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$CLI support for scripting note creation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$No native mobile apps, only a responsive web interface$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$No documented public REST API for third-party integrations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Built for short text/small file sharing, not large file transfer$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Is Enclosed free to use?$q$, $q$Yes. The hosted instance at enclosed.cc is free, and the software is open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Can I self-host Enclosed?$q$, $q$Yes, it can be deployed with a single Docker command, with configuration and troubleshooting guides available in the official docs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Does Enclosed store my note content?$q$, $q$No. Notes are encrypted client-side before they reach the server, so Enclosed's operators cannot read note contents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$What happens after a note is read?$q$, $q$You can configure a note to self-destruct after its first view, or set a fixed expiration time instead.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Sharing credentials with a teammate$q$, $q$Send a password, token, or API key that automatically disappears after being viewed once.$q$, $q$Developers and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$Sending sensitive documents privately$q$, $q$Attach a file to an encrypted, expiring note instead of emailing it as a plain attachment.$q$, $q$Privacy-conscious individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Enclosed is a minimalistic web app for sending private and secure notes. Content is encrypted client-side with AES-GCM using a 256-bit key derived via PBKDF2, so the server never has access to the plaintext of a note or its attached files.$q$, $q$Notes can be protected with a password, given an expiration time, or set to self-destruct after being read once. Enclosed is open source under the Apache 2.0 license and can be self-hosted with a single Docker command, in addition to the hosted instance at enclosed.cc.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and privacy-conscious users who need a quick, disposable way to share credentials, API keys, or sensitive text with someone else without leaving a permanent, server-readable copy behind.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b886551b-23de-40d7-8f48-7bb6d59c286b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── goploader ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Go client/server for sharing files from the terminal with server-side encryption, MIT licensed.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$goploader is an open-source Go tool for sharing files from the terminal, with server-side AES encryption and curl-compatible uploads.$q$,
  og_description = $q$goploader is an open-source Go tool for sharing files from the terminal, with server-side AES encryption and curl-compatible uploads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ffae92bf-f4f5-40c4-b5cb-88cc30edd135';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ffae92bf-f4f5-40c4-b5cb-88cc30edd135' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Curl/httpie/wget-compatible uploads$q$, $q$Files can be uploaded with standard command-line HTTP clients instead of a proprietary client library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Server-side AES encryption$q$, $q$Uploaded files are encrypted upon receipt, with the decryption key never persisted on the server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Streamed encryption$q$, $q$Files are encrypted and served as a stream rather than being buffered fully in memory.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$HTTPS by default$q$, $q$The reference server setup uses Caddy with Let's Encrypt for automatic HTTPS.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Go client and server binaries$q$, $q$Both components are written in Go with minimal dependencies for easy cross-platform builds.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Self-hostable, MIT licensed$q$, $q$Full source and build instructions are available for running your own private instance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Extremely lightweight with minimal dependencies$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Free and open source under the MIT license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Encryption key is never stored on the server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Works with standard command-line HTTP tools, not just a proprietary client$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$No web dashboard beyond a basic file-serving page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Requires command-line comfort to build and operate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Smaller-scale project with a narrower feature set than full file-sharing platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Is goploader free to use?$q$, $q$Yes, it's free and open source under the MIT license, whether you use the maintainer's instance or run your own.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Can I self-host goploader?$q$, $q$Yes. Build instructions and server configuration are documented for deploying your own server component.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Do I need a special client to upload files?$q$, $q$No. Uploads work with standard tools like curl, httpie, or wget since the server accepts plain multipart form uploads.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$How are files protected?$q$, $q$Files are AES-encrypted on receipt and streamed through decryption only when served; the decryption key is never stored server-side.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Quick terminal file sharing$q$, $q$Push a file to a shareable link directly from a shell session or script.$q$, $q$Developers and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$Private lightweight file host$q$, $q$Run a personal or team file-drop server without adopting a heavier full-featured platform.$q$, $q$Self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$goploader is a lightweight, open-source file-sharing tool built to make it easy to share files straight from the terminal. It consists of a Go client and a Go server that communicate over plain multipart HTTP form uploads, which means files can also be pushed with curl, httpie, or wget without any special client software.$q$, $q$Files are encrypted with AES as they're received and streamed through encryption without being fully loaded into memory; the decryption key is never stored on the server. Licensed under MIT, it's free to run against the maintainer's hosted instance or to self-host on your own server behind HTTPS via Caddy and Let's Encrypt.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and sysadmins who want a minimal, scriptable way to upload and share files from the command line without a web dashboard or account system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffae92bf-f4f5-40c4-b5cb-88cc30edd135', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── PictShare ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source image CDN with on-the-fly resizing, filters, and album creation.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PictShare is a free, self-hosted image CDN with on-the-fly resizing, filters, and album creation for developers and site owners.$q$,
  og_description = $q$PictShare is a free, self-hosted image CDN with on-the-fly resizing, filters, and album creation for developers and site owners.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9d7aacfb-24f7-4b69-a710-ff2942eeaaa7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9d7aacfb-24f7-4b69-a710-ff2942eeaaa7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Multi-source upload$q$, $q$Accepts images uploaded as a file, a remote URL, or Base64-encoded data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$URL-based image transforms$q$, $q$Resize, crop, and adjust images on the fly by appending parameters to the image URL, without editing the original file.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Filters$q$, $q$Apply effects such as grayscale directly through URL modifiers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Album creation$q$, $q$Group multiple uploaded images into a shareable, immutable album.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Delete codes$q$, $q$Each upload gets a code that lets the uploader remove the content later.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Self-hostable$q$, $q$Deployable on your own server rather than depending on the public pictshare.net instance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Simple, curl-friendly upload workflow$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Flexible on-the-fly image resizing and filtering via URL parameters$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Free and self-hosted, keeping images off third-party services$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Lightweight compared to full media-management platforms$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Focused on images only, not general file types$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Documentation is thin compared to larger self-hosted projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$No mobile app; access is via the web/API only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Is PictShare free?$q$, $q$Yes, it's free, open-source software that can be self-hosted at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Can I self-host PictShare?$q$, $q$Yes, the source is available on GitHub and it can be deployed on your own server, including via Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$How do I resize an image?$q$, $q$Append size parameters to the returned image URL, such as an 800x600 forced-size modifier, to get a transformed version.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Does PictShare support video?$q$, $q$PictShare is documented and designed specifically for image hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Self-hosted image CDN$q$, $q$Host images for a blog, forum, or app without relying on a third-party image service.$q$, $q$Site owners and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$Screenshot/upload target$q$, $q$Use as a private endpoint for tools that upload images and need a shareable link back.$q$, $q$Self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PictShare is a self-hostable content delivery tool for uploading and serving images. Images can be uploaded as a file, via a remote URL, or as Base64-encoded content, and returned as a shareable link such as pictshare.net/abcef123.jpg.$q$, $q$Beyond static hosting, PictShare supports on-the-fly modifications through URL parameters — resizing, aspect-ratio changes, and filters like grayscale — plus the ability to group multiple images into immutable albums, without permanently altering the original upload.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Site owners, forum operators, and developers who want a private, self-hosted image host with a simple upload API instead of relying on third-party image CDNs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d7aacfb-24f7-4b69-a710-ff2942eeaaa7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── ProjectSend ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source platform for securely sharing files with clients, with access control and audit logs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ProjectSend is a free, self-hosted, open-source platform for sharing files with clients, with access controls and audit logging.$q$,
  og_description = $q$ProjectSend is a free, self-hosted, open-source platform for sharing files with clients, with access controls and audit logging.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7eb54f85-fa53-45b8-9643-952ef361763c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7eb54f85-fa53-45b8-9643-952ef361763c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Client-specific access controls$q$, $q$Restrict which files each client or client group can see and download, with detailed activity logs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Two-factor authentication$q$, $q$Supports email-code and TOTP-app based 2FA for user accounts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$AES-256-GCM file encryption$q$, $q$Files are encrypted server-side using AES-256-GCM.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Download limits and disk quotas$q$, $q$Cap how many times a file can be downloaded and set per-user or per-client storage quotas.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$External storage support$q$, $q$Store files on Amazon S3 or other supported external storage instead of local disk.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Client uploads$q$, $q$Allow clients to upload files back to their own account when enabled.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$LDAP/Active Directory integration$q$, $q$Authenticate users against an existing LDAP or AD directory.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Automatic file expiration$q$, $q$Configure files to automatically stop being accessible after a set period.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Mature project with a large installed base (100,000+ reported installations)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Free and open source under GPL v2, with full data ownership when self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Granular per-client access controls and audit logging$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Enterprise-friendly features such as LDAP/AD and 2FA$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Translated into 70+ languages by the community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Requires managing your own PHP/MySQL/Apache-or-Nginx hosting stack$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Admin-focused interface is geared toward file managers rather than end consumers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$No documented public REST API for automated integrations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Is ProjectSend free?$q$, $q$Yes, it's free and open source under GPL v2, with optional Patreon support for the developers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$What are the hosting requirements?$q$, $q$PHP 8.2+, MySQL 5.0+, and Apache2 or Nginx, with support for shared hosting and Docker deployment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Can clients upload files?$q$, $q$Yes, if the administrator enables client uploads, clients can upload files to their own account.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Does it support two-factor authentication?$q$, $q$Yes, via email codes or TOTP authenticator apps.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Can I use S3 for storage?$q$, $q$Yes, ProjectSend supports AWS S3 and other external storage in addition to local disk.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Client deliverable handoff$q$, $q$Give each client a private area to receive and download completed work with a full audit trail.$q$, $q$Agencies and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$Regulated document exchange$q$, $q$Share sensitive files with encryption, 2FA, and download limits for compliance-conscious workflows.$q$, $q$Legal and accounting firms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ProjectSend is a self-hosted file-sharing platform built for professionals who need to distribute files to clients while keeping full control over access and privacy. It's released under the GNU GPL v2 license and is run entirely on infrastructure you control, so you retain full ownership of your data.$q$, $q$It offers client-specific access controls with detailed audit logging, two-factor authentication (email codes or TOTP apps), AES-256-GCM server-side file encryption, download limits, disk quota management, LDAP/Active Directory integration, and support for AWS S3 or other external storage. Clients can also be permitted to upload files back to their own account.$q$, $q$The project reports over 100,000 active installations and community translations covering more than 70 languages. It requires PHP 8.2+, MySQL 5.0+, and Apache or Nginx, and can be deployed via Docker or on shared hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Agencies, freelancers, and firms (e.g., legal, accounting, creative) that need an auditable, client-facing file exchange instead of emailing attachments or using a generic cloud drive.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7eb54f85-fa53-45b8-9643-952ef361763c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── QuickShare ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted file sharing tool with resumable uploads/downloads for Linux, Mac, and Windows.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$QuickShare is a free, open-source, self-hosted file sharing tool with resumable uploads for Linux, Mac, and Windows.$q$,
  og_description = $q$QuickShare is a free, open-source, self-hosted file sharing tool with resumable uploads for Linux, Mac, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '84a38488-775c-4325-9b1d-4639474c2773';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '84a38488-775c-4325-9b1d-4639474c2773' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Resumable uploads and downloads$q$, $q$Interrupted transfers can pick back up instead of restarting from scratch.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Bulk and streaming transfers$q$, $q$Supports uploading multiple files at once and streaming uploads.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$QR code access$q$, $q$Scan a QR code to quickly open a shared file or folder from a mobile device.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Directory sharing$q$, $q$Share whole directories with registered or anonymous users.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Role-based user management$q$, $q$Manage users with defined roles, per-user speed limits, and storage quotas.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Cross-platform$q$, $q$Runs on Linux, Mac, and Windows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Free and open source under LGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Resumable transfers handle unstable connections well$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Runs natively across Linux, Mac, and Windows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Lightweight compared to full cloud-storage suites$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Smaller community than mainstream self-hosted alternatives like Nextcloud$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$No documented public REST API for third-party integrations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Interface is basic rather than feature-rich$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Is Quickshare free?$q$, $q$Yes, it's free and open source under the LGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$What platforms are supported?$q$, $q$Quickshare runs on Linux, Mac, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Can anonymous users share files?$q$, $q$Yes, directory sharing can be configured for both registered and anonymous users.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Is there a demo?$q$, $q$A hosted demo has been made available for testing before self-hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Personal cloud alternative$q$, $q$Store and access your own files from any device without a third-party provider.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$Team file exchange over unstable networks$q$, $q$Use resumable uploads/downloads to reliably move large files.$q$, $q$Small teams and self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Quickshare (marketed as QuickShare) is a simple, self-hosted file sharing tool designed to let users exchange files across devices without relying on a third-party cloud provider. It's open source under the LGPL-3.0 license and runs cross-platform on Linux, Mac, and Windows.$q$, $q$It supports resumable uploads and downloads, bulk file transfers, and streaming uploads, along with directory sharing for both registered and anonymous users. User management includes role-based access, per-user speed limiting, and storage quotas, and files can be accessed via a web browser or QR code scanning.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and small teams who want a lightweight, self-hosted alternative to commercial cloud storage for sharing and syncing files across devices.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84a38488-775c-4325-9b1d-4639474c2773', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Safebucket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted file-sharing platform where uploads/downloads bypass the server via presigned URLs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Safebucket is an open-source, self-hosted file-sharing platform where files bypass the server via presigned URLs and SSO-first auth.$q$,
  og_description = $q$Safebucket is an open-source, self-hosted file-sharing platform where files bypass the server via presigned URLs and SSO-first auth.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '991a14b4-c72d-4cf5-87f7-81f3fc26205a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '991a14b4-c72d-4cf5-87f7-81f3fc26205a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Presigned-URL transfers$q$, $q$Files move directly between clients and your storage backend, bypassing the application server entirely.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$SSO-first authentication$q$, $q$Authenticate users via OIDC against your existing identity provider instead of managing separate passwords.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Bucket-scoped, role-based access$q$, $q$Sharing is organized around buckets with owner, contributor, and viewer roles.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Swappable infrastructure$q$, $q$Storage, database, event, cache, and notification components can each be swapped for alternatives such as S3, MinIO, or GCS.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Quick/reverse share links$q$, $q$Generate public share links protected by password, maximum downloads, or maximum views.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Audit logging$q$, $q$Structured logs track access and activity across buckets.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Files bypass the app server via presigned URLs, reducing server load and exposure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$SSO-first design avoids managing separate user passwords$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Modular architecture lets you swap storage, database, and other components$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Open source and self-hostable on your own infrastructure$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Newer project with a smaller track record than established file-sharing platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Requires configuring an OIDC identity provider and S3-compatible storage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Documentation and ecosystem are still maturing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Is Safebucket free?$q$, $q$Yes, it's open-source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$What storage backends are supported?$q$, $q$S3-compatible storage such as AWS S3 or self-hosted MinIO, among other swappable options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Does it require an identity provider?$q$, $q$Safebucket is SSO-first, designed to authenticate through OIDC against an existing identity provider.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Do files pass through the Safebucket server?$q$, $q$No, uploads and downloads use presigned URLs so files transfer directly between the client and storage backend.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$Internal S3-backed file portal$q$, $q$Give a team a private, self-hosted file-sharing service backed by your own object storage.$q$, $q$Engineering and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$SSO-gated file access$q$, $q$Restrict file sharing to users authenticated through your organization's identity provider.$q$, $q$Organizations with an existing OIDC provider$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Safebucket is an open-source, on-premise file-sharing platform whose defining design choice is that files never pass through the application server. Uploads and downloads go directly between clients and your storage backend using cryptographically signed, time-limited presigned URLs, while the server only handles metadata, access control, and audit logging.$q$, $q$It's SSO-first, authenticating users through OIDC against your existing identity provider rather than managing separate passwords. Sharing happens through buckets with explicit membership and role-based permissions (owner, contributor, viewer), and quick/reverse share links can be protected with a password, a maximum download count, or a maximum view count.$q$, $q$The stack is a Go REST API paired with a React web interface, PostgreSQL or SQLite for the database, and support for S3-compatible storage such as AWS S3 or self-hosted MinIO — with storage, database, events, cache, and notification components all designed to be swappable.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Engineering and IT teams that want an internal, S3-backed file-sharing service with SSO-only authentication and fine-grained, bucket-level access control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('991a14b4-c72d-4cf5-87f7-81f3fc26205a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Slink ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source image sharing platform with password protection, expiring links, and ShareX integration.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$, $q$Italian$q$, $q$Japanese$q$, $q$Polish$q$, $q$Ukrainian$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$Slink is a free, open-source, self-hosted image sharing platform with password-protected links, expiration, and ShareX support.$q$,
  og_description = $q$Slink is a free, open-source, self-hosted image sharing platform with password-protected links, expiration, and ShareX support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05360a62-d1a4-4432-b898-08dd0ad1189d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05360a62-d1a4-4432-b898-08dd0ad1189d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Private-by-default sharing$q$, $q$Images are accessible only via their link unless additional protections are added.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Password protection and expiration$q$, $q$Shares can require a password and auto-revoke after a set time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$ShareX integration$q$, $q$Configure ShareX or similar capture tools to upload screenshots directly to your Slink instance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Tag management and search$q$, $q$Organize images with hierarchical tags and locate them through search.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Multiple storage backends$q$, $q$Store images locally, on SMB shares, or in AWS S3.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$SSO authentication$q$, $q$Sign in via Google, Authentik, Keycloak, Authelia, Pocket ID, or a custom OIDC provider.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Admin tools$q$, $q$Manage users, moderate images, and review storage analytics from an admin panel.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Personal API keys$q$, $q$Generate API keys for programmatic uploads and integrations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Strong privacy defaults with password-protected and expiring shares$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Broad SSO provider support for team deployments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Multiple storage backend options including S3$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Active open-source project with several hundred GitHub stars$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Focused on image hosting rather than general file sharing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$AGPL-3.0 license carries copyleft obligations for modified redistributions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Requires familiarity with the Symfony/SvelteKit stack to customize$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Is Slink free?$q$, $q$Yes, it's free and open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Does Slink integrate with ShareX?$q$, $q$Yes, it supports ShareX and similar capture clients for automatic screenshot uploads.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Can I use S3 for storage?$q$, $q$Yes, alongside local disk and SMB storage options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Does Slink support single sign-on?$q$, $q$Yes, including Google, Authentik, Keycloak, Authelia, Pocket ID, and custom OIDC providers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$Private ShareX screenshot host$q$, $q$Route screenshot uploads to a self-hosted, private image server instead of a public host.$q$, $q$Developers and technical teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$SSO-gated team image sharing$q$, $q$Let a team share images through an instance tied to your organization's identity provider.$q$, $q$Organizations with an existing SSO setup$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Slink is a self-hosted image sharing platform built with Symfony and SvelteKit that lets you run your own private image host instead of relying on third-party services. All shares are private by default, accessible only to whoever holds the link, with optional password protection and expiring shares that auto-revoke after a chosen time.$q$, $q$It integrates with ShareX for automatic screenshot uploads, offers hierarchical tag management with search, and supports local, SMB, or AWS S3 storage. Authentication covers email/password sign-in as well as SSO via Google, Authentik, Keycloak, Authelia, Pocket ID, or a custom OIDC provider, alongside personal API keys and Docker-based deployment.$q$, $q$Slink is open source under the AGPL-3.0 license, with the primary repository holding several hundred GitHub stars.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and teams who capture and share a lot of screenshots or images and want a private, SSO-capable image host instead of a public third-party service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05360a62-d1a4-4432-b898-08dd0ad1189d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── XBackBone ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted file and media sharing server built for ShareX-style capture tools, with a REST API.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$XBackBone is a free, open-source, self-hosted file and media sharing server for ShareX-style capture tools, with a REST API.$q$,
  og_description = $q$XBackBone is a free, open-source, self-hosted file and media sharing server for ShareX-style capture tools, with a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee29016b-e8bd-48bb-949d-e74570770e58';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee29016b-e8bd-48bb-949d-e74570770e58' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$ShareX and capture-client integration$q$, $q$Configure capture tools to upload directly to your XBackBone instance and get back a short link.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Multi-file-type support$q$, $q$Handles images, video, audio, PDFs, and code, not just screenshots.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Multiple storage backends$q$, $q$Store uploads on local disk, Amazon S3, FTP, or SFTP.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Content de-duplication$q$, $q$Fingerprinting avoids storing duplicate copies of the same file.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Password protection and expiration$q$, $q$Uploads can be private or public, with optional passwords and expiration settings.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$REST API with token authentication$q$, $q$Automate uploads and management through a documented API.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Two-factor authentication and WebAuthn$q$, $q$Secure user accounts beyond a simple password.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Admin controls$q$, $q$Manage users and enforce disk quotas from an admin panel.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Purpose-built for ShareX and similar capture-tool workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Flexible storage backend options including S3, FTP, and SFTP$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$REST API enables automation and custom integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Free and open source under Apache 2.0$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Version 4.x was still under active development per the docs, with 3.x kept as the supported line, so a migration path should be checked before upgrading$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Requires self-hosting setup and ongoing server maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Interface is aimed at technical users rather than casual consumers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Is XBackBone free?$q$, $q$Yes, it's free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Does it work with ShareX?$q$, $q$Yes, XBackBone is designed to act as a backend for ShareX and similar capture clients.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$What storage backends are supported?$q$, $q$Local disk, Amazon S3, FTP, and SFTP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Is there an API?$q$, $q$Yes, a REST API with token authentication is available for automating uploads and management.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$Private ShareX upload destination$q$, $q$Point capture tools at your own server instead of a public image host.$q$, $q$Individuals and technical teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$API-driven file hosting$q$, $q$Automate uploads and file management through the REST API.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$XBackBone is a self-hosted platform for sharing files and media, built to act as a backend for capture tools like ShareX so that uploads are turned into short, shareable links. It supports images, video, audio, PDFs, and code snippets, and can store files locally or on Amazon S3, FTP, or SFTP.$q$, $q$The platform de-duplicates content through fingerprinting, allows private or public uploads with optional password protection and expiration, and exposes a REST API with token authentication for automation. User accounts support two-factor authentication and WebAuthn, and admins can manage users and disk quotas.$q$, $q$XBackBone is released under the Apache 2.0 license and free to self-host. According to its documentation, version 4.x is under active development while version 3.x remains supported.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and teams who use ShareX or similar capture tools and want a private, self-hosted destination for screenshots, video clips, and other files, with API access for automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee29016b-e8bd-48bb-949d-e74570770e58', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Apaxy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source CSS theme that restyles Apache's mod_autoindex directory listings.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Apaxy is a free, open-source CSS theme that restyles Apache's mod_autoindex directory listings for a cleaner look.$q$,
  og_description = $q$Apaxy is a free, open-source CSS theme that restyles Apache's mod_autoindex directory listings for a cleaner look.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$CSS-based restyling$q$, $q$Overlays custom styling on Apache's default mod_autoindex directory listing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Custom MIME-type icons$q$, $q$Assign specific icons to file types by editing .htaccess.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Optional jQuery enhancements$q$, $q$Add JavaScript-based interactivity on top of the static listing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Custom welcome messages$q$, $q$Show custom instructions or messages at the top of a directory listing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Drop-in installation$q$, $q$No application, database, or server process to run — just static CSS/JS/icon assets.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Free and extremely lightweight — just static assets$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$No application logic or database to maintain or secure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Easy to drop into an existing Apache directory-listing setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Open source and available on GitHub$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Only changes appearance, not the underlying HTML table Apache generates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Requires Apache with mod_autoindex specifically; not usable with Nginx or other servers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Not a file-sharing application — no accounts, share links, or expiration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Does Apaxy require an application or database?$q$, $q$No, it's purely CSS, JavaScript, and icon assets layered on top of Apache's directory listing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Does it work with Nginx?$q$, $q$No, it's specifically built for Apache's mod_autoindex module.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Is Apaxy free?$q$, $q$Yes, it's free and open source.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Who maintains Apaxy?$q$, $q$It was created by Adam Whitcroft and is hosted on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Nicer-looking exposed file directories$q$, $q$Give an Apache-served directory listing a modern look without building a file-sharing app.$q$, $q$Sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Personal or homelab file archives$q$, $q$Style a simple static file archive served directly by Apache.$q$, $q$Homelab and self-hosting users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apaxy is a customizable theme that restyles the directory listings Apache generates via its mod_autoindex module, replacing the default bland listing with CSS-based styling. It's a drop-in set of static assets rather than an application — there's no server or database to run.$q$, $q$It supports custom MIME-type icons through .htaccess editing, optional jQuery-based enhancements, and custom welcome messages or instructions per directory. Apaxy only changes appearance; it does not restructure the underlying HTML table that Apache generates. It's open source, hosted on GitHub, and created by Adam Whitcroft.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Sysadmins and homelab users who expose Apache's built-in directory listings for file access and want a nicer, more branded look without adopting a full file-sharing application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── ClyoCloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted personal cloud storage and media manager that stores metadata in sidecar files instead of a database.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ClyoCloud is a free, self-hosted personal cloud storage and media manager that stores metadata in sidecar files, no database needed.$q$,
  og_description = $q$ClyoCloud is a free, self-hosted personal cloud storage and media manager that stores metadata in sidecar files, no database needed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2a25838b-7398-4938-8fa5-7b5fcd9080f0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2a25838b-7398-4938-8fa5-7b5fcd9080f0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Database-free metadata storage$q$, $q$Metadata is stored in .cloudinfo sidecar files next to each resource instead of a separate database engine.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Two-factor authentication$q$, $q$TOTP-based 2FA (e.g., Google Authenticator, Authy) protects the dashboard.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Favorites and collections$q$, $q$Star important files for quick access or organize them dynamically with tags.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Activity logs$q$, $q$Detailed logs capture file additions, moves, and deletions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Automatic thumbnail generation$q$, $q$Media files get thumbnails generated automatically for browsing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Range-aware video streaming$q$, $q$Stream video with proper range-request support rather than requiring a full download first.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Public sharing links$q$, $q$Generate links to share individual files publicly.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$No database dependency simplifies backup and migration — metadata travels with the files$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Built on a modern Nuxt 3 / Vue 3 stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Media-focused features like streaming and automatic thumbnails$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Fully self-hosted, keeping data on your own hardware$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Personal/indie project maintained by a single developer with a limited track record$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Smaller feature set than established platforms like Nextcloud$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Source is hosted on a personal Gitea instance rather than a mainstream platform, and documentation is minimal$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Is ClyoCloud free?$q$, $q$Yes, it's a free, self-hosted solution.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Does it require a database?$q$, $q$No, it stores metadata in sidecar .cloudinfo files next to each file instead of using a database engine.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Does it support video streaming?$q$, $q$Yes, it supports range-aware video playback for streaming media.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Can I share files publicly?$q$, $q$Yes, ClyoCloud supports generating public sharing links.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Where is the source code hosted?$q$, $q$On a self-hosted Gitea instance at code.weexnes.dev, run by the project's maintainer.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Lightweight personal cloud$q$, $q$Run a private cloud storage instance without provisioning a separate database.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$Home media library$q$, $q$Organize, thumbnail, and stream personal media from self-hosted infrastructure.$q$, $q$Homelab and self-hosting enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ClyoCloud is a self-hosted personal cloud storage and media management application designed as a privacy-focused alternative to mainstream cloud services, letting you store, organize, stream, and share files from your own hardware. Instead of requiring a database engine like SQLite, PostgreSQL, or MongoDB, it stores metadata in .cloudinfo sidecar files placed directly alongside each file.$q$, $q$It's built on Nuxt 3 (Vue 3) with a Nitro backend, styled with Tailwind CSS, and uses ffmpeg for media processing. Features include TOTP-based two-factor authentication, favorites and tag-based collections, activity logs for file operations, automatic thumbnail generation, range-aware video streaming, and public sharing links.$q$, $q$The project is developed and hosted by a single maintainer (WeeXnes) on a self-hosted Gitea instance rather than a mainstream platform like GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals and homelab users who want a lightweight personal cloud without setting up a separate database, and who value media features like thumbnailing and streaming.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2a25838b-7398-4938-8fa5-7b5fcd9080f0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Directory Lister ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Directory Lister is a free, open-source PHP script that turns any web-accessible folder into a browsable, searchable file listing with zero configuration.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Directory Lister is a free, open-source PHP tool that turns any folder into a browsable, searchable web file listing with zero configuration.$q$,
  og_description = $q$Directory Lister is a free, open-source PHP tool that turns any folder into a browsable, searchable web file listing with zero configuration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7970f696-afb2-4a60-a110-66287a0c9216';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7970f696-afb2-4a60-a110-66287a0c9216' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Zero-configuration setup$q$, $q$Copy the script into a directory and it immediately lists all files and subfolders, no database or install wizard required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Built-in search$q$, $q$Users can search for files by name across the listed directory tree.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$README rendering$q$, $q$Markdown README files found in a directory are rendered inline in the listing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$File hashes$q$, $q$Displays file hashes so visitors can verify downloads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Light and dark themes$q$, $q$Includes selectable themes for the listing interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Breadcrumb navigation$q$, $q$Lets visitors move between parent and child directories easily.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Free, open-source, and MIT-licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$No database or complex setup — a single script does the job$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Fast and lightweight, ideal for static file sharing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Actively maintained with regular releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Read-only browsing — no built-in file upload or editing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Requires a PHP 8.2+ hosting environment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Not designed as a full multi-user file management system$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Is Directory Lister free to use?$q$, $q$Yes, it is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$What server does it require?$q$, $q$Any web server that supports PHP 8.2 or newer; no database is needed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Can I password-protect a listing?$q$, $q$Access control depends on your web server configuration (e.g. .htaccess); Directory Lister itself focuses on generating the listing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Does it support downloading files directly?$q$, $q$Yes, every listed file includes a direct download link.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Public file sharing$q$, $q$Publish a folder of downloadable resources, software builds, or documents with a clean browsable interface.$q$, $q$Homelab users and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$Internal documentation index$q$, $q$Expose an internal server directory of docs or reports for a team to browse.$q$, $q$Sysadmins and IT teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Directory Lister is a single, lightweight PHP application distributed under the MIT license. Dropped into any folder on a PHP-capable web server, it automatically generates a clean, navigable web page listing that folder and all its subdirectories, complete with breadcrumb navigation and download links.$q$, $q$It requires PHP 8.2+ and needs no database or external services, so setup is essentially copy the files, point a web server at the directory, and it works. The project is actively maintained on GitHub under the DirectoryLister organization and has been rewritten multiple times over its long history to modernize the codebase.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It suits anyone who wants a quick, no-frills way to expose a folder of files for browsing and downloading — homelab operators sharing media or software mirrors, sysadmins publishing internal documentation or build artifacts, and developers who need a fast public file index without standing up a full file-management application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7970f696-afb2-4a60-a110-66287a0c9216', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── FileGator ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FileGator is a free, open-source, self-hosted multi-user web file manager with drag-and-drop uploads and pluggable storage backends.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$FileGator is a free, open-source, self-hosted multi-user file manager with drag-and-drop uploads and support for S3, FTP, Dropbox, and Azure storage.$q$,
  og_description = $q$FileGator is a free, open-source, self-hosted multi-user file manager with drag-and-drop uploads and support for S3, FTP, Dropbox, and Azure storage.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8ba9e98b-5119-4b61-bcba-6f4764974281';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8ba9e98b-5119-4b61-bcba-6f4764974281' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Multi-user access control$q$, $q$Create multiple users with roles, permissions, and dedicated home folders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Pluggable storage adapters$q$, $q$Store files locally or connect to S3, FTP, Dropbox, DO Spaces, Azure Blob, and other Flysystem-supported backends.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Multiple auth adapters$q$, $q$Authenticate users via a JSON file, a database, or an existing WordPress site.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Chunked drag-and-drop uploads$q$, $q$Large files upload with progress tracking and pause/resume support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Full file operations$q$, $q$Copy, move, rename, edit, delete, preview, zip, and unzip files from the browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Live demo$q$, $q$A hosted demo instance lets prospective users try the interface before installing.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Free and open source under MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Works with cloud storage providers, not just local disk$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Granular multi-user roles and permissions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$WordPress authentication integration for existing sites$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Primarily a file manager, not a full digital asset management or backup solution$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Setup and customization assume some PHP/Node familiarity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$No official managed hosting — self-hosting is required$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Is FileGator free?$q$, $q$Yes, FileGator is free, open-source software under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Can I use cloud storage instead of local disk?$q$, $q$Yes, it supports S3, FTP, Dropbox, Azure Blob, DO Spaces, and other Flysystem adapters.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Can I authenticate users with WordPress?$q$, $q$Yes, FileGator includes a WordPress auth adapter alongside JSON-file and database options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Is there a hosted demo?$q$, $q$Yes, a live demo is available at demo.filegator.io.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Client file exchange portal$q$, $q$Give clients a branded, permissioned space to upload and download project files.$q$, $q$Agencies and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$Self-hosted team file hub$q$, $q$Replace consumer cloud storage apps with a self-hosted file manager connected to your own storage.$q$, $q$Small businesses and internal IT teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$FileGator is an MIT-licensed, self-hosted web file manager built with a PHP backend and a Vue.js frontend. Beyond local disk storage, it can connect to remote storage providers such as Amazon S3, FTP, Dropbox, DigitalOcean Spaces, and Azure Blob Storage through Flysystem storage adapters.$q$, $q$It supports multiple users with distinct roles, permissions, and home folders, and can authenticate against a JSON file, a database, or an existing WordPress installation. Core file operations — copy, move, rename, zip/unzip, preview, upload, and download — are all handled through a single-page web interface, with chunked, resumable drag-and-drop uploads for large files.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$FileGator fits teams and agencies that want a self-hosted alternative to consumer file-sharing tools for internal or client-facing file exchange, developers embedding a file manager into a WordPress site, and anyone who needs one interface to manage files across several storage backends.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ba9e98b-5119-4b61-bcba-6f4764974281', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ResourceSpace ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ResourceSpace is an open-source digital asset management system for storing, tagging, and sharing media, available self-hosted for free or as a paid managed service.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2005,
  company_size = NULL,
  headquarters = $q$Faringdon, Oxfordshire, United Kingdom$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ResourceSpace is an open-source digital asset management system for storing, tagging, and sharing media, free to self-host or available as a paid cloud service.$q$,
  og_description = $q$ResourceSpace is an open-source digital asset management system for storing, tagging, and sharing media, free to self-host or available as a paid cloud service.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '00400667-6209-4172-b7aa-b8106d654692';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '00400667-6209-4172-b7aa-b8106d654692' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Metadata-driven search$q$, $q$Find assets quickly using structured metadata fields and full-text search.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Granular permissions$q$, $q$Control access to collections and individual assets by user, group, or role.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Version management$q$, $q$Track and manage multiple versions of the same asset over time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$API access$q$, $q$Integrate ResourceSpace with other systems using its API.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Audit trails$q$, $q$Log usage and downloads for compliance and reporting purposes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Self-hosted or managed cloud$q$, $q$Run the open-source software on your own servers or subscribe to Montala's hosted and supported plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Core software is free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Long-established project (since 2005) with an active user base in the cultural and nonprofit sectors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Strong permissioning and audit features for regulated content$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Optional managed hosting and support for organizations that don't want to self-host$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Self-hosting requires server administration knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Managed cloud and enterprise plans carry significant monthly costs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Interface and setup can feel dated compared to newer commercial DAM tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Is ResourceSpace free?$q$, $q$The core software is free and open source and can be self-hosted at no licensing cost. Montala also sells paid cloud hosting, on-premise support, and enterprise plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Who maintains ResourceSpace?$q$, $q$It is developed by Montala Limited, a UK-based software company.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Does it support single sign-on?$q$, $q$Yes, SSO integration is available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Is there an API?$q$, $q$Yes, ResourceSpace provides an API for custom integrations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Cultural and museum archives$q$, $q$Store and make searchable large collections of historical images and documents.$q$, $q$Museums, archives, and cultural institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Brand and marketing asset libraries$q$, $q$Give teams a permissioned, searchable repository for approved marketing media.$q$, $q$Media companies and marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Regulated document management$q$, $q$Track versions and maintain audit trails for sensitive organizational content.$q$, $q$Public sector and nonprofit organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source code","Self-managed installation and updates","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Cloud Team$q$, $q$From approximately $358+/month$q$, $q$monthly or annual$q$, $q$["Managed cloud hosting","Vendor support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Cloud Business$q$, $q$From approximately $778+/month$q$, $q$monthly or annual$q$, $q$["Managed cloud hosting","Expanded support and capacity"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$Cloud Enterprise$q$, $q$From approximately $1,357+/month$q$, $q$monthly or annual$q$, $q$["Managed cloud hosting","Enterprise support and SLAs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ResourceSpace is an open-source Digital Asset Management (DAM) platform developed by Montala Limited, a UK software company founded in 2005. Organizations can download and self-host the software for free, or pay Montala for cloud hosting, on-premise support, and enterprise services.$q$, $q$The platform is built to store, organize, search, and share large volumes of digital media, with features such as metadata-driven search, granular permission controls, version management, usage reporting, and audit trails aimed at organizations that manage sensitive or regulated content.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('00400667-6209-4172-b7aa-b8106d654692', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ResourceSpace is commonly used by charities, museums and cultural institutions, media companies, public-sector bodies, and educational institutions that need a controlled, searchable repository for images, video, and documents, whether run on their own infrastructure or through Montala's managed cloud plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00400667-6209-4172-b7aa-b8106d654692', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00400667-6209-4172-b7aa-b8106d654692', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00400667-6209-4172-b7aa-b8106d654692', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00400667-6209-4172-b7aa-b8106d654692', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Surfer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Surfer is a free, open-source static file server with a web interface, CLI, WebDAV, and SFTP access, built for self-hosting on Cloudron.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Surfer is a free, open-source static file server for Cloudron with a web interface, CLI, WebDAV, and SFTP upload options.$q$,
  og_description = $q$Surfer is a free, open-source static file server for Cloudron with a web interface, CLI, WebDAV, and SFTP upload options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7790e8ea-c240-4ee6-9b40-8da31a143d62';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7790e8ea-c240-4ee6-9b40-8da31a143d62' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Web-based file manager$q$, $q$Upload and manage files and folders directly from a browser at /_admin.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$CLI tool$q$, $q$The cloudron-surfer npm package lets you upload files from the command line using an API token, useful for automated deploys.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$WebDAV support$q$, $q$Mount your Surfer site as a network drive on Windows, macOS, or Linux.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$SFTP access$q$, $q$Upload files with any standard SFTP client such as FileZilla.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Configurable access control$q$, $q$Serve a site as fully public, password-protected, or restricted to Cloudron users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Custom index and error pages$q$, $q$Set a custom index file and a custom 404 error page.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Multiple upload methods (web, CLI, WebDAV, SFTP) for different workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Good fit for CI/CD static site deployment via the CLI$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Actively documented as part of the Cloudron app catalog$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Designed to run on the Cloudron platform rather than as a fully standalone install$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Static file hosting only — no server-side application logic$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Smaller community than general-purpose static hosting tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Is Surfer free?$q$, $q$Yes, it is free, open-source software under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Do I need Cloudron to use Surfer?$q$, $q$Surfer is packaged and documented as a Cloudron app; the source is also mirrored on GitHub for those running Cloudron-style self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Can I automate deployments?$q$, $q$Yes, the CLI tool supports scripted uploads using an API access token, suitable for CI/CD pipelines.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Can I password-protect a site?$q$, $q$Yes, sites can be set to public, password-protected, or Cloudron-user-only access.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$Static site hosting$q$, $q$Host output from static site generators (Jekyll, Hugo, etc.) with simple drag-and-drop or CLI uploads.$q$, $q$Developers and site owners on Cloudron$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$CI/CD static deploys$q$, $q$Push build artifacts automatically to Surfer as part of a deployment pipeline using the CLI and API tokens.$q$, $q$Development teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Surfer is an open-source (MIT-licensed) static file server, developed by the Cloudron team and packaged for self-hosting on the Cloudron platform. It serves static websites and files, and lets you manage content four different ways: a web-based file manager at /_admin, a command-line tool (installable via npm), a WebDAV endpoint you can mount as a network drive, and SFTP access for clients like FileZilla.$q$, $q$It automatically serves index.html/index.htm files, supports custom 404 pages, and offers three access levels for a site — fully public, password-protected, or restricted to logged-in Cloudron users — making it a lightweight option for hosting static sites or build output from static site generators.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Surfer suits people already self-hosting apps on Cloudron who need a simple place to host static websites, documentation sites, or build artifacts from a static site generator, and developers who want to script uploads via its CLI as part of a CI/CD pipeline.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7790e8ea-c240-4ee6-9b40-8da31a143d62', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── TagSpaces ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$TagSpaces is an offline-first file organizer that lets you tag, note, and browse files directly on disk without cloud accounts, with a free desktop app and paid Pro tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TagSpaces is an offline-first file organizer for tagging and browsing files on your own disk, with a free open-source app and paid Pro tiers.$q$,
  og_description = $q$TagSpaces is an offline-first file organizer for tagging and browsing files on your own disk, with a free open-source app and paid Pro tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$File-based tagging$q$, $q$Add color-coded tags directly to file and folder names, no external database required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Notes and Markdown editing$q$, $q$Create and edit notes in Markdown, HTML, or plain text alongside your files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$50+ file format previews$q$, $q$Preview a wide range of file types without leaving the app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Offline AI tagging and summarization$q$, $q$TagSpaces Pro can generate tags and summaries using AI models that run offline.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Kanban and map/calendar perspectives$q$, $q$View and organize files as Kanban boards, on a map, or on a calendar (Pro).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Web clipper$q$, $q$A browser extension for Chrome, Firefox, and Edge to save web content into your TagSpaces workspace.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Files stay in their native location — no vendor lock-in or proprietary database$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Free, open-source Lite version covers core tagging and organization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Works fully offline across desktop, mobile, and web (Pro)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Self-funded and independent, without external investors$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Advanced features (AI tagging, Kanban, collaboration) require a paid Pro subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Web and enterprise/on-premises deployment require the paid Custom tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Tag-in-filename approach can create long filenames on some systems$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Is TagSpaces free?$q$, $q$TagSpaces Lite, the core desktop app, is free and open source under the AGPL license. TagSpaces Pro and Custom are paid tiers with additional features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$What platforms does it support?$q$, $q$Desktop apps for Windows, macOS, and Linux; mobile apps for iOS and Android; and a web version and browser extension through the Pro and Custom tiers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Does it require the cloud?$q$, $q$No, TagSpaces works fully offline; it can optionally connect to S3-compatible cloud storage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Can businesses self-host it?$q$, $q$The Custom/enterprise tier supports on-premises deployment and white-labeling.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Personal file organization$q$, $q$Tag and organize documents, photos, and research files stored locally or in synced cloud folders.$q$, $q$Individuals and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$Team knowledge and document tagging$q$, $q$Use collaborative tags and Kanban/calendar views to organize shared file repositories.$q$, $q$Small teams and businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$TagSpaces Lite$q$, $q$Free$q$, $q$N/A$q$, $q$["Core tagging and file organization","Offline desktop app","Open source (AGPL)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$TagSpaces Pro$q$, $q$Paid per-user subscription (annual) or one-time license$q$, $q$annual or one-time$q$, $q$["Collaborative tags","Offline AI tag generation and summarization","Advanced search","Kanban, map, and calendar views"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$TagSpaces Custom$q$, $q$Custom quote$q$, $q$custom$q$, $q$["On-premises deployment","White-label options","Priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$TagSpaces is a file-based organization tool: instead of importing files into a database, it lets you add color-coded tags, notes, and metadata directly to files and folders on your own disk or cloud-synced storage. The core desktop app, TagSpaces Lite, is free and open source under the AGPL license and runs offline with no account required.$q$, $q$TagSpaces Pro adds collaborative tagging, AI-assisted tag generation and summarization (run offline), advanced search, Kanban boards, and calendar/map perspectives, sold as an annual per-user subscription or a one-time license. A Custom/enterprise tier adds on-premises deployment and white-labeling for organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It fits people who want to organize large personal or professional file collections (documents, photos, research) without locking them into a proprietary cloud database, plus teams that want shared tagging and richer views (Pro) while keeping files on their own storage.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4fc44f9d-3d70-4d9a-8fdf-e308b7b624e5', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Tiny File Manager ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tiny File Manager is a free, open-source, single-file PHP web file manager with a built-in code editor and no database requirement.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tiny File Manager is a free, open-source, single-file PHP file manager with a built-in code editor and no database requirement.$q$,
  og_description = $q$Tiny File Manager is a free, open-source, single-file PHP file manager with a built-in code editor and no database requirement.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3f583e3e-2f7f-4949-b806-41aa6c8365bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3f583e3e-2f7f-4949-b806-41aa6c8365bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Single-file install$q$, $q$The entire application ships as one PHP file with no database dependency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Built-in code editor$q$, $q$Edit files directly in the browser with syntax highlighting for 150+ languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$File previews$q$, $q$Preview images, video, audio, PDFs, and text files without downloading them.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Multi-user support$q$, $q$Configure multiple users with different access levels.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Zip and batch operations$q$, $q$Create zip archives and perform batch copy, move, or delete operations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Docker support$q$, $q$Official Docker image available for containerized deployment.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Free and open source under GPL v3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Extremely easy to deploy — a single file, no database$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Built-in code editor useful for quick server-side edits$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Available in 50+ languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Single-file design has drawn scrutiny for the need to keep it updated against security issues, since it's a common target when misconfigured on public servers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Feature set is more basic than dedicated DAM or sync tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Best suited for smaller deployments rather than large multi-team environments$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Is Tiny File Manager free?$q$, $q$Yes, it is free and open source under the GNU GPL v3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Does it need a database?$q$, $q$No, it runs from a single PHP file with no database required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Can multiple users share it?$q$, $q$Yes, it supports multiple users with configurable access levels.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Can I run it in Docker?$q$, $q$Yes, an official Docker image is available.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$Quick server file management$q$, $q$Drop a single PHP file onto a shared or VPS server to get instant browser-based file management.$q$, $q$Developers and hosting admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$In-browser code editing$q$, $q$Edit configuration files or scripts directly on the server without SSH access.$q$, $q$Sysadmins and small dev teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tiny File Manager is a self-hosted web file manager distributed as a single PHP file under the GNU GPL v3.0 license. It requires PHP 5.5 or higher, no database, and can be dropped onto any Apache or Nginx server (or run via the provided Docker image) to get a full browser-based file management interface.$q$, $q$It supports uploading, downloading, editing, previewing, and organizing files, including zip/unzip, copy/move between folders, and a built-in code editor with syntax highlighting for over 150 languages. Multi-user access with configurable permission levels is supported, along with CSRF protection and secure password hashing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's popular with developers and hosting administrators who need a lightweight, drop-in file manager for a shared or VPS hosting environment where installing a full application stack isn't practical.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f583e3e-2f7f-4949-b806-41aa6c8365bb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── 0 A.D. ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$0 A.D. is a free, open-source real-time strategy game of ancient warfare, playable offline, on LAN, or online multiplayer.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$0 A.D. is a free, open-source real-time strategy game of ancient warfare for Windows, macOS, and Linux, with LAN and online multiplayer.$q$,
  og_description = $q$0 A.D. is a free, open-source real-time strategy game of ancient warfare for Windows, macOS, and Linux, with LAN and online multiplayer.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd914b7e6-4a4c-4cbc-b2ff-053743538f3f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$15 playable civilizations$q$, $q$Command historically themed factions including Romans, Carthaginians, Persians, and the Han Dynasty.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Multiplayer lobby and LAN play$q$, $q$Host or join matches via an online lobby, direct IP connection, or local network.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Customizable match setup$q$, $q$Configure player counts, teams, and population limits before a game.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Historically detailed units and buildings$q$, $q$Includes period-appropriate technology trees, buildings, and gendered civilian unit models.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Cross-platform releases$q$, $q$Available for Windows, macOS, and Linux, including AppImage, Snap, and Flatpak builds.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$No monetization$q$, $q$No freemium mechanics, ads, or paid content of any kind.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Completely free with no ads or microtransactions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Open-source code and artwork under permissive licenses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Deep RTS mechanics with 15 distinct civilizations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Player-hostable multiplayer via LAN or direct IP$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Still under active alpha/beta-style development with occasional rough edges$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$No official mobile release$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Smaller multiplayer population than major commercial RTS titles$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Is 0 A.D. really free?$q$, $q$Yes, it is completely free with no freemium model, ads, or paid content.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$What platforms does it run on?$q$, $q$Windows 10/11, macOS 10.15+, and Linux, with several Linux packaging formats available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Can I host my own multiplayer matches?$q$, $q$Yes, players can host games directly over LAN or a direct IP connection, in addition to the public matchmaking lobby.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Is the source code available?$q$, $q$Yes, the game code is licensed under GPL v2 and the artwork under CC-BY-SA 3.0.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$Free RTS gaming$q$, $q$Play a full-featured real-time strategy game with no cost or ads.$q$, $q$RTS enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$LAN party or self-hosted matches$q$, $q$Host multiplayer matches directly between players without relying on a commercial server.$q$, $q$Gaming communities and LAN organizers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$0 A.D. is a real-time strategy game developed by Wildfire Games, released as free and open-source software: the code is licensed under GPL v2 and the artwork under CC-BY-SA 3.0. There is no freemium model, in-game advertising, or paid DLC — the full game is free to download and play on Windows, macOS, and Linux.$q$, $q$Players build and manage ancient civilizations, gathering resources, training units, and waging tactical battles across historical settings. The game includes 15 playable civilizations such as the Romans, Carthaginians, Persians, and Han Dynasty, and supports both single-player campaigns/skirmishes and online multiplayer through a matchmaking lobby or direct LAN/IP connections that players can host themselves.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$0 A.D. appeals to real-time strategy fans who want a deep, historically themed RTS without any cost, and to homelab/LAN party organizers who want a game that can be hosted directly between players without a commercial matchmaking service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d914b7e6-4a4c-4cbc-b2ff-053743538f3f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── DDraceNetwork ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$DDraceNetwork (DDNet) is a free, open-source cooperative multiplayer platformer mod of Teeworlds, playable with up to 64 players per map.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$DDraceNetwork (DDNet) is a free, open-source cooperative multiplayer platformer mod of Teeworlds, supporting up to 64 players and private server hosting.$q$,
  og_description = $q$DDraceNetwork (DDNet) is a free, open-source cooperative multiplayer platformer mod of Teeworlds, supporting up to 64 players and private server hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'acb4633f-9c12-4fe7-abe7-4e2c008d1d04';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'acb4633f-9c12-4fe7-abe7-4e2c008d1d04' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Cooperative platforming$q$, $q$Up to 64 players can work together to complete custom maps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Global ranking system$q$, $q$Tracks points and rankings across official servers and tournaments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$International tournaments$q$, $q$Organized competitive events where players compete for rankings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Custom map support$q$, $q$Community-created maps and in-game map-making tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Private server hosting$q$, $q$Communities can run their own DDNet servers alongside the official worldwide servers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Cross-platform availability$q$, $q$Direct downloads for Windows, macOS, and Linux, plus a Steam release.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Completely free to play with open-source code$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Large library of community-made cooperative maps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Active tournament and ranking scene$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Communities can self-host private servers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Niche genre (cooperative precision platformer) with a learning curve$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Retro pixel-art presentation may not appeal to all players$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Relies on voluntary donations to fund official server infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Is DDraceNetwork free?$q$, $q$Yes, it is free to play and open source, with optional voluntary donations to support server costs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Can I host my own server?$q$, $q$Yes, DDNet supports privately hosted servers alongside the official worldwide server network.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$What platforms are supported?$q$, $q$Windows, macOS, and Linux, plus a Steam release.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$How many players can play together?$q$, $q$Up to 64 players can join a single cooperative map.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Cooperative multiplayer platforming$q$, $q$Team up with other players to complete community-made maps.$q$, $q$Casual and competitive platformer fans$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$Community server hosting$q$, $q$Run a private DDNet server for a gaming community or friend group.$q$, $q$Gaming communities and server admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$DDraceNetwork (DDNet) is a free, open-source, community-maintained modification of DDRace, itself built on the Teeworlds engine. Its source code is publicly hosted on GitHub. Instead of player-versus-player combat, DDNet's core gameplay has players cooperate to navigate custom, community-made maps together, with up to 64 players able to join a single map.$q$, $q$The game includes a global ranking system, official international tournaments, in-game map-making tools, and both official worldwide servers and support for privately hosted servers. It's available as a direct download for Windows, macOS, and Linux, and has also been distributed on Steam since 2020.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$DDNet suits players who enjoy cooperative precision-platforming challenges and community-made content, as well as server operators and communities who want to run their own private DDNet servers for custom maps or events.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb4633f-9c12-4fe7-abe7-4e2c008d1d04', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Digibuzzer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Digibuzzer is a free, open-source, self-hostable web app by La Digitale for running live buzzer-style quiz games in a virtual game room.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Digibuzzer is a free, open-source, self-hostable web app for running live buzzer-style quiz games with no account or data collection required.$q$,
  og_description = $q$Digibuzzer is a free, open-source, self-hostable web app for running live buzzer-style quiz games with no account or data collection required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '384faab2-7aa8-4e95-8df9-454c72ae8bb2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '384faab2-7aa8-4e95-8df9-454c72ae8bb2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Virtual buzzer game rooms$q$, $q$Host a live quiz where participants compete to answer first from their own device.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$No account required$q$, $q$Both hosts and participants can join without registering or providing personal data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Host-controlled scoring$q$, $q$The host validates or rejects answers and points/rankings update automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Self-hostable$q$, $q$Open-source under AGPL-3.0, deployable via Node.js/Redis or Docker for organizations that want their own instance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Multi-language interface$q$, $q$Available in multiple languages including French, English, Italian, German, and Spanish.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$No account or data collection required to use the hosted version$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Simple, fast setup for live classroom or training activities$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Self-hostable via Docker for organizations with data or privacy requirements$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Feature set is narrowly focused on the buzzer quiz format rather than general quiz-building$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Self-hosting requires Node.js and Redis knowledge$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Documentation is primarily oriented toward French-speaking educators$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Is Digibuzzer free?$q$, $q$Yes, the hosted version at digibuzzer.app is free, and the source code is open source under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Do participants need an account?$q$, $q$No, both the host and participants can join a game room without registering.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Can I self-host Digibuzzer?$q$, $q$Yes, it can be deployed with Node.js and Redis or via the provided Docker configuration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Who makes Digibuzzer?$q$, $q$It's developed by La Digitale, a French team building open-source educational web tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Classroom review games$q$, $q$Run a live buzzer-style question and answer session to review material with students.$q$, $q$Teachers and trainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$Remote or in-person team quizzes$q$, $q$Host a competitive quiz activity for a group, in person or over video call.$q$, $q$Educators and workshop facilitators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Digibuzzer is a free web application from La Digitale, a French developer of open-source educational tools. It lets a host run a live quiz-style activity where participants join a virtual game room from their own phone or computer and race to be the first to answer, similar in spirit to a TV quiz buzzer.$q$, $q$The hosted version at digibuzzer.app requires no account or registration and collects no participant data. The project's source code is published on Codeberg under the AGPL-3.0 license, and it can also be self-hosted using Node.js and Redis, or deployed with the provided Docker configuration, for organizations that want to run their own instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Digibuzzer is built primarily for teachers and trainers running live review sessions or quizzes, in person or remotely, and for anyone who wants a simple, self-hostable, account-free buzzer game for interactive sessions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('384faab2-7aa8-4e95-8df9-454c72ae8bb2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Lila ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lila is the open-source Scala/TypeScript codebase that powers Lichess, the free, ad-free online chess server.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = $q$Independent non-profit open-source project$q$,
  headquarters = $q$France (registered non-profit association)$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Lila is the open-source Scala/TypeScript codebase behind Lichess, the free, ad-free, self-hostable online chess platform.$q$,
  og_description = $q$Lila is the open-source Scala/TypeScript codebase behind Lichess, the free, ad-free, self-hostable online chess platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c79fd2a4-de89-4e02-bf96-2e51b3747f3b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c79fd2a4-de89-4e02-bf96-2e51b3747f3b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Stockfish analysis$q$, $q$In-browser (WebAssembly) and server-side game analysis using the Stockfish engine, free for every player.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Puzzles$q$, $q$A large, continuously generated tactics puzzle database, including puzzle rush and streak modes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Tournaments$q$, $q$Automated arena and Swiss-format tournaments running continuously, open to any player.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Study and broadcast tools$q$, $q$Shared analysis boards and live broadcasting of over-the-board chess events.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Public API$q$, $q$A documented REST/Board/Bot API for building bots, exporting games, and integrating with third-party tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Fully open source$q$, $q$The entire stack, from backend to mobile app, is published on GitHub and open to community contribution.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Completely free with no ads or premium paywall$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Full source code is public, auditable, and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Deep Stockfish integration for analysis$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Well-documented public API for bots and integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Large, active player and developer community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Self-hosting the complete production stack (search, analysis workers, websockets) requires significant DevOps effort$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Not designed as a general-purpose product outside of chess$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Documentation and codebase target experienced developers rather than casual self-hosters$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Is Lichess/Lila free to use?$q$, $q$Yes. Lichess is entirely free, ad-free, and funded by donations; there is no premium tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Can I self-host Lila?$q$, $q$Yes, the source code is public on GitHub under the lichess-org organization, but replicating the full production infrastructure is complex.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$What license is the code under?$q$, $q$Lichess's software and design are open source, primarily under the AGPL, with some components under other free licenses.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Does Lichess have an API?$q$, $q$Yes, a public API supports reading game data and building bots and boards that play on the platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Playing chess online$q$, $q$Free, ad-free games, puzzles, and tournaments against players worldwide.$q$, $q$Chess players of any skill level$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Building a chess bot$q$, $q$Using the Bot/Board API to develop and run automated players or study tools.$q$, $q$Developers and chess engine hobbyists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$Running a private instance$q$, $q$Deploying the open-source Lila codebase for an organization or research purpose.$q$, $q$Technical teams and open-source contributors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Lila (short for "li[chess in Sca]la") is the open-source software that runs Lichess.org, one of the world's largest online chess platforms. The project was started in 2010 by French programmer Thibault Duplessis and is maintained as a registered non-profit association in France, funded by donations rather than ads or subscriptions.$q$, $q$The codebase is built primarily in Scala on the backend with TypeScript and Sass on the frontend, alongside Rust and Python microservices and a Flutter mobile client. Because the entire stack is public on GitHub under the lichess-org organization, developers can inspect, modify, and in principle self-host their own instance, though running the full production-grade infrastructure (search, analysis workers, websockets) is a nontrivial engineering effort.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Lila is relevant to two audiences: chess players who use Lichess directly for free games, puzzles, and tournaments, and developers who want to build chess bots, tools, or study integrations against Lichess's public API, or who are curious about running or contributing to large-scale open-source infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c79fd2a4-de89-4e02-bf96-2e51b3747f3b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Luanti ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Luanti (formerly Minetest) is a free, open-source voxel game engine for building and playing moddable sandbox worlds.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Luanti (formerly Minetest) is a free, open-source, moddable voxel game engine for Windows, macOS, Linux, and Android.$q$,
  og_description = $q$Luanti (formerly Minetest) is a free, open-source, moddable voxel game engine for Windows, macOS, Linux, and Android.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '77a26385-9077-48ad-bcca-92dcc22cef2e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '77a26385-9077-48ad-bcca-92dcc22cef2e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Lua scripting API$q$, $q$Build full games, mods, or mechanics in Lua without handling rendering or networking directly.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$ContentDB$q$, $q$A community repository with thousands of open-source mods, games, and texture packs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Massive worlds$q$, $q$Maps can span tens of thousands of blocks in each direction, with deep vertical range.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Multiplayer$q$, $q$Solo play, local co-op, or online servers supporting many simultaneous players.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Cross-platform client$q$, $q$Runs on Windows, macOS, Linux, BSD, and Android.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Open licensing$q$, $q$Engine code is MIT-licensed; official content is CC BY-SA, keeping the whole project freely redistributable.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Huge modding ecosystem through ContentDB$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Runs well on low-end hardware$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Long project history and active development since 2010$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Self-hostable multiplayer servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$The default game is minimal; most compelling content comes from third-party mods and games$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Visuals are simpler than commercial voxel games$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Building a custom game requires comfort with the Lua API$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Is Luanti the same project as Minetest?$q$, $q$Yes, Minetest was renamed to Luanti in October 2024; it's the same codebase and community.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Is Luanti free?$q$, $q$Yes, it is entirely free and open source.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Can I make my own game with it?$q$, $q$Yes, the Lua API is designed to let you build complete games without writing engine code.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Does it run on mobile?$q$, $q$Yes, an Android client is available.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Voxel sandbox play$q$, $q$Explore and build in Minecraft-style worlds using existing community games.$q$, $q$Casual players seeking a free voxel sandbox$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Custom game development$q$, $q$Build and publish a custom voxel game or mod using the Lua API.$q$, $q$Hobbyist and indie game developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$Self-hosted community server$q$, $q$Run a private multiplayer server for friends, a school, or a community.$q$, $q$Server admins and communities$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Luanti, formerly known as Minetest, is an open-source voxel game creation platform originally released in 2010 by Perttu Ahola. It was renamed to Luanti in October 2024 to better reflect its role as a general-purpose engine rather than a single fixed game. The engine code is MIT-licensed and community content is typically CC BY-SA.$q$, $q$Rather than shipping one polished game, Luanti provides a Lua scripting API that lets developers build entire games, mods, or texture packs without writing low-level rendering or networking code. Thousands of community-made mods and games are distributed through ContentDB, and the engine supports massive worlds and both single-player and multiplayer modes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Luanti suits players who enjoy Minecraft-style voxel sandboxes and want a free, open alternative, as well as hobbyist and indie developers who want to build a custom voxel game or mod using Lua without building an engine from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('77a26385-9077-48ad-bcca-92dcc22cef2e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Mindustry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mindustry is a free, open-source sandbox tower-defense game combining factory automation with real-time combat.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = $q$Independent developer / open-source community$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mindustry is a free, open-source sandbox tower-defense game blending factory automation with real-time combat, for desktop and mobile.$q$,
  og_description = $q$Mindustry is a free, open-source sandbox tower-defense game blending factory automation with real-time combat, for desktop and mobile.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a0efe36-6967-41a8-8703-57fdd1450a58';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a0efe36-6967-41a8-8703-57fdd1450a58' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Tower-defense combat$q$, $q$Defend bases from escalating waves of enemies using turrets and defensive structures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Factory automation$q$, $q$Design production chains with conveyors, drills, and processors to supply your defenses.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Logic system$q$, $q$A built-in programming system for automating and controlling factory behavior.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Multiplayer servers$q$, $q$Cooperative and competitive multiplayer, including self-hosted dedicated servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Campaign and sandbox modes$q$, $q$Story-driven campaign play plus a free-build sandbox mode.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Mod support$q$, $q$Community mods can add new content, maps, and mechanics.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Free and open source on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Deep automation mechanics combined with combat$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Cross-platform across desktop and mobile$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Active modding community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Self-hostable multiplayer servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$The automation/logic systems have a steep learning curve$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Simple 2D pixel-art visuals may not appeal to players wanting high-fidelity graphics$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$No official browser-playable build of the current game (only an older "Classic" version)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Is Mindustry free?$q$, $q$Yes, it's completely free, with optional pay-what-you-want support on itch.io.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Is Mindustry open source?$q$, $q$Yes, the source is public on GitHub under Anuken/Mindustry.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Can I host my own server?$q$, $q$Yes, dedicated multiplayer servers are supported.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$What platforms does it support?$q$, $q$Windows, macOS, Linux, Android, and iOS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Solo automation and defense$q$, $q$Build production chains and defend against enemy waves offline.$q$, $q$Single-player fans of automation/tower-defense games$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Co-op multiplayer$q$, $q$Build and defend a base together with friends on shared servers.$q$, $q$Groups of friends playing cooperatively$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$Community server hosting$q$, $q$Run a public or private self-hosted Mindustry server.$q$, $q$Server admins and gaming communities$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mindustry was created in 2017 by developer Anuken for a game jam and has since grown into a full open-source tower-defense and factory-automation game. Players build production chains that mine, process, and transport resources while defending their base from waves of enemies, with the source code publicly maintained on GitHub.$q$, $q$The game blends the logistics depth of automation games with real-time combat, adding a programmable logic system that lets players script factory behavior. It supports both single-player campaign/sandbox play and multiplayer servers for cooperative or competitive matches.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mindustry appeals to players who enjoy factory-automation games (in the spirit of Factorio) alongside tower-defense combat, and to communities who want to run their own free multiplayer servers or build custom content through its modding support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a0efe36-6967-41a8-8703-57fdd1450a58', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── MTA:SA ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Multi Theft Auto: San Andreas (MTA:SA) is a free, open-source multiplayer modification that turns GTA: San Andreas into an online game.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Multi Theft Auto: San Andreas (MTA:SA) is a free, open-source multiplayer mod that adds online play to GTA: San Andreas with Lua scripting.$q$,
  og_description = $q$Multi Theft Auto: San Andreas (MTA:SA) is a free, open-source multiplayer mod that adds online play to GTA: San Andreas with Lua scripting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cb496915-ab02-4433-8bfc-70ec1fc91a9c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cb496915-ab02-4433-8bfc-70ec1fc91a9c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Lua scripting$q$, $q$Build custom game modes, scripts, and server logic in Lua.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$In-game map editor$q$, $q$Create and modify maps directly within the game.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Multiple game modes$q$, $q$Community servers offer roleplay, racing, deathmatch, stealth, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Dedicated servers$q$, $q$Self-hostable client-server architecture for running persistent communities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Player synchronization$q$, $q$Networking tuned for smooth, low-latency multiplayer sync.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Race mode$q$, $q$Built-in racing mode with hundreds of community-made tracks.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Mature project with a development history going back over two decades$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Deep Lua scripting for custom game modes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Large ecosystem of community-run servers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Self-hostable dedicated servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Requires a separately, legally owned copy of GTA: San Andreas$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Windows-focused client experience$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Server administration and scripting have a learning curve for newcomers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Is MTA:SA free?$q$, $q$The modification itself is free; you must separately own a legitimate copy of GTA: San Andreas.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Is MTA:SA open source?$q$, $q$Yes, the client and server code are open source and available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Can I run my own server?$q$, $q$Yes, dedicated servers are a core part of how MTA:SA communities operate.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$What can I build with it?$q$, $q$Custom multiplayer game modes and maps using its Lua scripting system and map editor.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Online GTA San Andreas play$q$, $q$Play GTA: San Andreas online with friends or public communities.$q$, $q$GTA: San Andreas players$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Running a roleplay or racing server$q$, $q$Operate a self-hosted community server with custom rules and content.$q$, $q$Server administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$Custom game mode development$q$, $q$Script new multiplayer game modes with Lua and the built-in map editor.$q$, $q$Modders and scripters$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Multi Theft Auto began in 2003 as an experimental multiplayer patch for the original Grand Theft Auto III and evolved over two decades into MTA:SA, a full open-source multiplayer engine for Grand Theft Auto: San Andreas. The mod's client and dedicated-server code are maintained openly on GitHub by the Multi Theft Auto community.$q$, $q$MTA:SA adds a client-server networking layer, a Lua scripting system, and an in-game map editor on top of the base game, enabling community-run servers for roleplay, racing, deathmatch, and other custom game modes. It requires a legally owned copy of GTA: San Andreas to run, since the mod does not include the base game itself.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MTA:SA is aimed at GTA: San Andreas players who want to play online with friends or on community servers, and at server administrators/scripters who want to build custom multiplayer game modes using Lua and the map editor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb496915-ab02-4433-8bfc-70ec1fc91a9c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── OpenTTD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenTTD is a free, open-source simulation game that recreates and extends Transport Tycoon Deluxe with modern features.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenTTD is a free, open-source transport simulation game inspired by Transport Tycoon Deluxe, with multiplayer and deep modding support.$q$,
  og_description = $q$OpenTTD is a free, open-source transport simulation game inspired by Transport Tycoon Deluxe, with multiplayer and deep modding support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae510c8a-18ad-492c-8df9-432190e35f9d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae510c8a-18ad-492c-8df9-432190e35f9d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Transport network building$q$, $q$Construct and manage road, rail, sea, and air routes for passengers and cargo.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Multiplayer$q$, $q$Join public community servers or self-host your own multiplayer game.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$NewGRF customization$q$, $q$Install custom graphics, vehicles, and content packs built by the community.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$AI and game scripts$q$, $q$Add scripted AI opponents or custom game rules.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Scenario editor$q$, $q$Design custom maps and scenarios from scratch.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Ongoing active development$q$, $q$Regular stable releases plus testing and nightly builds since 2004.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Completely free and open source (GPL v2)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Long track record with active development since 2004$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Deep customization via NewGRF and AI/game scripts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Runs on modest hardware$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Self-hostable multiplayer servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Base graphics look dated without installing custom NewGRF sets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Interface and mechanics have a learning curve for newcomers to tycoon games$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Full authentic recreation benefits from original Transport Tycoon Deluxe assets, though free open graphics packs are available as an alternative$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Is OpenTTD free?$q$, $q$Yes, it is entirely free and open source under the GNU GPL v2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Do I need the original Transport Tycoon Deluxe to play?$q$, $q$No, free open graphics packs are available so the game can be played without the original commercial data files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Can I host a multiplayer server?$q$, $q$Yes, and OpenTTD also maintains a list of public community servers to join.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$How long has OpenTTD been in development?$q$, $q$It was first released in 2004 and has been actively developed continuously since.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Solo tycoon play$q$, $q$Build and optimize transport networks for profit at your own pace.$q$, $q$Fans of transport/economic simulation games$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Competitive multiplayer$q$, $q$Compete or cooperate with others on public or private servers.$q$, $q$Multiplayer strategy/simulation players$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$Self-hosted community server$q$, $q$Run a persistent server with custom rules and NewGRF content packs.$q$, $q$Server admins and OpenTTD communities$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenTTD grew out of a reverse-engineering effort of the original Transport Tycoon Deluxe and was first released as its own open-source project on March 6, 2004. It has been in continuous, active development ever since under the GNU GPL v2 license, with regular stable releases alongside testing and nightly builds.$q$, $q$Players design and operate road, rail, sea, and air transport networks to move passengers and cargo for profit. The game supports extensive customization through the NewGRF system for custom graphics and vehicles, AI and game scripts, and both public and self-hosted multiplayer servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenTTD is for fans of transport/tycoon simulation games who want a free, deeply moddable, and actively maintained alternative to the original commercial title, whether playing solo, competitively online, or on a self-hosted community server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae510c8a-18ad-492c-8df9-432190e35f9d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Red Eclipse 2 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Red Eclipse 2 is a free, open-source first-person arena shooter built around parkour movement and fast multiplayer combat.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2011,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Red Eclipse 2 is a free, open-source first-person arena shooter with parkour movement, built on the Cube 2 engine.$q$,
  og_description = $q$Red Eclipse 2 is a free, open-source first-person arena shooter with parkour movement, built on the Cube 2 engine.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '59de2787-72b5-4f39-9d09-b260b1994aa6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '59de2787-72b5-4f39-9d09-b260b1994aa6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Parkour movement$q$, $q$Wall-running, dashing, and impulse boosts layered on top of arena combat.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Real-time map editing$q$, $q$Edit levels collaboratively while playing, using tools inherited from the Cube 2 engine lineage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Mutators$q$, $q$Configurable game variables and mutators to customize match rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Cross-platform support$q$, $q$Runs on Windows, GNU/Linux, BSD, and macOS.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Multiplayer arenas$q$, $q$Fast-paced multiplayer matches designed around movement and balance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Open-source engine$q$, $q$Built on Cube Engine 2 with SDL and OpenGL, fully open source.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Distinct, movement-focused gameplay compared to typical arena shooters$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Real-time collaborative map editing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Cross-platform support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Community-run servers available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Smaller player base than mainstream commercial shooters$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Visuals are dated relative to modern AAA titles$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Limited official documentation for setting up custom self-hosted servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Is Red Eclipse 2 free?$q$, $q$Yes, it is completely free to download and play.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Is it open source?$q$, $q$Yes, Red Eclipse is free and open-source software.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$What engine does it use?$q$, $q$A custom, rewritten build of the Cube 2 engine used for the 2.0 "Jupiter Edition."$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Can I run my own server?$q$, $q$Yes, community server hosting is supported, and a server list is available on the official site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Fast arena multiplayer$q$, $q$Jump into parkour-driven deathmatch and objective modes.$q$, $q$Fans of fast-paced arena shooters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Custom map creation$q$, $q$Build and edit levels in real time using the in-game editor.$q$, $q$Mappers and modders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$Community server hosting$q$, $q$Run a self-hosted public or private Red Eclipse 2 server.$q$, $q$Server administrators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Red Eclipse is a free and open-source first-person arena shooter built on a custom version of the Cube 2 engine, with its first stable release in March 2011. The project later moved to a rewritten engine for its 2.0 "Jupiter Edition" release, distributed on Steam and the official site as Red Eclipse 2.$q$, $q$The game emphasizes agility over pure gunplay, layering parkour-style wall-running and impulse boosts on top of arena deathmatch and objective modes. It ships with real-time in-game map editing, extensive mutators for tweaking game rules, and cross-platform support for Windows, Linux, BSD, and macOS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Red Eclipse 2 suits players looking for a fast, movement-focused arena shooter outside the mainstream commercial catalog, as well as mappers and modders who want to build and share custom content using the built-in real-time editor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59de2787-72b5-4f39-9d09-b260b1994aa6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Suroi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Suroi is a free, open-source 2D battle royale game that runs entirely in the browser, inspired by surviv.io.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2023,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Suroi is a free, open-source, browser-based 2D battle royale game inspired by surviv.io, playable instantly with no install.$q$,
  og_description = $q$Suroi is a free, open-source, browser-based 2D battle royale game inspired by surviv.io, playable instantly with no install.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd02a6964-f2f8-4c33-b305-57eb379fdf40' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Browser-based play$q$, $q$Runs directly in a web browser via WebGL, with no download or installation required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Seasonal events$q$, $q$Rotating limited-time modes and seasonal content such as Halloween and Winter events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Growing weapon roster$q$, $q$Regularly expanded weapons, items, and mechanics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Open-source client and server$q$, $q$Full source available on GitHub, enabling self-hosting and community contributions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Customizable settings$q$, $q$Adjustable gameplay, graphics, and interface options.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Active update cadence$q$, $q$Frequent community-driven updates released on a regular schedule.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Completely free, no install, playable instantly in a browser$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Fully open source and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Frequent content updates from an active development community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Lightweight compared to 3D battle royale games$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Still labeled a work in progress with ongoing balance and content changes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Smaller map/mode variety than established commercial battle royale games$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Browser performance depends on the player's device and network$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is Suroi free?$q$, $q$Yes, it is entirely free to play.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is Suroi open source?$q$, $q$Yes, the code is public on GitHub and can be self-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Do I need to install anything?$q$, $q$No, Suroi runs directly in a web browser using WebGL.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Is Suroi a finished game?$q$, $q$No, it is actively developed and officially described as a work in progress.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Quick browser battle royale$q$, $q$Play instantly without downloading a client.$q$, $q$Casual players wanting a fast battle royale session$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Self-hosting an instance$q$, $q$Run a private or public Suroi server from the open-source repository.$q$, $q$Developers and server administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$Open-source contribution$q$, $q$Contribute code, content, or bug fixes to an actively developed web game.$q$, $q$Web/game developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Suroi is an open-source 2D battle royale game created in 2023 by developer HasangerGames, directly inspired by surviv.io. It runs entirely in the browser via WebGL, so there is no client to install, and both the client and server code are published on GitHub, allowing anyone to self-host an instance.$q$, $q$The project is actively developed and explicitly labeled a work in progress, with a growing weapon and item roster, regular seasonal events, and frequent community-driven updates published on a recurring "Suroi Sundays" cadence.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Suroi is aimed at players who want quick, install-free battle royale sessions in a browser, and at developers interested in contributing to or self-hosting an open-source multiplayer web game.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d02a6964-f2f8-4c33-b305-57eb379fdf40', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Veloren ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Veloren is a free, open-source multiplayer voxel RPG written in Rust, inspired by Cube World and Minecraft.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2018,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Veloren is a free, open-source multiplayer voxel RPG written in Rust, with self-hostable servers and procedurally generated worlds.$q$,
  og_description = $q$Veloren is a free, open-source multiplayer voxel RPG written in Rust, with self-hostable servers and procedurally generated worlds.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bd0b0ec4-080c-44f8-8cca-2ceddee81151';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bd0b0ec4-080c-44f8-8cca-2ceddee81151' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Procedural world generation$q$, $q$Explore open fantasy landscapes including mountains, deserts, and jungles, plus caves for mining.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Dynamic combat$q$, $q$Varied weapons and playstyles with real-time action combat.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Crafting and dungeons$q$, $q$Craft gear and take on dungeon bosses and monster encounters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Creature taming$q$, $q$Tame creatures to serve as companions or mounts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Self-hosted multiplayer$q$, $q$Host your own server, including over LAN, for cooperative play.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Built in Rust$q$, $q$Performance-focused engine written in Rust by an active contributor community.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Completely free and open source (GPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Self-hostable multiplayer, including LAN play$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Actively developed by a sizable contributor community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Uses only original, community-made assets$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Content and world variety are smaller than established commercial RPGs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Requires a reasonably capable PC for smooth performance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Ongoing active development means gameplay systems can change between releases$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Is Veloren free?$q$, $q$Yes, it is completely free to play.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Is Veloren open source?$q$, $q$Yes, it is licensed under GPL-3.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Can I host my own server?$q$, $q$Yes, including hosting over LAN for local multiplayer.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$What is Veloren written in?$q$, $q$Rust.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Solo or co-op exploration$q$, $q$Explore procedurally generated worlds, fight monsters, and craft gear.$q$, $q$Fans of voxel action-RPGs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Self-hosted multiplayer world$q$, $q$Run a private server, including over LAN, for friends or a community.$q$, $q$Players wanting a persistent shared world$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$Open-source contribution$q$, $q$Contribute code, art, or design to an actively developed Rust game.$q$, $q$Rust developers and open-source contributors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Veloren is a community-developed, open-source action-adventure voxel RPG written in Rust, with development starting in mid-2018. It is licensed under GPL-3.0, which the project describes as intended to keep the game free and open source permanently, and it is built entirely on original, community-created graphics, music, and other assets.$q$, $q$The game features procedurally generated open fantasy worlds spanning mountains, deserts, and jungles, dynamic combat with varied weapons, crafting, dungeon bosses, and creature taming. Multiplayer is core to the project, and players can host their own servers, including over LAN.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Veloren is for players who want a free, open-source alternative to voxel action-RPGs like Cube World, and for communities or individuals who want to self-host their own multiplayer world.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd0b0ec4-080c-44f8-8cca-2ceddee81151', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Zero-K ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zero-K is a free, open-source real-time strategy game built on the Spring engine, with physics-based unit combat.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Zero-K is a free, open-source real-time strategy game on the Spring engine, featuring physics-based combat and terrain manipulation.$q$,
  og_description = $q$Zero-K is a free, open-source real-time strategy game on the Spring engine, featuring physics-based combat and terrain manipulation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9b3e2e73-ff9d-46eb-852d-a3b455445f8b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9b3e2e73-ff9d-46eb-852d-a3b455445f8b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$100+ unit types$q$, $q$A large roster of units, each with distinct abilities and roles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Physics-based combat$q$, $q$Projectiles and unit movement follow physics simulation rather than simple hit-chance rolls.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Terrain manipulation$q$, $q$Dig canals, terraform, and reshape the battlefield as part of strategy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Large-scale matches$q$, $q$Supports games from 1v1 up to 16v16.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$PlanetWars$q$, $q$A persistent, competitive online campaign layered on top of regular matches.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Spring/Recoil engine$q$, $q$Built on the open-source Spring engine, with source available on GitHub.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Completely free, with no in-game currency or pay-to-win mechanics$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Fully open source (GPL v2 or later)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Deep physics-driven strategy mechanics$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Active multiplayer community and ranked ladder$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Supports large-scale multiplayer battles$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Steep learning curve typical of complex RTS games$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Smaller player base than mainstream commercial RTS titles$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Visuals are dated compared to modern commercial RTS games$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Is Zero-K free?$q$, $q$Yes, it is completely free with no in-game currency or pay-to-win elements.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Is Zero-K open source?$q$, $q$Yes, it is licensed under GPL v2 or later, with source on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$What engine does Zero-K run on?$q$, $q$The open-source Spring (Recoil) engine.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Can I play offline against AI?$q$, $q$Yes, campaign and AI skirmish modes are available alongside multiplayer.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Competitive RTS multiplayer$q$, $q$Play ranked 1v1 or team matches against other players.$q$, $q$Competitive RTS players$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Large-scale battles$q$, $q$Join or organize matches up to 16v16.$q$, $q$Players who enjoy large-scale strategy battles$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$Solo campaign and AI play$q$, $q$Play offline against AI or through the game's campaign.$q$, $q$Single-player strategy fans$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Zero-K is a free, open-source real-time strategy game that runs on the open-source Spring (Recoil) engine. It began as a Total Annihilation-style mod before all proprietary content was replaced, evolving into a fully independent game distributed under the GNU GPL v2-or-later license, with an official standalone Steam release in 2018.$q$, $q$The game is built around physics-based combat, where projectiles, unit movement, and terrain manipulation (such as digging canals or terraforming) are core strategic tools. Matches range from 1v1 duels up to large 16v16 team battles, and the game explicitly avoids in-game currency or pay-to-win mechanics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Zero-K appeals to RTS fans who want a free, deeply strategic game with no monetization, particularly players who enjoy large-scale battles, physics-driven mechanics, and terrain manipulation as part of their strategy.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9b3e2e73-ff9d-46eb-852d-a3b455445f8b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── auto-mcs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$auto-mcs is a free, open-source cross-platform tool for creating, updating, and managing Minecraft servers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = $q$Independent open-source project$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$auto-mcs is a free, open-source cross-platform tool for creating and managing Minecraft servers without manual port forwarding.$q$,
  og_description = $q$auto-mcs is a free, open-source cross-platform tool for creating and managing Minecraft servers without manual port forwarding.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$One-click server creation$q$, $q$Create Paper, Purpur, Fabric, Quilt, Forge, NeoForge, Spigot, CraftBukkit, or vanilla servers in under a minute.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$playit.gg integration$q$, $q$Expose your server to friends without manually configuring port forwarding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Telepath remote management$q$, $q$Manage a running server remotely from another device.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Plugin/mod manager$q$, $q$Install and update plugins and mods with built-in Modrinth integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Backups and access control$q$, $q$Automated backups plus operator and ban management tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$amscript$q$, $q$A custom scripting language for automating and extending server behavior.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Free and open source (GPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Avoids manual port forwarding via built-in playit.gg integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Supports most major Minecraft server platforms and modloaders$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Custom scripting (amscript) for automation beyond default admin tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Focused specifically on Minecraft, not a general-purpose server-hosting tool$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Smaller community and documentation footprint than established panels like MCSManager$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Advanced features such as remote management and scripting require additional setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Is auto-mcs free?$q$, $q$Yes, it is a free, open-source project.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$What Minecraft server types does it support?$q$, $q$Paper, Purpur, Fabric, Quilt, Forge, NeoForge, Spigot, CraftBukkit, and vanilla.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Do I need to configure port forwarding?$q$, $q$No, playit.gg integration lets friends connect without manual port forwarding.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Can I manage a server remotely?$q$, $q$Yes, via the built-in Telepath feature.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Quick server setup for friends$q$, $q$Spin up a Minecraft server to play with friends with minimal technical setup.$q$, $q$Casual Minecraft players without server-admin experience$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Server administration$q$, $q$Manage mods, plugins, backups, and access control for an existing server.$q$, $q$Minecraft server administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Automation with amscript$q$, $q$Script custom server behavior and automation routines.$q$, $q$Technical users wanting deeper server customization$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$auto-mcs is an open-source, cross-platform application for creating and managing Minecraft servers, maintained on GitHub under the GPL-3.0 license. It aims to remove the friction of manual server setup, letting users create a Paper, Purpur, Fabric, Quilt, Forge, NeoForge, Spigot, CraftBukkit, or vanilla server in under a minute.$q$, $q$Beyond initial setup, auto-mcs bundles administration tools including automatic updates, backups, access control, a plugin/mod manager integrated with Modrinth, and its own scripting language called amscript for extending server behavior. It also integrates playit.gg so friends can connect without manual port forwarding, and offers remote management through a feature called Telepath.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$auto-mcs is built for players and small communities who want to run their own Minecraft server for friends without deep networking or server-administration knowledge, as well as more advanced users who want scripting and remote-management capabilities.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Calagopus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, Rust-based game server panel for deploying Minecraft, Rust, ARK, Valheim and other titles in isolated Docker containers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Calagopus is a free, open-source Rust panel for deploying and managing Minecraft, Rust, ARK, and Valheim game servers in Docker containers.$q$,
  og_description = $q$Calagopus is a free, open-source Rust panel for deploying and managing Minecraft, Rust, ARK, and Valheim game servers in Docker containers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5950887b-56e9-4a05-b6d2-f57b3d882853';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5950887b-56e9-4a05-b6d2-f57b3d882853' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Docker-based isolation$q$, $q$Each game server runs in its own container, keeping instances separated for stability and security.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Egg system$q$, $q$Game definitions ('eggs') let the panel support a wide range of titles beyond a fixed built-in list.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Rust Extension API$q$, $q$Developers can extend the panel with custom backend logic, routes, and UI components.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Migration tooling$q$, $q$Built-in tools help import existing setups from Pterodactyl or Pelican Panel.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Responsive, mobile-friendly UI$q$, $q$The web dashboard is designed to work across desktop and mobile screens.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$ARM64 / Raspberry Pi support$q$, $q$The panel can run on low-power ARM hardware in addition to standard x86 servers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Free and open source with no feature restrictions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Written in Rust for performance and memory safety$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Runs on low-power ARM64 hardware such as Raspberry Pi$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Provides a migration path for existing Pterodactyl/Pelican users$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Active Discord community for support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Newer project with a smaller install base and ecosystem than established panels$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Requires Docker knowledge to deploy and operate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Documentation and third-party resources are still maturing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Is Calagopus free to use?$q$, $q$Yes, the core panel is open source and free for both personal and commercial use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$What games can I host with Calagopus?$q$, $q$It uses an egg system that supports a wide range of games, including Minecraft, Rust, ARK, and Valheim.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Can I migrate from Pterodactyl or Pelican Panel?$q$, $q$Yes, the project provides migration tooling for both.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Does Calagopus run on a Raspberry Pi?$q$, $q$Yes, it supports ARM64 hardware including Raspberry Pi devices.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Community server hosting$q$, $q$Self-hosters running Minecraft, Rust, or Valheim servers for friends or a community.$q$, $q$Hobbyist admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$Multi-game hosting business$q$, $q$Providers offering multiple game titles to customers from a single control panel.$q$, $q$Small hosting providers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Calagopus is an open-source game server control panel written in Rust. It lets self-hosters and hosting providers deploy, monitor, and maintain multiple game server instances from a single web interface, with each server isolated in its own Docker container.$q$, $q$Games are added through an egg system similar to other panels in this space, which the project says can support arbitrary games including Minecraft, Rust, ARK: Survival Evolved, and Valheim. Calagopus also ships an Extension API written in Rust so developers can add custom backend logic, routes, and UI elements to the panel itself.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Calagopus targets both individual server admins running a handful of community servers and commercial hosting providers who need a lightweight, self-hosted control layer. Because it runs on ARM64, including Raspberry Pi hardware, it's also usable on low-power home setups.$q$, $q$The project provides migration tooling for people currently running Pterodactyl or Pelican Panel, positioning itself as a faster, Rust-based alternative for teams already familiar with that egg-based panel model.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5950887b-56e9-4a05-b6d2-f57b3d882853', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Crafty Controller ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source web panel for launching, managing, and backing up Minecraft servers from a browser.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Crafty Controller is a free, open-source web panel for launching, managing, and backing up Minecraft servers on Linux, Windows, macOS, or Docker.$q$,
  og_description = $q$Crafty Controller is a free, open-source web panel for launching, managing, and backing up Minecraft servers on Linux, Windows, macOS, or Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '27d05620-43c3-4522-a6b6-5ae2a23a50b9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '27d05620-43c3-4522-a6b6-5ae2a23a50b9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Multi-server, multi-version management$q$, $q$Run and switch between several Minecraft servers and versions from one dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Player and console management$q$, $q$Manage players and run server commands directly from the web UI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$File editor$q$, $q$Edit server configuration and world files without SSH or FTP.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Scheduled backups$q$, $q$Create and schedule backups of server worlds and data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Mobile PWA monitoring$q$, $q$A progressive web app lets admins check server status from a phone.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Secure authentication$q$, $q$Uses Argon2 password hashing and an SSL-secured web server.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Completely free, GPLv3 licensed, with full source available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Installers for Linux, Windows, Docker, macOS, and UnRAID$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Supports Spigot, Paper, Vanilla, and Bedrock server jars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$All data stays on the operator's own hardware$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Active Discord community for support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Focused solely on Minecraft, not other game titles$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Remote access requires manual port forwarding$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Backups and updates still need to be managed by the server operator$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Is Crafty Controller free?$q$, $q$Yes, it's free as in cost and free as in source code, under the GPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$What Minecraft server types does it support?$q$, $q$Any jar-based server, including Vanilla, Spigot, Paper, and Bedrock editions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Can I run multiple servers at once?$q$, $q$Yes, Crafty Controller can manage multiple servers and versions simultaneously.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Does it work on Windows?$q$, $q$Yes, there's a standalone Windows executable that requires no installation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Home Minecraft server$q$, $q$Managing a Minecraft server for friends and family from a simple web dashboard.$q$, $q$Hobbyist players$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$Small community hosting$q$, $q$Running and maintaining multiple Minecraft servers for a clan or community.$q$, $q$Community admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Crafty Controller is a free and open-source Minecraft server launcher and manager. It runs as a self-hosted web application, so admins start, stop, and configure Minecraft servers through a browser instead of the command line, and can port-forward the panel for remote access.$q$, $q$It supports running any Minecraft server jar, including Vanilla, Spigot, Paper, and Bedrock builds, and can manage multiple servers and versions from one install. Its data stays entirely on the host's own hardware.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$The tool is aimed at people who want to run a Minecraft server for friends, family, or a small community without learning server-console administration in depth. It's distributed under GPLv3, with source available on GitLab, and installable on Linux, Windows, Docker, macOS, and UnRAID.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27d05620-43c3-4522-a6b6-5ae2a23a50b9', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Drop ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source game library and distribution platform positioned as an alternative to Steam and Epic for your own collection.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Drop is a free, open-source, self-hosted game library and distribution platform, positioned as an alternative to Steam and Epic.$q$,
  og_description = $q$Drop is a free, open-source, self-hosted game library and distribution platform, positioned as an alternative to Steam and Epic.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Built-in storefront$q$, $q$A browsable storefront UI for discovering and filtering games in the library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Automatic metadata imports$q$, $q$Pulls metadata and artwork from IGDB, GiantBomb, and PCGamingWiki.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Rich metadata editing$q$, $q$Manually edit game descriptions with Markdown and custom images.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Native desktop client$q$, $q$Cross-platform client for downloading and launching games from the server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Flexible authentication$q$, $q$Supports simple built-in accounts or SSO for organizational deployments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Server news$q$, $q$Admins can post announcements visible to library users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Full ownership of the game library and its data$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Free, AGPLv3-licensed and open source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Automatic metadata and artwork enrichment from multiple sources$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Scales from personal use to organization-wide SSO deployments$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Native client for downloading and launching titles$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Requires self-hosting infrastructure and ongoing maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Users must supply their own legally owned game files$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Newer project relative to long-established self-hosted alternatives$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Is Drop a piracy tool?$q$, $q$No, Drop is a distribution platform for games you already own the rights to; it does not provide games itself.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Do I need a client app to use it?$q$, $q$Yes, a native cross-platform desktop client is used to download and launch games from a Drop server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Is Drop free?$q$, $q$Yes, it's open source under the AGPLv3 license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Can I use single sign-on?$q$, $q$Yes, Drop supports SSO integration alongside its built-in account system.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Personal game library$q$, $q$Hosting a private library of owned games accessible from home devices.$q$, $q$Individual hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$Organizational game distribution$q$, $q$Distributing internal builds or licensed titles to a team with SSO-based access.$q$, $q$Studios and organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Drop is an open-source, self-hosted platform for building and distributing a personal or organizational game library. It describes itself as an alternative to commercial storefronts like Steam and Epic, giving operators a built-in storefront UI, rich metadata editing with Markdown and image support, and automatic metadata imports from IGDB, GiantBomb, and PCGamingWiki.$q$, $q$A native cross-platform desktop client handles downloading and launching games from a Drop server, and admins can post server news to communicate with their users. Drop is released under the AGPLv3 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Drop suits people who want full control of their game library and data on their own infrastructure, rather than relying on a third-party platform. It supports both simple built-in accounts and SSO integration, so it can scale from a single household to an organization with existing identity systems, with the project stating it scales to libraries of thousands of games.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddb9f7aa-c8c0-4280-bea1-ba03e21c1bf6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── EasyWI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source web panel for hosters and gaming clans to centrally manage game servers, TeamSpeak, web space, and databases.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Easy-Wi is a free, open-source panel for hosters and clans to manage game servers, TeamSpeak, web space, and databases in one place.$q$,
  og_description = $q$Easy-Wi is a free, open-source panel for hosters and clans to manage game servers, TeamSpeak, web space, and databases in one place.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9f50961f-98ec-4271-b1ef-2f486257a4a5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9f50961f-98ec-4271-b1ef-2f486257a4a5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Multi-service management$q$, $q$Manage game servers and TeamSpeak 3 voice servers from one panel.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Crash recovery and monitoring$q$, $q$Automatically detects and recovers crashed services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Symlink-based installs$q$, $q$Shares common game files via symlinks to cut install time and disk usage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Webspace management$q$, $q$Manage websites served through Apache2, Nginx, and other web servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Database management$q$, $q$Provision and manage MySQL/MariaDB databases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Built-in CMS$q$, $q$Run project pages and news posts without a separate CMS.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Consolidates game server, voice server, web space, and database admin in one panel$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Symlink-based installs save disk space across multiple servers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Installers available for major Debian/Ubuntu/CentOS releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Relies on a volunteer community for development and support$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Less actively documented and marketed than newer panels$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Requires Linux server administration knowledge to deploy$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Is Easy-Wi free?$q$, $q$Yes, it's an open-source, community-driven project with no listed cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Does it manage more than game servers?$q$, $q$Yes, it can also manage TeamSpeak 3, web space, and MySQL/MariaDB databases.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$What operating systems are supported?$q$, $q$Installers are provided for several Debian, Ubuntu, and CentOS releases.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Game hosting provider$q$, $q$Running many game and voice server instances for paying customers.$q$, $q$Hosting businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$Clan infrastructure$q$, $q$Managing a gaming clan's servers, voice chat, and web presence together.$q$, $q$Gaming clans$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Easy-Wi is an open-source, self-hosted service administration platform built for hosting providers, clans, and sponsoring projects. It offers distributed management of multiple services from one interface, including game servers and TeamSpeak 3 voice servers, with monitoring and automatic crash recovery.$q$, $q$Beyond game servers, Easy-Wi can manage web space (Apache2/Nginx), MySQL/MariaDB databases, and includes a built-in CMS for running a project's pages and news. A symlink-based file-sharing approach reduces installation time and disk usage when deploying multiple game server instances.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Easy-Wi is aimed at hosting providers and gaming clans that need to administer many services (game servers, voice servers, web space, databases) from a single responsive control panel. Installers are provided for Debian, Ubuntu, and CentOS, and the project relies on volunteer contributors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f50961f-98ec-4271-b1ef-2f486257a4a5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GameAP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source game server management panel written in Go, with a REST API, remote console, and plugin system.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$GameAP is a free, open-source game server management panel written in Go, with a REST API, remote console, and plugin system.$q$,
  og_description = $q$GameAP is a free, open-source game server management panel written in Go, with a REST API, remote console, and plugin system.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ebf3f796-8c8b-4d07-a8cf-8d19e32204e3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ebf3f796-8c8b-4d07-a8cf-8d19e32204e3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Lightweight native binary$q$, $q$Runs without containers and reportedly fits within 256 MB of RAM.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Remote console$q$, $q$Browser-based server console access without needing SSH.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Task scheduler$q$, $q$Automates restarts, backups, and updates on custom intervals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Granular access control$q$, $q$Per-server permissions for different user roles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Documented REST API$q$, $q$API with example code in Go, PHP, and Node.js for automation and integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$WASM plugin system$q$, $q$Extend the panel using Go, Rust, C++, Python, and other WebAssembly-compatible languages.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Very lightweight; no container requirement$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Scales to thousands of servers per node$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Documented REST API for automation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Available for Linux, Windows, and Docker installs$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Explicitly documented game support list is narrower than some competing panels$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$WASM plugin ecosystem is still developing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Native-binary architecture differs from the Docker-first model used by many rival panels$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Is GameAP free?$q$, $q$Yes, it's free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Does GameAP have an API?$q$, $q$Yes, a documented REST API with code examples in Go, PHP, and Node.js.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$How much RAM does it need?$q$, $q$The project reports it can run on as little as 256 MB of RAM.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$What games are explicitly supported?$q$, $q$Minecraft, Counter-Strike 2, Rust, and Grand Theft Auto V are documented, among others.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Large-scale game hosting$q$, $q$Managing thousands of game server instances across nodes.$q$, $q$Hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$Automated server operations$q$, $q$Using the REST API to script server provisioning and maintenance.$q$, $q$DevOps-minded admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GameAP is a high-performance, open-source game server management panel written in Go and distributed as a native binary rather than requiring containers. The project reports it can run on as little as 256 MB of RAM and scale to thousands of servers per node with horizontal scaling.$q$, $q$It provides install/start/stop/restart controls, a browser-based remote console (no SSH needed), a file manager, and a task scheduler for automating restarts, backups, and updates. Explicitly documented supported games include Minecraft, Counter-Strike 2, Rust, and Grand Theft Auto V.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GameAP targets operators who want a lightweight panel that scales from a handful of servers to enterprise infrastructure without container overhead. A documented REST API, with code examples in Go, PHP, and Node.js, plus a WebAssembly-based plugin system supporting Go, Rust, C++, and Python, make it a fit for teams that want to automate or extend the panel programmatically.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ebf3f796-8c8b-4d07-a8cf-8d19e32204e3', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Gameyfin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, self-hosted app that scans and organizes a video game collection into a browsable, downloadable web library.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Gameyfin is a free, self-hosted app that scans your game collection and turns it into a browsable, downloadable web library.$q$,
  og_description = $q$Gameyfin is a free, self-hosted app that scans your game collection and turns it into a browsable, downloadable web library.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '615af08e-8dd3-4316-8837-e9ead4f24aa4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '615af08e-8dd3-4316-8837-e9ead4f24aa4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Automatic library scanning$q$, $q$Scans configured folders and detects games automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Metadata and cover art$q$, $q$Downloads descriptions and artwork for scanned games.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Web-based library UI$q$, $q$Browse and access the library from any device with a browser.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Direct downloads$q$, $q$Download game files straight from the web interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Library sharing$q$, $q$Share access to the library with other users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Plugin system$q$, $q$Extend Gameyfin's functionality with plugins.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Automates organizing a messy game file collection$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Accessible from any device via the browser$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Docker and Unraid install options$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Supports SSO and multi-user access$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Users must supply their own legally owned game files$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Plugin ecosystem is still relatively new$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Primarily download-based rather than cloud streaming$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Is Gameyfin free?$q$, $q$Yes, it is free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Does Gameyfin support piracy?$q$, $q$No, the project explicitly states it should be used only with appropriately licensed games.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$How is it installed?$q$, $q$Via Docker, Unraid, or a standard installation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Can multiple people share the library?$q$, $q$Yes, Gameyfin supports library sharing with other users.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Personal game collection organization$q$, $q$Turning a folder of loose game installers into a browsable library.$q$, $q$Individual collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$Household game library$q$, $q$Sharing access to a family's game collection across devices.$q$, $q$Households$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Gameyfin is a free, open-source, self-hosted video game library manager. It automatically scans configured game folders, downloads metadata and cover art, and presents the result as a browsable library accessible from any device with a web browser.$q$, $q$Users can download game files directly through the web UI, share the library with other users, and extend functionality through a plugin system. The project explicitly states it does not endorse or support piracy and is meant to be used only with appropriately licensed games.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Gameyfin is aimed at individuals with a personal, often disorganized, collection of game files who want a media-library-style way to browse and access them, similar in spirit to self-hosted media servers for movies or music. It supports Docker and Unraid installation, plus user management and SSO.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('615af08e-8dd3-4316-8837-e9ead4f24aa4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Lancache ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source caching system that lets LAN party organizers download game and update content once and serve it to many attendees.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LanCache is a free, open-source caching system that lets LAN party organizers download games once and serve them to many attendees.$q$,
  og_description = $q$LanCache is a free, open-source caching system that lets LAN party organizers download games once and serve them to many attendees.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b2362d6f-46ea-441d-ab8b-269f62578937';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b2362d6f-46ea-441d-ab8b-269f62578937' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Monolithic cache container$q$, $q$An all-in-one Docker container for quick single-box deployments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$LanCache-DNS$q$, $q$Redirects supported traffic to the local cache server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$SNIProxy$q$, $q$Enables caching of HTTPS-delivered game content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Generic cache support$q$, $q$Caches additional content types beyond the pre-configured services.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Docker Compose deployment$q$, $q$Quick setup via Docker and Docker Compose.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Free and MIT licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Dramatically reduces bandwidth and download time at LAN events$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Fast Docker-based setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Modular containers for DNS, HTTPS caching, and generic use$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Requires DNS redirection at the router level$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Best suited to LAN-scale events, not general web hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Some networking knowledge is needed to configure correctly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$What is LanCache used for?$q$, $q$Caching game downloads locally so many people at a LAN event don't each re-download the same files from the internet.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Is it free?$q$, $q$Yes, it's open source under the MIT license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$How is it deployed?$q$, $q$Via Docker and Docker Compose.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Does it require network changes?$q$, $q$Yes, DNS redirection at the router level is required for it to intercept and cache traffic.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$LAN party bandwidth savings$q$, $q$Caching game downloads for dozens or hundreds of LAN attendees.$q$, $q$LAN party organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$Esports and gaming event support$q$, $q$Ensuring fast, reliable game downloads at events with limited internet bandwidth.$q$, $q$Event network admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LanCache.NET is an open-source, self-hosted caching solution built for LAN parties and similar local events. It caches game downloads and updates from services like Steam so that content only needs to be pulled from the internet once, then served locally to every attendee, drastically cutting bandwidth use and speeding up downloads.$q$, $q$The system is deployed as a set of Docker containers: a monolithic all-in-one option, a LanCache-DNS component that redirects traffic to the cache, an SNIProxy for caching HTTPS content, and generic caching support. It's released under the MIT license and maintained by the UKLans project community.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LanCache is built for LAN party organizers, esports event operators, and network administrators who need many people on one local network to download the same large game files without saturating the internet connection.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b2362d6f-46ea-441d-ab8b-269f62578937', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── LinuxGSM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Command-line tool for deploying and managing Linux dedicated game servers, supporting over 139 game titles via SteamCMD.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LinuxGSM is a free, open-source command-line tool for deploying and managing Linux dedicated game servers, supporting 139+ titles.$q$,
  og_description = $q$LinuxGSM is a free, open-source command-line tool for deploying and managing Linux dedicated game servers, supporting 139+ titles.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fa9fa04e-02dc-4476-8e37-077443604250';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fa9fa04e-02dc-4476-8e37-077443604250' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$SteamCMD integration$q$, $q$Automates installing and updating SteamCMD-based game servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Crash detection and recovery$q$, $q$Detects server crashes and can automatically restart them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Scheduled backups$q$, $q$Automates backups on custom intervals via cron.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Multi-channel alerting$q$, $q$Sends notifications via email, Discord, Slack, Telegram, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Console access$q$, $q$Attach to a running server's console via tmux.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Broad game support$q$, $q$Supports 139+ game servers, including many built on the Source and Source 2 engines.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Free and MIT licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Supports 139+ dedicated game server titles$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Lightweight CLI with no web panel overhead$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Strong automation for updates, backups, and crash recovery$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Works across major Linux distributions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Command-line only; no built-in web UI$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Requires comfort with Linux and BASH$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$No native Windows server support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Is LinuxGSM free?$q$, $q$Yes, it's open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Does it have a graphical interface?$q$, $q$No, LinuxGSM is a CLI tool, though third-party panels exist that wrap it with a GUI.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$How many games does it support?$q$, $q$The project reports 139 game servers and counting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$How does it update game servers?$q$, $q$It integrates with SteamCMD for Steam-based dedicated servers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Scriptable game server management$q$, $q$Managing dedicated servers on a VPS or bare-metal Linux box via scripts and cron.$q$, $q$Linux-savvy server admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$Community server hosting$q$, $q$Running community game servers with automated crash recovery and alerts.$q$, $q$Community/clan admins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LinuxGSM (Linux Game Server Managers) is a free, open-source command-line tool, written in BASH under the MIT license, for quickly deploying and managing Linux dedicated game servers. It handles installation, configuration, monitoring, automated updates via SteamCMD, crash detection and recovery, backups, and console access.$q$, $q$The project reports support for 139 game servers and counting, and can send alerts through channels including email, Discord, Slack, and Telegram. It uses tmux to keep server processes running in the background and supports cron-based scheduling for routine maintenance tasks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LinuxGSM is aimed at game server administrators who are comfortable with the Linux command line and want a scriptable, no-frills way to manage servers without running a full web panel. Several third-party web panels are built on top of it for admins who want a GUI.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fa9fa04e-02dc-4476-8e37-077443604250', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Minus Games ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Small open-source suite for self-hosting a personal game and save-file sync server between devices like a Steam Deck and desktop PC.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Minus Games is a free, open-source suite for self-hosting a personal game library with save-file sync between devices.$q$,
  og_description = $q$Minus Games is a free, open-source suite for self-hosting a personal game library with save-file sync between devices.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '39827ac6-8122-4689-9464-0147ac338943';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '39827ac6-8122-4689-9464-0147ac338943' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Game distribution server$q$, $q$Upload games to a server and have clients download and launch them.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Save file sync$q$, $q$Syncs save data alongside game files between client devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Automatic save detection$q$, $q$Detects game engines like Unity to help locate save file locations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Client GUI$q$, $q$A graphical client for browsing and launching available games.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Finder and Updater components$q$, $q$Separate services handle library scanning and keeping clients up to date.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Syncs save files as well as game installs, not just downloads$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Useful for games not managed by Steam or another launcher$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Lightweight, purpose-built for personal multi-device setups$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Built primarily around the creator's own use case, so the community and support are small$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Fewer platforms and games verified for compatibility than larger projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Documentation is more limited than established game server tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$What does Minus Games do?$q$, $q$It distributes games and syncs their save files between a self-hosted server and client devices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Is it free?$q$, $q$Yes, it's an open-source project available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Does it require Steam?$q$, $q$No, it was built specifically for games not managed by Steam or other launchers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$What components make up the suite?$q$, $q$A Server, Client, GUI, Finder, and Updater.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Multi-device save sync$q$, $q$Keeping game saves in sync between devices such as a Steam Deck and a desktop PC.$q$, $q$Individual gamers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$Personal game distribution$q$, $q$Self-hosting a small library of non-launcher-managed games for personal use.$q$, $q$Hobbyist self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Minus Games is an open-source suite for distributing games from a self-hosted server to client devices, with the ability to sync save files as well as game data. It was created so its author could keep games that aren't managed by Steam or another launcher, and their save data, in sync between a Steam Deck and a desktop PC.$q$, $q$The suite is made up of five components: a Server, Client, GUI, Finder, and Updater. Admins upload games to a server folder and trigger a scan, after which clients can browse, download, and launch the titles. The Finder can detect the engine a game uses, such as Unity, to help automatically locate its save data location.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('39827ac6-8122-4689-9464-0147ac338943', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Minus Games suits individuals managing a personal library of games outside mainstream launchers who want their play sessions and save progress to follow them between a couple of personal devices. It is a small, personal-scale project rather than a large hosting platform, so it's best suited to hobbyist, single-user or small-household setups.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('39827ac6-8122-4689-9464-0147ac338943', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('39827ac6-8122-4689-9464-0147ac338943', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Pelican Panel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source game server control panel and community successor to Pterodactyl, running servers in isolated Docker containers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2024,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pelican Panel is a free, open-source game server control panel and Pterodactyl successor, running servers in isolated Docker containers.$q$,
  og_description = $q$Pelican Panel is a free, open-source game server control panel and Pterodactyl successor, running servers in isolated Docker containers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '55f67bf7-283b-46a3-a504-fefc5445313f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '55f67bf7-283b-46a3-a504-fefc5445313f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Docker-isolated servers$q$, $q$Each game server runs in its own container via the Wings daemon.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$One-click game installs$q$, $q$Supports Minecraft, Terraria, Palworld, Valheim, Enshrouded, Factorio, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Security features$q$, $q$Includes SSL, two-factor authentication, and AES-256 encryption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Automatic updates$q$, $q$The panel can keep itself updated.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Client dashboard$q$, $q$A client area and panel settings screen for managing servers and accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Pterodactyl codebase heritage$q$, $q$Built on Pterodactyl's architecture, giving access to a large existing ecosystem of eggs and resources.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$100% free to use, including for commercial hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Inherits Pterodactyl's mature ecosystem and third-party eggs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Strong built-in security (2FA, SSL, AES-256)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Actively developed as an independent community project$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Docker-based isolation for each server$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Younger project than Pterodactyl, with a shorter independent track record$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Migrating from Pterodactyl requires care and planning$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Documentation and ecosystem are still consolidating around the new project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Is Pelican related to Pterodactyl?$q$, $q$Yes, it's a community fork/successor that shares much of Pterodactyl's codebase and ecosystem under independent governance.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Is Pelican Panel free?$q$, $q$Yes, it's 100% free for personal and commercial use.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$What games can it host?$q$, $q$Many, including Minecraft, Palworld, Valheim, Terraria, Enshrouded, and Factorio, via Docker-based eggs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$How does it isolate servers?$q$, $q$Each server runs in its own Docker container managed by the Wings daemon.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Friend group hosting$q$, $q$Running Minecraft, Valheim, or Palworld servers for a small group of friends.$q$, $q$Casual gamers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$Commercial game hosting$q$, $q$Providers offering managed, multi-game server hosting to customers.$q$, $q$Hosting businesses$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Pelican Panel is a free, open-source game server control panel that emerged as a community fork of Pterodactyl Panel, sharing much of its codebase and ecosystem while operating under independent governance. It pairs the web panel with Wings, a daemon that runs each game server in an isolated Docker container.$q$, $q$The panel offers one-click installs for a wide range of titles, including Minecraft, Terraria, Palworld, Valheim, Enshrouded, and Factorio, plus security features like SSL, two-factor authentication, and AES-256 encryption.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Pelican targets the same audience as Pterodactyl: self-hosters running servers for friends, and hosting providers who need a scalable, Docker-isolated multi-game panel. Because it shares Pterodactyl's codebase, it can draw on much of that project's existing third-party eggs and community resources.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('55f67bf7-283b-46a3-a504-fefc5445313f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pterodactyl ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source game server management panel that runs servers in isolated Docker containers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pterodactyl is a free, open-source game server management panel that uses Docker containers to isolate and control servers.$q$,
  og_description = $q$Pterodactyl is a free, open-source game server management panel that uses Docker containers to isolate and control servers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0575e08f-1ac0-4b93-bd8d-6102a19fd89c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0575e08f-1ac0-4b93-bd8d-6102a19fd89c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Docker-based isolation$q$, $q$Each game server runs in its own Docker container, limiting resource usage and reducing the impact of a compromised or misbehaving server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Wings daemon$q$, $q$A dedicated daemon runs on each node, communicating with the central Panel to start, stop, and monitor containers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Egg configuration system$q$, $q$Reusable, community-maintained templates ("eggs") define how specific games and server software are installed and run.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Multi-node management$q$, $q$A single Panel installation can manage servers spread across many physical or virtual machines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Role-based access$q$, $q$Admins can grant subusers scoped permissions on individual servers without full admin access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$REST API$q$, $q$A full API allows automated server provisioning, often used by hosting companies to connect Pterodactyl to their own storefronts.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Free and open source under the MIT license, with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Strong isolation between servers via Docker containers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Large community maintaining eggs for many popular games$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Scales from a single personal server to commercial hosting operations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Actively developed and widely used in production$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Requires Linux server administration and Docker knowledge to install and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$No official managed/hosted version — you must run it yourself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Initial setup of the Panel, Wings, and SSL has a learning curve for beginners$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Is Pterodactyl free?$q$, $q$Yes. It's MIT licensed and the source code is publicly available on GitHub, with no cost to run.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$What games does it support?$q$, $q$Any game or server software can be wrapped in a Docker-based "egg." The community maintains eggs for many popular titles like Minecraft, Rust, and Ark.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Does Pterodactyl require Docker?$q$, $q$Yes, the Wings daemon requires Docker to isolate and run each server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Can it be used for a commercial hosting business?$q$, $q$Yes, many game server hosting companies run Pterodactyl in production to manage customer servers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Home lab game servers$q$, $q$Run and manage a handful of game servers for friends or a small community.$q$, $q$Hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Community and clan networks$q$, $q$Operate multiple game servers for an active gaming community from one panel.$q$, $q$Community admins$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$Commercial game hosting$q$, $q$Provision and isolate large numbers of customer game servers across many nodes.$q$, $q$Game server hosting companies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Pterodactyl is a free, open-source game server management panel built with PHP, React, and Go. Administrators use it to create, configure, and monitor game servers through a web interface, while the actual server processes run in isolated Docker containers on one or more nodes.$q$, $q$The system has two main pieces: the Panel, a web-based admin and user interface, and Wings, a lightweight daemon that runs on each host machine and manages the Docker containers. Game-specific setup logic is packaged into community-maintained "eggs," which define how a given game or application is installed and started.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Pterodactyl is used by hobbyists managing a handful of servers for friends, gaming communities running multiple titles, and commercial game server hosting companies that need to provision and isolate large numbers of customer servers without per-server licensing costs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0575e08f-1ac0-4b93-bd8d-6102a19fd89c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── PufferPanel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source game server management panel designed for simple installation and broad server-type support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PufferPanel is a free, open-source game server management panel supporting Minecraft, Source servers and more, with Docker optional.$q$,
  og_description = $q$PufferPanel is a free, open-source game server management panel supporting Minecraft, Source servers and more, with Docker optional.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'daea352e-0ee8-41c6-a46e-47f6922604f2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'daea352e-0ee8-41c6-a46e-47f6922604f2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Simple installer$q$, $q$PufferPanel can be installed as a single binary with the daemon and panel, without requiring Docker.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Multi-game support$q$, $q$Supports Minecraft variants, Source Dedicated Servers, BungeeCord, PocketMine, and more via templates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Node clustering$q$, $q$Manage multiple physical or virtual machines from a single panel instance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Server templates$q$, $q$Community-maintained templates define how each supported server type is installed and run.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$REST API$q$, $q$An API is available for automating server management tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Scoped permissions$q$, $q$Role-based access lets admins grant limited, per-server permissions to other users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Free and open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Simpler installation than some Docker-first alternatives$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Works without Docker, useful on lower-resource hardware$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Supported by voluntary GitHub Sponsors contributions$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Smaller template/plugin ecosystem than some competing panels$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Documentation is thinner in places than more established alternatives$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Still requires basic server administration knowledge to run reliably$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Is PufferPanel free?$q$, $q$Yes, it's fully open source under the Apache License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Does PufferPanel require Docker?$q$, $q$No, Docker is optional — PufferPanel can also run servers natively.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$What games can I host?$q$, $q$Minecraft variants, Source Dedicated Servers, BungeeCord, PocketMine and other server types supported via templates.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$How is PufferPanel funded?$q$, $q$Through voluntary donations via GitHub Sponsors from the community.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Personal or small Minecraft networks$q$, $q$Run and manage a small set of Minecraft or other game servers.$q$, $q$Hobbyist server admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$Lightweight hosting without Docker$q$, $q$Manage game servers on modest hardware where Docker overhead is undesirable.$q$, $q$Self-hosters with limited resources$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PufferPanel is a free, open-source game server management panel built to be simple to install and easy to use. Unlike some alternatives, it doesn't require Docker — servers can run natively or in containers, giving admins flexibility on lower-powered hardware.$q$, $q$The panel supports a range of game and server types, including multiple Minecraft variants (Vanilla, Forge, NeoForge, Sponge, PocketMine), Source Dedicated Servers, and BungeeCord, with support defined through community-maintained templates.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$PufferPanel targets individuals and small networks who want a straightforward, free way to manage game servers without the overhead of a more complex Docker-first setup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('daea352e-0ee8-41c6-a46e-47f6922604f2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── RomM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source manager for organizing, enriching, and browsing your retro game ROM collection.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$RomM is a free, self-hosted, open-source ROM manager that scans, enriches with metadata, and lets you play your game collection.$q$,
  og_description = $q$RomM is a free, self-hosted, open-source ROM manager that scans, enriches with metadata, and lets you play your game collection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '27cd08d4-3907-484c-bde4-d06e726c6674';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '27cd08d4-3907-484c-bde4-d06e726c6674' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Automatic library scanning$q$, $q$Scans folders of ROM files and organizes them by platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Metadata enrichment$q$, $q$Pulls cover art, descriptions, and game details from IGDB, ScreenScraper, and RetroAchievements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$In-browser play$q$, $q$Launch supported titles directly in the browser using the built-in EmulatorJS integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Multi-device sync$q$, $q$Keeps games, save states, and emulator settings synchronized across devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Custom tagging$q$, $q$Organize the collection with custom tags on top of platform and genre metadata.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Broad platform support$q$, $q$Recognizes 400+ gaming systems and platforms.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Flexible self-hosted deployment$q$, $q$Available via Docker, Unraid, TrueNAS, Synology, CasaOS, Cloudron, Portainer, and Umbrel.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Actively developed with frequent releases$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Wide platform and metadata provider support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$In-browser emulation removes the need for separate emulator setup for many systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$AGPL-3.0 open source with full control over your data$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Relies on third-party metadata providers (IGDB, ScreenScraper) which may require API keys or accounts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Users are responsible for sourcing their own ROM files legally$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Newer project, so breaking changes between versions are possible$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Is RomM free?$q$, $q$Yes, it's free and open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Does RomM include ROMs?$q$, $q$No, it only organizes and enriches ROM files you already have; you must supply your own files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Can I play games directly in RomM?$q$, $q$Yes, supported systems can be played in-browser using the built-in EmulatorJS integration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$What metadata sources does RomM use?$q$, $q$IGDB, ScreenScraper, and RetroAchievements.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Home retro-gaming library$q$, $q$Organize and browse a large, multi-platform ROM collection with rich metadata.$q$, $q$Retro game collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$Home-lab / NAS integration$q$, $q$Run alongside other self-hosted apps on Unraid, TrueNAS, or Synology.$q$, $q$Home-lab and NAS users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$RomM ("Rom Manager") is a self-hosted, open-source application for organizing digital game collections. It scans a library of ROM files, enriches them with cover art and metadata from providers like IGDB, ScreenScraper, and RetroAchievements, and presents everything through a responsive web interface.$q$, $q$It also includes in-browser gameplay for supported systems via EmulatorJS, and can sync games, save states, and emulator settings across devices. RomM is licensed under AGPL-3.0 and is distributed via Docker as well as pre-built options for platforms like Unraid, TrueNAS, Synology, CasaOS, Cloudron, and Umbrel.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$RomM is built for retro gaming enthusiasts and home-lab users who want a centralized, self-hosted way to manage and browse large, multi-platform ROM collections that they already own.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27cd08d4-3907-484c-bde4-d06e726c6674', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SourceBans++ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted ban and admin management system for Source-engine game servers like Counter-Strike, TF2, and Garry's Mod.$q$,
  pricing_model = $q$Free (source-available)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SourceBans++ is a free, self-hosted ban and admin management system for Source-engine game servers like CS, TF2, and Garry's Mod.$q$,
  og_description = $q$SourceBans++ is a free, self-hosted ban and admin management system for Source-engine game servers like CS, TF2, and Garry's Mod.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Web admin panel$q$, $q$Centralized dashboard for managing bans, mutes, admin accounts, and server groups.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$SourceMod plugin bridge$q$, $q$In-game SourceMod plugins enforce panel-issued bans and mutes and report actions back to the panel.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Multi-server management$q$, $q$One panel installation can oversee bans and admins across many game servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Ban and appeal workflow$q$, $q$Tracks ban duration, categories, and reporting for moderation actions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Broad Source-engine support$q$, $q$Works with SourceMod-compatible titles including Team Fortress 2, Counter-Strike, and Garry's Mod.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Free for self-hosted community and clan use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Long-standing, mature project in the Source-engine server admin space$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Tight SourceMod integration for real-time in-game enforcement$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Documented install and update guides$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$The web panel uses the source-available Elastic License 2.0, not a fully open-source license — offering it as a hosted service to third parties requires a commercial license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Requires a SourceMod-enabled game server plus separate web hosting and a database$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Setup requires familiarity with SourceMod plugin administration$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Is SourceBans++ free?$q$, $q$Yes, self-hosting it for your own community or network is free and the project states this will stay free.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Is SourceBans++ fully open source?$q$, $q$The SourceMod plugins are GPLv3, but the web panel uses the Elastic License 2.0, a source-available license that restricts offering it as a hosted service to third parties.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$What games does it work with?$q$, $q$SourceMod-compatible Source-engine games such as Counter-Strike, Team Fortress 2, and Garry's Mod.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Is there a hosted alternative?$q$, $q$Yes, a separate commercial product called RookHelm offers a managed, hosted version.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Community game server networks$q$, $q$Moderate CS, TF2, or Garry's Mod servers with a centralized ban and admin system.$q$, $q$Clan and community admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Multi-server admin teams$q$, $q$Manage bans and admin permissions across several Source-engine servers from one panel.$q$, $q$Networks running multiple servers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SourceBans++ is a self-hosted ban and admin management system for Source-engine game servers, made up of a web administration panel and a set of SourceMod plugins. Admins manage bans, mutes, server access, and admin permissions from the web panel, and the SourceMod plugins enforce those decisions in-game and report actions back to the panel.$q$, $q$The web panel is distributed under the Elastic License 2.0 (source-available, free for self-hosted community use, but restricted for offering it as a hosted service to others), while the SourceMod plugins are licensed under GPLv3. A separate commercial product, RookHelm, offers a managed hosted alternative.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SourceBans++ is built for community administrators running Source-engine game servers, such as Counter-Strike, Team Fortress 2, and Garry's Mod, who need centralized, self-hosted moderation tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Sunshine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted game streaming server that pairs with Moonlight clients to stream your PC's games.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2020,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sunshine is a free, open-source, self-hosted game streaming server for Moonlight with GPU-accelerated low-latency streaming.$q$,
  og_description = $q$Sunshine is a free, open-source, self-hosted game streaming server for Moonlight with GPU-accelerated low-latency streaming.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '082de0e2-a5b9-4328-a2b9-bb364605a75a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '082de0e2-a5b9-4328-a2b9-bb364605a75a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Hardware-accelerated encoding$q$, $q$Supports AMD, Intel, and Nvidia GPU encoders, with a software encoding fallback.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Low-latency streaming$q$, $q$Optimized for real-time game streaming performance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Controller emulation$q$, $q$Emulates Xbox, PlayStation, or Nintendo Switch controllers on the host so streamed games see native gamepad input.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Web-based configuration$q$, $q$Browser-based UI for setup and client pairing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Cross-platform host support$q$, $q$Runs on Windows, Linux, and macOS, including via Docker.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Broad Moonlight client compatibility$q$, $q$Works with Moonlight clients across Android, iOS, Xbox, Nintendo Switch, PS Vita, and smart TVs.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Runs on Windows, Linux, and macOS as a host, unlike GPU-vendor-locked alternatives$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Hardware encoding support helps keep latency low$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Actively developed by the LizardByte team$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Best performance typically requires a GPU with good hardware encoding support$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Initial setup, including pairing and network/firewall configuration, requires some technical comfort$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Feature completeness and encoder support varies by OS and GPU vendor$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Is Sunshine free?$q$, $q$Yes, it's free and open source, supported by voluntary donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$What is Moonlight?$q$, $q$Moonlight is the client app that connects to a Sunshine host to stream games; Sunshine is the server/host side.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Does Sunshine require an Nvidia GPU?$q$, $q$No. Sunshine supports AMD, Intel, and Nvidia hardware encoders as well as a software encoding fallback.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$What platforms can host Sunshine?$q$, $q$Windows, Linux (including Docker), and macOS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Personal cloud gaming$q$, $q$Stream games from a home PC to a laptop, phone, or smart TV.$q$, $q$PC gamers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$Handheld and couch streaming$q$, $q$Pair Sunshine with Moonlight on devices like handhelds or smart TVs for couch gaming.$q$, $q$Gamers wanting remote play setups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Sunshine, developed by LizardByte, is a free, open-source, self-hosted game streaming server. It runs on your own PC and streams games to remote devices running the Moonlight client, functioning as a self-hosted alternative to services like NVIDIA GameStream.$q$, $q$It supports hardware-accelerated encoding on AMD, Intel, and Nvidia GPUs (with a software fallback), emulates Xbox, PlayStation, or Nintendo Switch controllers on the host, and includes a web-based UI for pairing clients and adjusting stream settings.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Sunshine is aimed at gamers who want to stream games from their own PC to another device, such as a laptop, phone, or smart TV, without relying on a commercial cloud gaming service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082de0e2-a5b9-4328-a2b9-bb364605a75a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Genea.app ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, local-first family tree builder with GEDCOM import/export and optional Git-based sync.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Genea.app is a free, open-source, local-first family tree builder with GEDCOM import/export and optional Git-based sync.$q$,
  og_description = $q$Genea.app is a free, open-source, local-first family tree builder with GEDCOM import/export and optional Git-based sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd31d369-2e60-4849-9a2b-8481c41a9d08';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd31d369-2e60-4849-9a2b-8481c41a9d08' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Local-first data$q$, $q$Family tree processing and storage happen in the browser rather than on a vendor server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$GEDCOM import/export$q$, $q$Import trees exported from services like MyHeritage or Ancestry, and export in GEDCOM format.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Git-based sync$q$, $q$Sync a tree across devices via GitHub, GitLab, or a self-hosted Git server.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Sample trees$q$, $q$Preloaded example trees, such as royal lineages and US Presidents, for exploring the interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Share and download$q$, $q$Export or share trees built in the app.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Completely free with no account or paywall$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Open source and auditable on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Privacy-friendly, local-first architecture$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Flexible sync options, including self-hosted Git$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Relies on the user to manage their own Git-based sync/backup, which is less turnkey than a hosted database$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Smaller feature set than long-established genealogy platforms like webtrees or Gramps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Less built-in multi-user collaboration than server-based genealogy tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Is Genea.app free?$q$, $q$Yes, it's completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Where is my data stored?$q$, $q$Processing and storage happen locally in your browser; you can optionally sync via Git, using GitHub, GitLab, or a self-hosted server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Can I import my existing family tree?$q$, $q$Yes, GEDCOM files exported from services like MyHeritage and Ancestry can be imported.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Do I need to create an account?$q$, $q$No traditional server-side account is required, since data is stored locally or in your own Git repository.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Privacy-conscious genealogy$q$, $q$Keep family tree data off third-party servers while still being able to sync across devices.$q$, $q$Privacy-focused hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$Migrating from a paid service$q$, $q$Import a GEDCOM export from Ancestry or MyHeritage into a free, open tool.$q$, $q$Users switching from paid genealogy platforms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Genea.app is a free, open-source, browser-based family tree tool. Rather than storing data on a vendor's server, all processing happens locally in the browser, and users can optionally sync their tree across devices using Git, via GitHub, GitLab, or a self-hosted Git server.$q$, $q$It supports GEDCOM import and export, making it possible to bring in existing trees exported from services like MyHeritage or Ancestry, and to move data out again if needed.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Genea.app suits privacy-conscious hobbyist genealogists who want a free, local-first alternative to paid genealogy platforms, and anyone looking to migrate an existing GEDCOM export into a lightweight, open-source tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd31d369-2e60-4849-9a2b-8481c41a9d08', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Genealogy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted app for recording family members and collaborating on a shared family tree.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Genealogy is a free, open-source, self-hosted family tree app with role-based collaboration for recording family relationships.$q$,
  og_description = $q$Genealogy is a free, open-source, self-hosted family tree app with role-based collaboration for recording family relationships.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a671332-0a6d-44a2-a483-911ca563acab';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a671332-0a6d-44a2-a483-911ca563acab' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Family member records$q$, $q$Add individuals and document the relationships between them.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Role-based access$q$, $q$Owner, manager, editor, member, and developer roles control who can view or edit a tree.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Team collaboration$q$, $q$Multiple people can contribute to the same family tree under defined permissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Demo trees$q$, $q$Includes example datasets, such as the British Royals and Kennedy families, to explore functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Self-hosted deployment$q$, $q$Source code is available on GitHub for deploying on your own server.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Free to use for non-commercial purposes under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Role-based permissions support collaborative research$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Simple, focused feature set for recording family relationships$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Self-hosted, giving full control over the data$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Smaller community and less documentation than established projects like webtrees or Gramps$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$The project's own license notes free use is for non-commercial purposes, so commercial use should be reviewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Fewer advanced genealogy features, such as DNA tools or detailed reports, than mature alternatives$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Is this Genealogy app free?$q$, $q$Yes, it's open source under the MIT license and free to use for non-commercial purposes.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Can multiple people work on the same family tree?$q$, $q$Yes, via role-based access control (owner, manager, editor, member).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Do I need to self-host it?$q$, $q$The source code is available on GitHub for self-hosting on your own server.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Small family research groups$q$, $q$Collaboratively document relatives with different levels of access per contributor.$q$, $q$Families researching together$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$Personal genealogy hobby projects$q$, $q$Run a lightweight, self-hosted family tree tool for personal use.$q$, $q$Individual hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Genealogy is a free, open-source web application for recording family members and documenting the relationships between them. It's licensed under the MIT license and free to use for non-commercial purposes, with source code available on GitHub for self-hosting.$q$, $q$The app supports role-based access, with owner, manager, editor, member, and developer roles, so multiple people can collaborate on researching and maintaining the same family tree with different levels of access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's built for families and small groups who want a lightweight, self-hosted way to collaboratively record and maintain a family tree with controlled access for different contributors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a671332-0a6d-44a2-a483-911ca563acab', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GeneWeb ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source genealogy software that generates a browsable family-history website from a genealogical database.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1998,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$GeneWeb is a free, open-source genealogy program that generates a browsable family-history website from a genealogical database.$q$,
  og_description = $q$GeneWeb is a free, open-source genealogy program that generates a browsable family-history website from a genealogical database.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eed15499-677d-4aec-b709-b24744a436e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eed15499-677d-4aec-b709-b24744a436e5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Dynamic web-based database$q$, $q$Generates browsable family-history pages directly from a genealogical database.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Relationship and consanguinity calculators$q$, $q$Computes family relationships and degree of kinship between individuals.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$GEDCOM and GW import/export$q$, $q$Interoperates with other genealogy software via GEDCOM, alongside its native GW format.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Event and source tracking$q$, $q$Records dates, witnesses, notes, and sources for each event.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Customizable templates$q$, $q$Page appearance can be customized via templates and CSS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Access control$q$, $q$Password-protected accounts with varying permission levels.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Proven at scale$q$, $q$Powers large collaborative databases, including the multi-million-person Roglo project.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Mature, long-running project maintained since 1998$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Proven to scale to multi-million-person collaborative databases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Cross-platform: runs on Unix, Linux, Windows, and macOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Free and open source under the GNU General Public License$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$OCaml codebase and older interface conventions can feel less modern than newer web-genealogy tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Documentation and community are smaller and more fragmented than webtrees$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Setup is more technical than simple web installers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Is GeneWeb free?$q$, $q$Yes, it's free and open source under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$What platforms does GeneWeb run on?$q$, $q$Unix, Linux, Windows, and macOS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Can GeneWeb import GEDCOM files?$q$, $q$Yes, it supports import and export in both its native GW format and GEDCOM.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$How large a database can GeneWeb handle?$q$, $q$Very large. The Roglo database, built on GeneWeb, contains more than 8.5 million individuals.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Large collaborative genealogy databases$q$, $q$Build or contribute to large, shared genealogical databases.$q$, $q$Genealogy researchers and communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$Personal genealogy publishing$q$, $q$Publish a browsable family-history website from your own research.$q$, $q$Genealogy hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$GeneWeb is a free, open-source genealogy application created in 1998 by Daniel de Rauglaudre, a researcher at Inria (the French national research institute for computer science). It's written in OCaml and generates dynamic, browsable family-history web pages from a genealogical database, supporting both its native GW format and GEDCOM import/export.$q$, $q$GeneWeb has been proven at large scale: Roglo, one of the largest collaborative genealogical databases in the world and built on GeneWeb, contains more than 8.5 million individuals maintained by hundreds of contributors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$GeneWeb suits both casual hobbyists publishing a personal family tree online and serious researchers or communities maintaining very large, collaborative genealogical databases.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed15499-677d-4aec-b709-b24744a436e5', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Gramps Web ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted web genealogy system that works standalone or alongside Gramps Desktop.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Gramps Web is a free, open-source, self-hosted online genealogy system for collaboratively building a family tree with Gramps Desktop.$q$,
  og_description = $q$Gramps Web is a free, open-source, self-hosted online genealogy system for collaboratively building a family tree with Gramps Desktop.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b34c93e2-f29b-45a6-8b23-284d2b2cdca9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b34c93e2-f29b-45a6-8b23-284d2b2cdca9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Collaborative editing$q$, $q$Multiple users can research and edit a shared family tree online.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Timeline and map views$q$, $q$Visualize relationships, chronology, and geographic data for the family tree.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Media management$q$, $q$Upload, organize, and tag photos and documents linked to people and events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$DNA tools$q$, $q$Includes a chromosome browser and DNA match tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$AI assistant$q$, $q$Built-in AI assistant to help with research tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Revision history$q$, $q$Tracks changes made to the tree over time.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Flexible self-hosting$q$, $q$Deployable via Docker or DigitalOcean, with PostgreSQL and S3-compatible media storage support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Can run standalone or as a companion to the established Gramps Desktop application$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Strong self-hosting documentation and deployment options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Feature-rich, including DNA tools, maps, and timelines$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Full deployment with Docker, PostgreSQL, and optional S3 storage requires server administration experience$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$AI assistant and some features may need additional configuration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Less mainstream awareness than webtrees$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Is Gramps Web free?$q$, $q$Yes, it's free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Do I need Gramps Desktop to use Gramps Web?$q$, $q$No, it can run standalone, or as a companion to Gramps Desktop for users who also want the offline desktop app.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Can multiple family members collaborate on one tree?$q$, $q$Yes, it's designed for collaboratively building a family tree together.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$What database does Gramps Web use?$q$, $q$Deployment guides cover PostgreSQL for the database and S3-compatible storage for media.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Family collaboration on a shared tree$q$, $q$Research and edit a family tree together with relatives online.$q$, $q$Extended families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$Self-hosted genealogy system$q$, $q$Run a full-featured genealogy system alongside other self-hosted home services.$q$, $q$Home-lab self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Gramps Web is a free, open-source, self-hosted online genealogy system from the Gramps Project, built for collaboratively building a family tree. It can run standalone or as a companion to the established Gramps Desktop application, sharing the same underlying genealogical data model.$q$, $q$It includes family tree, timeline, and map views, media management with photo tagging, DNA matching and a chromosome browser, research reports, and revision history. Deployment guides cover Docker, DigitalOcean, and TrueNAS, with PostgreSQL for the database and S3-compatible storage for media.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Gramps Web is aimed at families researching together online and self-hosting enthusiasts who want a feature-rich, self-managed genealogy system rather than a commercial hosted service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b34c93e2-f29b-45a6-8b23-284d2b2cdca9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── webtrees ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted online genealogy application for collaborative family history research.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$webtrees is a free, open-source, self-hosted online genealogy application for collaborative family history research on PHP/MySQL.$q$,
  og_description = $q$webtrees is a free, open-source, self-hosted online genealogy application for collaborative family history research on PHP/MySQL.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '61b1b0a8-fc36-4a65-86e4-2a1059a7c262';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '61b1b0a8-fc36-4a65-86e4-2a1059a7c262' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$GEDCOM compatibility$q$, $q$Imports and exports standard GEDCOM files used by most desktop and online genealogy tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Collaborative editing$q$, $q$Multiple family members can research and edit the same tree with permission controls.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Modules and themes$q$, $q$Extensible via downloadable modules, themes, and geographic data add-ons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Self-hosted or third-party hosting$q$, $q$Runs on any PHP/MySQL web server, with a directory of webtrees-experienced hosting providers available.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Active translations$q$, $q$Actively maintained community translations into many languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Charts and reports$q$, $q$Generates family tree charts, reports, and statistics from the database.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Completely free, with no license cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Runs on standard, widely available PHP/MySQL hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Long track record since 2010 as a fork of PhpGedView$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Large community and extensive module ecosystem$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Requires a PHP/MySQL web hosting environment, whether shared or self-managed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Interface feels dated compared to some newer genealogy web apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Advanced customization via themes and modules requires some technical familiarity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Is webtrees free?$q$, $q$Yes, webtrees is completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$What do I need to run webtrees?$q$, $q$A web server with PHP and a MySQL-compatible database; it can be self-hosted or run on standard shared hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Can I import my existing family tree?$q$, $q$Yes, webtrees works with standard GEDCOM files exported from most other genealogy applications.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Who maintains webtrees?$q$, $q$It's a community-maintained open-source project with source code available on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Family collaboration on a shared tree$q$, $q$Give extended family members a private or shared genealogy website to research together.$q$, $q$Extended families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$Genealogical society or research websites$q$, $q$Publish genealogical research online for a society or research group.$q$, $q$Genealogical societies and researchers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$webtrees is a free, open-source, web-based genealogy application created in 2010 as a fork of PhpGedView. It runs on standard PHP/MySQL web hosting and lets multiple family members collaboratively research, edit, and browse a shared family tree online.$q$, $q$It works with standard GEDCOM files for import and export, so trees can be brought in from or exported to most other desktop and online genealogy tools, and it can be extended with downloadable modules, themes, and geographic data add-ons.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$webtrees suits extended families wanting a private or shared genealogy website, as well as genealogical societies and hobbyist researchers publishing their research online, all without paying for software licenses.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61b1b0a8-fc36-4a65-86e4-2a1059a7c262', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


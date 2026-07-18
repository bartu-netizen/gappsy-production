-- Enrichment batch: nefarious, Ombi, PodFetch, Radarr, Reaparr, Sonarr, TrackWatch, youtube-dl-nas, Beets, BotWave, LibreTime, Lyrion Music Server, moOde Audio, Mopidy, mpd, mStream, multi-scrobbler, musikcube, Pinepods, SwingMusic, ClipBucket, Gerbera, Icecast 2, Karaoke Eternal, Kodi, MediaMTX, MistServer, NymphCast, Rygel, Stash, üWave, Restreamer, Tube, VideoLAN Client (VLC), Anchr, Anubis, asciinema, Cloudlog, CUPS, Digiboard, Domain Locker, DOMJudge, ESMira, F-Droid, Flyimg, Habitica, HortusFox, ImgCompress, Jelu, Kasm Workspaces, Koillection, LanguageTool, Libre Translate, LubeLogger, mosparo, Neko, OmniTools, Open-Meteo, OpenReader, OpenZiti, Operational.co, POMjs, re:Director, Reactive Resume, revealjs, Revive Adserver, SANE Network Scanning, string.is
-- Publishes 68 bulk-imported tool(s) with full editorial content.

-- ── nefarious ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted web app that automates searching for and downloading TV shows and movies via Jackett and Transmission.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$nefarious is a free, open-source self-hosted web app that automates TV and movie downloads through Jackett and Transmission.$q$,
  og_description = $q$nefarious is a free, open-source self-hosted web app that automates TV and movie downloads through Jackett and Transmission.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '83b24c52-88dd-4d43-8826-92e123f63cae';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '83b24c52-88dd-4d43-8826-92e123f63cae' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Content discovery$q$, $q$Search and browse TV shows and movies by genre, year, and popularity from within the app.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Quality profiles$q$, $q$Set preferred resolutions and formats, such as 1080p for movies or 720p for TV, per content type.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Filtering and blacklisting$q$, $q$Filter results with keyword rules and blacklist unwanted releases or sources to keep the queue clean.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Multi-user permissions$q$, $q$Support for multiple accounts with permission groups so household members get scoped access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Subtitle handling$q$, $q$Automatic subtitle discovery alongside downloaded media.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Apprise notifications$q$, $q$Send status and completion alerts through the Apprise notification library, which covers many notification services.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$VPN support$q$, $q$Route download traffic through a VPN for network privacy.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Library import$q$, $q$Import an existing media library so previously downloaded content is recognized.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Free and fully open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Single interface for browsing, quality rules, and downloads instead of managing Jackett and Transmission separately$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Multi-user permission groups for shared households$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Wide notification coverage via Apprise$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Requires Jackett and Transmission to already be configured, which adds setup complexity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Docker/Docker Compose knowledge is effectively required to install$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Smaller community and update cadence than the more established *arr ecosystem tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Is nefarious free?$q$, $q$Yes. It is open-source software released under the GPL-3.0 license with no purchase or subscription required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Do I need other software to run nefarious?$q$, $q$Yes. It depends on Jackett for indexer searches and Transmission for handling downloads; both must be set up alongside it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$How is nefarious installed?$q$, $q$It is designed to run via Docker and Docker Compose, with a documented environment template for configuration.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Does nefarious support multiple users?$q$, $q$Yes, it supports multiple user accounts with configurable permission groups.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Automated TV and movie acquisition$q$, $q$Search once and let nefarious apply quality rules to find and queue matching releases automatically.$q$, $q$Home server operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$Shared household media requests$q$, $q$Give family members their own scoped accounts to search and queue content within set permissions.$q$, $q$Households running a shared media server$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$nefarious is an open-source, self-hosted web application for discovering and automatically downloading TV shows and movies. It acts as a central hub that connects to Jackett for searching torrent indexers and to Transmission for managing the resulting downloads, giving users a single dashboard instead of juggling separate tools.$q$, $q$The project is maintained on GitHub by developer lardbit under the GPL-3.0 license and is typically deployed with Docker and Docker Compose, storing configuration and library data in persistent volumes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$nefarious suits home server operators who already run Jackett and Transmission and want a friendlier, browser-based front end for finding and queuing content, including households that want multiple users with their own permission groups.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83b24c52-88dd-4d43-8826-92e123f63cae', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ombi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted media request system for Plex and Emby that lets users request movies and TV shows for automatic fulfillment.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ombi is a free, open-source request system that lets Plex and Emby users request movies and shows for automatic fulfillment.$q$,
  og_description = $q$Ombi is a free, open-source request system that lets Plex and Emby users request movies and shows for automatic fulfillment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ffe78cc3-84d8-4e34-88df-15226b1e5736';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ffe78cc3-84d8-4e34-88df-15226b1e5736' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Plex/Emby user sync$q$, $q$Import existing users from a connected Plex or Emby server so they can log in with their normal credentials.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Smart search$q$, $q$Search for movies and shows across metadata providers, showing availability before a request is submitted.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Automation integration$q$, $q$Connects to Sonarr, Radarr, and CouchPotato so approved requests are fetched automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Request approval workflow$q$, $q$Optional admin approval step before a request is sent on for fulfillment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Notifications$q$, $q$Configurable alerts to inform requesters and admins about request status changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Mobile apps$q$, $q$Native iOS and Android apps for browsing and requesting content on the go.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Free and open source with active GitHub and Discord communities$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Tight integration with the Sonarr/Radarr automation stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Native mobile apps in addition to the web interface$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Syncs existing Plex/Emby user accounts, avoiding duplicate logins$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Requires Sonarr/Radarr (or similar tools) already configured to actually fulfill requests$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Self-hosting and reverse-proxy setup is needed for secure remote access$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Development pace can vary since it's a community-maintained project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Is Ombi free to use?$q$, $q$Yes, Ombi is free and open source. The project accepts optional donations but charges no license or subscription fee.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Does Ombi download the media itself?$q$, $q$No. Ombi manages requests and hands them off to connected tools like Sonarr and Radarr, which handle the actual downloading.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Can users log in with their Plex account?$q$, $q$Yes, Ombi can sync and authenticate users directly from a connected Plex or Emby server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Is there a mobile app?$q$, $q$Yes, Ombi has native apps for iOS and Android in addition to its web interface.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Family media requests$q$, $q$Let household members request new movies and shows without giving them access to the underlying automation tools.$q$, $q$Plex/Emby server admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$Moderated content additions$q$, $q$Use the approval workflow so an admin reviews requests before content is fetched.$q$, $q$Server owners managing storage and licensing limits$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ombi is an open-source media request platform created by developer Jamie Rees for Plex and Emby server owners. Users log in with their Plex or Emby credentials, browse a catalog of movies and shows, and submit requests. Ombi checks whether the content already exists and, if not, hands the request off to connected automation tools such as Sonarr and Radarr to fetch it.$q$, $q$The project accepts community contributions on GitHub and is supported through optional donations via PayPal and Patreon, with active support channels on Discord and GitHub issues.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Ombi is built for people running a shared Plex or Emby server for family or friends who don't want to grant everyone direct access to Sonarr, Radarr, or the file system — instead, users simply request titles and get notified when they're ready.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffe78cc3-84d8-4e34-88df-15226b1e5736', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── PodFetch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted podcast manager written in Rust that downloads episodes automatically and streams them through a web player.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PodFetch is a free, open-source self-hosted podcast downloader with a web player and GPodder sync support.$q$,
  og_description = $q$PodFetch is a free, open-source self-hosted podcast downloader with a web player and GPodder sync support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63b21fd2-9266-4e94-acfa-f6a9f0e85347';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63b21fd2-9266-4e94-acfa-f6a9f0e85347' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Automatic episode downloads$q$, $q$Subscribes to podcast RSS feeds and pulls new episodes as they're published.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Web-based player$q$, $q$Browse and listen to downloaded episodes directly from the PodFetch web interface.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$GPodder integration$q$, $q$Sync with GPodder-compatible apps so you can keep using an existing mobile podcast client against your self-hosted server.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Docker-first deployment$q$, $q$Ships as a continuously updated Docker image for easy self-hosting.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Lightweight Rust backend$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$GPodder compatibility means no need to switch podcast apps on mobile$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Frequent Docker image rebuilds keep it current with the latest commits$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Smaller community than mainstream podcast apps, so documentation is thin in places$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$No official native mobile app — mobile access relies on GPodder-compatible clients$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Self-hosting and storage management is on the operator$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Is PodFetch free?$q$, $q$Yes, it is open-source software that can be self-hosted at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Can I use my existing podcast app with PodFetch?$q$, $q$Yes, PodFetch supports GPodder-compatible sync so existing podcast apps can connect to it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$How is PodFetch deployed?$q$, $q$It is distributed primarily as a Docker image, rebuilt automatically with each update to the main branch.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$Personal podcast archive$q$, $q$Automatically download and retain episodes from favorite shows on your own storage.$q$, $q$Self-hosters and privacy-conscious podcast listeners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$GPodder-synced listening$q$, $q$Keep episode progress and subscriptions synced to a GPodder-compatible mobile app backed by a self-hosted server.$q$, $q$Users who want to avoid third-party podcast services$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PodFetch is an open-source, self-hosted podcast downloader and server built with a Rust backend and a React frontend. It subscribes to podcast feeds, automatically downloads new episodes, and provides a web app for browsing and listening to your archive.$q$, $q$The project is developed by SamTV12345 on GitHub and ships a Docker image that is rebuilt on every push to the main branch, so operators typically pair it with an updater like Watchtower to stay current.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$PodFetch fits self-hosters who want to archive podcasts locally instead of relying on a third-party app, and who want to keep using their preferred podcast client through GPodder-compatible sync rather than being locked into PodFetch's own player.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63b21fd2-9266-4e94-acfa-f6a9f0e85347', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Radarr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source movie collection manager that automatically monitors, searches for, and downloads movies to a quality standard you set.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Radarr is a free, open-source tool that automatically monitors, searches for, and organizes movies for your media library.$q$,
  og_description = $q$Radarr is a free, open-source tool that automatically monitors, searches for, and organizes movies for your media library.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'faf3dbd9-cf17-44f0-87da-3ad94eaa9671';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'faf3dbd9-cf17-44f0-87da-3ad94eaa9671' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Calendar view$q$, $q$See upcoming movie releases relevant to your monitored list in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Manual and automatic search$q$, $q$Let Radarr search automatically on a schedule, or manually pick a specific release to grab.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Failed download handling$q$, $q$Automatically blacklists releases that fail and retries with the next best match.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Custom formats$q$, $q$Fine-tune release selection with preferred words, scoring, and regex-based rules.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Quality profiles$q$, $q$Define acceptable resolutions and formats per movie or globally.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Notifications$q$, $q$Send alerts on grabs, imports, and failures to a wide range of notification services.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Multiple library views$q$, $q$Switch between poster grid and table layouts, plus collection-based tracking.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Broad platform support including NAS, Docker, and BSD$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Large, mature community with extensive wiki documentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Deep integration with the wider *arr ecosystem (Sonarr, Prowlarr, Bazarr, Ombi)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Requires a separate download client and indexers to be functional$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Configuration (quality profiles, custom formats) has a learning curve for new users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$No official support channel beyond community forums and Discord$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Is Radarr free?$q$, $q$Yes, Radarr is completely free, open-source software with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Does Radarr download movies itself?$q$, $q$No, it searches indexers and sends releases to a separate download client (such as a torrent or Usenet client) that you configure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$What platforms does Radarr run on?$q$, $q$Windows, Linux (including ARM/ARM64), macOS, Docker, BSD, and NAS devices like Synology and QNAP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Does Radarr work with Plex or Jellyfin?$q$, $q$Yes, it doesn't stream media itself but organizes files so any media server, including Plex, Jellyfin, and Emby, can read them.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Automated movie library management$q$, $q$Monitor a wishlist of movies and have Radarr fetch and organize them as they become available.$q$, $q$Home media server operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$Quality-consistent collections$q$, $q$Enforce custom formats and quality profiles so an entire movie library matches the same resolution and encoding standards.$q$, $q$Media library curators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Radarr is a free, open-source movie collection manager, originally forked from Sonarr's codebase in 2017 by a developer frustrated with CouchPotato. It monitors your movie library, searches configured indexers for matching releases, and sends the best match to a download client, then renames and organizes the file into your library.$q$, $q$Radarr is community-developed and distributed for Windows, Linux (including ARM), macOS, NAS platforms like Synology and QNAP, Docker, and BSD, with an active wiki and forum maintained by the Servarr project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Radarr is aimed at home media server operators who want their movie library to stay complete and consistently formatted without manually searching for each release, typically alongside a Plex, Jellyfin, or Emby server and tools like Ombi for requests.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('faf3dbd9-cf17-44f0-87da-3ad94eaa9671', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Reaparr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cross-platform, open-source tool that downloads and copies media from any Plex server you have access to onto your own.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Polish$q$]::text[],
  seo_meta_description = $q$Reaparr is a free, open-source tool that downloads media from any Plex server you have access to and organizes it locally.$q$,
  og_description = $q$Reaparr is a free, open-source tool that downloads media from any Plex server you have access to and organizes it locally.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'effcc65a-35ca-4139-bbe4-ff1e95fd6c80';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'effcc65a-35ca-4139-bbe4-ff1e95fd6c80' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Multi-account, multi-server support$q$, $q$Connect several Plex accounts and servers at once to pull from more than one library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Parallel downloads$q$, $q$Process multiple queued downloads simultaneously with automatic recovery from interruptions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Library browsing and filtering$q$, $q$Filter and sort available content by genre, year, quality, and country before downloading.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Sonarr/Radarr integration$q$, $q$Acts as an indexer and download client so Sonarr and Radarr can fetch content sourced from connected Plex servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Setup wizard$q$, $q$Guided initial configuration to connect accounts and set download paths.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Flexible file organization$q$, $q$Choose where downloaded files are stored on your own system.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Consolidates content from multiple Plex servers you already have access to$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Plugs directly into an existing Sonarr/Radarr setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Runs on NAS platforms (Unraid, Synology) as well as desktop OSes via Docker$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Only useful if you already have login access to other Plex servers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Docker knowledge required for setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Raises content-ownership and permission considerations when pulling from servers you don't own$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Is Reaparr free?$q$, $q$Yes, it is free, open-source software with an optional donation link.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Do I need my own Plex server to use Reaparr?$q$, $q$You need access (an account) to at least one Plex server whose content you want to copy; Reaparr then organizes downloads into your own storage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Can Reaparr work with Sonarr or Radarr?$q$, $q$Yes, it can be configured as an indexer and download client so Sonarr and Radarr can source content through it.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$What platforms does Reaparr support?$q$, $q$It runs via Docker on Windows, Linux, macOS, Unraid, and Synology.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Consolidating shared Plex libraries$q$, $q$Pull copies of content from friends' or family members' Plex servers into your own library.$q$, $q$Users with access to multiple Plex servers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$Extra source for *arr automation$q$, $q$Feed Sonarr/Radarr an additional content source by connecting Reaparr as an indexer/download client.$q$, $q$Home media server operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Reaparr is an open-source, GPL-3.0-licensed media downloader that connects to Plex servers you have login access to and copies movies and TV episodes onto your own storage. It can browse libraries in a poster grid or table view, filter by genre, year, quality, and country, and download multiple items in parallel across resumable, resilient queues.$q$, $q$It also works as an indexer and download client for Sonarr and Radarr, letting those tools pull content sourced from other Plex libraries. Reaparr runs via Docker on Windows, Linux, macOS, Unraid, and Synology.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Reaparr is for people with legitimate access to multiple Plex servers — such as friends' or family members' shares — who want to consolidate content locally, or who want an extra source feeding their existing Sonarr/Radarr automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('effcc65a-35ca-4139-bbe4-ff1e95fd6c80', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Sonarr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source PVR that automatically monitors, searches, downloads, and organizes TV series from Usenet and torrent sources.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sonarr is a free, open-source PVR that automatically finds, downloads, and organizes TV series for your media library.$q$,
  og_description = $q$Sonarr is a free, open-source PVR that automatically finds, downloads, and organizes TV series for your media library.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Episode monitoring$q$, $q$Track ongoing and future episodes for shows in your library and grab them automatically as they're released.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Quality profiles$q$, $q$Define acceptable resolutions and release formats globally or per series.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Calendar view$q$, $q$See upcoming episode air dates across all monitored series.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Manual search$q$, $q$Manually browse and select specific releases when you want more control than automatic search.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Failed download handling$q$, $q$Automatically blacklists problematic releases and retries with the next best candidate.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Notification system$q$, $q$Send alerts for grabs, imports, and failures to many third-party notification services.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Mature project with a decade of active development and a large community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Broad platform coverage including Docker and NAS devices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Integrates cleanly with the rest of the *arr ecosystem$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Requires a separate download client and configured indexers to function$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Initial setup (quality profiles, root folders, permissions) has a learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Community-supported only, no official commercial support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Is Sonarr free?$q$, $q$Yes, Sonarr is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Does Sonarr download episodes directly?$q$, $q$No, Sonarr searches indexers and sends chosen releases to a separate Usenet or torrent download client that you configure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$What platforms does Sonarr support?$q$, $q$Windows, Linux (including ARM and musl-based distros), macOS, Docker, and NAS systems such as Synology and QNAP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Was Sonarr previously called something else?$q$, $q$Yes, it was known as NzbDrone before being renamed to Sonarr in October 2014.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Automated TV series tracking$q$, $q$Monitor ongoing shows and automatically fetch new episodes as they're released.$q$, $q$Home media server operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Library standardization$q$, $q$Apply consistent quality profiles and naming across a growing TV library.$q$, $q$Media library curators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Sonarr is a free, open-source internet PVR for TV series. It was renamed from NzbDrone in October 2014 and has since become one of the most widely used tools in the self-hosted media automation ecosystem. Sonarr monitors your show list, watches for new episodes, searches configured indexers, and hands matching releases to a download client before renaming and filing the episode into your library.$q$, $q$Development is community-driven and hosted on GitHub, with official builds for Windows, Linux, macOS, Docker, and NAS devices, plus an extensive wiki maintained by the Servarr project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Sonarr is built for home media server operators who track ongoing TV series and want new episodes fetched and organized automatically as they air, typically paired with Plex, Jellyfin, or Emby and complementary tools like Radarr, Prowlarr, and Bazarr.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── TrackWatch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted Spotify release tracker that auto-syncs new songs from followed artists into a playlist.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TrackWatch is a free, open-source self-hosted tool that auto-syncs new Spotify releases from your followed artists into a playlist.$q$,
  og_description = $q$TrackWatch is a free, open-source self-hosted tool that auto-syncs new Spotify releases from your followed artists into a playlist.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '27408a9d-fa62-429f-be90-8c7e77ed1deb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '27408a9d-fa62-429f-be90-8c7e77ed1deb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Automatic playlist syncing$q$, $q$New releases from followed artists are added to a TrackWatch-managed playlist automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Frequent release checks$q$, $q$Polls for new music multiple times per day rather than a single daily check.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Discography generator$q$, $q$Build a playlist covering an artist's full discography.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Ghost track cleaner$q$, $q$Detect and remove tracks that have been removed or are no longer playable from playlists.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Self-hosted deployment$q$, $q$Runs via Docker, keeping your listening data off third-party servers beyond Spotify itself.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Simple Docker deployment with published images on GHCR and Docker Hub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Checks for releases more frequently than relying on Spotify's own notifications$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Extra utilities (discography generator, ghost track cleaner) beyond basic tracking$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Only works with Spotify, no support for other streaming services$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Requires a Spotify developer app/API credentials to connect your account$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Smaller, single-maintainer project with limited documentation$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Is TrackWatch free?$q$, $q$Yes, it is free, open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Does TrackWatch work with services other than Spotify?$q$, $q$No, it is built specifically around the Spotify API and playlists.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$How do I deploy TrackWatch?$q$, $q$It's distributed as a Docker image published to GHCR and Docker Hub, deployable in minutes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$What is the ghost track cleaner?$q$, $q$A utility that finds and removes tracks in your playlists that Spotify has delisted or made unplayable.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Automatic new-release playlist$q$, $q$Keep a playlist automatically updated with new songs from artists you follow on Spotify.$q$, $q$Spotify power users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$Playlist maintenance$q$, $q$Clean up broken or delisted tracks and generate full-discography playlists for an artist.$q$, $q$Music collectors and playlist curators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$TrackWatch is an open-source, self-hosted service that connects to your Spotify account, watches the artists you follow, and automatically adds their new releases to a dedicated playlist. It checks for new music multiple times a day so you don't have to manually search for releases.$q$, $q$The project is developed by emlopezr and is available on GitHub, with a hosted demo instance and a Docker image published to both GHCR and Docker Hub for self-hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$TrackWatch is for Spotify users who want a private, self-hosted alternative to relying purely on Spotify's own release radar, and who want extra utilities like a discography generator and a tool for cleaning up ghost tracks from playlists.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27408a9d-fa62-429f-be90-8c7e77ed1deb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── youtube-dl-nas ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source dashboard for downloading online videos directly to a NAS, with direct mobile-to-NAS sharing.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Korean$q$]::text[],
  seo_meta_description = $q$youtube-dl-nas is a free, open-source dashboard for downloading videos straight to a NAS with direct mobile-to-NAS sharing.$q$,
  og_description = $q$youtube-dl-nas is a free, open-source dashboard for downloading videos straight to a NAS with direct mobile-to-NAS sharing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ee38403-9c79-4f01-b843-b92c0873dc50';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ee38403-9c79-4f01-b843-b92c0873dc50' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Web dashboard$q$, $q$Manage and monitor video download jobs on the NAS from a browser.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Mobile sharing setup$q$, $q$Share links and credentials directly from a phone to the NAS to trigger downloads remotely.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$No intermediary server$q$, $q$Shared URLs and credentials go directly between the phone and the NAS rather than through an external relay.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Docker distribution$q$, $q$Available as images on both Docker Hub and GitHub Container Registry for straightforward self-hosting.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Keeps downloads and shared links private by avoiding a third-party relay$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Documented in both English and Korean$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Simple Docker-based installation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Niche, single-maintainer project with limited broader community support$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Primarily suited to NAS setups rather than general desktop use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Depends on the underlying video-downloading engine staying compatible with source sites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Is youtube-dl-nas free?$q$, $q$Yes, it is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Does it require cloud services to share downloads to my phone?$q$, $q$No, mobile sharing is designed to work directly between your phone and your NAS without an intermediary server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$How is it installed?$q$, $q$Via Docker, using images published to Docker Hub or GitHub Container Registry.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$NAS-based video downloading$q$, $q$Queue and manage video downloads that save directly to NAS storage.$q$, $q$NAS owners and home server operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$Mobile-triggered downloads$q$, $q$Send a video link from a phone directly to the NAS to start a download without cloud intermediaries.$q$, $q$Privacy-conscious self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$youtube-dl-nas is an open-source tool that gives a network-attached storage device a web dashboard for downloading online videos, plus a mobile-sharing setup so links and credentials can be shared directly between a phone and the NAS without routing through an external server.$q$, $q$The project is maintained by hyeonsangjeon on GitHub, distributed as Docker images on Docker Hub and GitHub Container Registry, and documented in both English and Korean.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's aimed at NAS owners who want to queue video downloads from a phone or browser and have them land directly on their own storage, without sending links through a third-party cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ee38403-9c79-4f01-b843-b92c0873dc50', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Beets ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, plugin-based command-line tool that organizes music libraries and enriches metadata via MusicBrainz.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Beets is a free, open-source, plugin-based tool that organizes music libraries and corrects metadata using MusicBrainz.$q$,
  og_description = $q$Beets is a free, open-source, plugin-based tool that organizes music libraries and corrects metadata using MusicBrainz.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5dcba8fe-ea18-4a2a-8991-8ea5283bcc69' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$MusicBrainz metadata matching$q$, $q$Automatically identifies tracks and albums against the MusicBrainz database and applies corrected tags.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Plugin architecture$q$, $q$Extend functionality with plugins for album art, lyrics, genres, tempo, acoustic fingerprints, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Multiple metadata sources$q$, $q$Pull additional metadata from sources like Discogs and Beatport alongside MusicBrainz.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Duplicate and gap detection$q$, $q$Identify duplicate tracks and missing entries in albums.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Transcoding$q$, $q$Convert audio files between formats through plugin support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Web interface$q$, $q$Optional web-based library browser with HTML5 audio playback.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Free and open source with a mature, active plugin ecosystem$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Highly accurate metadata correction via MusicBrainz matching$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Cross-platform since it runs anywhere Python does$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Extensive documentation and an active community (mailing list, IRC, blog)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Command-line first, which is a barrier for users wanting a pure GUI experience$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Initial tagging pass on a large, messy library can take real time and manual review$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Plugin quality and maintenance varies since many are community-contributed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Is Beets free?$q$, $q$Yes, it is free, open-source software installable via pip.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Does Beets have a graphical interface?$q$, $q$It's primarily a command-line tool, but an optional web plugin provides browser-based library browsing and playback.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$What does Beets use for metadata?$q$, $q$Primarily the MusicBrainz database, with optional plugins for Discogs and Beatport.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Can Beets convert audio formats?$q$, $q$Yes, transcoding is available through a plugin.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Large library metadata cleanup$q$, $q$Automatically identify and correct tags across a sprawling, inconsistently tagged music collection.$q$, $q$Music collectors and archivists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$Feeding a self-hosted music server$q$, $q$Use Beets as the tagging and organization layer before serving music through Plex, Jellyfin, or Navidrome.$q$, $q$Self-hosted music server operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Beets is a free, open-source Python application for managing and cataloging music collections, self-described as being made for "obsessive music geeks." Its core job is to import music, match it against the MusicBrainz database, and correct and enrich tags such as artist, album, genre, and album art, then rename and organize files into a consistent structure.$q$, $q$It's installed via pip and extended through a large plugin ecosystem covering things like lyrics fetching, acoustic fingerprinting, transcoding, duplicate detection, and a web-based library browser with HTML5 playback.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Beets suits music collectors who care about accurate, consistent metadata across large libraries and are comfortable with a command-line tool, including those who pair it with Plex, Jellyfin, or Navidrome as the metadata and organization layer feeding the library.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5dcba8fe-ea18-4a2a-8991-8ea5283bcc69', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── BotWave ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source server-client platform for broadcasting audio over FM radio from Raspberry Pi devices.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$BotWave is a free, open-source platform for broadcasting audio over FM radio from one or more Raspberry Pi devices.$q$,
  og_description = $q$BotWave is a free, open-source platform for broadcasting audio over FM radio from one or more Raspberry Pi devices.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b3278d1-8d02-4f74-81f9-c990fdd076fb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b3278d1-8d02-4f74-81f9-c990fdd076fb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Multi-device management$q$, $q$Control and monitor multiple Raspberry Pi broadcast clients from a single central server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Audio broadcasting$q$, $q$Transmit local audio files or live streams over FM.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Remote file upload$q$, $q$Upload audio to a connected Pi client from anywhere the server is reachable.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Remote broadcast control$q$, $q$Start, stop, and manage broadcasts on clients remotely.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Passkey authentication$q$, $q$Secures client-server communication with passkey-based authentication.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Standalone mode$q$, $q$Run on a single Raspberry Pi without needing a separate server.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$One-command install script for quick setup$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Supports managing multiple broadcast points from one server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Works standalone for simple single-device use$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Requires specific Raspberry Pi hardware and a GPIO antenna connection$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$FM broadcasting is subject to local radio regulations that vary by country$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Newer, smaller project with limited third-party documentation$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Is BotWave free?$q$, $q$Yes, it is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$What hardware do I need?$q$, $q$A Raspberry Pi with an antenna or wire connected to GPIO 4 (physical pin 7) for transmission.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Can I run BotWave without a server?$q$, $q$Yes, it supports a standalone mode on a single Raspberry Pi as well as a multi-client server-managed setup.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Is FM broadcasting with BotWave legal everywhere?$q$, $q$Radio spectrum regulations vary by country, so users should confirm local rules on low-power FM transmission before broadcasting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Home or campus FM broadcasting$q$, $q$Transmit audio files or live streams over FM from a Raspberry Pi.$q$, $q$Hobbyists and makers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$Multi-site broadcast management$q$, $q$Centrally manage several Raspberry Pi FM transmitters from one server.$q$, $q$Users running multiple low-power broadcast points$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$BotWave is an open-source platform for broadcasting audio files or live streams over FM radio using Raspberry Pi hardware. It supports both a standalone single-Pi setup and a server-client model where one central server manages and controls multiple Pi-based broadcast clients remotely.$q$, $q$The project is built by DPIP Studio, installs via a one-command automated script, and requires a Raspberry Pi with an antenna or wire connected to GPIO pin 4 (physical pin 7) to transmit.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$BotWave is aimed at hobbyists and makers experimenting with low-power FM broadcasting on Raspberry Pi, particularly those wanting to manage several Pi transmitters from one place. As with any FM transmission project, local radio spectrum regulations apply and should be checked before use.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b3278d1-8d02-4f74-81f9-c990fdd076fb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── LibreTime ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source radio broadcast automation platform for scheduling, library management, and AM/FM or web playout.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LibreTime is a free, open-source radio automation platform for scheduling and playing out AM/FM and internet radio broadcasts.$q$,
  og_description = $q$LibreTime is a free, open-source radio automation platform for scheduling and playing out AM/FM and internet radio broadcasts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd508cac6-6459-4054-ae69-1f4088c41400';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd508cac6-6459-4054-ae69-1f4088c41400' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Media library management$q$, $q$Organize music, sweepers, podcasts, and full-length shows in a searchable library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Drag-and-drop scheduling$q$, $q$Build a broadcast calendar and queue content for automatic playout.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$AM/FM and web playout$q$, $q$Drive a traditional transmitter chain or stream directly to internet radio listeners.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Show and podcast automation$q$, $q$Automatically schedule recurring shows and publish recorded episodes as podcasts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Self-hosted deployment$q$, $q$Install on your own server or infrastructure, with an active GitHub, Discourse, and Matrix community.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Free and open source under AGPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Purpose-built for radio automation, not a generic media server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Handles both terrestrial (AM/FM) and internet radio playout$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Active community fork with ongoing development$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Requires self-hosting and server administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Setup and configuration are more involved than consumer streaming apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$No official managed/cloud hosting from the project itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Is LibreTime free to use?$q$, $q$Yes. LibreTime is free, open-source software licensed under AGPLv3 that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Is LibreTime the same as Airtime?$q$, $q$LibreTime is a community fork of Sourcefabric's Airtime, created in 2017 after Airtime's open-source version stopped receiving active development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Can LibreTime broadcast to an FM transmitter?$q$, $q$Yes, LibreTime supports AM/FM playout in addition to web/internet radio streaming.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Do I need to host LibreTime myself?$q$, $q$Yes, LibreTime is self-hosted software; there is no official hosted SaaS version from the project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Community radio automation$q$, $q$Schedule and automate daily programming for a volunteer-run community station.$q$, $q$Community and campus radio stations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$Internet radio streaming$q$, $q$Run a 24/7 internet radio stream with automated playlists and scheduled shows.$q$, $q$Independent internet broadcasters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LibreTime is a self-hosted radio broadcast and automation platform used to schedule, manage, and play out audio for community and internet radio stations. It began in 2017 as a community-driven fork of Sourcefabric's Airtime, created after Airtime's open-source development stalled in favor of a paid SaaS offering.$q$, $q$The platform combines a media library, a drag-and-drop scheduling calendar, and a playout engine that can drive traditional AM/FM transmitter chains as well as pure internet radio streams. Shows, sweepers, podcasts, and full-length programs can all be organized and queued for automatic broadcast.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LibreTime is aimed at community radio stations, campus and internet broadcasters, and nonprofit or volunteer-run stations that need dependable automation without licensing an expensive proprietary system.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d508cac6-6459-4054-ae69-1f4088c41400', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Lyrion Music Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source music server that streams local libraries and internet radio to Squeezebox and software players.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Lyrion Music Server (formerly Logitech Media Server) is a free, open-source server for streaming music to Squeezebox and software players.$q$,
  og_description = $q$Lyrion Music Server (formerly Logitech Media Server) is a free, open-source server for streaming music to Squeezebox and software players.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'afe3197a-f0df-4980-b89c-90bb6be2715d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'afe3197a-f0df-4980-b89c-90bb6be2715d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Local library streaming$q$, $q$Serve your own music collection over the network to any supported player.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Multi-room synchronization$q$, $q$Control and synchronize multiple players across different rooms from one server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Squeezebox hardware support$q$, $q$Continues to support legacy Squeezebox network players after Logitech's discontinuation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Software player compatibility$q$, $q$Works with software players such as Squeezelite, piCorePlayer, and SqueezePlay.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Broad platform installation$q$, $q$Runs on Windows, macOS, Raspberry Pi, popular NAS platforms (Synology, QNAP, ReadyNAS, OMV), and Docker.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Free and open source, community-maintained$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Keeps legacy Squeezebox hardware functional$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Wide range of install targets including NAS and Docker$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Supports multi-room, synchronized playback$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Interface reflects its long legacy rather than a modern redesign$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Requires self-hosting and manual setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Best suited to users already invested in the Squeezebox/LMS ecosystem$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Is Lyrion Music Server the same as Logitech Media Server?$q$, $q$Yes. Lyrion Music Server is the renamed continuation of Logitech Media Server (formerly SlimServer/Squeezebox Server), rebranded after Logitech handed the project to the open-source community in 2024.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Do I need Squeezebox hardware to use Lyrion?$q$, $q$No. Lyrion also works with software players like Squeezelite, so you can stream without owning legacy Squeezebox hardware.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Is Lyrion free?$q$, $q$Yes, Lyrion Music Server is free, open-source software.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$What platforms can run Lyrion Music Server?$q$, $q$Lyrion runs on Windows, macOS, Raspberry Pi, several NAS platforms, and Docker.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Legacy Squeezebox support$q$, $q$Keep older Squeezebox network players working with continued server updates.$q$, $q$Squeezebox hardware owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$Multi-room home audio$q$, $q$Stream a personal music library synchronized across multiple rooms and devices.$q$, $q$Home audio and multi-room enthusiasts$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Lyrion Music Server (LMS) is the community-maintained continuation of Logitech Media Server, the software originally built by Slim Devices to power Squeezebox network audio players. After Logitech ended official development and shut down its mysqueezebox.com cloud service in March 2024, the project was handed to the open-source community and rebranded as Lyrion Music Server starting with version 9.0 in November 2024.$q$, $q$Lyrion streams music from a local library, internet radio stations, and connected streaming services to a wide range of hardware and software players, including legacy Squeezebox devices and modern software players like Squeezelite and piCorePlayer. It can manage multiple synchronized players across different rooms or locations from a single server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Lyrion suits owners of legacy Squeezebox hardware who need continued server support, plus multi-room audio enthusiasts and self-hosters who want a locally controlled alternative to commercial streaming platforms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afe3197a-f0df-4980-b89c-90bb6be2715d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── moOde Audio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source audiophile music player software built specifically for the Raspberry Pi.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$moOde Audio is free, open-source audiophile music player software built exclusively for the Raspberry Pi, controlled entirely from a browser.$q$,
  og_description = $q$moOde Audio is free, open-source audiophile music player software built exclusively for the Raspberry Pi, controlled entirely from a browser.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '80afb5c8-0281-4cec-9c4b-b2b6bf20335e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '80afb5c8-0281-4cec-9c4b-b2b6bf20335e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$High-resolution and DSD playback$q$, $q$Supports high-res audio formats and native DSD playback for audiophile use.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Multiroom synchronized audio$q$, $q$Synchronize playback across multiple moOde installations for whole-home listening.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$CamillaDSP integration$q$, $q$Customizable digital signal processing with 64-bit volume control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Renderer support$q$, $q$Works with Spotify Connect, AirPlay 2, and RoonBridge for casting from other apps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Flexible output and file access$q$, $q$Connects via USB, HDMI, or I2S outputs, with library access over SMB, NFS, or DLNA.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Browser-based control$q$, $q$Fully controlled from any web browser with no dedicated app install required.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Purpose-built for high-fidelity audio on affordable Raspberry Pi hardware$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$No app needed — full browser-based control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Active DIY audio community and frequent updates$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Only runs on Raspberry Pi hardware, not general-purpose servers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Setup requires some comfort with SBC hardware and imaging OS files$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Best suited to users with an audio-focused use case rather than general media management$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$What hardware does moOde Audio run on?$q$, $q$moOde is built specifically for the Raspberry Pi family of single-board computers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Is moOde Audio free?$q$, $q$Yes, moOde is free and open-source software licensed under GPLv3.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Do I need an app to control moOde?$q$, $q$No, moOde is controlled entirely through a web browser on any device.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Does moOde support Spotify or AirPlay?$q$, $q$Yes, moOde integrates with renderers including Spotify Connect, AirPlay 2, and RoonBridge.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$DIY audiophile streamer$q$, $q$Turn a Raspberry Pi and DAC into a dedicated high-resolution music streamer.$q$, $q$DIY audio enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$Whole-home multiroom audio$q$, $q$Synchronize multiple Raspberry Pi units running moOde for multiroom playback.$q$, $q$Home audio hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$moOde Audio is free, open-source software built exclusively for the Raspberry Pi family of single-board computers, turning inexpensive hardware into an audiophile-grade music streamer. It is developed by and for the DIY audio community, with the source code published on GitHub under GPLv3.$q$, $q$The player supports high-resolution and DSD audio, integrates renderers like Spotify Connect, AirPlay 2, and RoonBridge, and offers customizable audio processing through CamillaDSP with 64-bit volume control. It is controlled entirely through a browser-based interface, so no dedicated app is required on desktop, tablet, or phone.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$moOde is built for DIY audio enthusiasts and audiophiles who want to build a dedicated, high-quality music streamer on Raspberry Pi hardware, with full control over signal processing and output routing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80afb5c8-0281-4cec-9c4b-b2b6bf20335e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mopidy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Extensible, open-source music server written in Python that plays local files, streaming services, and radio via extensions.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2009,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Mopidy is a free, open-source, extensible music server written in Python that plays local and streamed music via community extensions.$q$,
  og_description = $q$Mopidy is a free, open-source, extensible music server written in Python that plays local and streamed music via community extensions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5843c8b6-d28f-4688-bb58-9b9b806ffe66';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5843c8b6-d28f-4688-bb58-9b9b806ffe66' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Extension architecture$q$, $q$Add music sources, frontends, and features through a large library of community extensions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$MPD-compatible protocol$q$, $q$Can be controlled by existing MPD client applications thanks to protocol compatibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$HTTP/JSON API$q$, $q$Exposes a web API for building custom or web-based clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Multiple backend sources$q$, $q$Extensions add support for local files, Spotify, SoundCloud, internet radio, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Headless server operation$q$, $q$Runs as a background server, ideal for Raspberry Pi and other always-on devices.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Highly extensible via a large plugin ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Compatible with existing MPD client software$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Lightweight enough for Raspberry Pi and similar devices$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Core install has limited functionality without extensions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Configuration and extension setup require technical familiarity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$No official mobile or desktop app is bundled — relies on third-party clients$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Is Mopidy free to use?$q$, $q$Yes, Mopidy is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Does Mopidy support Spotify?$q$, $q$Spotify and other streaming sources are supported through community-built Mopidy extensions, not the core install.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$What platforms does Mopidy run on?$q$, $q$Mopidy can be installed on Linux, macOS, and Raspberry Pi.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Can I use an existing MPD client with Mopidy?$q$, $q$Yes, Mopidy implements an MPD-compatible protocol so many existing MPD clients work with it.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Headless home music server$q$, $q$Run Mopidy on a Raspberry Pi as an always-on server controlled by a phone or web client.$q$, $q$Self-hosters and Raspberry Pi hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$Custom music client development$q$, $q$Build a custom frontend against Mopidy's HTTP/JSON API or extension system.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Mopidy is an extensible music server written in Python, first released in December 2009. Its core is deliberately minimal; nearly all of its capability — local file playback, Spotify, SoundCloud, internet radio, and more — is added through a large ecosystem of community-built extensions.$q$, $q$Because Mopidy exposes an MPD-compatible interface and its own HTTP/JSON API, it can be controlled by a wide range of existing MPD clients as well as dedicated Mopidy web and mobile frontends, making it a flexible backbone for headless music setups such as the Raspberry Pi-based Pi MusicBox distribution.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Mopidy appeals to developers and tinkerers who want a hackable, extension-driven music server, and to self-hosters running a headless music player (e.g., on a Raspberry Pi) that they control with a separate client app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5843c8b6-d28f-4688-bb58-9b9b806ffe66', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── mpd ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Music Player Daemon is a flexible, server-side music player controlled remotely by third-party client applications.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MPD (Music Player Daemon) is a free, open-source server-side music player controlled remotely by a wide ecosystem of client apps.$q$,
  og_description = $q$MPD (Music Player Daemon) is a free, open-source server-side music player controlled remotely by a wide ecosystem of client apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Client-server architecture$q$, $q$The daemon runs on a server and is controlled remotely by any compatible client over its network protocol.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Plugin-based format support$q$, $q$Supports numerous audio formats and outputs through plugins and libraries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Large client ecosystem$q$, $q$A wide range of third-party desktop, web, and mobile clients (e.g., myMPD, various iOS apps) can control MPD.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Lightweight, headless operation$q$, $q$Runs efficiently on low-power hardware such as Raspberry Pi and NAS devices.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Free and open source with a long track record of stability$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Very lightweight, suitable for low-power hardware$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Large ecosystem of compatible client apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Well-documented network protocol for building custom clients$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$No official graphical interface — requires a separate client to use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Setup is more technical than an all-in-one media player$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Feature set is intentionally minimal compared to full media servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Is MPD free?$q$, $q$Yes, Music Player Daemon is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Does MPD have its own app?$q$, $q$No, MPD is a headless daemon; you connect to it using one of many third-party client applications.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$What can control MPD?$q$, $q$Any client that implements the MPD protocol, including desktop, web, and mobile apps such as myMPD.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Headless music server$q$, $q$Run MPD on a Raspberry Pi, NAS, or home server and control playback from any MPD-compatible client.$q$, $q$Self-hosters and technical hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$Custom client development$q$, $q$Build a custom player interface against MPD's documented network protocol.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Music Player Daemon (MPD) is a flexible, server-side application for playing music, first released in 2003. It runs as a background daemon on a server or single-board computer and exposes a network protocol that client applications connect to for playback control, rather than providing a built-in graphical interface itself.$q$, $q$MPD supports a wide range of audio formats through plugins and libraries, and it has spawned a large ecosystem of third-party clients across desktop, web, and mobile (including tools like myMPD and various iOS clients) that connect to a running MPD server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MPD is aimed at technical users and self-hosters who want a lightweight, headless music playback backend that they can control with any of the many available third-party clients, rather than a single all-in-one app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b68ce09a-b5d5-4d42-ab95-3e0f8ffbd563', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── mStream ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source personal music streaming server with offline sync and dedicated iOS and Android apps.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$mStream is a free, open-source music streaming server with offline sync and dedicated iOS and Android apps for lossless FLAC playback.$q$,
  og_description = $q$mStream is a free, open-source music streaming server with offline sync and dedicated iOS and Android apps for lossless FLAC playback.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6be73240-b846-4480-b296-99aefc7411ce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6be73240-b846-4480-b296-99aefc7411ce' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Cross-platform streaming$q$, $q$Runs on any operating system and streams to a web browser or dedicated mobile apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Offline sync$q$, $q$Sync tracks to iOS and Android apps for offline playback.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Lossless FLAC streaming$q$, $q$Streams uncompressed FLAC for audiophile-quality playback.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Gapless playback$q$, $q$Plays consecutive tracks without gaps for a continuous listening experience.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Playlist sharing$q$, $q$Create and share playlists with other users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Drag-and-drop uploads$q$, $q$Add music to the library through a simple drag-and-drop upload interface.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Dedicated native iOS and Android apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Offline sync for mobile listening$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Supports lossless FLAC streaming$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Requires self-hosting and server setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Smaller community and slower update cadence than larger media server projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Interface is more basic than commercial streaming apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Is mStream free?$q$, $q$Yes, mStream is free, open-source software available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Does mStream have mobile apps?$q$, $q$Yes, mStream offers dedicated iOS and Android apps with offline sync support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Can mStream stream lossless audio?$q$, $q$Yes, mStream supports streaming uncompressed FLAC files.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Personal music streaming$q$, $q$Self-host a personal music library and stream it to any device over the web.$q$, $q$Privacy-conscious music listeners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$Offline mobile listening$q$, $q$Sync tracks to the mStream mobile app for offline playback while traveling.$q$, $q$Mobile listeners without reliable connectivity$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$mStream is a free, open-source music streaming server that lets you access your own music collection from anywhere, with offline syncing for mobile listening. It functions as a self-hosted alternative to commercial streaming services, keeping your library and listening data under your own control.$q$, $q$The server supports gapless playback, a Milkdrop-based visualizer, playlist sharing, and drag-and-drop file uploads, and it streams uncompressed FLAC for users who want lossless audio quality.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$mStream suits privacy-conscious listeners and audiophiles who want to self-host their music collection and stream it to mobile apps without ads, algorithmic tracking, or subscription fees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6be73240-b846-4480-b296-99aefc7411ce', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── multi-scrobbler ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted tool that monitors your listening activity across many music sources and scrobbles it to Last.fm, ListenBrainz, and more.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$multi-scrobbler is a free, open-source tool that scrobbles listening activity from Spotify, Plex, Jellyfin, and more to Last.fm and ListenBrainz.$q$,
  og_description = $q$multi-scrobbler is a free, open-source tool that scrobbles listening activity from Spotify, Plex, Jellyfin, and more to Last.fm and ListenBrainz.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c94279f7-118b-4aae-a54e-6cce37b4a7f3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c94279f7-118b-4aae-a54e-6cce37b4a7f3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Broad source support$q$, $q$Monitors Spotify, Plex, Jellyfin, YouTube Music, Kodi, Mopidy, VLC, and Subsonic-compatible servers, among 20+ sources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Multiple scrobble destinations$q$, $q$Sends scrobbles to Last.fm, ListenBrainz, Libre.fm, Maloja, Koito, and Discord.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$MusicBrainz data standardization$q$, $q$Uses the MusicBrainz database to standardize track and artist metadata.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Multi-user support$q$, $q$Track scrobbles for multiple people from a single deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Retry queue$q$, $q$Automatically queues and retries scrobbles that fail due to network issues.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Web dashboard$q$, $q$View statistics, logs, and configuration from a built-in web interface.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Wide compatibility with music players and streaming sources$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Docker support for easy self-hosted deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Automatic retry for failed scrobbles improves reliability$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Requires self-hosting (Docker or Node.js) rather than a hosted option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Configuration of multiple sources/clients can take time to set up$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Primarily a background/utility tool rather than a full media player$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Is multi-scrobbler free?$q$, $q$Yes, multi-scrobbler is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Which services can multi-scrobbler scrobble to?$q$, $q$It can send scrobbles to Last.fm, ListenBrainz, Libre.fm, Maloja, Koito, and Discord.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Can it track multiple people's listening?$q$, $q$Yes, multi-scrobbler supports multi-user setups so you can scrobble for friends or family from one instance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$How is multi-scrobbler deployed?$q$, $q$It runs as a Docker container (x86/ARM) or as a local Node.js application.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Consolidated listening history$q$, $q$Merge listening activity from Spotify, Plex, Jellyfin, and other apps into one scrobbling history.$q$, $q$Self-hosters and music trackers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$Family scrobbling$q$, $q$Track scrobbles for multiple household members from a single self-hosted instance.$q$, $q$Households with shared media servers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$multi-scrobbler is a self-hosted, Docker-friendly application that monitors music listening activity across many sources and forwards ('scrobbles') it to one or more tracking services. It bridges the gap left by services that no longer natively scrobble everywhere you listen.$q$, $q$It supports a long list of sources — including Spotify, Plex, Jellyfin, YouTube Music, Kodi, Mopidy, VLC, and Subsonic-compatible servers like Navidrome and Airsonic — and can send scrobbles to destinations including Last.fm, ListenBrainz, Libre.fm, Maloja, Koito, and Discord. Failed scrobbles are queued and retried automatically, and a built-in web interface exposes stats, logs, and runtime configuration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$multi-scrobbler is built for self-hosters and music enthusiasts who listen across multiple apps and services and want a single, centralized, privacy-respecting scrobbling history — including those tracking listening for friends or family members.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94279f7-118b-4aae-a54e-6cce37b4a7f3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── musikcube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source terminal-based music player, library manager, and streaming server for large local collections.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$musikcube is a free, open-source terminal-based music player, library manager, and streaming server for Windows, macOS, and Linux.$q$,
  og_description = $q$musikcube is a free, open-source terminal-based music player, library manager, and streaming server for Windows, macOS, and Linux.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e04290f0-461c-4d34-99c8-53dd4fc5a339';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e04290f0-461c-4d34-99c8-53dd4fc5a339' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Terminal-based interface$q$, $q$A full-featured text UI for browsing, searching, and playing music from the command line.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Streaming server mode$q$, $q$Runs as a headless server that streams audio to remote clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Android companion app$q$, $q$musikdroid connects to a musikcube server for mobile playback and control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Gapless and crossfading playback$q$, $q$Supports seamless track transitions for continuous listening.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Extensible plugin architecture$q$, $q$Add functionality through plugins built on the musikcore C++ library.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$High-resolution audio output$q$, $q$Supports audio output up to 24-bit/192kHz.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Very lightweight, runs well on Raspberry Pi hardware$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Handles very large music libraries efficiently$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Cross-platform: Windows, macOS, and Linux$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Terminal-based interface has a learning curve for non-technical users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$No official iOS app, only Android (musikdroid)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Smaller community than mainstream media server projects$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Is musikcube free?$q$, $q$Yes, musikcube is free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Does musikcube have a graphical interface?$q$, $q$musikcube's core interface is terminal-based, though it also functions as a streaming server for remote clients like the musikdroid Android app.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$What platforms does musikcube support?$q$, $q$musikcube runs natively on Windows, macOS, and Linux, and performs well on a Raspberry Pi with a custom DAC.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Command-line music playback$q$, $q$Manage and play a large local music library entirely from the terminal.$q$, $q$Command-line-oriented music enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$Lightweight home streaming server$q$, $q$Run musikcube as a headless server on a Raspberry Pi and stream to the musikdroid mobile app.$q$, $q$Home server hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$musikcube is a fully functional, terminal-based music player, library manager, and streaming audio server that runs natively on Windows, macOS, and Linux, including on a Raspberry Pi with a custom DAC. It is built around three components: the core musikcube terminal player, the musikdroid Android companion app, and musikcore, a C++ library developers can build on.$q$, $q$It handles file scanning, tag indexing, gapless and crossfading playback, play queue management, and playlist CRUD operations, with an extensible plugin architecture and support for high-quality audio output up to 24-bit/192kHz. The project is designed to handle very large libraries, with reported support for collections exceeding 250,000 tracks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$musikcube appeals to command-line-oriented music enthusiasts, home server hobbyists who want a lightweight streaming backend, and developers building on the musikcore library, including Raspberry Pi tinkerers assembling custom audio setups.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e04290f0-461c-4d34-99c8-53dd4fc5a339', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Pinepods ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, Rust-based podcast manager with cross-device sync, YouTube channel subscriptions, and multi-user support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PinePods is a free, open-source, self-hosted podcast manager with cross-device sync, YouTube subscriptions, and multi-user support.$q$,
  og_description = $q$PinePods is a free, open-source, self-hosted podcast manager with cross-device sync, YouTube subscriptions, and multi-user support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '85c3b235-223c-45ae-bc99-db8243a2c741';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '85c3b235-223c-45ae-bc99-db8243a2c741' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Cross-device sync$q$, $q$Playback position, subscriptions, settings, and themes sync instantly across every connected device.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$YouTube channel subscriptions$q$, $q$Subscribe to YouTube channels and receive audio-only downloads formatted as podcast episodes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Smart playlists$q$, $q$Build customizable, filterable playlists that stay in sync across devices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Podcast discovery search$q$, $q$Find new shows using integrated Podcast Index and iTunes search.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Multi-user libraries$q$, $q$Separate podcast libraries for each family member or user account.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$gpodder-compatible sync$q$, $q$Use the built-in gpodder server or connect external services like Podsync or Nextcloud.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Broad client coverage: iOS, Android, web, desktop, and CLI$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Full cross-device sync included at no cost$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$YouTube channel-to-podcast conversion built in$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Requires self-hosting a Rust-based server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Newer project with a smaller community than established podcast apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Initial setup and Docker configuration require some technical comfort$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Is PinePods free?$q$, $q$Yes, PinePods is completely free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Can PinePods sync across multiple devices?$q$, $q$Yes, playback position, subscriptions, settings, and themes all sync across every device you connect.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Does PinePods support YouTube?$q$, $q$Yes, you can subscribe to YouTube channels and receive their audio as podcast-style downloads.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$What clients are available for PinePods?$q$, $q$PinePods offers iOS and Android apps, a web app, desktop apps for Windows/macOS/Linux, and a CLI client called Firewood.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Self-hosted podcast library$q$, $q$Host and manage all your podcast subscriptions with full data ownership.$q$, $q$Privacy-focused podcast listeners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$Family podcast management$q$, $q$Give each household member their own synced podcast library on one server.$q$, $q$Multi-user households$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$PinePods is a self-hosted podcast management platform built in Rust that emphasizes performance and full data ownership. It provides a complete podcast ecosystem — playback position, settings, subscriptions, and themes all sync across every device you use.$q$, $q$Beyond standard podcast subscriptions, PinePods can subscribe to YouTube channels and deliver their audio as podcast-style downloads. It includes smart playlists with synchronized filtering, podcast discovery through the Podcast Index and iTunes search, multi-user support with separate libraries per family member, and rich episode metadata including chapters, transcripts, people information, and funding links. It also supports a built-in gpodder server or external sync services like Podsync and Nextcloud.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$PinePods is built for self-hosters and privacy-focused podcast listeners who want full control of their subscriptions and listening data across phone, desktop, web, and terminal clients, without relying on a commercial podcast app.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('85c3b235-223c-45ae-bc99-db8243a2c741', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── SwingMusic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source music streaming server with a modern interface, described by its creators as a Spotify-like experience for your own files.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Swing Music is an open-source, self-hosted music streaming server with a modern interface, folder browsing, and smart duplicate detection.$q$,
  og_description = $q$Swing Music is an open-source, self-hosted music streaming server with a modern interface, folder browsing, and smart duplicate detection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '12f51e8d-3567-4f17-8ef0-8ba1de67aa06' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Modern streaming interface$q$, $q$A polished, browser-based UI designed to feel like a commercial streaming app.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Folder-based browsing$q$, $q$Navigate your library by directory structure in addition to standard views.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Fuzzy search$q$, $q$Typo-tolerant search helps you find tracks even with imperfect spelling.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Duplicate detection$q$, $q$Automatically identifies duplicate tracks and prefers the higher-bitrate version.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Collections$q$, $q$Group albums, artists, and other library items into custom collections.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Listening statistics$q$, $q$Tracks listening activity and surfaces basic insights for your library.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Free, open-source core with a modern, clean interface$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Runs on Linux, Windows, and Mac, plus Docker$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Smart duplicate detection saves storage and library cleanliness$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Active development supported by GitHub sponsorships$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Advanced discovery/mix features are gated behind a paid premium tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$No dedicated iOS app was found at time of writing (Android client available)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Newer project with a smaller ecosystem than established self-hosted media servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Is Swing Music free?$q$, $q$The core server is free and open source. A premium tier unlocking features like personalized mixes is available through a one-time payment or GitHub sponsorship.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$What platforms can run Swing Music?$q$, $q$Swing Music installs on Linux and Apple Silicon Macs via script, or as a portable binary on Linux, Windows, and Mac, plus Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Does Swing Music detect duplicate tracks?$q$, $q$Yes, it automatically detects duplicates and keeps the higher-bitrate version.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Self-hosted personal streaming$q$, $q$Stream your own music library through a modern, Spotify-like web interface.$q$, $q$Self-hosters wanting a polished local music UI$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Library cleanup and organization$q$, $q$Use collections and duplicate detection to tidy up a large personal music collection.$q$, $q$Music collectors with large local libraries$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Free$q$, $q$Free$q$, $q$N/A$q$, $q$["Self-hosted streaming server","Folder browsing and fuzzy search","Duplicate detection","Collections","Listening statistics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$Pro$q$, NULL, $q$One-time payment or GitHub sponsorship$q$, $q$["Personalized mixes and recommendations","Supports ongoing project development"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Swing Music is a self-hosted music streaming server designed to give it a modern, polished interface comparable to commercial streaming apps while keeping your library fully under your own control. It is open source under AGPLv3 and can be installed via a command-line script on Linux and Apple Silicon Macs, via Docker, or as a portable binary on Linux, Windows, and Mac.$q$, $q$Core features include folder-based browsing, typo-tolerant fuzzy search, automatic duplicate detection that favors higher-bitrate files, and collections for grouping albums and artists. Listening statistics are tracked for all users, while advanced discovery features such as personalized mixes are offered as a premium option supported through a one-time payment or GitHub sponsorship.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Swing Music suits self-hosters who want a visually modern alternative to commercial streaming apps for their own local music files, without giving up ownership of their library.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('12f51e8d-3567-4f17-8ef0-8ba1de67aa06', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ClipBucket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted video and photo sharing platform for building your own YouTube-style website.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ClipBucket is an open-source, self-hosted PHP platform for building your own video and photo sharing website, free for self-hosting.$q$,
  og_description = $q$ClipBucket is an open-source, self-hosted PHP platform for building your own video and photo sharing website, free for self-hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '20d0dcea-e515-425a-9158-96cea2e7f443';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '20d0dcea-e515-425a-9158-96cea2e7f443' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Video & Photo Sharing Platform$q$, $q$Self-hosted PHP application for launching a full video and photo sharing website in minutes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Video Conversion (MP4/HLS)$q$, $q$Automatically converts uploaded video into web-friendly MP4 and HLS formats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$4K & Chromecast Support$q$, $q$Handles 4K video playback and Chromecast-compatible streaming.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Subtitles & Multilingual Audio$q$, $q$Supports video subtitles and multiple audio tracks for international audiences.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Social Features$q$, $q$Includes user groups, playlists, collections, friend requests, and private messaging.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Multi-Server Infrastructure$q$, $q$Can be scaled across multiple servers for larger deployments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Free, self-hosted Community edition with full source access on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Actively maintained (current version 5.5.0) after taking over from the original abandoned project$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Rich social and video features out of the box (playlists, groups, messaging)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Supports modern formats: 4K, HLS conversion, Chromecast$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Requires you to provide and manage your own PHP hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$The original ClipBucket project (pre-2016) was abandoned and archived in December 2022, which can cause confusion with the current Oxygenz-maintained V5$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Managed hosting, priority support, and custom development require the paid SaaS plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Is ClipBucket free?$q$, $q$The self-hosted Community edition is free via GitHub. Oxygenz also sells an optional managed SaaS hosting plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Is ClipBucket still maintained?$q$, $q$Yes. Oxygenz has maintained ClipBucket V5 since 2016, separate from the original ClipBucket project, which was archived in December 2022.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$What does ClipBucket require to run?$q$, $q$It's a PHP-based script that needs your own server or hosting environment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Does ClipBucket support 4K video?$q$, $q$Yes, along with HLS conversion and Chromecast compatibility.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Private/branded video community$q$, $q$Run a self-hosted video-sharing site under your own brand instead of relying on third-party platforms.$q$, $q$Businesses and communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Internal or educational video portal$q$, $q$Host training, lecture, or internal communication videos on infrastructure you control.$q$, $q$Schools and organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$Community (Self-Hosted)$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source code via GitHub","Self-managed hosting","Community support via GitHub issues"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$SaaS (Managed Hosting)$q$, $q$Contact for pricing$q$, $q$subscription$q$, $q$["Managed hosting","Automatic updates","Database backups","Prioritized support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ClipBucket is an open-source PHP script that lets anyone launch their own video and photo sharing website. The current release, ClipBucket V5, is maintained by Oxygenz, which has developed the codebase since 2016 after the original ClipBucket project stalled and was later archived.$q$, $q$The self-hosted Community edition is free to download from GitHub; Oxygenz also offers an optional managed SaaS hosting plan and paid setup/migration services for people who don't want to run their own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ClipBucket suits organizations and communities that want a self-hosted, branded alternative to public video platforms — for internal video portals, niche video communities, or educational content libraries — and are comfortable running a PHP application on their own server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20d0dcea-e515-425a-9158-96cea2e7f443', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Gerbera ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source UPnP/DLNA media server that streams your personal media library to TVs, consoles, and mobile devices.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Gerbera is a free, open-source UPnP/DLNA media server for streaming your music, video, and photo library to TVs and other devices.$q$,
  og_description = $q$Gerbera is a free, open-source UPnP/DLNA media server for streaming your music, video, and photo library to TVs and other devices.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1fd3a23c-84e4-4c6b-bd89-e880123d495c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1fd3a23c-84e4-4c6b-bd89-e880123d495c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$UPnP/DLNA Streaming$q$, $q$Streams media to compatible smart TVs, game consoles, and mobile devices over the local network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Automatic Metadata Extraction$q$, $q$Pulls metadata from music and video files automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$On-the-Fly Transcoding$q$, $q$Optionally converts media formats to match what the client device supports.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$JavaScript Import Scripting$q$, $q$Customize how your library is organized using JavaScript-based import rules.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Web-Based Configuration UI$q$, $q$Manage the server through a browser-based interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Continuation of MediaTomb$q$, $q$Actively maintained fork that carries forward the well-known MediaTomb project.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Completely free and open source (GPLv2)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Actively maintained, unlike the original MediaTomb project it forked from$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Broad device compatibility through standard UPnP/DLNA$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Scriptable metadata and import behavior for advanced customization$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$UPnP/DLNA network setup can be technical for non-technical users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Advanced customization requires editing JavaScript import scripts$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Designed for local network use, with no built-in remote/cloud access$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$What is Gerbera?$q$, $q$A UPnP/DLNA media server for streaming media to compatible devices on your home network.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Is Gerbera free?$q$, $q$Yes, it is free and open source under the GPLv2 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Is Gerbera related to MediaTomb?$q$, $q$Yes, Gerbera continues development from the MediaTomb 0.12.1 codebase, starting in 2016.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Does Gerbera support transcoding?$q$, $q$Yes, it can optionally transcode media on the fly for device compatibility.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Home media streaming$q$, $q$Stream a personal music, video, or photo library to smart TVs and game consoles.$q$, $q$Home users with local media libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$Self-hosted DLNA server$q$, $q$Add DLNA/UPnP streaming to an existing Linux server or NAS.$q$, $q$Self-hosters running Linux$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Gerbera is a free UPnP/DLNA media server that streams music, video, and photos to devices on a home network, including smart TVs, game consoles, and phones. It is a community-driven continuation of the MediaTomb project, built on the MediaTomb 0.12.1 codebase since 2016 and released under the GPLv2 license.$q$, $q$The server includes automatic metadata extraction, optional on-the-fly transcoding, and a JavaScript-based import layer for customizing how media is organized, all managed through a web-based configuration interface.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Gerbera is aimed at home users and self-hosters running Linux who want to serve a local media collection to standards-based DLNA/UPnP clients without relying on a proprietary media server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1fd3a23c-84e4-4c6b-bd89-e880123d495c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Icecast 2 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source streaming media server for internet radio and audio/video broadcasting, maintained by Xiph.Org.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1999,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Icecast is a free, open-source streaming media server for internet radio and audio/video broadcasting, maintained by the Xiph.Org Foundation.$q$,
  og_description = $q$Icecast is a free, open-source streaming media server for internet radio and audio/video broadcasting, maintained by the Xiph.Org Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '160ef825-4aa7-47be-8ed9-f30810cb8ba2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '160ef825-4aa7-47be-8ed9-f30810cb8ba2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Internet Radio & Streaming Server$q$, $q$Serves live audio and video streams in Ogg Vorbis, Opus, WebM, and MP3 formats.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Web-Based Admin Interface$q$, $q$Includes listener statistics, dark mode, and server management through a browser.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$TLS/SSL Support$q$, $q$Supports encrypted connections for both source and listener clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$X-Forwarded-For Support$q$, $q$Correctly logs listener information when running behind a reverse proxy.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Multi-Format Streaming$q$, $q$Handles both audio and video streams for radio, podcasts, and live broadcasts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Long-Standing, Stable Codebase$q$, $q$In active use by radio stations and streaming projects since 1999.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Free and open source under the GPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Lightweight and stable, with a long production track record$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Supports a wide range of audio and video formats$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Compatible with a large ecosystem of source client software (e.g., BUTT, ffmpeg)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$No built-in transcoding — relies on external encoders/source clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Admin interface is functional but basic compared to commercial platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Requires a separate source client to broadcast to the server$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$What is Icecast used for?$q$, $q$Running internet radio stations and streaming live audio or video.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Is Icecast free?$q$, $q$Yes, it is free software licensed under the GPLv2.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Who maintains Icecast?$q$, $q$The Xiph.Org Foundation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Does Icecast support video streaming?$q$, $q$Yes, formats such as WebM and Ogg Theora are supported alongside audio.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Internet radio station$q$, $q$Broadcast a live audio stream to listeners over HTTP.$q$, $q$Broadcasters and hobbyist DJs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$Live event or podcast streaming$q$, $q$Stream live audio or video from an event or show to an online audience.$q$, $q$Podcasters and community stations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Icecast is free server software for streaming multimedia, first released in 1999 as an open alternative to proprietary streaming audio technologies of the time. It is maintained by the Xiph.Org Foundation, the same organization behind formats like Vorbis, Opus, FLAC, and Theora, and is distributed under the GNU GPL version 2.$q$, $q$Icecast 2 supports Ogg Vorbis, Ogg Theora, Opus, WebM, and MP3 streams, and can be used to run internet radio stations, jukeboxes, and other live audio or video streaming services. Recent versions add a web admin interface with dark mode, listener count tracking, TLS support, and X-Forwarded-For proxy handling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Icecast is built for broadcasters, hobbyist DJs, community radio operators, and developers who need a lightweight, standards-based server for distributing live audio or video streams over HTTP.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('160ef825-4aa7-47be-8ed9-f30810cb8ba2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Karaoke Eternal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source self-hosted karaoke party system with a mobile-friendly song browser and queue.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Karaoke Eternal is a free, open-source self-hosted karaoke system letting guests browse and queue songs from their phone's browser.$q$,
  og_description = $q$Karaoke Eternal is a free, open-source self-hosted karaoke system letting guests browse and queue songs from their phone's browser.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Self-Hosted Karaoke Server$q$, $q$Runs entirely on your own hardware and is playable from any browser on the network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Mobile Song Browser$q$, $q$Guests search and queue songs from their own phone's browser.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Multi-Room Support$q$, $q$Runs multiple simultaneous, password-protected rooms with independent queues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$QR Code Join$q$, $q$Guests join a room instantly by scanning a QR code, no app required.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$MP3+G & MP4 Support$q$, $q$Plays MP3+G karaoke tracks and MP4 videos with synced visualizations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$No Ads or Telemetry$q$, $q$The project states it collects no telemetry and shows no ads.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$No app install needed — guests use their phone's browser$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Supports multiple simultaneous password-protected rooms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$No ads or telemetry$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$You must supply your own karaoke media files — no built-in song library$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Self-hosting requires basic server and network setup knowledge$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$No official native mobile apps; browser-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Is Karaoke Eternal free?$q$, $q$Yes, it is fully free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Do guests need to install an app?$q$, $q$No, it runs in any modern mobile browser.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$What file formats does it support?$q$, $q$MP3+G tracks and MP4 video files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Can I run multiple karaoke rooms at once?$q$, $q$Yes, with independent, password-protected queues.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Home karaoke party$q$, $q$Let guests queue their own songs from their phones during a home party.$q$, $q$Individuals hosting social gatherings$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$Small venue karaoke night$q$, $q$Run a self-hosted queue system instead of a proprietary karaoke machine.$q$, $q$Small venue operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Karaoke Eternal is a self-hosted, open-source karaoke system built for parties. It runs a server on your own hardware and lets guests find and queue songs directly from their phone's browser, with no app install required.$q$, $q$It supports MP3+G files and MP4 videos with music-synced visualizations, offers QR-code joining, and can run multiple simultaneous password-protected rooms with independent queues. The project states it includes no ads or telemetry.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Karaoke Eternal is aimed at people hosting karaoke parties at home or in small venues who already own karaoke media files and want a self-hosted, browser-based queue system instead of proprietary karaoke machines or apps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5ca6b722-6cdd-44cd-92f0-a9b94dd0cb9d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Kodi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source media center software for playing and organizing video, music, and photos across many platforms.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kodi is a free, open-source media center for playing and organizing video, music, and photos on Windows, macOS, Linux, Android, and iOS.$q$,
  og_description = $q$Kodi is a free, open-source media center for playing and organizing video, music, and photos on Windows, macOS, Linux, Android, and iOS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f15ae2d8-b82f-4e7b-b033-07c65a5c2617';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f15ae2d8-b82f-4e7b-b033-07c65a5c2617' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Cross-Platform Media Center$q$, $q$Available for Windows, macOS, Linux, Android, iOS, and tvOS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Local & Network Playback$q$, $q$Plays video, music, and photo files from local storage or network shares.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Live TV & DVR Integration$q$, $q$Connects to backends like Tvheadend, MythTV, and NextPVR for live TV and recording.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Skinning Engine$q$, $q$Fully customizable interface themes via user-created skins.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Add-on Ecosystem$q$, $q$Extend functionality with community add-ons for streaming, weather, and more.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Game Emulator Support$q$, $q$Play games through emulators with controller support.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Completely free and open source (GPLv2)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Available on nearly every major platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Large, mature add-on and skin ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Over two decades of active development and community support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Initial setup and configuration can be complex for first-time users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Third-party add-on quality varies and some can carry legal streaming risks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Live TV/DVR functionality requires separate backend software$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Is Kodi free?$q$, $q$Yes, Kodi is completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Who develops Kodi?$q$, $q$The XBMC Foundation, a non-profit run by volunteer developers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$What platforms does Kodi support?$q$, $q$Windows, macOS, Linux, Android, iOS, and tvOS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Does Kodi include streaming content itself?$q$, $q$No, Kodi is a media player and organizer; content comes from your own files or third-party add-ons.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Home theater PC (HTPC)$q$, $q$Turn a PC or set-top device into a full media center for TV playback.$q$, $q$Home users with local media libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$Centralized media hub$q$, $q$Consolidate video, music, and photo collections into one interface across devices.$q$, $q$Cord-cutters and media hobbyists$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kodi is a free and open-source home theater/media center application originally created in 2003 as XBMC and renamed Kodi in 2014. It is developed by the non-profit XBMC Foundation and a global community of volunteer contributors, and is released under the GPLv2 license.$q$, $q$Kodi plays and organizes local and network video, music, and photo files, and can be extended with skins and add-ons for streaming services, live TV/DVR backends, weather, and remote control. It's available for Windows, macOS, Linux, Android, iOS, and tvOS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Kodi suits home theater PC (HTPC) enthusiasts, cord-cutters, and anyone wanting a single, customizable hub for a personal video, music, and photo library across desktop, mobile, and TV devices.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f15ae2d8-b82f-4e7b-b033-07c65a5c2617', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── MediaMTX ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted media server and proxy for routing RTSP, RTMP, HLS, WebRTC, and SRT streams.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MediaMTX is a free, open-source media server and proxy for routing RTSP, RTMP, HLS, WebRTC, and SRT video streams.$q$,
  og_description = $q$MediaMTX is a free, open-source media server and proxy for routing RTSP, RTMP, HLS, WebRTC, and SRT video streams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Multi-Protocol Streaming$q$, $q$Supports RTSP, RTMP, HLS, WebRTC, and SRT for publishing and reading streams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Publish, Read, Proxy & Forward$q$, $q$Flexible live-stream routing between sources, clients, and other servers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Stream Recording$q$, $q$Records incoming streams to disk in common formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$REST API$q$, $q$Manage streams and server configuration programmatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Single-Binary Deployment$q$, $q$Ships as one self-contained binary with no external dependencies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Active Open-Source Development$q$, $q$Frequent releases and a large GitHub community.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Supports nearly every major live-streaming protocol$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Simple single-binary deployment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Actively maintained with frequent releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$No built-in graphical admin UI — configuration is file/API-based$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Best suited to technical users familiar with streaming protocols$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$No official managed/hosted service$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$What is MediaMTX used for?$q$, $q$Routing and serving live video/audio streams across protocols like RTSP, RTMP, HLS, WebRTC, and SRT.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Is MediaMTX free?$q$, $q$Yes, it is open source and free to self-host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Does MediaMTX support recording?$q$, $q$Yes, it can record incoming streams to disk.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Can MediaMTX be controlled programmatically?$q$, $q$Yes, via its REST API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$IP camera/NVR stream routing$q$, $q$Convert and route camera streams between protocols for different clients.$q$, $q$Security and surveillance integrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$Custom live-streaming pipelines$q$, $q$Build applications that publish, proxy, or record live streams.$q$, $q$Developers building streaming apps$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MediaMTX is a ready-to-use, open-source live media router that acts as both a server and a proxy. It handles publishing, reading, proxying, forwarding, recording, and playback of real-time video and audio streams across RTSP, RTMP, HLS, WebRTC, and SRT.$q$, $q$The project ships as a single self-contained binary with no external dependencies, is hosted on GitHub with a large community (20K+ stars), and is free to self-host with no licensing cost.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MediaMTX is aimed at developers, security/surveillance integrators, and technical self-hosters who need to route live camera or streaming sources between different protocols without a graphical setup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ddba0123-4cc5-4ad5-bf20-fbd6b10fd50c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── MistServer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Streaming media server toolkit with a free open-source edition and commercially licensed editions for OTT delivery.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2009,
  company_size = NULL,
  headquarters = $q$Netherlands$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MistServer is a streaming media toolkit with a free open-source edition (AGPLv3) and commercial licensing for OTT video delivery.$q$,
  og_description = $q$MistServer is a streaming media toolkit with a free open-source edition (AGPLv3) and commercial licensing for OTT video delivery.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f4959893-76cd-46a8-ac09-5ec52854907c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f4959893-76cd-46a8-ac09-5ec52854907c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Multi-Protocol Streaming$q$, $q$Supports WebRTC, WHIP, SRT, RIST, HLS, and other modern streaming protocols.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Open-Source Edition$q$, $q$Free, self-hostable edition licensed under AGPLv3.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Access Control$q$, $q$Restrict who can publish or view streams.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Analytics Integration$q$, $q$Connects with analytics tooling for stream monitoring.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Reverse Proxy Support$q$, $q$Supports flexible network topologies for deployment behind proxies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Commercial Licensing$q$, $q$Paid licenses available for proprietary use and vendor support.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Genuinely free, self-hostable open-source edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Supports a very wide range of modern streaming protocols$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Backed by an established streaming technology company with commercial support options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Actively developed with regular releases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Full feature set and vendor support require a commercial license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$AGPLv3 requires sharing source code of modifications used in networked services$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Smaller community than some general-purpose streaming servers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Is MistServer free?$q$, $q$The open-source edition is free under AGPLv3; commercial editions and licenses are paid.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Who makes MistServer?$q$, $q$DDVTech B.V., a Dutch streaming technology company founded in 2009.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$What protocols does MistServer support?$q$, $q$WebRTC, WHIP, SRT, RIST, HLS, and others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Can I use MistServer commercially without open-sourcing my code?$q$, $q$Yes, by purchasing a commercial license.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Self-hosted OTT streaming infrastructure$q$, $q$Run your own live-streaming delivery stack across multiple protocols.$q$, $q$Developers and system integrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Enterprise streaming platform$q$, $q$Deploy MistServer with a commercial license for vendor-backed support.$q$, $q$Media companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Open Source Edition$q$, $q$Free$q$, $q$N/A$q$, $q$["AGPLv3-licensed source code","Self-hosted deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$Commercial License$q$, $q$Contact for pricing$q$, $q$license/subscription$q$, $q$["Proprietary use rights","Vendor support","Additional protocol and analytics features"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$MistServer is a full-featured streaming media toolkit for OTT (over-the-top internet streaming), originally developed by the Dutch company DDVTech B.V. (founded 2009). It supports a wide range of modern streaming protocols, including WebRTC, WHIP, SRT, RIST, and HLS.$q$, $q$MistServer offers a free, self-hostable open-source edition licensed under AGPLv3, alongside commercially licensed editions for organizations that need proprietary usage rights, additional features, or vendor support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$MistServer targets developers, system integrators, and media companies building OTT streaming infrastructure who need broad protocol support and the option to scale into a commercially supported deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f4959893-76cd-46a8-ac09-5ec52854907c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── NymphCast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source audio/video casting system that turns a Raspberry Pi or Linux device into a Chromecast-style receiver.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$NymphCast is an open-source audio/video casting system that turns a Raspberry Pi or Linux device into a Chromecast-style receiver.$q$,
  og_description = $q$NymphCast is an open-source audio/video casting system that turns a Raspberry Pi or Linux device into a Chromecast-style receiver.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bd17012-c4b3-4edc-a6fb-45ecafd92bb2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bd17012-c4b3-4edc-a6fb-45ecafd92bb2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Audio/Video Casting$q$, $q$Cast audio and video from phone or PC clients to a NymphCast receiver.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Runs on Raspberry Pi & Linux$q$, $q$Turns low-cost, Linux-capable hardware into a streaming receiver.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Custom App Support$q$, $q$NymphCast Apps extend what the receiver can do beyond basic casting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Fully Open Hardware & Software$q$, $q$Both the client and receiver software are open source.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Cross-Client Control$q$, $q$NymphCast Player apps let you browse and cast from phone or PC.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Fully open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Runs on affordable hardware like Raspberry Pi$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Actively developed with regular releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Open alternative to proprietary casting ecosystems$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Project has remained in alpha status for an extended period$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Some features, such as SmartTV support and NymphCast Apps, are only partially complete$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Requires DIY hardware setup and technical comfort$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Is NymphCast ready for everyday use?$q$, $q$It's still in alpha; the stable release is v0.1, with v0.2 in active development.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$What hardware does NymphCast run on?$q$, $q$Raspberry Pi and other Linux-capable devices.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Is NymphCast free?$q$, $q$Yes, it is fully open source.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$How do I cast to a NymphCast receiver?$q$, $q$Using NymphCast client/player apps for phone or PC.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$DIY casting receiver$q$, $q$Build a Chromecast-style receiver on a Raspberry Pi.$q$, $q$Hobbyists and Raspberry Pi users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$Open-source home casting$q$, $q$Cast media at home without a proprietary streaming device.$q$, $q$Privacy-conscious self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$NymphCast is an open-source audio and video casting system that turns a Raspberry Pi or other Linux-capable device into a receiver similar to Chromecast, controlled from a phone or PC client. It also supports custom NymphCast Apps that extend receiver functionality.$q$, $q$The project remains under active development but has stayed in alpha status for an extended period; the stable release is v0.1, with v0.2 and features like SmartTV support still being built out.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$NymphCast is aimed at hobbyists and privacy-conscious self-hosters who want an open, DIY casting receiver built on inexpensive hardware instead of a proprietary streaming device.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bd17012-c4b3-4edc-a6fb-45ecafd92bb2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Rygel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source UPnP/DLNA media server and renderer built for the GNOME desktop.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Rygel is a free, open-source UPnP/DLNA media server and renderer built for the GNOME desktop and Linux home networks.$q$,
  og_description = $q$Rygel is a free, open-source UPnP/DLNA media server and renderer built for the GNOME desktop and Linux home networks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1269899d-d0a4-4fea-afe2-1530e36e1f6f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1269899d-d0a4-4fea-afe2-1530e36e1f6f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$UPnP MediaServer & MediaRenderer$q$, $q$Combines both server and renderer roles in one plugin-based application.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Home Network Media Sharing$q$, $q$Shares audio, video, and pictures with other devices on the network.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$On-the-Fly Transcoding$q$, $q$Converts media formats for compatibility with the requesting device.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$DLNA Speaker Redirection$q$, $q$Redirects audio playback to DLNA-compatible speakers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Developer Libraries$q$, $q$librygel-core, librygel-server, and librygel-renderer for building custom UPnP apps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$GStreamer Integration$q$, $q$Uses GStreamer for media handling and playback.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Free and open source (LGPL-2.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Tightly integrated with the GNOME desktop$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Works as both a media server and a media renderer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Available in most Linux distribution repositories$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Primarily targets Linux/GNOME rather than Windows or macOS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$UPnP/DLNA setup can require additional network configuration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Documentation is developer-oriented rather than beginner-friendly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Is Rygel free?$q$, $q$Yes, it is free and open source under the LGPL-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$What is Rygel used for?$q$, $q$Sharing and streaming media over a home network via UPnP/DLNA.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Does Rygel work outside of GNOME?$q$, $q$It's built for GNOME but can run on other Linux desktops with the required libraries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Can Rygel act as a media renderer, not just a server?$q$, $q$Yes, it supports both MediaServer and MediaRenderer roles.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Home media sharing$q$, $q$Share a Linux PC's media library with smart TVs and DLNA devices.$q$, $q$Linux/GNOME desktop users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$Custom UPnP/DLNA app development$q$, $q$Build custom media server or renderer applications using Rygel's libraries.$q$, $q$Linux developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Rygel is a home media solution that implements both a UPnP AV MediaServer and MediaRenderer, letting you share audio, video, and pictures across a home network and control playback on other devices. It is part of the GNOME project, written largely in Vala, and released under the LGPL-2.0 license.$q$, $q$Through its plug-in architecture, Rygel can stream media from a PC to TVs, game consoles, and DLNA speakers, with optional on-the-fly transcoding for device compatibility. It also provides developer libraries (librygel-core, librygel-server, librygel-renderer) for building custom UPnP/DLNA applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Rygel is built for Linux and GNOME desktop users who want to share a local media library over UPnP/DLNA, and for developers building custom UPnP/DLNA server or renderer applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1269899d-d0a4-4fea-afe2-1530e36e1f6f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Stash ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source self-hosted app for organizing and browsing a personal adult video and image library.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Stash is a free, open-source self-hosted application for organizing and browsing a personal adult video and image library.$q$,
  og_description = $q$Stash is a free, open-source self-hosted application for organizing and browsing a personal adult video and image library.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7fcb3565-0b7e-4173-967c-63ee940c83a4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7fcb3565-0b7e-4173-967c-63ee940c83a4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Private Media Library Organizer$q$, $q$Organizes a personal video and image collection on your own network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Tagging, Rating & Markers$q$, $q$Rate and tag scenes and images by performer, studio, movie, or custom tag; bookmark specific moments with markers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Metadata Scraping$q$, $q$Pulls metadata from filenames or community-curated scrapers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Gallery Support$q$, $q$Builds galleries from folders or zip files of images.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Cross-Device Streaming$q$, $q$Stream your library to a browser on PC, tablet, or phone.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Password Protection$q$, $q$Optional password protection for added privacy.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Free and open source under the AGPL license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Runs entirely on your own network with no data sent externally$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Flexible tagging and metadata system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Active volunteer development community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$You must supply your own media — no content is included$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Scraper and metadata configuration can be technical to set up$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Narrow focus limits it to a specific content type$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Is Stash free?$q$, $q$Yes, it is free and open source under the AGPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Does Stash host or provide any content?$q$, $q$No, it only organizes media you already own.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Can I password-protect my Stash instance?$q$, $q$Yes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$What platforms can I view Stash on?$q$, $q$Any modern web browser on PC, tablet, or phone.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Personal media library organization$q$, $q$Tag, rate, and browse an existing personal media collection.$q$, $q$Individuals with existing local media libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$Private self-hosted alternative to cloud organizers$q$, $q$Keep a personal collection off cloud services entirely.$q$, $q$Privacy-focused self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Stash is a free, self-hosted application for organizing and viewing a personal collection of adult video and image files. It is developed by volunteers and released under the AGPL license, with the project describing it as running entirely on your own network with no content sent to external services.$q$, $q$Stash supports rating, tagging, and marking scenes and images, building galleries from folders or zip files, and pulling metadata either from filenames or community-curated scrapers. It streams to any modern browser on PC, tablet, or phone and can be password-protected.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Stash is aimed at individuals who already have a personal media collection and want a private, self-hosted way to organize, tag, and browse it without relying on cloud services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7fcb3565-0b7e-4173-967c-63ee940c83a4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── üWave ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted platform where a group takes turns queuing and playing music or video together in real time.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$üWave is an open-source, self-hosted platform for groups to queue and listen to music or video together in real time.$q$,
  og_description = $q$üWave is an open-source, self-hosted platform for groups to queue and listen to music or video together in real time.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Turn-based queue$q$, $q$A waitlist system lets each participant take a turn choosing what plays next.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Source plugins$q$, $q$Officially supports pulling media from YouTube and SoundCloud, with a plugin system for adding more sources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Live chat$q$, $q$Built-in chat runs alongside playback so the group can talk while listening.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Self-hosted core server$q$, $q$The core library exposes a REST/WebSocket API that the web client and third-party bots can use.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Web-based client$q$, $q$A React-based web client provides the room, queue, and chat interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Extensible plugin architecture$q$, $q$Developers can write custom source plugins beyond the officially supported ones.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Full control over hosting and data since it's entirely self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Supports multiple content sources via plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Extensible architecture for developers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Active GitHub organization with separate core/web/hub repos$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Requires self-hosting know-how (Node.js/MongoDB stack)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$No official managed or paid hosting option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Documentation is aimed at developers, not end users$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$UI is functional rather than polished compared to commercial listening apps$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Is üWave free?$q$, $q$Yes, üWave is open source under the MIT license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Do I need to host üWave myself?$q$, $q$Yes. üWave is self-hosted software with no official managed SaaS version, though independent public instances sometimes exist.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$What content sources does üWave support?$q$, $q$Officially YouTube and SoundCloud via source plugins, with support for adding custom plugins.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$What tech stack powers üWave?$q$, $q$The core server and web client are built with Node.js and React; the source is on GitHub under the u-wave organization.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Community listening rooms$q$, $q$Groups queue up music or videos and take turns playing them in a shared room.$q$, $q$online communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Internet radio-style collectives$q$, $q$Friends or fan communities run a persistent shared queue as an informal internet radio station.$q$, $q$hobbyist communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$üWave is an open-source, self-hosted platform for listening to media together as a group. Participants join a shared room and take turns adding songs, talks, or videos to a queue (the 'waitlist'), pulling content from source plugins for services like YouTube and SoundCloud.$q$, $q$The project is built as a Node.js/React stack, with the core server and web client published under the u-wave GitHub organization. There is no official managed SaaS version — running üWave means deploying your own server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Communities, friend groups, and internet-radio-style collectives who want a shared, turn-based listening room they fully control, rather than relying on a third-party service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Restreamer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source streaming server that restreams live video from your own cameras or encoders to your site and platforms.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Restreamer is a free, open-source, self-hosted server for restreaming live video from your own cameras or encoders to your website and platforms.$q$,
  og_description = $q$Restreamer is a free, open-source, self-hosted server for restreaming live video from your own cameras or encoders to your website and platforms.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f3b942d1-643e-4d8c-b830-41cfe23c130e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f3b942d1-643e-4d8c-b830-41cfe23c130e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Multi-destination restreaming$q$, $q$Push one source feed to YouTube, Twitch, Facebook, Vimeo, or any RTMP destination at the same time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$HLS output with HTML5 player$q$, $q$Serves an H.264/HLS stream with a built-in HTML5 video player for embedding on your own site.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Broad input support$q$, $q$Accepts IP cameras, USB cameras, RaspiCam, and H.264 hardware encoders as sources.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Browser-based configuration$q$, $q$A password-protected web UI handles setup without needing the command line for daily use.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Audio transcoding$q$, $q$Converts audio to AAC or MP3 as needed for output compatibility.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Scheduled snapshots$q$, $q$Captures still-frame snapshots from the stream at configurable intervals.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$JSON HTTP API$q$, $q$Exposes an API for automating configuration and stream management.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Runs almost anywhere$q$, $q$Deploys via Docker on Linux, Windows, macOS, Raspberry Pi, and other ARM devices.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Completely free and open source (Apache 2.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$No per-stream or bandwidth fees since it's self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Simulcasts to multiple platforms simultaneously$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Lightweight enough to run on a Raspberry Pi$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Browser-based setup with no command-line required day to day$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Requires Docker and basic server/networking knowledge to deploy$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$You're responsible for your own uptime, bandwidth, and updates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Limited to H.264 input sources$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Smaller ecosystem and support base than commercial streaming platforms$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Is Restreamer really free?$q$, $q$Yes, it's open source under the Apache 2.0 license with no license fees; you only pay for the server and bandwidth you use to host it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$What platforms can Restreamer send my stream to?$q$, $q$It can simultaneously restream to your own website plus destinations like YouTube, Twitch, Facebook, Vimeo, or any generic RTMP server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Do I need special hardware?$q$, $q$No — it accepts input from IP cameras, USB webcams, RaspiCam, or any H.264 encoder, and runs on Docker-capable hardware including Raspberry Pi.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Does Restreamer have an API?$q$, $q$Yes, it exposes a JSON HTTP API for automating configuration and stream management.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Live camera restreaming$q$, $q$Take an IP camera feed and publish it as HLS on your own website without a third-party provider.$q$, $q$operators and hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$Multi-platform live simulcasting$q$, $q$Push one source feed to YouTube, Twitch, and Facebook at once without a paid multistreaming SaaS.$q$, $q$streamers and event producers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Restreamer, built by datarhei, is a free, Apache-2.0-licensed Docker application for turning an H.264 video source — an IP camera, USB webcam, RaspiCam, or hardware encoder — into an HLS stream you can embed on your own website. It can simultaneously push the same feed to platforms like YouTube, Twitch, Facebook, or Vimeo, or to any generic RTMP server.$q$, $q$Because it runs entirely on your own Docker-capable infrastructure, there's no dependency on a third-party streaming provider or recurring subscription fee.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Broadcasters, security/CCTV operators, hobbyist streamers, and event producers who want to simulcast a live feed to multiple platforms without paying for a commercial multistreaming service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3b942d1-643e-4d8c-b830-41cfe23c130e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Tube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source YouTube-style video sharing app written in Go with automatic transcoding.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tube is a free, open-source, self-hosted video-sharing app written in Go with automatic transcoding, thumbnails, and RSS feeds and no database required.$q$,
  og_description = $q$Tube is a free, open-source, self-hosted video-sharing app written in Go with automatic transcoding, thumbnails, and RSS feeds and no database required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4e301513-c3b6-4e23-8121-6625186cf446';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4e301513-c3b6-4e23-8121-6625186cf446' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Automatic transcoding$q$, $q$Uploads are automatically transcoded to MP4 H.264/AAC via a built-in FFmpeg pipeline.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Automatic thumbnails$q$, $q$Thumbnail images are generated automatically for uploaded videos.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$No database required$q$, $q$Video metadata is derived directly from the filesystem instead of a database.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Multiple collections$q$, $q$Videos can be organized into separate collections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$RSS feeds$q$, $q$Each collection can generate an RSS feed for followers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Minimal-JS interface$q$, $q$A mostly-HTML UI with graceful upload degradation keeps the client lightweight.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Optional upload password$q$, $q$The /upload endpoint can be protected with a password via an environment variable.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Very lightweight — no external database to manage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Simple deployment via Docker image or Go binary$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Open source under the MIT license$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Actively maintained by its author$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$RSS feeds make collections easy to follow$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Small, single-maintainer project rather than a large community platform$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Fewer features than full video platforms (no built-in comments or subscriptions)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Sparse official releases (only a couple of tagged versions)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Hosted primarily on the author's own Gitea instance rather than GitHub$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Is Tube free to use?$q$, $q$Yes, it's open source under the MIT license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Does Tube require a database?$q$, $q$No — it reads video metadata directly from the filesystem, which simplifies deployment.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$How do I deploy Tube?$q$, $q$Via Docker (a prologic/tube image is published) or by building the Go binary from source.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Can I restrict who uploads videos?$q$, $q$Yes, the /upload endpoint can be protected with a password set via an environment variable.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Personal video hosting$q$, $q$Host and share personal or family videos outside of YouTube.$q$, $q$individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$Community video archives$q$, $q$Small open-source projects or communities publish videos with RSS syndication.$q$, $q$open-source communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Tube is a lightweight, self-hosted video-sharing application written in Go by developer James Mills (prologic), maintained on his self-hosted Git instance at git.mills.io. It bills itself as a minimal YouTube-style alternative you run yourself, with a built-in FFmpeg-based pipeline that automatically transcodes uploads to MP4 (H.264/AAC) and generates thumbnails.$q$, $q$Unlike most video platforms, Tube needs no external database — video metadata is read directly from files on disk — which keeps deployment simple.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individuals or small communities who want a no-frills, self-hosted place to publish videos without relying on YouTube or maintaining a database-heavy platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4e301513-c3b6-4e23-8121-6625186cf446', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── VideoLAN Client (VLC) ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, cross-platform media player that plays virtually any video or audio file with no extra codec packs.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$VLC is a free, open-source, cross-platform media player from VideoLAN that plays nearly any video or audio format with no codec packs or tracking.$q$,
  og_description = $q$VLC is a free, open-source, cross-platform media player from VideoLAN that plays nearly any video or audio format with no codec packs or tracking.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'afaa3312-5d01-48a5-af22-141fd2ad264f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'afaa3312-5d01-48a5-af22-141fd2ad264f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Broad format support$q$, $q$Plays most codecs — MPEG-2, MPEG-4, H.264, MKV, WebM, WMV, MP3, and more — with no codec packs needed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Plays discs, devices, and streams$q$, $q$Handles DVDs, CDs, VCDs, webcams, capture devices, and network streaming protocols.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Cross-platform$q$, $q$Available for Windows, macOS, Linux and other Unix-like systems, Android, and iOS.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Skinnable interface$q$, $q$Supports custom skins via a skin editor plus a library of extensions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$No ads or tracking$q$, $q$The player ships with no ads, spyware, or user tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Actively maintained$q$, $q$Receives regular updates, with the 3.0.x branch still shipping security and bug-fix releases.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Completely free with no ads or tracking$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Extremely broad format and codec support out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Available on nearly every major desktop and mobile platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Open source and community-driven$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Lightweight installer and low resource use$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Interface feels dated compared to some modern media players$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Advanced features like skins and extensions require manual setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Built for single-user playback, not team or enterprise media management$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Is VLC really free?$q$, $q$Yes, VLC is completely free, open source, and has no ads, spyware, or tracking.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$What platforms does VLC run on?$q$, $q$Windows, macOS, Linux and other Unix-like systems, Android, iOS, and more.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Do I need to install codec packs for VLC?$q$, $q$No, VLC bundles support for most codecs (MPEG-2, MPEG-4, H.264, MKV, WebM, WMV, MP3, and more) out of the box.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Who develops VLC?$q$, $q$VLC is developed by VideoLAN, a non-profit organization, and its source code is released under open-source licenses.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$Everyday media playback$q$, $q$Play nearly any downloaded or streamed video/audio file on desktop or mobile.$q$, $q$general users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$IT and education deployments$q$, $q$Provide a free, license-cost-free player for varied media formats across school or office devices.$q$, $q$IT admins and schools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$VLC media player, developed by the non-profit VideoLAN project, is one of the most widely used free and open-source multimedia players. It plays most multimedia files, discs, webcams, devices, and network streams without needing separate codec packs, and runs on desktop and mobile platforms alike.$q$, $q$The project describes itself as completely free of ads, spyware, and user tracking, and its code is released under open-source licenses that vary by component.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Anyone who needs a free, reliable player that plays almost any file format across Windows, macOS, Linux, Android, and iOS — from casual users to IT departments avoiding codec-pack licensing headaches.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afaa3312-5d01-48a5-af22-141fd2ad264f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;

-- ── Anchr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted toolbox for bookmark collections, encrypted image uploads, and link shortening.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Anchr is a free, open-source, self-hosted toolbox combining bookmark collections, encrypted image uploads, and link shortening.$q$,
  og_description = $q$Anchr is a free, open-source, self-hosted toolbox combining bookmark collections, encrypted image uploads, and link shortening.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a8479085-b069-4122-84f4-d7d97ae020d3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a8479085-b069-4122-84f4-d7d97ae020d3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Bookmark collections$q$, $q$Save links with descriptions and organize them into categorized collections for easier searching.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Encrypted image uploads$q$, $q$Upload one or more photos with optional client-side password encryption so no one else can view them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Link shortening$q$, $q$Generate short links for any URL.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Browser extension$q$, $q$A Chrome extension lets users save or shorten links directly from the page they're viewing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Self-hostable$q$, $q$Deploy your own instance from the open-source muety/anchr repository, backed by MongoDB.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Notification integrations$q$, $q$Supports email/SMTP and Telegram notification configuration.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Combines bookmarks, image hosting, and link shortening in one app$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Genuine client-side image encryption option for privacy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Free and open source$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Lightweight, fast interface$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Requires self-hosting and MongoDB setup for full control$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Smaller project with less frequent updates than larger bookmark managers like Linkding or Linkwarden$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Limited official documentation beyond the GitHub repository$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Is Anchr free?$q$, $q$Yes, Anchr is open source and free to self-host; the code is available on GitHub under muety/anchr.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Can I use Anchr without self-hosting it?$q$, $q$The official anchr.io instance is publicly accessible, though the project is primarily designed to be self-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Does Anchr encrypt uploaded images?$q$, $q$Yes, it offers client-side password encryption so images are unreadable to anyone without the password.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$What database does Anchr use?$q$, $q$Anchr is backed by MongoDB.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Self-hosted bookmark sync$q$, $q$Keep a bookmark collection accessible from any device without relying on browser sync.$q$, $q$individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$Private image sharing$q$, $q$Share photos with password-based client-side encryption instead of a third-party image host.$q$, $q$privacy-focused users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anchr, created by developer Ferdinand Mütsch (GitHub: muety), is an open-source 'toolbox for tiny tasks on the internet' that combines a bookmark manager, an image hosting service, and a link shortener in one self-hosted app. Bookmarks can be organized into collections with descriptions to make them easier to search.$q$, $q$The image upload feature supports client-side encryption, so uploaded photos are unreadable to anyone without the chosen password — a feature the project highlights as a privacy differentiator from typical image hosts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Privacy-conscious individuals who want to self-host their bookmarks, image sharing, and short links instead of relying on separate third-party services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8479085-b069-4122-84f4-d7d97ae020d3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Anubis ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted proof-of-work reverse proxy that blocks AI scraper bots before they reach your site.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2025,
  company_size = NULL,
  headquarters = $q$Canada$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Anubis is a free, open-source, self-hosted proof-of-work reverse proxy that blocks AI scraper bots while letting real visitors and search engines through.$q$,
  og_description = $q$Anubis is a free, open-source, self-hosted proof-of-work reverse proxy that blocks AI scraper bots while letting real visitors and search engines through.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Proof-of-work challenge$q$, $q$Unrecognized visitors must solve a SHA-256 puzzle before being granted access to the site.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Known-bot allowlist$q$, $q$Configurable allowlist recognizes crawlers like Google, Bing, and DuckDuckGo via user-agent and reverse-DNS verification.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Persistent auth cookie$q$, $q$Verified visitors get a cookie so they aren't re-challenged for roughly a week.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Reverse-proxy deployment$q$, $q$Runs as a lightweight proxy in front of any existing origin server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Open-source core$q$, $q$MIT-licensed and self-hostable via Docker or standalone binaries.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Optional reputation add-on$q$, $q$A paid service called Thoth adds GeoIP and BGP ASN-based reputation filtering on top of the free core.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Free and open source at its core$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Effective, low-friction deterrent against high-volume scraping$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Simple reverse-proxy deployment in front of existing infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Widely adopted by well-known open-source infrastructure projects$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Actively maintained$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Adds a JavaScript challenge step that can affect users with JS disabled or certain accessibility tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Advanced GeoIP/reputation filtering requires the paid Thoth add-on$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Requires running and maintaining an additional proxy component$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$May occasionally challenge legitimate bots not on the allowlist$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Is Anubis free?$q$, $q$Yes, the core Anubis proxy is open source under the MIT license and free to self-host; an optional paid add-on called Thoth adds GeoIP/ASN reputation filtering.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$How does Anubis stop AI crawlers?$q$, $q$It makes each visitor's browser solve a small proof-of-work puzzle, which is trivial for occasional human visitors but computationally expensive at the scale AI scrapers operate.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Does Anubis block search engines like Google?$q$, $q$No, it includes a configurable allowlist for known-good crawlers such as Google, Bing, and DuckDuckGo, verified by user-agent and reverse DNS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Who maintains Anubis?$q$, $q$It was created by developer Xe Iaso and is maintained by their company, Techaro.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Protecting self-hosted forges$q$, $q$Shield self-hosted Git or wiki instances from bandwidth-draining AI scraper traffic.$q$, $q$open-source infrastructure maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$General site protection$q$, $q$Shield any origin server from aggressive LLM-training crawlers without paying for a commercial bot-management service.$q$, $q$website operators and sysadmins$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Anubis (core)$q$, $q$Free$q$, NULL, $q$["Open-source proof-of-work reverse proxy","MIT license","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Thoth add-on$q$, NULL, NULL, $q$["GeoIP and BGP ASN-based reputation filtering","Paid add-on to the free Anubis core"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anubis is an open-source, MIT-licensed reverse proxy created by developer Xe Iaso and now maintained by their company, Techaro. It sits in front of a website and requires each visitor's browser to solve a small SHA-256 proof-of-work challenge before serving a page. Legitimate human visitors barely notice the brief delay, while high-volume AI scrapers that ignore robots.txt face a steep, deliberately expensive computational cost for every page crawled.$q$, $q$The project was built after an AI crawler overwhelmed the author's own self-hosted Git server, and has since been adopted by projects including GNOME GitLab, the Linux kernel mailing list archive, FFmpeg, and Wine.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Open-source projects, self-hosted Git/forge instances, and any website operator being hit by aggressive AI/LLM training crawlers who want a free, self-hosted alternative to commercial bot-mitigation services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── asciinema ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source terminal session recorder with a free hosted platform and a self-hostable server for saving recordings.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$asciinema is a free, open-source tool for recording and sharing terminal sessions as lightweight text recordings, with a self-hostable server option.$q$,
  og_description = $q$asciinema is a free, open-source tool for recording and sharing terminal sessions as lightweight text recordings, with a self-hostable server option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a871d31-fa92-435d-8be7-8639d7f2476f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a871d31-fa92-435d-8be7-8639d7f2476f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$One-command recording$q$, $q$Start recording a terminal session with a single `asciinema rec` command.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Text-based recording format$q$, $q$Recordings are saved as a small .cast text format rather than video, keeping file sizes tiny.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Free public hosting$q$, $q$asciinema.org offers free hosting and sharing for recordings out of the box.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Self-hostable server$q$, $q$The open-source asciinema-server can be deployed independently for private, self-hosted recording archives.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Embeddable player$q$, $q$Recordings can be embedded in blogs, documentation sites, and presentations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Live streaming$q$, $q$Supports streaming a live terminal session in addition to recording and replay.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Completely free and open source, both CLI and server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Recordings are tiny, text-based files instead of video$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Viewers can select and copy text directly out of a recording$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Fully self-hostable for teams that want data privacy$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Simple one-command recording workflow$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Only records terminal/text output, not GUI applications$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Self-hosting the server requires Elixir/Phoenix and PostgreSQL setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Playback styling is limited compared to full screen-recording tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Is asciinema free?$q$, $q$Yes, both the CLI recorder and the asciinema.org hosting platform are free, and the underlying software is open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Can I self-host asciinema instead of using asciinema.org?$q$, $q$Yes, the open-source asciinema-server project can be deployed via Docker Compose with PostgreSQL, and the CLI can be pointed at your own server via the ASCIINEMA_SERVER_URL variable.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$What format are asciinema recordings in?$q$, $q$Recordings are saved as a text-based .cast format rather than video, keeping file sizes small and allowing text to be selected and copied during playback.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Can I embed asciinema recordings elsewhere?$q$, $q$Yes, recordings can be embedded in blogs, documentation sites, and presentations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$CLI tutorials and docs$q$, $q$Record terminal walkthroughs and embed them directly in documentation sites.$q$, $q$developers and technical writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Private team recording archive$q$, $q$Self-host a team's internal terminal-recording server for sensitive workflows.$q$, $q$engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$asciinema is a free and open-source tool for recording terminal sessions as lightweight, text-based recordings — rather than video — and sharing them on the web. The command-line recorder captures a session with a single `asciinema rec` command, and recordings can be played back, embedded in blogs or docs, or streamed live.$q$, $q$The companion asciinema-server, built with Elixir and Phoenix, powers the free public asciinema.org platform and can also be self-hosted, giving teams full control over where their recordings are stored.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers, sysadmins, and technical writers who want to record and share terminal demos, tutorials, or CLI documentation without recording actual screen video.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cloudlog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted amateur radio logging app for tracking QSOs, awards, and CAT-controlled radio contacts.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted); hosted plans from £4/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Cloudlog is a free, open-source, self-hosted amateur radio logging app with CAT control, WSJT-X sync, and Logbook of the World integration.$q$,
  og_description = $q$Cloudlog is a free, open-source, self-hosted amateur radio logging app with CAT control, WSJT-X sync, and Logbook of the World integration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1f86602f-2198-4b4a-ae20-0793534244a7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1f86602f-2198-4b4a-ae20-0793534244a7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Web-based QSO logging$q$, $q$Log contacts from any device through a browser-accessible logbook.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$CAT control integration$q$, $q$Connects to radios via CAT control for streamlined logging.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$WSJT-X and satellite sync$q$, $q$Automatically syncs logs from WSJT-X and integrates with SatPC32 for satellite operators.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Logbook of the World integration$q$, $q$Automates LoTW upload and award matching without requiring TQSL.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Award tracking$q$, $q$Tracks DXCC, WAS, VUCC, IOTA, DOK, SOTA, and other operating awards.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Self-hosted or managed hosting$q$, $q$Run it yourself on PHP 7+/MySQL/MariaDB, or subscribe to managed hosting from MagicBug.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Free and open source for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Actively developed with ongoing community contributions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Broad award-tracking and CAT/WSJT-X integration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Optional managed hosting removes the need to run your own server$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Self-hosting requires a PHP/MySQL server and some technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Managed hosting is a paid subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$UI and feature depth trail some commercial ham-logging suites$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Project relies on volunteer development time and donations$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Is Cloudlog free?$q$, $q$The source code is free and open source on GitHub, so self-hosting costs nothing beyond your own server. The maintainer also offers optional managed hosting starting around £4/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$What do I need to self-host Cloudlog?$q$, $q$A web server with PHP 7.0+ and MySQL or MariaDB.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Does Cloudlog integrate with Logbook of the World?$q$, $q$Yes, it supports automated LoTW upload and award matching without requiring TQSL.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Can Cloudlog control my radio?$q$, $q$Yes, it supports CAT control integration and can sync logs automatically from WSJT-X.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Personal ham radio logbook$q$, $q$Keep a self-hosted logbook accessible from phone, tablet, or PC.$q$, $q$amateur radio operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Contest and DXpedition logging$q$, $q$Log contacts with automated award tracking during contests or DX trips.$q$, $q$competitive and DX-focused hams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Full source code on GitHub","Run on your own PHP/MySQL server","No feature restrictions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$Managed Hosting$q$, $q$£4/month or £48/year$q$, $q$monthly or annual$q$, $q$["Hosted and maintained by MagicBug","5GB storage for QSL cards","Automatic backups"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Cloudlog is an open-source, PHP/MySQL web application for logging amateur radio contacts (QSOs), started by Peter Goodhall (MM9SQL) and developed further by a community of contributors on GitHub. It covers logging from HF through microwave, integrates with CAT control and tools like WSJT-X, and syncs with Logbook of the World (LoTW) for automated upload and award matching (DXCC, WAS, VUCC, IOTA, DOK, SOTA, and more).$q$, $q$Operators can either self-host Cloudlog on their own PHP/MySQL server or use a paid managed hosting subscription offered by the maintainer, MagicBug.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Licensed amateur radio ('ham') operators who want a modern, browser-accessible logbook they can reach from any device, either self-hosted or via managed hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1f86602f-2198-4b4a-ae20-0793534244a7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── CUPS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, standards-based printing system that manages local and network printers on macOS, Linux, and other Unix-like systems.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CUPS is the free, open-source, standards-based printing system behind macOS, iOS, and many Linux distributions, with IPP Everywhere driverless printing.$q$,
  og_description = $q$CUPS is the free, open-source, standards-based printing system behind macOS, iOS, and many Linux distributions, with IPP Everywhere driverless printing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0fe96227-1d6d-4bd6-83ce-4ceea48aafd2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0fe96227-1d6d-4bd6-83ce-4ceea48aafd2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$IPP Everywhere support$q$, $q$Enables driverless printing to most modern local and network printers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Web-based administration$q$, $q$A browser-based interface (typically at localhost:631) manages printers and queues.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Local and network printing$q$, $q$Supports both USB-connected and network-attached printers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Print queue management$q$, $q$Handles job scheduling and queue administration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Cross-platform availability$q$, $q$Built into macOS/iOS/iPadOS, and packaged for Linux and other Unix-likes via OpenPrinting.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Free, open source, and standards-based (IPP)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Built into macOS/iOS, so no extra install needed on Apple platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Widely packaged across Linux distributions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Driverless printing works with most modern printers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Setup and troubleshooting can require command-line/config-file familiarity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$The version tracked on cups.org lags behind actively developed OpenPrinting forks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Not aimed at non-technical end users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Is CUPS free?$q$, $q$Yes, CUPS is free and open source, licensed under the Apache License 2.0 for versions 2.3 and later (earlier versions used GPL2/LGPL2 with exceptions).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Who develops CUPS?$q$, $q$It was developed by Apple for macOS, iOS, and iPadOS, with OpenPrinting maintaining versions for other operating systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$What is IPP Everywhere?$q$, $q$It's a driverless printing standard CUPS uses so many modern printers work without installing a manufacturer-specific driver.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Can I administer CUPS from a browser?$q$, $q$Yes, CUPS includes a web-based administration interface for managing printers and print jobs.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Shared network print server$q$, $q$Set up a print server on Linux that serves printers to an entire network.$q$, $q$system administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$Built-in Apple printing$q$, $q$Manage local and network printers on macOS, iOS, and iPadOS under the hood.$q$, $q$Apple platform users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$CUPS (Common Unix Printing System) is the standards-based, open-source printing system developed by Apple for macOS, iOS, and iPadOS, and made available for other Unix-like operating systems through the OpenPrinting project. It uses IPP Everywhere for driverless printing to modern local and network printers, and exposes a browser-based administration interface for managing print queues.$q$, $q$Licensing depends on version: CUPS 2.2 and earlier used GNU GPL2/LGPL2 with exceptions, while CUPS 2.3 and later moved to the Apache License 2.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Linux/Unix system administrators and Apple platform engineers who need a standards-based print server for managing local or network printers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0fe96227-1d6d-4bd6-83ce-4ceea48aafd2', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Digiboard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable collaborative online whiteboard for real-time classroom or team brainstorming.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$French$q$]::text[],
  seo_meta_description = $q$Digiboard is a free, open-source collaborative online whiteboard by LaDigitale, usable hosted or self-hosted (AGPL-3.0) for real-time brainstorming.$q$,
  og_description = $q$Digiboard is a free, open-source collaborative online whiteboard by LaDigitale, usable hosted or self-hosted (AGPL-3.0) for real-time brainstorming.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '49e87fbd-548a-4c83-b5b3-b84d439ae13c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '49e87fbd-548a-4c83-b5b3-b84d439ae13c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Real-time collaboration$q$, $q$Multiple users can draw and edit the same canvas simultaneously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Drawing and annotation tools$q$, $q$Provides tools for drawing, annotating, and organizing content on the board.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Cross-device support$q$, $q$Works on computers, tablets, and smartphones.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Free hosted version$q$, $q$Usable immediately at digiboard.app with no self-hosting required.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Self-hostable$q$, $q$Deploy your own instance as a Node.js app with Redis, including domain, port, and reverse-proxy configuration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Open-source license$q$, $q$Source is published on Codeberg under the AGPL-3.0 copyleft license.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Completely free, both hosted and self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Genuine real-time multi-user collaboration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Works across devices without installation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Open source under a copyleft license so improvements stay open$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Straightforward Node.js/Redis deployment for self-hosters$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Self-hosting requires Node.js and Redis configuration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Primarily documented and marketed for French-language education use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Fewer advanced diagramming features than dedicated whiteboard suites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Is Digiboard free?$q$, $q$Yes, it's free to use at digiboard.app and free and open source (AGPL-3.0) to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Who makes Digiboard?$q$, $q$It's developed by LaDigitale, a French educational technology platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Can I self-host Digiboard?$q$, $q$Yes, the source code is available on Codeberg (ladigitale/digiboard) and runs on Node.js with Redis.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$What license is Digiboard released under?$q$, $q$The AGPL-3.0 license.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Classroom brainstorming$q$, $q$Teachers and students collaborate on a shared visual canvas during remote or in-class lessons.$q$, $q$teachers and students$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$Team ideation sessions$q$, $q$Remote teams brainstorm together on a shared collaborative canvas.$q$, $q$remote teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Digiboard, by the French edtech platform LaDigitale, is a free, real-time collaborative online whiteboard. Multiple users can draw, annotate, and organize content together on the same canvas simultaneously, which makes it popular for classroom brainstorming and remote team sessions.$q$, $q$It's available as a free hosted tool at digiboard.app, and its source code is published on Codeberg under the AGPL-3.0 license for anyone who wants to self-host it on their own Node.js server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Teachers and students who need a free collaborative whiteboard for remote or in-class lessons, and teams that want a self-hostable brainstorming canvas.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('49e87fbd-548a-4c83-b5b3-b84d439ae13c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Domain Locker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Domain portfolio manager that tracks expiration, DNS, SSL, and security across every registrar in one dashboard.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Domain Locker is an open-source domain portfolio manager with expiration alerts, DNS/SSL monitoring, and a free self-hosted option.$q$,
  og_description = $q$Domain Locker is an open-source domain portfolio manager with expiration alerts, DNS/SSL monitoring, and a free self-hosted option.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '03502625-329e-43e5-b9a4-c57308f6f0a3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '03502625-329e-43e5-b9a4-c57308f6f0a3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Automatic asset detection$q$, $q$Discovers SSL certificates, DNS records, registrars, subdomains, and IPs tied to each domain.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Expiration and change alerts$q$, $q$Notifies you before a domain expires or when its configuration changes, via email, webhook, Telegram, or Signal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Security audits$q$, $q$Flags security issues and gives recommendations for each domain in your portfolio.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Uptime and performance monitoring$q$, $q$Tracks whether domains are online and responding as expected.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Financial tracking$q$, $q$Records registration costs, renewal fees, and estimated valuations for profit/loss tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$API and feed access$q$, $q$Exposes data via a REST API, Prometheus metrics, iCal, and RSS for integration with other tools.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Open source and free to self-host on your own server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Multi-channel alerting beyond just email$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Tracks financial value of a domain portfolio, not just DNS/SSL status$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$API access for integrating with existing monitoring stacks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Discounted pricing for nonprofits and open-source maintainers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Free cloud tier is capped at 5 domains$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Larger portfolios require a paid cloud plan or self-hosting effort$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Self-hosting requires setting up and maintaining your own server$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Is Domain Locker free?$q$, $q$The self-hosted, open-source version is free to run on your own infrastructure. The hosted cloud version has a free tier limited to 5 domains, with paid plans for larger portfolios.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Can I self-host Domain Locker?$q$, $q$Yes, the source code is MIT-licensed and available on GitHub for anyone to deploy and modify.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$What happens when a domain is about to expire?$q$, $q$Domain Locker can send expiration alerts through email, webhook, Telegram, Signal, and other supported channels before renewal deadlines.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Does it work with any domain registrar?$q$, $q$It's designed to track domains regardless of which registrar they were purchased from, aggregating them into a single dashboard.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Domain portfolio management$q$, $q$Investors holding many domains across registrars use it to track expiration and value in one place.$q$, $q$Domain investors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Agency client domain oversight$q$, $q$Agencies manage renewal dates and SSL status for multiple client domains from a single dashboard.$q$, $q$Digital agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Infrastructure monitoring$q$, $q$Sysadmins self-host it to monitor DNS and SSL changes across owned domains without relying on a third party.$q$, $q$Sysadmins/IT teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Free (Cloud)$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 5 domains","Core monitoring features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Hobby (Cloud)$q$, $q$$5$q$, $q$monthly (billed annually)$q$, $q$["Up to 20 domains"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Pro (Cloud)$q$, $q$$20$q$, $q$monthly (billed annually)$q$, $q$["Up to 100 domains"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$Self-Hosted$q$, $q$Free$q$, $q$n/a$q$, $q$["Open-source, MIT licensed","Unlimited domains on your own infrastructure"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Domain Locker is a domain portfolio management platform that centralizes monitoring for domains spread across multiple registrars. It tracks expiration dates, DNS records, SSL certificates, WHOIS changes, and uptime, and can alert owners before a domain lapses or its configuration changes unexpectedly.$q$, $q$The project is open source under the MIT license, so it can be self-hosted for free on your own infrastructure. A hosted cloud version is also offered for people who would rather not run their own server, with paid tiers based on how many domains you manage.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Domain investors, agencies managing client portfolios, and sysadmins who want a single place to watch expiration dates, SSL status, and DNS changes across many domains rather than checking each registrar separately.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03502625-329e-43e5-b9a4-c57308f6f0a3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── DOMJudge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source contest judging system used to run ICPC-style programming competitions with automated grading.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$DOMjudge is a free, open-source automated judging system for ICPC-style programming contests, self-hosted by universities worldwide.$q$,
  og_description = $q$DOMjudge is a free, open-source automated judging system for ICPC-style programming contests, self-hosted by universities worldwide.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '854f8d2c-af4c-48f6-b7f6-07a0687b0ff0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '854f8d2c-af4c-48f6-b7f6-07a0687b0ff0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Automated judging$q$, $q$Compiles and runs submitted code against test cases and grades it automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Modular language support$q$, $q$Supports a range of programming languages through a pluggable language configuration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Jury interface$q$, $q$Gives judges a dedicated interface to review submissions, resolve edge cases, and manage the contest.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Live scoreboard$q$, $q$Displays team standings to contestants and spectators as the contest progresses.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Security-focused design$q$, $q$Built with contest integrity in mind, including sandboxed submission execution.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Battle-tested in ICPC regional and world-level contests since 2004$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Completely free and open source under the GPL$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Supports multiple programming languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Active development community and mailing list/Slack$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Aimed at technical contest organizers; setup requires server administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Interface is utilitarian rather than consumer-friendly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$No official hosted SaaS version — you run your own instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Is DOMjudge free?$q$, $q$Yes, it's free, open-source software released under the GNU General Public License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$What contests use DOMjudge?$q$, $q$It has been used in numerous ICPC regional contests including NWERC and SWERC, as well as university courses and online programming contests.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Does DOMjudge support multiple programming languages?$q$, $q$Yes, language support is modular so contest organizers can configure which languages are accepted.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Can I run DOMjudge for a small local contest?$q$, $q$Yes, it can be self-hosted for contests of any size, from classroom exercises to large regional competitions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$University programming contests$q$, $q$Universities run local or regional ICPC-style contests using DOMjudge for automated grading and a live scoreboard.$q$, $q$University CS departments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Classroom coding exercises$q$, $q$Instructors use it to automatically grade programming assignments in courses.$q$, $q$Educators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$Regional and national qualifiers$q$, $q$Organizers of ICPC regional contests rely on DOMjudge to judge submissions across many teams reliably.$q$, $q$Contest organizers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$DOMjudge is a free, open-source system for running programming contests, most notably ICPC-style competitions. It automates the judging of submitted code against test cases, provides a jury interface for manual review, and runs a live scoreboard for teams and spectators.$q$, $q$The project has been used in real competitions since 2004, including numerous ICPC regional contests such as NWERC and SWERC, and is also used in university courses and online judging systems. It's released under the GNU General Public License and maintained by a community of contributors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Contest organizers, universities running programming competitions, and instructors who need automated code judging for classroom exercises or coding contests.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('854f8d2c-af4c-48f6-b7f6-07a0687b0ff0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ESMira ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted platform for running experience-sampling and ecological momentary assessment research studies.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Krems an der Donau, Austria$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ESMira is a free, open-source, self-hosted platform from Karl Landsteiner Privatuniversitat for running experience-sampling research studies.$q$,
  og_description = $q$ESMira is a free, open-source, self-hosted platform from Karl Landsteiner Privatuniversitat for running experience-sampling research studies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cbb55d0e-101f-4a0d-851d-02e7d9feca7f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cbb55d0e-101f-4a0d-851d-02e7d9feca7f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Decentralized self-hosting$q$, $q$Each study administrator hosts their own instance, so studies and their data operate independently on separate servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Participant anonymity$q$, $q$Designed so participant data is never sent anywhere beyond the server hosting that specific study.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$PHP-only server requirement$q$, $q$Runs on any standard webserver with PHP, without complex infrastructure dependencies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Automatic self-updates$q$, $q$Can back itself up, pull the newest version from GitHub, and migrate its data structure automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Customizable studies$q$, $q$Lets administrators configure surveys, prompt schedules, and data collection rules for their specific research design.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Participant data never leaves the researcher's own server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Free and open source under AGPL$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Simple PHP-only hosting requirement, no exotic infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Backed by an academic department with a published methodology paper$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Built-in self-update mechanism$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Requires the researcher to set up and maintain their own server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Documentation and design are oriented toward academic researchers, not general users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Niche, research-specific tool rather than a general-purpose survey platform$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Interface is less polished than commercial EMA/EMS tools$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$What is ESMira used for?$q$, $q$It's used by researchers to run experience-sampling, ambulatory assessment, and ecological momentary assessment studies, sending scheduled prompts to participants and collecting their responses.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Is ESMira free?$q$, $q$Yes, it's free and open source under the AGPL license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Do I need to be a developer to set it up?$q$, $q$You need access to a PHP-enabled webserver, but the project is designed so study administrators without deep technical expertise can install and configure it.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$How is participant privacy protected?$q$, $q$Because each study runs on its own decentralized server, participant data is only ever sent to the server hosting that specific study, not to any central third party.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Psychology diary studies$q$, $q$Research teams schedule repeated prompts to participants' phones to collect momentary mood or behavior data.$q$, $q$Psychology researchers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$Multi-site decentralized studies$q$, $q$Universities running studies at different sites each host their own independent ESMira instance.$q$, $q$Academic institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ESMira is an open-source, decentralized platform for running Experience Sampling Method (ESM), Ambulatory Assessment (AA), and Ecological Momentary Assessment (EMA) research studies. It's developed by the Department of Psychological Methodology at Karl Landsteiner Privatuniversität in Austria and described in a peer-reviewed paper published in Behavior Research Methods.$q$, $q$Researchers install ESMira on their own PHP-enabled webserver, where they design questionnaires, schedule prompts sent to participants' phones, and collect fully anonymous data without routing it through any third-party server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Academic researchers and study administrators running ESM, EMA, or ambulatory diary-style studies in psychology, medicine, or behavioral science who need participant data to stay under their own control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cbb55d0e-101f-4a0d-851d-02e7d9feca7f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── F-Droid ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Community-run, free and open-source app catalog offering FOSS Android apps outside the Google Play Store.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2010,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$F-Droid is a free, open-source, community-run app store for Android offering FOSS apps and the option to self-host your own repository.$q$,
  og_description = $q$F-Droid is a free, open-source, community-run app store for Android offering FOSS apps and the option to self-host your own repository.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '16f675b3-a2df-4104-8242-9d861140e8cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '16f675b3-a2df-4104-8242-9d861140e8cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Curated FOSS app catalog$q$, $q$Lists free and open source Android apps vetted for inclusion in the official repository.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Reproducible builds$q$, $q$Many apps are built directly from source by F-Droid's own infrastructure rather than repackaging developer binaries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$No default tracking$q$, $q$The client and cataloged apps are checked for tracking libraries, with anti-features flagged when present.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Custom repositories$q$, $q$Anyone can host their own F-Droid-compatible repository to distribute apps privately or to a specific audience.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$In-app update notifications$q$, $q$Notifies users when a new version of an installed app is available.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Completely free with no ads or paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Privacy-respecting alternative to the Google Play Store$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Open, community-based governance rather than corporate control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Anyone can self-host a custom app repository$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Smaller app catalog than Google Play$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Some apps lag behind their Play Store releases due to reproducible-build requirements$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Android only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Recent changes to Android sideloading policy create uncertainty for F-Droid's distribution model$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Is F-Droid free?$q$, $q$Yes, F-Droid is free and funded entirely by donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Is F-Droid safe to use?$q$, $q$F-Droid vets apps for inclusion and flags known tracking or non-free dependencies as anti-features, and many apps are built by F-Droid's own infrastructure rather than repackaged binaries.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Can I host my own F-Droid repository?$q$, $q$Yes, anyone can set up a custom repository and point the F-Droid client at it to distribute apps privately.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Does F-Droid require Google Play Services?$q$, $q$No, F-Droid and the apps it distributes are generally designed to work without Google Play Services.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Privacy-focused app sourcing$q$, $q$Users install FOSS apps vetted for privacy instead of relying on the Google Play Store.$q$, $q$Privacy-conscious Android users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Open-source app distribution$q$, $q$Developers publish their FOSS apps to F-Droid's catalog to reach users who prefer open-source software.$q$, $q$App developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$Private organizational app repository$q$, $q$Organizations self-host a custom F-Droid repository to distribute internal or approved apps to managed devices.$q$, $q$IT administrators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$F-Droid is an installable catalog of free and open source software (FOSS) applications for Android, functioning as an alternative to the Google Play Store. It has operated since 2010, maintained by community contributors and funded through donations rather than corporate ownership.$q$, $q$Because F-Droid builds many of the apps it distributes itself from public source code, it emphasizes verifiability and freedom from tracking, and organizations can also run their own private F-Droid repository.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Privacy-conscious Android users who want FOSS alternatives to mainstream apps, open-source developers distributing apps outside Google Play, and organizations that want to self-host an internal app repository.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('16f675b3-a2df-4104-8242-9d861140e8cf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Flyimg ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source Docker app that resizes, crops, and compresses images on the fly, like a self-hosted Cloudinary.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Flyimg is a free, open-source Docker app for on-the-fly image resizing and optimization, a self-hosted alternative to Cloudinary.$q$,
  og_description = $q$Flyimg is a free, open-source Docker app for on-the-fly image resizing and optimization, a self-hosted alternative to Cloudinary.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '90850fdb-68e2-47bf-bb23-ea2ccb2848e1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '90850fdb-68e2-47bf-bb23-ea2ccb2848e1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$On-the-fly resize and crop$q$, $q$Transforms images based on parameters passed in the request URL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Modern format output$q$, $q$Serves AVIF, WebP, MozJPEG, PNG, GIF, and optionally JPEG XL for smaller file sizes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Automatic format negotiation$q$, $q$The o_auto option selects the best output format based on the browser's Accept header.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Efficient caching$q$, $q$Stores processed images so repeat requests are served from cache instead of reprocessed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Face detection and blurring$q$, $q$Supports face-aware cropping and blurring as part of the image pipeline.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Single-container deployment$q$, $q$Ships as one Docker container running nginx and php-fpm.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Deploys as a single Docker container$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Supports modern, bandwidth-saving formats like AVIF and WebP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Active GitHub project with JetBrains open-source sponsorship$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Optional hosted SaaS version for teams that don't want to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$AGPL license carries copyleft obligations for modified network-hosted deployments$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Requires Docker and server management to self-host$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Fewer built-in features than full commercial media CDNs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Is Flyimg free?$q$, $q$Yes, the self-hosted software is free and open source under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Can I use Flyimg without self-hosting it?$q$, $q$Yes, a hosted version is available at flyimg.io for people who don't want to run their own container.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$What image formats does Flyimg support?$q$, $q$It outputs AVIF, WebP, MozJPEG, PNG, GIF, and optionally JPEG XL, and can auto-select the best format for the requesting browser.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$How is Flyimg deployed?$q$, $q$It runs as a single Docker container bundling nginx and php-fpm.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$Self-hosted image CDN$q$, $q$Teams replace a commercial image CDN with a self-hosted Flyimg container to control costs and data residency.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$CMS thumbnail generation$q$, $q$Agencies generate on-the-fly thumbnails and responsive image variants for content-managed websites.$q$, $q$Web agencies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Flyimg is a Dockerized, open-source image-processing service that resizes, crops, and optimizes images on the fly using ImageMagick, offering a self-hosted alternative to hosted image CDNs like Cloudinary. It fetches a source image, applies the requested transformations via URL parameters, caches the output, and serves optimized files.$q$, $q$The project is released under the AGPL-3.0 license, is available as a single Docker container, and also offers an optional hosted SaaS version at flyimg.io for teams that don't want to run their own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Developers and teams who want an on-premise, self-hosted alternative to commercial image CDNs for resizing, cropping, and format-optimizing images at request time.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('90850fdb-68e2-47bf-bb23-ea2ccb2848e1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Habitica ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gamified habit and to-do tracker that turns real-life tasks into an RPG, free to use with optional paid subscriptions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Habitica is a free, gamified habit and to-do tracker with optional paid subscriptions, available on web, iOS, and Android.$q$,
  og_description = $q$Habitica is a free, gamified habit and to-do tracker with optional paid subscriptions, available on web, iOS, and Android.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c66c0bf-66e6-4947-82a4-244a69ecb504';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c66c0bf-66e6-4947-82a4-244a69ecb504' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Habits, dailies, and to-dos$q$, $q$A task system where completing items earns rewards and missing dailies has in-game consequences.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Avatar customization$q$, $q$Gold and gems earned in-app unlock gear, pets, and mounts for a customizable character.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Parties and guilds$q$, $q$Social groups where members can hold each other accountable and take on quests together.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Challenges$q$, $q$Community or private challenges let groups compete around shared goals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Cross-platform apps$q$, $q$Available as a web app plus native iOS and Android apps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Open-source self-hosting$q$, $q$The GPL-3.0 codebase can be deployed on your own infrastructure by technically inclined users.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Core task-tracking functionality is entirely free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Strong social and gamification mechanics for accountability$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Cross-platform: web, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Open source with a community-supported self-hosting path$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Long-running, active community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Gamified approach can feel gimmicky for users who want a plain to-do list$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Paid subscription only unlocks cosmetics, not extra productivity features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Official self-hosting support is limited; most self-host setups are community-maintained forks$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Is Habitica free?$q$, $q$Yes, all core task-tracking and gamification features are free. A subscription adds cosmetic items and supports development.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$What does a Habitica subscription include?$q$, $q$Subscribers get exclusive monthly items and a special pet, but the subscription does not unlock any productivity feature withheld from free users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Can I self-host Habitica?$q$, $q$The codebase is open source under GPL-3.0, and community projects exist for running your own instance, though it isn't officially packaged by the core team.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Is there a group or family plan?$q$, $q$Yes, Habitica offers a group plan priced per member for parties, families, or friend groups wanting shared accountability features.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Solo habit building$q$, $q$Individuals use the game mechanics to stay motivated on daily habits and routines.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Group accountability$q$, $q$Friends or families join a party or use the group plan to keep each other on track.$q$, $q$Friend groups and families$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Free$q$, $q$$0$q$, $q$n/a$q$, $q$["Full habit, daily, and to-do tracking","Avatar customization"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Subscription$q$, $q$$4.99$q$, $q$monthly (discounted at $47.99/year)$q$, $q$["Exclusive monthly items","Exclusive pet","Supports development"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$Group Plan$q$, $q$$9$q$, $q$monthly for first account, plus $3/month per additional member$q$, $q$["Shared group features for parties/families"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Habitica turns habit-building and task management into a role-playing game: completing habits, dailies, and to-dos earns experience and gold, while missed dailies cost health. It's fully usable for free, with an optional subscription that unlocks cosmetic rewards and supports the developers rather than gating core functionality.$q$, $q$The underlying codebase, HabitRPG, is open source under the GPL-3.0 license and can be self-hosted, though the primary way most people use Habitica is through the official hosted app at habitica.com.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$People who want extra motivation for habit tracking and task management through gamification, often paired with community 'parties' and guilds for social accountability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c66c0bf-66e6-4947-82a4-244a69ecb504', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── HortusFox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source platform for tracking and managing a houseplant collection, with reminders and a plant community.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HortusFox is a free, open-source, self-hosted app for tracking houseplant care with reminders, a calendar, and a REST API.$q$,
  og_description = $q$HortusFox is a free, open-source, self-hosted app for tracking houseplant care with reminders, a calendar, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a0a11055-ce1c-48de-8c3b-a99cd8a998eb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a0a11055-ce1c-48de-8c3b-a99cd8a998eb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Plant dashboard and inventory$q$, $q$Central view of your plant collection with details for each plant.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Task tracking$q$, $q$Set and track recurring care tasks like watering or fertilizing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Calendar and weather integration$q$, $q$Ties care schedules to a calendar and local weather data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Group chat and photo sharing$q$, $q$Lets multiple users on the same instance communicate and share plant photos.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$REST API$q$, $q$Available since version 3.1 for integrating HortusFox with other tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Activity history$q$, $q$Tracks changes and care activity over time per plant and per user.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Self-hosted, so plant and photo data stays private$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Actively maintained with a Discord community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$REST API for custom integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Supports multiple collaborating users on one instance$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Requires self-hosting; there's no official managed hosting from the maintainers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$No official native mobile app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Smaller community than mainstream consumer plant apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Is HortusFox free?$q$, $q$Yes, it's free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Can multiple people use the same HortusFox instance?$q$, $q$Yes, it supports multiple user accounts and includes group chat and photo sharing for collaborative plant tracking.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Does HortusFox have an API?$q$, $q$Yes, a REST API has been available since version 3.1.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Is there official hosting available?$q$, $q$The maintainers point to third-party community hosting options but disclaim responsibility for those external providers; self-hosting is the primary supported path.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Personal plant care tracking$q$, $q$A hobbyist logs watering, fertilizing, and repotting schedules for their houseplant collection.$q$, $q$Plant hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$Shared household plant tracking$q$, $q$A household or plant-sharing group uses one instance with multiple accounts to coordinate care.$q$, $q$Households / plant communities$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$HortusFox is a self-hosted, open-source platform for keeping track of houseplants. It provides a dashboard for plant inventory, care task tracking, calendar and weather integration, and a REST API, released under the MIT license for anyone to deploy on their own server.$q$, $q$It's built for plant enthusiasts who want a private, data-owning alternative to commercial plant-care apps, and it includes collaborative features like group chat and photo sharing for households or plant-sharing communities.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Individual plant hobbyists tracking care schedules, and households or plant-collective groups who want to share one instance across multiple people.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0a11055-ce1c-48de-8c3b-a99cd8a998eb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ImgCompress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, self-hosted Docker tool for bulk image compression and format conversion across 70+ formats, with offline AI background removal.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ImgCompress is a free, self-hosted Docker tool for bulk image compression, format conversion, and offline AI background removal.$q$,
  og_description = $q$ImgCompress is a free, self-hosted Docker tool for bulk image compression, format conversion, and offline AI background removal.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '959b9d2f-85ba-483f-9122-54acf02a036f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '959b9d2f-85ba-483f-9122-54acf02a036f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$70+ format support$q$, $q$Handles conversion and compression across formats including HEIC, HEIF, PSD, AVIF, and PDF.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Local AI background removal$q$, $q$Removes image backgrounds using a bundled model that runs entirely offline.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Batch processing$q$, $q$Compresses entire photo libraries in parallel using multiple CPU cores.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$PDF creation$q$, $q$Converts a batch of images into a structured, paginated PDF.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Privacy-first design$q$, $q$No telemetry, no cloud processing, and no external API calls.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Web UI and CLI$q$, $q$Offers both a web interface for everyday use and a CLI for scripted workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Completely free with no subscriptions or license checks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Works fully offline once deployed, protecting data privacy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Handles bulk/batch operations efficiently across many CPU cores$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Includes AI background removal without needing a cloud API key$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Featured on the Awesome Self-Hosted list$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Maintained by a single developer, which carries a bus-factor risk$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Requires Docker to run; no official hosted version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Interface is functional rather than polished$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Is ImgCompress free?$q$, $q$Yes, it's permanently free with no subscriptions, license checks, or expiration dates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Does ImgCompress need an internet connection?$q$, $q$No, after the initial Docker image pull it runs entirely offline.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$What image formats does it support?$q$, $q$Over 70 formats, including HEIC, HEIF, PSD, AVIF, and PDF output.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Can it remove image backgrounds without a cloud AI service?$q$, $q$Yes, background removal runs locally using a bundled AI model rather than calling an external API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$Bulk photo library compression$q$, $q$Photographers compress and convert large photo libraries in bulk without uploading files to the cloud.$q$, $q$Photographers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$In-house image processing pipeline$q$, $q$Developers self-host it as a backend for compressing and converting images without relying on cloud image APIs.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ImgCompress is a self-hosted, open-source Docker tool built by Karim Zouine for batch image compression, format conversion, and resizing across more than 70 formats, including HEIC, PSD, and AVIF. It also includes offline AI-based background removal and can assemble multi-page PDFs from a batch of images.$q$, $q$Everything runs locally in the container with no cloud upload, no telemetry, and no license checks — once the Docker image is pulled, it works without an internet connection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$People who need to batch-process large photo libraries or build an in-house image pipeline without sending files to a third-party cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('959b9d2f-85ba-483f-9122-54acf02a036f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Jelu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source personal library app for tracking books read and to-read, a private alternative to Goodreads.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Jelu is a free, open-source, self-hosted book tracker with Goodreads import, custom shelves, and a REST API.$q$,
  og_description = $q$Jelu is a free, open-source, self-hosted book tracker with Goodreads import, custom shelves, and a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae515eae-68cb-450f-8fad-3f3174591ee1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae515eae-68cb-450f-8fad-3f3174591ee1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Automatic metadata fetching$q$, $q$Pulls book details automatically when adding titles to your library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Goodreads and ISBN import$q$, $q$Imports existing reading history from a Goodreads export or a list of ISBNs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Custom shelves and tags$q$, $q$Organizes books into user-defined shelves and tags.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Reviews and reading history$q$, $q$Tracks books read by year and month, with space for personal reviews.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$REST API with tokens$q$, $q$Provides an interactive REST API and API tokens for integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Multi-user and enterprise auth$q$, $q$Supports multiple accounts per instance plus LDAP or reverse-proxy authentication.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Keeps reading data private and self-hosted$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Straightforward Goodreads import path for migrating existing libraries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$REST API for integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$LDAP/reverse-proxy auth support for shared or organizational use$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Requires self-hosting via JAR or Docker; no official hosted version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Smaller community than Goodreads or The StoryGraph$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$No official native mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Is Jelu free?$q$, $q$Yes, it's free and open source, deployed via a JAR file or Docker on your own server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Can I import my Goodreads library into Jelu?$q$, $q$Yes, Jelu supports importing reading history from a Goodreads export or a list of ISBNs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Does Jelu have an API?$q$, $q$Yes, it provides an interactive REST API with support for API tokens.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Can multiple people share one Jelu instance?$q$, $q$Yes, it supports multiple user accounts, including LDAP or reverse-proxy authentication for shared or organizational deployments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Private reading tracker$q$, $q$Individual readers self-host Jelu to track books read and build a private to-read list.$q$, $q$Individual readers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$Shared household or book club library$q$, $q$A household or book club runs one instance with multiple accounts to track everyone's reading.$q$, $q$Households / book clubs$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Jelu is a self-hosted, open-source personal reading tracker positioned as a private alternative to Goodreads. It automatically fetches book metadata, can import reading history from Goodreads exports or ISBN lists, and lets you organize books into custom shelves with reviews and reading statistics broken down by year and month.$q$, $q$It's deployed via a JAR file or Docker, supports multiple user accounts, and offers an interactive REST API along with LDAP or reverse-proxy authentication for use in shared or organizational settings.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Readers who want to keep their reading data private and self-hosted instead of relying on Goodreads, and households or book clubs sharing one instance across multiple accounts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae515eae-68cb-450f-8fad-3f3174591ee1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Kasm Workspaces ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Container streaming platform delivering browser-based virtual desktops and app streaming, with a free Community Edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = $q$McLean, Virginia, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kasm Workspaces streams browser-based virtual desktops and apps via containers, with a free self-hosted Community Edition.$q$,
  og_description = $q$Kasm Workspaces streams browser-based virtual desktops and apps via containers, with a free self-hosted Community Edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cca6ce71-65f3-480e-80b7-a4723f4b0866';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cca6ce71-65f3-480e-80b7-a4723f4b0866' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Browser-based virtual desktops$q$, $q$Streams full Linux or Windows desktops directly into a web browser without a client install.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Container-based isolation$q$, $q$Each session runs in an isolated container, following a zero-trust security model.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Browser isolation$q$, $q$Provides disposable, isolated browser sessions to protect against web-based threats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Flexible deployment$q$, $q$Can be deployed on-premises or in the cloud.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Free Community Edition$q$, $q$A self-hosted edition available at no cost for individuals, nonprofits, and testing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Scalable architecture$q$, $q$Designed to scale from a single self-hosted node to larger multi-tenant deployments.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Free, self-hosted Community Edition available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Strong container-based isolation and zero-trust security model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$No client software needed — runs entirely in the browser$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Flexible on-premises or cloud deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Paid tiers required for larger teams or enterprise features$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Running container-streaming infrastructure at scale adds operational complexity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Primarily aimed at IT/security teams rather than casual consumer use$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Is Kasm Workspaces free?$q$, $q$There's a free, self-hosted Community Edition intended for individuals, nonprofits, and testing, alongside paid personal and team/enterprise plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$What is Kasm Workspaces used for?$q$, $q$It's used for browser isolation, streaming remote desktops and applications, and securing access to sensitive or legacy systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Can Kasm be self-hosted?$q$, $q$Yes, it can be deployed on your own on-premises infrastructure or in the cloud.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Who makes Kasm Workspaces?$q$, $q$It's developed by Kasm Technologies, a company founded in 2017 and headquartered in McLean, Virginia.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Browser isolation$q$, $q$Security teams give users disposable, isolated browser sessions to reduce exposure to web-based threats.$q$, $q$Security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Legacy application streaming$q$, $q$IT departments stream legacy Windows or Linux applications into modern browsers instead of maintaining local installs.$q$, $q$IT departments$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Secure remote access to sensitive systems$q$, $q$Organizations use Kasm to provide controlled, isolated access to OT/IoT or otherwise sensitive systems.$q$, $q$Enterprises and government agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Community Edition$q$, $q$Free$q$, $q$n/a$q$, $q$["Self-hosted","Intended for individuals, nonprofits, and testing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Personal$q$, $q$$5$q$, $q$per user/month$q$, $q$["Individual paid tier"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$Team / Enterprise$q$, $q$$10$q$, $q$per user/month$q$, $q$["Team and enterprise features"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Kasm Workspaces is a container-streaming platform that delivers virtual desktops, isolated browsers, and applications directly into a user's web browser without any local installation. It's built by Kasm Technologies, founded in 2017 and headquartered in McLean, Virginia.$q$, $q$It's used for browser isolation, remote workspace delivery, and secure access to sensitive or legacy systems, and is offered as a free, self-hosted Community Edition alongside paid personal and team/enterprise tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$IT and security teams needing isolated browsing or remote access, organizations streaming legacy Windows or Linux applications to end users, and teams needing secure access to sensitive or air-gapped systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cca6ce71-65f3-480e-80b7-a4723f4b0866', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Koillection ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted app for cataloging, tagging, and sharing personal collections such as hobby items, cards, or memorabilia.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_meta_description = $q$Koillection is a free, self-hosted app for cataloging, tagging, and sharing personal collections with full data ownership.$q$,
  og_description = $q$Koillection is a free, self-hosted app for cataloging, tagging, and sharing personal collections with full data ownership.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c742a777-74f7-4981-aabd-5b21669059f3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c742a777-74f7-4981-aabd-5b21669059f3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Item & Collection Management$q$, $q$Create nested collections and catalog individual items with photos, custom fields, and notes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Tags & Signs$q$, $q$Organize items flexibly using tags and custom 'signs' instead of fixed category trees.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Wishlists$q$, $q$Track items you want to acquire alongside your existing collection.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Controlled Sharing$q$, $q$Share collections with others while choosing exactly what they can see.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$REST API$q$, $q$Access and manage collection data programmatically for custom scripts or integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Progressive Web App$q$, $q$Use Koillection from a mobile browser with an app-like experience, no native app store install required.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Full ownership of your data since everything lives on your own server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Flexible tagging system adapts to many collection types$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Works well on mobile via PWA support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$REST API allows custom integrations and automation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Requires a self-hosting environment — no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$No native iOS or Android app, only the PWA$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Smaller community than mainstream inventory or collection apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Is Koillection free to use?$q$, $q$Yes. Koillection is completely free and open source; you self-host it on your own server at no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Can I share my collection with other people?$q$, $q$Yes. Koillection lets you share collections while controlling exactly what visitors can see.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Does Koillection have a mobile app?$q$, $q$There is no native app, but Koillection works as a Progressive Web App that can be added to a phone's home screen.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Does Koillection have an API?$q$, $q$Yes, it exposes a REST API for custom integrations and automation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Hobby collection cataloging$q$, $q$Track trading cards, stamps, coins, or figurines with photos, notes, and custom tags.$q$, $q$Hobbyist collectors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Memorabilia archiving$q$, $q$Document and organize personal or family memorabilia with full data ownership.$q$, $q$Personal archivists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$Shared community collections$q$, $q$Selectively share parts of a collection with friends or collector communities.$q$, $q$Collector communities$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Koillection is a free, open-source, self-hosted platform for cataloging and organizing personal collections. Users can create collections and items, attach photos and details, and organize everything with flexible tags and custom 'signs' rather than rigid categories.$q$, $q$Because it runs on your own server, all uploaded data and images stay under your control. Koillection also supports wishlists, a REST API for custom integrations, and works as a Progressive Web App so it can be used comfortably from a phone or tablet browser.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Koillection suits hobbyist collectors — of trading cards, stamps, figurines, books, or any other physical items — who want a structured digital catalog without handing their data to a third-party service. It also fits anyone who wants to selectively share parts of a collection with others while keeping full control over what is visible.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c742a777-74f7-4981-aabd-5b21669059f3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── LanguageTool ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-based grammar, spelling, and style checker with browser extensions, desktop apps, and an open-source self-hostable core.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Premium from $4.99/month billed annually)$q$,
  founded_year = 2003,
  company_size = NULL,
  headquarters = $q$Potsdam, Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$French$q$, $q$Portuguese$q$, $q$Dutch$q$, $q$Catalan$q$]::text[],
  seo_meta_description = $q$LanguageTool checks grammar, spelling, and style in 20+ languages, with a free tier, Premium plans, and an open-source self-hostable core.$q$,
  og_description = $q$LanguageTool checks grammar, spelling, and style in 20+ languages, with a free tier, Premium plans, and an open-source self-hostable core.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '917d6a1d-804c-4ce5-b0e0-d9db22f252c6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '917d6a1d-804c-4ce5-b0e0-d9db22f252c6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Grammar & Spelling Check$q$, $q$Detects grammatical errors and misspellings as you type, across more than 20 languages.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Punctuation & Style Suggestions$q$, $q$Flags comma, dash, and hyphen issues along with overused phrases and redundant wording.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Paraphrasing Tool$q$, $q$Premium feature that rewrites sentences to be more formal, fluent, simple, or concise.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Browser Extensions$q$, $q$Available for Chrome, Firefox, Edge, Safari, and Opera.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Desktop Apps$q$, $q$Native apps for Windows and macOS check text outside the browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Office & Email Integrations$q$, $q$Plugins for Google Docs, Microsoft Word, LibreOffice, Apple Pages, Gmail, Outlook, and Thunderbird.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Open-Source Core$q$, $q$The underlying LanguageTool engine is open source and can be self-hosted as a local server.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Generous free tier catches common spelling and grammar mistakes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Supports more than 20 languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Wide platform coverage: browsers, desktop, and major office suites$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Open-source core can be self-hosted for privacy-sensitive use$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Premium adds a built-in paraphrasing tool$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Many advanced style and grammar checks are gated behind Premium$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Month-to-month Premium pricing is significantly higher than the annual plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Self-hosted core lacks some cloud-only Premium features$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Like other grammar checkers, occasional false positives occur$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Is LanguageTool free?$q$, $q$Yes, a free version covers basic spelling, punctuation, and some style mistakes. Premium unlocks additional error checks and the paraphrasing tool.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$What does LanguageTool Premium cost?$q$, $q$Individual Premium plans start around $4.99/month when billed annually, with quarterly and monthly options priced higher; team plans start around $9.48/month for two users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Can I self-host LanguageTool?$q$, $q$Yes, the open-source LanguageTool engine can be run as a local server, separate from the commercial cloud product.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$What languages does LanguageTool support?$q$, $q$LanguageTool supports more than 20 languages and dialects, including multiple varieties of English, German, Spanish, French, Portuguese, Dutch, and Catalan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Everyday writing improvement$q$, $q$Catch grammar, spelling, and style mistakes in emails, documents, and web forms.$q$, $q$Writers and professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Language learning support$q$, $q$Get real-time corrections and explanations while writing in a non-native language.$q$, $q$Non-native speakers and students$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Self-hosted grammar checking$q$, $q$Run the open-source engine on your own server for privacy-sensitive applications.$q$, $q$Developers and privacy-conscious teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Free$q$, $q$$0$q$, $q$N/A$q$, $q$["Basic spelling and grammar checks","Limited style suggestions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Premium (Individual)$q$, $q$From $4.99/month (billed annually); $19.90/month billed monthly$q$, $q$monthly/quarterly/annual$q$, $q$["All grammar, spelling, and style checks","Paraphrasing tool","Personal dictionary","Picky mode"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$Team$q$, $q$From $9.48/month for 2 users$q$, $q$monthly$q$, $q$["All Premium features","Shared team dictionary","Per-seat billing"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LanguageTool is a writing assistant that checks text for grammar, spelling, punctuation, and style issues across more than 20 languages. It began as an open-source grammar-checking project and is now also offered as a commercial product with browser extensions, desktop apps, and office integrations.$q$, $q$Beyond basic spellchecking, LanguageTool flags awkward phrasing, redundant words, and complex punctuation problems, and its Premium tier adds a paraphrasing tool that rewrites sentences to be more formal, concise, or fluent. The underlying open-source engine can also be self-hosted, letting developers run grammar checking on their own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LanguageTool is aimed at writers, students, non-native speakers, and businesses that need multilingual grammar and style checking across documents, email, and web forms. Developers who want a self-hosted, privacy-preserving grammar-checking API can run the open-source core directly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('917d6a1d-804c-4ce5-b0e0-d9db22f252c6', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Libre Translate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source machine translation API that can run fully offline and self-hosted, or via a paid hosted API.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted); hosted API from $29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Chinese$q$, $q$Japanese$q$, $q$Russian$q$, $q$Basque$q$, $q$Kabyle$q$, $q$Scottish Gaelic$q$]::text[],
  seo_meta_description = $q$LibreTranslate is a free, open-source, self-hostable translation API that can run offline, with an optional paid hosted service.$q$,
  og_description = $q$LibreTranslate is a free, open-source, self-hostable translation API that can run offline, with an optional paid hosted service.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '349b9202-524b-41fb-ba14-33f80aa672b7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '349b9202-524b-41fb-ba14-33f80aa672b7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Self-Hosted Translation API$q$, $q$Deploy your own instance and translate text without relying on external services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Offline Capable$q$, $q$Once language models are downloaded, translation works without an internet connection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Language Auto-Detection$q$, $q$Automatically identifies the source language of submitted text.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$File Translation$q$, $q$Translate documents, not just raw text strings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$REST API$q$, $q$Simple, documented HTTP API for integrating translation into apps and pipelines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Hosted API Option$q$, $q$Managed Pro and Business plans available for teams that don't want to self-host.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Free and fully self-hostable under the AGPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Can run completely offline, keeping data private$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Simple REST API that's easy to integrate$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$No API key required for the free public tier$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Hosted plans available for teams that prefer not to manage infrastructure$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Translation quality can lag behind large commercial engines like Google Translate or DeepL for some language pairs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Self-hosting requires downloading models and provisioning compute$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Free public tier is rate-limited (roughly 20 requests/minute, 2,000-character limit)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Supports fewer languages than major commercial translation APIs$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Is LibreTranslate free?$q$, $q$Yes, the software is free and open source, and you can self-host it at no cost. A free, rate-limited public API is also available without an API key.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Can LibreTranslate run offline?$q$, $q$Yes, once you download the language models, a self-hosted instance can translate without an internet connection.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$What does the hosted API cost?$q$, $q$The managed LibreTranslate portal offers a Pro plan around $29/month and a Business plan around $58/month, with custom pricing available for higher volumes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$What license is LibreTranslate under?$q$, $q$LibreTranslate is released under the AGPLv3 license.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Privacy-sensitive translation$q$, $q$Translate documents on your own infrastructure without sending text to third-party servers.$q$, $q$Privacy-conscious developers and regulated industries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Air-gapped or offline apps$q$, $q$Provide translation capability in environments without internet access.$q$, $q$Enterprises and government/regulated teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Budget-friendly translation API$q$, $q$Avoid per-call costs of commercial translation APIs by self-hosting.$q$, $q$Indie developers and startups$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full API access","Offline capable","Unlimited use on your own infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Free Hosted Tier$q$, $q$$0$q$, $q$N/A$q$, $q$["No API key required","Rate-limited (~20 requests/minute)","2,000 character limit per request"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Pro$q$, $q$$29/month$q$, $q$monthly$q$, $q$["Hosted API access","Higher rate limits"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$Business$q$, $q$$58/month$q$, $q$monthly$q$, $q$["Hosted API access","Higher rate limits than Pro"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LibreTranslate is a free and open-source machine translation API, powered by the Argos Translate engine, that can be self-hosted and run entirely offline once its language models are downloaded. It supports translating text and files across a range of languages via a simple JSON API.$q$, $q$For teams that don't want to manage their own infrastructure, a hosted API is available through the LibreTranslate portal on Pro and Business plans, alongside a free, rate-limited public endpoint that doesn't require an API key.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LibreTranslate fits developers and organizations that need translation capability without sending text to third-party cloud services — for example, apps handling sensitive documents, air-gapped environments, or products that want to avoid recurring API costs by self-hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('349b9202-524b-41fb-ba14-33f80aa672b7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LubeLogger ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, self-hosted vehicle maintenance and fuel mileage tracker with reminders, reports, and multi-vehicle support.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LubeLogger is a free, self-hosted vehicle maintenance and fuel mileage tracker with reminders, reports, and an open API.$q$,
  og_description = $q$LubeLogger is a free, self-hosted vehicle maintenance and fuel mileage tracker with reminders, reports, and an open API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '270d9194-a92c-41d2-84b2-40be25395e12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '270d9194-a92c-41d2-84b2-40be25395e12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Service Record Tracking$q$, $q$Log maintenance work with attached documents such as invoices and receipts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Fuel Mileage Tracking$q$, $q$Track fuel economy in MPG, L/100km, and other measurement standards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Maintenance Reminders$q$, $q$Set alerts based on calendar date or odometer reading.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Planner$q$, $q$Organize upcoming maintenance to-do items by status, priority, and type.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Spending Dashboard$q$, $q$Visualize expenses by timeframe and category.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$CSV Import/Export & API$q$, $q$Move data in and out of LubeLogger and integrate with other tools.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Detailed multi-vehicle maintenance and fuel history$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Flexible reminders based on date or mileage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Document attachments keep invoices and receipts with each record$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$CSV and API support for data portability$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Requires self-hosting knowledge (e.g. Docker) to deploy$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$No official native mobile app, only a web interface$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$No built-in cloud backup — you're responsible for backing up your own instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Is LubeLogger free?$q$, $q$Yes, LubeLogger is free, open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Can I track more than one vehicle?$q$, $q$Yes, LubeLogger supports tracking multiple vehicles and multiple users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Does LubeLogger have a mobile app?$q$, $q$There is no dedicated native app; LubeLogger is accessed through a web browser, which works on mobile devices too.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Can I try LubeLogger before installing it?$q$, $q$Yes, a demo with test credentials is available to explore before deploying your own instance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Personal vehicle maintenance logging$q$, $q$Track service history, fuel economy, and expenses for a car or motorcycle.$q$, $q$Individual vehicle owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$Small fleet record-keeping$q$, $q$Centralize maintenance records for multiple vehicles with multi-user access.$q$, $q$Small fleet operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$DIY maintenance documentation$q$, $q$Attach invoices and receipts to a running record of self-performed work.$q$, $q$DIY mechanics and hobbyists$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$LubeLogger is a self-hosted, open-source vehicle maintenance and fuel mileage tracker. It lets owners log service work with attached invoices or receipts, track fuel economy across multiple measurement standards, and set reminders based on either date or odometer reading.$q$, $q$A dashboard visualizes spending by timeframe and category, and a built-in planner organizes upcoming to-do items by status, priority, and type. Data can be exported and imported via CSV, and an API is available for custom integrations, all running on infrastructure you control.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$LubeLogger suits vehicle owners who want a detailed, private maintenance history instead of relying on a third-party app or a paper logbook. It also works for small fleets or multi-vehicle households that want centralized records with multi-user access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('270d9194-a92c-41d2-84b2-40be25395e12', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── mosparo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, self-hosted spam protection for web forms that filters submissions by content instead of using CAPTCHA puzzles.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$mosparo is a free, self-hosted, accessible spam protection system for web forms that avoids CAPTCHA puzzles.$q$,
  og_description = $q$mosparo is a free, self-hosted, accessible spam protection system for web forms that avoids CAPTCHA puzzles.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f23f15f9-2364-493f-94fb-df321638df83';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f23f15f9-2364-493f-94fb-df321638df83' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Content-Based Spam Filtering$q$, $q$Analyzes actual form submission content rather than requiring a CAPTCHA challenge.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Accessibility-Friendly$q$, $q$Works with screen readers and supports mouse, keyboard, and touch input without puzzles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Privacy-Focused Data Handling$q$, $q$Only uses submitted form data plus IP address and user agent, with automatic hashing/encryption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Customizable Widget$q$, $q$The protection widget's appearance can be adapted to match a site's design.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Automatic Data Deletion$q$, $q$Form submission data is automatically deleted after 14 days.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Self-Hosted Deployment$q$, $q$Runs on your own infrastructure, including via Docker.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$No CAPTCHA puzzles for legitimate visitors to solve$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Strong accessibility support for screen-reader users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Privacy-focused with short, automatic data retention$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Free and self-hosted, giving full control over form data$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Widget design can be customized to match your site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Requires self-hosting and ongoing maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Smaller, newer project compared to established anti-spam services$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Needs manual integration into existing forms or CMS platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Is mosparo free to use?$q$, $q$Yes, mosparo is free and open source; you self-host it on your own infrastructure.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$How is mosparo different from a CAPTCHA?$q$, $q$Instead of making users solve a puzzle, mosparo checks the actual content of a form submission, similar to how an email spam filter works.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$What data does mosparo store?$q$, $q$It uses only the data entered into the form plus the IP address and user agent, which are automatically hashed or encrypted, and deletes submission data after 14 days.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Can mosparo be self-hosted with Docker?$q$, $q$Yes, mosparo supports Docker-based deployment on standard web hosting infrastructure.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$CAPTCHA-free contact forms$q$, $q$Block spam on contact and signup forms without making visitors solve puzzles.$q$, $q$Website owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Accessible form protection$q$, $q$Provide spam filtering that remains usable for screen-reader and assistive-technology users.$q$, $q$Agencies building accessible sites$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$Privacy-first spam filtering$q$, $q$Avoid sending form data to third-party CAPTCHA providers by self-hosting spam protection.$q$, $q$Privacy-focused organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$mosparo is a self-hosted spam protection system for web forms. Rather than asking users to solve a CAPTCHA challenge, it checks the actual content submitted through a form — comparable to how an email spam filter works — using only the entered data plus the IP address and user agent, which are automatically hashed or encrypted.$q$, $q$The widget's design can be customized to match the look of the site it's embedded in, and submitted form data is automatically deleted after 14 days. mosparo is free, open source, and designed to be accessible to screen-reader users and anyone using a mouse, keyboard, or touch input.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$mosparo fits website owners and developers who want to block spam on contact, signup, or comment forms without burdening legitimate visitors with CAPTCHA puzzles, and who prefer to self-host their spam-filtering infrastructure rather than depend on a third-party service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f23f15f9-2364-493f-94fb-df321638df83', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Neko ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted virtual browser in Docker that streams a shared, remote browsing session over WebRTC with low latency.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Neko is a free, self-hosted virtual browser that streams a shared, low-latency browsing session over WebRTC via Docker.$q$,
  og_description = $q$Neko is a free, self-hosted virtual browser that streams a shared, low-latency browsing session over WebRTC via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e9197c5d-03b9-4574-a2ba-90f4d26880a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e9197c5d-03b9-4574-a2ba-90f4d26880a9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$WebRTC Streaming$q$, $q$Streams the browser interface and audio with near real-time latency, typically under 300ms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Multi-Participant Control$q$, $q$Multiple people can join a session and share or hand off browser control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Live Broadcasting$q$, $q$Stream the session directly to platforms like Twitch and YouTube via RTMP.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Persistent or Throwaway Sessions$q$, $q$Choose sessions that persist across devices, or isolated sessions with no retained history, cookies, or cache.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Jump Host Capability$q$, $q$Use Neko as a browser-based gateway to reach internal network resources remotely.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Browser Automation Support$q$, $q$Compatible with automation tools like Playwright and Puppeteer.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$True shared control for real-time browser collaboration$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Low-latency WebRTC streaming (under ~300ms)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Disposable sessions leave no local trace on the client device$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Can double as a jump host for reaching internal resources$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Free, open source, and self-hosted via Docker$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Requires self-hosting infrastructure and Docker familiarity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Runs a full browser instance per session, which is resource-intensive$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$No official managed hosting option$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Networking and authentication setup can be complex for some use cases$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Is Neko free to use?$q$, $q$Yes, Neko is free, open-source software that you self-host, typically via Docker.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$What is Neko used for?$q$, $q$It's used for shared remote browsing, collaborative debugging, live-streaming a browser session, and privacy-isolated browsing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Can multiple people control the browser at once?$q$, $q$Multiple participants can join a session, with the host able to manage who has control.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Does Neko keep my browsing history?$q$, $q$You can run isolated, throwaway sessions with no retained history, cookies, or cache, or persistent sessions if you prefer.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Remote pair debugging$q$, $q$Share a live browser session with teammates to debug or demo something together.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Live browser broadcasting$q$, $q$Stream a shared browsing or watch-party session to Twitch or YouTube.$q$, $q$Streamers and educators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Isolated privacy browsing$q$, $q$Run disposable browser sessions that leave no trace on the local device.$q$, $q$Privacy-conscious users$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$Internal network jump host$q$, $q$Access internal web resources remotely through a browser running inside the network.$q$, $q$IT and network administrators$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Neko is a self-hosted virtual browser that runs inside a Docker container and streams its interface to participants over WebRTC, with latency of roughly 300ms or less. Multiple people can join the same session and take turns controlling the browser, making it useful for real-time collaboration.$q$, $q$Sessions can either persist across devices or be run as throwaway, isolated instances with no history, cookies, or cache retained locally. Because only video and audio are streamed to participants, the underlying browsing activity and network access stay on the server, which also lets Neko act as a jump host into internal resources or as a live broadcast source for platforms like Twitch and YouTube.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Neko fits developers pairing on debugging sessions, educators or streamers who want to broadcast a shared browser, teams needing a remote jump-host browser for internal resources, and privacy-conscious users who want disposable, local-trace-free browsing sessions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9197c5d-03b9-4574-a2ba-90f4d26880a9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OmniTools ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, ad-free collection of everyday web tools for images, PDFs, text, and data, processed entirely client-side.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OmniTools is a free, self-hosted collection of image, PDF, text, and data utilities that process files entirely client-side.$q$,
  og_description = $q$OmniTools is a free, self-hosted collection of image, PDF, text, and data utilities that process files entirely client-side.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea56c01c-6b17-4ccc-b7b7-0f3ee6227368';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea56c01c-6b17-4ccc-b7b7-0f3ee6227368' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Client-Side Processing$q$, $q$Files are processed entirely in the browser and never uploaded to a server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Image, Video & Audio Tools$q$, $q$Convert and manipulate common media formats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$PDF Tools$q$, $q$Perform everyday PDF operations without third-party services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Data Format Utilities$q$, $q$Work with JSON, CSV, XML, and other structured data formats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Lightweight Docker Image$q$, $q$Deploys from a roughly 28MB Docker image for fast, simple self-hosting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$No Ads or Tracking$q$, $q$The self-hosted app runs without advertising or usage tracking.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Extremely lightweight and fast to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Strong privacy since file processing happens client-side$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Wide variety of everyday utilities in a single app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Free, open source (MIT licensed), no ads or tracking$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Simple one-command Docker deployment$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Requires self-hosting; no official hosted version for privacy-sensitive use is highlighted$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Tool depth varies by category compared to dedicated single-purpose apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Younger project with a smaller community than long-established tool sites$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Is OmniTools free?$q$, $q$Yes, OmniTools is free and open source, licensed under MIT, and self-hosted via Docker.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Do my files ever leave my device?$q$, $q$No, OmniTools processes files entirely on the client side, so nothing is uploaded to a server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$What kinds of tools are included?$q$, $q$OmniTools includes image, video, audio, PDF, text, math, date/time, and data-format (JSON/CSV/XML) utilities.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$How do I install OmniTools?$q$, $q$It can be deployed with a single Docker command using the official iib0011/omni-tools image.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Private everyday conversions$q$, $q$Convert images, PDFs, and data formats without uploading files to a public website.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Internal team utility suite$q$, $q$Self-host a shared toolbox of common utilities for a team instead of relying on ad-heavy public sites.$q$, $q$Small teams and sysadmins$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$Developer everyday tooling$q$, $q$Quickly convert or inspect JSON, CSV, and other data formats during development.$q$, $q$Developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OmniTools is a self-hosted collection of web-based utilities covering everyday tasks such as image, video, and audio conversion, PDF manipulation, and text and data-format helpers for formats like JSON, CSV, and XML. All processing happens on the client side, so files never leave the user's device.$q$, $q$The project ships as a lightweight Docker image (around 28MB), making it fast and simple to self-host, and it includes no ads or tracking. It's maintained as an open-source project under the MIT license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OmniTools fits developers, sysadmins, and privacy-conscious users who want a self-hosted alternative to the many ad-heavy public 'online tool' websites, especially for teams that want an internal, always-available utility suite without sending files to third-party servers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea56c01c-6b17-4ccc-b7b7-0f3ee6227368', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Open-Meteo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source weather API offering free non-commercial forecasts and historical data from 15+ national weather services.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (up to 10,000 non-commercial calls/day); commercial plans from $29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Open-Meteo is an open-source weather API with a free non-commercial tier, deep historical data since 1940, and paid commercial plans.$q$,
  og_description = $q$Open-Meteo is an open-source weather API with a free non-commercial tier, deep historical data since 1940, and paid commercial plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$30+ Weather Models$q$, $q$Aggregates data from 15+ national meteorological services with resolutions from 1-2 km to 9-11 km.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Historical Weather Archive$q$, $q$ERA5 reanalysis data back to January 1940, hourly and spatially complete.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$No API Key for Free Tier$q$, $q$Non-commercial use requires only a simple HTTP GET request, no authentication.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Multiple Output Formats$q$, $q$Returns data as JSON, CSV, or XLSX.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Frequent Model Updates$q$, $q$Global models refresh roughly every 6 hours; regional models update every 1-3 hours.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Self-Hostable Codebase$q$, $q$Open-source under AGPLv3, allowing organizations to run their own instance.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$No authentication needed for free, non-commercial use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Combines many national weather models into one API$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Deep historical archive going back to 1940$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Self-hostable for unlimited or air-gapped use$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Simple HTTP GET interface, easy to integrate$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Free tier is capped at 10,000 calls/day and limited to non-commercial use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Commercial use requires a paid subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Self-hosting the full model pipeline needs significant storage and compute$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Attribution is required under the CC BY 4.0 data license$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Is Open-Meteo free?$q$, $q$Yes, for non-commercial use up to 10,000 API calls per day, no API key is required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Can I use Open-Meteo commercially?$q$, $q$Yes, via paid Standard, Professional, or Enterprise plans that include a dedicated endpoint and commercial license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Can I self-host Open-Meteo?$q$, $q$Yes, the codebase is open source under AGPLv3 and can be self-hosted for unlimited or air-gapped use.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$How far back does historical data go?$q$, $q$Historical data via ERA5 reanalysis is available from January 1940 onward.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Weather features in apps$q$, $q$Add forecast data to apps or websites without API-key friction for non-commercial use.$q$, $q$Indie developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Climate and ML research$q$, $q$Pull long historical weather archives for research or model training.$q$, $q$Researchers and ML engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Commercial weather services$q$, $q$Use dedicated, paid endpoints for production weather applications.$q$, $q$Commercial weather product teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Free$q$, $q$Free$q$, $q$N/A$q$, $q$["Up to 10,000 calls/day","Non-commercial use only","No API key required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Standard$q$, $q$$29/month$q$, $q$monthly$q$, $q$["1,000,000 calls/month","Dedicated endpoint","Commercial use license"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Professional$q$, $q$Contact for pricing$q$, $q$monthly$q$, $q$["5,000,000 calls/month","Dedicated endpoint","Commercial use license"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$Enterprise$q$, $q$Contact for pricing$q$, $q$custom$q$, $q$["50,000,000+ calls/month","Dedicated support","Custom terms"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Open-Meteo is an open-source weather API that combines more than 30 weather models from over 15 national meteorological services — including ECMWF, NOAA, DWD, and Météo-France — into a single, simple HTTP GET interface that requires no authentication for non-commercial use.$q$, $q$It also provides deep historical weather data via ERA5 reanalysis dating back to January 1940, with output available in JSON, CSV, or XLSX formats. The codebase is open source under AGPLv3, so organizations can self-host their own instance for unlimited calls, air-gapped environments, or high-volume machine learning workloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Open-Meteo fits developers who want weather data in a hobby or non-commercial project without API-key setup, plus researchers, climate scientists, and machine learning engineers who need a long historical weather archive. Commercial weather applications can use paid plans with dedicated endpoints and a commercial license.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd709a3d-fa5f-4189-82f4-95c1e1fdb2f0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── OpenReader ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable text-to-speech reader that turns EPUB, PDF, DOCX, and other documents into synced read-along audio.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenReader is a free, open-source, self-hostable TTS reader that turns EPUB, PDF, and DOCX files into synced read-along audio.$q$,
  og_description = $q$OpenReader is a free, open-source, self-hostable TTS reader that turns EPUB, PDF, and DOCX files into synced read-along audio.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f47d23ca-0f56-4a32-b7b9-20cfb7465b77';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f47d23ca-0f56-4a32-b7b9-20cfb7465b77' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Multilingual Read-Along TTS$q$, $q$Reads documents aloud with synchronized, language-aware highlighting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Broad Format Support$q$, $q$Works with EPUB, PDF, DOCX, TXT, and Markdown files.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Layout-Aware PDF Parsing$q$, $q$Detects structured blocks and stitches content across pages for accurate reading order.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Word-Level Highlighting$q$, $q$Synchronizes highlighting with audio playback for precise read-along tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Multi-Provider TTS$q$, $q$Use self-hosted TTS engines (Kokoro-FastAPI, KittenTTS-FastAPI, Orpheus-FastAPI) or cloud APIs (OpenAI, Replicate, DeepInfra).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Audiobook Export$q$, $q$Export a document's narration as an audio file for offline listening.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Can run with fully self-hosted, local TTS engines for privacy$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Supports multiple document formats in one reader$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Synchronized highlighting aids accessibility and focus$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Flexible: bring your own TTS provider, local or cloud$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Free and open source$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$High-quality self-hosted TTS engines may need a GPU or significant compute$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Setup requires configuring a TTS backend rather than a single-click install$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Community-maintained project with no dedicated commercial support$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Cloud TTS providers (OpenAI, Replicate, DeepInfra) incur their own usage costs if used$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Is OpenReader free?$q$, $q$Yes, OpenReader is free and open source, and can be self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$What file formats does OpenReader support?$q$, $q$It supports EPUB, PDF, DOCX, TXT, and Markdown documents.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Do I need an OpenAI API key?$q$, $q$No, OpenReader can run entirely with self-hosted TTS engines like Kokoro-FastAPI, though it also supports cloud providers such as OpenAI if you prefer.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Can OpenReader run fully offline?$q$, $q$Yes, when paired with a self-hosted TTS backend, OpenReader can operate without any external cloud calls.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Accessible reading support$q$, $q$Provide synchronized read-along audio for users with dyslexia or visual impairments.$q$, $q$Accessibility-focused users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Private audiobook creation$q$, $q$Convert personal ebooks and PDFs into audio using self-hosted TTS engines.$q$, $q$Self-hosters and privacy-conscious readers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$Document-to-audio workflows$q$, $q$Turn long documents like reports or research papers into audio for hands-free consumption.$q$, $q$Researchers and professionals$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenReader is an open-source document reader that turns EPUB, PDF, DOCX, TXT, and Markdown files into a synchronized read-along experience with multilingual text-to-speech and word-level highlighting. It uses layout-aware PDF parsing to preserve document structure and can export finished audio as an audiobook.$q$, $q$It supports multiple text-to-speech providers, including self-hosted, OpenAI-compatible TTS servers such as Kokoro-FastAPI and Orpheus-FastAPI, as well as cloud APIs like OpenAI, Replicate, and DeepInfra — so users can choose between a fully local, private setup or a cloud-based one.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenReader is well suited to people who benefit from read-along audio, such as those with dyslexia or visual impairments, and to self-hosters who want a private alternative to commercial text-to-speech reading apps for converting ebooks and PDFs into audio.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f47d23ca-0f56-4a32-b7b9-20cfb7465b77', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OpenZiti ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source zero trust networking platform that secures services by identity instead of IP address, sponsored by NetFoundry.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenZiti is a free, open-source zero trust networking platform that secures services by identity, sponsored by NetFoundry.$q$,
  og_description = $q$OpenZiti is a free, open-source zero trust networking platform that secures services by identity, sponsored by NetFoundry.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Identity-Based Access Control$q$, $q$Grants access based on cryptographic identity rather than IP address or network location.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Invisible Services$q$, $q$Protected services are not discoverable through normal network scans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$End-to-End Encryption$q$, $q$Uses libsodium-based cryptography to secure all traffic in transit.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Private, Authenticated DNS$q$, $q$Resolves service names to secure tunnels rather than exposing public IPs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Embedded SDKs$q$, $q$Lets developers build zero trust access directly into applications (ZTAA).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Tunneler-Based Access$q$, $q$Provides zero trust host access (ZTHA) for existing apps without code changes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Genuine identity-based zero trust model, not just VPN rules on top of IP addresses$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Fully open source with an active GitHub community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$SDKs allow embedding zero trust directly into applications$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Multiple deployment models fit different levels of application integration$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Backed by NetFoundry with optional commercial support and managed hosting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Steeper learning curve than plug-and-play consumer VPN tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Production deployments often benefit from NetFoundry's paid support or managed tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Full protection requires embedding SDKs or deploying tunnelers across your environment$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Self-hosting the full control plane requires networking and security expertise$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Is OpenZiti free?$q$, $q$Yes, the OpenZiti open-source project is free to self-host. NetFoundry also offers paid managed and commercially supported self-hosted options.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Who maintains OpenZiti?$q$, $q$OpenZiti is an open-source project sponsored by NetFoundry.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$What's the difference between ZTAA, ZTHA, and ZTNA?$q$, $q$ZTAA embeds zero trust directly into applications via SDK for the strongest security, ZTHA uses tunnelers for host-level access in existing production environments, and ZTNA covers network-level access when apps or hosts can't be modified.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Does OpenZiti replace a VPN?$q$, $q$It's designed to replace traditional IP-based VPN and firewall models with an identity-based zero trust approach, rather than simply tunneling traffic like a conventional VPN.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Zero trust VPN replacement$q$, $q$Replace traditional site-to-site or remote-access VPNs with identity-based zero trust access.$q$, $q$Network and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Application-embedded zero trust$q$, $q$Build zero trust access directly into an application using OpenZiti SDKs.$q$, $q$Application developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$Hiding internal services$q$, $q$Make internal services invisible to network scanners and unauthorized access attempts.$q$, $q$Security engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$OpenZiti is an open-source zero trust networking platform that replaces traditional IP-based network security with identity-based access control, encrypting all traffic end-to-end with libsodium-based cryptography. Services protected by OpenZiti can become effectively invisible on the network, resolved only through an authenticated private DNS rather than a public IP address.$q$, $q$The project offers flexible deployment models: embedding zero trust directly into applications via SDKs for the strongest security, using tunnelers for host-level zero trust access in existing environments, or covering network-level access where apps and hosts can't be modified. OpenZiti is sponsored by NetFoundry, which also offers managed and commercially supported self-hosted options built on the same open-source project.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OpenZiti fits engineering and security teams looking to replace or augment traditional VPNs with a true zero trust model, and developers who want to embed zero trust access directly into their applications through an SDK rather than relying solely on network-level tunneling.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1dbc0d6c-8ba8-4f49-aeb1-c6dcd71d5cfe', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Operational.co ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source event tracker that sends push notifications and can trigger actions when important product events happen.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted, or 10,000 events/month free on the hosted cloud)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Operational.co is an open-source event tracker that sends push notifications and triggers webhooks for critical events in your product.$q$,
  og_description = $q$Operational.co is an open-source event tracker that sends push notifications and triggers webhooks for critical events in your product.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '324cb4c8-ccb6-493d-82c4-2a69fa15670f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '324cb4c8-ccb6-493d-82c4-2a69fa15670f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Live event timeline$q$, $q$See operational events — signups, cancellations, webhook receipts, cron runs — as they happen in a chronological feed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Push notifications$q$, $q$Receive instant alerts for critical events on the Operational mobile/web app rather than checking dashboards manually.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Action buttons$q$, $q$Trigger a webhook directly from an event notification to kick off a follow-up workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Event chaining$q$, $q$Link related events together so multi-step workflows and user paths can be understood as a single sequence.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$JSON logging$q$, $q$Log structured JSON payloads alongside events for easier debugging and audit trails.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Self-hosting$q$, $q$Deploy Operational yourself with Docker (or on Render.com) instead of using the hosted cloud version.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Fully open source (AGPL-3.0) with a self-hosted option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Free tier on the hosted cloud (10,000 events/month)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Focused on operational events rather than generic product analytics, so signal is high$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Push notifications keep founders informed without a dashboard habit$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Built and battle-tested by the team on their own production apps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Small, young project with a limited feature set compared to full observability platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Detailed hosted pricing tiers are not published on the public pricing page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Best suited to solo founders/small teams rather than large engineering organizations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Is Operational.co free?$q$, $q$Yes. The software is open source (AGPL-3.0) and free to self-host. The hosted cloud version also includes a free tier of 10,000 events per month before usage-based billing applies.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Can I self-host Operational?$q$, $q$Yes, the project provides Docker images and guides for self-hosting, including deployment on Render.com.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$What kind of events does it track?$q$, $q$Any operational event you send via its API — signups, payments, failed logins, cron job runs, webhook receipts, and similar backend occurrences.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Does it replace product analytics tools?$q$, $q$No, it's designed as a complement — it focuses on operational alerting rather than user behavior analytics or funnels.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Backend event alerting$q$, $q$Get push notifications the moment a critical backend event occurs, like a failed payment or a cron job error.$q$, $q$Indie developers and solo founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Workflow triggers from alerts$q$, $q$Use action buttons on event notifications to fire a webhook and continue a workflow without opening a dashboard.$q$, $q$Small engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, $q$["Full source code (AGPL-3.0)","Docker deployment","Unlimited events"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$Hosted cloud (free tier)$q$, $q$Free$q$, $q$monthly$q$, $q$["Up to 10,000 events/month","No credit card required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Operational.co is an open-source event tracking tool built for founders and small engineering teams who want visibility into what's happening inside their product without setting up a full analytics stack. Rather than tracking pageviews or funnels, it focuses on discrete operational events — a new signup, a failed webhook, a cron job finishing, a payment notification — and surfaces them on a live timeline.$q$, $q$The project was built by the team behind Swipekit, who use Operational internally to monitor their own production systems, and it now runs both as a hosted cloud service and as self-hosted software you deploy with Docker or on platforms like Render.com.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Operational is aimed at indie developers and small SaaS teams who want push notifications on their phone or desktop when something important happens in their backend, and who want the option to trigger a webhook-based action directly from that alert.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('324cb4c8-ccb6-493d-82c4-2a69fa15670f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── POMjs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, dependency-free random password generator built in HTML and pure JavaScript with no trackers or cookies.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Swedish$q$, $q$German$q$, $q$Hungarian$q$, $q$Dutch$q$, $q$French$q$, $q$Finnish$q$]::text[],
  seo_meta_description = $q$POMjs is a free, open-source, dependency-free random password generator built in pure HTML and JavaScript with no cookies or trackers.$q$,
  og_description = $q$POMjs is a free, open-source, dependency-free random password generator built in pure HTML and JavaScript with no cookies or trackers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd83a1349-8ab9-4eea-8c4f-73b628234bab';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd83a1349-8ab9-4eea-8c4f-73b628234bab' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Client-side generation$q$, $q$Passwords are generated entirely in the browser with pure JavaScript — nothing is sent to a server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$No cookies or trackers$q$, $q$The tool loads no external scripts, analytics, or tracking code of any kind.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Multi-language interface$q$, $q$Available in English, Swedish, German, Hungarian, Dutch, French, and Finnish.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Easy to self-host$q$, $q$As a static HTML/JS project, it can be dropped onto any web server or personal domain in minutes.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Fully open source and auditable (GPLv2)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$No cookies, tracking, or external calls$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Extremely lightweight and simple to deploy$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Available in seven languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Very narrow scope — a password generator only, not a full password manager$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$No built-in storage/vault, browser extension, or mobile app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Minimal documentation and small maintainer community$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Does POMjs store my passwords?$q$, $q$No, it only generates passwords client-side in the browser; it has no storage or vault feature.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Is POMjs free to use?$q$, $q$Yes, it's free and open source under the GPLv2 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Can I run my own copy of POMjs?$q$, $q$Yes, the source is on GitHub (joho1968/POMjs) and, being static HTML/JS, is straightforward to host on your own domain.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$Quick, private password generation$q$, $q$Generate a strong random password without sending any data to a third-party server.$q$, $q$Privacy-conscious individuals and self-hosters$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$POMjs is a small, single-purpose random password generator written entirely in HTML and vanilla JavaScript by developer Joaquim Homrighausen. It loads no external resources, includes no analytics or cookies, and runs entirely client-side in the browser, making it easy to self-host as a static page or run from a personal server.$q$, $q$The project has been translated into several languages and is licensed under the GPLv2, with source code available on GitHub for anyone who wants to inspect, modify, or host their own copy.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It suits privacy-conscious users and self-hosters who want a lightweight, auditable password generator they fully control, rather than relying on a third-party website or browser extension.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d83a1349-8ab9-4eea-8c4f-73b628234bab', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── re:Director ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted redirect manager that lets you connect any domain and set up custom URL redirects in seconds.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$re:Director is a free, open-source, self-hosted tool for managing custom URL redirects across multiple domains via Docker.$q$,
  og_description = $q$re:Director is a free, open-source, self-hosted tool for managing custom URL redirects across multiple domains via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff286dd5-38ce-4dba-930e-50e4da2c4d62';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff286dd5-38ce-4dba-930e-50e4da2c4d62' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Multi-domain redirect management$q$, $q$Connect multiple domains and manage all their redirect rules from one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Configurable HTTP status codes$q$, $q$Choose between 301, 302, 307, and 308 redirects per rule.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Pause and resume redirects$q$, $q$Temporarily disable a redirect without deleting its configuration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Advanced filtering$q$, $q$Filter and organize redirects by source, target, or status to manage large redirect sets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Dockerized deployment$q$, $q$Ships as a Docker container with no external database dependency, simplifying self-hosting.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Free and open source under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Simple Docker deployment with no external database required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Supports multiple redirect status codes (301/302/307/308)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Dark mode and mobile-friendly interface$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Requires self-hosting and Docker familiarity — no official hosted version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Smaller community/project compared to established redirect and link-management SaaS tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Limited public documentation on advanced configuration and scaling$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Is re:Director free?$q$, $q$Yes, it's free and open source under the Apache License 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$How do I deploy re:Director?$q$, $q$It runs as a Docker container and doesn't require a separate external database, so it can be deployed with a single Docker command.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$What redirect types does it support?$q$, $q$It supports 301, 302, 307, and 308 HTTP redirect status codes.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Centralized redirect management$q$, $q$Manage redirect rules for many domains from one self-hosted dashboard instead of editing web server configs individually.$q$, $q$Developers and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$Campaign link routing$q$, $q$Set up and pause time-boxed marketing redirects without touching production DNS or server config.$q$, $q$Marketers and site owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$re:Director is an open-source, self-hosted platform for managing URL redirects across multiple domains from a single dashboard. It's distributed as a Docker container and doesn't require an external database, so it can be stood up quickly on any Docker-capable host.$q$, $q$The project is licensed under the Apache License 2.0 and provides a responsive web interface — including dark mode — for creating, filtering, pausing, and resuming redirects.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's built for developers, marketers, and site owners who manage link redirects across several domains and want a centralized, self-hosted alternative to link-shortener or redirect SaaS products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff286dd5-38ce-4dba-930e-50e4da2c4d62', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Reactive Resume ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, privacy-focused resume builder that can be used online or self-hosted with Docker.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Reactive Resume is a free, open-source resume builder with multiple templates, PDF export, and self-hosting via Docker.$q$,
  og_description = $q$Reactive Resume is a free, open-source resume builder with multiple templates, PDF export, and self-hosting via Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '537f4377-d765-4451-9d22-d3ae543d7b4e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '537f4377-d765-4451-9d22-d3ae543d7b4e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Multiple resume templates$q$, $q$Choose from a set of built-in templates and customize layout, colors, and typography.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Structured resume builder$q$, $q$Fill in sections like experience, education, and skills through a guided editor rather than a raw text document.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$PDF export$q$, $q$Export a finished resume as a PDF, generated client-side in current versions without needing an external print service.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Shareable public links$q$, $q$Share a resume via a public URL instead of, or alongside, a downloaded file.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Self-hosting via Docker$q$, $q$Run your own private instance with a documented Docker Compose stack (PostgreSQL, plus optional storage service).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Open-source codebase$q$, $q$Full source available on GitHub, built with React, TypeScript, and PostgreSQL/Drizzle ORM.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Completely free with no paywalled features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Fully open source and self-hostable for full data control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Actively maintained with tens of thousands of GitHub stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Modern, structured editor with multiple resume templates$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Client-side PDF generation in recent versions simplifies self-hosting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Self-hosting requires running PostgreSQL and other services via Docker$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Template selection is smaller than some paid commercial resume builders$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$No official phone apps — web-based only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Is Reactive Resume really free?$q$, $q$Yes, the hosted version at rxresu.me is free to use, and the source code is open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Can I self-host Reactive Resume?$q$, $q$Yes, official Docker-based self-hosting instructions and a Docker Hub image are provided in the documentation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$What does Reactive Resume use for PDF export?$q$, $q$From version 5.1.0 onward, PDF generation runs client-side via @react-pdf/renderer, removing the need for an external Chromium/print service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Who built Reactive Resume?$q$, $q$It was created and is maintained by developer Amruth Pillai, with community contributions on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Building a job-search resume$q$, $q$Create a structured, well-formatted resume using a guided editor and export it as a PDF.$q$, $q$Job seekers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$Private, self-hosted resume data$q$, $q$Run a personal or team instance so resume data never touches a third-party server.$q$, $q$Privacy-conscious users and self-hosters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Reactive Resume, built by developer Amruth Pillai since 2019, is a free and open-source resume builder that lets people create, edit, and share resumes without handing their personal data to a third party. It's available at rxresu.me as a hosted web app, and the full source code can be self-hosted using Docker.$q$, $q$The project emphasizes privacy, portability, and customization: resumes are built from structured data and rendered through a choice of templates, and users can export their finished resume as a PDF or share it via a public link.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Reactive Resume suits job seekers who want a free, ad-free resume builder, as well as privacy-minded users and self-hosters who prefer to run their own instance rather than store resume data on a third-party server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('537f4377-d765-4451-9d22-d3ae543d7b4e', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── revealjs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source HTML presentation framework for building interactive, web-based slide decks with themes and a JavaScript API.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$reveal.js is a free, open-source HTML presentation framework for building interactive, code-driven slide decks in the browser.$q$,
  og_description = $q$reveal.js is a free, open-source HTML presentation framework for building interactive, code-driven slide decks in the browser.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4f61c5d6-c000-4e54-918d-cc68123a94de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4f61c5d6-c000-4e54-918d-cc68123a94de' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Markdown-authored slides$q$, $q$Write slide content in Markdown instead of hand-writing HTML for every slide.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Nested and vertical slides$q$, $q$Organize content into horizontal and vertical slide sequences for branching narratives.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Auto-Animate$q$, $q$Automatically animate matching elements between consecutive slides for smooth transitions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Speaker notes view$q$, $q$A separate speaker view shows notes and a timer alongside the current and next slide.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Code and math support$q$, $q$Built-in syntax-highlighted code blocks and LaTeX/math rendering for technical talks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$PDF export$q$, $q$Export a full presentation to PDF for offline sharing or printing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$JavaScript API and plugins$q$, $q$Extend or control presentations programmatically through an extensive JS API and plugin system.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Completely free, open-source, and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Presentations are plain HTML/Markdown, so they're version-controllable in Git$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Rich built-in features: auto-animate, speaker notes, math, code highlighting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Touch-optimized and works in any modern browser$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Large, long-running open-source community (maintained since 2011)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Requires comfort with HTML/CSS/Markdown — no built-in visual editor (that's the separate paid Slides.com)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Design customization requires CSS knowledge for a polished look$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$No native desktop or mobile app — purely web-based$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Is reveal.js free?$q$, $q$Yes, reveal.js itself is free and open source. Slides.com, a separate paid visual editor built on reveal.js, is optional.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Do I need to know how to code to use reveal.js?$q$, $q$Basic HTML or Markdown knowledge is enough to build a presentation; JavaScript is only needed for custom behavior or plugins.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Can I export a reveal.js presentation to PDF?$q$, $q$Yes, reveal.js includes built-in PDF export support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Who maintains reveal.js?$q$, $q$It was created by Hakim El Hattab in 2011 and continues to be maintained by him and the open-source community on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Conference and tech talks$q$, $q$Build code-embedded, version-controlled slide decks for developer presentations.$q$, $q$Developers and conference speakers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$Interactive web-based decks$q$, $q$Create presentations that embed live web content, demos, or interactive elements via iframes.$q$, $q$Educators and technical writers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$reveal.js is an open-source HTML presentation framework created by Hakim El Hattab in 2011 and still actively maintained today. It turns standard HTML, CSS, and JavaScript into fully-featured slide decks that run in any web browser, with support for nested/vertical slides, Markdown-authored content, code syntax highlighting, LaTeX/math rendering, and PDF export.$q$, $q$Because presentations are just web pages, they can embed live web content via iframes, be styled with custom CSS, and be extended through a JavaScript API and plugin system. The core framework is free; its creator also offers Slides.com, an optional paid visual editor built on top of reveal.js for people who prefer a GUI over hand-written HTML/Markdown.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$reveal.js is aimed at developers, conference speakers, and technical writers who want version-controllable, code-driven presentations rather than binary slide files, and who are comfortable authoring in HTML or Markdown.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4f61c5d6-c000-4e54-918d-cc68123a94de', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Revive Adserver ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source ad server for managing and delivering display, video, and mobile ad campaigns, with an optional paid hosted edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted download edition); hosted edition from $10/month$q$,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Revive Adserver is a free, open-source ad server for managing display, video, and mobile campaigns, with an optional paid hosted edition.$q$,
  og_description = $q$Revive Adserver is a free, open-source ad server for managing display, video, and mobile campaigns, with an optional paid hosted edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3e449918-7518-479f-8208-8ee3735b2652';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3e449918-7518-479f-8208-8ee3735b2652' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Campaign and inventory management$q$, $q$Manage advertisers, campaigns, banners, websites, and ad zones from a central admin interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Delivery targeting and capping$q$, $q$Set delivery rules including frequency capping, URL targeting, and geo-targeting for campaigns.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Performance statistics$q$, $q$Track impressions, clicks, conversions, CTR, and eCPM across campaigns and zones.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Multi-format ad support$q$, $q$Serve ads across websites, mobile apps, and video players.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Self-hosted or hosted deployment$q$, $q$Run the free download edition on your own servers, or use the paid Revive Adserver Hosted edition.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Free, open-source download edition with full source on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Mature, long-running project (in active development since 2013)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Detailed targeting, frequency capping, and reporting features$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Hosted edition available for teams who don't want to manage infrastructure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Positioned as GDPR-compliant/privacy-friendly ad serving$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Self-hosting the download edition requires server administration and maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Hosted edition pricing is usage-based on top of a monthly minimum, which can add up at scale$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Interface and workflow are dated compared to modern SaaS ad-tech tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Is Revive Adserver free?$q$, $q$The download edition is free and open source. A separate paid hosted edition is also available for those who don't want to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$How much does the hosted edition cost?$q$, $q$Hosted plans start at approximately $10/month for up to 1 million ad requests, with higher tiers (Premium, Super, Ultimate, Elite) for larger volumes, all billed at roughly $0.01 CPM.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$What license does Revive Adserver use?$q$, $q$The self-hosted software is open source, with source code published on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Who maintains Revive Adserver?$q$, $q$It's maintained by Aqua Platform and has been developed as an open-source project since 2013.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$In-house ad serving for publishers$q$, $q$Serve and track ad campaigns directly on your own website without depending on a third-party ad network.$q$, $q$Website publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Ad network campaign management$q$, $q$Manage multiple advertisers, campaigns, and zones with targeting and reporting from a single system.$q$, $q$Ad networks and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Download edition$q$, $q$Free$q$, $q$N/A$q$, $q$["Full self-hosted ad server","Open-source code","Campaign, targeting, and reporting features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Hosted Lite$q$, $q$$10/month$q$, $q$monthly$q$, $q$["Up to 1,000,000 ad requests/month","Managed hosting"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Hosted Premium$q$, $q$$50/month$q$, $q$monthly$q$, $q$["Up to 5,000,000 ad requests/month","Managed hosting"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Hosted Super$q$, $q$$100/month$q$, $q$monthly$q$, $q$["Up to 10,000,000 ad requests/month","Managed hosting"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$Hosted Ultimate$q$, $q$$150/month$q$, $q$monthly$q$, $q$["Up to 15,000,000 ad requests/month","Managed hosting"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Revive Adserver is a free, open-source ad serving platform used by publishers, ad networks, and advertisers to manage and deliver ad campaigns across websites, apps, and video players. It has been maintained since 2013 as a fork of the earlier OpenX Source project and is now developed under the Aqua Platform banner.$q$, $q$The software is available two ways: as a free download you self-host, or as a paid hosted edition (Revive Adserver Hosted) that removes the need to run and maintain the server infrastructure yourself, billed on a per-ad-request basis on top of a monthly plan minimum.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's built for publishers and ad networks who need to run their own ad-serving stack rather than relying solely on third-party ad exchanges, and who want fine-grained control over targeting, inventory, and reporting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e449918-7518-479f-8208-8ee3735b2652', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── SANE Network Scanning ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source SANE (Scanner Access Now Easy) API and daemon that let you share and access scanners over a network.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = 1996,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$SANE is an open-source scanner API and daemon (saned) that lets you share and access image scanners over a network.$q$,
  og_description = $q$SANE is an open-source scanner API and daemon (saned) that lets you share and access image scanners over a network.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bab3c6db-9b5a-484e-b9f3-7c8e256e957e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bab3c6db-9b5a-484e-b9f3-7c8e256e957e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Standardized scanner API$q$, $q$A common API (SANE) that scanning frontends can use regardless of the underlying scanner hardware.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$saned network daemon$q$, $q$Exposes a locally connected scanner to other hosts on the network under access controls defined in saned.conf.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$net backend$q$, $q$Lets client machines connect to a remote scanner shared via saned as though it were a local device.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Broad hardware support$q$, $q$Backend drivers exist for a wide range of flatbed, handheld, and other scanner hardware.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Standard protocol support$q$, $q$Includes backends for modern network scanning protocols such as AirScan/eSCL and WSD.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$scanimage CLI frontend$q$, $q$A command-line frontend for scripting and automating scans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Free, open-source, and public-domain API with decades of active development since 1996$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Lets a single scanner be shared across an entire network without proprietary network-scanner hardware$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Broad backend support for many scanner models$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Supports modern wireless/network scanner protocols (AirScan/eSCL, WSD) alongside legacy backends$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Primarily targets Unix/Linux; Windows support is limited and less officially maintained$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Configuration (saned.conf, net.conf, access controls) is done via text files, not a graphical setup wizard$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$No official web-based UI — it's a system-level API/daemon, not an end-user app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$What does SANE stand for?$q$, $q$Scanner Access Now Easy — an open-source API for accessing image scanners and similar devices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$How does SANE support network scanning?$q$, $q$The saned daemon runs on the host physically connected to the scanner and shares it with permitted network hosts; those clients use SANE's net backend to access it remotely.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Is SANE free?$q$, $q$Yes. The SANE API is public domain, and the reference implementation is released under the GNU GPL.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Does SANE work on Windows?$q$, $q$SANE primarily targets Unix/Linux; Windows support exists through community ports but is not the project's primary focus.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Sharing a single scanner across a network$q$, $q$Connect a scanner to one machine and let other computers on the network scan through it via saned.$q$, $q$Home users and small offices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$Building scanning applications$q$, $q$Use the SANE API as a standardized backend for custom scanning software or frontends like xsane.$q$, $q$Linux developers and sysadmins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$SANE (Scanner Access Now Easy) is an open-source API and set of backend drivers, originally released in 1996, that provides standardized access to image scanners and similar capture devices, primarily on Unix and Linux systems. The SANE API itself is public domain, while the reference implementation is distributed under the GNU GPL.$q$, $q$The 'network scanning' capability referenced here comes from SANE's saned daemon and net backend: saned runs on the machine physically connected to a scanner and exposes it to permitted hosts on the network, while client machines use the net backend to access that remote scanner as if it were local. This lets a single scanner be shared across multiple computers on a network without dedicated network-scanner hardware.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$SANE is aimed at Linux/Unix users, self-hosters, and system administrators who want to share a scanner across a home or office network, or who need a standardized scanning API for building scanning frontends and applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bab3c6db-9b5a-484e-b9f3-7c8e256e957e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── string.is ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Privacy-friendly, open-source online toolkit with over 50 string converters and formatters for developers.$q$,
  pricing_model = $q$Free (open source)$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$string.is is a free, open-source, privacy-friendly toolkit offering 50+ string converters and formatters for developers.$q$,
  og_description = $q$string.is is a free, open-source, privacy-friendly toolkit offering 50+ string converters and formatters for developers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1c713be1-b714-409c-be08-f7969e107f24';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1c713be1-b714-409c-be08-f7969e107f24' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$50+ converters and formatters$q$, $q$A broad library of string transformation utilities covering common developer text-processing needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Privacy-friendly design$q$, $q$Built with a focus on not exposing user-submitted text to unnecessary tracking or third parties.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$No-signup web interface$q$, $q$Use any converter directly in the browser without creating an account.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Open-source codebase$q$, $q$Source code is published publicly, letting users verify how their text is handled.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Large library of over 50 text utilities in one place$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Privacy-conscious design with published security/privacy documentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$No account or signup required to use it$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Limited public information on the underlying team or project history$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$As a general web utility, it may not cover highly specialized or niche string formats$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$No official self-hosting documentation confirmed for running your own instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Is string.is free?$q$, $q$Yes, it's free to use and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Do I need an account to use string.is?$q$, $q$No, converters can be used directly in the browser without signing up.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$How many converters does it offer?$q$, $q$The site describes a collection of over 50 converters and formatters.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$Quick text/string conversion$q$, $q$Convert case, encode/decode, or reformat text snippets during development without leaving the browser.$q$, $q$Developers$q$, 0);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$string.is is an open-source, privacy-friendly web toolkit offering a collection of more than 50 text converters and formatters for developers — things like case conversion, encoding/decoding, hashing, and other everyday string transformations. Rather than trusting text to a proprietary third-party service, the project positions itself around transparency, publishing its source code openly.$q$, $q$It runs entirely as a web-based tool: paste or type text, pick a converter, and get the transformed output immediately, with no signup required.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$It's aimed at developers who regularly need quick, one-off text transformations and prefer a privacy-conscious, open-source tool over closed third-party converter websites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1c713be1-b714-409c-be08-f7969e107f24', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;


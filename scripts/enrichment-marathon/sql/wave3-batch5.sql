-- Enrichment marathon batch: Audacity, Audiobookshelf, Auphonic, Auth0, Authelia, Authentik, auto-mcs, Autodesk Construction Cloud

-- ── Audacity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Audacity is a free, open-source, cross-platform multi-track audio editor and recorder for Windows, macOS, and Linux, maintained by Muse Group.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Audacity: Free Open-Source Audio Editor$q$, seo_title),
  seo_meta_description = COALESCE($q$Audacity is a free, open-source multi-track audio editor and recorder for Windows, macOS, and Linux, built for podcasting, music, and voice editing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Audacity is a free, open-source, cross-platform audio editor and recorder originally created in 1999 by Dominic Mazzoni and Roger Dannenberg at Carnegie Mellon University, first publicly released in 2000, and maintained since 2021 by Muse Group. It runs on Windows, macOS, and Linux and provides multi-track recording and editing, audio conversion and export to formats like WAV, MP3, FLAC, and Ogg, and built-in tools for noise reduction, pitch and speed changing, and compression. It supports VST3, LV2, and Nyquist plugins, extending its capabilities, and offers optional AI-assisted effects (such as music separation, noise suppression, and transcription) through Muse Group's companion Muse Hub. Audacity is licensed under the GNU General Public License v3, meaning its source code is fully open for inspection and modification, and it has always been free to download and use with no paid tiers, subscriptions, or account requirements. It is widely used by podcasters, musicians, voice-over artists, and hobbyists for recording, editing, and restoring audio, and has been downloaded hundreds of millions of times over its history via SourceForge, Google Code, and FossHub. Because it is open source and free, it is a common recommendation for anyone needing a capable, no-cost alternative to commercial digital audio workstations.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Multi-track editing$q$, $q$Record and edit multiple audio tracks simultaneously in a single project.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Plugin support$q$, $q$Extend functionality with VST3, LV2, and Nyquist plugins.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Format export$q$, $q$Export audio to WAV, MP3, FLAC, Ogg, and other common formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Built-in restoration tools$q$, $q$Noise reduction, compressor, pitch changer, speed changer, and vocal remover included by default.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$AI-assisted effects$q$, $q$Optional AI plugins for music separation, noise suppression, and transcription via Muse Hub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Cross-platform desktop app$q$, $q$Native builds available for Windows, macOS, and Linux.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Completely free with no subscription, account, or watermark$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Fully open source under GPLv3, so the code can be audited or modified$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Available on Windows, macOS, and Linux$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Large third-party plugin ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Long-standing, active development and community$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Interface feels dated compared to modern commercial DAWs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$No built-in cloud sync or real-time collaboration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$AI-assisted effects require installing the separate Muse Hub application$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Is Audacity really free?$q$, $q$Yes. Audacity has always been free to download and use, with no paid tiers or subscriptions.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Is Audacity open source?$q$, $q$Yes, it is released under the GNU General Public License v3, and its source code is publicly available.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$What platforms does Audacity support?$q$, $q$Audacity runs natively on Windows, macOS, and Linux.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Does Audacity support plugins?$q$, $q$Yes, it supports VST3, LV2, and Nyquist plugins for extended functionality.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Podcast editing$q$, $q$Recording, cleaning up, and exporting podcast episodes.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Music recording and mixing$q$, $q$Multi-track recording and basic mixing for musicians and hobbyists.$q$, $q$Musicians and home recording enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Voice-over and audio restoration$q$, $q$Cleaning up noisy recordings and preparing voice tracks.$q$, $q$Content creators and voice-over artists$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Audacity$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full access to all recording and editing features","No account or subscription required"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Audacity is a free, open-source multi-track audio editor and recorder available for Windows, macOS, and Linux. It was started in 1999 by Dominic Mazzoni and Roger Dannenberg at Carnegie Mellon University and has been maintained by Muse Group, which also owns MuseScore and Ultimate Guitar, since 2021.$q$, $q$The application is released under the GNU General Public License v3, so its source code remains open for anyone to view, audit, or modify, and it has always been distributed free of charge.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Audacity provides multi-track recording and editing, support for VST3, LV2, and Nyquist plugins, and export to common formats including WAV, MP3, FLAC, and Ogg. It includes built-in tools such as a compressor, noise reduction, pitch and speed changers, and a vocal remover.$q$, $q$Through Muse Group's companion Muse Hub application, Audacity can also access AI-assisted effects for tasks like music source separation, noise suppression, and transcription.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Audacity is used by podcasters, musicians, voice-over artists, educators, and hobbyists who need a capable, no-cost audio editor without a subscription or account. Its plugin support also makes it a base for more advanced audio restoration and mixing workflows.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Audiobookshelf ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Audiobookshelf is a free, open-source, self-hosted media server for organizing and streaming personal audiobook and podcast collections.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Audiobookshelf: Self-Hosted Audiobook Server$q$, seo_title),
  seo_meta_description = COALESCE($q$Audiobookshelf is a free, open-source, self-hosted server for organizing, streaming, and syncing your own audiobook and podcast library.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Audiobookshelf is a free, open-source, self-hosted media server for audiobooks and podcasts, created by developer advplyr starting around 2021 and released under the GPL-3.0 license. Users deploy it on their own infrastructure, commonly via Docker, to organize, stream, and manage a personal audiobook and podcast collection. Core features include multi-user accounts with customizable permissions, per-user listening progress synced across devices, automatic metadata and cover art lookup, chapter editing, podcast discovery with automatic episode downloading, RSS feed generation for both audiobooks and podcasts, scheduled backups, and support for ebook formats including EPUB, PDF, CBR, and CBZ, with the ability to send ebooks to devices like Kindle. It is accessed through a browser-based web client as well as companion Android and iOS apps (in beta) that support offline listening. Because it is fully open source with no paid tiers, Audiobookshelf is aimed at self-hosting enthusiasts, homelab users, and privacy-conscious audiobook and podcast listeners who want full ownership of their media library rather than relying on commercial platforms like Audible. Community translations are maintained via Weblate, and support is available through GitHub and Discord.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Self-hosted audio server$q$, $q$Runs on your own infrastructure, commonly deployed via Docker.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Multi-user support$q$, $q$Multiple accounts with customizable permissions per user.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Cross-device progress sync$q$, $q$Listening progress is tracked and synced across devices per user.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Metadata and cover art lookup$q$, $q$Automatically fetches metadata and artwork from multiple sources.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Podcast auto-download$q$, $q$Discovers podcasts and automatically downloads new episodes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Ebook support$q$, $q$Supports EPUB, PDF, CBR, and CBZ formats, including sending books to devices like Kindle.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Companion mobile apps$q$, $q$Android and iOS apps (beta) with offline listening support.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Completely free and open source with no paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Full ownership and control of your media library via self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Actively developed with a large community (10,000+ GitHub stars)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Supports both audiobooks and podcasts in one server$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Requires self-hosting knowledge (server setup, Docker)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Official mobile apps are still in beta$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$No managed/hosted option is offered by the maintainer directly$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Is Audiobookshelf free?$q$, $q$Yes, it is fully free and open source under the GPL-3.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Do I need to self-host it?$q$, $q$Yes, Audiobookshelf is designed to be self-hosted, most commonly via Docker.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Are there mobile apps?$q$, $q$Yes, companion Android and iOS apps are available and support offline listening, though they are in beta.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$What formats does it support?$q$, $q$Audiobooks and podcasts as audio, plus ebooks in EPUB, PDF, CBR, and CBZ formats.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Personal audiobook library hosting$q$, $q$Self-hosting a private audiobook collection with progress tracking.$q$, $q$Self-hosters and homelab users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Podcast archiving and RSS hosting$q$, $q$Auto-downloading and organizing podcast episodes with custom RSS feeds.$q$, $q$Podcast enthusiasts$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Audiobookshelf$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full self-hosted server functionality","Multi-user support","Web and companion mobile apps"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Audiobookshelf is a free, open-source, self-hosted media server for audiobooks and podcasts. It is developed by advplyr and distributed under the GPL-3.0 license, with source code available on GitHub. Users typically deploy it themselves via Docker on their own server or NAS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The server supports multiple user accounts with customizable permissions, synchronizes listening progress across devices, and automatically looks up metadata and cover art. It can discover and auto-download new podcast episodes, generate RSS feeds for audiobooks and podcasts, and run scheduled backups.$q$, $q$Audiobookshelf also supports ebook formats including EPUB, PDF, CBR, and CBZ, and can send ebooks to devices such as Kindle.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$platforms$q$, $q$Platforms$q$, 2, ARRAY[$q$Access is available through a web browser client, plus companion Android and iOS apps (currently in beta) that support offline listening. The project is commonly deployed via Docker.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Auphonic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Auphonic is an AI-powered audio post-production service that automates leveling, noise reduction, and transcription for podcasts and video.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Graz, Austria$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Auphonic: AI Audio Post-Production Automation$q$, seo_title),
  seo_meta_description = COALESCE($q$Auphonic automates audio post-production for podcasts and video, with noise reduction, leveling, and transcription. Free plan gives 2 hours/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Auphonic is an AI-powered audio post-production platform developed by Auphonic GmbH, founded in 2013 and headquartered in Graz, Austria. It automates professional-quality audio processing for podcasts, videos, audiobooks, and educational content, handling tasks such as noise and reverb reduction, intelligent loudness leveling between speakers and music, filtering and auto-EQ, automatic removal of filler words and silence, multitrack ducking and mic-bleed removal, and loudness normalization to industry broadcast specifications. It also offers speech-to-text transcription with auto-generated chapters, video support with metadata and audiogram creation, and workflow automation through a web interface, API, command-line tool, and watch folders. Auphonic integrates with publishing platforms including YouTube, Libsyn, PodBean, SoundCloud, and RSS.com, and connects with services like Zapier. The free plan provides 2 hours of processed audio per month (with an Auphonic jingle added) with no credit card required; paid plans are sold as recurring monthly credit tiers or one-time, non-expiring credit packs billed by processing hours, with custom business/yearly plans for teams. Auphonic reports over 2 million users, with clients including BBC Radio, iHeartRadio, and MSNBC. It is aimed at podcasters, broadcasters, and audio/video producers who want to automate sound engineering tasks that would otherwise require manual mixing and editing.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Automatic loudness leveling$q$, $q$Balances levels between speakers and music, normalized to industry loudness specifications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Noise and reverb reduction$q$, $q$Cleans up recordings with customizable noise and reverb reduction settings.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Filler word and silence removal$q$, $q$Automatically trims filler words, coughs, and dead air.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Multitrack processing$q$, $q$Ducking and mic-bleed removal across multiple simultaneous tracks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Speech-to-text transcription$q$, $q$Generates transcripts and automatic chapter markers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Publishing integrations$q$, $q$Direct publishing to platforms like YouTube, Libsyn, PodBean, SoundCloud, and RSS.com.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Automation via API/CLI$q$, $q$Watch-folder automation, a command-line tool, and a full API for custom workflows.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Used by major broadcasters including BBC Radio and iHeartRadio$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Strong automation options via API, CLI, and watch folders$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Supports both audio and video, including multitrack workflows$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Free tier is limited to 2 hours per month and adds a jingle to output$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Paid usage is billed by processing hours, requiring some usage estimation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Advanced multitrack and batch features are gated behind paid tiers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Is Auphonic free?$q$, $q$There is a free plan that includes 2 hours of processed audio per month, with paid plans available for more usage.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Who makes Auphonic?$q$, $q$Auphonic GmbH, a company founded in 2013 and based in Graz, Austria.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$What does Auphonic do?$q$, $q$It automates audio post-production tasks like leveling, noise reduction, filler-word removal, and loudness normalization for podcasts and video.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Does Auphonic support video?$q$, $q$Yes, it processes video files and can generate audiograms and metadata.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Podcast post-production automation$q$, $q$Automatically leveling, cleaning, and normalizing podcast episodes before publishing.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Multitrack broadcast audio cleanup$q$, $q$Processing multi-speaker recordings with ducking and mic-bleed removal.$q$, $q$Broadcasters and audio engineers$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$Free$q$, $q$$0$q$, $q$Monthly$q$, NULL, $q$["2 hours of processed audio per month","Access to all basic processing features","Includes Auphonic jingle/watermark"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Auphonic is an AI-powered audio post-production service from Auphonic GmbH, founded in 2013 and based in Graz, Austria. It automates audio engineering tasks for podcasts, videos, audiobooks, and educational content that would otherwise require manual mixing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform performs noise and reverb reduction, intelligent leveling between speakers and music, auto-EQ and filtering, and automatic removal of filler words, coughs, and silence. It supports multitrack productions with ducking and mic-bleed removal, and normalizes loudness to industry specifications.$q$, $q$Auphonic also offers speech-to-text transcription with auto-generated chapters, video processing with audiogram creation, and automation via API, CLI, and watch folders, along with publishing integrations to platforms like YouTube, Libsyn, PodBean, SoundCloud, and RSS.com.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Auphonic offers a free plan with 2 hours of processed audio per month (adding an Auphonic jingle to output) and no credit card required. Paid usage is sold as recurring monthly credit tiers (ranging from 9 to 250+ hours per month) or one-time, non-expiring credit packs billed by processing hours, with custom business plans available for teams.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4dd68fbf-0f44-4e17-ac9c-f3c2cd8a74b6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Auth0 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Auth0, owned by Okta, is an authentication and identity platform offering SSO, MFA, and passwordless login for web and mobile applications.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $35/month)$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Bellevue, Washington, USA (part of Okta, Inc.)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Auth0: Authentication and Identity Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Auth0, part of Okta, provides SSO, MFA, passwordless login, and 30+ SDKs for developers building authentication into web and mobile apps.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Auth0 is an authentication and authorization platform founded in 2013 by Eugenio Pace and Matias Woloski, and acquired by Okta, Inc. in 2021. It provides identity management for developers building web and mobile applications, including Universal Login and embedded login flows, single sign-on (SSO), multi-factor authentication (MFA), passwordless and passkey-based authentication, machine-to-machine authentication, fine-grained authorization, bot detection, and breached-password protection. Auth0 offers 30+ SDKs covering languages and frameworks such as JavaScript, Swift, Kotlin, Angular, Node.js, PHP, React, Vue, ASP.NET, Python, and Spring. It reports blocking over 3 billion attacks monthly, processing over 10 billion authentications monthly, and maintaining 99.99% uptime. Pricing is freemium: a free plan supports up to 25,000 monthly active users with a custom domain, passwordless auth, and basic attack protection; paid B2C plans start around $35/month (Essentials) and $240/month (Professional), while B2B plans start higher, at $150/month and $800/month respectively, with Enterprise plans available on request. Yearly billing offers one month free versus monthly billing. Auth0 is used by software teams and enterprises that need to add secure authentication, SSO, and identity management to applications without building it from scratch, ranging from small apps on the free tier to large enterprises needing custom enterprise connections and compliance features.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Universal Login and SSO$q$, $q$Centralized, single sign-on login experience across applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Multi-factor authentication$q$, $q$Configurable MFA including passwordless and passkey-based options.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Broad SDK coverage$q$, $q$30+ SDKs across major languages and frameworks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Machine-to-machine authentication$q$, $q$Token-based auth for service-to-service API access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Fine-grained authorization$q$, $q$Granular permission control beyond basic role checks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Attack protection$q$, $q$Bot detection and breached-password protection built in.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$B2B organization management$q$, $q$Enterprise connections and organization-based access for B2B apps.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Generous free tier supporting up to 25,000 monthly active users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Very broad SDK and framework support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Enterprise-grade features like SSO, MFA, and attack protection$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Backed by Okta's infrastructure with a claimed 99.99% uptime$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Costs scale with monthly active users and can rise quickly at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Advanced features require Professional or Enterprise tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$B2B pricing is notably higher than B2C pricing for comparable tiers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Is there a free Auth0 plan?$q$, $q$Yes, the free plan supports up to 25,000 monthly active users.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Who owns Auth0?$q$, $q$Auth0 is owned by Okta, Inc., which acquired it in 2021.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$What authentication methods does Auth0 support?$q$, $q$Passwordless login, multi-factor authentication, single sign-on, social login, and passkeys.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Does pricing differ for B2B vs B2C use cases?$q$, $q$Yes, Auth0 has separate B2C and B2B pricing tiers, with B2B plans starting at a higher price point.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Developer authentication for apps$q$, $q$Adding login, SSO, and MFA to web and mobile applications.$q$, $q$Software development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Enterprise identity management$q$, $q$Managing SSO and organization-based access for B2B customers.$q$, $q$Enterprises and SaaS companies$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Free$q$, $q$$0/month$q$, $q$Monthly$q$, NULL, $q$["Up to 25,000 monthly active users","1 custom domain","Passwordless authentication","Unlimited social connections"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Essentials (B2C)$q$, $q$From $35/month$q$, $q$Monthly (500 MAU included)$q$, NULL, $q$["Pro MFA","10 Organizations","1 Log Stream","Standard support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Professional (B2C)$q$, $q$From $240/month$q$, $q$Monthly (500 MAU included)$q$, NULL, $q$["Enhanced attack protection","Custom database support","Security Center","Enterprise MFA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$Enterprise$q$, $q$Contact us$q$, $q$Custom$q$, NULL, $q$["Custom MAU volume","Dedicated support","Custom contract terms"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Auth0 is an authentication and authorization platform founded in 2013 and acquired by Okta, Inc. in 2021. It gives developers a way to add login, SSO, and identity management to applications without building authentication infrastructure in-house.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Auth0 provides Universal Login and embedded login, single sign-on, multi-factor authentication, and passwordless/passkey authentication. It also supports machine-to-machine authentication, fine-grained authorization, bot detection, breached-password protection, and custom Actions for extending authentication workflows.$q$, $q$Developers can integrate Auth0 using more than 30 SDKs spanning languages and frameworks including JavaScript, Swift, Kotlin, Angular, Node.js, PHP, React, Vue, ASP.NET, Python, and Spring.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Auth0's free plan supports up to 25,000 monthly active users. Paid B2C plans start at roughly $35/month (Essentials) and $240/month (Professional), while B2B plans start higher, at roughly $150/month and $800/month respectively; Enterprise pricing is quote-based. Add-ons such as AI Agents and machine-to-machine tokens are billed separately.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aa65c3e9-f1eb-4bc3-88cc-e1c6bbc4e49a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Authelia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Authelia is a free, open-source single sign-on and multi-factor authentication portal designed to sit in front of self-hosted apps via a reverse proxy.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Authelia: Open-Source SSO & MFA Portal$q$, seo_title),
  seo_meta_description = COALESCE($q$Authelia is a free, open-source SSO and multi-factor authentication portal for self-hosted apps, built to work with reverse proxies like Traefik.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Authelia is a free, open-source identity and access management solution that functions as an authentication and authorization server with a web login portal, with its first commit dating to December 2016. It is licensed under Apache 2.0 and designed to be deployed alongside a reverse proxy (such as Traefik, nginx, or Caddy) to add single sign-on and multi-factor authentication in front of self-hosted web applications. Authelia is an officially certified OpenID Connect 1.0 Provider and supports passwordless authentication via Passkeys, WebAuthn, and one-time passwords, as well as mobile push notifications for second-factor approval, login regulation to block brute-force attempts, and email-based password reset. It is built in Go and React and is notably lightweight, with a compressed container image under 20 megabytes and typical memory usage under 30MB, enabling fast authorization decisions. It supports high-availability deployments, including running multiple parallel instances on platforms like Kubernetes. Authelia is entirely free with no paid tiers, distributed and maintained as a community open-source project on GitHub (currently at version 4.39.x). It is primarily used by self-hosters, homelab operators, and DevOps/sysadmin teams who want centralized SSO and MFA protection for internally hosted services without relying on a third-party identity provider.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '82f44b81-1616-4e4f-99ec-891f86393804';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '82f44b81-1616-4e4f-99ec-891f86393804' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Single sign-on portal$q$, $q$Centralized login for multiple self-hosted applications behind a reverse proxy.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Multi-factor authentication$q$, $q$TOTP, WebAuthn/Passkeys, and mobile push notifications for second-factor approval.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Certified OpenID Connect provider$q$, $q$Officially certified OIDC 1.0 Provider implementation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Brute-force login regulation$q$, $q$Rate-limits and blocks repeated failed login attempts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Reverse proxy integration$q$, $q$Designed to work with proxies like Traefik, nginx, and Caddy.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Lightweight footprint$q$, $q$Compressed container under 20MB with typically under 30MB memory usage.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$High-availability deployment$q$, $q$Supports running multiple parallel instances, including on Kubernetes.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Fully free and open source under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Very lightweight resource footprint$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Officially OpenID Certified$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Strong integration with common reverse proxies$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Requires self-hosting and reverse proxy configuration knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$No official managed/hosted version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Support is community-driven with no commercial support contracts$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Is Authelia free?$q$, $q$Yes, it is free and open source under the Apache 2.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Does Authelia require a reverse proxy?$q$, $q$Yes, it's designed to be deployed alongside a reverse proxy such as Traefik, nginx, or Caddy.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Is Authelia self-hosted only?$q$, $q$Yes, there is no managed cloud version; it must be self-hosted.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$What authentication factors does it support?$q$, $q$Passwords, TOTP, WebAuthn/Passkeys, and mobile push notifications.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Self-hosted SSO for homelab services$q$, $q$Adding centralized login and MFA in front of self-hosted apps.$q$, $q$Homelab operators and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Enterprise-grade auth portal behind reverse proxies$q$, $q$Protecting internal tools with SSO and access policies at the proxy layer.$q$, $q$DevOps and sysadmin teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$Authelia$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full SSO and MFA functionality","Self-hosted deployment","Community support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '82f44b81-1616-4e4f-99ec-891f86393804';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Authelia is a free, open-source authentication and authorization server with a web login portal, first started in December 2016. It is licensed under Apache 2.0 and designed to be deployed behind a reverse proxy to add SSO and MFA to self-hosted applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Authelia provides multi-factor authentication and single sign-on, certified OpenID Connect 1.0 support, passwordless login via Passkeys, WebAuthn, and one-time passwords, mobile push notifications for second-factor approval, login regulation against brute-force attacks, and granular access policies.$q$, $q$It is built in Go and React, with a compressed container image under 20MB and typical memory usage under 30MB, and supports high-availability deployments across multiple instances on platforms like Kubernetes.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Authelia is aimed at self-hosters, homelab operators, and DevOps or sysadmin teams who want a centralized SSO and MFA layer in front of internally hosted services, typically paired with reverse proxies such as Traefik.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('82f44b81-1616-4e4f-99ec-891f86393804', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Authentik ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Authentik is a self-hosted, open-source identity provider supporting OAuth2/OIDC, SAML, LDAP, and SCIM, with an optional paid Enterprise tier.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (open source); Enterprise from $5/internal user/month$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Authentik: Self-Hosted Identity Provider$q$, seo_title),
  seo_meta_description = COALESCE($q$Authentik is an open-source, self-hosted identity provider with OAuth2/OIDC, SAML, LDAP, and SCIM support, plus a paid Enterprise tier.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Authentik is a self-hosted, open-source identity provider (IdP) whose project began with a first commit in November 2018, later formalized as a commercial entity, Authentik Security Inc., founded in November 2022. It lets organizations manage authentication and access to applications without relying on a third-party identity service, supporting protocols including OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, Kerberos, and an application proxy for services like RDP, VNC, and SSH. Features include multi-factor authentication, WebAuthn/Passkeys support, conditional access policies, GeoIP and impossible-travel detection, and customizable workflows via APIs and infrastructure-as-code tools like Terraform. It can be deployed via Docker Compose or Kubernetes and reports over 1 million installations. The open-source core is free and fully featured for self-hosting; a paid Enterprise tier adds integrations with Google Workspace and Microsoft Entra ID, Chrome Enterprise Device Trust, client certificate (mTLS) authentication, enhanced audit logging, and ticket-based support, priced from $5 per internal user per month (plus $0.02 per external user) billed annually, with a higher "Enterprise Plus" tier starting at $20,000 annually offering dedicated SLA-backed support and FIPS compliance. Authentik is aimed at IT and DevOps teams needing a self-hosted SSO/IdP for internal tools, as well as larger enterprises requiring compliance features and support contracts.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Multi-protocol identity provider$q$, $q$Supports OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, and Kerberos.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Application proxy$q$, $q$Proxies access to internal services like RDP, VNC, and SSH.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Multi-factor authentication$q$, $q$MFA including WebAuthn and Passkeys support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Conditional access policies$q$, $q$GeoIP and impossible-travel detection for risk-based access rules.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Infrastructure-as-code friendly$q$, $q$Deployable and configurable via Docker Compose, Kubernetes, and Terraform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise integrations (paid)$q$, $q$Google Workspace and Microsoft Entra ID integrations on the Enterprise tier.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Free open-source core is fully featured for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Broad protocol support (OIDC, SAML, LDAP, SCIM, RADIUS)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Over 1 million reported installations and active development$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Flexible deployment via Docker, Kubernetes, or Terraform$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise features like advanced compliance and dedicated support require a paid tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Self-hosting requires ongoing infrastructure management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$External-user pricing on the Enterprise tier can be harder to estimate for consumer-scale deployments$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Is authentik free?$q$, $q$Yes, the open-source core is free to self-host; a paid Enterprise tier adds extra integrations and support.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Who makes authentik?$q$, $q$Authentik Security Inc., which formalized as a company in November 2022 around the open-source project started in 2018.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Is authentik self-hosted?$q$, $q$Yes, it is designed to be self-hosted via Docker Compose or Kubernetes.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$What protocols does authentik support?$q$, $q$OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, and Kerberos.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Self-hosted SSO for internal apps$q$, $q$Centralizing authentication for internally hosted tools and services.$q$, $q$IT and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise identity management$q$, $q$Integrating with Google Workspace or Microsoft Entra ID with compliance and audit needs.$q$, $q$Enterprises requiring SSO and compliance features$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["OIDC, SAML, LDAP, SCIM, RADIUS, Kerberos, Proxy support","Web-based RDP/SSH access","Community Discord support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise$q$, $q$From $5/internal user/month$q$, $q$Annual$q$, NULL, $q$["All Open Source features","Google Workspace & Microsoft Entra ID integrations","Chrome Enterprise Device Trust connector","Ticket-based support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise Plus$q$, $q$Starting at $20,000/year$q$, $q$Annual$q$, NULL, $q$["All Enterprise features","Dedicated support with SLAs","Multi-instance deployment","FIPS compliance for FedRAMP"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Authentik is a self-hosted, open-source identity provider. The open-source project began in 2018, and it is now developed commercially by Authentik Security Inc., founded in November 2022. It gives organizations a way to manage authentication and access to applications without depending on a third-party identity service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Authentik supports OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, and Kerberos protocols, along with an application proxy for remote access to services like RDP, VNC, and SSH. It includes multi-factor authentication, WebAuthn/Passkeys, conditional access policies, and GeoIP/impossible-travel detection.$q$, $q$The platform can be deployed via Docker Compose or Kubernetes, and workflows can be customized through APIs and infrastructure-as-code tools such as Terraform.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The open-source core is free and self-hosted. A paid Enterprise tier starts at $5 per internal user per month (plus $0.02 per external user per month, billed annually) and adds integrations like Google Workspace and Microsoft Entra ID, mTLS authentication, and ticket-based support. An Enterprise Plus tier starts at $20,000 annually with dedicated SLA support and FIPS compliance.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── auto-mcs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$auto-mcs is a free, open-source, cross-platform Minecraft server manager that automates creating, importing, and managing servers.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$auto-mcs: Free Minecraft Server Manager$q$, seo_title),
  seo_meta_description = COALESCE($q$auto-mcs is a free, open-source Minecraft server manager that lets you create, import, and manage Paper, Fabric, Forge, and Bedrock servers in minutes.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$auto-mcs is a free, open-source, cross-platform Minecraft server manager, developed as a community project (GitHub: macarooni-man/auto-mcs) and released under the GPL-3.0 license. It lets users create, import, or update servers running Paper, Purpur, Fabric, Quilt, NeoForge, Forge, Spigot, CraftBukkit, or Vanilla, as well as Bedrock-compatible servers via Geyser, typically in under a minute, with no formal installation required beyond extracting the application. It integrates with playit.gg so friends can join a server without manual port forwarding, and includes Telepath for remote server administration. Other features include automated backups, access control and firewall-like security settings, add-on/mod management, and both a graphical interface and a headless mode for advanced or server-based use. auto-mcs also includes amscript, a custom scripting language that adds extended customization capabilities even to vanilla servers. The tool is entirely free to use, with community support available via Discord and email. It is aimed at casual Minecraft players and small communities who want to quickly self-host a server for friends, as well as more technical users managing modded or plugin-based servers who want automated setup and administration without manually configuring each server type.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Fast server creation$q$, $q$Create, import, or update a server in under a minute.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Broad server-type support$q$, $q$Supports Paper, Purpur, Fabric, Quilt, NeoForge, Forge, Spigot, CraftBukkit, Vanilla, and Bedrock via Geyser.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$playit.gg integration$q$, $q$Lets friends join a server without manual port forwarding.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Telepath remote administration$q$, $q$Manage servers remotely from another device.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Automated backups$q$, $q$Scheduled backup creation for server worlds and data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$amscript scripting language$q$, $q$Custom scripting language for extending even vanilla servers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$GUI and headless modes$q$, $q$Runs with a graphical interface or headless for server-based use.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Completely free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Very fast server setup, typically under a minute$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Supports a wide range of server software and mod loaders$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$No port forwarding required thanks to playit.gg integration$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Small, community/hobbyist project rather than a commercially backed product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Support is limited to Discord and email rather than formal SLAs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Less established track record than larger server-panel projects$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Is auto-mcs free?$q$, $q$Yes, it is free and open source under the GPL-3.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$What server types does auto-mcs support?$q$, $q$Paper, Purpur, Fabric, Quilt, NeoForge, Forge, Spigot, CraftBukkit, Vanilla, and Bedrock-compatible servers via Geyser.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Do I need port forwarding to let friends join?$q$, $q$No, auto-mcs integrates with playit.gg to allow friends to connect without manual port forwarding.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Where can I get support for auto-mcs?$q$, $q$Through its Discord community or by emailing help@auto-mcs.com.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Quick server hosting for friend groups$q$, $q$Spinning up a Minecraft server for casual play with friends in minutes.$q$, $q$Casual players and small communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$Managing modded or plugin servers$q$, $q$Automating setup and administration of modded or plugin-based servers.$q$, $q$Minecraft server administrators$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$auto-mcs$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full server creation and management functionality","No installation required","Community Discord support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'a437baba-e6f7-4c0f-84b6-b7edc8faba1e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$auto-mcs is a free, open-source, cross-platform Minecraft server manager, released under the GPL-3.0 license and developed as a community project on GitHub (macarooni-man/auto-mcs). It automates the setup and management of Minecraft servers across a wide range of server software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$auto-mcs can create, import, or update Paper, Purpur, Fabric, Quilt, NeoForge, Forge, Spigot, CraftBukkit, and Vanilla servers, plus Bedrock-compatible servers via Geyser, typically in under a minute. It integrates with playit.gg so friends can join without port forwarding, and includes Telepath for remote administration.$q$, $q$Additional features include automated backups, access control, add-on/mod management, a custom scripting language called amscript for extending vanilla servers, and both GUI and headless operating modes.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a437baba-e6f7-4c0f-84b6-b7edc8faba1e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Autodesk Construction Cloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Autodesk Construction Cloud is Autodesk's construction management platform for document management, project collaboration, and BIM coordination, now rebranding as Autodesk Forma.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Autodesk Construction Cloud: Construction Management$q$, seo_title),
  seo_meta_description = COALESCE($q$Autodesk Construction Cloud offers document management, project collaboration, and BIM coordination tools for contractors and builders.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Autodesk Construction Cloud (ACC) is a cloud-based construction management platform from Autodesk, Inc., a publicly traded software company headquartered in San Francisco, California, founded in 1982. Autodesk Construction Cloud launched in November 2019, bringing together products such as PlanGrid, BIM 360, Assemble, and Building Connected into a unified suite for managing construction projects from design through completion. It provides document management, project management tools including RFIs, submittals, and daily reports, BIM model coordination and clash detection, bid management with access to construction bidding networks, and AI-assisted workflow automation, along with real-time cost, schedule, and project status insights. The platform offers over 400 pre-built integrations with ERP, CRM, and analytics systems, and is accessible via web browser as well as iOS and Android mobile apps (originally via PlanGrid). Autodesk reports the platform is used across more than 2 million projects by general contractors, specialty contractors, building owners, and designers in commercial, industrial, infrastructure, and institutional construction. Pricing is not publicly listed and requires contacting Autodesk for a quote or demo; a free trial is offered. As of March 2026, Autodesk announced that Autodesk Construction Cloud is being rebranded as Autodesk Forma, unifying construction management with Autodesk's broader AEC design platform, with the core product functionality remaining the same under the new branding.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c9aff19f-2369-4d96-b80f-e33c932398f4' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Document management$q$, $q$Centralized storage and organization of project documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Project management tools$q$, $q$RFIs, submittals, daily reports, and team coordination workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$BIM model coordination$q$, $q$Clash detection and issue resolution across building models.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Bid management$q$, $q$Access to construction bidding networks for procurement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$AI-assisted workflows$q$, $q$Automation and insights to support project decision-making.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Extensive integrations$q$, $q$Over 400 pre-built integrations with ERP, CRM, and analytics platforms.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Backed by Autodesk, an established, publicly traded AEC software company$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Broad feature set spanning documents, project management, and BIM coordination$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Large integration ecosystem (400+ pre-built integrations)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Used across a large volume of construction projects globally$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$No public pricing; requires a sales conversation or demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Undergoing a brand transition to Autodesk Forma, which may cause naming confusion for existing users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Feature depth and complexity may be more than smaller contractors need$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$What is Autodesk Construction Cloud?$q$, $q$A cloud-based construction management platform from Autodesk for document management, project collaboration, and BIM coordination.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$How much does Autodesk Construction Cloud cost?$q$, $q$Pricing is not publicly listed; Autodesk offers a free trial and requires contacting sales for a quote.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Is Autodesk Construction Cloud being renamed?$q$, $q$Yes, as of March 2026 Autodesk is rebranding Autodesk Construction Cloud as Autodesk Forma, though core functionality remains the same.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$What platforms does it support?$q$, $q$It is accessible via web browser and has iOS and Android mobile apps.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$Construction project collaboration$q$, $q$Managing documents, RFIs, submittals, and daily reports across project teams.$q$, $q$General and specialty contractors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$BIM coordination and clash detection$q$, $q$Coordinating building models across disciplines to resolve conflicts before construction.$q$, $q$Designers and building owners$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'c9aff19f-2369-4d96-b80f-e33c932398f4';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Autodesk Construction Cloud is a cloud-based construction management platform from Autodesk, Inc., launched in November 2019 to unify products like PlanGrid, BIM 360, Assemble, and Building Connected. It serves as a centralized hub for managing construction projects from design through completion.$q$, $q$As of March 2026, Autodesk announced that Autodesk Construction Cloud is being rebranded as Autodesk Forma, combining construction management with Autodesk's broader AEC design platform. Autodesk states this is a branding and experience change rather than a platform replacement, and that existing projects, data, and workflows remain in place.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform includes document management, project management tools such as RFIs, submittals, and daily reports, BIM model coordination with clash detection, and bid management with access to construction bidding networks. It also offers AI-assisted workflow automation and real-time cost, schedule, and status insights, plus over 400 pre-built integrations with ERP, CRM, and analytics tools.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Autodesk Construction Cloud is used by general contractors, specialty contractors, building owners, and designers across commercial, industrial, infrastructure, and institutional construction projects.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Autodesk does not publish specific pricing for Autodesk Construction Cloud. Prospective customers can request a demo or start a free trial, with pricing quoted directly by Autodesk based on modules and team size.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c9aff19f-2369-4d96-b80f-e33c932398f4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;


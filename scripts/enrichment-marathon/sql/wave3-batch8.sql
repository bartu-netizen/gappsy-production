-- Enrichment marathon batch: AzuraCast, b1gMail, Backblaze, Backdrop CMS, Backstage, Bacula, Bagisto, Baïkal

-- ── AzuraCast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AzuraCast is a free, open-source, self-hosted web radio management suite for launching and running internet radio stations with Icecast/SHOUTcast streaming and Liquidsoap automation.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AzuraCast: Free Self-Hosted Web Radio Software$q$, seo_title),
  seo_meta_description = COALESCE($q$AzuraCast is a free, open-source, self-hosted platform for managing internet radio stations with Icecast, SHOUTcast, and Liquidsoap automation.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AzuraCast is a free, open-source, self-hosted web radio management suite that lets anyone launch and operate an internet radio station. Originally traced to a 2012 predecessor project called Ponyville Live, it was rebuilt in 2016 into its current form by lead developer Buster "Silver Eagle" Neece and is now maintained by an active volunteer community, licensed under the AGPL v3. AzuraCast bundles the full radio broadcasting stack — Icecast and SHOUTcast streaming servers and Liquidsoap automation — behind a modern web interface, so station owners do not need to configure each component separately. Core capabilities include media and playlist management, multi-station hosting on a single installation, granular user roles and permissions, listener song requests, webhook integrations with services like Discord, Slack, and TuneIn, S3-compatible remote storage, and built-in listener analytics. The project is Docker-based, which simplifies installation and updates on any Linux server or supported cloud host. There is no paid tier, hosted SaaS offering, or enterprise edition — AzuraCast is entirely free to self-host, and revenue does not come from the software itself. It is best suited to hobbyist broadcasters, community and school radio stations, podcasters wanting a live stream component, and small internet radio operators who want full control over their infrastructure without ongoing licensing costs.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Multi-station management$q$, $q$Host and manage multiple radio stations from a single AzuraCast installation with individual playlists and permissions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Icecast and SHOUTcast streaming$q$, $q$Broadcast using either of the two dominant web radio streaming protocols, switchable at any time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Liquidsoap automation$q$, $q$Automate playlist rotation, crossfading, and live source switching using the bundled Liquidsoap engine.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Listener song requests$q$, $q$Let listeners request songs from your playlists via a public page or the AzuraCast API.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Webhook integrations$q$, $q$Connect stations to Discord, Slack, TuneIn, and other services through configurable webhooks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Analytics and reporting$q$, $q$Track listener counts over time and see how individual songs affect audience retention.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Docker-based deployment$q$, $q$Install and update AzuraCast via Docker and Docker Compose for consistent, dependency-free deployments.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Completely free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Docker-based installer simplifies deployment and updates$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Supports hosting multiple radio stations from one install$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Active community with frequent updates and third-party integrations$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Requires self-hosting and some server administration knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$No official managed or hosted SaaS version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Support is community-driven rather than a paid help desk$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Is AzuraCast free to use?$q$, $q$Yes, AzuraCast is fully free and open source under the AGPL v3 license, with no paid tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Do I need to host AzuraCast myself?$q$, $q$Yes, AzuraCast is self-hosted; you install it on your own server or cloud instance via Docker.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Which streaming protocols does AzuraCast support?$q$, $q$AzuraCast supports both Icecast 2.4 and SHOUTcast 2, and stations can switch between them.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Can AzuraCast host more than one radio station?$q$, $q$Yes, a single AzuraCast installation can host multiple independent stations with separate playlists and users.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Hobbyist internet radio$q$, $q$Individuals launching a personal or fan-community internet radio station without ongoing software costs.$q$, $q$Hobbyist broadcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Community and school radio$q$, $q$Schools, nonprofits, and community groups running a low-budget radio station on their own infrastructure.$q$, $q$Community organizations and educators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Small broadcaster self-hosting$q$, $q$Independent broadcasters who want full control over streaming infrastructure and data without vendor lock-in.$q$, $q$Independent radio operators$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AzuraCast is a self-hosted, all-in-one web radio management suite. It packages the broadcast software stack — Icecast, SHOUTcast, and Liquidsoap — together with a browser-based control panel, so a station can be set up and streaming within minutes rather than requiring manual server configuration.$q$, $q$The project began life in 2012 as Ponyville Live before being rebuilt into AzuraCast in 2016. It is led by developer Buster "Silver Eagle" Neece and maintained by a volunteer community, distributed under the AGPL v3 open-source license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AzuraCast supports hosting multiple stations from a single installation, each with its own playlists, mount points, remote relays, and user permissions. Broadcasters can switch between Icecast and SHOUTcast streaming at any time, upload and organize media, and let listeners request specific songs through a public listener page or API.$q$, $q$Webhooks connect stations to Discord, Slack, TuneIn, and other third-party services, while built-in analytics track listener counts and each song's impact on audience retention. Media, recordings, and backups can be stored locally or on S3-compatible storage.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$AzuraCast is completely free and open source with no paid tiers, license fees, or hosted plan. Users are responsible for their own server or cloud hosting costs, since AzuraCast itself does not sell managed hosting.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── b1gMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$b1gMail is a self-hosted, open-source PHP webmail and groupware platform that lets organizations run their own branded email service with calendar, contacts, and cloud storage.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_title = COALESCE($q$b1gMail: Self-Hosted Open Source Webmail Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$b1gMail is a free, open-source, self-hosted PHP webmail and groupware system for running your own branded email service with calendar and contacts.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$b1gMail is a self-hosted, PHP-based webmail and groupware platform originally created by Patrick Schlangen. It was first distributed as freeware, later became a commercial product starting with version 6, and was relicensed as fully open-source software under the GPL as of version 7.4.1, with all proprietary components removed. b1gMail runs on standard PHP web hosting without requiring dedicated servers, making it accessible to individuals, small businesses, and hosting providers who want to operate their own branded email service instead of relying on a third-party mail provider. Beyond core email, it includes an HTML5 drag-and-drop mail interface, address book, calendar, task and note management, cloud storage, and optional SMS and fax functionality. Spam and virus protection is built in via DNSBL filtering, a Bayesian spam filter, and ClamAV antivirus integration, and the platform supports a plugin system for extending functionality. b1gMail's community and primary site presence are German-language, though English documentation is also available. There is no paid tier or managed hosting offered directly by the project — users deploy and maintain their own instance. It is best suited to organizations, developers, and hosting companies that want a fully self-hosted, customizable groupware and email solution with no per-user licensing costs.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$HTML5 webmail interface$q$, $q$Drag-and-drop email client with folders, filters, and a modern browser-based UI.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Integrated groupware$q$, $q$Built-in address book, calendar, task management, and notes alongside email.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Spam and virus protection$q$, $q$DNSBL filtering, Bayesian spam detection, and ClamAV antivirus integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Cloud storage add-on$q$, $q$Optional cloud storage functionality tied to user mailboxes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Plugin system$q$, $q$Extend b1gMail's functionality through community and custom plugins.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Intelligent folders and filters$q$, $q$Customizable mail filtering rules and smart folder organization.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Free and open source under the GPL license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Full groupware feature set beyond just email (calendar, tasks, contacts)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Extensible through a plugin system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Self-hosted, giving full control over data and branding$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Requires your own PHP hosting and server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Primary community and documentation are German-language$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$No official managed or cloud-hosted version$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Is b1gMail free?$q$, $q$Yes, as of version 7.4.1, b1gMail is fully open source under the GPL license with no cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Do I need my own server to run b1gMail?$q$, $q$Yes, b1gMail is self-hosted and runs on standard PHP web hosting.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Does b1gMail include a calendar and contacts?$q$, $q$Yes, it includes an address book, calendar, task management, and notes alongside webmail.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Is b1gMail available in English?$q$, $q$The core community and site are primarily German-language, though English resources exist.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Private branded email service$q$, $q$Organizations wanting to run their own email service under their own domain and branding.$q$, $q$Businesses and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$Hosting provider webmail$q$, $q$Web hosting companies offering webmail access to their hosting customers.$q$, $q$Hosting providers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '4a7fb82b-cf5b-48e3-8862-a245becc0e75';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$b1gMail is a self-hosted PHP application for operating a private email service, created by Patrick Schlangen. It began as freeware, later shifted to a commercial license from version 6 onward, and returned to a fully open-source GPL license as of version 7.4.1, removing all proprietary components.$q$, $q$Because it runs on standard PHP hosting rather than requiring dedicated infrastructure, b1gMail is accessible to individuals, businesses, and hosting providers who want to run their own branded email and groupware service instead of outsourcing it to a third-party provider.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform combines webmail with an HTML5 drag-and-drop interface, an address book, calendar, task and note management, and cloud storage. Optional modules add SMS and fax capabilities.$q$, $q$Spam and virus protection is built in through DNSBL filtering, a Bayesian spam filter, and ClamAV antivirus integration, and administrators can extend functionality further through a plugin system and customizable mail filters.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$b1gMail is free and open source under the GPL license as of version 7.4.1. There is no official paid tier or managed hosting; users deploy it on their own PHP-capable web hosting.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a7fb82b-cf5b-48e3-8862-a245becc0e75', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Backblaze ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Backblaze is a publicly traded cloud storage company offering S3-compatible B2 Cloud Storage and unlimited Computer Backup, known for simple, predictable pricing and free egress.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based (storage) & subscription (backup)$q$, pricing_model),
  starting_price = COALESCE($q$$6.95/TB/month (B2 Cloud Storage); $9/month (Computer Backup)$q$, starting_price),
  founded_year = COALESCE(2007, founded_year),
  company_size = COALESCE($q$~320 employees (public company, NASDAQ: BLZE)$q$, company_size),
  headquarters = COALESCE($q$San Mateo, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Backblaze: Cloud Storage & Unlimited Computer Backup$q$, seo_title),
  seo_meta_description = COALESCE($q$Backblaze offers S3-compatible B2 Cloud Storage from $6.95/TB/month and unlimited Computer Backup from $9/month, with free egress.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Backblaze, Inc. is a publicly traded cloud storage and backup company (NASDAQ: BLZE) founded in 2007 and headquartered in San Mateo, California, with roughly 320 employees as of its most recent fiscal year. The company offers two main product lines: B2 Cloud Storage, an S3-compatible object storage service aimed at developers, AI/media workloads, and businesses needing scalable storage without vendor lock-in; and Computer Backup, an unlimited automatic backup service for individual computers and businesses. B2 Cloud Storage is priced on a pay-as-you-go basis starting at $6.95 per TB per month, with the first 10GB free, free API calls for most operations, and free egress up to three times a customer's average monthly storage (additional egress billed at $0.01/GB). Larger organizations can use B2 Reserve, a capacity-based annual plan with bundled egress and API fees. Computer Backup offers unlimited storage for a single computer, including attached external drives, for $9 per month or $99 per year. Backblaze markets itself around transparent, predictable pricing with no hidden fees or egress penalties, and integrates with partners such as Veeam, Cloudflare, and Commvault. It serves developers and IT teams needing affordable object storage as well as individuals and small businesses wanting simple, unlimited personal computer backup.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '42d5590c-1f80-447c-a591-4709d5198a5d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '42d5590c-1f80-447c-a591-4709d5198a5d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$S3-compatible object storage$q$, $q$B2 Cloud Storage works with existing S3 tools and APIs without vendor lock-in.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Free egress allowance$q$, $q$Free data downloads up to three times a customer's average monthly storage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Unlimited computer backup$q$, $q$Unlimited automatic backup for a single computer, including attached external drives.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$B2 Reserve capacity plans$q$, $q$Predictable, capacity-based annual pricing for large-scale enterprise storage needs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$No hidden fees$q$, $q$Transparent pricing with no minimum file size, storage duration, or surprise charges.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Partner integrations$q$, $q$Works with backup and storage partners including Veeam, Cloudflare, and Commvault.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Transparent, low-cost pricing with free egress on most plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Unlimited personal computer backup for a flat monthly fee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$S3-compatible storage without vendor lock-in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Established public company with an 18+ year track record$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Fewer advanced enterprise features than large hyperscale providers like AWS or Azure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Computer Backup covers one computer per subscription, not multiple devices$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Support is primarily online/ticket-based rather than dedicated account management for smaller customers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$How much does Backblaze B2 Cloud Storage cost?$q$, $q$B2 Cloud Storage starts at $6.95 per TB per month on a pay-as-you-go basis, with the first 10GB free.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Is Backblaze Computer Backup really unlimited?$q$, $q$Yes, Computer Backup offers unlimited storage for a single computer, including attached external drives, for $9/month or $99/year.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Is Backblaze S3-compatible?$q$, $q$Yes, B2 Cloud Storage is S3-compatible, allowing it to work with existing S3 tools and workflows.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Where is Backblaze headquartered?$q$, $q$Backblaze is headquartered in San Mateo, California, and was founded in 2007.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Affordable object storage$q$, $q$Developers and businesses needing S3-compatible cloud storage at a lower cost than hyperscalers.$q$, $q$Developers and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Unlimited personal backup$q$, $q$Individuals and families wanting simple, unlimited automatic backup for their computers.$q$, $q$Consumers and home users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$AI and media storage$q$, $q$Companies with large media libraries or AI/data-driven workloads needing high-throughput object storage.$q$, $q$Media and AI/ML teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$B2 Cloud Storage$q$, $q$$6.95/TB/month$q$, $q$Pay-as-you-go$q$, NULL, $q$["10GB free storage","Free egress up to 3x average storage","S3-compatible API"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$B2 Reserve$q$, $q$From ~$19,500/year (250TB)$q$, $q$Annual$q$, NULL, $q$["Predictable capacity-based pricing","Bundled egress and API transaction fees"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$Computer Backup - Personal$q$, $q$$9/month, $99/year, or $189/2 years$q$, $q$Monthly or annual$q$, NULL, $q$["Unlimited backup for one computer","Includes attached external drives"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '42d5590c-1f80-447c-a591-4709d5198a5d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Backblaze is a publicly traded cloud storage company (NASDAQ: BLZE), founded in 2007 and headquartered in San Mateo, California. It operates two core product lines: B2 Cloud Storage, an S3-compatible object storage platform, and Computer Backup, an unlimited backup service for personal and business computers.$q$, $q$The company positions itself around predictable, transparent pricing — emphasizing no hidden fees, no egress penalties, and free data downloads on most plans — as a contrast to hyperscale cloud providers' more complex pricing structures.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$B2 Cloud Storage is S3-compatible, meaning it works with existing S3 tooling and workflows without requiring migration to a proprietary API. It includes free egress up to three times a customer's average monthly storage and free API calls for most transaction types.$q$, $q$Computer Backup provides genuinely unlimited storage for one computer, including attached external drives, with no file size caps or throttling. Backblaze also offers B2 Reserve, a capacity-based annual plan for larger organizations, and integrates with partners like Veeam, Cloudflare, and Commvault.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$B2 Cloud Storage starts at $6.95 per TB per month on a pay-as-you-go basis, with 10GB always free. Computer Backup costs $9 per month, $99 for a full year, or $189 for two years per computer. B2 Reserve pricing starts around $19,500 per year for 250TB with bundled egress and transaction fees.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42d5590c-1f80-447c-a591-4709d5198a5d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Backdrop CMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Backdrop CMS is a free, open-source PHP content management system forked from Drupal 7 in 2013, built for small organizations that want an affordable, easy-to-manage website.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Backdrop CMS: Free Open Source CMS Forked from Drupal$q$, seo_title),
  seo_meta_description = COALESCE($q$Backdrop CMS is a free, open-source content management system forked from Drupal 7, built for affordable, easy-to-manage websites on shared hosting.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Backdrop CMS is a free, open-source content management system written in PHP, forked from Drupal 7 in 2013 by Nate Lampton and Jen Lampton. The fork emerged out of concerns that the significant architectural changes introduced in Drupal 8 — including its shift to the Symfony framework and many new dependencies — would be too costly or disruptive for maintainers of existing Drupal 7 sites. Backdrop retained the functionality and interface familiar from Drupal 7 while continuing independent development, and offers a direct upgrade path for Drupal 7 site owners. The project is community-governed, maintained by roughly 2,970 contributing community members, and has produced over 5,600 commits to its codebase. It powers more than 3,600 known websites and supports an ecosystem of 1,300+ modules, themes, and layout templates that can be installed without programming knowledge. Backdrop is designed to run efficiently even on shared, budget hosting environments. There are no licensing costs; the software is entirely free, though professional service providers offer paid implementation and support for organizations that want it. Backdrop CMS is aimed primarily at nonprofits, educational institutions, and small to medium-sized businesses that want an affordable, Drupal-like CMS without the complexity or cost of migrating to later Drupal versions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Drupal 7 upgrade path$q$, $q$Direct migration path for organizations moving off Drupal 7, with a familiar interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Shared-hosting performance$q$, $q$Designed to run efficiently on modest, shared web hosting environments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Modules, themes, and layouts$q$, $q$Over 1,300 community-built add-ons installable without coding knowledge.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Layout templates$q$, $q$Built-in layout tools for structuring pages without custom development.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Community governance$q$, $q$Project direction is decided collectively by an active open-source community.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Runs well on modest or shared hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Familiar migration path for Drupal 7 site owners$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Actively maintained by a community governance model$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Smaller ecosystem and community than Drupal or WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Fewer commercial hosting and support vendors available$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Not designed for the most complex, large-scale enterprise deployments$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Is Backdrop CMS free?$q$, $q$Yes, Backdrop CMS is completely free and open source with no licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Is Backdrop CMS related to Drupal?$q$, $q$Yes, it was forked from Drupal 7 in 2013 and retains a similar structure and interface.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Who maintains Backdrop CMS?$q$, $q$It is maintained by an open-source community of contributors who make governance decisions collectively.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Can I migrate from Drupal 7 to Backdrop?$q$, $q$Yes, Backdrop offers a direct upgrade path for existing Drupal 7 websites.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Nonprofit and education websites$q$, $q$Affordable, easy-to-manage websites for nonprofits and educational institutions.$q$, $q$Nonprofits and schools$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Drupal 7 migration$q$, $q$Site owners moving off end-of-life Drupal 7 without adopting Drupal 8/9/10's added complexity.$q$, $q$Existing Drupal 7 site owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$Small business websites$q$, $q$Small and medium businesses wanting a capable CMS without licensing costs.$q$, $q$Small and medium businesses$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'a37dd8ea-c6eb-4027-91e5-148f6db06493';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Backdrop CMS is a free, open-source content management system written in PHP. It was forked from Drupal 7 in 2013 by developers Nate Lampton and Jen Lampton, out of concern that the major architectural changes in Drupal 8 would be too disruptive or costly for many existing Drupal 7 site owners to adopt.$q$, $q$The project retains much of the functionality and interface familiar from Drupal 7 while continuing independent development under community governance, and it offers a direct upgrade path for organizations migrating off Drupal 7.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Backdrop is built to run efficiently even on shared, budget hosting, and its layout and content editing tools are designed to be usable without programming knowledge. The project supports an ecosystem of over 1,300 modules, themes, and layout templates that can be installed directly from the admin interface.$q$, $q$Development is community-driven, with contributions from roughly 2,970 community members and governance decisions made collectively rather than by a single company.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Backdrop CMS is completely free and open source with no licensing costs. Organizations needing implementation help can hire independent professional service providers, but the core software carries no fees.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a37dd8ea-c6eb-4027-91e5-148f6db06493', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Backstage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Backstage is an open-source developer portal framework created by Spotify and now hosted by the CNCF, unifying a software catalog, docs, and templates for platform engineering.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Backstage: Open Source Developer Portal Framework$q$, seo_title),
  seo_meta_description = COALESCE($q$Backstage is Spotify's open-source framework for building developer portals, offering a software catalog, TechDocs, templates, and a plugin ecosystem.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Backstage is an open-source framework for building internal developer portals, originally created inside Spotify and open-sourced in March 2020. Spotify donated the project to the Cloud Native Computing Foundation (CNCF) later that year, and it entered CNCF incubation in 2022, where it remains a community-governed project today. Backstage is built around a centralized Software Catalog that tracks an organization's microservices, libraries, data pipelines, and infrastructure in one place. It also includes Software Templates (the "Scaffolder") for creating new projects using standardized, organization-approved patterns; TechDocs, a docs-as-code system for keeping technical documentation alongside source code; and an extensible plugin ecosystem that lets teams add integrations and custom functionality. The core framework is free and self-hosted — organizations deploy and run their own Backstage instance, typically as part of a platform engineering initiative. Spotify separately offers a commercial hosted product, Portal for Backstage, built on top of the open-source framework for teams that don't want to operate it themselves. Backstage is used primarily by engineering managers, platform engineers, and developers at organizations with many services and teams, who need a single place to discover software ownership, enforce standards, and reduce the cognitive load of navigating fragmented internal tooling.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e5009be9-697e-4348-8c21-f8adaa429ec5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Software Catalog$q$, $q$Centralized inventory of microservices, libraries, data pipelines, and infrastructure with ownership metadata.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Software Templates (Scaffolder)$q$, $q$Standardized project scaffolding so new services follow organizational best practices from day one.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$TechDocs$q$, $q$Docs-as-code system that keeps technical documentation versioned alongside source code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Plugin ecosystem$q$, $q$Extensible plugins for CI/CD, security, cost tracking, and other developer tooling integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$CNCF governance$q$, $q$Community-governed as a CNCF Incubating project rather than controlled by a single vendor.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Free and fully open source under CNCF governance$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Large plugin ecosystem and strong industry adoption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Unifies fragmented developer tooling into a single portal$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Proven at scale, originating from Spotify's own internal use$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Requires engineering effort to set up, host, and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$No free managed hosting from the open-source project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Steep initial learning curve for smaller teams without dedicated platform engineers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Is Backstage free to use?$q$, $q$Yes, the open-source Backstage framework is free under CNCF governance and self-hosted.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Who created Backstage?$q$, $q$Backstage was created inside Spotify and open-sourced in March 2020, later donated to the CNCF.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Is there a managed or hosted version of Backstage?$q$, $q$The open-source project is self-hosted only, though Spotify offers a commercial hosted product called Portal for Backstage built on the framework.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$What does Backstage's Software Catalog do?$q$, $q$It centralizes information about an organization's services, libraries, and infrastructure in one searchable place.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Platform engineering standardization$q$, $q$Platform teams standardizing internal developer tooling and workflows across an organization.$q$, $q$Platform engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Internal developer portal (IDP)$q$, $q$Engineering organizations building a central developer-facing portal for discovery and self-service.$q$, $q$Engineering managers and developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$Microservice ownership tracking$q$, $q$Companies with many microservices needing a single catalog of ownership and documentation.$q$, $q$Organizations with distributed engineering teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'e5009be9-697e-4348-8c21-f8adaa429ec5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Backstage is an open-source framework for building internal developer portals. It was created inside Spotify, open-sourced in March 2020, and donated to the Cloud Native Computing Foundation (CNCF) later that year, reaching CNCF Incubating project status in 2022.$q$, $q$At its core is a Software Catalog that centralizes information about an organization's microservices, libraries, data pipelines, and infrastructure, giving engineering teams a single source of truth for what software exists and who owns it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beyond the catalog, Backstage includes Software Templates (the Scaffolder) for spinning up new projects using organization-approved patterns, and TechDocs, a docs-as-code system that keeps technical documentation versioned alongside source code.$q$, $q$An extensible plugin ecosystem lets platform teams add integrations for CI/CD, cost tracking, security scanning, and other tooling, allowing Backstage to serve as a unified front door to an organization's development tooling.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The open-source Backstage framework is free and self-hosted under CNCF governance. Spotify separately sells a commercial managed product called Portal for Backstage, built on the framework, for organizations that prefer not to operate their own instance.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e5009be9-697e-4348-8c21-f8adaa429ec5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Bacula ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bacula is free, open-source network backup and recovery software for Linux, Windows, and Mac, with a commercial enterprise edition offered by Bacula Systems.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + commercial enterprise edition$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2000, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Bacula: Open Source Network Backup & Recovery Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Bacula is free, open-source backup software for managing and recovering data across Linux, Windows, and Mac networks, with an enterprise edition.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bacula is a set of open-source programs for managing backup, recovery, and verification of computer data across heterogeneous networks. Development began in 2000, led by Kern Sibbald (a former Autodesk development manager for AutoCAD), with the first public release to SourceForge in April 2002. The Bacula Community Edition remains free and open source under the GPL, developed and supported by the Bacula community. In 2008, Sibbald founded Bacula Systems SA, a separate commercial company that offers Bacula Enterprise, a paid edition adding deeper scalability, broader platform coverage, dedicated support with response-time guarantees, and additional security architecture, while the open-source Community Edition continues to be freely available. Bacula supports Linux, Windows, and Mac clients, with binaries for Red Hat, Debian, Ubuntu, and macOS, and includes features such as TLS-encrypted communications, Kubernetes and Docker plugins, cloud storage backends, a Microsoft Exchange Server plugin, LDAP-based console authentication, data compression, and multi-tier backup workflows including migration and copy jobs. According to SourceForge download statistics, Bacula is one of the most widely used open-source full-system backup tools, with millions of downloads and a large contributor base. It is best suited to system administrators managing mixed-OS networks who want enterprise-capable backup without mandatory subscription costs, with the option to upgrade to paid enterprise support if needed.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Cross-platform backup$q$, $q$Backs up and restores data across Linux, Windows, and Mac systems from a single console.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$TLS-encrypted communications$q$, $q$Encrypts data in transit between backup clients, servers, and storage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Kubernetes and Docker plugins$q$, $q$Native plugins for backing up containerized workloads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Microsoft Exchange Server plugin$q$, $q$Dedicated support for backing up Exchange Server environments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Cloud storage support$q$, $q$Backs up data directly to supported cloud storage providers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Migration and copy jobs$q$, $q$Multi-tier backup workflows for moving data between storage tiers over time.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Free and open source under the GPL license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Supports heterogeneous networks across Linux, Windows, and Mac$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Mature project with a long track record and large install base$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Optional enterprise edition available for advanced support and scalability$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Steeper configuration learning curve than consumer backup tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Documentation and interface feel dated compared to modern SaaS backup products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Full enterprise feature set requires the paid Bacula Systems edition$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Is Bacula free?$q$, $q$Yes, the Bacula Community Edition is free and open source under the GPL.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$What is the difference between Bacula Community and Bacula Enterprise?$q$, $q$Community is the free open-source edition; Bacula Enterprise, from Bacula Systems, adds deeper scalability, broader platform support, and paid guaranteed-response support.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$What platforms does Bacula support?$q$, $q$Bacula supports Linux, Windows, and Mac clients, with official binaries for Red Hat, Debian, Ubuntu, and macOS.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Who maintains Bacula?$q$, $q$The open-source Community Edition is maintained by the Bacula community, originally started by Kern Sibbald in 2000.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Mixed-OS network backup$q$, $q$System administrators backing up networks with a mix of Linux, Windows, and Mac systems.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Enterprise backup with optional support$q$, $q$Organizations needing enterprise-grade backup with the option to purchase dedicated support.$q$, $q$Enterprises and IT departments$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Cost-conscious self-hosted backup$q$, $q$Organizations wanting robust backup infrastructure without recurring SaaS subscription fees.$q$, $q$Budget-conscious IT teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bacula is a set of open-source programs for backing up, recovering, and verifying data across networks of diverse computer systems. Development began in 2000 under Kern Sibbald, with the first public SourceForge release in April 2002.$q$, $q$The Bacula Community Edition remains free and open source under the GPL. In 2008, Sibbald founded Bacula Systems SA as a separate commercial entity offering Bacula Enterprise, a paid edition with additional scalability, platform coverage, and guaranteed-response support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bacula supports incremental, differential, and synthetic backups, TLS-encrypted communications, and data compression. It includes plugins for Kubernetes, Docker, Microsoft Exchange Server, and cloud storage backends, plus LDAP-based console authentication for centralized access control.$q$, $q$Multi-tier backup workflows, including migration and copy jobs, let administrators move data between storage tiers over time, and the software runs across Linux, Windows, and Mac client systems.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The Bacula Community Edition is free and open source. Bacula Systems offers a commercial Bacula Enterprise edition with a free trial, adding additional scalability, support, and security features for organizations that need them.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Bagisto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Bagisto is a free, open-source e-commerce platform built on Laravel by Webkul, supporting online stores, B2B commerce, multi-vendor marketplaces, and headless commerce.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source), with paid extensions, hosting, and support$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Noida, Uttar Pradesh, India$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Arabic$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$German$q$, $q$Vietnamese$q$, $q$Turkish$q$]::text[],
  seo_title = COALESCE($q$Bagisto: Free Open Source Laravel eCommerce Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Bagisto is a free, open-source Laravel e-commerce platform by Webkul for building stores, B2B shops, and multi-vendor marketplaces.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Bagisto is a free, open-source e-commerce platform built on the Laravel PHP framework, developed by Webkul, a software company headquartered in Noida, Uttar Pradesh, India, and founded in 2010. Development on Bagisto began in 2017, with its first public release on October 30, 2018. The platform lets developers and businesses build online stores, B2B commerce sites, multi-vendor marketplaces, and headless/API-first storefronts. Core capabilities include multi-vendor marketplace support, a dedicated B2B module, built-in Point of Sale (POS) functionality, multi-language and multi-currency support (with the interface and community available in languages including English, Arabic, Spanish, Portuguese, German, Vietnamese, and Turkish), and an API-first, headless-capable architecture. Bagisto's core software is free to download and self-host, with no licensing or per-transaction fees; Webkul generates revenue through a marketplace of premium extensions and themes, professional development services, paid support packages, and an optional managed hosting offering called Bagisto Hosting. The project reports over 200,000 global users, more than 25,000 companies using the platform, and over 26,000 GitHub stars. Bagisto is best suited to developers and agencies building custom Laravel-based storefronts, and businesses launching B2B or multi-vendor marketplace platforms who want an open-source alternative to proprietary e-commerce SaaS products.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Multi-vendor marketplace$q$, $q$Build marketplace platforms where multiple sellers manage their own storefronts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$B2B commerce module$q$, $q$Dedicated functionality for B2B pricing, quotes, and wholesale-style commerce.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Headless/API-first architecture$q$, $q$Build custom storefronts and mobile apps on top of Bagisto's APIs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Built-in Point of Sale (POS)$q$, $q$Sell in-person alongside online channels using integrated POS functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Multi-language and multi-currency support$q$, $q$Sell to international customers with localized languages and currencies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Extension marketplace$q$, $q$Premium and free themes and extensions available from Webkul's marketplace.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Built on the widely-used Laravel PHP framework$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Supports B2B, marketplace, and headless commerce out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Large global user base and active GitHub community$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Requires PHP/Laravel hosting and technical setup knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Advanced features and premium themes require paid extensions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Managed hosting must be sourced from Webkul's Bagisto Hosting or third-party providers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Is Bagisto free to use?$q$, $q$Yes, the core Bagisto platform is free and open source with no licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Who develops Bagisto?$q$, $q$Bagisto is developed by Webkul, a software company based in Noida, India, founded in 2010.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Does Bagisto support multi-vendor marketplaces?$q$, $q$Yes, Bagisto includes built-in multi-vendor marketplace capabilities.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Is hosting included with Bagisto?$q$, $q$No, Bagisto is self-hosted; Webkul offers an optional paid Bagisto Hosting service, and third-party hosts also support it.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Custom Laravel storefronts$q$, $q$Developers and agencies building fully customized online stores on Laravel.$q$, $q$Developers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$B2B and wholesale commerce$q$, $q$Businesses launching B2B storefronts with custom pricing and quoting workflows.$q$, $q$B2B and wholesale businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$Multi-vendor marketplaces$q$, $q$Companies building marketplace platforms with multiple independent sellers.$q$, $q$Marketplace operators$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'e31477ab-3154-4ea8-8d67-a637bb9acd3b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Bagisto is a free, open-source e-commerce platform built on the Laravel PHP framework. It is developed by Webkul, a software company founded in 2010 and headquartered in Noida, Uttar Pradesh, India. Bagisto development began in 2017, with its first public release on October 30, 2018.$q$, $q$The platform is designed to support online stores, B2B commerce, multi-vendor marketplaces, and headless/API-first storefronts from a single open-source codebase, giving developers full control over customization since the core product is self-hosted.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Bagisto includes multi-vendor marketplace capabilities, a dedicated B2B commerce module, and built-in Point of Sale (POS) functionality for omni-channel selling across web, mobile, and in-person channels. Its API-first, headless-capable architecture lets developers build custom storefronts and mobile apps on top of the platform.$q$, $q$The platform supports multiple languages, including English, Arabic, Spanish, Portuguese, German, Vietnamese, and Turkish, and offers a marketplace of extensions and themes for extending functionality without custom development.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Bagisto's core platform is free and open source, with no licensing fees, subscription costs, or per-transaction charges. Webkul monetizes through premium extensions and themes, professional development services, paid support packages, and an optional managed Bagisto Hosting offering.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e31477ab-3154-4ea8-8d67-a637bb9acd3b', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Baïkal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Baïkal is a free, open-source, self-hosted CalDAV and CardDAV server built on sabre/dav for syncing calendars and contacts across devices.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Baïkal: Free Self-Hosted CalDAV & CardDAV Server$q$, seo_title),
  seo_meta_description = COALESCE($q$Baïkal is a free, open-source, self-hosted calendar and contacts server built on sabre/dav, compatible with iOS, macOS, Thunderbird, and DAVx5.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Baïkal is a free, open-source, lightweight CalDAV and CardDAV server for self-hosting calendar and contact synchronization. It was created by Jérôme Schneider of Net Gusto, in collaboration with fruux, with its first commit dating to February 2012, and is now maintained by volunteer contributors as part of the sabre-io GitHub organization. Baïkal is built on top of sabre/dav, a widely used PHP framework for building WebDAV, CalDAV, and CardDAV servers, and adds a web-based administrative interface on top for managing users, address books, and calendars without needing to edit configuration files directly. It is distributed under the GNU GPL v3 license and requires only a PHP-capable web server plus either a MySQL or SQLite database, making installation straightforward compared to larger groupware suites. Baïkal is compatible with a wide range of CalDAV/CardDAV clients, including iOS and macOS Calendar/Contacts apps, DAVx5 on Android, and Mozilla Thunderbird. It can be installed via a web-based installer or via Docker. Because it is entirely free and self-hosted, Baïkal is popular among privacy-conscious individuals, homelab and self-hosting enthusiasts, and small teams who want to sync calendars and contacts across their own devices without relying on a third-party cloud calendar provider.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '140a021c-be44-4b36-b077-68c7c32ded9b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '140a021c-be44-4b36-b077-68c7c32ded9b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '140a021c-be44-4b36-b077-68c7c32ded9b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Web-based admin panel$q$, $q$Manage users, address books, and calendars through a browser interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$CalDAV and CardDAV protocol support$q$, $q$Standards-based calendar and contact synchronization compatible with major clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Broad client compatibility$q$, $q$Works with iOS, macOS, DAVx5 on Android, Thunderbird, and other CalDAV/CardDAV apps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$MySQL or SQLite storage$q$, $q$Choose between MySQL or SQLite as the backend database.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Simple installation$q$, $q$Requires only a PHP-capable server, with a web installer or Docker deployment option.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '140a021c-be44-4b36-b077-68c7c32ded9b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Free and open source under the GPL v3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Lightweight with minimal server requirements$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Broad compatibility with major calendar and contacts clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Simple installation via web installer or Docker$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '140a021c-be44-4b36-b077-68c7c32ded9b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Minimal feature set compared to full groupware suites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Development pace has slowed with less frequent releases$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Requires self-hosting and manual server maintenance$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '140a021c-be44-4b36-b077-68c7c32ded9b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Is Baïkal free?$q$, $q$Yes, Baïkal is free and open source under the GNU GPL v3 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$What protocols does Baïkal support?$q$, $q$Baïkal supports the CalDAV and CardDAV standards for calendar and contact synchronization.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$What server requirements does Baïkal have?$q$, $q$It requires a PHP-capable web server and either a MySQL or SQLite database.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Which apps work with Baïkal?$q$, $q$Baïkal is compatible with iOS and macOS Calendar/Contacts, DAVx5 on Android, Mozilla Thunderbird, and other CalDAV/CardDAV clients.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '140a021c-be44-4b36-b077-68c7c32ded9b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Privacy-focused calendar sync$q$, $q$Individuals who want to self-host calendar and contact sync instead of using a third-party cloud provider.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Homelab self-hosting$q$, $q$Self-hosting enthusiasts running personal infrastructure who want a lightweight CalDAV/CardDAV server.$q$, $q$Homelab and self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$Small team calendar sharing$q$, $q$Small teams or families wanting shared calendars and contacts without a commercial service.$q$, $q$Small teams and families$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '140a021c-be44-4b36-b077-68c7c32ded9b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Baïkal is a lightweight, self-hosted CalDAV and CardDAV server for syncing calendars and contacts. It was created by Jérôme Schneider of Net Gusto together with fruux, with its first commit dating to February 2012, and is now maintained by volunteer contributors under the sabre-io organization.$q$, $q$The project is built on top of sabre/dav, a PHP framework for WebDAV, CalDAV, and CardDAV servers, and adds a web-based administrative interface for managing users, address books, and calendars without editing configuration files by hand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Baïkal offers a straightforward web admin panel for user, address book, and calendar management, and is compatible with major CalDAV/CardDAV clients including iOS and macOS Calendar/Contacts, DAVx5 on Android, and Mozilla Thunderbird.$q$, $q$Installation requires only a PHP-capable server and either a MySQL or SQLite database, and the project supports both a standard web installer and Docker-based deployment.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Baïkal is completely free and open source under the GNU GPL v3 license, with no paid tiers or hosted offering from the project itself.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('140a021c-be44-4b36-b077-68c7c32ded9b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


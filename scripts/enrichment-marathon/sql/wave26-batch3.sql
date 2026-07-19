-- Enrichment marathon batch: Sonarr, Sonatype Nexus Repository, Sorted 3, SourceBans++, Sourcegraph Cody, SourceHut, Spark Mail, Speakeasy

-- ── Sonarr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sonarr is a free, open-source PVR that automatically monitors, downloads, and organizes TV show episodes from Usenet and BitTorrent sources.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sonarr Review: Free Open-Source TV Show PVR Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Sonarr is a free open-source PVR that auto-downloads, sorts, and renames TV episodes from Usenet and torrents. See features, setup, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sonarr is a free, open-source personal video recorder (PVR) application that automates the discovery, downloading, sorting, and renaming of TV show episodes. It originated as NZBDrone and was rebranded to Sonarr in 2014; it is now maintained by a volunteer community as part of the Servarr family of tools, alongside Radarr (movies), Lidarr (music), and Readarr (books). Sonarr connects to Usenet indexers and BitTorrent trackers to monitor RSS feeds for new episodes of tracked series, then sends matching releases to a configured download client (such as SABnzbd or qBittorrent). It applies customizable quality profiles, handles failed downloads by automatically retrying alternatives, and renames and organizes finished files into a structured media library, commonly used alongside Plex, Jellyfin, or Emby. It runs on Windows, macOS, Linux, Docker, and NAS platforms like Synology and QNAP. There is no company behind Sonarr and no paid tier; it is entirely free to self-host, with support available through Discord, GitHub, community forums, and a subreddit. It is best suited to technically comfortable users building a self-hosted home media automation stack rather than casual streaming consumers, since it requires pairing with separate indexers and download clients to function.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$RSS Monitoring and Auto-Grab$q$, $q$Continuously scans configured Usenet and torrent indexers for new episodes of tracked shows and automatically sends matches to a download client.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Customizable Quality Profiles$q$, $q$Lets users define preferred resolutions, codecs, and release groups so Sonarr always grabs the best available match.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Automatic Failed Download Handling$q$, $q$Detects stalled or corrupt downloads and blocks the release, retrying with the next best alternative automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Calendar View$q$, $q$Displays upcoming episode air dates and download status across the entire tracked library in one place.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Metadata and Renaming$q$, $q$Automatically renames and organizes downloaded files into a consistent folder and naming structure for media servers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Download Client Integration$q$, $q$Works with popular Usenet clients like SABnzbd and torrent clients like qBittorrent and Deluge.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Notification Integrations$q$, $q$Sends alerts to Discord, Slack, Telegram, email, and other services when episodes are grabbed or imported.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Docker and NAS Support$q$, $q$Runs natively on Windows, macOS, and Linux, plus Docker containers and NAS platforms like Synology and QNAP.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Completely free and open source with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Deep integration with popular indexers, download clients, and media servers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Highly configurable quality and naming rules$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Active, long-running community and frequent updates$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Runs on almost any platform, including Docker and NAS devices$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Requires pairing with separate indexers and download clients, adding setup complexity$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$No official cloud-hosted version; self-hosting only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Steep learning curve for non-technical users$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$No native mobile app for direct control, relying on the web UI or third-party apps$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Users are responsible for ensuring their indexer and content sources comply with local law$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$What is Sonarr?$q$, $q$Sonarr is a free, open-source PVR that automates finding, downloading, and organizing TV show episodes from Usenet and BitTorrent sources.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Is Sonarr free?$q$, $q$Yes. Sonarr is entirely free and open source, with no paid tier or subscription.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$What operating systems does Sonarr support?$q$, $q$Sonarr runs on Windows, macOS, Linux, Docker, and NAS platforms such as Synology and QNAP.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Does Sonarr download files itself?$q$, $q$No. Sonarr searches and sends releases to a separate download client, such as SABnzbd or qBittorrent, which performs the actual download.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$What is the difference between Sonarr and Radarr?$q$, $q$Sonarr manages TV series while Radarr, a related project from the same community, manages movies. Both share a similar interface and workflow.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Can I use Sonarr with Plex or Jellyfin?$q$, $q$Yes, Sonarr is commonly paired with Plex, Jellyfin, or Emby, since it organizes and renames files in a structure those media servers can read.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Does Sonarr require Usenet or torrent access?$q$, $q$Yes, Sonarr needs at least one configured indexer (Usenet or torrent) and a corresponding download client to function.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Is Sonarr legal to use?$q$, $q$Sonarr itself is legal open-source software for organizing and automating media downloads. Legality depends on the indexers and content users configure it to access, and users are responsible for complying with applicable laws.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Home media server automation$q$, $q$Automatically builds and maintains a complete, well-organized TV library for a home Plex or Jellyfin server.$q$, $q$Home theater and self-hosted media enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Multi-show episode tracking$q$, $q$Tracks dozens or hundreds of ongoing series simultaneously without manual checking.$q$, $q$TV viewers managing large watch libraries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Self-hosted NAS media management$q$, $q$Runs as a lightweight background service on NAS hardware to keep a media library current.$q$, $q$Synology and QNAP NAS owners$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full source code access","Unlimited use on unlimited devices","Community support via Discord, forums, and GitHub","Regular community-driven updates"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$overview$q$, $q$What Is Sonarr$q$, 2, ARRAY[$q$Sonarr is an open-source PVR (personal video recorder) designed specifically for TV series. Instead of manually searching for and downloading new episodes, Sonarr watches configured indexers for releases matching shows in your library and automatically grabs, verifies, renames, and files them away.$q$, $q$The project began life as NZBDrone before being rebranded Sonarr in 2014, and today it is one of the most widely used tools in the self-hosted media automation ecosystem, often deployed alongside Radarr, Prowlarr, and a media server like Plex or Jellyfin.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Sonarr's core strength is automation: it monitors RSS feeds from Usenet and torrent indexers, applies user-defined quality profiles to decide which release to grab, and automatically retries when a download fails or is later found to be corrupt or fake.$q$, $q$Beyond the grab-and-organize workflow, Sonarr offers a calendar view of upcoming episodes, flexible library views, notification integrations with services like Discord, Slack, and Telegram, and a built-in updater, all managed through a web-based interface accessible from any device on the network.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sonarr is completely free and open source under a permissive license, with no premium tier, subscription, or paywalled feature set. Users self-host the application on their own hardware, NAS device, or Docker environment.$q$, $q$Because there is no commercial entity behind Sonarr, support is community-driven rather than vendor-provided, delivered through Discord, IRC, the official forums, GitHub issues, and an active subreddit.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c01b8aa8-e51a-4b74-a8e0-6dc257e6bcaf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Sonatype Nexus Repository ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sonatype Nexus Repository is an artifact and binary repository manager that lets development teams store, secure, and distribute software components and containers across the build pipeline.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Community Edition); Pro pricing available on request$q$, starting_price),
  founded_year = COALESCE(2008, founded_year),
  company_size = COALESCE($q$501-1,000 employees$q$, company_size),
  headquarters = COALESCE($q$Fulton, Maryland, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sonatype Nexus Repository: Features, Pricing and Review$q$, seo_title),
  seo_meta_description = COALESCE($q$Sonatype Nexus Repository manages build artifacts and containers across Maven, npm, Docker, PyPI, and more. Compare Community vs Pro editions and pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sonatype Nexus Repository is a universal artifact repository manager used by software teams to store, proxy, secure, and distribute build outputs such as libraries, containers, and AI or ML models across the software development lifecycle. Built by Sonatype, a company founded in 2008 and headquartered in Fulton, Maryland, with roughly 500 to 1,000 employees, Nexus Repository is trusted by a large share of Fortune 100 companies and supports more than 20 package formats, including Maven, npm, Docker, PyPI, NuGet, RubyGems, Helm, Cargo, Conda, and Hugging Face models. It is offered in two editions: a free Community Edition aimed at small teams needing core repository management, and a paid Pro edition adding enterprise features such as single sign-on and SAML authentication, high availability, disaster recovery, replication, and integration with Sonatype Repository Firewall for malware and open-source risk detection. Deployment options include self-hosted (on-premises or private cloud), fully managed SaaS, and air-gapped disconnected environments for high-security use cases. Pro pricing is not published and requires contacting Sonatype's sales team; it typically scales with usage and organization size. Nexus Repository is aimed primarily at DevOps, platform engineering, and security teams that need a centralized, auditable source of truth for build artifacts and container images feeding CI/CD pipelines.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba780fa8-7453-4d31-a091-d99288158644';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba780fa8-7453-4d31-a091-d99288158644' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Universal Format Support$q$, $q$Manages more than 20 package and container formats, including Maven, npm, Docker, PyPI, NuGet, and Helm, from a single server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Proxy Repositories and Local Caching$q$, $q$Caches remote dependencies locally to cut build latency and reduce reliance on public registries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Role-Based Access Control$q$, $q$Fine-grained permissions control who can read, write, or administer specific repositories and formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$High Availability and Disaster Recovery$q$, $q$Pro-tier clustering and replication keep repositories available and resilient for large organizations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Audit Trails and Component Metadata$q$, $q$Tracks the origin, publisher, and history of every artifact for compliance and traceability.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Repository Firewall Integration$q$, $q$Flags malware and open-source risk in incoming components before they enter the build pipeline.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$REST API and CI/CD Integrations$q$, $q$Connects to Jenkins, GitHub Actions, and other pipeline tools via a documented REST API.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Flexible Deployment Options$q$, $q$Available as SaaS, self-hosted, or fully air-gapped for regulated and high-security environments.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Broad support for more than 20 package and container formats in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Trusted by a large share of Fortune 100 companies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Strong security and compliance integrations via Repository Firewall$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Flexible deployment: SaaS, self-hosted, or air-gapped$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Free Community Edition available for smaller teams$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Pro pricing is not publicly listed and requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Advanced features like high availability are gated behind the paid Pro tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Can be resource-intensive to self-host at large scale$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Initial configuration and format setup can be complex for smaller teams$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$What is Sonatype Nexus Repository used for?$q$, $q$It is used to store, proxy, secure, and distribute software build artifacts, dependencies, and container images across the development pipeline.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Is there a free version of Nexus Repository?$q$, $q$Yes, the Community Edition is free and provides core repository management for smaller teams.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$What is the difference between Nexus Repository Community and Pro?$q$, $q$Pro adds enterprise features such as SSO/SAML, high availability, disaster recovery, replication, and Repository Firewall integration that are not in the free Community Edition.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$What package formats does Nexus Repository support?$q$, $q$It supports more than 20 formats, including Maven, npm, Docker, PyPI, NuGet, RubyGems, Helm, Cargo, Conda, Composer, and Hugging Face models.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Can Nexus Repository be hosted in the cloud?$q$, $q$Yes, Sonatype offers a fully managed SaaS deployment in addition to self-hosted and air-gapped options.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Does Sonatype publish Nexus Repository Pro pricing?$q$, $q$No, Pro pricing is custom and requires contacting Sonatype's sales team for a quote.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Who owns Sonatype?$q$, $q$Sonatype has been backed by Vista Equity Partners since a 2019 investment.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Does Nexus Repository integrate with CI/CD tools?$q$, $q$Yes, it exposes a REST API and integrates with common CI/CD tools such as Jenkins and GitHub Actions.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Centralized artifact management for enterprise builds$q$, $q$Consolidates dependencies, internal packages, and container images into one governed repository.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Secure software supply chain management$q$, $q$Proxies and audits third-party components to reduce open-source risk and malware exposure.$q$, $q$Security and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Container and Kubernetes image registry$q$, $q$Serves as a private Docker registry for teams running containerized workloads.$q$, $q$Engineering teams running Docker and Kubernetes$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Core repository management","Support for major package formats","Self-hosted deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$Pro$q$, $q$Custom (contact sales)$q$, $q$Typically annual$q$, NULL, $q$["High availability and disaster recovery","SAML and SSO support","Advanced role-based access control","Repository Firewall integration","Priority vendor support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'ba780fa8-7453-4d31-a091-d99288158644';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$overview$q$, $q$What Is Sonatype Nexus Repository$q$, 2, ARRAY[$q$Sonatype Nexus Repository is a binary and artifact repository manager that acts as the single source of truth for everything a software build produces or consumes, from third-party libraries pulled from public registries to internally built packages and container images.$q$, $q$It is developed by Sonatype, a DevSecOps and software supply chain security company founded in 2008 and headquartered in Fulton, Maryland, which also builds the related Sonatype Repository Firewall and Sonatype Lifecycle products for open-source risk management.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Nexus Repository supports more than 20 package formats in a single server, including Maven, npm, Docker, PyPI, NuGet, RubyGems, Helm charts, Cargo, Conan, Composer, Conda, Yum, and Hugging Face models, so organizations can consolidate multiple format-specific registries into one platform.$q$, $q$Enterprise-focused capabilities include role-based access control, TLS encryption, SAML and SSO support, proxy repositories with local caching that can dramatically cut build times, complete audit trails of component origin and publication, and integration with Repository Firewall for automated malware and vulnerability alerts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba780fa8-7453-4d31-a091-d99288158644', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Nexus Repository is available as a free Community Edition, which covers core artifact storage, proxying, and hosting for smaller teams, and as a paid Pro edition that unlocks high availability, disaster recovery, replication, and advanced security integrations.$q$, $q$Sonatype does not publish Pro pricing on its website; prospective customers must request a quote, and cost typically depends on deployment size, number of repository formats used, and whether the customer chooses self-hosted, SaaS, or air-gapped deployment.$q$]::text[], 2);


-- ── Sorted 3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sorted 3 (Sorted3) is a Mac and iOS productivity app that merges tasks, calendar events, and notes into a single hyper-scheduled timeline.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Pro unlock from $14.99 one-time on iOS)$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Hong Kong$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sorted 3 Review: Mac and iOS Task and Calendar App$q$, seo_title),
  seo_meta_description = COALESCE($q$Sorted 3 merges tasks, calendar events, and notes into one timeline for Mac and iOS. See features, pricing, and how Sorted3 compares to other planners.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sorted 3, also styled Sorted3, is a task, calendar, and notes app for macOS and iOS made by StaySorted Limited, a company founded in 2015 and based in Hong Kong. Its core idea is a unified timeline that combines to-do tasks, calendar events, and richly formatted notes into one hyper-scheduled daily view, so users can drag and reorder their day using a feature called the Time Ruler rather than juggling separate apps. Other notable features include Magic Select for bulk editing multiple items at once, natural language input for fast task entry, iCloud sync across iPhone, iPad, and Mac, home screen and lock screen widgets, customizable repeat rules, light and dark themes, a URL scheme for automation, and Siri integration. Sorted 3 follows a freemium model: a free tier covers the core timeline and basic scheduling, while a Pro unlock removes limits and adds Magic Select, advanced repeat rules, and widgets, priced as a one-time purchase of $14.99 on iOS and $24.99 on Mac. The app is Apple-ecosystem only, with no Android, Windows, or web version, and has earned a 4.8-star App Store rating from more than 21,000 reviews plus recognition as an Apple App of the Day in over 130 regions. It suits individuals who want time-blocking style planning tightly integrated with Apple devices.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Unified Timeline$q$, $q$Combines tasks, calendar events, and notes into a single scrollable daily and weekly view.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Time Ruler$q$, $q$A drag-and-drop scheduling tool for quickly reshaping the day's plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Magic Select$q$, $q$Lets users select and bulk-edit multiple tasks or events at once.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Natural Language Input$q$, $q$Creates tasks and events from plain-language phrases without manual field entry.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$iCloud Sync$q$, $q$Keeps the timeline consistent in real time across iPhone, iPad, and Mac.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Widgets$q$, $q$Home screen and lock screen widgets on iOS and macOS for at-a-glance scheduling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Custom Repeat Rules$q$, $q$Supports flexible, powerful recurrence patterns for recurring tasks and events.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Siri and URL Scheme Integration$q$, $q$Enables voice task capture and automation with Shortcuts and other Apple tools.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Clean, unified timeline reduces app-switching between calendar and to-do list$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Deep Apple ecosystem integration, including widgets and Siri$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$One-time Pro purchase option instead of a forced subscription$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Fast natural language task entry$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Highly rated on the App Store with over 21,000 reviews$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Apple ecosystem only, no Android, Windows, or web version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$No standalone web app for browser-based access$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Some advanced features are locked behind the Pro unlock$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Small independent team means slower feature velocity than larger competitors like Todoist$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$What is Sorted 3?$q$, $q$Sorted 3 (Sorted3) is a Mac and iOS app that combines tasks, calendar events, and notes into one unified, drag-and-drop timeline.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Is Sorted 3 free?$q$, $q$Yes, a free version is available with core timeline and scheduling features; a paid Pro unlock adds advanced tools.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$What platforms does Sorted 3 support?$q$, $q$Sorted 3 is available on iPhone, iPad, and Mac, with iCloud sync across devices.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Who makes Sorted 3?$q$, $q$Sorted 3 is developed by StaySorted Limited, founded in 2015 and based in Hong Kong.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Is there an Android version of Sorted 3?$q$, $q$No, Sorted 3 is exclusive to Apple platforms and has no Android release.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Does Sorted 3 sync across devices?$q$, $q$Yes, it uses iCloud sync to keep the timeline current across iPhone, iPad, and Mac in real time.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$What is the Time Ruler feature?$q$, $q$The Time Ruler is Sorted 3's drag-and-drop tool for quickly rearranging tasks and events within the day.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Is Sorted 3 a one-time purchase or subscription?$q$, $q$The Pro unlock is a one-time purchase, priced at $14.99 on iOS and $24.99 on Mac, rather than a recurring subscription.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Daily time-blocking for professionals$q$, $q$Combines meetings, tasks, and notes into one schedulable timeline for focused daily planning.$q$, $q$Knowledge workers managing dense schedules$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Combining notes and to-dos in one place$q$, $q$Keeps richly formatted notes next to related tasks and events instead of in a separate notes app.$q$, $q$Students and personal organizers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Cross-device planning across Apple devices$q$, $q$Keeps a single synced schedule available on iPhone, iPad, and Mac throughout the day.$q$, $q$Apple ecosystem users$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Free$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Core unified timeline","Basic task and event scheduling","iCloud sync"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Pro (iOS)$q$, $q$$14.99$q$, $q$One-time purchase$q$, NULL, $q$["Magic Select","Advanced repeat rules","Widgets","Full Time Ruler functionality"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$Pro (Mac)$q$, $q$$24.99$q$, $q$One-time purchase$q$, NULL, $q$["Magic Select","Advanced repeat rules","Widgets","Full Time Ruler functionality"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'ee31d20d-7b66-46e5-8a2d-1857b726db37';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$overview$q$, $q$What Is Sorted 3$q$, 2, ARRAY[$q$Sorted 3 is a personal productivity app built around a single unified timeline that blends tasks, calendar events, and notes, letting users see and rearrange their entire day in one visual space instead of switching between a calendar app and a separate to-do list.$q$, $q$It is developed by StaySorted Limited, a Hong Kong-based studio founded in 2015, and is available on iPhone, iPad, and Mac with iCloud sync keeping the timeline consistent across devices.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The signature Time Ruler lets users drag tasks and events to reshape their schedule with a few taps, while Magic Select enables bulk actions like rescheduling or tagging several items at once. Natural language input allows quick task creation by typing phrases like 'lunch with Sam tomorrow at noon' directly into the timeline.$q$, $q$Additional features include home and lock screen widgets, powerful custom repeat rules for recurring tasks, light and dark themes, a URL scheme for automation with tools like Shortcuts, and Siri integration for voice-based task capture.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee31d20d-7b66-46e5-8a2d-1857b726db37', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sorted 3 uses a freemium model: the free version includes the core unified timeline, basic scheduling, and iCloud sync, which is enough for lightweight personal use.$q$, $q$Unlocking the full Pro feature set, including Magic Select, advanced repeat rules, and widgets, is a one-time purchase rather than a recurring subscription, priced at $14.99 on iOS and $24.99 on Mac.$q$]::text[], 2);


-- ── SourceBans++ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SourceBans++ is a free, source-available admin and ban management system for Source-engine game servers such as Counter-Strike, Team Fortress 2, and Garrys Mod.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SourceBans++ Review: Free Ban Management for Source Servers$q$, seo_title),
  seo_meta_description = COALESCE($q$SourceBans++ is a free admin and ban management tool for Source-engine game servers like CS, TF2, and Garrys Mod. See features and setup requirements.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SourceBans++ is a free, source-available admin, ban, and communications management system built for game servers running on Valve's Source and Source 2 engines, including Counter-Strike (Source, Global Offensive, and 2), Team Fortress 2, Garrys Mod, Day of Defeat: Source, Left 4 Dead and Left 4 Dead 2, Insurgency, and other SourceMod-compatible titles. It is an enhanced, community-maintained fork of the original SourceBans project and has been actively supported since 2015. The system has two connected halves: a PHP and MySQL web admin panel where server administrators manage bans, mutes, server access, and admin permissions, and a set of SourceMod plugins running on each game server that enforce those decisions in-game and report new admin actions back to the panel in real time, so a ban applied on one server can propagate instantly across every connected server. SourceBans++ is maintained by an open-source development team (github.com/sbpp) with more than 2,000 servers reported to run it. Self-hosting is, and will remain, completely free; a separate commercial managed-hosting alternative called RookHelm exists for operators who prefer not to self-host. There is no company, founding date, or headquarters associated with the project itself, as it is a community-driven open-source tool rather than a commercial product.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Web Admin Panel$q$, $q$Centralized PHP-based panel for managing bans, mutes, server access, and admin permissions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$SourceMod Plugin Integration$q$, $q$In-game plugins enforce panel decisions directly on the game server.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Real-Time Ban Propagation$q$, $q$Bans and mutes issued on one server sync instantly across all connected servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Admin Permission Management$q$, $q$Fine-grained control over which admins can take which actions on which servers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Multi-Server Support$q$, $q$Manages an unlimited number of connected game servers from a single panel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Ban History and Comms Logging$q$, $q$Keeps a searchable record of past bans, mutes, and admin actions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Broad Game Support$q$, $q$Works with Counter-Strike, Team Fortress 2, Garrys Mod, Left 4 Dead, Insurgency, and other SourceMod-compatible titles.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Self-Hosted, Free Deployment$q$, $q$Runs entirely on infrastructure the operator controls, with no licensing cost.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Completely free to self-host with no license fee$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Wide support across Source and Source 2 engine games$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Real-time ban and mute sync across multiple servers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Actively maintained on GitHub since 2015$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Extensible through the broader SourceMod plugin ecosystem$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Requires manual PHP, MySQL, and SourceMod setup and maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$No official managed hosting from the project itself, only third-party options$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Web interface is dated compared to modern SaaS admin panels$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Support is community-based through forums rather than a dedicated vendor$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$What is SourceBans++?$q$, $q$SourceBans++ is a free, source-available web panel and SourceMod plugin suite for managing bans, mutes, and admin permissions on Source-engine game servers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Is SourceBans++ free?$q$, $q$Yes, self-hosting SourceBans++ is completely free and, according to the project, will remain that way.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$What games does SourceBans++ support?$q$, $q$It supports Source and Source 2 titles with a SourceMod release, including Counter-Strike, Team Fortress 2, Garrys Mod, Left 4 Dead, Day of Defeat: Source, and Insurgency.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$What do I need to install SourceBans++?$q$, $q$A web server with PHP, a MySQL database, and SourceMod installed on each connected game server.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$What is the difference between SourceBans and SourceBans++?$q$, $q$SourceBans++ is a community-maintained, actively developed fork of the original SourceBans project, adding fixes and features since 2015.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Does SourceBans++ sync bans across multiple servers?$q$, $q$Yes, bans and mutes issued on one connected server propagate in real time to all other connected servers.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Is there managed hosting for SourceBans++?$q$, $q$The core project is self-hosted only; a third-party service called RookHelm offers commercial managed hosting as an alternative.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Does SourceBans++ require SourceMod?$q$, $q$Yes, SourceMod must be installed on each game server so the SourceBans++ plugins can enforce bans and mutes in-game.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Multi-server ban and admin management$q$, $q$Gives community operators one panel to manage moderation across every server they host.$q$, $q$Source-engine game server hosts and network admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Competitive community moderation$q$, $q$Centralizes ban enforcement and admin oversight for active Counter-Strike or Team Fortress 2 communities.$q$, $q$Esports and community server operators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Budget-friendly ban management$q$, $q$Provides a full-featured alternative to paid ban management services at no licensing cost.$q$, $q$Budget-conscious independent server owners$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full web admin panel","SourceMod plugin suite","Unlimited connected servers","Community support via forums and GitHub"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$overview$q$, $q$What Is SourceBans++$q$, 2, ARRAY[$q$SourceBans++ is an admin and ban-management platform purpose-built for Source-engine game servers. It gives community and clan server operators a centralized web panel to manage bans, mutes, and admin permissions across every server they run.$q$, $q$The project is a community-maintained, source-available fork of the original SourceBans, actively supported since 2015 and still developed on GitHub, with a large install base reported at over 2,000 servers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The system pairs a PHP and MySQL web panel with SourceMod plugins installed on each game server. When an admin issues a ban, mute, or other action from the panel or in-game, it is enforced immediately and synced in real time to every connected server.$q$, $q$SourceBans++ supports a wide range of Source and Source 2 titles with a SourceMod release, including Counter-Strike, Team Fortress 2, Garrys Mod, Left 4 Dead 1 and 2, Day of Defeat: Source, Insurgency, and NMRiH, making it a common choice for multi-server communities running mixed game rosters.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SourceBans++ is free to self-host and always will be, according to the project's own documentation, with no license fee for the software itself.$q$, $q$For operators who would rather not manage the PHP, MySQL, and SourceMod setup themselves, a separate commercial managed-hosting service called RookHelm is available as a paid alternative, though it is a third-party offering rather than an official SourceBans++ product.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad1df877-1fe0-4d53-a6f8-8ba97ca5b88b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Sourcegraph Cody ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sourcegraph Cody is an enterprise AI coding assistant that uses Sourcegraph's code graph to give large language models deep context from an organizations entire remote codebase.$q$, short_description),
  pricing_model = COALESCE($q$subscription (bundled with Sourcegraph Enterprise)$q$, pricing_model),
  starting_price = COALESCE($q$Custom pricing (Enterprise only)$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$101-250 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sourcegraph Cody Review: Enterprise AI Coding Assistant$q$, seo_title),
  seo_meta_description = COALESCE($q$Sourcegraph Cody is an enterprise AI coding assistant with full codebase context. See features, pricing, and how it compares to Copilot and Cursor.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sourcegraph Cody is an AI coding assistant built by Sourcegraph, a code intelligence company founded in 2013 and headquartered in San Francisco with an estimated 100 to 250 employees. Cody's differentiator is context: rather than relying only on locally open files like many editor-based AI assistants, it uses Sourcegraph's code search and graph engine to pull relevant functions, types, and usage patterns from across an organization's entire remote codebase, including large multi-repository enterprise monorepos with millions of lines of code. Features include an AI chat interface for asking questions about code, generating and editing code, auto-edit contextual suggestions based on cursor position, customizable shared prompts for common team workflows, and support in VS Code, JetBrains IDEs, an experimental Visual Studio integration, the Sourcegraph web app, and a command-line interface, with code host integrations for GitHub and GitLab. As of mid-2025, Sourcegraph discontinued the self-serve Cody Free and Cody Pro plans; Cody is now available exclusively as part of a Sourcegraph Enterprise subscription, which is sold on a custom-quoted annual contract reported to start in the tens of thousands of dollars and has previously been reported at roughly $59 per user per month. This makes Cody best suited to larger engineering organizations already using or considering Sourcegraph Enterprise rather than individual developers or small teams.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Codebase-Wide Context$q$, $q$Pulls relevant code, types, and usage patterns from an organization's entire remote codebase via Sourcegraph's search engine.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$AI Chat for Code Understanding and Generation$q$, $q$Lets developers ask questions, generate code, and request edits in natural language.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Auto-Edit Contextual Suggestions$q$, $q$Offers inline code suggestions based on cursor position and recent edits.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Customizable Shared Prompts$q$, $q$Teams can build and share reusable prompts for common coding and documentation tasks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Multi-IDE Support$q$, $q$Available in VS Code, JetBrains IDEs, and an experimental Visual Studio integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Large Monorepo Awareness$q$, $q$Designed to stay useful in enterprise codebases spanning millions of lines across many repositories.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$CLI and Web App Access$q$, $q$Usable outside the IDE via a command-line interface and the Sourcegraph web application.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$GitHub and GitLab Integration$q$, $q$Connects directly to major code hosts to index and search an organization's repositories.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Deep context from an entire remote codebase, not just open files$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Well suited to very large enterprise monorepos$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Integrates with major IDEs developers already use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Backed by Sourcegraph's mature code search infrastructure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Built for enterprise governance and security needs$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$No self-serve free or Pro tier since mid-2025; Enterprise only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Pricing requires a sales contract and is less transparent than tools like GitHub Copilot or Cursor$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Best suited to large organizations rather than individuals or small teams$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Requires a Sourcegraph Enterprise deployment to access Cody at all$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$What is Sourcegraph Cody?$q$, $q$Cody is Sourcegraph's AI coding assistant, which uses Sourcegraph's code search and graph engine to give LLMs context from an organization's entire remote codebase.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Is Cody free to use?$q$, $q$No longer as a standalone plan. Sourcegraph discontinued the self-serve Cody Free and Cody Pro tiers in mid-2025; Cody is now included only with Sourcegraph Enterprise.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$What is the difference between Cody and GitHub Copilot?$q$, $q$Copilot primarily uses local file context, while Cody pulls context from an organization's full remote codebase across many repositories via Sourcegraph's search index.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$What IDEs does Cody support?$q$, $q$Cody is available in VS Code, JetBrains IDEs, an experimental Visual Studio integration, the Sourcegraph web app, and a CLI.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Does Cody require a full Sourcegraph Enterprise license?$q$, $q$Yes, as of mid-2025 Cody is only accessible through a Sourcegraph Enterprise subscription.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$How does Cody get codebase context?$q$, $q$It uses Sourcegraph's existing code search and graph engine to retrieve relevant functions, types, and usage patterns from across an organization's repositories.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Who founded Sourcegraph?$q$, $q$Sourcegraph was founded in 2013 and is headquartered in San Francisco, California.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Can individual developers still sign up for Cody?$q$, $q$No, self-serve individual plans were discontinued in mid-2025; Cody now requires an organization's Sourcegraph Enterprise contract.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$AI-assisted development in large monorepos$q$, $q$Helps engineers navigate and modify code safely across sprawling enterprise codebases.$q$, $q$Engineering teams at large enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Faster developer onboarding$q$, $q$Lets new engineers ask natural-language questions about unfamiliar systems instead of manually tracing code.$q$, $q$New engineers joining complex codebases$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Standardized AI-assisted code review and refactoring$q$, $q$Uses shared prompts to apply consistent patterns for tests, documentation, and refactors across teams.$q$, $q$Platform and developer experience teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$Sourcegraph Enterprise (includes Cody)$q$, $q$Custom, publicly referenced starting around $16,000$q$, $q$Annual contract$q$, NULL, $q$["Cody AI coding assistant","Codebase search and navigation","Batch Changes, Insights, and Monitoring","MCP Server, API, and CLI access","Single-tenant cloud deployment option","24x5 enterprise support with upgrade options"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'f0a80f4d-54d7-42de-ad76-cecc618d9b90';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$overview$q$, $q$What Is Sourcegraph Cody$q$, 2, ARRAY[$q$Sourcegraph Cody is an AI coding assistant from Sourcegraph, a San Francisco company founded in 2013 that built its reputation on large-scale code search and code intelligence for enterprise engineering teams.$q$, $q$Cody's core idea is codebase-aware AI: it pairs a large language model with Sourcegraph's existing search and code graph so that answers, generated code, and suggestions are grounded in an organization's real, current codebase rather than only the file currently open in an editor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Cody offers an AI chat interface for asking questions about unfamiliar code, generating new code, and requesting edits, plus auto-edit suggestions that adapt to cursor position and recent changes. Teams can create and share customizable prompts for repeatable workflows like writing tests or documentation.$q$, $q$Because it draws context from Sourcegraph's search index, Cody can reference relevant functions, types, and patterns from across many repositories at once, which is particularly useful in large enterprise monorepos where a single file rarely tells the whole story. It is available in VS Code, JetBrains IDEs, an experimental Visual Studio integration, the Sourcegraph web app, and a CLI, and integrates with GitHub and GitLab code hosts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0a80f4d-54d7-42de-ad76-cecc618d9b90', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$As of mid-2025, Sourcegraph stopped accepting new sign-ups for the self-serve Cody Free and Cody Pro plans and terminated existing accounts, folding Cody entirely into Sourcegraph Enterprise.$q$, $q$Sourcegraph Enterprise is sold on a custom-quoted annual contract; its public pricing page lists a starting reference figure in the tens of thousands of dollars for larger deployments, while Cody-specific access has also been reported at around $59 per user per month under earlier enterprise contract terms. Exact pricing depends on team size, deployment model, and AI usage volume, and requires contacting Sourcegraph's sales team.$q$]::text[], 2);


-- ── SourceHut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SourceHut is an independent, privacy-focused software forge offering Git and Mercurial hosting, bug tracking, continuous integration, and mailing lists without ads or tracking.$q$, short_description),
  pricing_model = COALESCE($q$subscription (pay-what-you-can, tiered)$q$, pricing_model),
  starting_price = COALESCE($q$$4/month$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SourceHut Review: Privacy-First Git Hosting and Forge$q$, seo_title),
  seo_meta_description = COALESCE($q$SourceHut is an independent, ad-free software forge with Git/Mercurial hosting, CI, bug tracking, and mailing lists. See features and pay-what-you-can pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SourceHut is an independent software forge created by developer Drew DeVault, launched to public alpha on November 15, 2018, as a minimalist, privacy-first alternative to platforms like GitHub and GitLab. It bundles Git and Mercurial repository hosting with continuous integration (builds.sr.ht), mailing-list-based code review and discussion (lists.sr.ht), and issue tracking (via its built-in tracker) into one connected suite of tools. SourceHut's stated principles include no tracking or advertising, full functionality without JavaScript, and being 100 percent open-source software that anyone can self-host. Its pricing model is unusual: rather than differentiating features by tier, all paid subscriptions unlock the same feature set, and users choose a monthly contribution of $4, $8, or $12 (or the euro equivalent) according to their means, with a discount for annual billing and financial aid available on request. Payment is only required to host one's own projects; creating an account to contribute to existing projects hosted on SourceHut is free. As a solo-founder-led, independent project rather than a venture-backed company, SourceHut does not publish employee counts or a formal headquarters. It is most popular with open-source maintainers and developers who prefer a mailing-list-centric, Linux-kernel-style collaboration workflow over pull requests, and who value privacy and minimalism over a polished modern interface.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '65ac1159-3886-4555-9998-daa1111a04b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '65ac1159-3886-4555-9998-daa1111a04b1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Git and Mercurial Hosting$q$, $q$Hosts repositories for both Git and Mercurial version control systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Built-In Continuous Integration$q$, $q$builds.sr.ht runs automated builds and tests without needing a separate third-party CI service.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Mailing List Code Review$q$, $q$lists.sr.ht supports a mailing-list-based patch and discussion workflow favored by many established open-source projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Issue and Bug Tracking$q$, $q$SourceHut's built-in issue tracker provides lightweight tracking integrated with the rest of the suite.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$No Tracking or Advertising$q$, $q$The platform states it does not track users or display ads anywhere in its products.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Works Without JavaScript$q$, $q$All core features are accessible even with JavaScript disabled, keeping pages fast and lightweight.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Fully Open-Source and Self-Hostable$q$, $q$The entire platform's source code is open, so organizations can self-host their own instance.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Pay-What-You-Can Pricing Tiers$q$, $q$Subscribers choose a monthly contribution level rather than being gated by a feature-based tier.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Strong privacy stance with no tracking or advertising$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Fully open source and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Works without JavaScript for a fast, lightweight experience$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Affordable pay-what-you-can pricing with financial aid available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Built-in CI and mailing-list workflows favored by many established open-source projects$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Less polished, modern interface than GitHub or GitLab$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Smaller community and ecosystem than mainstream forges$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Mailing-list-centric workflow has a learning curve for developers used to pull requests$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Fewer built-in project management features compared to GitHub$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$What is SourceHut?$q$, $q$SourceHut is an independent, privacy-focused software forge offering Git and Mercurial hosting, continuous integration, mailing lists, and issue tracking.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Who created SourceHut?$q$, $q$SourceHut was created by developer Drew DeVault and launched to public alpha in November 2018.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$How much does SourceHut cost?$q$, $q$Paid tiers are $4, $8, or $12 per month (or the euro equivalent), chosen according to what the user can afford, with all tiers offering the same features.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Is SourceHut free to use?$q$, $q$Creating an account to contribute to existing projects is free; paying is only required to host your own projects on SourceHut.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Does SourceHut support pull requests like GitHub?$q$, $q$SourceHut favors a mailing-list-based patch review workflow rather than GitHub-style pull requests, though it can be adapted to different workflows.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Can I self-host SourceHut?$q$, $q$Yes, SourceHut is 100 percent open-source software and can be self-hosted by anyone.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Does SourceHut track users or show ads?$q$, $q$No, SourceHut states it has no tracking or advertising anywhere on the platform.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$What services are included in a SourceHut subscription?$q$, $q$A subscription covers Git and Mercurial hosting, continuous integration, mailing lists, and issue tracking across the SourceHut suite.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Hosting free and open-source software projects$q$, $q$Provides repository hosting, CI, and issue tracking for open-source maintainers who value privacy.$q$, $q$Open-source project maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Mailing-list-based code review and collaboration$q$, $q$Supports patch-based, mailing-list-centric development workflows used by many long-running open-source projects.$q$, $q$Developers used to Linux kernel-style workflows$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Self-hosted software forge for organizations$q$, $q$Lets teams run their own fully open-source instance of the entire SourceHut suite.$q$, $q$Organizations wanting full control over their development infrastructure$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Amateur Hackers$q$, $q$$4/month (EUR4/month)$q$, $q$Monthly, about 2 months free if paid annually$q$, NULL, $q$["Git and Mercurial hosting","Continuous integration","Bug tracking","Mailing lists"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Typical Hackers$q$, $q$$8/month (EUR8/month)$q$, $q$Monthly, about 2 months free if paid annually$q$, NULL, $q$["Same feature set as Amateur Hackers tier","Higher pay-what-you-can contribution"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$Professional Hackers$q$, $q$$12/month (EUR12/month)$q$, $q$Monthly, about 2 months free if paid annually$q$, NULL, $q$["Same feature set as other tiers","Highest pay-what-you-can contribution"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '65ac1159-3886-4555-9998-daa1111a04b1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$overview$q$, $q$What Is SourceHut$q$, 2, ARRAY[$q$SourceHut is a software forge built and maintained by developer Drew DeVault, launched to public alpha in November 2018 as a deliberately minimal, privacy-respecting alternative to mainstream platforms like GitHub and GitLab.$q$, $q$Rather than a single monolithic product, SourceHut is a suite of independent tools, including git.sr.ht and hg.sr.ht for repository hosting, builds.sr.ht for continuous integration, lists.sr.ht for mailing lists, and SourceHut's built-in issue tracker, that interoperate but can also be used individually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SourceHut emphasizes privacy and simplicity: the platform states it has no tracking or advertising, and all core features work without JavaScript, appealing to developers who want a lightweight, fast interface.$q$, $q$The platform is 100 percent open source and self-hostable, and favors a mailing-list-based code review workflow reminiscent of projects like the Linux kernel, alongside built-in CI and issue tracking that many competing forges only offer through third-party add-ons.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SourceHut uses a pay-according-to-your-means model with three tiers, Amateur Hackers, Typical Hackers, and Professional Hackers, priced at $4, $8, and $12 per month respectively (or the euro equivalent), with no functional difference between them beyond the contribution amount.$q$, $q$Paying annually gives roughly two months free compared to monthly billing, and users experiencing financial hardship can request aid; contributing to projects already hosted on SourceHut does not require a paid account at all.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65ac1159-3886-4555-9998-daa1111a04b1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Spark Mail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spark Mail is an AI-powered email client from Readdle that offers a Smart Inbox, team collaboration, and AI writing and meeting-notes features across desktop and mobile.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Plus from EUR10/month per user)$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Odesa, Ukraine$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Spark Mail Review: AI Email Client Features and Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Spark Mail is an AI-powered email app with Smart Inbox and team features from Readdle. Compare Free, Plus, Pro, and Enterprise pricing plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spark Mail is an email client built by Readdle, a productivity software company founded in 2007 in Odesa, Ukraine, which also makes PDF Expert, Scanner Pro, Documents, and Calendars. Spark itself launched in 2015 and has since evolved into an AI-assisted email app centered on a Smart Inbox that automatically prioritizes important messages, alongside Spark plus AI features such as an AI writing assistant and AI-generated meeting notes. It is available across iOS, Android, Mac, Windows, and the web, and supports team use cases like shared drafts, delegation, comments, and custom email templates in addition to personal email. Pricing follows a freemium model with four tiers: a Free plan with unlimited accounts and a Smart Inbox; Plus at roughly EUR10 per user per month (about EUR8.25 per month billed annually) adding the AI writing assistant and 40 AI meeting notes monthly; Pro at roughly EUR22 per user per month (about EUR19.08 per month billed annually) adding unlimited AI meeting notes, read statuses, HubSpot integration, and a command-line tool; and a custom-priced Enterprise plan adding advanced security controls and a dedicated success manager. All paid plans include a 7-day free trial. Readdle now employs several hundred people across more than 30 locations, including hubs in Odesa, Kyiv, London, Warsaw, and Berlin, making Spark best suited to individuals and small-to-midsize teams that want AI assistance layered directly into a familiar email workflow.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Smart Inbox$q$, $q$Automatically separates and prioritizes important email from newsletters and notifications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Spark plus AI Writing Assistant$q$, $q$Helps draft, rewrite, and refine emails using AI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$AI Meeting Notes$q$, $q$Automatically generates notes from meetings, with quotas that scale by plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Team Collaboration$q$, $q$Supports shared drafts, delegation, and internal comments on team inboxes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Custom Email Templates$q$, $q$Lets users and teams save and reuse frequently sent email formats.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Cross-Platform Apps$q$, $q$Available on iOS, Android, Mac, Windows, and the web with synced accounts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Productivity Integrations$q$, $q$Connects with calendars and tools such as HubSpot for sales and support workflows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Spark CLI$q$, $q$A command-line interface for power users on the Pro plan.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Unifies multiple email accounts in one Smart Inbox$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Useful built-in AI writing and meeting-notes tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Strong team collaboration features for shared inboxes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Available across all major desktop and mobile platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Generous free tier covers core everyday email needs$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Full AI features require the paid Plus or Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$AI usage is credit-limited even on paid tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Some advanced workflow features are not yet fully available$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Per-user pricing can add up for larger teams$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$What is Spark Mail?$q$, $q$Spark Mail is an AI-assisted email client with a Smart Inbox, team collaboration tools, and AI writing and meeting-notes features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Who makes Spark Mail?$q$, $q$Spark Mail is developed by Readdle, a productivity software company founded in 2007 in Odesa, Ukraine.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Is Spark Mail free?$q$, $q$Yes, a Free plan is available with unlimited email accounts and the Smart Inbox; AI features and advanced team tools require a paid plan.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$What is included in Spark plus AI?$q$, $q$Spark plus AI includes an AI writing assistant and AI-generated meeting notes, with the number of monthly notes varying by plan.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Does Spark Mail support team email collaboration?$q$, $q$Yes, paid plans include shared drafts, delegation, internal comments, and other team collaboration tools.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$What platforms does Spark Mail run on?$q$, $q$Spark Mail is available on iOS, Android, Mac, Windows, and the web.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$What is the difference between Spark Plus and Spark Pro?$q$, $q$Plus includes limited monthly AI meeting notes and essential team features, while Pro adds unlimited AI meeting notes, read statuses, HubSpot integration, and Spark CLI.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Does Spark Mail offer an Enterprise plan?$q$, $q$Yes, Enterprise offers custom pricing with advanced security controls and a dedicated success manager.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Personal email triage with AI assistance$q$, $q$Uses the Smart Inbox and AI writing tools to clear email faster for individual users.$q$, $q$Individual professionals managing multiple inboxes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Shared team inboxes for support or sales$q$, $q$Lets teams collaborate on shared inboxes with delegation and internal comments.$q$, $q$Small business and startup teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Meeting follow-ups via AI notes$q$, $q$Combines email and AI-generated meeting notes so follow-ups happen in one app.$q$, $q$Teams needing email and meeting-notes together$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Free$q$, $q$EUR0$q$, $q$N/A$q$, NULL, $q$["Smart Inbox","Unlimited email accounts","Smart notifications","Calendar","Essential email productivity tools"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Plus$q$, $q$EUR10/month per user (EUR120/year, about EUR8.25/month billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["Everything in Free","Spark plus AI writing assistant","40 AI meeting notes per month","Custom templates","Essential team collaboration","Productivity integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Pro$q$, $q$EUR22/month per user (EUR264/year, about EUR19.08/month billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["Everything in Plus","Unlimited AI meeting notes","Read statuses","Advanced team collaboration","HubSpot integration","Spark CLI"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$Annual$q$, NULL, $q$["Everything in Pro","Advanced security and controls","Dedicated success manager","1:1 productivity coaching"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '301e0188-6ae0-49e7-ab7f-56b0c0bf8656';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$overview$q$, $q$What Is Spark Mail$q$, 2, ARRAY[$q$Spark Mail is an email client developed by Readdle, a Ukrainian productivity software company founded in 2007 and headquartered in Odesa. Spark launched in 2015 and has grown into one of the most popular alternative mail apps for both individuals and teams.$q$, $q$Its central feature is a Smart Inbox that automatically separates important personal messages from newsletters and notifications, combined more recently with Spark plus AI tools for writing assistance and meeting notes, aimed at reducing time spent triaging email.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Beyond the Smart Inbox, Spark offers an AI writing assistant to draft and refine emails, AI-generated meeting notes, custom email templates, and productivity integrations with calendars and tools like HubSpot.$q$, $q$For teams, Spark adds collaborative features such as shared drafts, delegated inboxes, internal comments on emails, and, on the Pro plan, a command-line interface for power users, all synced across iOS, Android, Mac, Windows, and web apps.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('301e0188-6ae0-49e7-ab7f-56b0c0bf8656', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spark's Free plan covers unlimited email accounts, the Smart Inbox, notifications, and calendar access at no cost, making it usable as a full-featured everyday email client without payment.$q$, $q$Paid tiers are priced per user: Plus adds AI writing and a monthly quota of AI meeting notes, Pro adds unlimited AI meeting notes and deeper team and integration features, and Enterprise offers custom pricing with advanced security and dedicated support. All paid plans include a 7-day free trial, and annual billing offers roughly a 13 percent discount over monthly pricing.$q$]::text[], 2);


-- ── Speakeasy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Speakeasy is a developer platform that automatically generates type-safe SDKs, Terraform providers, and other client libraries from an API OpenAPI specification.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Business plan from $600/month per language, billed annually)$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Speakeasy Review: API and SDK Generation Platform Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Speakeasy auto-generates type-safe SDKs, MCP servers, and Terraform providers from OpenAPI specs. Compare Free, Business, and Enterprise pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Speakeasy is a developer tools company founded in 2022 in San Francisco by ex-Apollo GraphQL engineers, including CEO Sagar Batchu, that automates the generation of production-quality, idiomatic SDKs, Terraform providers, and MCP servers directly from an API's OpenAPI specification. Rather than producing thin, auto-generated API wrappers, Speakeasy aims to output SDKs that read like hand-written client libraries, supporting multiple languages such as TypeScript, Python, Go, and Java, with automatic publishing to package managers and generated documentation sites. It also supports newer needs like generating Model Context Protocol (MCP) servers so APIs can be exposed to AI agents, plus an OpenAPI toolchain for linting and validating specs. Pricing follows a freemium model: a Free tier includes SDK and MCP generation with a license for one language and 250 operations per language; a Business tier adds OAuth support, webhooks, server-sent events, and docsite integration for $720 per month per licensed language, discounted to $600 per month when billed annually; and a custom-priced Enterprise tier adds SSO, audit logs, SLAs, and concierge onboarding. Speakeasy raised a Series A round of more than $20 million led by Andreessen Horowitz with participation from FirstMark Capital, following an earlier $7.6 million seed round led by GV. Users retain full ownership of the code Speakeasy generates, even if they later stop using the service, making it best suited to API-first companies that need to publish and maintain official SDKs across multiple languages.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a18645e2-a581-4fd2-afca-e3a533873c8b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Automatic SDK Generation$q$, $q$Generates production-quality, idiomatic SDKs directly from an OpenAPI specification.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Multi-Language Support$q$, $q$Supports SDK generation for languages including TypeScript, Python, Go, and Java.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Auto-Publish to Package Managers$q$, $q$Automatically publishes generated SDKs to the appropriate package registry.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$MCP Server Generation$q$, $q$Generates Model Context Protocol servers so APIs can be exposed to AI agents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$OAuth, Webhooks, and SSE Support$q$, $q$Adds support for OAuth authentication, webhooks, and server-sent events on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Docsite Generation$q$, $q$Automatically builds and integrates documentation sites alongside generated SDKs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Full Code Ownership$q$, $q$Users retain complete ownership of generated SDK code, even after discontinuing the service.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$OpenAPI Toolchain$q$, $q$Provides spec linting and validation tools to keep OpenAPI definitions clean and accurate.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Generates production-quality, idiomatic SDKs rather than raw API wrappers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Users retain full ownership of all generated code$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Supports modern needs like MCP servers for AI agent integration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Free tier available for smaller projects and early-stage APIs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Backed by well-known investors including Andreessen Horowitz$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Business plan pricing is charged per language, which scales quickly for multi-language SDK needs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Advanced features like SSO and audit logs require custom Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Relatively young company, founded in 2022, compared to established API tooling vendors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Output quality depends on having a well-structured OpenAPI specification$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$What is Speakeasy?$q$, $q$Speakeasy is a developer platform that automatically generates type-safe SDKs, Terraform providers, and MCP servers from an API's OpenAPI specification.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Who founded Speakeasy?$q$, $q$Speakeasy was founded in 2022 in San Francisco by former Apollo GraphQL engineers, including CEO Sagar Batchu.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Is Speakeasy free to use?$q$, $q$Yes, a Free tier is available with a license for one language and 250 operations per language; paid plans unlock more languages and features.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$What programming languages does Speakeasy generate SDKs for?$q$, $q$Speakeasy generates SDKs for multiple languages, including TypeScript, Python, Go, and Java.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Do I own the SDK code Speakeasy generates?$q$, $q$Yes, users retain full ownership of generated SDK code even if they stop using Speakeasy.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$What is Speakeasy's AI control plane?$q$, $q$It is a related Speakeasy offering focused on connecting, securing, and governing AI agents, including custom MCP server creation and serverless hosting.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$How much does Speakeasy Business cost?$q$, $q$The Business plan costs $720 per month per licensed language, or $600 per month when billed annually.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Does Speakeasy support MCP servers?$q$, $q$Yes, Speakeasy can generate Model Context Protocol servers to expose an API to AI agents.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Publishing official SDKs for a public API$q$, $q$Automates generation and publishing of client libraries in multiple languages for external developers.$q$, $q$API-first companies and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Generating Terraform providers from an API spec$q$, $q$Produces infrastructure-as-code providers directly from existing OpenAPI definitions.$q$, $q$Infrastructure and DevOps tooling teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Exposing APIs to AI agents via MCP$q$, $q$Generates MCP servers so AI agents can call an API using standardized tooling.$q$, $q$Teams building AI agent integrations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["SDK and MCP server generation","Auto-publish to package manager","OpenAPI toolchain access","250 operations per language","License for 1 language","Community Slack support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Business$q$, $q$$720/month per licensed language ($600/month billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["Everything in Free","OAuth support","Webhooks and server-sent events","Docsite integration","250 operations per language"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Enterprise$q$, $q$Custom (contact sales)$q$, $q$Annual$q$, NULL, $q$["Dedicated Slack support","Concierge onboarding and migration","SLAs","SSO and audit logs","Customizable requirements"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$overview$q$, $q$What Is Speakeasy$q$, 2, ARRAY[$q$Speakeasy is a developer platform, founded in 2022 in San Francisco, that turns an API's OpenAPI specification into production-ready, idiomatic SDKs, Terraform providers, and other client libraries, rather than the thin auto-generated wrappers produced by many older code generation tools.$q$, $q$The company was started by former Apollo GraphQL engineers, including CEO Sagar Batchu, and has raised a Series A round of more than $20 million led by Andreessen Horowitz, building on an earlier seed round led by GV.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Speakeasy generates SDKs in multiple languages, including TypeScript, Python, Go, and Java, and can automatically publish them to the relevant package manager while generating accompanying documentation sites, so API providers can ship official client libraries without maintaining generator code by hand.$q$, $q$The platform also supports newer developer needs, including generating Model Context Protocol (MCP) servers that expose an API to AI agents, an OpenAPI toolchain for linting and validating specs, and support for OAuth, webhooks, and server-sent events on higher-tier plans.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Speakeasy's Free tier includes SDK and MCP generation with a license for one language and a quota of 250 operations per language, along with community Slack support, making it usable for smaller or early-stage APIs at no cost.$q$, $q$The Business tier, priced per licensed language at $720 per month ($600 per month billed annually), adds OAuth support, webhooks, server-sent events, and docsite integration, while a custom-priced Enterprise tier adds SSO, audit logs, SLAs, dedicated support, and concierge onboarding for larger organizations.$q$]::text[], 2);



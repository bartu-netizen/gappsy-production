-- Enrichment batch: Duplicati, UrBackup, Bareos, Bacula, Proxmox Backup Server, Syncthing, Resilio Sync, Unison, Rclone, Mutagen, Kiwix, Linkding, LinkAce, Shaarli, Readeck, Omnivore, Webrecorder, Pinry, Immich, PhotoPrism, LibrePhotos, Piwigo, Chevereto, PhotoStructure, Ente Photos, Jellyfin, Emby, Plex, Navidrome, Ampache, Funkwhale, Koel, Audiobookshelf, PeerTube, Owncast, MediaCMS, Tube Archivist, AzuraCast, Podlove, Ant Media Server, SRS, OBS Studio, Kdenlive, Shotcut, OpenShot, Olive Video Editor, Pitivi, HandBrake, Audacity, Ardour, LMMS, Mixxx, MuseScore, Rosegarden, Hydrogen, Tenacity, GIMP, Krita, Inkscape, Scribus, Pencil Project, Vectr, Boxy SVG, Excalidraw, tldraw, WBO, Drawpile, Diagrams.net, PlantUML, D2, Kroki, Graphviz, LibreOffice, ONLYOFFICE, Collabora Online, CryptPad, Etherpad, EtherCalc, LimeSurvey
-- Publishes 79 bulk-imported tool(s) with full editorial content.

-- ── Duplicati ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source backup software that creates encrypted, incremental backups to cloud and on-premises storage.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2/machine/month (Pro plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Duplicati is open-source backup software offering AES-256 encrypted, incremental backups to cloud and on-prem storage, with free and paid tiers.$q$,
  og_description = $q$Duplicati is open-source backup software offering AES-256 encrypted, incremental backups to cloud and on-prem storage, with free and paid tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a4fda3a0-ecc1-4630-9d85-b01bc239bd2c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a4fda3a0-ecc1-4630-9d85-b01bc239bd2c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Bring Your Own Storage$q$, $q$Back up to a wide range of cloud providers (AWS S3, Azure, Google Cloud, Dropbox, OneDrive, Backblaze) or on-premises targets like NAS, SFTP, and SMB.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Zero-trust encryption$q$, $q$Data is encrypted with AES-256 before it leaves the device, so storage providers never see unencrypted data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Block-level incremental backups$q$, $q$Only changed data blocks are transferred after the initial backup, reducing bandwidth and storage use.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Microsoft 365 and Google Workspace protection$q$, $q$Platform-specific backup support for Microsoft 365 and Google Workspace data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Multi-directional backup$q$, $q$Supports on-prem-to-cloud, cloud-to-on-prem, and local-to-local backup configurations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Centralized management (paid tiers)$q$, $q$Pro and Enterprise plans add remote management, alerts, and multi-site deployment across many endpoints.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Free tier available for up to 2 machines$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Open-source with AES-256 client-side encryption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Wide range of supported cloud and on-prem storage backends$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Block-level deduplication reduces bandwidth usage$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Free tier is limited to 2 machines and a capped backup history$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Paid Pro/Enterprise tiers required for centralized management and remote monitoring$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Enterprise pricing requires a 10-machine minimum$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Is Duplicati free?$q$, $q$Yes, Duplicati offers a free tier for up to 2 machines with a limited backup history. Paid Pro and Enterprise plans remove these limits and add management features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$How does Duplicati protect my data?$q$, $q$Duplicati encrypts data with AES-256 before it leaves your device, so cloud storage providers never see unencrypted backups.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$What storage services does Duplicati support?$q$, $q$Duplicati supports major cloud providers including AWS S3, Azure, Google Cloud, Dropbox, OneDrive, and Backblaze, as well as on-premises NAS, SFTP, and SMB targets.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Can Duplicati back up Microsoft 365 or Google Workspace?$q$, $q$Yes, Duplicati includes platform-specific backup support for Microsoft 365 and Google Workspace.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Personal encrypted cloud backup$q$, $q$Individuals backing up personal files to their own cloud storage account with client-side encryption.$q$, $q$Individuals and home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$SMB endpoint backup$q$, $q$Small and medium businesses backing up multiple machines to cloud or on-prem storage with centralized oversight.$q$, $q$Small and medium businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$MSP-managed backup$q$, $q$Managed service providers deploying and monitoring backups silently across many client endpoints.$q$, $q$Managed service providers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 2 machines","Limited (200-item) backup history"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Pro$q$, $q$$2-$2.50/machine/month$q$, $q$monthly$q$, $q$["Up to 100 machines","AI-based backup analysis","Alerts","Remote management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$Enterprise$q$, $q$From $3/machine/month$q$, $q$monthly$q$, $q$["10+ machine minimum","SSO/MFA","Organization management"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$overview$q$, $q$What is Duplicati?$q$, 2, ARRAY[$q$Duplicati is an open-source backup tool that creates encrypted, incremental backups of files and sends them to cloud storage or on-premises destinations. Backups are encrypted with AES-256 before leaving the source device.$q$, $q$The project offers a free tier for small setups, alongside paid Pro and Enterprise plans that add centralized management, alerting, and support for larger fleets of machines.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', $q$who-its-for$q$, $q$Who Duplicati is for$q$, 2, ARRAY[$q$Duplicati suits individuals who want encrypted backups to their own cloud storage, as well as small businesses and MSPs that need to manage backups across multiple endpoints using the paid tiers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4fda3a0-ecc1-4630-9d85-b01bc239bd2c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── UrBackup ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source client/server backup system combining image and file backups for fast restores.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$UrBackup is a free, open-source AGPLv3 backup system combining file and image backups with deduplication and bare-metal restore.$q$,
  og_description = $q$UrBackup is a free, open-source AGPLv3 backup system combining file and image backups with deduplication and bare-metal restore.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b386442-acd6-4287-b601-254de09a7e9b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b386442-acd6-4287-b601-254de09a7e9b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Combined image and file backups$q$, $q$Performs both file-level and disk-image backups for comprehensive data protection and fast restoration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Continuous change monitoring$q$, $q$Monitors folders for changes so subsequent incremental backups run quickly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Web-based management$q$, $q$A web interface handles server configuration, client status monitoring, and file recovery.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Bare-metal restore$q$, $q$Supports bootable USB restoration of full disk images.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Client-side deduplication$q$, $q$Files identical across multiple clients are stored only once to reduce storage use.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Internet-capable backup$q$, $q$Can back up remote or mobile clients over the internet, not just the local network.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Completely free and open source under AGPLv3, usable commercially$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Combines image and file backup in one tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Deduplication reduces storage requirements across many clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Can back up open files (e.g., Outlook .pst) without interrupting them$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$No official paid support tier for enterprises needing SLAs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Web interface and setup are less polished than commercial competitors$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Is UrBackup free?$q$, $q$Yes, UrBackup is completely free and open source under the AGPLv3 license, for both personal and commercial use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$What platforms does UrBackup support?$q$, $q$The server runs on Windows, GNU/Linux, FreeBSD, and NAS operating systems; clients are available for Windows, macOS, and GNU/Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Does UrBackup support bare-metal restore?$q$, $q$Yes, it supports restoring a full disk image from a bootable USB stick.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$How does UrBackup save storage space?$q$, $q$It deduplicates identical files across multiple clients so they are stored only once on the server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Small office network backup$q$, $q$Backing up file servers and workstations on a local network with both file and image backups.$q$, $q$Small business IT admins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$Remote/mobile client backup$q$, $q$Backing up laptops and remote machines over the internet outside the local network.$q$, $q$Distributed teams and remote workers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$overview$q$, $q$What is UrBackup?$q$, 2, ARRAY[$q$UrBackup is a free, open-source client/server backup system that combines file and image backups to deliver both data safety and fast restoration. It monitors folders continuously so incremental backups run quickly after the initial full backup.$q$, $q$The server offers a web-based interface for configuration, client monitoring, and file recovery, and supports bare-metal restore from a bootable USB stick.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', $q$who-its-for$q$, $q$Who UrBackup is for$q$, 2, ARRAY[$q$UrBackup fits organizations and individuals who want a no-cost, self-hosted backup system covering both file-level and full disk-image backups across Windows, macOS, and Linux clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b386442-acd6-4287-b601-254de09a7e9b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Bareos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, AGPLv3-licensed enterprise backup and recovery software with optional paid support subscriptions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€480/year (subscription)$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bareos is open-source AGPLv3 enterprise backup software with hybrid cloud/on-prem backup and optional paid support subscriptions.$q$,
  og_description = $q$Bareos is open-source AGPLv3 enterprise backup software with hybrid cloud/on-prem backup and optional paid support subscriptions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '75745b38-a453-422a-bd66-d036181d6207';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '75745b38-a453-422a-bd66-d036181d6207' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Ransomware protection$q$, $q$Includes security capabilities aimed at protecting backups from ransomware.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Hybrid cloud and on-premise backup$q$, $q$Supports backup scenarios spanning cloud and on-premises infrastructure.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Cross-platform, exabyte-scale support$q$, $q$Runs across Linux, Windows, macOS, FreeBSD, and ARM64, scaling into the exabyte range.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Encrypted communications$q$, $q$Supports encrypted client-server communication and client-side encryption.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Certified platform support$q$, $q$Officially certified for SUSE Linux Enterprise Server, SUSE Enterprise Storage, and Red Hat Enterprise Linux.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Professional support and training$q$, $q$Paid subscription tiers add tested binary packages, defined-response-time support, and training courses.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Open source under AGPLv3 with no license fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Certified for SUSE and Red Hat enterprise platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Scales to exabyte-range environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Used by universities, public institutions, and enterprises such as SUSE and Amnesty International$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Tested/maintained binary packages require a paid subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Support tiers are priced in a unit-based model that can be complex to calculate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Higher support tiers (Premier, Global) are expensive (up to €42,900/year)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Is Bareos free?$q$, $q$Bareos is open source under AGPLv3 with no license fees. A paid annual subscription (starting at €480/year) provides tested binary packages and access to support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Who maintains Bareos?$q$, $q$Bareos is developed by the Bareos community and Bareos GmbH & Co. KG, founded in 2012.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$What platforms does Bareos support?$q$, $q$Bareos supports Linux, Windows, macOS, FreeBSD, and ARM64.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Does Bareos offer training?$q$, $q$Yes, Bareos GmbH & Co. KG offers training courses, starting with the Admin I course from €1,350.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Enterprise data protection$q$, $q$Backing up hybrid cloud and on-premises infrastructure at scale with certified platform support.$q$, $q$Enterprises and public institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$University and research backup$q$, $q$Managing large-scale backup and recovery for academic and research computing environments.$q$, $q$Universities and research institutions$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Subscription (binaries)$q$, $q$From €480/year$q$, $q$annual$q$, $q$["Quality-tested packages for major platforms","Plugin access","Tested updates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Basic Support$q$, $q$€1,080/year$q$, $q$annual$q$, $q$["Up to 20 units","10 incidents annually","2nd business day response"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Standard Support$q$, $q$€2,850/year$q$, $q$annual$q$, $q$["Defined response times","Ticket/email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Advanced Support$q$, $q$€5,700/year$q$, $q$annual$q$, $q$["Defined response times","Ticket/email support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Premier Support$q$, $q$€11,800/year$q$, $q$annual$q$, $q$["Defined response times","Ticket/email support"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$Global Support$q$, $q$€42,900/year$q$, $q$annual$q$, $q$["Defined response times","Ticket/email support"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$overview$q$, $q$What is Bareos?$q$, 2, ARRAY[$q$Bareos is an open-source, AGPLv3-licensed backup and recovery solution built for enterprise environments, offering hybrid cloud and on-premises backup with encrypted communications and ransomware-protection features. The project has operated since 2012.$q$, $q$While the software itself carries no license fees, Bareos GmbH & Co. KG offers paid subscriptions for tested binary packages plus tiered support contracts, training, and consulting services.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75745b38-a453-422a-bd66-d036181d6207', $q$who-its-for$q$, $q$Who Bareos is for$q$, 2, ARRAY[$q$Bareos is used by universities, public institutions, service providers, and enterprises — including SUSE, the University of Utah, and Amnesty International — that need certified, scalable backup infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75745b38-a453-422a-bd66-d036181d6207', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Bacula ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, modular backup and recovery system for networks, with a paid Enterprise Edition from Bacula Systems.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Vuiteboeuf, Switzerland$q$,
  languages = '{}',
  seo_meta_description = $q$Bacula is open-source, modular backup and recovery software for Linux, Windows, and Mac, with a paid Enterprise Edition for larger deployments.$q$,
  og_description = $q$Bacula is open-source, modular backup and recovery software for Linux, Windows, and Mac, with a paid Enterprise Edition for larger deployments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9fd83865-ab16-41ac-a7c4-d08bb699bdb3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$TLS-encrypted communications$q$, $q$Automatic encryption of communications between Bacula components.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Kubernetes and Docker plugins$q$, $q$Backs up containerized workloads with dedicated Kubernetes and Docker plugins.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Multi-tier backup jobs$q$, $q$Supports incremental, differential, and synthetic backups along with migration and copy jobs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Database and hypervisor plugins$q$, $q$Plugins for databases (MySQL, PostgreSQL, Oracle, SQL Server) and hypervisors (VMware, Hyper-V, KVM, XCP-ng).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Cloud storage support$q$, $q$Backs up to cloud platforms including AWS and OpenStack.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$LDAP console authentication$q$, $q$Supports external LDAP authentication for the management console.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Community Edition is free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Broad plugin ecosystem covering Kubernetes, Docker, databases, and hypervisors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Supports tape drives and autochangers for large-scale archival$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Reports 2.5 million downloads via SourceForge$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Advanced scalability and security features are reserved for the paid Enterprise Edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Community Edition support relies on community forums, not commercial SLAs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Configuration is text/console-based and has a learning curve$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Is Bacula free?$q$, $q$The Bacula Community Edition is free and open source. Bacula Systems also sells a commercial Enterprise Edition with additional scalability, security features, and paid support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$What platforms does Bacula support?$q$, $q$Bacula supports Linux, Windows, and Mac, plus Kubernetes environments, virtual machines (VMware, Hyper-V, KVM, XCP-ng), and tape drives/autochangers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Can Bacula back up databases?$q$, $q$Yes, it includes plugins for databases such as MySQL, PostgreSQL, Oracle, and SQL Server.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Does Bacula support cloud storage?$q$, $q$Yes, Bacula supports cloud platforms including AWS and OpenStack.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Mixed-OS network backup$q$, $q$Backing up heterogeneous networks of Linux, Windows, and Mac systems from a central console.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Containerized workload backup$q$, $q$Protecting Kubernetes and Docker workloads using dedicated plugins.$q$, $q$DevOps and platform engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Enterprise-scale backup$q$, $q$Organizations needing tape archival, database plugins, and commercial support via the Enterprise Edition.$q$, $q$Enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Community Edition$q$, $q$$0$q$, NULL, $q$["Full open-source backup engine","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$Enterprise Edition$q$, $q$Custom (contact Bacula Systems)$q$, NULL, $q$["Enhanced scalability","Enhanced security features","Commercial support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$overview$q$, $q$What is Bacula?$q$, 2, ARRAY[$q$Bacula is an open-source, modular backup and recovery system for managing backup, recovery, and verification of data across networks of computers running different operating systems. It supports incremental, differential, and synthetic backups, plus plugins for Kubernetes, Docker, hypervisors, and major databases.$q$, $q$The free Community Edition is maintained by the Bacula open-source community, while Bacula Systems sells a commercial Enterprise Edition with added scalability, security, and support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', $q$who-its-for$q$, $q$Who Bacula is for$q$, 2, ARRAY[$q$Bacula suits system administrators and enterprises that need a flexible, plugin-extensible backup system spanning physical servers, virtual machines, containers, and tape archival.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9fd83865-ab16-41ac-a7c4-d08bb699bdb3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Proxmox Backup Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source enterprise backup solution for VMs, containers, and physical hosts, with optional paid support subscriptions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€560/year (Community subscription)$q$,
  founded_year = 2004,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Proxmox Backup Server is open-source enterprise backup software for VMs, containers, and physical hosts, with tiered paid support subscriptions.$q$,
  og_description = $q$Proxmox Backup Server is open-source enterprise backup software for VMs, containers, and physical hosts, with tiered paid support subscriptions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '04912e59-00ff-41ed-a119-8f56bc5e3397';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '04912e59-00ff-41ed-a119-8f56bc5e3397' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Incremental, deduplicated backups$q$, $q$Reduces network load and storage consumption through incremental, fully deduplicated backups.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Strong encryption and integrity checks$q$, $q$Backups are encrypted with data integrity verification built in.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Web-based GUI$q$, $q$Centralized management and monitoring through a web interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Tight Proxmox VE integration$q$, $q$Integrates closely with Proxmox Virtual Environment for backing up VMs and containers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Namespace and sync jobs$q$, $q$Supports namespaces and sync jobs for organizing and replicating backup data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Tape backup support$q$, $q$Supports LTO tape backup for long-term archival.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Full open-source feature set available for free (Community tier)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Deduplication and incremental backups reduce storage and network overhead$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Tight integration with Proxmox Virtual Environment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Support for tape (LTO) archival$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Paid subscriptions required for enterprise repository access and guaranteed support response times$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Higher support tiers (Premium at €4,480/year) are costly for smaller teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Best suited to environments already using Proxmox VE$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Is Proxmox Backup Server free?$q$, $q$Yes, the complete feature set is available for free under the Community subscription, which includes stable updates but only community support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$What do paid Proxmox Backup Server subscriptions add?$q$, $q$Paid Basic, Standard, and Premium tiers add access to the enterprise repository and guaranteed support ticket response times, from 1 business day down to 2 hours.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Does Proxmox Backup Server work with virtual machines?$q$, $q$Yes, it integrates tightly with Proxmox Virtual Environment to back up VMs, containers, and physical hosts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Does Proxmox Backup Server support tape backup?$q$, $q$Yes, it supports LTO tape backup for archival.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Proxmox VE backup$q$, $q$Backing up VMs and containers running on Proxmox Virtual Environment.$q$, $q$Proxmox VE administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Datacenter backup$q$, $q$Centralized, deduplicated backup for datacenter infrastructure with optional enterprise support.$q$, $q$Datacenter operators and IT administrators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Community$q$, $q$€560/year$q$, $q$annual$q$, $q$["Stable and secure updates","Complete feature set","Community support only"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Basic$q$, $q$€1,120/year$q$, $q$annual$q$, $q$["5 support tickets/year","1 business day response time","Enterprise repository access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Standard$q$, $q$€2,240/year$q$, $q$annual$q$, $q$["15 support tickets/year","4-hour response time for critical requests","Remote SSH support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$Premium$q$, $q$€4,480/year$q$, $q$annual$q$, $q$["Unlimited support tickets","2-hour response time for critical requests","Remote SSH support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$overview$q$, $q$What is Proxmox Backup Server?$q$, 2, ARRAY[$q$Proxmox Backup Server is an open-source enterprise backup solution for backing up and restoring virtual machines, containers, and physical hosts, built by Proxmox Server Solutions GmbH (founded 2004). It performs incremental, fully deduplicated backups and integrates tightly with Proxmox Virtual Environment.$q$, $q$The complete feature set is available for free under the Community subscription; paid Basic, Standard, and Premium tiers add access to the enterprise update repository and guaranteed support response times.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', $q$who-its-for$q$, $q$Who Proxmox Backup Server is for$q$, 2, ARRAY[$q$It's built for datacenter operators and IT administrators, particularly those already running Proxmox Virtual Environment, who want an open-source alternative to commercial backup systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('04912e59-00ff-41ed-a119-8f56bc5e3397', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Syncthing ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source continuous file synchronization tool that syncs files directly between devices without central servers.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Syncthing is free, open-source continuous file synchronization software (MPLv2) that syncs files directly between devices with no central server.$q$,
  og_description = $q$Syncthing is free, open-source continuous file synchronization software (MPLv2) that syncs files directly between devices with no central server.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6f4efaba-e2ba-4cc8-ad0e-eef383de0614' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Peer-to-peer synchronization$q$, $q$Files sync directly between devices with no central server storing your data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$TLS encryption with perfect forward secrecy$q$, $q$All communication between devices is encrypted.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Certificate-based device authentication$q$, $q$Devices are authenticated using cryptographic certificates rather than passwords.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Open, published protocol$q$, $q$Uses an open protocol with published specifications rather than a proprietary format.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Web-based interface$q$, $q$Configuration and monitoring are done through a browser-based UI.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Multi-folder sync$q$, $q$Supports syncing multiple folders with different sharing arrangements across devices.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Free and open source under MPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$No central server means data stays under user control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Encrypted, authenticated device-to-device connections$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Runs on many platforms including Linux, macOS, Windows, FreeBSD, Solaris, and OpenBSD$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$No official first-party commercial support (third-party support available via Kastelo)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Requires all synced devices to be online simultaneously for changes to propagate directly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Initial setup and device pairing is more technical than mainstream cloud-sync apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Is Syncthing free?$q$, $q$Yes, Syncthing is free and open source, licensed under MPLv2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Does Syncthing use a central server?$q$, $q$No, Syncthing synchronizes files directly between devices without storing data on a central server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$What platforms does Syncthing support?$q$, $q$Syncthing runs on macOS, Windows, Linux, FreeBSD, Solaris, OpenBSD, and other platforms, on both desktops and servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Is commercial support available for Syncthing?$q$, $q$Yes, optional commercial support is available through Kastelo, a third party.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Cross-device personal file sync$q$, $q$Keeping files synchronized across a person's own laptop, desktop, and server without a cloud provider.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$Trusted team file sharing$q$, $q$Sharing folders directly between trusted collaborators' devices without a central storage provider.$q$, $q$Small teams and collaborators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$overview$q$, $q$What is Syncthing?$q$, 2, ARRAY[$q$Syncthing is a free, open-source continuous file synchronization program that keeps files in sync across multiple devices in real time. It uses an open, published protocol and encrypts all communication with TLS and perfect forward secrecy, authenticating devices via cryptographic certificates.$q$, $q$Unlike cloud-sync services, Syncthing has no central server — data is stored only on the user's own devices.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', $q$who-its-for$q$, $q$Who Syncthing is for$q$, 2, ARRAY[$q$Syncthing is built for users who want to keep files synchronized between their own devices, or with trusted collaborators, while keeping full control over where data is stored.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6f4efaba-e2ba-4cc8-ad0e-eef383de0614', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Resilio Sync ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Peer-to-peer file synchronization app for individuals that syncs files across devices without cloud storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Resilio Sync is a free, peer-to-peer file synchronization app that syncs photos, videos, and documents across devices without cloud storage.$q$,
  og_description = $q$Resilio Sync is a free, peer-to-peer file synchronization app that syncs photos, videos, and documents across devices without cloud storage.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '44084df6-f4d6-4a50-9b62-fd348ba43737';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '44084df6-f4d6-4a50-9b62-fd348ba43737' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Automatic folder synchronization$q$, $q$Keeps folders in sync automatically across multiple devices using peer-to-peer transfer.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Selective Sync$q$, $q$Lets users download only the files they need instead of replicating an entire folder.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Advanced Folders$q$, $q$Allows modifying access permissions, assigning ownership, and revoking access to shared folders.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Large file sharing$q$, $q$Share large files with others without maintaining a permanent folder connection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Bandwidth control$q$, $q$Lets users manage network usage during sync operations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Cloud-free operation$q$, $q$Uses distributed peer-to-peer technology instead of routing files through a cloud server.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Free download now includes features that were previously Pro-only$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$No cloud storage required — files transfer directly between devices$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Selective sync avoids downloading unneeded files$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Granular folder permissions and access revocation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Requires devices to be reachable (online) for peer-to-peer transfer$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Now part of Nasuni, an enterprise-focused parent company, which may shift product priorities$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Full current platform list not detailed on the individuals page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Is Resilio Sync free?$q$, $q$Yes, Resilio's free Sync download now includes all the premium features that were previously only available in the paid Sync Pro plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Does Resilio Sync use the cloud?$q$, $q$No, Resilio Sync uses peer-to-peer technology to transfer files directly between devices rather than storing them in the cloud.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Who owns Resilio Sync?$q$, $q$Resilio is now part of Nasuni, a company focused on unstructured data infrastructure for enterprises.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Can I control who accesses a synced folder?$q$, $q$Yes, Advanced Folders let you modify permissions, assign ownership, and revoke access to shared folders.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Personal multi-device sync$q$, $q$Keeping photos, videos, and documents in sync across a person's own devices without a cloud subscription.$q$, $q$Individuals and home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Family file sharing$q$, $q$Sharing large personal files with family members via direct peer-to-peer transfer.$q$, $q$Families$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$Free$q$, $q$$0$q$, NULL, $q$["Automatic folder sync","Selective Sync","Advanced Folders","Bandwidth control"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$overview$q$, $q$What is Resilio Sync?$q$, 2, ARRAY[$q$Resilio Sync is a personal file synchronization and sharing tool that uses peer-to-peer technology to sync photos, videos, music, and documents across devices without routing them through the cloud.$q$, $q$The free download now includes features such as Selective Sync and Advanced Folders that were previously reserved for a paid Sync Pro plan. Resilio is now part of Nasuni.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', $q$who-its-for$q$, $q$Who Resilio Sync is for$q$, 2, ARRAY[$q$Resilio Sync is aimed at individuals and families who want to keep files synchronized across their own devices while prioritizing privacy and avoiding cloud storage subscriptions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44084df6-f4d6-4a50-9b62-fd348ba43737', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Unison ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source bidirectional file synchronization tool that keeps two file replicas in sync across platforms.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Unison is a free, open-source GPL-licensed tool for bidirectional file synchronization between two replicas across OSX, Unix, and Windows.$q$,
  og_description = $q$Unison is a free, open-source GPL-licensed tool for bidirectional file synchronization between two replicas across OSX, Unix, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0531938d-75d2-445c-8d15-96c3a265f3c0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0531938d-75d2-445c-8d15-96c3a265f3c0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Bidirectional synchronization$q$, $q$Unlike simple mirroring, Unison can handle updates made to either of two replicas, not just one direction.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Cross-platform sync$q$, $q$Synchronizes between OSX, Unix (Solaris, Linux), and Windows systems.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Conflict detection$q$, $q$Detects conflicting changes between replicas and lets the user resolve them.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$SSH or socket transport$q$, $q$Works over the internet using direct sockets or encrypted SSH connections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Bandwidth-efficient transfer$q$, $q$Optimized to transfer small updates efficiently even for large files, and to run well over slow links.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Failure resilience$q$, $q$Designed to recover cleanly from network failures or abnormal termination.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Free and open source under the GNU Public License$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$True bidirectional sync, handling changes on either replica$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Works across mixed OS environments (OSX, Unix, Windows)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Can sync securely over SSH$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Maintained by a very small volunteer team with limited resources$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$No graphical polish or modern UI compared to commercial sync tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Older, unmaintained releases are explicitly unsupported — users must run the latest release or a recent git build$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Is Unison still maintained?$q$, $q$Yes, though by a small team; the project continues to publish releases (e.g. version 2.53.1) via its GitHub repository.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Is Unison free?$q$, $q$Yes, Unison is free software with full source code available under the GNU Public License.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$What platforms does Unison run on?$q$, $q$Unison runs on OSX, Unix (including Solaris and Linux), and Windows, and can sync between different operating systems.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$How does Unison differ from a backup tool?$q$, $q$Unison performs bidirectional synchronization, propagating updates made to either replica, unlike simple mirroring or one-way backup utilities.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Cross-platform replica sync$q$, $q$Keeping a folder in sync between machines running different operating systems.$q$, $q$Users with mixed-OS environments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$Secure sync over SSH$q$, $q$Synchronizing files between a local machine and a remote server over an encrypted connection.$q$, $q$Developers and system administrators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$overview$q$, $q$What is Unison?$q$, 2, ARRAY[$q$Unison is a free, open-source file synchronization tool that keeps two copies of a set of files and directories in sync, propagating changes in both directions and detecting conflicting updates. It is licensed under the GNU Public License.$q$, $q$It runs over direct sockets or encrypted SSH connections and is designed to work efficiently over slow network links and recover cleanly from interruptions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', $q$who-its-for$q$, $q$Who Unison is for$q$, 2, ARRAY[$q$Unison suits users who need to keep two replicas of files synchronized across different operating systems, such as OSX, Unix, and Windows, particularly over SSH.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0531938d-75d2-445c-8d15-96c3a265f3c0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Rclone ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source command-line tool for syncing, copying, and mounting files across 70+ cloud storage providers.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rclone is a free, open-source MIT-licensed command-line tool for syncing and managing files across 70+ cloud storage providers.$q$,
  og_description = $q$Rclone is a free, open-source MIT-licensed command-line tool for syncing and managing files across 70+ cloud storage providers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5d6ffdf8-6da0-4046-a24c-1af0f948ce0d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5d6ffdf8-6da0-4046-a24c-1af0f948ce0d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Sync, copy, and move commands$q$, $q$Syncs, copies, moves, and deletes files across cloud storage services from the command line.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Bisync bidirectional sync$q$, $q$Supports bidirectional synchronization between two locations via its Bisync feature.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Filesystem mounting$q$, $q$Mounts cloud storage as a local filesystem on Windows, macOS, Linux, and FreeBSD.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Server-side transfers$q$, $q$Uses server-side transfer between supported providers to minimize bandwidth usage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Virtual backends$q$, $q$Provides encryption, compression, and chunking through composable virtual backends.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Multi-protocol serving$q$, $q$Can serve data over SFTP, HTTP, WebDAV, FTP, and DLNA.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Supports over 70 cloud storage providers plus standard protocols$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Checksums and timestamp preservation protect data integrity during transfer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Actively developed with a large GitHub community (58,000+ stars)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Command-line only; no official first-party GUI$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Requires familiarity with terminal usage and remote configuration syntax$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$No official paid support tier for enterprises$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Is Rclone free?$q$, $q$Yes, Rclone is free, open-source software licensed under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$How many cloud providers does Rclone support?$q$, $q$Rclone supports over 70 cloud storage providers, including Amazon S3, Google Drive, Dropbox, Microsoft OneDrive, Backblaze B2, and Azure Blob Storage, plus protocols like WebDAV, FTP, and SFTP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Can Rclone mount cloud storage as a local drive?$q$, $q$Yes, Rclone can mount remote storage as a local filesystem on Windows, macOS, Linux, and FreeBSD.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Does Rclone support bidirectional sync?$q$, $q$Yes, through its Bisync feature.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Cloud-to-cloud migration$q$, $q$Moving or syncing large volumes of data directly between cloud storage providers.$q$, $q$Data migration specialists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Automated cloud backup$q$, $q$Scripting scheduled backups and restores to cloud storage from servers or workstations.$q$, $q$System administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$Multi-account cloud management$q$, $q$Managing files across several personal or business cloud storage accounts from one CLI tool.$q$, $q$Individuals with multiple cloud accounts$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$overview$q$, $q$What is Rclone?$q$, 2, ARRAY[$q$Rclone is a free, open-source command-line program for managing files across cloud storage platforms, often described as 'the Swiss army knife of cloud storage.' It supports syncing, copying, moving, and deleting files, plus bidirectional sync via Bisync.$q$, $q$It can mount cloud storage as a local filesystem, perform server-side transfers to save bandwidth, and serve data over protocols like SFTP, HTTP, WebDAV, and FTP.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', $q$who-its-for$q$, $q$Who Rclone is for$q$, 2, ARRAY[$q$Rclone is built for developers, system administrators, and anyone comfortable with the command line who needs to move, sync, or back up data across more than 70 supported cloud storage providers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d6ffdf8-6da0-4046-a24c-1af0f948ce0d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Mutagen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source file synchronization and network forwarding tool for connecting local development tools to remote infrastructure.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mutagen is free, open-source MIT-licensed file synchronization and network forwarding software for local-to-remote developer workflows, now part of Docker.$q$,
  og_description = $q$Mutagen is free, open-source MIT-licensed file synchronization and network forwarding software for local-to-remote developer workflows, now part of Docker.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '245ad2b6-9f67-4f27-8678-01d18388c426';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '245ad2b6-9f67-4f27-8678-01d18388c426' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Two-way file synchronization$q$, $q$Fast, real-time two-way code sync using a custom algorithm with low-latency filesystem watching.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Network forwarding$q$, $q$Forwards TCP traffic, Unix domain sockets, and Windows named pipes between local and remote endpoints.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Docker and Compose integration$q$, $q$Connects directly to Docker containers and integrates with Docker Compose projects via Mutagen Compose.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Cross-platform support$q$, $q$Handles multiple operating systems with automatic platform-specific adjustments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$SSH and local transports$q$, $q$Synchronizes over local, SSH, or Docker container transports.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Core code is open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Fast two-way sync well suited to remote and containerized development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Deep Docker Compose integration via Mutagen Compose$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Backed by Docker following its 2023 acquisition, with no planned licensing changes to open-source components$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Mutagen Pro paid subscriptions are no longer offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$The original Docker Desktop Mutagen extension has been replaced by Docker's own Synchronized File Shares feature (requiring a paid Docker subscription)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Some newer release binaries bundle SSPL-licensed code alongside the MIT core$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Is Mutagen free?$q$, $q$Yes, Mutagen's core is open source under the MIT license. Mutagen Pro paid subscriptions are no longer being offered.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Who owns Mutagen?$q$, $q$Docker acquired Mutagen IO, Inc. in 2023 to invest in Docker Desktop, with no planned changes to Mutagen's open-source licensing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Does Mutagen work with Docker Compose?$q$, $q$Yes, via the separate Mutagen Compose project, which uses x-mutagen extension fields in Compose YAML files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$What does Mutagen sync besides files?$q$, $q$It also forwards network traffic — TCP sockets, Unix domain sockets, and Windows named pipes — between local and remote endpoints.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Remote development file sync$q$, $q$Keeping a local codebase in sync with a remote server or cloud development environment in real time.$q$, $q$Developers working with remote infrastructure$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$Docker Compose development$q$, $q$Speeding up file sync into Docker containers during local development using Mutagen Compose.$q$, $q$Developers using Docker Compose$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$overview$q$, $q$What is Mutagen?$q$, 2, ARRAY[$q$Mutagen is an open-source tool, originally founded in 2016, that provides fast two-way file synchronization and network forwarding for connecting local development tools to remote or containerized infrastructure. Its core code is MIT-licensed.$q$, $q$Docker acquired Mutagen IO, Inc. in 2023 to strengthen Docker Desktop. Mutagen Pro paid subscriptions have since been discontinued, and the original Docker Desktop Mutagen extension was replaced by Docker's own Synchronized File Shares feature.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', $q$who-its-for$q$, $q$Who Mutagen is for$q$, 2, ARRAY[$q$Mutagen is aimed at developers who work against remote servers, cloud environments, or Docker containers and want their local editor and tools to stay in sync with that remote code in near real time.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('245ad2b6-9f67-4f27-8678-01d18388c426', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Kiwix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source offline reader that lets you download and browse Wikipedia and other web content without an internet connection.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2006,
  company_size = NULL,
  headquarters = $q$Lausanne, Switzerland$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kiwix is a free, open-source offline reader for browsing Wikipedia and other web content without internet access, available on desktop and mobile.$q$,
  og_description = $q$Kiwix is a free, open-source offline reader for browsing Wikipedia and other web content without internet access, available on desktop and mobile.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '650e05bf-0756-4e0c-83db-dabfb42d361a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '650e05bf-0756-4e0c-83db-dabfb42d361a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Offline content reader$q$, $q$Kiwix Reader opens ZIM-format archives so users can browse Wikipedia, Wiktionary, StackExchange, Gutenberg and other sites with no internet connection.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Kiwix Server$q$, $q$A self-hosted server component (kiwix-serve) lets organizations share offline content archives over a local network.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Kiwix Hotspot$q$, $q$Turns a device into a local wifi hotspot to distribute offline content to nearby users without any internet infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$ZIM content catalog$q$, $q$A built-in catalog and imager let users browse and download curated ZIM archives of educational and reference content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Cross-platform apps$q$, $q$Native apps and packages are available for Windows, macOS, Linux, Android and iOS, plus Chrome, Firefox and Edge browser extensions.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Completely free and open source (CC-BY-SA)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Works fully offline once content is downloaded$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Available on Windows, macOS, Linux, Android and iOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$No ads and no personal data collection$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Run by a non-profit with 20 years of offline-content experience$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Requires downloading large ZIM archive files in advance for offline use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Content freshness depends on how recently a given ZIM archive was published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Advanced deployments (Kiwix Server, Hotspot) require some technical setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Is Kiwix free?$q$, $q$Yes. Kiwix is free and open-source software funded primarily through donations, released under a CC-BY-SA license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$What content can I access with Kiwix?$q$, $q$Kiwix reads ZIM-format archives, which include offline copies of Wikipedia, Wiktionary, StackExchange, Project Gutenberg and other reference sites.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Can I use Kiwix without internet access?$q$, $q$Yes, once you download a ZIM content file, Kiwix Reader displays it fully offline.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$What platforms does Kiwix support?$q$, $q$Kiwix has native applications for Windows, macOS, Linux, Android and iOS, as well as browser extensions for Chrome, Firefox and Edge.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Who runs Kiwix?$q$, $q$Kiwix is developed by the Kiwix Association, a non-profit organization headquartered in Lausanne, Switzerland, founded in 2006.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Education in low-connectivity regions$q$, $q$Schools and libraries use Kiwix Hotspot and offline ZIM archives to give students access to Wikipedia and reference material without internet access.$q$, $q$Educators and NGOs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Personal offline reference library$q$, $q$Individuals download Kiwix Reader and ZIM archives to keep a searchable offline copy of Wikipedia or other reference sites on a laptop or phone.$q$, $q$Individual users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$Organizational content sharing$q$, $q$Organizations run Kiwix Server to share offline content archives with staff over a local network without internet dependency.$q$, $q$IT teams and organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$overview$q$, $q$What is Kiwix?$q$, 2, ARRAY[$q$Kiwix is free, open-source software that provides offline access to knowledge. It reads ZIM-format archives, letting users browse Wikipedia and other reference content without an internet connection.$q$, $q$Run by the non-profit Kiwix Association based in Lausanne, Switzerland since 2006, Kiwix offers a Reader app, a self-hosted Kiwix Server, and Kiwix Hotspot for distributing offline content over local wifi. It is ad-free and does not collect personal data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', $q$who-its-for$q$, $q$Who Kiwix is for$q$, 2, ARRAY[$q$Kiwix is used by schools, libraries and NGOs in regions with unreliable internet access, as well as individuals who want an offline reference library on their laptop, tablet or phone.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('650e05bf-0756-4e0c-83db-dabfb42d361a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Linkding ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted bookmark manager designed to be minimal, fast and easy to deploy in a single Docker container.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Linkding is a free, open-source, self-hosted bookmark manager that runs in a single Docker container with automatic metadata and archiving.$q$,
  og_description = $q$Linkding is a free, open-source, self-hosted bookmark manager that runs in a single Docker container with automatic metadata and archiving.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8026be73-ac41-420c-b94b-3ca165f049ef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8026be73-ac41-420c-b94b-3ca165f049ef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Automatic metadata fetching$q$, $q$Linkding automatically retrieves the title, description, icon and preview image for each saved bookmark.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Website archiving$q$, $q$Creates local HTML snapshots of saved pages or archives them via the Internet Archive for later reference.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Bulk editing$q$, $q$Apply tagging, archiving or deletion actions across multiple bookmarks at once.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Import and export$q$, $q$Supports importing and exporting bookmarks in the standard Netscape HTML format.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Multi-user support$q$, $q$Supports multiple user accounts with bookmark sharing between users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Browser extensions$q$, $q$Official browser extensions for Firefox and Chrome allow saving bookmarks directly from the browser.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$REST API$q$, $q$A REST API is available for building custom scripts and third-party integrations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Deploys as a single Docker container with SQLite, minimal operational overhead$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Automatic metadata fetching and website archiving$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Official Firefox and Chrome browser extensions$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$REST API for custom integrations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Requires self-hosting; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$No native mobile apps, relies on browser extensions and the web UI$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Users are responsible for their own backups and updates$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Is Linkding free?$q$, $q$Yes, Linkding is free, open-source software that you self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$How do I install Linkding?$q$, $q$Linkding is designed to run in a single Docker container using SQLite as its database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Does Linkding have browser extensions?$q$, $q$Yes, official extensions are available for Firefox and Chrome.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Can I import my existing bookmarks?$q$, $q$Yes, Linkding supports importing and exporting bookmarks in the Netscape HTML bookmark format.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Does Linkding have an API?$q$, $q$Yes, a REST API is provided for building custom scripts and integrations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Personal bookmark archive$q$, $q$Individuals self-host Linkding to keep a private, searchable archive of saved links with automatic snapshots.$q$, $q$Individual users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$Shared team bookmarks$q$, $q$Teams run a shared Linkding instance with multiple user accounts to collect and organize useful links.$q$, $q$Small teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$overview$q$, $q$What is Linkding?$q$, 2, ARRAY[$q$Linkding is a self-hosted bookmark manager built to be minimal, fast and easy to set up. It runs in a single Docker container using SQLite, and automatically fetches titles, descriptions, icons and preview images for saved links.$q$, $q$It supports website archiving, bulk bookmark editing, Netscape HTML import/export, multi-user accounts, and official browser extensions for Firefox and Chrome, alongside a REST API for custom integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', $q$who-its-for$q$, $q$Who Linkding is for$q$, 2, ARRAY[$q$Linkding suits self-hosters and privacy-conscious users who want a lightweight, low-maintenance bookmark manager they fully control, rather than a hosted third-party service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8026be73-ac41-420c-b94b-3ca165f049ef', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LinkAce ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source bookmark archive with tagging, Internet Archive backups, and a full REST API.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Japanese$q$, $q$Spanish$q$, $q$Polish$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$LinkAce is a free, open-source, self-hosted bookmark archive with automatic Internet Archive backups, tagging and a full REST API.$q$,
  og_description = $q$LinkAce is a free, open-source, self-hosted bookmark archive with automatic Internet Archive backups, tagging and a full REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a589b88-3042-41c7-8ea2-df2e6f517ac7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a589b88-3042-41c7-8ea2-df2e6f517ac7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Automatic Internet Archive backups$q$, $q$LinkAce can automatically back up saved links to the Internet Archive to protect against link rot.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Link monitoring$q$, $q$Monitors saved links to detect when they go offline or change.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Full REST API$q$, $q$Exposes all features via a REST API, allowing control and access to data from other applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Zapier integration$q$, $q$Connects to more than 5,000 other apps such as Google Drive, Discord and Slack through Zapier.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Browser bookmarklet$q$, $q$A bookmarklet allows quickly saving links from any browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Advanced search and filtering$q$, $q$Supports advanced search with multiple filters and ordering options, plus HTML bookmark import/export.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$S3-compatible backups$q$, $q$Supports complete database and application backups to any AWS S3-compatible storage.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Free and open source under the GPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Automatic Internet Archive backups reduce link rot$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Full REST API and Zapier integration for automation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Supports multiple languages including English, German, French, Japanese, Spanish, Polish and Chinese$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Docker-based installer simplifies self-hosted setup$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Requires self-hosting; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Setup and maintenance require basic server/Docker knowledge$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Is LinkAce free?$q$, $q$Yes, LinkAce is free and open source, released under the GPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$How do I install LinkAce?$q$, $q$LinkAce ships with pre-configured Docker setups and a built-in web installer; Docker is the recommended installation method.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Does LinkAce back up links automatically?$q$, $q$Yes, LinkAce can automatically back up saved links to the Internet Archive and monitors them for availability changes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Does LinkAce have an API?$q$, $q$Yes, a full REST API exposes all features for use in other applications.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$What languages does LinkAce support?$q$, $q$LinkAce supports multiple languages, including English, German, French, Japanese, Spanish, Polish and Chinese.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Personal permanent link library$q$, $q$Individuals self-host LinkAce to build a permanent, searchable archive of bookmarks with automatic Internet Archive backups.$q$, $q$Individual users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$Automated bookmark workflows$q$, $q$Users connect LinkAce to other apps via its REST API and Zapier integration to automate saving and organizing links.$q$, $q$Power users and automation-focused teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$overview$q$, $q$What is LinkAce?$q$, 2, ARRAY[$q$LinkAce is a free, open-source, self-hosted bookmark archive. It automatically backs up saved links to the Internet Archive, monitors links for availability, and offers advanced search and filtering.$q$, $q$It provides a full REST API, a Zapier integration connecting to more than 5,000 apps, a browser bookmarklet, HTML import/export, and support for backing up its database to S3-compatible storage. It is released under the GPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', $q$who-its-for$q$, $q$Who LinkAce is for$q$, 2, ARRAY[$q$LinkAce suits self-hosters who want a permanent, archive-backed bookmark library with automation options via API and Zapier, rather than a hosted third-party bookmarking service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a589b88-3042-41c7-8ea2-df2e6f517ac7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Shaarli ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Minimalist, self-hosted bookmark manager and link-sharing service that stores links in files with no database required.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Shaarli is a free, open-source, self-hosted bookmark manager and link-sharing tool that stores links in files with no database required.$q$,
  og_description = $q$Shaarli is a free, open-source, self-hosted bookmark manager and link-sharing tool that stores links in files with no database required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0c2a2dac-cd9a-4339-9ab2-dfd365b2be95';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0c2a2dac-cd9a-4339-9ab2-dfd365b2be95' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$File-based storage$q$, $q$Shaarli stores saved links (shaares) in files, so no database installation is required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Editable link metadata$q$, $q$Each saved link can be edited with a title, description, tags, and privacy status.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Tag cloud and picture wall views$q$, $q$Browse saved links through a tag cloud/list view or a visual picture wall.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$RSS and ATOM feeds$q$, $q$Generates ATOM and RSS feeds that can be filtered by tags, including a daily digest feed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Automatic URL cleanup$q$, $q$Automatically strips tracking parameters from saved URLs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Plugin system and REST API$q$, $q$Extensible via plugins and a REST API for building third-party client applications.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$LDAP login support$q$, $q$Supports LDAP authentication for login.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$No database required, simplifying installation and backups$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Lightweight and minimalist, easy to drop onto a server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Plugin system and REST API for extensibility$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Docker deployment supported alongside traditional server install$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Requires self-hosting; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Minimalist feature set compared to more full-featured bookmarking apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$No native mobile apps beyond the responsive web interface$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Is Shaarli free?$q$, $q$Yes, Shaarli is free, open-source, self-hosted software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Does Shaarli require a database?$q$, $q$No, Shaarli stores saved links (shaares) in files instead of requiring a database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Can I install Shaarli with Docker?$q$, $q$Yes, Shaarli supports both traditional server installation and Docker deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Does Shaarli support RSS?$q$, $q$Yes, Shaarli generates ATOM and RSS feeds that can be filtered by tags.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Can Shaarli be extended with plugins?$q$, $q$Yes, Shaarli has a plugin system and a REST API for building integrations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Lightweight personal bookmarking$q$, $q$Individuals self-host Shaarli as a simple, file-based bookmark manager without database overhead.$q$, $q$Individual users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$Public link sharing and microblogging$q$, $q$Users publish curated public link lists or short notes via Shaarli's link-sharing and daily digest features.$q$, $q$Bloggers and link curators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$overview$q$, $q$What is Shaarli?$q$, 2, ARRAY[$q$Shaarli is a minimalist bookmark manager and link-sharing service that you install on your own server. It supports use cases including link sharing, bookmarking, microblogging, read-it-later lists, note-taking and knowledge bases.$q$, $q$It stores saved links in files rather than a database, offers tag cloud and picture wall views, ATOM/RSS feeds filterable by tags, automatic tracking-parameter cleanup, a plugin system, and a REST API. It is a community-maintained fork of the original project by Sébastien Sauvage.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', $q$who-its-for$q$, $q$Who Shaarli is for$q$, 2, ARRAY[$q$Shaarli suits self-hosters who want a lightweight, database-free bookmarking and link-sharing tool, including bloggers who publish curated public link lists.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0c2a2dac-cd9a-4339-9ab2-dfd365b2be95', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Readeck ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source read-it-later app that saves readable copies of web articles, images and videos for offline keeping.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Readeck is a free, open-source, self-hosted read-it-later app built in Go that saves readable web articles for offline access.$q$,
  og_description = $q$Readeck is a free, open-source, self-hosted read-it-later app built in Go that saves readable web articles for offline access.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '64003bd2-5181-45f3-8722-b827c604e9d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '64003bd2-5181-45f3-8722-b827c604e9d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Readable content extraction$q$, $q$Saves the readable content of web pages, including articles, images and videos, for permanent offline keeping.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Full-text search$q$, $q$Searches across all saved content to quickly find previously bookmarked material.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Labels, favorites and archives$q$, $q$Organizes saved items with labels, favorites and an archive for long-term storage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Highlights and annotations$q$, $q$Lets users highlight and annotate saved articles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Collections$q$, $q$Saves custom search queries as collections for quick access later.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$EPUB export and OPDS catalog$q$, $q$Exports saved articles as EPUB e-books and exposes an OPDS catalog for e-reader apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Browser extensions$q$, $q$Firefox and Chrome browser extensions let users save pages directly while browsing.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Free and open source under the AGPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Simple self-hosted deployment via a single Docker/Podman container or standalone binary$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$EPUB export and OPDS support for e-reader users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Lightweight Go backend using server-side rendering instead of a heavy SPA$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Browser extensions for Firefox and Chrome$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Requires self-hosting; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Newer project with a smaller community than more established read-it-later tools$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Is Readeck free?$q$, $q$Yes, Readeck is free, open-source software released under the AGPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$How do I self-host Readeck?$q$, $q$Readeck can be deployed as a single Docker or Podman container, as a standalone binary, or built from source, typically using SQLite as the database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Can I export saved articles as e-books?$q$, $q$Yes, Readeck supports exporting saved content as EPUB files and offers an OPDS catalog for e-readers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Does Readeck have browser extensions?$q$, $q$Yes, Firefox and Chrome browser extensions are available for saving pages while browsing.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$What is Readeck built with?$q$, $q$Readeck's backend is built primarily in Go, with server-side rendering using Stimulus and Turbo.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$Personal offline reading archive$q$, $q$Individuals self-host Readeck to save articles, images and videos for distraction-free, permanent offline reading.$q$, $q$Individual readers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$E-reader article syncing$q$, $q$Users export saved articles as EPUB or connect an e-reader via OPDS to read saved content on dedicated devices.$q$, $q$E-reader owners$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$overview$q$, $q$What is Readeck?$q$, 2, ARRAY[$q$Readeck is a free, open-source, self-hosted read-it-later application. It saves the readable content of web pages, including articles, images and videos, for permanent offline keeping.$q$, $q$Built in Go with server-side rendering, Readeck offers full-text search, labels, favorites, archives, highlights, collections, EPUB export, an OPDS catalog for e-readers, and browser extensions for Firefox and Chrome. It is released under the AGPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', $q$who-its-for$q$, $q$Who Readeck is for$q$, 2, ARRAY[$q$Readeck suits self-hosters who want a lightweight, privacy-respecting read-it-later tool, particularly those who read saved articles on e-readers via EPUB or OPDS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64003bd2-5181-45f3-8722-b827c604e9d2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Omnivore ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted read-it-later app for saving, highlighting and annotating articles, now available only as a self-hosted server.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Omnivore is a free, open-source read-it-later app for saving and highlighting articles, now self-hosted only after its cloud service was deprecated.$q$,
  og_description = $q$Omnivore is a free, open-source read-it-later app for saving and highlighting articles, now self-hosted only after its cloud service was deprecated.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0882639c-99a4-4dc9-ad54-7de7889c2d10';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0882639c-99a4-4dc9-ad54-7de7889c2d10' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Highlighting and notes$q$, $q$Users can highlight passages and add notes to saved articles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Full-text search and sharing$q$, $q$Searches across all saved content and supports sharing saved articles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Native mobile apps and PWA$q$, $q$Includes a native iOS app, an Android app, and a progressive web app for offline reading.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Browser extensions$q$, $q$Extensions are available for Chrome, Safari, Firefox and Edge to save pages while browsing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$PDF support$q$, $q$Supports saving and reading PDF documents alongside web articles.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Newsletter integration$q$, $q$Can receive and store newsletter content, including Substack support.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Logseq and Obsidian integration$q$, $q$Offers integration plugins for exporting highlights and notes to Logseq and Obsidian.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Free and open source under the AGPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Full self-hosting guide available for running your own server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Native iOS and Android apps plus a progressive web app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Browser extensions for Chrome, Safari, Firefox and Edge$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Integrations with Logseq and Obsidian for note-taking workflows$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$The hosted cloud application was deprecated in November 2024, so it now requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Self-hosting requires setting up and maintaining your own server infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Text-to-speech is limited to iOS$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Is Omnivore still available as a hosted service?$q$, $q$No, Omnivore's cloud application was deprecated in November 2024. It is now a self-hosted-only application.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Is Omnivore free?$q$, $q$Yes, Omnivore is free, open-source software released under the AGPL-3.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Does Omnivore have mobile apps?$q$, $q$Yes, it has a native iOS app, an Android app, and a progressive web app.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Can I save newsletters in Omnivore?$q$, $q$Yes, Omnivore supports newsletter integration, including Substack.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Does Omnivore integrate with note-taking apps?$q$, $q$Yes, it offers integration plugins for Logseq and Obsidian.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Self-hosted read-it-later archive$q$, $q$Technical users self-host Omnivore to save, highlight and annotate articles without relying on a third-party cloud service.$q$, $q$Self-hosters and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$Note-taking workflow integration$q$, $q$Users export highlights and notes from Omnivore into Logseq or Obsidian as part of a personal knowledge management workflow.$q$, $q$Knowledge workers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$overview$q$, $q$What is Omnivore?$q$, 2, ARRAY[$q$Omnivore is a complete, open-source read-it-later solution for saving, highlighting, annotating and searching articles. Its cloud-hosted application was deprecated in November 2024, and it is now available only as a self-hosted application.$q$, $q$It offers native iOS and Android apps, a progressive web app, browser extensions for Chrome, Safari, Firefox and Edge, PDF support, newsletter integration including Substack, and integrations with Logseq and Obsidian. It is released under the AGPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', $q$who-its-for$q$, $q$Who Omnivore is for$q$, 2, ARRAY[$q$Omnivore suits technically inclined readers who want a full-featured, self-hosted read-it-later tool and are comfortable running their own server since the cloud version is no longer available.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0882639c-99a4-4dc9-ad54-7de7889c2d10', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Webrecorder ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nonprofit suite of open-source web archiving tools, including Browsertrix, ArchiveWeb.page and ReplayWeb.page, for capturing and replaying web pages.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Webrecorder builds open-source web archiving tools, including Browsertrix, ArchiveWeb.page and ReplayWeb.page, for capturing and replaying web pages.$q$,
  og_description = $q$Webrecorder builds open-source web archiving tools, including Browsertrix, ArchiveWeb.page and ReplayWeb.page, for capturing and replaying web pages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c3ec637c-da4e-49a1-b2c3-ecb51e556b29' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Browsertrix crawling platform$q$, $q$An automated, browser-based crawling platform for creating interactive web archives at scale, offered with free trials and tiered plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$ArchiveWeb.page$q$, $q$A free Chrome extension and desktop app for recording complex, interactive web page behavior while browsing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$ReplayWeb.page$q$, $q$A free, serverless playback tool for viewing archived WARC/WACZ files directly in the browser.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Login-protected page capture$q$, $q$Can archive pages that require a login, along with interactive and social media content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Deduplication$q$, $q$Uses deduplication technology to reduce storage requirements for large web archives.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Open-source developer tools$q$, $q$Provides open-source libraries, command-line tools and file format specifications on GitHub.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$ArchiveWeb.page and ReplayWeb.page are free to use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Handles complex, interactive and login-protected web content that simple crawlers miss$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Run by a nonprofit focused on digital preservation, used by libraries and universities$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Deduplication reduces storage costs for large-scale archives$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Open-source tools and file format specs available on GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Browsertrix's full crawling platform is a paid, tiered service beyond the free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Large-scale web archiving still requires technical setup and storage planning$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Is Webrecorder free?$q$, $q$Some Webrecorder tools, including ArchiveWeb.page and ReplayWeb.page, are free. Browsertrix, its automated crawling platform, offers a free trial with paid tiered plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$What is Browsertrix?$q$, $q$Browsertrix is Webrecorder's automated, browser-based crawling platform for creating interactive web archives at scale.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Can Webrecorder archive login-protected pages?$q$, $q$Yes, its tools are built to capture login-protected pages and interactive web content, including social media posts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Who uses Webrecorder?$q$, $q$Webrecorder is used by libraries, universities, governments and cultural organizations for digital preservation.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Is Webrecorder open source?$q$, $q$Yes, Webrecorder's developer tools, libraries and file format specifications are open source and available on GitHub.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Institutional web archiving$q$, $q$Libraries and universities use Browsertrix to crawl and preserve interactive websites at scale for long-term digital archives.$q$, $q$Libraries and universities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$Personal page capture$q$, $q$Individuals use the free ArchiveWeb.page extension to capture complex or interactive pages they want to preserve.$q$, $q$Individual users and researchers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$overview$q$, $q$What is Webrecorder?$q$, 2, ARRAY[$q$Webrecorder is a nonprofit that builds open-source tools for web archiving and digital preservation. Its suite includes Browsertrix, an automated browser-based crawling platform; ArchiveWeb.page, a free Chrome extension and desktop app for recording interactive browsing sessions; and ReplayWeb.page, a free serverless tool for replaying WARC/WACZ archives.$q$, $q$The tools are built to capture complex, interactive and login-protected web content, including social media, and use deduplication technology to reduce storage needs for large archives.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', $q$who-its-for$q$, $q$Who Webrecorder is for$q$, 2, ARRAY[$q$Webrecorder is used by libraries, universities, governments and cultural institutions doing large-scale digital preservation, as well as individuals and researchers who need to capture interactive web pages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c3ec637c-da4e-49a1-b2c3-ecb51e556b29', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Pinry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted tiling image board for saving, tagging and sharing images, videos and web pages.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Pinry is a free, open-source, self-hosted image board for saving, tagging and sharing images, videos and web pages.$q$,
  og_description = $q$Pinry is a free, open-source, self-hosted image board for saving, tagging and sharing images, videos and web pages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eed72c85-b8c1-41ad-bfa6-c1d425f02b1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eed72c85-b8c1-41ad-bfa6-c1d425f02b1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Tagging system$q$, $q$Users can assign multiple tags to every pin and instantly filter their entire collection by tag.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Public and private boards$q$, $q$Supports both public boards for sharing and private boards for personal collections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Multi-user support$q$, $q$Allows multiple user accounts to save and manage their own pins.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$REST API$q$, $q$A full REST API built on Django REST Framework exposes pin and board data for integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Single-container Docker deployment$q$, $q$Ships as a single Docker container backed by SQLite for a zero-dependency setup.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Browser extension compatibility$q$, $q$Works with browser extensions for saving images and pages directly to Pinry.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Free and open source under the BSD-2-Clause license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Simple self-hosted deployment as a single Docker container with SQLite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Tag-based organization with instant filtering$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Full REST API for integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$No ads and no account required for public browsing if enabled$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Requires self-hosting; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Simpler feature set than commercial visual bookmarking tools like Pinterest$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Is Pinry free?$q$, $q$Yes, Pinry is free, open-source software released under the BSD-2-Clause license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$How do I self-host Pinry?$q$, $q$Pinry ships as a single Docker container backed by SQLite, designed for a zero-dependency self-hosted setup.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$What is Pinry built with?$q$, $q$Pinry combines a Django REST Framework backend with a Vue.js frontend.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Can multiple people use the same Pinry instance?$q$, $q$Yes, Pinry supports multiple user accounts with public and private boards.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Does Pinry have an API?$q$, $q$Yes, Pinry provides a full REST API for accessing and managing pins and boards.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Personal visual bookmarking$q$, $q$Individuals self-host Pinry to save and tag images, videos and web pages in a private, ad-free tiling board.$q$, $q$Individual users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$Team image collections$q$, $q$Small teams, such as photographers or designers, use Pinry's public/private boards to collaborate on shared visual references.$q$, $q$Small teams and creative professionals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$overview$q$, $q$What is Pinry?$q$, 2, ARRAY[$q$Pinry is a free, open-source, self-hosted tiling image board for saving, tagging and sharing images, videos and web pages in an easy-to-skim format.$q$, $q$Built with a Django REST Framework backend and a Vue.js frontend, Pinry ships as a single Docker container with SQLite. It supports multi-user accounts, public and private boards, tag-based filtering, and a full REST API, and is released under the BSD-2-Clause license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', $q$who-its-for$q$, $q$Who Pinry is for$q$, 2, ARRAY[$q$Pinry suits self-hosters, photographers and small teams who want a private, ad-free alternative to hosted visual bookmarking services for collecting and organizing images.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eed72c85-b8c1-41ad-bfa6-c1d425f02b1e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Immich ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted photo and video backup application with mobile auto-backup, built as an open-source alternative to cloud photo storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Immich is a free, open-source, self-hosted photo and video backup app with mobile auto-backup, built by FUTO under the AGPL v3 license.$q$,
  og_description = $q$Immich is a free, open-source, self-hosted photo and video backup app with mobile auto-backup, built by FUTO under the AGPL v3 license.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a6a9fcd4-559e-4221-972d-3f4084fc1dc5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Mobile auto-backup$q$, $q$The mobile app selectively backs up photos and videos from iOS and Android devices to your own Immich server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Web interface$q$, $q$A browser-based interface for viewing, managing and organizing your media library.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Facial clusters$q$, $q$Groups photos by detected faces to help organize a media library, with documentation guidance for improving cluster accuracy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Multi-user support$q$, $q$An admin user can create and manage additional user accounts on the same server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Database backup tools$q$, $q$Includes built-in capabilities for backing up metadata and user information.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Docker-based self-hosting$q$, $q$Deploys via Docker containers, using PostgreSQL as its database, on your own infrastructure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Free and open source under the AGPL v3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Mobile apps available on the Apple App Store, Google Play, and F-Droid$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Full control over storage location and data since it's self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Facial clustering helps organize large photo libraries$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Active development backed by FUTO with a public roadmap$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Requires self-hosting via Docker; no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Recommended minimum of 6GB RAM and 2 CPU cores for the server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Users are responsible for their own server maintenance, backups and updates$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Is Immich free?$q$, $q$Yes, Immich is free, open-source software released under the AGPL v3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$What are the server requirements for Immich?$q$, $q$Immich recommends a minimum of 6GB RAM and 2 CPU cores, Docker, and a PostgreSQL database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Does Immich have mobile apps?$q$, $q$Yes, Immich has mobile apps available on the Apple App Store, Google Play Store, and F-Droid with automatic backup.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Who develops Immich?$q$, $q$Immich is developed by FUTO.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Can multiple people use one Immich server?$q$, $q$Yes, an admin user can add and manage additional user accounts on the same Immich instance.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Self-hosted photo backup$q$, $q$Individuals run Immich on their own server or NAS to automatically back up phone photos and videos instead of using a commercial cloud photo service.$q$, $q$Individual users and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$Family photo library$q$, $q$Families use Immich's multi-user support to give several people accounts on a shared, self-hosted photo library.$q$, $q$Families and small groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$overview$q$, $q$What is Immich?$q$, 2, ARRAY[$q$Immich is a self-hosted photo and video backup application that lets users manage their personal media library on their own infrastructure instead of relying on a commercial cloud service.$q$, $q$It offers mobile apps with automatic backup for iOS and Android, a web interface, facial clustering, multi-user support, and Docker-based deployment with PostgreSQL. It is free and open source under the AGPL v3 license, developed by FUTO.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', $q$who-its-for$q$, $q$Who Immich is for$q$, 2, ARRAY[$q$Immich suits self-hosters, privacy-conscious individuals, and families who want a Google Photos-style auto-backup experience while keeping their photo and video library on infrastructure they control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a6a9fcd4-559e-4221-972d-3f4084fc1dc5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── PhotoPrism ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered, privacy-first, self-hosted app for browsing, organizing, and sharing photos and videos with face recognition and smart search.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6.50/month$q$,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Self-hosted, AI-powered photo and video manager with face recognition, smart search, and privacy-first design. Free community edition available.$q$,
  og_description = $q$Self-hosted, AI-powered photo and video manager with face recognition, smart search, and privacy-first design. Free community edition available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2f89cac5-124c-4e1b-8f09-b84e459dd4dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2f89cac5-124c-4e1b-8f09-b84e459dd4dc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Face Recognition$q$, $q$Automatically recognizes and groups faces of family and friends across your photo library.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$AI Content Labeling$q$, $q$Classifies photos automatically based on subject matter and location data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Advanced Search$q$, $q$Filter photos by label, location, resolution, color, and quality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$RAW & Video Support$q$, $q$Handles RAW image formats and multiple video formats without manual conversion.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Interactive World Maps$q$, $q$Six high-resolution maps for visualizing travel memories using privacy-preserving geocoding.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Live Photos Playback$q$, $q$View Live Photos with hover previews and slideshow support.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$WebDAV Sync$q$, $q$Connect via a WebDAV client or compatible backup apps like PhotoSync for automatic phone backup.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Free, self-hosted Community Edition with unlimited storage for personal use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Strong AI-powered face recognition and automatic content classification$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Privacy-first: data stays under user control, with no third-party data sharing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Supports RAW images and a wide range of video formats$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Managed hosting available via PikaPods for users who don't want to self-host$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Essentials and Plus editions are paid monthly even though they are still self-hosted$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Requires Docker or similar technical setup for self-hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Documentation does not describe native desktop or mobile apps beyond the web/PWA interface$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Is PhotoPrism free?$q$, $q$Yes, the Community Edition is free and open source (AGPL 3.0) with unlimited storage for personal use. Paid Essentials and Plus editions add features like additional user roles and enhanced geocoding.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$What license does PhotoPrism use?$q$, $q$PhotoPrism is released under the AGPL 3.0 license, with documentation available under CC BY-NC-SA 4.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Can I use PhotoPrism without self-hosting it myself?$q$, $q$Yes, fully managed hosting is available through PikaPods starting from $6.50 per month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Where is PhotoPrism based?$q$, $q$PhotoPrism UG is based in Berlin, Germany, and describes itself as 100% self-funded and independent.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Does PhotoPrism support face recognition?$q$, $q$Yes, it automatically recognizes the faces of family and friends across a photo library.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Private photo archiving$q$, $q$Self-host a personal photo and video library instead of relying on a commercial cloud service.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Family photo organization$q$, $q$Organize and share family photos using automatic face recognition and content classification.$q$, $q$Families$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Team photo management$q$, $q$Use the Essentials or Plus editions for multi-user roles and management features in small teams.$q$, $q$Small teams and organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Community$q$, $q$Free$q$, NULL, $q$["Self-hosted, open source (AGPL 3.0)","Unlimited storage and instances for personal use","Folder structure, duplicate detection, scheduled indexing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Essentials$q$, $q$€200/month$q$, $q$annual$q$, $q$["Self-hosted","Additional user roles","Enhanced geocoding","3D vector and satellite maps"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$Plus$q$, $q$from €600/month$q$, $q$annual$q$, $q$["Self-hosted","User management UI","Vector graphics support","Private members chat access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$PikaPods (Managed Cloud)$q$, $q$from $6.50/month$q$, $q$monthly$q$, $q$["Fully managed hosting","Flexible storage and instances","Less technical setup required"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$overview$q$, $q$What is PhotoPrism?$q$, 2, ARRAY[$q$PhotoPrism is an AI-powered, privacy-first application for browsing, organizing, and sharing photos and videos. It is built and maintained by PhotoPrism UG, a self-funded, independent company based in Berlin, Germany, founded in 2018, and is designed to be self-hosted so users retain control over their media and data.$q$, $q$The Community Edition is free and open source under the AGPL 3.0 license, offering unlimited storage and instances for personal use. Paid Essentials and Plus editions add features such as additional user roles, enhanced geocoding, and 3D vector and satellite maps, while PikaPods offers fully managed hosting starting from $6.50 per month for users who prefer not to self-host.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', $q$who-its-for$q$, $q$Who PhotoPrism is for$q$, 2, ARRAY[$q$PhotoPrism is aimed at privacy-conscious individuals, families, and small teams who want an alternative to commercial cloud photo services without giving up AI-powered features like face recognition and automatic content classification.$q$, $q$Because it supports RAW image formats, multiple video formats, and deployment via Docker on hardware ranging from Raspberry Pi to NAS devices, it also suits home-lab and self-hosting enthusiasts who want control over their own infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f89cac5-124c-4e1b-8f09-b84e459dd4dc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── LibrePhotos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source photo management service with AI-powered face recognition, object detection, and semantic search.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Open-source, self-hosted photo manager with face recognition, object detection, and semantic search powered by machine learning. Free and MIT licensed.$q$,
  og_description = $q$Open-source, self-hosted photo manager with face recognition, object detection, and semantic search powered by machine learning. Free and MIT licensed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd62c6f08-582d-469d-a2bc-f3b5a26a0454';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd62c6f08-582d-469d-a2bc-f3b5a26a0454' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Face Recognition & Classification$q$, $q$Detects and groups faces using local machine learning models such as face_recognition and scikit-learn.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Object & Scene Detection$q$, $q$Automatically tags photos based on detected objects and scenes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Semantic Search$q$, $q$Search the photo library using metadata-based, semantic queries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Timeline View$q$, $q$Automatically organizes photos into a chronological timeline via scanning.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Event-Based Albums$q$, $q$Automatically generates albums grouped by events.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Multiuser Support$q$, $q$Multiple user accounts can access the same LibrePhotos instance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Reverse Geocoding$q$, $q$Converts photo GPS data into readable location names.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Android App$q$, $q$Dedicated Android mobile client built with React Native.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Advanced AI features (face recognition, object detection, semantic search) run locally$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Actively maintained with regular releases, including version 1.0.3 in June 2026$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Multiuser support for shared or family libraries$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Dedicated Android mobile client available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Requires Docker and self-hosting technical knowledge to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$No iOS client is documented$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$No official hosted or managed cloud option$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Is LibrePhotos free?$q$, $q$Yes, LibrePhotos is fully open source under the MIT license with no paid tiers documented.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Does LibrePhotos support face recognition?$q$, $q$Yes, it uses machine learning tools including face_recognition and scikit-learn for face detection and clustering.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$What platforms does LibrePhotos run on?$q$, $q$It is deployed via Docker and Docker Compose, is recommended on Linux, and offers a React web client plus a React Native Android app.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Is LibrePhotos actively maintained?$q$, $q$Yes, the project has ongoing releases, with version 1.0.3 released in June 2026.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Can multiple users share a LibrePhotos instance?$q$, $q$Yes, LibrePhotos supports multiuser access to the same instance.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Private family photo library$q$, $q$Run a self-hosted alternative to commercial cloud photo services for family photo storage.$q$, $q$Privacy-conscious families$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$Self-hosted media archiving$q$, $q$Deploy via Docker for personal or homelab photo archiving with full data control.$q$, $q$Self-hosters and developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$AI-powered offline photo search$q$, $q$Use semantic search and object detection without sending images to a third-party cloud.$q$, $q$Privacy-focused individuals$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$overview$q$, $q$What is LibrePhotos?$q$, 2, ARRAY[$q$LibrePhotos is a self-hosted, open-source photo management service with automatic face recognition, object detection, and semantic search, powered by machine learning models such as face_recognition, scikit-learn, and places365. It is released under the MIT license and is actively maintained, with version 1.0.3 released in June 2026.$q$, $q$The application supports all major photo types, including RAW images and videos, and organizes them into a timeline view with event-based albums. It uses a Django and PostgreSQL backend with a React/TypeScript frontend, and is deployed via Docker and Docker Compose.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', $q$who-its-for$q$, $q$Who LibrePhotos is for$q$, 2, ARRAY[$q$LibrePhotos is built for individuals and families who want commercial-grade AI photo organization features, such as face recognition and semantic search, without sending their images to a third-party cloud service.$q$, $q$Its multiuser support and dedicated Android client also make it suitable for households or small groups sharing a self-hosted photo library.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d62c6f08-582d-469d-a2bc-f3b5a26a0454', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Piwigo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source photo gallery software for self-hosted or cloud-hosted album management, sharing, and organization.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€29/month$q$,
  founded_year = 2002,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$Danish$q$, $q$German$q$, $q$English$q$, $q$Spanish$q$, $q$French$q$, $q$Italian$q$, $q$Dutch$q$, $q$Polish$q$, $q$Portuguese (Brazilian)$q$, $q$Turkish$q$, $q$Russian$q$, $q$Simplified Chinese$q$]::text[],
  seo_meta_description = $q$Open-source photo gallery for self-hosted or cloud album management, with plugins, themes, and permissions. Free software or paid cloud plans.$q$,
  og_description = $q$Open-source photo gallery for self-hosted or cloud album management, with plugins, themes, and permissions. Free software or paid cloud plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc6e0788-b827-42b0-bfab-4a75e09f4a12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc6e0788-b827-42b0-bfab-4a75e09f4a12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Albums Hierarchy$q$, $q$Organize photos into nested album structures.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Batch Management$q$, $q$Bulk edit, tag, and manage large photo collections at once.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Plugins & Themes$q$, $q$Extend functionality with more than 200 community plugins and themes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Permissions Control$q$, $q$Set granular access permissions for albums and users.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$High-Volume Photo Handling$q$, $q$Manages libraries ranging from thousands to hundreds of thousands of photos.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Multi-language Interface$q$, $q$Available in a dozen-plus languages, including English, French, German, and Spanish.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Free, open-source self-hosted option under the GPL v2 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Long track record, in continuous development since 2002$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Highly extensible with more than 200 plugins and themes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Optional managed cloud hosting available via piwigo.com for non-technical users$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Multi-language interface$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Cloud hosting plans on piwigo.com require annual billing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Self-hosted setup requires PHP/MySQL server administration knowledge$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Features like AI tagging and full file-format support require higher-cost cloud plans (Enterprise and above)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Is Piwigo free?$q$, $q$Yes, the self-hosted software is free and open source under the GPL v2 license. Paid managed cloud hosting plans are also available via piwigo.com.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$What are Piwigo's cloud pricing plans?$q$, $q$Piwigo.com plans range from Pro (€29/month, 10 GB, annual billing) up to VIP (€399/month, 1,000 GB), all billed annually with a 30-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$How long has Piwigo been around?$q$, $q$Piwigo was founded in 2002 and has been in continuous development for over two decades.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Can I extend Piwigo's functionality?$q$, $q$Yes, there are more than 200 plugins and themes available for Piwigo.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$What languages does Piwigo support?$q$, $q$Piwigo supports many languages, including English, French, German, Spanish, Italian, Dutch, Polish, Portuguese (Brazilian), Turkish, Russian, Danish, and Simplified Chinese.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Self-hosted photo sharing$q$, $q$Deploy Piwigo on your own PHP/MySQL server for full control over a photo gallery.$q$, $q$Organizations and teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Managed cloud photo galleries$q$, $q$Use piwigo.com's hosted plans to run a photo gallery without managing server infrastructure.$q$, $q$Non-technical users and small businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$High-volume photo archives$q$, $q$Organize and manage very large photo collections using albums hierarchy and batch management.$q$, $q$Photographers and archivists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Community (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Open source, GPL v2 licensed","Full source code access","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Pro$q$, $q$€29/month$q$, $q$annual$q$, $q$["10 GB storage","1 admin","Unlimited users","Email support","Basic image/video/audio support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Team$q$, $q$€99/month$q$, $q$annual$q$, $q$["100 GB storage","3 admins","Unlimited users and contributors","All file formats (PSD, AI, EPS, PDF, etc.)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$Enterprise$q$, $q$€199/month$q$, $q$annual$q$, $q$["250 GB storage","5 admins","Advanced automation","Custom search filters","AI tagging"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$VIP$q$, $q$€399/month$q$, $q$annual$q$, $q$["1,000 GB storage","Unlimited admins","Phone support","Custom development","Dedicated server options","Monthly coaching"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$overview$q$, $q$What is Piwigo?$q$, 2, ARRAY[$q$Piwigo is open-source photo gallery software for organizing, managing, and sharing photos on the web, in continuous development since 2002. It is released under the GPL v2 license and can be self-hosted on a PHP/MySQL server, or used through piwigo.com's managed cloud hosting plans.$q$, $q$The software supports album hierarchies, batch photo management, and granular permissions, and can be extended with more than 200 community plugins and themes. It is available in a dozen or more languages, including English, French, German, and Spanish.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', $q$who-its-for$q$, $q$Who Piwigo is for$q$, 2, ARRAY[$q$Piwigo suits organizations, teams, and individuals who need to manage large photo libraries, from thousands to hundreds of thousands of images, with fine-grained permission controls.$q$, $q$Its self-hosted option appeals to users comfortable managing their own PHP/MySQL server, while its piwigo.com cloud plans, which include a 30-day free trial, serve users who prefer managed hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc6e0788-b827-42b0-bfab-4a75e09f4a12', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chevereto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted image and video hosting platform with a free open-source edition and paid Lite/Pro editions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$99/year$q$,
  founded_year = 2007,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Chevereto is self-hosted image and video hosting software with a free open-source edition and paid Lite/Pro plans.$q$,
  og_description = $q$Chevereto is self-hosted image and video hosting software with a free open-source edition and paid Lite/Pro plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '08cb66ce-1814-4087-a29d-3578403ad173';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '08cb66ce-1814-4087-a29d-3578403ad173' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Media management$q$, $q$Organize images and videos with categories, tags, and albums.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Multi-user accounts$q$, $q$User registration, profiles, two-factor authentication, and role-based access control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Multi-tenant support$q$, $q$Host multiple independent sites from a single Chevereto installation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Multi-language interface$q$, $q$The platform is available in over 30 languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Privacy controls$q$, $q$Granular content visibility and privacy settings for uploaded media.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$CDN and optimization$q$, $q$Built-in CDN support, caching, and image optimization.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$API access$q$, $q$An extensive API is available for integrating Chevereto with other systems.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Advanced storage integrations$q$, $q$Pro edition connects to S3 and Cloudflare R2 for scalable storage.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Free, open-source (AGPLv3) edition available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Self-hosted, giving full control over content and data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Supports over 30 languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Extensive API for integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Actively maintained, with a July 2026 release (4.5.5)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Advanced storage integrations (S3, Cloudflare R2) require the paid Pro edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Self-hosting requires a webserver, PHP, and MySQL/MariaDB setup and maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Paid editions require subscription renewal to keep receiving updates and support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Is Chevereto free?$q$, $q$Yes, Chevereto offers a free, open-source edition licensed under AGPLv3. Paid Lite and Pro editions are also available with additional features and support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$What licensing does Chevereto use?$q$, $q$The free edition uses the AGPLv3 open-source license, while the Lite and Pro editions use a proprietary commercial license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Can Chevereto be self-hosted?$q$, $q$Yes, Chevereto is designed to be self-hosted on a webserver with PHP, MySQL or MariaDB, and optional Redis.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Does Chevereto support multiple languages?$q$, $q$Yes, Chevereto supports over 30 languages.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$How is Chevereto installed?$q$, $q$It can be installed via Docker, VPS providers, cPanel, Plesk, or automated installers.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Self-hosted media sharing community$q$, $q$Build a Flickr- or Imgur-style platform for user-generated image and video uploads with full control over content and rules.$q$, $q$Community site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Branded image hosting$q$, $q$Host and manage branded media assets using the Pro edition's advanced S3/Cloudflare R2 storage integrations.$q$, $q$Businesses and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Free (Open Source)$q$, $q$Free$q$, NULL, $q$["AGPLv3 open-source license","Core media hosting features","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$Lite$q$, $q$$99/year$q$, $q$annual$q$, $q$["Lite feature set","Community support","License key"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$overview$q$, $q$What is Chevereto?$q$, 2, ARRAY[$q$Chevereto is a self-hosted media-sharing platform that lets users build their own image and video hosting website, similar to Flickr or Imgur, with complete control over content, data, and policies.$q$, $q$It uses a dual-licensing model: a free edition released under the AGPLv3 open-source license, and paid Lite and Pro editions under a proprietary commercial license that add features like advanced storage integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', $q$who-its-for$q$, $q$Who Chevereto is for$q$, 2, ARRAY[$q$Chevereto suits individuals and organizations that want to run their own branded image and video hosting service instead of relying on third-party platforms, particularly those comfortable self-hosting PHP/MySQL applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08cb66ce-1814-4087-a29d-3578403ad173', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── PhotoStructure ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted personal photo and video manager with automatic deduplication and organization.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/month$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$PhotoStructure is a self-hosted photo and video manager with a free Lite tier and a paid Plus plan from $5/month.$q$,
  og_description = $q$PhotoStructure is a self-hosted photo and video manager with a free Lite tier and a paid Plus plan from $5/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '738c4ff8-6bc1-45af-9978-423b14aba862';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '738c4ff8-6bc1-45af-9978-423b14aba862' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Automatic organization$q$, $q$Organizes photos and videos into customizable folder structures on your own storage.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Deduplication$q$, $q$Groups duplicates, edited versions, and resized copies of the same photo or video.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Cross-platform, portable libraries$q$, $q$Libraries run on Windows, macOS, Linux, or Docker and remain portable across systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Broad format support$q$, $q$Supports many photo and video file formats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Automatic video transcoding$q$, $q$Transcodes video files automatically for easier playback.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Keyword tagging and metadata handling$q$, $q$Tags assets with keywords and processes embedded metadata.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Face tag extraction$q$, $q$Extracts face tags from photos as part of the Plus plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Privacy-focused design$q$, $q$No tracking or analytics; files stay in their original, non-proprietary formats and locations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Free Lite tier available with no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Self-hosted; files remain in original, non-proprietary formats and locations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$No tracking or analytics$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Designed to handle libraries with millions of files$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Cross-platform: Windows, macOS, Linux, and Docker$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Advanced deduplication, mobile-friendly UI, and face tagging require the paid Plus subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$New assets stop receiving automatic organization or tagging if a lapsed Plus subscription isn't renewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Requires self-hosting and management on the user's own hardware$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Is PhotoStructure free?$q$, $q$Yes, the Lite tier is free. A paid Plus plan ($5/month or $42/year) adds advanced deduplication, a mobile-friendly UI, and face tagging.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Does PhotoStructure require a subscription to keep my photos?$q$, $q$No. PhotoStructure does not hold your library hostage — Lite access to your library remains free even without a Plus subscription.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Is there a free trial for Plus?$q$, $q$Yes, Plus offers a 15-day free trial and does not require a credit card.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$What platforms does PhotoStructure support?$q$, $q$Windows, macOS, Linux, and Docker.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Is PhotoStructure self-hosted?$q$, $q$Yes, it runs on user-controlled hardware and keeps files in their original formats and locations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Personal photo library organization$q$, $q$Automatically organize and deduplicate a large personal collection of photos and videos stored on your own hardware.$q$, $q$Individuals with large personal photo or video archives$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Privacy-conscious media management$q$, $q$Manage a photo library without cloud uploads, tracking, or analytics.$q$, $q$Privacy-focused users$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Lite$q$, $q$Free$q$, NULL, $q$["Cross-platform portable libraries","Automatic volume scanning","Automatic video transcoding","Keyword tagging","Community forum support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Plus (monthly)$q$, $q$$5/month$q$, $q$monthly$q$, $q$["All Lite features","Advanced de-duplication","Advanced metadata handling","Mobile-friendly UI","Automatic organization","Face tag extraction","Email and forum support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$Plus (annual)$q$, $q$$42/year$q$, $q$annual$q$, $q$["All Lite features","Advanced de-duplication","Advanced metadata handling","Mobile-friendly UI","Automatic organization","Face tag extraction","Email and forum support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$overview$q$, $q$What is PhotoStructure?$q$, 2, ARRAY[$q$PhotoStructure is a self-hosted personal digital asset manager that organizes photos and videos on the user's own hardware, offering automatic deduplication, organization, and browsing across an entire library.$q$, $q$It uses a free-forever Lite tier alongside a paid Plus plan that unlocks advanced deduplication, automatic organization, face tag extraction, and a mobile-friendly UI.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', $q$who-its-for$q$, $q$Who PhotoStructure is for$q$, 2, ARRAY[$q$PhotoStructure fits people who want to keep large personal photo and video collections on their own storage rather than in the cloud, with privacy-focused, non-proprietary file handling.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('738c4ff8-6bc1-45af-9978-423b14aba862', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Ente Photos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, end-to-end encrypted photo storage app with a free 10GB plan and paid storage tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2.49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ente Photos is an open-source, end-to-end encrypted photo app with a free 10GB plan and paid storage from $2.49/month.$q$,
  og_description = $q$Ente Photos is an open-source, end-to-end encrypted photo app with a free 10GB plan and paid storage from $2.49/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05877299-4a26-44db-aeaf-52ace933c3fc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05877299-4a26-44db-aeaf-52ace933c3fc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$End-to-end encryption$q$, $q$Photos and metadata, including face detection and search indices, are end-to-end encrypted.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$3x data replication$q$, $q$Stored data is replicated three times for redundancy.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$On-device face detection$q$, $q$Recognizes faces in photos to help organize a library.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Semantic search$q$, $q$Search photos by content rather than just filenames or tags.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Private sharing and collaborative albums$q$, $q$Share albums privately and collaborate with others.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Self-hosting$q$, $q$The full platform is open source and can be self-hosted on private infrastructure.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Cross-platform apps$q$, $q$Available on iOS, Android, Windows, macOS, Linux, and the web.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Family plan$q$, $q$Paid subscribers can add up to five additional members to share a storage plan.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Free 10GB storage plan available forever$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Fully open source (AGPL-3.0) with the option to self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$End-to-end encrypted, with audits by Cure53, Symbolic Software, and Fallible$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Available on iOS, Android, Windows, macOS, Linux, and web$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Family plan allows storage sharing among up to five additional members$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Paid subscription required for storage beyond the free 10GB$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Self-hosting requires technical setup and ongoing infrastructure management$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Is Ente Photos free?$q$, $q$Yes, Ente offers 10GB of free storage forever, with paid plans available for additional storage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Is Ente open source?$q$, $q$Yes, Ente is fully open source under the AGPL-3.0 license, and the entire platform can be self-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$What platforms does Ente Photos support?$q$, $q$iOS, Android, Windows, macOS, Linux, and web browsers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$How much do paid plans cost?$q$, $q$Paid plans start around $2.49/month (billed annually, ~$2.99/month billed monthly) for 50GB, up to about $19.99/month (billed annually, ~$23.99/month billed monthly) for 2TB.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Does Ente offer family sharing?$q$, $q$Yes, paid subscribers can add up to five additional members to share the storage on their plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Privacy-focused photo backup$q$, $q$Store and back up personal photo libraries with end-to-end encryption instead of using Google Photos or iCloud.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Self-hosted photo storage$q$, $q$Deploy the open-source Ente stack on private infrastructure for complete data control.$q$, $q$Technical users and organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Family photo sharing$q$, $q$Share encrypted storage and collaborative albums with family members under one paid plan.$q$, $q$Families$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$Free$q$, $q$Free$q$, NULL, $q$["10GB storage","End-to-end encryption","Available forever"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$50GB$q$, $q$$2.49/month (billed annually) or $2.99/month$q$, $q$monthly$q$, $q$["50GB storage","End-to-end encryption","Family sharing option"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$2TB$q$, $q$$19.99/month (billed annually) or $23.99/month$q$, $q$monthly$q$, $q$["2TB storage","End-to-end encryption","Family sharing option"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$overview$q$, $q$What is Ente Photos?$q$, 2, ARRAY[$q$Ente Photos is a fully open-source, end-to-end encrypted photo and video storage app, positioned as an alternative to Google Photos and Apple Photos.$q$, $q$It offers 10GB of free storage forever, with paid plans for additional storage, 3x data replication, face detection, semantic search, and private, collaborative sharing. The full platform can also be self-hosted.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', $q$who-its-for$q$, $q$Who Ente Photos is for$q$, 2, ARRAY[$q$Ente suits individuals and families who want an encrypted, privacy-respecting alternative to mainstream cloud photo services, as well as technical users who prefer to self-host an open-source stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05877299-4a26-44db-aeaf-52ace933c3fc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Jellyfin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Jellyfin is a free, open-source, self-hosted media server for streaming movies, TV, music, and photos.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2018,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jellyfin: a free, GPL-licensed, self-hosted media server for organizing and streaming your personal movie, TV, music, and photo library.$q$,
  og_description = $q$Jellyfin: a free, GPL-licensed, self-hosted media server for organizing and streaming your personal movie, TV, music, and photo library.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '07686163-d3fa-49ec-9a3d-0f4d2664089d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '07686163-d3fa-49ec-9a3d-0f4d2664089d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Self-hosted media server$q$, $q$Runs on your own hardware, giving you full control over your movie, TV, music, and photo library with no central servers collecting data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Live TV and DVR$q$, $q$Supports live TV tuning and DVR recording alongside on-demand personal media.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$SyncPlay$q$, $q$Allows synchronized playback so multiple users can watch the same content together remotely.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Books, comics, and photos$q$, $q$Manages additional media types beyond video and music, including books, comics, and photo collections.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Hardware-accelerated transcoding$q$, $q$Uses server GPU hardware acceleration to transcode media for playback on different devices.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Plugin extensibility$q$, $q$Supports community plugins to extend server functionality.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Broad client support$q$, $q$Official and third-party clients are available for web browsers, desktop, Android/Android TV, iOS/tvOS, Fire TV, Roku, and Kodi.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Completely free with no premium tiers, hidden costs, or paywalled features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Fully open source under the GPL-2.0 license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$No tracking or phone-home telemetry to central servers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Wide range of official and community clients across major platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Community-driven development with plugin extensibility$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Requires self-hosting; there is no managed/cloud-hosted option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Entirely volunteer-run, so support relies on community channels rather than a commercial help desk$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$As a fork of an older Emby release, some newer commercial-app polish found in paid competitors may be absent$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Is Jellyfin free?$q$, $q$Yes. Jellyfin states its server and official clients are free to download, now and always, with no hidden costs and no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Is Jellyfin open source?$q$, $q$Yes, Jellyfin is licensed under the GNU GPL-2.0 and developed entirely by volunteers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Do I need my own hardware to run Jellyfin?$q$, $q$Yes, Jellyfin operates exclusively as self-hosted software that you run on your own server or device.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Where did Jellyfin come from?$q$, $q$Jellyfin began in December 2018 as a fork of Emby's 3.5.2 release, started after Emby moved its next release to a closed-source, proprietary model.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$What kinds of media can Jellyfin manage?$q$, $q$Jellyfin supports movies, TV shows, music, live TV with DVR, books, comics, and photos.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Home media streaming$q$, $q$Organize and stream a personal collection of movies, TV shows, and music to any device on or off the home network.$q$, $q$Home users with existing media libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Privacy-focused self-hosting$q$, $q$Run a media server with no central servers or tracking, keeping full control of data and infrastructure.$q$, $q$Privacy-conscious self-hosters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Cost-free alternative to paid media servers$q$, $q$Get media-server functionality comparable to commercial products without subscription costs.$q$, $q$Users seeking a free alternative to Emby or Plex$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$Jellyfin$q$, $q$Free$q$, NULL, $q$["Server and official clients free to download and use","No hidden costs or paid tiers","Live TV/DVR, SyncPlay, plugin support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$overview$q$, $q$What is Jellyfin?$q$, 2, ARRAY[$q$Jellyfin is a free, open-source media system that lets users collect, organize, and stream their personal media libraries from a self-hosted server.$q$, $q$The project is licensed under the GNU GPL-2.0 and is developed entirely by volunteers, with no central servers collecting user data and no premium licenses or paid tiers.$q$, $q$Jellyfin began in December 2018 as a fork of Emby's 3.5.2 release, created after Emby announced its next major release would become closed-source.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', $q$who-its-for$q$, $q$Who Jellyfin is for$q$, 2, ARRAY[$q$Jellyfin suits home users and self-hosters who want to manage and stream movies, TV, music, live TV, books, comics, and photos from their own hardware without paying subscription or license fees.$q$, $q$It is also aimed at privacy-conscious users who prefer an open-source alternative to commercial media server products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07686163-d3fa-49ec-9a3d-0f4d2664089d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Emby ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Emby is a self-hosted personal media server with a free core tier and a paid Emby Premiere subscription for extra features.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$4.99/month$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Emby is a self-hosted media server for movies, TV, music, and photos, with a free tier and paid Emby Premiere plans from $4.99/month.$q$,
  og_description = $q$Emby is a self-hosted media server for movies, TV, music, and photos, with a free tier and paid Emby Premiere plans from $4.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '243b00aa-9aa3-4490-8b1b-0156281eda01';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '243b00aa-9aa3-4490-8b1b-0156281eda01' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Emby Connect$q$, $q$Enables remote access to your media server without manual IP address configuration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Live TV and DVR$q$, $q$Supports live TV streaming and DVR recording management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Parental controls$q$, $q$Offers access scheduling and time limits for managing content availability to users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Automatic format conversion$q$, $q$Automatically converts and streams media on-the-fly to play on different devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$DLNA support$q$, $q$Detects DLNA devices for content streaming and remote control.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Hardware-accelerated transcoding (Premiere)$q$, $q$Uses server GPU hardware acceleration to transcode video, available with Emby Premiere.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Offline downloads (Premiere)$q$, $q$Allows downloading media to smartphones and tablets for offline playback with Emby Premiere.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Cloud and folder sync (Premiere)$q$, $q$Emby Premiere adds cloud sync and folder sync to external drives, plus server backup and restore.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Free core tier provides functional personal media server capabilities$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Broad platform support across TVs, mobile, and computers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Emby Premiere lifetime option available as a one-time purchase instead of a subscription$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Includes CarPlay, Android Auto, and smart-home voice control integration with Premiere$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Live TV and DVR support built in$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Many advanced features (offline downloads, DVR, hardware transcoding, full app access) require the paid Emby Premiere tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Requires self-hosting your own server rather than a fully managed cloud service$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Premiere licensing is limited to single-household use with a 30-device cap$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Is Emby free?$q$, $q$Emby offers a free tier with core media server functionality; Emby Premiere is a separate paid subscription that adds extra features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$How much does Emby Premiere cost?$q$, $q$Emby Premiere costs $4.99 per month, $54 for one year, or $119 as a one-time lifetime purchase.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$What does Emby Premiere add?$q$, $q$Premiere adds offline downloads, Emby DVR, full app access on Android/Fire TV/iOS/Xbox One/PS4, hardware-accelerated transcoding, Cinema Intros, CarPlay/Android Auto integration, cover art customization, and backup/restore.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Is Emby self-hosted?$q$, $q$Yes. Users install Emby Server on their own system and connect to it through companion apps on other devices.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$What platforms does Emby support?$q$, $q$Emby supports Android TV, Apple TV, Google TV, Fire TV, Roku, LG, Samsung TVs, Android, iOS, Android Auto, Apple CarPlay, Windows, macOS, Linux, and web browsers.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Home media library streaming$q$, $q$Centralize home videos, music, and photos into one library accessible across devices.$q$, $q$Home users with personal media collections$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Live TV and DVR at home$q$, $q$Stream and record live TV content through a self-hosted server.$q$, $q$Users who want DVR functionality via Emby Premiere$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Offline media on mobile$q$, $q$Download media to phones and tablets for offline viewing using Emby Premiere.$q$, $q$Mobile users needing offline access$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Emby (Free)$q$, $q$$0$q$, NULL, $q$["Core media server functionality","Emby Connect remote access","Live TV streaming"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Emby Premiere Monthly$q$, $q$$4.99$q$, $q$monthly$q$, $q$["Offline downloads","Emby DVR","Hardware-accelerated transcoding","Full app access","Cover art plugin","Backup/restore"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Emby Premiere Annual$q$, $q$$54$q$, $q$annual$q$, $q$["Same features as monthly Premiere, billed yearly"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$Emby Premiere Lifetime$q$, $q$$119$q$, NULL, $q$["One-time payment for lifetime Premiere access","Single household use, 30-device limit"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$overview$q$, $q$What is Emby?$q$, 2, ARRAY[$q$Emby is a personal media management platform that automatically converts and streams media to play on virtually any device, centralizing home videos, music, and photos into a single library.$q$, $q$Emby follows a freemium model: a free tier covers core functionality, while the paid Emby Premiere subscription unlocks additional features such as offline downloads, DVR, hardware-accelerated transcoding, and expanded app access.$q$, $q$Emby operates on a self-hosted server architecture, where users install Emby Server locally and access their library through companion apps.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', $q$who-its-for$q$, $q$Who Emby is for$q$, 2, ARRAY[$q$Emby suits users who want a self-hosted personal media server with the option to unlock extra features like DVR, offline downloads, and hardware transcoding through a paid subscription or one-time lifetime purchase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('243b00aa-9aa3-4490-8b1b-0156281eda01', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Plex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Plex is a self-hosted personal media server with a free tier and a paid Plex Pass subscription for advanced features.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6.99/month$q$,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Plex is a personal media server for streaming movies, TV, and music, with a free tier and paid Plex Pass plans starting at $6.99/month.$q$,
  og_description = $q$Plex is a personal media server for streaming movies, TV, and music, with a free tier and paid Plex Pass plans starting at $6.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Remote streaming$q$, $q$Stream your personal media library remotely, available to all users including on the free tier.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Hardware-accelerated transcoding (Plex Pass)$q$, $q$Uses dedicated video decoder/encoder hardware to transcode and stream HD or 4K video more smoothly to multiple devices at once.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Advanced parental controls (Plex Pass)$q$, $q$Lets server owners create customized restriction settings based on content ratings or custom labels for family and friends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Skip Intro and Skip Credits (Plex Pass)$q$, $q$Automatically skips intros and end credits during playback.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Downloads (Plex Pass)$q$, $q$Allows downloading media for offline playback.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex DVR (Plex Pass)$q$, $q$Enables live TV recording through Plex DVR functionality.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Free tier includes remote streaming of a personal media library$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex Pass adds hardware transcoding, advanced parental controls, downloads, and DVR$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Multiple Plex Pass billing options including monthly, annual, five-year, and lifetime$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Existing lifetime Plex Pass holders keep their benefits even after price changes$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Many advanced features (hardware transcoding, parental controls, downloads, DVR) require a paid Plex Pass subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Lifetime Plex Pass price rose to $749.99 starting July 1, 2026, up from its prior price$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Requires self-hosting your own Plex Media Server$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Is Plex free?$q$, $q$Plex offers a free tier that includes remote streaming of your personal media library; Plex Pass is a paid subscription that unlocks additional premium features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$How much does Plex Pass cost?$q$, $q$Plex Pass costs $6.99 per month, $69.99 per year, $249.99 for a five-year plan, or $749.99 as a one-time lifetime purchase (lifetime pricing effective July 1, 2026).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$What does Plex Pass include?$q$, $q$Plex Pass adds hardware-accelerated transcoding, advanced parental controls, downloads for offline playback, Skip Intro and Skip Credits, and Plex DVR.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Did Plex Pass pricing recently change?$q$, $q$Yes. The lifetime Plex Pass price increased to $749.99 starting July 1, 2026, while monthly and annual subscription pricing remained unchanged, and a new five-year plan was introduced at $249.99.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Is Plex self-hosted?$q$, $q$Yes, Plex requires running your own Plex Media Server to host and stream your personal media library.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Home media streaming$q$, $q$Stream a personal library of movies, TV shows, and music remotely to devices on or off the home network.$q$, $q$Home users with personal media collections$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Live TV recording$q$, $q$Record and manage live TV through Plex DVR with a Plex Pass subscription.$q$, $q$Plex Pass subscribers wanting DVR functionality$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Offline media access$q$, $q$Download media for offline playback using Plex Pass.$q$, $q$Mobile users needing offline access$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex (Free)$q$, $q$$0$q$, NULL, $q$["Remote streaming of personal media library"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex Pass Monthly$q$, $q$$6.99$q$, $q$monthly$q$, $q$["Hardware-accelerated transcoding","Advanced parental controls","Downloads","Skip Intro & Credits","Plex DVR"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex Pass Annual$q$, $q$$69.99$q$, $q$annual$q$, $q$["Same features as monthly Plex Pass, billed yearly"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex Pass 5-Year$q$, $q$$249.99$q$, NULL, $q$["Plex Pass features for a five-year term"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$Plex Pass Lifetime$q$, $q$$749.99$q$, NULL, $q$["One-time payment for lifetime Plex Pass access","Effective pricing as of July 1, 2026"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$overview$q$, $q$What is Plex?$q$, 2, ARRAY[$q$Plex is a personal media server platform that lets users organize and stream their movies, TV shows, and music from a self-hosted server to devices on or off their home network.$q$, $q$Plex follows a freemium model: the free tier includes remote streaming, while the paid Plex Pass subscription unlocks features such as hardware-accelerated transcoding, advanced parental controls, downloads, Skip Intro and Credits, and Plex DVR.$q$, $q$Plex Pass is available as a monthly, annual, five-year, or one-time lifetime purchase, with lifetime pricing set at $749.99 as of July 1, 2026.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', $q$who-its-for$q$, $q$Who Plex is for$q$, 2, ARRAY[$q$Plex suits users who want a self-hosted personal media server with an easy remote-streaming free tier, and the option to upgrade to Plex Pass for hardware transcoding, DVR, parental controls, and offline downloads.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b7ba79dd-5c0b-4a49-8fbc-28ce57af66f6', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Navidrome ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted music server that streams your personal music library from anywhere via a web app or Subsonic-compatible clients.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Navidrome is a free, open-source self-hosted music server with a web player, mobile app support, and Subsonic API compatibility.$q$,
  og_description = $q$Navidrome is a free, open-source self-hosted music server with a web player, mobile app support, and Subsonic API compatibility.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c85b0c6f-553d-4885-a67e-33c9297d3634';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c85b0c6f-553d-4885-a67e-33c9297d3634' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Subsonic/OpenSubsonic API compatibility$q$, $q$Works with Subsonic, Madsonic, Airsonic, and other OpenSubsonic-compatible client apps on mobile and desktop.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Large library support$q$, $q$Handles very large music collections, tested with libraries of approximately 900,000 songs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$On-the-fly transcoding$q$, $q$Transcodes audio in real time, including Opus encoding, to reduce bandwidth and data usage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Multi-user and multi-library$q$, $q$Supports multiple users with individual play counts, playlists, and favorites, plus multiple libraries with user-specific access controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Smart playlists$q$, $q$Generates dynamic, rule-based playlists similar to iTunes smart playlists.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Scrobbling integration$q$, $q$Integrates with Last.fm, ListenBrainz, and Maloja for scrobbling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Automatic library monitoring$q$, $q$Detects changes to the music folder and updates the library automatically.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Lightweight footprint$q$, $q$Runs on resource-limited hardware such as Raspberry Pi Zero and old hardware setups.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Completely free and open source under the GPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Runs on minimal hardware, including Raspberry Pi$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Scales to very large music libraries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Broad client compatibility via the Subsonic/OpenSubsonic API$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Translated into 34 languages$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Requires self-hosting and basic server/Docker administration knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$No official managed cloud hosting from the Navidrome project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Relies on third-party Subsonic-compatible apps for mobile playback rather than a first-party official app for every platform$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Is Navidrome free to use?$q$, $q$Yes, Navidrome is distributed free of charge under the GNU GPL v3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$What platforms does Navidrome run on?$q$, $q$Navidrome runs on macOS, Linux, and Windows, with official Docker images and Raspberry Pi binaries.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$What client apps work with Navidrome?$q$, $q$Navidrome supports a large selection of mobile and desktop clients through its Subsonic/OpenSubsonic API compatibility, including Subsonic, Madsonic, and Airsonic clients.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$How large a music library can Navidrome handle?$q$, $q$Navidrome has been tested with libraries of approximately 900,000 songs.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Does Navidrome support multiple users?$q$, $q$Yes, Navidrome supports multiple users, each with their own play counts, playlists, and favorites, and library-level access controls.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Personal music streaming$q$, $q$Self-host a private streaming service to access a personal music collection from anywhere, similar to commercial streaming apps.$q$, $q$Individuals with large personal music libraries$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Home server / NAS music hosting$q$, $q$Run Navidrome via Docker on low-power hardware like a Raspberry Pi or home NAS to serve music to household devices.$q$, $q$Home server and self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$Multi-user family music library$q$, $q$Share one music collection among multiple family members, each with separate accounts, playlists, and play history.$q$, $q$Households sharing a single music archive$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$overview$q$, $q$What is Navidrome?$q$, 2, ARRAY[$q$Navidrome is an open-source, self-hosted music collection server and streamer that lets users access their own music library from anywhere through a modern web interface and Subsonic-compatible mobile apps.$q$, $q$It is distributed free of charge under the GNU GPL v3 license, is lightweight enough to run on hardware such as a Raspberry Pi, and has been tested with libraries of roughly 900,000 songs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', $q$who-its-for$q$, $q$Who Navidrome is for$q$, 2, ARRAY[$q$Navidrome is built for people who own large personal music collections and want a Spotify-like streaming experience for their own files, without relying on a commercial streaming service.$q$, $q$It suits self-hosters and home server users comfortable running Docker or native binaries on Linux, macOS, Windows, or a Raspberry Pi, and who want multi-user support with Subsonic/OpenSubsonic API client compatibility.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c85b0c6f-553d-4885-a67e-33c9297d3634', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ampache ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted web application for streaming your own music and video library from any device.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Ampache is a free, open-source AGPL-3.0 web app for streaming and managing your personal music and video collection.$q$,
  og_description = $q$Ampache is a free, open-source AGPL-3.0 web app for streaming and managing your personal music and video collection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e99d3f06-f0d5-4075-94ed-49469f876517';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e99d3f06-f0d5-4075-94ed-49469f876517' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Web-based streaming$q$, $q$Stream your personal music and video library from a browser or the built-in HTML5 web player.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Catalog management$q$, $q$Browse, organize, and synchronize your media catalog with metadata pulled from embedded tags and filenames.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Multi-client support$q$, $q$Connect from phones, tablets, and televisions using a range of compatible third-party client apps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$API access$q$, $q$Documented API with examples lets developers build custom clients and integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Localplay control$q$, $q$Control playback on remote audio output devices directly from the Ampache interface.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Docker deployment$q$, $q$Officially supported Docker images make self-hosting straightforward.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Completely free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Actively maintained project with a long history dating back to 2001$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Supports both music and video streaming from a single install$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Broad third-party client app ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Full control over your data via self-hosting$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Requires self-hosting and basic server administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$No official managed/cloud hosting option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Web interface design is less polished than commercial streaming apps$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Setup and catalog configuration can be technical for non-developers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Is Ampache free to use?$q$, $q$Yes, Ampache is completely free and open source, licensed under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Do I need to host Ampache myself?$q$, $q$Yes, Ampache is a self-hosted application; you deploy it on your own server or via Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Can Ampache stream video as well as music?$q$, $q$Yes, Ampache is a combined audio/video streaming application and file manager.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$What mobile or desktop apps work with Ampache?$q$, $q$Ampache supports a range of third-party client applications for phones, tablets, and televisions that connect via its API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Personal music streaming server$q$, $q$Host your own music library and stream it from anywhere without relying on a commercial service.$q$, $q$Self-hosters and home lab enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$Family media server$q$, $q$Share a household's combined music and video collection across multiple devices and users.$q$, $q$Families and small households$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$overview$q$, $q$What is Ampache?$q$, 2, ARRAY[$q$Ampache is a free and open-source web application for streaming and managing personal audio and video collections. First released in 2001, it lets users access their own media library from a browser or a range of compatible client apps on phones, tablets, and televisions.$q$, $q$The project is licensed under AGPL-3.0 and is deployed by self-hosting on a personal server or via Docker, giving users full control over their catalog and data rather than relying on a third-party streaming service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', $q$who-its-for$q$, $q$Who Ampache is for$q$, 2, ARRAY[$q$Ampache suits self-hosters and home lab users who already have a personal music or video collection and want a self-controlled way to stream it to their own devices, rather than uploading their media to a commercial cloud platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e99d3f06-f0d5-4075-94ed-49469f876517', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Funkwhale ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Decentralized, federated open-source platform for self-hosting and sharing music and podcasts across independent servers ('pods').$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Funkwhale is a free, open-source federated audio platform for self-hosting your own music and podcast server, or 'pod'.$q$,
  og_description = $q$Funkwhale is a free, open-source federated audio platform for self-hosting your own music and podcast server, or 'pod'.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '11a3e46c-83db-4586-a93d-d93fad3ce9d6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '11a3e46c-83db-4586-a93d-d93fad3ce9d6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Self-hosted pods$q$, $q$Run your own independent Funkwhale instance, called a pod, to host and stream your personal audio collection.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Federation across servers$q$, $q$Pods federate with one another so users on different servers can discover and share content without a central authority.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Podcast support$q$, $q$Subscribe to and manage podcasts alongside your music library within the same platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Playlist and library sharing$q$, $q$Share playlists, albums, or portions of your library with other users or the public.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Channels$q$, $q$Create channels for original music or podcasts and notify followers of new releases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Subsonic-compatible API$q$, $q$Connect existing Subsonic-compatible apps and podcast clients to a Funkwhale pod.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$No tracking or ads$q$, $q$The platform states it uses no third-party analytics, tracking, or advertising.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Free, open-source, and community-developed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Decentralized/federated architecture avoids single-company control$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$No ads or third-party tracking$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Compatible with existing Subsonic clients and podcast apps$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Supports both music and podcasts in one platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Self-hosting a pod requires system administration skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$No official first-party managed hosting; paid hosting is offered only by third parties$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Federation and moderation depend on individual pod administrators$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$What is a Funkwhale 'pod'?$q$, $q$A pod is an individual, self-hosted instance of Funkwhale. Pods can federate with each other so users can discover and share content across servers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Is Funkwhale free?$q$, $q$Yes, Funkwhale is free, open-source software. Third-party providers such as Weingärtner IT and Cloud68 offer paid hosted pods if you don't want to self-host.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Does Funkwhale support podcasts?$q$, $q$Yes, in addition to music, Funkwhale supports podcast subscriptions and playback.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Can I use existing apps with Funkwhale?$q$, $q$Yes, Funkwhale works with Subsonic-compatible apps and podcast apps via its API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Self-hosted music community$q$, $q$Run a pod for a group of friends or a community to share and discover music together.$q$, $q$Self-hosters and online communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$Independent artist distribution$q$, $q$Use channels to publish original music or podcast episodes directly to followers without a centralized platform.$q$, $q$Independent musicians and podcasters$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$overview$q$, $q$What is Funkwhale?$q$, 2, ARRAY[$q$Funkwhale is a free, open-source platform for hosting and sharing music and podcasts. Rather than a single centralized service, Funkwhale is deployed as independent, self-hosted instances called pods, which can federate with one another so users on different pods can share and discover content.$q$, $q$The platform emphasizes no third-party analytics, no tracking, and no ads, and is compatible with existing Subsonic clients and podcast apps through its API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', $q$who-its-for$q$, $q$Who Funkwhale is for$q$, 2, ARRAY[$q$Funkwhale is aimed at self-hosters and communities who want an independent, ad-free alternative to centralized streaming services and are comfortable running and administering their own server, or who use a third-party hosted pod.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('11a3e46c-83db-4586-a93d-d93fad3ce9d6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Koel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted personal music streaming server with native iOS/Android apps and an optional paid Plus tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€19.99 one-time (Koel Plus)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Koel is a self-hosted, open-source music streaming server (MIT license) with a free Community edition and paid Koel Plus tier.$q$,
  og_description = $q$Koel is a self-hosted, open-source music streaming server (MIT license) with a free Community edition and paid Koel Plus tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '237520e2-d5af-4e71-b585-63b5af2e41f1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '237520e2-d5af-4e71-b585-63b5af2e41f1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Lossless streaming$q$, $q$Stream your music collection with transparent, lossless audio support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Cross-device sync$q$, $q$Keep playback and favorites synchronized as you move between devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Smart playlists and favorites$q$, $q$Build dynamic smart playlists and mark tracks as favorites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Metadata integrations$q$, $q$Pull additional artist and track information from MusicBrainz, Wikipedia, Last.fm, Spotify, and YouTube.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Subsonic/OpenSubsonic API$q$, $q$Connect existing Subsonic and OpenSubsonic-compatible apps to a Koel server.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Native mobile apps$q$, $q$Dedicated iOS and Android apps are available via the App Store and Google Play.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Koel Plus$q$, $q$Paid tier adds multi-user support with individual libraries, extended storage drivers (S3, Nextcloud, ownCloud, Dropbox), collaboration, and white-labeling.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Community edition is free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Koel Plus is a one-time purchase, not a subscription$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Native iOS and Android apps included$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Compatible with Subsonic and OpenSubsonic clients$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Rich metadata integrations (MusicBrainz, Last.fm, Spotify, YouTube)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Multi-user support and extended storage backends require the paid Plus tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Requires self-hosting and server administration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$No official managed/cloud hosting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Is Koel free?$q$, $q$The Community version of Koel is free and open source (MIT license) and will always remain so.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$What does Koel Plus cost?$q$, $q$Koel Plus is a pay-what-you-want, one-time purchase starting at €19.99, with no subscription or recurring fees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$What extra features does Koel Plus add?$q$, $q$Koel Plus adds multi-user support with individual libraries, extended storage drivers like S3 and Nextcloud, collaboration features, and white-labeling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Does Koel have mobile apps?$q$, $q$Yes, Koel has native apps for iOS (App Store) and Android (Google Play).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Personal music server$q$, $q$Self-host your own music collection and stream it to any device with lossless audio support.$q$, $q$Individual self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Multi-user household streaming$q$, $q$Use Koel Plus to give multiple users their own libraries on a shared server.$q$, $q$Families and small teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Community$q$, $q$Free$q$, NULL, $q$["Lossless streaming","Favorites and smart playlists","Subsonic/OpenSubsonic API","Native iOS/Android apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$Koel Plus$q$, $q$From €19.99 one-time$q$, NULL, $q$["Multi-user support with individual libraries","Extended storage drivers (S3, Nextcloud, ownCloud, Dropbox)","Collaboration features","White-labeling","All future updates included"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$overview$q$, $q$What is Koel?$q$, 2, ARRAY[$q$Koel is a self-hosted, open-source music streaming server licensed under the MIT license. Its free Community edition provides lossless streaming, smart playlists, and Subsonic/OpenSubsonic API compatibility, along with native iOS and Android apps.$q$, $q$Koel Plus is an optional, pay-what-you-want one-time purchase starting at €19.99 that unlocks multi-user support with individual libraries, extended storage backends such as S3 and Nextcloud, collaboration, and white-labeling — with no subscription required.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', $q$who-its-for$q$, $q$Who Koel is for$q$, 2, ARRAY[$q$Koel fits self-hosters who want a modern, lossless music streaming experience for their own library, and households or small teams that need multi-user support without committing to a recurring subscription.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('237520e2-d5af-4e71-b585-63b5af2e41f1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Audiobookshelf ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source self-hosted server for organizing and streaming your personal audiobook and podcast collection.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Audiobookshelf is a free, open-source (GPL-3.0) self-hosted server for streaming your own audiobooks and podcasts.$q$,
  og_description = $q$Audiobookshelf is a free, open-source (GPL-3.0) self-hosted server for streaming your own audiobooks and podcasts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '91c8ca77-c1ba-44d8-a9ad-145ee1a697f5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Audiobook streaming$q$, $q$Stream audiobooks across multiple formats with on-the-fly conversion for playback.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Podcast management$q$, $q$Discover, subscribe to, and automatically download new podcast episodes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Multi-user accounts$q$, $q$Create multiple user accounts with customizable permissions and per-user listening progress sync.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Metadata and cover art fetching$q$, $q$Automatically fetch metadata and cover art for audiobooks from external sources, with chapter editing support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Basic ebook support$q$, $q$Serve and read ebooks in EPUB, PDF, CBR, and CBZ formats alongside audio content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Progressive Web App$q$, $q$Access the library as a PWA with Chromecast support for casting playback to TVs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$RSS feed generation$q$, $q$Generate RSS feeds for audiobooks and podcasts for use in third-party apps.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Completely free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Native iOS and Android apps in addition to the web/PWA interface$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Handles both audiobooks and podcasts in one server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Active project with a large GitHub community (13.6k+ stars)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Automated metadata fetching and daily backups$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Requires self-hosting and Docker/server setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$iOS app has historically been limited by TestFlight beta capacity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$No official managed/cloud hosting option$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Ebook support is described as basic rather than full-featured$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Is Audiobookshelf free?$q$, $q$Yes, Audiobookshelf is free and open source, licensed under GPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Does Audiobookshelf support podcasts as well as audiobooks?$q$, $q$Yes, it manages both audiobook and podcast libraries, including automatic podcast episode downloads.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Is there a mobile app?$q$, $q$Yes, Audiobookshelf has native iOS and Android apps, plus a Progressive Web App with Chromecast support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$How do I install Audiobookshelf?$q$, $q$Audiobookshelf is self-hosted and officially supports Docker deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Personal audiobook library$q$, $q$Self-host and stream a personal collection of audiobooks with progress tracking across devices.$q$, $q$Audiobook collectors and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$Podcast archiving and playback$q$, $q$Subscribe to and automatically download podcasts to a personal, ad-free server.$q$, $q$Podcast listeners who prefer self-hosted tools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$overview$q$, $q$What is Audiobookshelf?$q$, 2, ARRAY[$q$Audiobookshelf is a free, open-source self-hosted server for organizing and streaming personal audiobook and podcast collections, licensed under GPL-3.0 and built on Node.js.$q$, $q$It supports multi-user accounts with progress syncing, automatic metadata and cover art fetching, podcast subscriptions with automated downloads, and basic ebook support for EPUB, PDF, CBR, and CBZ files. Native iOS and Android apps complement the web-based Progressive Web App.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', $q$who-its-for$q$, $q$Who Audiobookshelf is for$q$, 2, ARRAY[$q$Audiobookshelf is built for self-hosters who own audiobook and podcast files and want a private, ad-free way to stream and track progress across devices without relying on a commercial subscription service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('91c8ca77-c1ba-44d8-a9ad-145ee1a697f5', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── PeerTube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, federated video hosting platform developed by Framasoft, using peer-to-peer delivery and ActivityPub federation.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$PeerTube is a free, open-source (AGPL-3.0) decentralized video platform developed by Framasoft, using P2P and ActivityPub federation.$q$,
  og_description = $q$PeerTube is a free, open-source (AGPL-3.0) decentralized video platform developed by Framasoft, using P2P and ActivityPub federation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '43fecc1e-117b-4ec8-ae44-12dc137692b9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '43fecc1e-117b-4ec8-ae44-12dc137692b9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Federated video hosting$q$, $q$Independent PeerTube instances federate via ActivityPub, connecting into one larger network.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Peer-to-peer delivery$q$, $q$Uses WebRTC-based P2P video broadcasting in the browser to reduce server bandwidth load.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Live streaming$q$, $q$Supports live streaming via RTMP along with built-in video editing capabilities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Mobile apps$q$, $q$Official apps are available for iOS, Android, and F-Droid for discovering and managing content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$No ads or tracking$q$, $q$The platform states it carries no advertising and does not track users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Algorithm-free browsing$q$, $q$Content discovery avoids recommendation algorithms, with transparent, auditable open-source code.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$No cost to install and run on your own server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Federated network already spans roughly 1,600 platforms and 1 million videos$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Developed by Framasoft, a non-profit funded mostly by donations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$P2P delivery reduces bandwidth costs for instance operators$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Requires self-hosting and server administration to run an instance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$No official first-party managed/cloud hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Content discovery and moderation depend on which instance(s) you join or federate with$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Is PeerTube free?$q$, $q$Yes, PeerTube is free and open source; there is no cost to install it on your own server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Who develops PeerTube?$q$, $q$PeerTube is developed by Framasoft, a French non-profit organization funded primarily by donations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$What is instance federation?$q$, $q$PeerTube instances can federate with one another via ActivityPub, letting videos and channels be followed and discovered across independently run servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Does PeerTube support live streaming?$q$, $q$Yes, PeerTube supports live streaming via RTMP.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Independent video platform$q$, $q$Organizations or communities run their own PeerTube instance instead of relying on centralized video platforms.$q$, $q$Organizations, communities, and non-profits$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$Creator channel with federation$q$, $q$Creators publish videos on an instance and reach viewers across the federated PeerTube network via ActivityPub.$q$, $q$Independent video creators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$overview$q$, $q$What is PeerTube?$q$, 2, ARRAY[$q$PeerTube is a free, open-source, decentralized video platform developed by Framasoft, a French non-profit, as an alternative to centralized services like YouTube, Dailymotion, or Vimeo. It is licensed under AGPL-3.0.$q$, $q$Independent PeerTube instances federate with one another through ActivityPub, forming a larger interconnected network — currently around 1,600 platforms hosting roughly 1 million videos — while using WebRTC-based peer-to-peer delivery to reduce server load.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', $q$who-its-for$q$, $q$Who PeerTube is for$q$, 2, ARRAY[$q$PeerTube suits organizations, communities, and creators who want to host and share video content without relying on centralized, ad-driven platforms, and who are willing to run or join a federated instance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('43fecc1e-117b-4ec8-ae44-12dc137692b9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Owncast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted live video streaming and chat server that works with existing broadcasting software.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Owncast is a free, open-source (MIT) self-hosted live streaming and chat server compatible with OBS and other broadcasting tools.$q$,
  og_description = $q$Owncast is a free, open-source (MIT) self-hosted live streaming and chat server compatible with OBS and other broadcasting tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a8c86fff-3023-43da-8e2f-7a64b9b6fba4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a8c86fff-3023-43da-8e2f-7a64b9b6fba4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Self-hosted live streaming$q$, $q$Run your own live video streaming server with full ownership over your content and community.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Built-in chat$q$, $q$Includes real-time viewer chat with support for custom emotes and chatbots.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Broadcasting software compatibility$q$, $q$Works with existing RTMP-based tools such as OBS, Streamlabs, and Restream by pointing them at your Owncast server.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Fediverse integration$q$, $q$Streams can be discovered and followed from Mastodon and other Fediverse services.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Web-based player and admin$q$, $q$Includes a web player for viewers and a web-based admin interface for managing the stream.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Works with popular existing broadcasting software like OBS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Fediverse integration extends reach beyond the streamer's own site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Strong GitHub community with 11.4k+ stars$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$No platform ads or algorithmic content control$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Requires self-hosting and Docker/server setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Single-user/single-stream design rather than a multi-channel platform$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$No official managed/cloud hosting option$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Is Owncast free?$q$, $q$Yes, Owncast is free and open source, licensed under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$What broadcasting software works with Owncast?$q$, $q$Owncast works with existing RTMP-based broadcasting tools such as OBS, Streamlabs, and Restream.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Does Owncast include chat?$q$, $q$Yes, Owncast has built-in chat with support for custom emotes and chatbots.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Can Owncast streams reach Mastodon users?$q$, $q$Yes, Owncast integrates with the Fediverse so streams can be discovered from Mastodon and similar services.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Independent live streaming$q$, $q$Stream live video from your own server instead of a centralized platform, using tools you already use like OBS.$q$, $q$Independent streamers and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$Community-owned streaming with chat$q$, $q$Host live streams with built-in chat for a community without relying on third-party platform moderation or algorithms.$q$, $q$Communities and creators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$overview$q$, $q$What is Owncast?$q$, 2, ARRAY[$q$Owncast is a free and open-source, self-hosted live video streaming and web chat server, licensed under the MIT license. It is designed to work with existing broadcasting software — users point tools like OBS at their Owncast server instead of a centralized platform.$q$, $q$The server includes a built-in chat with custom emotes and chatbot support, plus Fediverse integration so streams can be discovered and followed from Mastodon and other Fediverse services.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', $q$who-its-for$q$, $q$Who Owncast is for$q$, 2, ARRAY[$q$Owncast is for independent streamers and self-hosters who want full ownership of their live streaming and chat experience, using broadcasting tools they already have, without going through a centralized commercial streaming platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8c86fff-3023-43da-8e2f-7a64b9b6fba4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── MediaCMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted video and media CMS with adaptive streaming, role-based access, and optional paid managed services.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2,000 one-time (deployment & training)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$MediaCMS is a free, open-source (AGPL-3.0) video and media CMS with paid deployment, training, and managed-service options.$q$,
  og_description = $q$MediaCMS is a free, open-source (AGPL-3.0) video and media CMS with paid deployment, training, and managed-service options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1761a911-bf5b-44d8-a1a3-2fca40562b85';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1761a911-bf5b-44d8-a1a3-2fca40562b85' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Multi-format media support$q$, $q$Handles video, audio, PDF, and image files within a single media management platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Adaptive video streaming$q$, $q$Delivers video via HLS adaptive streaming with an intuitive player, captions, and chapters.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Automatic transcription$q$, $q$Includes integrated Whisper-based automatic transcription for video and audio content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Role-based access control$q$, $q$Manage users, categories, and groups with custom permissions and public, unlisted, or private workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Video trimming and chapters$q$, $q$Built-in tools for trimming video and creating chapter markers directly in the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$LTI and Moodle integration$q$, $q$Supports LTI 1.3 and a Moodle plugin for use in educational settings.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$REST API$q$, $q$Provides a documented REST API with Swagger documentation for integrations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Core platform is free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Self-hosted with full control over data and infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Supports multiple media types (video, audio, image, PDF) in one CMS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Built-in automatic transcription and adaptive streaming$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Used by universities and organizations like Critical Commons$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Advanced deployment, training, and ongoing managed services require paid plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Self-hosting requires Docker/server administration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Managed services pricing ($2,000/month) may be significant for small teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Is MediaCMS free?$q$, $q$The core MediaCMS software is free and open source under AGPL-3.0. Paid deployment, training, and managed services are available separately.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$What does MediaCMS's managed service cost?$q$, $q$MediaCMS offers one-time deployment and training for $2,000 and ongoing managed services for $2,000/month, per the official site.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Can MediaCMS handle files besides video?$q$, $q$Yes, MediaCMS supports video, audio, image, and PDF files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Does MediaCMS support automatic captions?$q$, $q$Yes, it includes integrated Whisper-based automatic transcription.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$University or education media portal$q$, $q$Host lecture videos and course media with LTI 1.3 and Moodle integration for learning platforms.$q$, $q$Universities and educational institutions$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Self-hosted video/media portal$q$, $q$Run a private or public video and media portal with full control over hosting and access permissions.$q$, $q$Organizations needing a self-hosted media CMS$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Self-hosted (open source)$q$, $q$Free$q$, NULL, $q$["Full MediaCMS software","Self-host on your own infrastructure","REST API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Deployment & Training$q$, $q$$2,000 one-time$q$, NULL, $q$["Deployment assistance","Training"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$Managed Services$q$, $q$$2,000/month$q$, $q$monthly$q$, $q$["Ongoing managed hosting/support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$overview$q$, $q$What is MediaCMS?$q$, 2, ARRAY[$q$MediaCMS is a free, open-source video and media CMS, licensed under AGPL-3.0 and built with Django, Python, Celery, and React. It supports video, audio, image, and PDF content with adaptive HLS streaming, automatic Whisper-based transcription, and role-based access control.$q$, $q$Beyond the free self-hosted software, MediaCMS's operators offer paid deployment and training ($2,000 one-time) and ongoing managed services ($2,000/month) for organizations that don't want to self-manage their instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', $q$who-its-for$q$, $q$Who MediaCMS is for$q$, 2, ARRAY[$q$MediaCMS is aimed at universities, educational institutions, and organizations that need a self-hosted video and media portal with access controls, and who may optionally pay for professional deployment or managed hosting services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1761a911-bf5b-44d8-a1a3-2fca40562b85', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Tube Archivist ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source self-hosted YouTube media server for archiving, indexing, and searching personal YouTube video collections.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Tube Archivist is a free, open-source (GPL-3.0) self-hosted server for archiving, indexing, and searching YouTube videos.$q$,
  og_description = $q$Tube Archivist is a free, open-source (GPL-3.0) self-hosted server for archiving, indexing, and searching YouTube videos.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd3725ed0-83b6-4344-b6e9-9cc03592d572';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd3725ed0-83b6-4344-b6e9-9cc03592d572' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Channel subscriptions$q$, $q$Subscribe to YouTube channels and automatically track new uploads.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Video downloading$q$, $q$Downloads videos using yt-dlp for offline archiving.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Full-text search and indexing$q$, $q$Indexes video metadata to make large collections searchable.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Web playback interface$q$, $q$Play downloaded videos directly through a web interface, with viewed/unviewed tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$SponsorBlock integration$q$, $q$Integrates with SponsorBlock to skip sponsored segments in downloaded videos.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Jellyfin and Plex integration$q$, $q$Connects with Jellyfin and Plex media servers for extended playback options.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Browser extension$q$, $q$Firefox and Chrome-based browser extension available for managing the archive.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Free and open source under GPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Solves the problem of searching large personal YouTube archives$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Integrates with existing media servers (Jellyfin, Plex)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$SponsorBlock and subtitle support built in$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Active project with 8.3k+ GitHub stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Requires self-hosting via Docker with meaningful RAM requirements (4GB recommended for larger installs)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$No official managed/cloud hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Depends on yt-dlp, which can be affected by upstream YouTube changes$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Is Tube Archivist free?$q$, $q$Yes, Tube Archivist is free and open source, licensed under GPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$How does Tube Archivist download videos?$q$, $q$It uses yt-dlp to download videos from subscribed YouTube channels.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Does Tube Archivist work with Plex or Jellyfin?$q$, $q$Yes, it integrates with both Jellyfin and Plex media servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$What are the system requirements?$q$, $q$Tube Archivist requires Docker, roughly 2GB RAM for testing setups, and 4GB or more for mid-to-large installations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Personal YouTube archive$q$, $q$Automatically download and index subscribed YouTube channels for offline, searchable access.$q$, $q$Self-hosters archiving YouTube content$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$Media server add-on$q$, $q$Feed a personal YouTube archive into an existing Jellyfin or Plex library.$q$, $q$Home media server operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$overview$q$, $q$What is Tube Archivist?$q$, 2, ARRAY[$q$Tube Archivist is a free, open-source, self-hosted YouTube media server, licensed under GPL-3.0. It lets users subscribe to YouTube channels, download videos with yt-dlp, and index them with metadata so large collections remain searchable.$q$, $q$The platform includes SponsorBlock integration, subtitle and comment archiving, and can connect with Jellyfin or Plex for extended media server functionality, along with a browser extension for managing the archive.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', $q$who-its-for$q$, $q$Who Tube Archivist is for$q$, 2, ARRAY[$q$Tube Archivist is built for self-hosters with large personal YouTube archives who need a searchable, indexed way to manage and play back downloaded videos, often alongside an existing Jellyfin or Plex setup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3725ed0-83b6-4344-b6e9-9cc03592d572', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── AzuraCast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, self-hosted web radio management suite with a turnkey installer for the full radio software stack.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$AzuraCast is a free, open-source (AGPL-3.0) self-hosted web radio management suite with built-in Icecast/Shoutcast support.$q$,
  og_description = $q$AzuraCast is a free, open-source (AGPL-3.0) self-hosted web radio management suite with built-in Icecast/Shoutcast support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'edcb26fc-e0a6-432b-a023-ba04a025a9de' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Turnkey radio stack installer$q$, $q$Installs and configures the full radio software stack, removing the need to set up each component manually.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Web-based station management$q$, $q$Manage one or more radio stations through a modern web app interface.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Icecast/Shoutcast streaming$q$, $q$Built-in support for Icecast and Shoutcast streaming servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Liquidsoap automation$q$, $q$Uses Liquidsoap for playlist automation and audio processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Docker deployment$q$, $q$Officially supported via Docker with sample Docker Compose files provided.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Free and open source under AGPL-3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Bundles the entire radio stack instead of requiring separate tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Active project with 3.9k+ GitHub stars and a Discord community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Comprehensive official documentation for installation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Volunteer-maintained with no paid tier required for full functionality$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Requires self-hosting and basic Linux/server administration$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$No official managed/cloud hosting offering$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Relies on donations for project funding rather than commercial revenue$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Is AzuraCast free?$q$, $q$Yes, AzuraCast is free and open source, licensed under AGPL-3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$What streaming servers does AzuraCast support?$q$, $q$AzuraCast includes built-in support for Icecast and Shoutcast.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$How is AzuraCast installed?$q$, $q$AzuraCast provides a turnkey installer and full Docker support with sample Docker Compose files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Does AzuraCast offer hosted/cloud radio hosting?$q$, $q$No official managed hosting is offered; AzuraCast is designed to be self-hosted.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Self-hosted internet radio station$q$, $q$Run a complete internet radio station, including streaming and automation, on your own server.$q$, $q$Independent radio operators and hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$Community or campus radio$q$, $q$Manage multiple stations from one web interface for a community, school, or organization.$q$, $q$Community and educational radio groups$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$overview$q$, $q$What is AzuraCast?$q$, 2, ARRAY[$q$AzuraCast is a free, open-source, self-hosted web radio management suite, licensed under AGPL-3.0. It provides a turnkey installer for the full radio software stack, including Icecast/Shoutcast streaming and Liquidsoap-based automation, managed through a modern web interface.$q$, $q$The project is volunteer-maintained and supports Docker deployment with sample Compose files, and has an active community with over 3,900 GitHub stars.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', $q$who-its-for$q$, $q$Who AzuraCast is for$q$, 2, ARRAY[$q$AzuraCast is built for independent broadcasters, hobbyists, and community or campus radio operators who want to self-host a complete internet radio station without stitching together separate streaming and automation tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('edcb26fc-e0a6-432b-a023-ba04a025a9de', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Podlove ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source suite of WordPress plugins for self-hosted podcast publishing, playback, and subscription.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Podlove is a free, open-source suite of WordPress plugins for self-hosted podcast publishing, an HTML5 player, and a subscribe widget.$q$,
  og_description = $q$Podlove is a free, open-source suite of WordPress plugins for self-hosted podcast publishing, an HTML5 player, and a subscribe widget.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b01d76ea-bf87-434f-abc4-af2bc181bdcc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b01d76ea-bf87-434f-abc4-af2bc181bdcc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Podlove Publisher$q$, $q$WordPress plugin for managing podcast episodes with an interface designed to make publishing as simple as writing a blog post.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Podlove Web Player$q$, $q$HTML5 audio/video player optimized for podcasts, usable standalone or integrated with Publisher.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Podcast Subscribe Button$q$, $q$Widget that reads a podcast's RSS feed and lets listeners subscribe in their preferred podcast app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$No cloud dependency$q$, $q$Runs entirely on a self-hosted WordPress installation with no reliance on third-party cloud services.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Free, open-source software available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$No cloud dependencies — fully self-hosted on WordPress$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Modular tools (Publisher, Player, Subscribe Button) can be used independently$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Used by established podcasts such as Forschergeist and Logbuch: Netzpolitik$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Simplifies podcast publishing to a blog-post-like workflow$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Requires an existing self-hosted WordPress site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$No official paid support tier or managed hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Documentation and community are largely oriented toward a German-speaking user base$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Is Podlove free?$q$, $q$Yes, Podlove's WordPress plugins are open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Does Podlove require WordPress?$q$, $q$Yes, Podlove Publisher is built as a WordPress plugin, so it requires a self-hosted WordPress site.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$What is the Podlove Web Player?$q$, $q$It's an HTML5 audio/video player optimized for podcasts that can be used standalone or alongside Podlove Publisher.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Does Podlove depend on any cloud service?$q$, $q$No, Podlove is designed with no cloud dependencies and runs entirely on your own WordPress hosting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Self-hosted podcast publishing$q$, $q$Publish and manage podcast episodes directly from a self-hosted WordPress site rather than a third-party hosting platform.$q$, $q$Independent podcasters using WordPress$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$Embeddable podcast player$q$, $q$Add the Podlove Web Player or Subscribe Button to any website to let visitors play or subscribe to episodes.$q$, $q$Podcasters embedding players on external sites$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$overview$q$, $q$What is Podlove?$q$, 2, ARRAY[$q$Podlove is a free, open-source suite of WordPress plugins for self-hosted podcasting. It includes Podlove Publisher, which turns episode management into a workflow as simple as writing a blog post, the Podlove Web Player, an HTML5 player optimized for podcasts, and a Podcast Subscribe Button widget for RSS-based subscriptions.$q$, $q$The project emphasizes no cloud dependencies, running entirely on a self-hosted WordPress installation, and is used by podcasts including Forschergeist, Lage der Nation, and Logbuch: Netzpolitik.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', $q$who-its-for$q$, $q$Who Podlove is for$q$, 2, ARRAY[$q$Podlove is for podcasters who already run a self-hosted WordPress site and want an independent, cloud-free way to publish, play, and let listeners subscribe to their show without relying on a third-party podcast hosting platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b01d76ea-bf87-434f-abc4-af2bc181bdcc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Ant Media Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, ultra-low-latency streaming server with WebRTC, SRT, RTMP, and HLS support, plus a paid Enterprise tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ant Media Server: open-source WebRTC streaming engine with ~0.5s latency, SRT/RTMP/HLS support, and a free Community Edition.$q$,
  og_description = $q$Ant Media Server: open-source WebRTC streaming engine with ~0.5s latency, SRT/RTMP/HLS support, and a free Community Edition.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2d8087e6-e022-4b9c-9760-d491836887d8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2d8087e6-e022-4b9c-9760-d491836887d8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Ultra-low latency WebRTC$q$, $q$Delivers WebRTC streaming with latency as low as roughly 0.5 seconds for real-time interactive video.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Multi-protocol streaming$q$, $q$Supports WebRTC, SRT, RTMP, RTSP, HLS, and CMAF (including Low-Latency HLS) for ingest and playback.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Adaptive bitrate & transcoding$q$, $q$Transcodes incoming streams into multiple bitrates for adaptive playback across varying network conditions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Cloud-native scaling$q$, $q$Deploys via Docker, Kubernetes, or marketplace images on AWS, Azure, and GCP with auto-scaling support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Stream recording$q$, $q$Records live streams for on-demand playback.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Dual licensing$q$, $q$Available as a free, open-source Community Edition or a paid Enterprise Edition with additional features and support.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Free, open-source Community Edition with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Sub-second WebRTC latency suitable for real-time interaction$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Broad protocol support (WebRTC, SRT, RTMP, RTSP, HLS, CMAF) in one server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Flexible deployment via Docker, Kubernetes, and major cloud marketplaces$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Advanced features and dedicated support require the paid Enterprise Edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Enterprise pricing is not published and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Self-managed deployment requires server and infrastructure expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Is Ant Media Server free?$q$, $q$Yes, the Community Edition is free and open-source. A paid Enterprise Edition adds advanced features and dedicated support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$What streaming protocols does Ant Media Server support?$q$, $q$It supports WebRTC, SRT, RTMP, RTSP, HLS, and CMAF, including Low-Latency HLS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$How low is the streaming latency?$q$, $q$WebRTC streaming can achieve latency as low as roughly 0.5 seconds.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Can Ant Media Server run in the cloud?$q$, $q$Yes, it supports Docker, Kubernetes, and marketplace images for AWS, Azure, and GCP with auto-scaling.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Live interactive streaming$q$, $q$Ultra-low latency WebRTC suits real-time interaction use cases such as telehealth, live auctions, and live shopping.$q$, $q$Businesses building interactive live-video applications$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Large-scale broadcast streaming$q$, $q$Multi-protocol support and cloud auto-scaling suit high-viewer-count events like media entertainment and esports broadcasts.$q$, $q$Media and gaming/esports companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Self-hosted streaming infrastructure$q$, $q$The free Community Edition lets developers self-host a full streaming engine without licensing fees.$q$, $q$Developers and engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open-source streaming engine","WebRTC, RTMP, SRT, HLS support","Self-hosted deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Enterprise Edition$q$, $q$Custom (contact sales)$q$, NULL, $q$["Advanced features beyond Community Edition","Dedicated support","Cloud marketplace images"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$overview$q$, $q$What is Ant Media Server?$q$, 2, ARRAY[$q$Ant Media Server is an open-source streaming engine built for ultra-low-latency video delivery, supporting WebRTC (with latency as low as about 0.5 seconds), SRT, RTMP, RTSP, HLS, and CMAF.$q$, $q$It offers adaptive bitrate transcoding, stream recording, and cloud-native deployment through Docker, Kubernetes, and marketplace images on AWS, Azure, and GCP. The project is dual-licensed with a free, open-source Community Edition and a paid Enterprise Edition that adds advanced features and dedicated support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$who-its-for$q$, $q$Who Ant Media Server is for$q$, 2, ARRAY[$q$Ant Media Server suits developers and teams building real-time interactive streaming applications for telehealth, e-learning, live auctions, live shopping, gaming/esports, and general media entertainment, ranging from self-hosted small deployments to large-scale cloud-scaled events.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── SRS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SRS is a free, open-source real-time video server supporting RTMP, WebRTC, HLS, SRT, and MPEG-DASH streaming protocols.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SRS (Simple Realtime Server): free open-source live streaming server with RTMP, WebRTC, HLS, SRT, and Kubernetes-ready deployment.$q$,
  og_description = $q$SRS (Simple Realtime Server): free open-source live streaming server with RTMP, WebRTC, HLS, SRT, and Kubernetes-ready deployment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Multi-protocol streaming$q$, $q$Supports RTMP, WebRTC, HLS, HTTP-FLV, SRT, MPEG-DASH, and GB28181 for ingest and delivery.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Coroutine-based architecture$q$, $q$Built on coroutine technology to avoid the complexity of async callback-based code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Cloud-native deployment$q$, $q$Ships with Docker images and supports Kubernetes for containerized deployment.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$High-performance real-time delivery$q$, $q$Designed as a high-efficiency, low-latency server for live video.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Telemetry and monitoring$q$, $q$Includes telemetry capabilities for monitoring server and stream health.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Supports a wide range of streaming protocols in a single server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Cloud-native design with Docker and Kubernetes support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Actively maintained community project$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Requires self-hosting and server administration knowledge$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$No official managed/hosted-cloud offering from the core project itself$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Is SRS free to use?$q$, $q$Yes, SRS is open-source and free.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$What protocols does SRS support?$q$, $q$RTMP, WebRTC, HLS, HTTP-FLV, SRT, MPEG-DASH, and GB28181.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Can SRS run in Docker or Kubernetes?$q$, $q$Yes, SRS provides Docker images and supports Kubernetes deployment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$What is Oryx?$q$, $q$Oryx is a related, out-of-the-box video solution offered by the OSSRS project alongside SRS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Self-hosted live streaming server$q$, $q$Run a free RTMP/WebRTC/HLS streaming server on your own infrastructure.$q$, $q$Developers building streaming platforms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Cloud-native media delivery$q$, $q$Deploy SRS via Docker or Kubernetes for scalable real-time video delivery.$q$, $q$DevOps and platform engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$overview$q$, $q$What is SRS?$q$, 2, ARRAY[$q$SRS (Simple Realtime Server) is a free, open-source, high-efficiency real-time video server. It supports a broad set of streaming protocols including RTMP, WebRTC, HLS, HTTP-FLV, SRT, MPEG-DASH, and GB28181.$q$, $q$The server is built on coroutine technology to simplify concurrent stream handling, and it is designed for cloud-native deployment with Docker images and Kubernetes support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$who-its-for$q$, $q$Who SRS is for$q$, 2, ARRAY[$q$SRS suits developers and organizations that want to self-host a live streaming or WebRTC application server without licensing costs, particularly those deploying in containerized or Kubernetes environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OBS Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OBS Studio is free, open-source software for live streaming and video recording with scene composition and plugin support.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OBS Studio: free open-source recording and live streaming software with scene mixing, audio filters, and Lua/Python plugins.$q$,
  og_description = $q$OBS Studio: free open-source recording and live streaming software with scene mixing, audio filters, and Lua/Python plugins.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba63a23f-3cf0-4180-a7bf-2561af98bb09';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba63a23f-3cf0-4180-a7bf-2561af98bb09' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Multi-source scene composition$q$, $q$Combines webcams, window/screen captures, images, browser sources, and capture cards into unified scenes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Unlimited scenes and transitions$q$, $q$Create unlimited scenes with customizable transitions between them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Audio mixer with filters$q$, $q$Professional-grade audio mixer with filters such as noise suppression and VST plugin support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Studio Mode$q$, $q$Preview a scene before pushing it live.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Multiview$q$, $q$Monitor up to eight scenes simultaneously.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Configurable hotkeys$q$, $q$Assign shortcuts for scene switching, recording, and audio muting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Plugin and scripting support$q$, $q$Extend functionality through native plugins or Lua and Python scripts.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Completely free with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Cross-platform on Windows, macOS, and Linux$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Extensible through plugins and Lua/Python scripting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Large, active open-source community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Steeper learning curve for advanced scene and audio setups$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$No built-in cloud hosting — must be paired with a separate streaming platform$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Is OBS Studio free?$q$, $q$Yes, it is completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$What platforms does OBS Studio support?$q$, $q$Windows 10/11, macOS 12.0+, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Can OBS Studio be extended with plugins?$q$, $q$Yes, it supports native plugins as well as Lua and Python scripting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Does OBS Studio support multiple scenes?$q$, $q$Yes, users can create unlimited scenes with customizable transitions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Live streaming$q$, $q$Combine multiple video and audio sources into scenes and broadcast to streaming platforms.$q$, $q$Streamers and content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Screen and webcam recording$q$, $q$Record tutorials, gameplay, or presentations locally using scene-based capture.$q$, $q$Educators and video producers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$Multi-scene broadcast production$q$, $q$Studio Mode and Multiview support multi-scene live production workflows.$q$, $q$Broadcasters and production teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$overview$q$, $q$What is OBS Studio?$q$, 2, ARRAY[$q$OBS Studio is free and open-source software for video recording and live streaming. It lets users capture and mix webcams, screen/window captures, images, browser sources, and capture cards into scenes.$q$, $q$It includes an audio mixer with filters, unlimited scenes with customizable transitions, Studio Mode for previewing before going live, Multiview for monitoring multiple scenes, and extensibility through native plugins and Lua/Python scripting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', $q$who-its-for$q$, $q$Who OBS Studio is for$q$, 2, ARRAY[$q$OBS Studio serves content creators, streamers, and broadcasters at all skill levels — from hobbyists recording tutorials to professional production teams running multi-scene live broadcasts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba63a23f-3cf0-4180-a7bf-2561af98bb09', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Kdenlive ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kdenlive is a free, open-source non-linear video editor from the KDE community for Linux, Windows, macOS, and BSD.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Kdenlive: free open-source non-linear video editor with multi-track timelines, proxy editing, and keyframeable effects.$q$,
  og_description = $q$Kdenlive: free open-source non-linear video editor with multi-track timelines, proxy editing, and keyframeable effects.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Unlimited multi-track editing$q$, $q$Unlimited video and audio tracks that can be hidden or muted individually.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Broad format support$q$, $q$Handles almost any audio and video format via FFmpeg.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Built-in title editor$q$, $q$2D title editor with animation and typewriter effects, plus Glaxnimate integration for SVG vector animation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Effects and filters$q$, $q$Dozens of artistic, blur, color-correction, and audio effects, most of which can be keyframed with multiple curve types.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Multi-cam editing$q$, $q$Simultaneous playback and editing of multiple camera angles.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Audio/video scopes$q$, $q$Histogram, waveform, vectorscope, and RGB parade monitoring tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Proxy editing$q$, $q$Automatically creates low-resolution proxy copies for smoother editing performance.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Automatic subtitle generation$q$, $q$Generates captions automatically using VOSK and Whisper speech models.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Completely free and open source, with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Cross-platform: Linux, Windows, macOS, and BSD$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Deep feature set including proxy editing, multi-cam, and keyframeable effects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Automatic subtitle generation via VOSK and Whisper$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Backed by the long-established KDE community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Occasional stability issues reported by users of a community-maintained open-source project$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$No official paid support tier for businesses$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Is Kdenlive free?$q$, $q$Yes, Kdenlive is completely free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$What platforms does Kdenlive support?$q$, $q$Linux, Windows, macOS, and BSD.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Does Kdenlive support automatic subtitles?$q$, $q$Yes, it can generate captions automatically using VOSK and Whisper speech-recognition models.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Does Kdenlive support proxy editing?$q$, $q$Yes, it can automatically create low-resolution proxy copies of footage to improve editing performance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Multi-track video editing$q$, $q$Unlimited video and audio tracks with keyframeable effects for complex edits.$q$, $q$Independent filmmakers and video editors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Multi-camera production editing$q$, $q$Multi-cam mode allows editing footage from several camera angles simultaneously.$q$, $q$Event and documentary editors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$Captioned content creation$q$, $q$Automatic subtitle generation via VOSK/Whisper speeds up caption workflows.$q$, $q$Content creators producing accessible video$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$overview$q$, $q$What is Kdenlive?$q$, 2, ARRAY[$q$Kdenlive (KDE Non-Linear Video Editor) is a free, open-source, non-linear video editor developed by the KDE community for Linux, Windows, macOS, and BSD.$q$, $q$It supports unlimited video and audio tracks, broad format compatibility via FFmpeg, a built-in title editor, dozens of keyframeable effects, multi-cam editing, proxy editing, audio/video scopes, and automatic subtitle generation using VOSK and Whisper.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', $q$who-its-for$q$, $q$Who Kdenlive is for$q$, 2, ARRAY[$q$Kdenlive serves video editors from hobbyists to professionals who want a full-featured, no-cost editor with proxy editing, multi-cam support, and automatic captioning, backed by an active open-source community.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b8a01cb-eaf5-4307-9fc0-f73aa6bf0bec', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Shotcut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Shotcut is a free, open-source, cross-platform video editor built on FFmpeg with a multitrack timeline and GPU-accelerated filters.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Shotcut: free open-source video editor with 80+ filters, hardware-accelerated encoding, and native FFmpeg format support.$q$,
  og_description = $q$Shotcut: free open-source video editor with 80+ filters, hardware-accelerated encoding, and native FFmpeg format support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '57934454-9221-47e3-87a7-83d5b080c4a6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '57934454-9221-47e3-87a7-83d5b080c4a6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Native FFmpeg format support$q$, $q$Handles hundreds of audio and video formats via FFmpeg without requiring file conversion.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$80+ video filters$q$, $q$Includes filters such as Gaussian blur, color grading, 3D LUT, motion tracker, noise reduction, sharpen, and stabilize.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Audio filters and VST/LV2 plugins$q$, $q$Compressor, equalizers, reverb, and other audio filters, plus support for VST2 and LV2 plugins.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Multitrack timeline with keyframes$q$, $q$Timeline with thumbnails, waveforms, keyframeable filter parameters, and easing functions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Speed ramping and motion tracking$q$, $q$Supports speed ramping, clip reversal, freeze frame, and object motion tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Hardware-accelerated performance$q$, $q$GPU-based OpenGL image processing and hardware-accelerated encoding/decoding.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Video and audio scopes$q$, $q$Histogram, RGB parade, waveform, vectorscope, loudness, and spectrum analyzer monitoring.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Native FFmpeg support for hundreds of formats without conversion$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Large filter library (80+ video filters) plus VST2/LV2 audio plugin support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Hardware-accelerated encoding, decoding, and GPU-based image processing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Cross-platform: Windows, Mac, and Linux$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Interface can feel less polished than commercial paid editors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$No official paid support tier$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Is Shotcut free?$q$, $q$Yes, Shotcut is free, open source, and cross-platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$What formats does Shotcut support?$q$, $q$Hundreds of audio and video formats via native FFmpeg integration, without needing to convert files first.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Does Shotcut support hardware acceleration?$q$, $q$Yes, it supports hardware-accelerated encoding and decoding along with GPU-based OpenGL image processing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Can Shotcut use third-party plugins?$q$, $q$Yes, it supports VST2 and LV2 audio plugins in addition to its built-in filters.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Multi-format video editing$q$, $q$Native FFmpeg support lets editors work with diverse formats and resolutions in one timeline.$q$, $q$Video editors handling mixed-format footage$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Broadcast-quality color grading$q$, $q$3D LUT support and video scopes enable precise color correction workflows.$q$, $q$Colorists and post-production editors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Fast, hardware-accelerated editing$q$, $q$GPU-based processing and hardware encoding speed up editing and export.$q$, $q$Editors working with 4K footage$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$overview$q$, $q$What is Shotcut?$q$, 2, ARRAY[$q$Shotcut is a free, open-source, cross-platform video editor built on FFmpeg, supporting hundreds of audio and video formats natively without requiring conversion.$q$, $q$It offers a multitrack timeline with keyframeable filters and easing functions, over 80 video filters, audio filters with VST2/LV2 plugin support, hardware-accelerated encoding/decoding, GPU-based image processing, and a full set of video and audio scopes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$who-its-for$q$, $q$Who Shotcut is for$q$, 2, ARRAY[$q$Shotcut suits both amateur and professional video editors who need a capable, no-cost editor with broad format support, up to 4K resolution, and hardware-accelerated performance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── OpenShot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenShot is a free, open-source video editor for Linux, Mac, and Windows with unlimited tracks and keyframe animation.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenShot: free open-source video editor with unlimited tracks, 3D animated titles, and support for 70+ languages.$q$,
  og_description = $q$OpenShot: free open-source video editor with unlimited tracks, 3D animated titles, and support for 70+ languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '541442eb-549b-42a3-a8f8-d423bdb42a14';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '541442eb-549b-42a3-a8f8-d423bdb42a14' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Unlimited tracks$q$, $q$Supports an unlimited number of video and audio tracks in a project.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Trimming and slicing$q$, $q$Core clip trimming and slicing tools for assembling a timeline.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Animation and keyframes$q$, $q$Keyframe-based animation support for clip properties.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Video effects$q$, $q$Includes effects such as background removal, color adjustment, and brightness control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Title templates and 3D effects$q$, $q$Title editing with templates and 3D animated effects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Time manipulation$q$, $q$Slow motion, speed adjustment, and clip reversal.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Audio waveform visualization$q$, $q$Displays audio waveforms on the timeline for precise editing.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$70+ language support$q$, $q$The application interface is available in more than 70 languages.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Completely free and open source (GPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Cross-platform: Linux, Mac, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Unlimited video and audio tracks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Interface available in 70+ languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Beginner-friendly while including 3D titles and keyframe animation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$No official paid support tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Fewer advanced professional-grade scopes/monitoring tools than some competitors$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Is OpenShot free?$q$, $q$Yes, OpenShot is completely free and open-source software licensed under GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$What platforms does OpenShot support?$q$, $q$Linux, Mac, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Does OpenShot support multiple languages?$q$, $q$Yes, its interface is available in more than 70 languages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Can OpenShot create animated titles?$q$, $q$Yes, it includes title templates and 3D animated effects.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Beginner video editing$q$, $q$An easy-to-learn interface with unlimited tracks suits first-time video editors.$q$, $q$Hobbyists and beginner content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Animated title and effects work$q$, $q$3D animated titles and keyframe animation support creative title sequences.$q$, $q$Creators producing titles and intros$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$Multilingual editing workflows$q$, $q$Support for 70+ interface languages helps non-English-speaking editors.$q$, $q$International video editors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$overview$q$, $q$What is OpenShot?$q$, 2, ARRAY[$q$OpenShot is a free, open-source video editor licensed under the GNU General Public License v3, available for Linux, Mac, and Windows.$q$, $q$It offers unlimited video and audio tracks, trimming and slicing, keyframe animation, video effects like background removal and color adjustment, title templates with 3D animated effects, time manipulation (slow motion, speed changes, reversing), audio waveform visualization, and an interface translated into more than 70 languages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', $q$who-its-for$q$, $q$Who OpenShot is for$q$, 2, ARRAY[$q$OpenShot is designed to be easy to learn while remaining capable, making it suitable for both beginners and more advanced editors who want a free, no-limits video editor.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('541442eb-549b-42a3-a8f8-d423bdb42a14', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Olive Video Editor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Olive is a free, open-source, cross-platform non-linear video editor currently in active alpha development.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Olive Video Editor: free open-source non-linear editor for Windows, macOS, and Linux, currently in alpha development.$q$,
  og_description = $q$Olive Video Editor: free open-source non-linear editor for Windows, macOS, and Linux, currently in alpha development.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '76721f82-dab0-44d8-9e79-1d3b6df99f76';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '76721f82-dab0-44d8-9e79-1d3b6df99f76' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Non-linear editing$q$, $q$Cross-platform non-linear video editing built in C++ with Qt and OpenGL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Hardware acceleration$q$, $q$Uses OpenGL for hardware-accelerated video processing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$VST plugin support$q$, $q$Supports VST audio plugins for extended audio processing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Open development$q$, $q$Actively developed on GitHub with public issue tracking, pull requests, and a Patreon-funded roadmap.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Cross-platform: Windows, macOS, and Linux$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Hardware-accelerated OpenGL rendering$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Actively developed with public roadmap and community funding$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Alpha software that the developers describe as highly unstable$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Not recommended for production work$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Feature set and stability lag behind more mature open-source editors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Is Olive Video Editor free?$q$, $q$Yes, it is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Is Olive stable enough for production use?$q$, $q$No, the project describes itself as alpha software that is highly unstable, and recommends using it at your own risk.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$What platforms does Olive support?$q$, $q$Windows, macOS, and Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Is Olive still being developed?$q$, $q$Yes, it has active commits, open pull requests, and issue tracking on GitHub, supported in part by Patreon funding.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Experimental video editing$q$, $q$Alpha-stage non-linear editing for users comfortable testing unstable software.$q$, $q$Open-source enthusiasts and early testers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$Open-source editor development$q$, $q$Public GitHub repository with active issues and pull requests invites community contributions.$q$, $q$Developers wanting to contribute to a video editor$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$overview$q$, $q$What is Olive Video Editor?$q$, 2, ARRAY[$q$Olive is a free, open-source, cross-platform non-linear video editor built in C++ with Qt and OpenGL, supporting Windows, macOS, and Linux with hardware-accelerated rendering and VST plugin support.$q$, $q$The project describes its current releases as alpha software that is highly unstable and recommends use at your own risk. Development remains active on GitHub, with ongoing commits, pull requests, and issue tracking, partly supported through Patreon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', $q$who-its-for$q$, $q$Who Olive Video Editor is for$q$, 2, ARRAY[$q$Olive currently suits open-source enthusiasts and early testers willing to experiment with alpha-stage software, rather than editors needing a stable, production-ready tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76721f82-dab0-44d8-9e79-1d3b6df99f76', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Pitivi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pitivi is a free, open-source video editor for GNU/Linux with a clean interface, distributed primarily via Flatpak.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pitivi: free open-source video editor for GNU/Linux with auto-alignment, waveforms, and object tracking, via Flatpak.$q$,
  og_description = $q$Pitivi: free open-source video editor for GNU/Linux with auto-alignment, waveforms, and object tracking, via Flatpak.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '588dad8e-446f-42e3-8554-3bef2ef37a9a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '588dad8e-446f-42e3-8554-3bef2ef37a9a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Auto alignment and precise waveforms$q$, $q$Automatically aligns clips and displays precise audio waveforms for editing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Object tracking and beat detection$q$, $q$Tracks objects in footage and detects audio beats to assist editing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Media library clip tagging$q$, $q$Tags clips in the media library for easier organization.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Flatpak distribution$q$, $q$Distributed as a distro-agnostic Flatpak package via Flathub, in addition to distro repositories and source builds.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Completely free with a clean, intuitive interface$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Actively developed with regular releases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Distro-agnostic Flatpak packaging simplifies installation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Built on GStreamer/GNOME infrastructure with an open community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Linux-only — no official Windows or macOS builds$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Smaller feature set and community than larger editors like Kdenlive or Shotcut$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Is Pitivi free?$q$, $q$Yes, Pitivi is free and open source; the project also accepts optional donations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$What platforms does Pitivi support?$q$, $q$GNU/Linux, distributed primarily via Flatpak on Flathub, as well as some distro repositories.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Does Pitivi run on Windows or macOS?$q$, $q$No, official support is limited to GNU/Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Does Pitivi support object tracking?$q$, $q$Yes, recent releases added object tracking and beat detection.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Linux desktop video editing$q$, $q$A native, GNOME-integrated video editor for Linux users.$q$, $q$Linux desktop users and filmmakers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$Beat-synced editing$q$, $q$Beat detection and object tracking help align cuts to audio and motion.$q$, $q$Music video and social content editors$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$overview$q$, $q$What is Pitivi?$q$, 2, ARRAY[$q$Pitivi is a free, open-source video editor for GNU/Linux, built on GStreamer and GNOME infrastructure, distributed mainly as a distro-agnostic Flatpak package via Flathub.$q$, $q$Recent releases have added auto alignment and precise waveforms, object tracking, beat detection, and media library clip tagging.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', $q$who-its-for$q$, $q$Who Pitivi is for$q$, 2, ARRAY[$q$Pitivi is aimed at Linux users and aspiring filmmakers who want a free, clean video editor they can own and improve, without needing Windows or macOS support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('588dad8e-446f-42e3-8554-3bef2ef37a9a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── HandBrake ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HandBrake is a free, open-source video transcoder for converting video to modern codecs like H.264, H.265, and AV1.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HandBrake: free open-source video transcoder supporting H.264, H.265, AV1, device presets, and batch encode queueing.$q$,
  og_description = $q$HandBrake: free open-source video transcoder supporting H.264, H.265, AV1, device presets, and batch encode queueing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5193cb21-ed1a-4efa-8952-c3400dfcbad7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5193cb21-ed1a-4efa-8952-c3400dfcbad7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Broad codec support$q$, $q$Encodes video with AV1, H.265, H.264, MPEG-4, MPEG-2, VP8, and VP9, into MP4, MKV, or WebM containers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Hardware-accelerated encoding$q$, $q$Optional hardware-accelerated video encoding to speed up transcoding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Built-in device presets$q$, $q$Presets optimized for specific devices plus universal profiles for standard and high-quality conversion.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Batch scanning and queueing$q$, $q$Scans and queues multiple files for batch encoding.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Subtitle and chapter support$q$, $q$Supports VobSub, Closed Captions (CEA-608), SSA, and SRT subtitles along with chapter markers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Audio pass-through and encoding$q$, $q$Encodes to AAC/HE-AAC, MP3, FLAC, AC3, E-AC3, Opus, and Vorbis, or passes through AC-3, DTS, DTS-HD, and TrueHD tracks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Video filters$q$, $q$Includes deinterlacing, denoise, detelecine, deblock, grayscale, cropping, and scaling filters.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$HDR pass-through$q$, $q$Preserves HDR metadata during conversion.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Completely free, volunteer-built open-source software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Cross-platform: Windows, Mac, and Linux$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Wide codec and container support, including AV1 and H.265$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Batch scanning and encode queueing for processing many files at once$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Hardware-accelerated encoding for faster transcodes$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Cannot process copy-protected DVD or Blu-ray sources$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$No official paid support tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Limited to MP4, MKV, and WebM output containers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Is HandBrake free?$q$, $q$Yes, HandBrake is a free, open-source tool built by volunteers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$What video codecs does HandBrake support?$q$, $q$AV1, H.265, H.264, MPEG-4, MPEG-2, VP8, and VP9, output to MP4, MKV, or WebM.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Can HandBrake convert copy-protected discs?$q$, $q$No, it can only process DVD or Blu-ray sources that do not contain copy protection.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Does HandBrake support batch conversion?$q$, $q$Yes, it supports batch scanning and an encode queue for processing multiple files.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$What platforms does HandBrake run on?$q$, $q$Windows, Mac, and Linux.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Video format conversion$q$, $q$Convert video files into modern, widely supported codecs and containers.$q$, $q$Anyone needing to re-encode video for compatibility$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Batch transcoding$q$, $q$Queue and encode many video files at once with device-optimized presets.$q$, $q$Users managing large media libraries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$Device-optimized encoding$q$, $q$Built-in device presets simplify preparing video for specific devices.$q$, $q$Users preparing video for phones, tablets, or media players$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$overview$q$, $q$What is HandBrake?$q$, 2, ARRAY[$q$HandBrake is a free, open-source video transcoder built by volunteers, for converting video from nearly any format into modern, widely supported codecs such as AV1, H.265, H.264, VP8, and VP9, output as MP4, MKV, or WebM.$q$, $q$It includes hardware-accelerated encoding, built-in device presets, batch scanning and an encode queue, subtitle and chapter support, audio pass-through and encoding options, HDR pass-through, and a set of video filters including deinterlacing, denoise, and cropping.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', $q$who-its-for$q$, $q$Who HandBrake is for$q$, 2, ARRAY[$q$HandBrake serves anyone who needs to transcode video into modern, compatible formats — from casual users converting personal video to professionals batch-processing media libraries — at no cost.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5193cb21-ed1a-4efa-8952-c3400dfcbad7', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Audacity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Audacity is free, open-source multi-track audio recording and editing software for Windows, macOS, and Linux.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Audacity: free open-source multi-track audio editor with noise reduction, VST3/Nyquist plugins, and multi-format export.$q$,
  og_description = $q$Audacity: free open-source multi-track audio editor with noise reduction, VST3/Nyquist plugins, and multi-format export.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0feb9ecc-7812-47e0-afb1-c05d828a05c3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Multi-track editing$q$, $q$Record and edit multiple audio tracks in a single project.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$VST3 and Nyquist plugin support$q$, $q$Extend functionality with VST3 and Nyquist plugins.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Built-in audio effects$q$, $q$Includes effects such as noise reduction, compressor, and pitch/speed changing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Vocal removal$q$, $q$Includes a vocal removal effect for isolating instrumental tracks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Broad format import/export$q$, $q$Imports and exports formats including WAV, MP3, FLAC, and Ogg.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Optional cloud companion (audio.com)$q$, $q$Audio.com offers optional cloud saving, project collaboration, and sharing alongside the desktop app.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Completely free and open source under GPLv3$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Cross-platform: Windows, macOS, and Linux$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Multi-track editing with a wide range of built-in effects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Extensible via VST3 and Nyquist plugins$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Long-established, widely used project$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Interface is more utilitarian than some modern commercial DAWs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Optional audio.com cloud features are a separate companion service, not the core desktop app$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Is Audacity free?$q$, $q$Yes, Audacity has always been and remains free for everyone, licensed under GPLv3.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$What platforms does Audacity support?$q$, $q$Windows, macOS, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Does Audacity support plugins?$q$, $q$Yes, it supports VST3 and Nyquist plugins.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$What formats can Audacity import and export?$q$, $q$Formats including WAV, MP3, FLAC, and Ogg.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$What is audio.com?$q$, $q$Audio.com is an optional companion online service offering cloud saving, project collaboration, and sharing alongside Audacity.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Podcast recording and editing$q$, $q$Multi-track recording and editing with noise reduction and compression effects.$q$, $q$Podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$Music editing and mastering$q$, $q$Pitch/speed changing, vocal removal, and plugin support for music production tasks.$q$, $q$Musicians and hobbyist producers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$General audio cleanup$q$, $q$Noise reduction and editing tools for cleaning up recordings.$q$, $q$Anyone needing quick audio editing$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$overview$q$, $q$What is Audacity?$q$, 2, ARRAY[$q$Audacity is free, open-source, multi-track audio recording and editing software licensed under GPLv3, available for Windows, macOS, and Linux.$q$, $q$It includes effects such as noise reduction, a compressor, pitch/speed changing, and vocal removal, supports VST3 and Nyquist plugins, and imports/exports formats including WAV, MP3, FLAC, and Ogg. An optional companion service, audio.com, adds cloud saving, collaboration, and sharing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', $q$who-its-for$q$, $q$Who Audacity is for$q$, 2, ARRAY[$q$Audacity serves musicians, podcasters, and anyone needing a free, cross-platform tool for recording, editing, and cleaning up audio.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0feb9ecc-7812-47e0-afb1-c05d828a05c3', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Ardour ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ardour is an open-source digital audio workstation for recording, editing, and mixing audio and MIDI on Linux, macOS, and Windows.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$1 (pay-what-you-want)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ardour is a free, open-source multi-track DAW for Linux, macOS, and Windows with VST/LV2/AU plugin support and non-destructive editing.$q$,
  og_description = $q$Ardour is a free, open-source multi-track DAW for Linux, macOS, and Windows with VST/LV2/AU plugin support and non-destructive editing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '31cd7295-1d81-4b31-927e-f153490c69dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '31cd7295-1d81-4b31-927e-f153490c69dc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Multi-track recording$q$, $q$Records and edits multi-track audio and MIDI projects with unlimited undo/redo.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Plugin format support$q$, $q$Supports AudioUnit, LV2, VST2/VST3, and LADSPA plugin formats for instruments and effects.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Advanced signal routing$q$, $q$Offers flexible internal audio routing for complex mixing and bussing setups.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Video timeline sync$q$, $q$Includes a video timeline with frame-by-frame synchronization for scoring and post-production.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$MIDI timecode and LTC sync$q$, $q$Syncs with external gear and other software via MIDI timecode and LTC.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Control surface integration$q$, $q$Works with external hardware control surfaces for hands-on mixing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Non-destructive editing$q$, $q$Supports non-destructive editing with configurable sample rates and bit depths.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Source code is fully free and open source under GPLv2$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Available on Linux, macOS, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Supports professional plugin formats (VST2/VST3, AU, LV2, LADSPA)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Video timeline and timecode sync suit post-production work$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Transparent, community-driven development$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Official pre-built binaries require a pay-what-you-want purchase or subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Building from source yourself receives no official support from the developers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$No official mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Is Ardour free?$q$, $q$The source code is free under the GPLv2 license and can be built yourself at no cost. Official pre-built binaries from ardour.org require a pay-what-you-want purchase (minimum around $1) or a subscription.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$What platforms does Ardour support?$q$, $q$Ardour runs on Linux, macOS, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$What plugin formats does Ardour support?$q$, $q$Ardour supports AudioUnit, LV2, VST2/VST3, and LADSPA plugins.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Who created Ardour?$q$, $q$Ardour was created by Paul Davis, with ongoing contributions from musicians, programmers, and professional recording engineers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Multi-track music recording$q$, $q$Records and mixes multi-track audio and MIDI for bands and solo musicians.$q$, $q$Musicians and home studio owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Post-production audio editing$q$, $q$Syncs audio to a video timeline with frame-accurate timecode support.$q$, $q$Video and podcast editors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Professional studio mixing$q$, $q$Uses advanced routing and control surface integration for complex mixes.$q$, $q$Audio engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Source Code / Distro Package$q$, $q$Free$q$, NULL, $q$["Build from source yourself","Available via many Linux distribution package managers","No official support for self-built binaries"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$One-Time Download$q$, $q$$45+$q$, NULL, $q$["Pre-built binary for a specific version","Includes all updates to that version"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$Subscription$q$, $q$$120/year$q$, $q$annual$q$, $q$["Ongoing access to pre-built binaries","Covers roughly two major releases per year"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$overview$q$, $q$What is Ardour?$q$, 2, ARRAY[$q$Ardour is a free and open-source digital audio workstation for recording, editing, and mixing audio and MIDI projects. Its source code is licensed under the GPLv2 and developed collaboratively by musicians, programmers, and recording engineers.$q$, $q$The application runs on Linux, macOS, and Windows, and supports professional plugin formats including VST2/VST3, AudioUnit, LV2, and LADSPA, along with a video timeline for synchronized post-production work.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', $q$who-its-for$q$, $q$Who Ardour is for$q$, 2, ARRAY[$q$Ardour suits musicians, audio engineers, podcasters, and video editors who want a fully open-source DAW with professional routing, plugin support, and timecode sync, and who are comfortable either paying for pre-built binaries or compiling the software themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('31cd7295-1d81-4b31-927e-f153490c69dc', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── LMMS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LMMS is a free, open-source music production app for composing, sequencing, and mixing on Windows, Linux, and macOS.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LMMS is a 100% free, open-source music production app with built-in synths, VST support, and a Beat+Bassline editor for Windows, Linux, macOS.$q$,
  og_description = $q$LMMS is a 100% free, open-source music production app with built-in synths, VST support, and a Beat+Bassline editor for Windows, Linux, macOS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '86fbd391-0641-4d3e-9a56-e671a2e7b73d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '86fbd391-0641-4d3e-9a56-e671a2e7b73d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Beat+Bassline and Piano Roll editors$q$, $q$Composes melodies and beats using dedicated pattern and piano-roll style editors.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$16 built-in synthesizers$q$, $q$Includes synth emulations such as the Roland TB-303 and Commodore 64 SID chip.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$VST plugin support$q$, $q$Loads VST instruments and effect plugins to expand available sounds and processing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$SoundFont, GIG, and GUS compatibility$q$, $q$Imports sample libraries in SoundFont, GIG, and GUS formats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Built-in effects$q$, $q$Ships with compressor, limiter, delay, reverb, and equalizer effects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$MIDI keyboard and file import$q$, $q$Accepts input from MIDI keyboards or a computer keyboard, and imports MIDI files and Hydrogen projects.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$100% free and open source with no paywalled features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Available on Windows, Linux, and macOS$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Comes with 16 built-in synthesizers out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Supports VST instruments and effects for expanded sound design$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Community-driven development hosted on GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$No official mobile app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$No built-in cloud collaboration or hosting features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Entirely community-supported with no dedicated commercial support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Is LMMS free?$q$, $q$Yes, LMMS is described as a 100% free, open-source, community-driven project with no cost to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$What platforms does LMMS run on?$q$, $q$LMMS runs on Windows, Linux, and macOS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Does LMMS support VST plugins?$q$, $q$Yes, LMMS supports VST instrument and effect plugins alongside its 16 built-in synthesizers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Can LMMS import files from other programs?$q$, $q$LMMS can import standard MIDI files and Hydrogen drum machine projects.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Electronic music production$q$, $q$Composes beats and melodies with the Beat+Bassline editor and built-in synths.$q$, $q$Electronic music producers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$Beginner music production$q$, $q$Provides a free, full-featured entry point into music composition without a purchase.$q$, $q$Hobbyist musicians and students$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$LMMS$q$, $q$Free$q$, NULL, $q$["Full application with no paid tiers","16 built-in synthesizers","VST plugin support","Built-in effects"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$overview$q$, $q$What is LMMS?$q$, 2, ARRAY[$q$LMMS is a free, open-source music production application for composing, sequencing, and mixing music on Windows, Linux, and macOS. It includes 16 built-in synthesizers, a Beat+Bassline editor, and a Piano Roll editor for composition.$q$, $q$The app supports VST instrument and effect plugins, SoundFont/GIG/GUS sample formats, and can import standard MIDI files and Hydrogen drum machine projects.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', $q$who-its-for$q$, $q$Who LMMS is for$q$, 2, ARRAY[$q$LMMS is aimed at musicians and producers who want a completely free, cross-platform beat- and synth-based production tool, from beginners learning composition to producers who want VST plugin flexibility without a subscription.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86fbd391-0641-4d3e-9a56-e671a2e7b73d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Mixxx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mixxx is free, open-source DJ software for live digital mixing with BPM/key detection, effects, and DJ controller support.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mixxx is free, open-source DJ software with BPM and key detection, Sync Lock, DJ controller mapping, and vinyl timecode control.$q$,
  og_description = $q$Mixxx is free, open-source DJ software with BPM and key detection, Sync Lock, DJ controller mapping, and vinyl timecode control.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '909db6fb-d649-46c3-9386-4c38e0917e64';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '909db6fb-d649-46c3-9386-4c38e0917e64' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$BPM and key detection$q$, $q$Automatically detects tempo and musical key, with Sync Lock to match tempos across tracks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$DJ controller support$q$, $q$Includes built-in mappings for many DJ controllers with customizable MIDI/HID support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Chainable audio effects$q$, $q$Applies audio effects that can be chained together during a live set.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Vinyl timecode control$q$, $q$Supports timecode turntables for controlling playback with real vinyl for scratch mixing.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Completely free with no cost to use, now and in the future$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Fully open-source and free as in freedom$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Backed by the nonprofit Mixxx e.V. rather than a commercial vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Broad built-in support for DJ controller hardware$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Available on Windows, macOS, and Linux$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$No corporate-backed commercial support$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$No official mobile app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$No built-in cloud music library sync$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Is Mixxx free?$q$, $q$Yes. Mixxx states it "is and always will be free," both free of charge and free/open-source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Who maintains Mixxx?$q$, $q$There is no company behind Mixxx; development is carried out by volunteer DJs and programmers, supported by the nonprofit Mixxx e.V.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Does Mixxx support DJ controllers?$q$, $q$Yes, Mixxx includes built-in mappings for many controllers and supports custom MIDI/HID mapping.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Can Mixxx be used with vinyl turntables?$q$, $q$Yes, Mixxx supports timecode vinyl control for scratch mixing with real turntables.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Live DJ performance$q$, $q$Mixes tracks live with BPM/key sync, effects, and controller hardware.$q$, $q$Club and event DJs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Bedroom and hobbyist DJing$q$, $q$Provides a free, full-featured way to practice mixing without buying paid software.$q$, $q$Hobbyist and aspiring DJs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Vinyl-based scratch mixing$q$, $q$Uses timecode turntables to control digital tracks with physical vinyl.$q$, $q$Vinyl and scratch DJs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$Mixxx$q$, $q$Free$q$, NULL, $q$["Full application, free of charge","BPM/key detection and Sync Lock","DJ controller mapping","Vinyl timecode control"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$overview$q$, $q$What is Mixxx?$q$, 2, ARRAY[$q$Mixxx is free, open-source DJ software for live digital mixing. It includes BPM and musical key detection with Sync Lock, chainable audio effects, and built-in mappings for DJ controller hardware with customizable MIDI/HID support.$q$, $q$Copyright for the project is held by the Mixxx Development Team since 2001, and it is now supported by Mixxx e.V., a nonprofit organization under German law, rather than a commercial company.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', $q$who-its-for$q$, $q$Who Mixxx is for$q$, 2, ARRAY[$q$Mixxx is built for DJs, from hobbyists to club performers, who want free, open-source mixing software with controller and vinyl timecode support instead of a paid commercial DJ application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('909db6fb-d649-46c3-9386-4c38e0917e64', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── MuseScore ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MuseScore is a free, open-source music notation app, with an optional paid MuseScore.com subscription for its sheet music library.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MuseScore is free, open-source music notation software; MuseScore.com offers an optional Pro subscription for its online sheet music library.$q$,
  og_description = $q$MuseScore is free, open-source music notation software; MuseScore.com offers an optional Pro subscription for its online sheet music library.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f7005b5d-dff5-494b-852a-3b557ff0ece0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f7005b5d-dff5-494b-852a-3b557ff0ece0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Music notation editor$q$, $q$Composes, arranges, and prints sheet music using a free notation and composition editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Playback$q$, $q$Plays back written scores so composers can hear their arrangements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Free, open-source desktop app$q$, $q$The notation software itself is free with no locked features for writing and printing your own music.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$MuseScore.com sheet music library$q$, $q$Connects to an online library of user-submitted sheet music.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Pro subscription$q$, $q$An optional paid MuseScore.com Pro plan unlocks premium access to the online sheet music library.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Desktop notation software is completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Large community-driven online sheet music library$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$No cost required if you only write, arrange, and print your own music$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Actively developed by Muse Group$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Full access to the online sheet music library requires a paid Pro subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Some premium content is locked behind the MuseScore.com subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Primarily focused on notation rather than full multi-track audio recording$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Is MuseScore free?$q$, $q$The desktop notation and composition software is completely free and open source. Payment is only required for optional premium access to the MuseScore.com online sheet music library.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$What does the MuseScore.com Pro subscription cost?$q$, $q$MuseScore.com Pro is priced at $6.99 per month or $49 per year for premium access to the online sheet music library.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Do I need to pay to write my own music?$q$, $q$No. If you only want to write, arrange, and print your own music, the desktop app is free to use.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Is MuseScore open source?$q$, $q$Yes, the desktop software (MuseScore Studio) is free and open-source software.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Writing and printing sheet music$q$, $q$Composes and arranges original scores using the free desktop notation editor.$q$, $q$Composers and songwriters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Music education$q$, $q$Creates and shares notated exercises and arrangements for students.$q$, $q$Music teachers and students$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$Finding sheet music arrangements$q$, $q$Browses and downloads arrangements from the MuseScore.com online library.$q$, $q$Musicians looking for existing arrangements$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$MuseScore Desktop$q$, $q$Free$q$, NULL, $q$["Full notation and composition editor","Playback","Print and export your own scores"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$MuseScore.com Pro (Monthly)$q$, $q$$6.99/month$q$, $q$monthly$q$, $q$["Premium access to the online sheet music library"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$MuseScore.com Pro (Annual)$q$, $q$$49/year$q$, $q$annual$q$, $q$["Premium access to the online sheet music library"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$overview$q$, $q$What is MuseScore?$q$, 2, ARRAY[$q$MuseScore is free, open-source music composition and notation software. Writing, arranging, and printing your own music is entirely free and requires no payment.$q$, $q$MuseScore.com, the companion online sheet music platform, offers an optional paid Pro subscription ($6.99/month or $49/year) for premium access to its library of user-submitted arrangements.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', $q$who-its-for$q$, $q$Who MuseScore is for$q$, 2, ARRAY[$q$MuseScore suits composers, students, and teachers who need free notation software to write and print their own scores, as well as musicians who want to browse a large online library of existing sheet music arrangements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7005b5d-dff5-494b-852a-3b557ff0ece0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Rosegarden ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rosegarden is a free, open-source MIDI and audio sequencer with a WYSIWYG notation editor for Linux.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rosegarden is free, open-source music software for Linux combining a MIDI/audio sequencer with a WYSIWYG notation editor.$q$,
  og_description = $q$Rosegarden is free, open-source music software for Linux combining a MIDI/audio sequencer with a WYSIWYG notation editor.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae8d22a5-f1b3-47ce-81df-8d297a9c7bba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae8d22a5-f1b3-47ce-81df-8d297a9c7bba' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$WYSIWYG notation editor$q$, $q$Enters notes, rests, dynamics, articulations, and lyrics directly into a traditional staff notation view.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$MIDI and audio sequencer$q$, $q$Records, arranges, and composes music as MIDI data, traditional score, or audio.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Segment-based track editor$q$, $q$Organizes music as movable blocks called segments within the track editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Specialized segment editors$q$, $q$Edits segments using dedicated notation, matrix, percussion matrix, and event list editors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Basic digital audio support$q$, $q$Adds basic digital audio recording alongside its MIDI and notation tools.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Free and open-source software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Combines a full notation editor with a MIDI/audio sequencer in one app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Actively maintained, with releases through mid-2026$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Multiple specialized editors (matrix, percussion matrix, event list) for detailed editing$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Linux only, with no official macOS or Windows builds$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Digital audio support is described as basic rather than full-featured$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Smaller community and plugin ecosystem than more widely used DAWs$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Is Rosegarden free?$q$, $q$Yes, Rosegarden is free, open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$What platforms does Rosegarden support?$q$, $q$Rosegarden is built for the Linux operating system.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Is Rosegarden still maintained?$q$, $q$Yes, the project has shipped regular releases, including a 26.06 release in June 2026.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Does Rosegarden support music notation?$q$, $q$Yes, it includes a WYSIWYG notation editor for entering notes, rests, dynamics, articulations, and lyrics in traditional staff notation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Notation-based composition$q$, $q$Writes and edits scores using the WYSIWYG staff notation editor.$q$, $q$Composers and music students$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$MIDI sequencing on Linux$q$, $q$Records and arranges MIDI performances using segment-based editing.$q$, $q$Linux-based musicians$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Home and small studio recording$q$, $q$Combines notation, MIDI, and basic audio recording in one environment.$q$, $q$Home and small studio users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$Rosegarden$q$, $q$Free$q$, NULL, $q$["Full MIDI sequencer","Notation editor","Basic digital audio support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$overview$q$, $q$What is Rosegarden?$q$, 2, ARRAY[$q$Rosegarden is a free, open-source music composition and editing environment for Linux, built around a MIDI sequencer with a rich understanding of music notation and basic digital audio support.$q$, $q$It includes a WYSIWYG notation editor for entering notes, rests, dynamics, and lyrics directly into a score, plus segment-based editing with dedicated matrix, percussion matrix, and event list editors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', $q$who-its-for$q$, $q$Who Rosegarden is for$q$, 2, ARRAY[$q$Rosegarden is aimed at composers, musicians, and music students on Linux who want notation and MIDI sequencing combined in one free, open-source application for home or small studio use.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae8d22a5-f1b3-47ce-81df-8d297a9c7bba', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Hydrogen ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hydrogen is a free, open-source drum machine for pattern-based drum programming on Linux, macOS, and Windows.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hydrogen is a free, open-source pattern-based drum machine with humanized drum programming for Linux, macOS, and Windows.$q$,
  og_description = $q$Hydrogen is a free, open-source pattern-based drum machine with humanized drum programming for Linux, macOS, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4193fcc0-5bf7-41df-a6ae-52733d63e797';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4193fcc0-5bf7-41df-a6ae-52733d63e797' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Pattern-based sequencer$q$, $q$Programs an unlimited number of patterns and chains them together into a full song.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Multi-layer instruments$q$, $q$Supports up to 16 velocity-layered samples per instrument.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Sample-based stereo audio engine$q$, $q$Imports sound samples in WAV, AU, and AIFF formats for drum sounds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Humanization functions$q$, $q$Applies human velocity, human time, pitch, and swing functions for more realistic drum programming.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Downloadable and custom drumkits$q$, $q$Offers downloadable drumkits (rock, jazz, electronic, percussion) and supports creating custom drumkits.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Free and open source under GPL-2.0-or-later$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Available on Linux, macOS, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Humanization functions for more natural-sounding drum patterns$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Library of downloadable drumkits plus custom drumkit support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Focused on drum programming rather than being a full DAW$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Community-maintained with no dedicated commercial support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$No official mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Is Hydrogen free?$q$, $q$Yes, Hydrogen is free and released under the open-source GPL-2.0-or-later license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$What platforms does Hydrogen support?$q$, $q$Hydrogen runs on Linux, macOS, and Windows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Does Hydrogen include drum sounds?$q$, $q$Yes, it offers various downloadable drumkits such as rock, jazz, and electronic kits, and supports building custom drumkits from your own samples.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Who created Hydrogen?$q$, $q$Hydrogen was created by Alessandro Cominu, with development now carried out by the Hydrogen community on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Drum pattern programming$q$, $q$Builds pattern-based drum tracks using the sequencer and humanization functions.$q$, $q$Electronic music producers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Practice and rehearsal$q$, $q$Uses drumkits for quick practice or rehearsal accompaniment.$q$, $q$Musicians practicing at home$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Live performance$q$, $q$Runs as a lightweight drum machine during live sets.$q$, $q$Live electronic performers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$Hydrogen$q$, $q$Free$q$, NULL, $q$["Full pattern-based sequencer","Multi-layer instrument support","Downloadable and custom drumkits"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$overview$q$, $q$What is Hydrogen?$q$, 2, ARRAY[$q$Hydrogen is a free, open-source drum machine focused on professional yet simple pattern-based drum programming. It combines a pattern sequencer with a sample-based stereo audio engine and supports up to 16 velocity layers per instrument.$q$, $q$The software includes humanization functions for velocity, time, pitch, and swing, along with downloadable drumkits and support for building custom kits from your own samples.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', $q$who-its-for$q$, $q$Who Hydrogen is for$q$, 2, ARRAY[$q$Hydrogen suits electronic music producers, home musicians, and live performers who want a free, open-source, pattern-based drum machine on Linux, macOS, or Windows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4193fcc0-5bf7-41df-a6ae-52733d63e797', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Tenacity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tenacity is a free, open-source, cross-platform multi-track audio editor and recorder forked from Audacity.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tenacity is a free, open-source multi-track audio editor forked from Audacity, with VST/LV2/AU plugin and accessibility support.$q$,
  og_description = $q$Tenacity is a free, open-source multi-track audio editor forked from Audacity, with VST/LV2/AU plugin and accessibility support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Multi-track editing and recording$q$, $q$Records from audio devices and edits multiple tracks with arbitrary sampling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Broad format support$q$, $q$Exports and imports many audio formats, expandable with FFmpeg.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$High-resolution audio$q$, $q$Supports audio up to 32-bit float.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Plugin compatibility$q$, $q$Works with VST, LV2, and AU plugins.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Scripting support$q$, $q$Can be scripted using Nyquist, Python, Perl, and other languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Accessibility features$q$, $q$Includes keyboard-based editing and screen reader support.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Signal analysis tools$q$, $q$Provides tools for analyzing audio signals.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Free and open source, released under MIT and other licenses$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Cross-platform on Windows, macOS, Linux, and BSD$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Supports VST, LV2, and AU plugin formats$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Scriptable through Nyquist, Python, and Perl$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Built-in accessibility features including screen reader support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Entirely volunteer-maintained with no company backing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$No official mobile app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$No built-in cloud or online collaboration features$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Is Tenacity free?$q$, $q$Yes, Tenacity is free, open-source software developed by a volunteer community.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Is Tenacity a fork of Audacity?$q$, $q$Yes, Tenacity is a fork that derives from earlier Audacity codebase versions and has merged in other notable Audacity forks.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$What platforms does Tenacity support?$q$, $q$Tenacity runs on Windows, macOS, Linux, and BSD.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Can Tenacity be scripted?$q$, $q$Yes, it supports scripting through Nyquist, Python, Perl, and other languages.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Multi-track audio editing$q$, $q$Records and edits multiple audio tracks with plugin-based processing.$q$, $q$Podcasters and audio editors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Accessible audio editing$q$, $q$Uses keyboard editing and screen reader support for accessible workflows.$q$, $q$Users who rely on assistive technology$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Scripted audio processing$q$, $q$Automates edits and analysis using Nyquist, Python, or Perl scripts.$q$, $q$Developers and power users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Tenacity$q$, $q$Free$q$, NULL, $q$["Full multi-track editor and recorder","VST/LV2/AU plugin support","Scripting support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$overview$q$, $q$What is Tenacity?$q$, 2, ARRAY[$q$Tenacity is a free, open-source, cross-platform multi-track audio editor and recorder developed by a volunteer community. It is a fork that derives from earlier Audacity codebase versions and has since merged in other notable Audacity forks.$q$, $q$It supports VST, LV2, and AU plugins, audio up to 32-bit float, scripting through Nyquist, Python, and Perl, and includes accessibility features such as keyboard editing and screen reader support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$who-its-for$q$, $q$Who Tenacity is for$q$, 2, ARRAY[$q$Tenacity suits podcasters, audio editors, and developers who want a free, open-source, scriptable multi-track audio editor with strong accessibility support across Windows, macOS, Linux, and BSD.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── GIMP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GIMP is a free, open-source image editor for photo retouching, illustration, and graphic design on Linux, macOS, and Windows.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GIMP is a free, open-source image editor (GPLv3) for photo retouching, artwork, and graphic design on Linux, macOS, and Windows.$q$,
  og_description = $q$GIMP is a free, open-source image editor (GPLv3) for photo retouching, artwork, and graphic design on Linux, macOS, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05fd9154-b81e-4108-87a9-fd64b03f828c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05fd9154-b81e-4108-87a9-fd64b03f828c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Photo manipulation and retouching$q$, $q$Provides high-quality tools for retouching and manipulating photographs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Original artwork creation$q$, $q$Includes tools for creating original digital artwork from scratch.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Graphic design elements$q$, $q$Produces graphic design elements such as icons and UI mockups.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Scripted image manipulation$q$, $q$Offers a scripting framework for automating image manipulation tasks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Color management$q$, $q$Supports color management workflows for both digital and print media.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Extensibility$q$, $q$Extensible through C, C++, Python, and Scheme scripting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Free and open source under the GPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Available on Linux, macOS, and Windows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Extensible via C, C++, Python, and Scheme scripting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Includes color management for print and digital workflows$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Actively developed, with version 3.2.4 released in April 2026$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Primarily raster-based, with no native vector drawing tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$No official mobile app$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Community-supported with no dedicated commercial support contract$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Is GIMP free?$q$, $q$Yes, GIMP is free software licensed under the GNU General Public License v3, and users can modify and redistribute the source code.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$What platforms does GIMP support?$q$, $q$GIMP runs on GNU/Linux, macOS, Windows, and other operating systems.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Can GIMP be scripted?$q$, $q$Yes, GIMP supports scripting and extensibility through C, C++, Python, and Scheme.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$What is the latest version of GIMP?$q$, $q$As of this listing, the current version is 3.2.4, released in April 2026.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Photo retouching$q$, $q$Retouches and manipulates photographs using GIMP's editing tools.$q$, $q$Photographers and photo editors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Digital artwork creation$q$, $q$Creates original illustrations and artwork from scratch.$q$, $q$Digital artists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$Graphic design and UI mockups$q$, $q$Produces icons, UI mockups, and other design elements.$q$, $q$Graphic and UI designers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$GIMP$q$, $q$Free$q$, NULL, $q$["Full image editing application","Scripting and extensibility","Color management support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$overview$q$, $q$What is GIMP?$q$, 2, ARRAY[$q$GIMP (GNU Image Manipulation Program) is a free and open-source image editor for photo retouching, original artwork, and graphic design, licensed under the GPLv3. It runs on GNU/Linux, macOS, Windows, and other operating systems.$q$, $q$GIMP includes a scripting framework and can be extended using C, C++, Python, and Scheme, alongside color management support for both digital and print output.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', $q$who-its-for$q$, $q$Who GIMP is for$q$, 2, ARRAY[$q$GIMP is built for photographers, digital artists, and designers who want a free, open-source, cross-platform alternative for photo editing, artwork creation, and graphic design work.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05fd9154-b81e-4108-87a9-fd64b03f828c', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Krita ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Krita is a free, open-source digital painting program for illustration and animation on Windows, macOS, and Linux.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Japanese$q$, $q$Chinese$q$, $q$Arabic$q$]::text[],
  seo_meta_description = $q$Krita is a free, open-source digital painting program with brush engines, animation tools, and a 23-language interface.$q$,
  og_description = $q$Krita is a free, open-source digital painting program with brush engines, animation tools, and a 23-language interface.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4d6dd956-9199-4e06-b14d-777578701617';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4d6dd956-9199-4e06-b14d-777578701617' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Multiple brush engines$q$, $q$Offers a variety of brush types for different painting and illustration styles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Layers, assistants, and stabilizers$q$, $q$Includes layer management, drawing assistants, and brush stabilizers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Animation tools$q$, $q$Provides built-in tools for creating frame-based animation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Customizable brushes and libraries$q$, $q$Lets users customize brushes, patterns, and vector libraries.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Plugin support$q$, $q$Extends functionality through plugins.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Free and open source (GNU GPL) with no functional paywall on the direct download$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Available on Windows, macOS, and Linux$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Interface translated into 23 languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Includes built-in animation tools alongside painting features$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Extensible through plugins$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Steam and Windows Store editions cost $9.99, though the same software is free from the official site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Funded through a voluntary contributions model rather than commercial licensing revenue$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Primarily focused on painting/illustration rather than photo editing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Is Krita free?$q$, $q$Yes, Krita is free and open-source software (GNU GPL) when downloaded directly from krita.org.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Why does Krita cost money on Steam or the Windows Store?$q$, $q$Buying Krita on Steam or the Windows Store for $9.99 is an optional way to support development and get conveniences like automatic updates; the software itself is free from the official website.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$What platforms does Krita support?$q$, $q$Krita is available for Windows, macOS, and Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$How many languages does Krita support?$q$, $q$Krita's interface is translated into 23 languages, including English, German, French, Spanish, Japanese, Chinese, and Arabic.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Digital painting and illustration$q$, $q$Creates illustrations using multiple brush engines and drawing assistants.$q$, $q$Digital painters and illustrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Animation$q$, $q$Produces frame-based animation using Krita's built-in animation tools.$q$, $q$Animators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Comic and concept art$q$, $q$Uses layers, brush stabilizers, and vector libraries for comic and concept art.$q$, $q$Comic artists and concept artists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Direct Download$q$, $q$Free$q$, NULL, $q$["Full application","All painting and animation features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$Steam / Windows Store Edition$q$, $q$$9.99$q$, NULL, $q$["Same software as the free download","Automatic updates","Convenient installation via the store"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$overview$q$, $q$What is Krita?$q$, 2, ARRAY[$q$Krita is a free and open-source digital painting program made by artists who want affordable art tools for everyone. It is licensed under the GNU GPL and powered by the KDE community.$q$, $q$Krita is available for Windows, macOS, and Linux with an interface translated into 23 languages. The same software is also sold on Steam and the Windows Store for $9.99 as an optional way to support development and get automatic updates.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', $q$who-its-for$q$, $q$Who Krita is for$q$, 2, ARRAY[$q$Krita is aimed at digital painters, illustrators, and animators who want a free, full-featured, cross-platform painting application without licensing costs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4d6dd956-9199-4e06-b14d-777578701617', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Inkscape ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Inkscape is a free, open-source vector graphics editor for illustrations, logos, and diagrams using the SVG format.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Inkscape is a free, open-source vector graphics editor (GPL) with native SVG support for illustrations, logos, and diagrams.$q$,
  og_description = $q$Inkscape is a free, open-source vector graphics editor (GPL) with native SVG support for illustrations, logos, and diagrams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c4dd8f19-6a19-464f-aa03-b7df8213b789';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c4dd8f19-6a19-464f-aa03-b7df8213b789' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Vector shape tools$q$, $q$Renders primitive vector shapes including rectangles, ellipses, polygons, arcs, spirals, stars, and 3D boxes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Bezier and calligraphy drawing$q$, $q$Creates Bezier curves, freehand pencil lines, and calligraphic brush-like strokes with graphics tablet support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Image tracing$q$, $q$Extracts vector graphics from raster images through image tracing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Native SVG format$q$, $q$Uses Scalable Vector Graphics (SVG) as its native file format for sharp output at any resolution.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Broad import/export support$q$, $q$Imports and exports formats including Adobe Illustrator (AI), EPS, PDF, PS, and PNG.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Extensibility$q$, $q$Supports add-ons to extend and customize functionality.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Free and open source under GPL 2.0 or later$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Native SVG format for resolution-independent output$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Available on GNU/Linux, Windows, and macOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Extensible through add-ons$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Broad file format import/export support (AI, EPS, PDF, PS, PNG)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$No built-in raster photo editing tools (vector-only)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Community-maintained with no dedicated commercial support contract$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$No official mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Is Inkscape free?$q$, $q$Yes, Inkscape is free and open-source software released under the GPL 2.0-or-later license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$What platforms does Inkscape support?$q$, $q$Inkscape runs on GNU/Linux, Windows, and macOS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$What file format does Inkscape use?$q$, $q$Inkscape uses SVG (Scalable Vector Graphics) as its main format and can import/export AI, EPS, PDF, PS, and PNG files.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Can Inkscape trace raster images into vectors?$q$, $q$Yes, Inkscape supports image tracing to extract vector graphics from raster image sources.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Logo and icon design$q$, $q$Creates scalable logos and icons using vector shape and Bezier tools.$q$, $q$Graphic designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Technical illustration and diagrams$q$, $q$Produces diagrams and flowcharts with precise vector drawing tools.$q$, $q$Technical illustrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Raster-to-vector conversion$q$, $q$Converts scanned or raster artwork into editable vector graphics via image tracing.$q$, $q$Illustrators and artists$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$Inkscape$q$, $q$Free$q$, NULL, $q$["Full vector graphics editor","Native SVG support","Image tracing"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$overview$q$, $q$What is Inkscape?$q$, 2, ARRAY[$q$Inkscape is a free and open-source vector graphics editor for GNU/Linux, Windows, and macOS, released under the GPL 2.0-or-later license. It uses SVG as its native file format for artistic and technical illustrations such as logos, icons, and diagrams.$q$, $q$The editor includes tools for vector shapes, Bezier curves, calligraphic strokes, and image tracing, along with import/export support for AI, EPS, PDF, PS, and PNG formats.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', $q$who-its-for$q$, $q$Who Inkscape is for$q$, 2, ARRAY[$q$Inkscape suits graphic designers, illustrators, and technical artists who want a free, open-source, SVG-native vector editor for logos, icons, and diagrams across Linux, Windows, and macOS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4dd8f19-6a19-464f-aa03-b7df8213b789', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Scribus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Scribus is a free, open-source desktop publishing app for professional page layout, typesetting, and print-ready PDFs.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2001,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Scribus is free, open-source desktop publishing software for page layout, CMYK printing, and interactive PDFs on Linux, macOS, and Windows.$q$,
  og_description = $q$Scribus is free, open-source desktop publishing software for page layout, CMYK printing, and interactive PDFs on Linux, macOS, and Windows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '89f1086c-860a-4405-8ba6-cdbbeb21675a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '89f1086c-860a-4405-8ba6-cdbbeb21675a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$CMYK & ICC color management$q$, $q$Built-in support for CMYK color and ICC color profiles for professional print output.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Python scripting$q$, $q$A built-in Python scripting engine for automating layout tasks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Wide format import$q$, $q$Imports major bitmap formats (TIFF, JPEG, PSD) and vector formats (EPS, SVG, Adobe Illustrator files).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Advanced typography$q$, $q$Recent versions (1.6.0+) add footnotes, endnotes, text variables, cross-references, and orphan/widow control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Interactive & animated PDFs$q$, $q$Can produce animated and interactive PDF documents in addition to standard print-ready files.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Multi-language interface$q$, $q$The application interface is translated into 60 languages.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Runs natively on Linux/Unix, macOS, Windows, and BSD variants$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Professional print features like CMYK and ICC color management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Built-in Python scripting for automation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Translated into 60 languages$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Steeper learning curve than mainstream commercial DTP tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$No official cloud storage or real-time collaboration features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Interface feels dated compared to modern design apps$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Is Scribus free?$q$, $q$Yes, Scribus is free and open-source software with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$What license does Scribus use?$q$, $q$It is released under the GNU LGPL 2.1, with some components under MIT, 3-clause BSD, and public domain licenses.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$What platforms does Scribus support?$q$, $q$Linux/Unix, macOS, Windows, BSD variants, and OS/2/ArcaOS, with support varying by version.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Can Scribus create interactive PDFs?$q$, $q$Yes, per its own documentation it supports animated and interactive PDF creation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Print publication layout$q$, $q$Laying out books, magazines, and brochures for professional printing with CMYK and ICC color accuracy.$q$, $q$Independent publishers and print designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$Open-source alternative to InDesign$q$, $q$A no-cost desktop publishing option for teams that can't justify a commercial DTP license.$q$, $q$Nonprofits and budget-conscious design teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$overview$q$, $q$What is Scribus?$q$, 2, ARRAY[$q$Scribus is a free and open-source desktop publishing (DTP) application used for page layout, typesetting, and preparing files for professional printing.$q$, $q$It supports CMYK color, ICC color management, and a wide range of import formats, and includes a built-in Python scripting engine for automating repetitive layout work.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', $q$who-its-for$q$, $q$Who Scribus is for$q$, 2, ARRAY[$q$Scribus suits independent publishers, print designers, and organizations that need professional page-layout capabilities without a commercial software subscription.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89f1086c-860a-4405-8ba6-cdbbeb21675a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Pencil Project ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pencil Project is a free, open-source GUI prototyping tool for building wireframes and UI mockups on desktop.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pencil Project is a free, open-source GUI prototyping and wireframing tool with stencil libraries for Windows, macOS, and Linux.$q$,
  og_description = $q$Pencil Project is a free, open-source GUI prototyping and wireframing tool with stencil libraries for Windows, macOS, and Linux.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '00563610-94ad-4982-9919-0d497b31162d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '00563610-94ad-4982-9919-0d497b31162d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Stencil libraries$q$, $q$Ships with stencil collections for frameworks and design systems such as Android, Bootstrap, and Material Design.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Cross-platform desktop app$q$, $q$Available on GNU/Linux, macOS (OS X), and Windows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Community stencil packs$q$, $q$Extensible through community-contributed stencils for additional UI frameworks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$GUI prototyping and mockups$q$, $q$Provides a desktop GUI for building wireframes and interactive mockups.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Completely free with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Open source under GPLv2$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Extensible through community stencil packs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Cross-platform support for Linux, macOS, and Windows$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Latest stable release (3.1.1) dates to January 2023, indicating a slow development pace$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Fewer real-time collaboration or cloud features than newer prototyping tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Development roadmap for Pencil V3 has lagged its own stated timeline$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Is Pencil Project free?$q$, $q$Yes, it is completely free and open source, released under GPLv2.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Is Pencil Project actively maintained?$q$, $q$Its GitHub repository remains open (not archived), but the latest stable release, 3.1.1, was published in January 2023.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$What platforms does Pencil Project support?$q$, $q$It runs on GNU/Linux, macOS, and Windows as a desktop application.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Rapid UI wireframing$q$, $q$Sketching interactive wireframes and mockups using built-in and community stencils.$q$, $q$Developers and designers prototyping desktop or web UIs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$Teaching UX/UI design$q$, $q$A no-cost tool for learning prototyping fundamentals.$q$, $q$Students and educators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$overview$q$, $q$What is Pencil Project?$q$, 2, ARRAY[$q$Pencil Project is a free and open-source GUI prototyping tool for creating mockups and wireframes on desktop platforms, maintained by Evolus.$q$, $q$It includes built-in and community-contributed stencil libraries for frameworks like Bootstrap, Material Design, and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('00563610-94ad-4982-9919-0d497b31162d', $q$who-its-for$q$, $q$Who Pencil Project is for$q$, 2, ARRAY[$q$It suits developers, designers, and students who want a free, no-account desktop wireframing tool rather than a paid cloud prototyping suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00563610-94ad-4982-9919-0d497b31162d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00563610-94ad-4982-9919-0d497b31162d', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00563610-94ad-4982-9919-0d497b31162d', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00563610-94ad-4982-9919-0d497b31162d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('00563610-94ad-4982-9919-0d497b31162d', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Vectr ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vectr is a browser-based vector graphics editor with AI-assisted tools for creating logos, icons, and illustrations.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$1.99/month (Plus plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vectr is an online vector graphics editor with AI logo, background-removal, and image-to-vector tools plus real-time collaboration.$q$,
  og_description = $q$Vectr is an online vector graphics editor with AI logo, background-removal, and image-to-vector tools plus real-time collaboration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a4586b52-247b-4d12-87eb-3ffa94cf6ee5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a4586b52-247b-4d12-87eb-3ffa94cf6ee5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$AI-powered tools$q$, $q$Includes background removal, JPG/PNG-to-SVG conversion, text-to-image generation, and logo creation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Real-time collaboration$q$, $q$Live workspace sharing with an integrated chat for team projects.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Cross-device cloud sync$q$, $q$Designs sync across devices via the cloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Multi-format export$q$, $q$Exports to SVG, PNG, JPG, EPS, AI, PDF, and SVGZ.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Browser-based editor$q$, $q$Runs in the browser, with Chrome noted as most compatible.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Runs entirely in the browser with no install required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Includes AI-assisted design tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Real-time multi-user collaboration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Large built-in asset library (23,000+ design elements per Vectr's site)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$No longer offers a permanently free plan; a paid subscription is required$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$AI features are metered by credits rather than unlimited$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Some export formats (EPS, AI, PDF, SVGZ) may require credits$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Is Vectr free?$q$, $q$No. Vectr currently operates on paid Plus and Premium subscription plans rather than a free-forever tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$What does the Plus plan include?$q$, $q$1 GB of storage, AI credits, access to 23,000+ design elements, and single-session access, according to Vectr's pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$What export formats does Vectr support?$q$, $q$SVG, PNG, JPG, EPS, AI, PDF, and SVGZ.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Quick logo and icon design$q$, $q$Creating logos, icons, and simple graphics directly in the browser.$q$, $q$Small business owners and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Team vector design collaboration$q$, $q$Co-editing vector graphics in real time with a shared workspace.$q$, $q$Small design teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Plus$q$, $q$$1.99/month$q$, $q$monthly$q$, $q$["1 GB storage","AI credits","23,000+ design elements","Single session access","SVG/PNG/JPG/VECTR export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$Premium$q$, $q$$4.99/month$q$, $q$monthly$q$, $q$["5 GB storage","More AI credits","3 concurrent sessions","Priority support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$overview$q$, $q$What is Vectr?$q$, 2, ARRAY[$q$Vectr is a cloud-based vector graphics editor for creating and converting logos, icons, and illustrations directly in the browser.$q$, $q$It combines a standard SVG editor (shapes, paths, text) with AI-powered tools such as background removal and image-to-vector conversion, plus real-time collaboration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', $q$who-its-for$q$, $q$Who Vectr is for$q$, 2, ARRAY[$q$It targets small businesses, freelancers, and small design teams who want a browser-based vector editor with AI assistance rather than installing desktop software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a4586b52-247b-4d12-87eb-3ffa94cf6ee5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Boxy SVG ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Boxy SVG is a proprietary vector graphics editor for creating SVG illustrations, icons, and logos, offered as web and desktop apps.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Boxy SVG is a vector graphics editor for SVG illustrations, logos, and icons, with direct XML editing and apps for Windows, macOS, Linux, and ChromeOS.$q$,
  og_description = $q$Boxy SVG is a vector graphics editor for SVG illustrations, logos, and icons, with direct XML editing and apps for Windows, macOS, Linux, and ChromeOS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e093e26f-1179-4cad-b7f0-010ea97f3788';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e093e26f-1179-4cad-b7f0-010ea97f3788' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Direct XML editing$q$, $q$An Elements panel allows editing the underlying SVG/XML markup directly.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Bitmap-to-vector tracing$q$, $q$Converts raster images into vector shapes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$SVG filter effects$q$, $q$Full SVG filter effects support with predefined presets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Design service integrations$q$, $q$Built-in access to Google Fonts, Pixabay, and Color Hunt.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Procedural shape tools$q$, $q$Includes procedural shapes like cogwheels and crosses alongside standard geometric tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Cross-platform availability$q$, $q$Available as a web app and as native desktop apps for Windows, macOS, Linux, and ChromeOS.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Deep, standards-compliant SVG/XML editing not common in mainstream vector tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Works as both a web app and a native desktop app across four platforms$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Built-in font, stock image, and color-palette integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$In active development since its first release in March 2013$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Proprietary software, not open source$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Requires payment after the free trial period$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Smaller plugin/community ecosystem than Adobe Illustrator or Inkscape$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Is Boxy SVG free?$q$, $q$Boxy SVG offers a free trial; continued use requires a paid license or subscription.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$What platforms does Boxy SVG run on?$q$, $q$It's available as a web app and as desktop apps for Windows, macOS, Linux, and ChromeOS.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Who created Boxy SVG?$q$, $q$It was created by developer Jarosław Foksa, with a first release in March 2013.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Editing raw SVG code visually$q$, $q$Working directly with SVG markup through a visual editor and XML panel.$q$, $q$Web developers and icon designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$Creating logos and illustrations$q$, $q$Building vector logos, icons, and illustrations with procedural shape tools.$q$, $q$Freelance and independent designers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$overview$q$, $q$What is Boxy SVG?$q$, 2, ARRAY[$q$Boxy SVG is a proprietary vector graphics editor focused on SVG file creation and editing, offering both a web app and native desktop apps.$q$, $q$It combines standard vector drawing tools with direct XML/markup editing, bitmap tracing, and filter-effects support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', $q$who-its-for$q$, $q$Who Boxy SVG is for$q$, 2, ARRAY[$q$It suits web developers and designers who need precise control over SVG markup alongside a visual vector editing experience.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e093e26f-1179-4cad-b7f0-010ea97f3788', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Excalidraw ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Excalidraw is a free, open-source virtual whiteboard for hand-drawn style diagrams and wireframes with real-time collaboration.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$7/month (Excalidraw+, monthly; $6/month billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Excalidraw is a free, open-source hand-drawn style whiteboard for diagrams and wireframes, with real-time collaboration under the MIT license.$q$,
  og_description = $q$Excalidraw is a free, open-source hand-drawn style whiteboard for diagrams and wireframes, with real-time collaboration under the MIT license.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3ca5270f-e111-4975-805d-895270a05cb1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3ca5270f-e111-4975-805d-895270a05cb1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Hand-drawn style canvas$q$, $q$An infinite canvas with a distinctive hand-drawn visual style for diagrams and sketches.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Real-time collaboration$q$, $q$End-to-end encrypted collaborative editing via shareable links.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Flexible export$q$, $q$Export to PNG, SVG, clipboard, or the native .excalidraw JSON format.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Offline PWA support$q$, $q$Installable as a Progressive Web App with local-first autosave.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Generative AI tools$q$, $q$Includes text-to-diagram and wireframe-to-code AI features.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Shape libraries & dark mode$q$, $q$Supports importable shape libraries and a dark mode interface.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$MIT-licensed and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$No account required to start drawing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$End-to-end encrypted real-time collaboration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Used by companies including Google Cloud, Meta, Notion, and Replit, per Excalidraw's own site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Advanced team, presentation, and cloud-workspace features require the paid Excalidraw+ tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$The free version relies on browser local storage, which can be cleared unexpectedly if drawings aren't exported$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Is Excalidraw free?$q$, $q$Yes, the core Excalidraw editor is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$What is Excalidraw+?$q$, $q$A paid tier adding extended team collaboration, live presentations, cloud workspace management, and upgraded generative AI, with a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$How much does Excalidraw+ cost?$q$, $q$$7/month billed monthly, or $6/month billed annually, according to its pricing page.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Does Excalidraw require an account?$q$, $q$No, the free web app can be used without signing up.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Quick collaborative sketches and wireframes$q$, $q$Sketching diagrams and wireframes together in real time.$q$, $q$Product and design teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Embedding whiteboarding in other products$q$, $q$Using the open-source Excalidraw library to add drawing canvases to other apps.$q$, $q$Developers building on Excalidraw$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$Excalidraw+$q$, $q$$7/month monthly or $6/month annual$q$, $q$monthly$q$, $q$["Extended team collaboration","Live presentations","Cloud workspace management","Upgraded generative AI","14-day free trial"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$overview$q$, $q$What is Excalidraw?$q$, 2, ARRAY[$q$Excalidraw is a free, open-source virtual whiteboard for creating diagrams, wireframes, and sketches with a distinctive hand-drawn look.$q$, $q$It supports real-time, end-to-end encrypted collaboration and can be extended through a paid Excalidraw+ tier for teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', $q$who-its-for$q$, $q$Who Excalidraw is for$q$, 2, ARRAY[$q$It suits individuals and teams who want a lightweight, no-account whiteboard for quick diagrams, plus developers who embed its open-source library into their own products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3ca5270f-e111-4975-805d-895270a05cb1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── tldraw ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$tldraw is a free, instant collaborative online whiteboard, built on an infinite-canvas engine also licensable as an SDK.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$tldraw is a free, instant collaborative online whiteboard; its infinite-canvas engine is also available as an SDK for developers.$q$,
  og_description = $q$tldraw is a free, instant collaborative online whiteboard; its infinite-canvas engine is also available as an SDK for developers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3f6cc024-9f36-451d-b9e9-a8bc13712e95';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3f6cc024-9f36-451d-b9e9-a8bc13712e95' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Free collaborative whiteboard$q$, $q$An instant, free whiteboard usable directly at tldraw.com.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Infinite canvas engine$q$, $q$A feature-complete infinite canvas engine underlies the product.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$tldraw SDK$q$, $q$The underlying engine is available separately as an SDK for developers to build custom canvas apps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Multiplayer sync$q$, $q$Real-time multiplayer collaboration via the @tldraw/sync package, which supports self-hosted syncing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Embedded content support$q$, $q$Can embed content from sources like YouTube, Figma, and GitHub.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Free to use directly as a whiteboard at tldraw.com$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Highly extensible SDK for developers building custom canvas tools, shapes, and bindings$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Real-time multiplayer collaboration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Adopted by companies including Google, Shopify, and Autodesk to build canvas features, per tldraw's own site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$The underlying SDK is source-available rather than fully open source — production use requires a paid commercial license or a free 'Hobby' license that must display a watermark$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Commercial SDK licensing pricing is custom-quoted and not publicly listed$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Is tldraw free?$q$, $q$The hosted whiteboard at tldraw.com is free to use. The separate tldraw SDK is free for development and non-commercial 'Hobby' use (with a watermark) but requires a paid commercial license for production business use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Is the tldraw SDK open source?$q$, $q$No. It is source-available under a custom license that restricts production deployment without a license key.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Can tldraw's sync be self-hosted?$q$, $q$Yes, the SDK's @tldraw/sync package supports self-hosted real-time syncing, according to tldraw's documentation.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Quick online whiteboarding$q$, $q$Sketching and diagramming together in a free browser-based whiteboard.$q$, $q$Teams and individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$Embedding a canvas editor into a product$q$, $q$Licensing the tldraw SDK to add an infinite-canvas editor to a commercial application.$q$, $q$Developers and product teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$overview$q$, $q$What is tldraw?$q$, 2, ARRAY[$q$tldraw is a free, instant collaborative online whiteboard for sketching and diagramming.$q$, $q$Its underlying infinite-canvas engine is also distributed as the tldraw SDK, a source-available library developers can license to build their own canvas applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', $q$who-its-for$q$, $q$Who tldraw is for$q$, 2, ARRAY[$q$It suits teams that want a free instant whiteboard, and developers who license the SDK to embed canvas functionality into their own products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3f6cc024-9f36-451d-b9e9-a8bc13712e95', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── WBO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WBO (Whiteboard) is a free, open-source real-time collaborative online whiteboard that can be used publicly or self-hosted.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$WBO is a free, open-source AGPL-licensed collaborative online whiteboard with public, private, and custom-named boards.$q$,
  og_description = $q$WBO is a free, open-source AGPL-licensed collaborative online whiteboard with public, private, and custom-named boards.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6dfb48ec-e418-4fe0-93c7-9323f4ba54ce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6dfb48ec-e418-4fe0-93c7-9323f4ba54ce' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Real-time synchronization$q$, $q$All connected participants see drawing updates synchronized live.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Persistent boards$q$, $q$Board state is automatically saved.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Public shared board$q$, $q$A public workspace supports anonymous collaboration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Private boards$q$, $q$Private boards use random or custom-named URLs for restricted sharing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Multi-language support$q$, $q$Available in 20+ languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Self-hostable$q$, $q$Source code is available on GitHub for self-hosting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Completely free and open source (AGPL license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$No account or install required — works in any browser$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Can be self-hosted for private or internal use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Supports 20+ languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$The public board is open to anonymous users, so it isn't suited for sensitive content without using a private board$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Feature set is limited compared to full design/whiteboard suites$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$No official native mobile app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Is WBO free?$q$, $q$Yes, WBO is free and open-source software released under the AGPL license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Can I self-host WBO?$q$, $q$Yes, its source code is available on GitHub for self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Do I need an account to use WBO?$q$, $q$No, boards can be created and shared via URL without an account.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Quick anonymous sketching sessions$q$, $q$Sharing a board URL for spontaneous, no-signup collaborative drawing.$q$, $q$Teachers and remote teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$Private team whiteboarding$q$, $q$Using private or self-hosted boards for internal collaboration.$q$, $q$Small teams needing a lightweight self-hosted whiteboard$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$overview$q$, $q$What is WBO?$q$, 2, ARRAY[$q$WBO is a free, open-source online whiteboard that lets multiple users draw together in real time on a shared canvas.$q$, $q$It offers a public anonymous board as well as private boards with random or custom URLs, and its source code is available for self-hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', $q$who-its-for$q$, $q$Who WBO is for$q$, 2, ARRAY[$q$It suits teachers, remote teams, and anyone who wants a no-signup collaborative whiteboard, plus organizations that prefer to self-host it.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6dfb48ec-e418-4fe0-93c7-9323f4ba54ce', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Drawpile ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Drawpile is a free, open-source app for real-time collaborative drawing, painting, and animation on a shared canvas.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Drawpile is a free, open-source GPLv3 collaborative drawing app for Windows, macOS, Linux, Android, and the web.$q$,
  og_description = $q$Drawpile is a free, open-source GPLv3 collaborative drawing app for Windows, macOS, Linux, Android, and the web.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Real-time collaborative canvas$q$, $q$Multiple people can draw, sketch, paint, and animate on the same canvas simultaneously.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Autorecovery$q$, $q$Automatically recovers work after an unexpected exit.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Timelapse export$q$, $q$Can create timelapse/speedpaint videos of a drawing session.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Animation tools$q$, $q$Includes timeline-based animation features.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Brush stabilizer$q$, $q$Offers brush stroke previews and stabilizer adjustments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Self-hostable server$q$, $q$Includes a dedicated server component (drawpile-srv) for self-hosting sessions.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Free and open source under the GPLv3 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Available on Windows, macOS, Linux, Android, and via browser$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Can run a self-hosted server for private sessions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Includes animation and timelapse export tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$No native iOS app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Real-time drawing requires a stable connection to a session server$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Smaller plugin/brush ecosystem than commercial tools like Procreate$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Is Drawpile free?$q$, $q$Yes, Drawpile is free and open source under the GPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$What platforms does Drawpile support?$q$, $q$Windows, macOS, Linux, Android, and a browser-based web version.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Can I host my own Drawpile server?$q$, $q$Yes, Drawpile includes a dedicated server component (drawpile-srv) for self-hosting sessions.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Collaborative digital painting sessions$q$, $q$Drawing and painting together in real time on a shared canvas.$q$, $q$Artists and illustration groups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$Teaching or streaming live drawing$q$, $q$Using the shared canvas and timelapse export for tutorials or streams.$q$, $q$Art educators and streamers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$overview$q$, $q$What is Drawpile?$q$, 2, ARRAY[$q$Drawpile is a free, open-source collaborative drawing program that lets multiple people draw, sketch, paint, and animate on the same canvas at the same time.$q$, $q$It's available on Windows, macOS, Linux, Android, and through a web browser, and includes a self-hostable dedicated server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', $q$who-its-for$q$, $q$Who Drawpile is for$q$, 2, ARRAY[$q$It suits artists and groups who want to paint or sketch together live, as well as educators and streamers demonstrating drawing techniques.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24cc901e-5be4-49f1-a1da-9b6b8e0ccdd4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Diagrams.net ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$diagrams.net (draw.io) is a free, open-source diagramming tool for flowcharts, org charts, and UML, with no sign-up required.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2005,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$draw.io (diagrams.net) is a free, open-source diagramming app with real-time collaboration and integrations for Confluence, Jira, and Google Drive.$q$,
  og_description = $q$draw.io (diagrams.net) is a free, open-source diagramming app with real-time collaboration and integrations for Confluence, Jira, and Google Drive.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af654930-837f-40c8-b359-6e2d826ad6ff';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af654930-837f-40c8-b359-6e2d826ad6ff' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Real-time collaboration$q$, $q$Collaborative editing with shared cursors.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Bring-your-own storage$q$, $q$Diagrams can be stored in Google Drive, OneDrive, SharePoint, or locally; draw.io states it cannot access that data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Productivity tool integrations$q$, $q$Native integrations with Confluence, Jira, GitHub, VS Code, Microsoft Teams, and Notion.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Desktop application$q$, $q$Available as a desktop app in addition to the web app.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Long-term backward compatibility$q$, $q$Diagrams created since 2005 continue to open in the current app.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Self-hostable$q$, $q$An official Docker image (jgraph/drawio) lets teams run draw.io entirely on their own infrastructure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Completely free with no sign-up required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Open source under the Apache 2.0 license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Deep integrations with Atlassian, Microsoft, and Google productivity tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Can be fully self-hosted via an official Docker image$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Users control where diagram data is stored$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$The Confluence/Jira marketplace app is a separately licensed Atlassian add-on rather than part of the free base app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Interface polish can feel less refined than dedicated paid diagramming tools for advanced enterprise workflows$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Is diagrams.net free?$q$, $q$Yes. Its homepage states it is 'Free forever' and open source, with no sign-up required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$What license is draw.io released under?$q$, $q$Apache 2.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Where is my diagram data stored?$q$, $q$Users choose their own storage — Google Drive, OneDrive, SharePoint, or a local device — and draw.io states it cannot access that data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Does draw.io integrate with Confluence and Jira?$q$, $q$Yes, alongside Google Drive, Microsoft 365, GitHub, VS Code, and Notion.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Can draw.io be self-hosted?$q$, $q$Yes, an official Docker image (jgraph/drawio) is available for running it on your own infrastructure.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Flowcharts and org charts$q$, $q$Building flowcharts, org charts, and network diagrams for business documentation.$q$, $q$Business analysts and project managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$Embedding diagrams in team docs$q$, $q$Inserting live diagrams inside Confluence, Jira, or Notion pages via native integrations.$q$, $q$Engineering and product teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$overview$q$, $q$What is diagrams.net?$q$, 2, ARRAY[$q$diagrams.net, also known as draw.io, is a free and open-source diagramming application for flowcharts, org charts, network diagrams, and UML.$q$, $q$It emphasizes data privacy by letting users store diagrams in their own Google Drive, OneDrive, SharePoint, or local storage, and integrates natively with tools like Confluence, Jira, and GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', $q$who-its-for$q$, $q$Who diagrams.net is for$q$, 2, ARRAY[$q$It suits teams and individuals who need a free, privacy-conscious diagramming tool that plugs directly into their existing documentation and project-management tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af654930-837f-40c8-b359-6e2d826ad6ff', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── PlantUML ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$PlantUML is a free, open-source tool that generates UML and other diagrams from simple text descriptions.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$PlantUML is a free, open-source text-to-diagram tool for UML, Gantt charts, and mind maps, offered under several open-source licenses.$q$,
  og_description = $q$PlantUML is a free, open-source text-to-diagram tool for UML, Gantt charts, and mind maps, offered under several open-source licenses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea83f533-2784-47e9-b55f-e37f270b013d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea83f533-2784-47e9-b55f-e37f270b013d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Text-based diagramming$q$, $q$Diagrams are generated from simple textual descriptions instead of manual drag-and-drop drawing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$9 standard UML diagram types$q$, $q$Sequence, use case, class, activity, component, deployment, state, object, and timing diagrams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$15+ non-UML diagram types$q$, $q$Also generates Gantt charts, mind maps, network diagrams, wireframes, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Multiple layout engines$q$, $q$Supports Graphviz, Smetana, VizJs, and ELK for diagram layout.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Flexible export$q$, $q$Exports to PNG, SVG, LaTeX, EPS, and ASCII art.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Documentation integrations$q$, $q$Integrates with tools like DokuWiki, AsciiDoc, and Markdown, plus browser extensions for GitHub.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Completely free, released under a choice of open-source licenses (GPL, LGPL, MIT, Apache 2.0, BSD, EPL)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Diagrams are defined as plain text, making them version-control friendly$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Broad diagram-type support well beyond standard UML$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Can be self-hosted via a local server/jar file or used through an online server$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Requires learning PlantUML's own text syntax rather than drag-and-drop drawing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$The default Graphviz-based renderer can require extra setup and dependencies$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Visual styling is more limited than dedicated drag-and-drop diagram tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Is PlantUML free?$q$, $q$Yes, PlantUML is free and open source, offered under several license options including GPL, LGPL, MIT, and Apache 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$What kinds of diagrams can PlantUML create?$q$, $q$9 standard UML diagram types plus 15+ non-UML diagrams such as Gantt charts, mind maps, and network diagrams.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Can PlantUML be self-hosted?$q$, $q$Yes, it can run as a local server or jar file in addition to using PlantUML's hosted online server.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Documentation-as-code diagramming$q$, $q$Keeping architecture and sequence diagrams as version-controlled text alongside source code.$q$, $q$Software engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$Technical documentation diagrams$q$, $q$Generating UML and Gantt-style diagrams for technical documents.$q$, $q$Technical writers and software architects$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$overview$q$, $q$What is PlantUML?$q$, 2, ARRAY[$q$PlantUML is a free, open-source tool that turns simple text descriptions into UML and other diagram types, including sequence, class, and activity diagrams.$q$, $q$It also supports many non-UML diagram formats such as Gantt charts, mind maps, and network diagrams, and can be self-hosted or used via its online server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', $q$who-its-for$q$, $q$Who PlantUML is for$q$, 2, ARRAY[$q$It suits software engineers and technical writers who prefer defining diagrams as text — for example, to keep them under version control alongside code — rather than drawing them manually.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea83f533-2784-47e9-b55f-e37f270b013d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── D2 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$D2 is an open-source diagram scripting language that turns text into SVG, PNG, or PDF diagrams.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$D2 is a free, open-source text-to-diagram language with themes, animations, and multiple layout engines. MPL-2.0 licensed.$q$,
  og_description = $q$D2 is a free, open-source text-to-diagram language with themes, animations, and multiple layout engines. MPL-2.0 licensed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8f5095fd-2fe0-49e0-936e-9bb82f1c6752';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8f5095fd-2fe0-49e0-936e-9bb82f1c6752' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Text-to-diagram language$q$, $q$Write diagrams as declarative text and D2 renders them into SVG, PNG, or PDF output.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Multiple layout engines$q$, $q$Choose between Dagre (default), ELK, and TALA layout engines for different diagram styles.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Production-ready themes$q$, $q$Ships with designer-made themes suitable for blogs, wikis, and presentations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Animated diagrams$q$, $q$Can produce animated diagrams directly from text definitions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$UML and sequence diagrams$q$, $q$Supports UML class diagrams and sequence diagrams in addition to general graphs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Editor tooling$q$, $q$Official language support for VSCode, Vim, and Obsidian with syntax highlighting and autoformatting.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Online playground$q$, $q$play.d2lang.com lets users write and share diagrams without installing anything.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Fully free and open source under MPL-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Runs entirely offline with no telemetry after installation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Multiple layout engines give control over diagram style$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Active project with 24.7k GitHub stars and used by projects like Sourcegraph and Temporal$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Available via Homebrew, Winget, and other major package managers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Requires learning a diagram-specific text syntax$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$No official hosted/paid product beyond the free CLI and playground$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Command-line first workflow may be less approachable for non-developers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Is D2 free to use?$q$, $q$Yes, D2 is open-source software licensed under MPL-2.0 and is free to install and use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Who created D2?$q$, $q$D2 was created by Terrastruct, Inc.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$What output formats does D2 support?$q$, $q$D2 can export diagrams as SVG, PNG, or PDF.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Can I try D2 without installing it?$q$, $q$Yes, the online playground at play.d2lang.com lets you write and share D2 diagrams in the browser.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$What platforms does D2 run on?$q$, $q$D2 is available for macOS, Linux, and Windows, and is distributed through package managers like Homebrew and Winget.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Architecture diagrams in docs$q$, $q$Developers embed D2 text definitions in documentation and README files to keep diagrams versioned alongside code.$q$, $q$Software engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$Quick whiteboard-style sketches$q$, $q$Teams use the playground to turn a rough mental model into a shareable diagram without a design tool.$q$, $q$Technical teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$overview$q$, $q$What is D2?$q$, 2, ARRAY[$q$D2 is an open-source diagram scripting language created by Terrastruct, Inc. that converts plain text descriptions into diagrams exported as SVG, PNG, or PDF.$q$, $q$It supports multiple layout engines, built-in themes, animated diagrams, and UML/sequence diagram types, and can be run from the command line, embedded in tooling, or tried in an online playground.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', $q$who-its-for$q$, $q$Who D2 is for$q$, 2, ARRAY[$q$D2 suits developers and technical writers who want version-controllable, text-based diagrams they can keep alongside code and documentation rather than maintaining diagrams in a separate GUI tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8f5095fd-2fe0-49e0-936e-9bb82f1c6752', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Kroki ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kroki is a free, open-source API that renders diagrams from text descriptions across 25+ diagram formats.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Kroki is a free, MIT-licensed API that turns text into diagrams, supporting 25+ formats like Mermaid, PlantUML, and Graphviz.$q$,
  og_description = $q$Kroki is a free, MIT-licensed API that turns text into diagrams, supporting 25+ formats like Mermaid, PlantUML, and Graphviz.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd01ba1ee-34ac-4433-8e64-30da756ce4a2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd01ba1ee-34ac-4433-8e64-30da756ce4a2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Unified diagram API$q$, $q$One HTTP API renders diagrams from over 25 different textual diagram formats, including Mermaid, PlantUML, GraphViz, D2, and BPMN.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Free hosted service$q$, $q$Exoscale operates a free public instance at kroki.io so users don't need to install anything.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Self-hostable$q$, $q$The MIT-licensed source can be self-deployed on your own infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Multiple output formats$q$, $q$Renders diagrams as PNG, SVG, PDF, and other formats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$GET/POST HTTP interface$q$, $q$Diagrams can be requested via encoded URLs (GET) or plain-text payloads (POST).$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Free to use via the hosted kroki.io service$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Open source (MIT license) and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Supports a very wide range of diagram formats through one API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Simple HTTP interface with no complex dependency installation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Relies on a third-party hosted service unless self-hosted$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Self-hosting requires Linux/server administration experience$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$No official paid support tier described on the website$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Is Kroki free?$q$, $q$Yes, Kroki is free and open source, with a free hosted service available at kroki.io.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Can I self-host Kroki?$q$, $q$Yes, Kroki is MIT-licensed and can be deployed on your own infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$What diagram formats does Kroki support?$q$, $q$Kroki supports over 25 diagram formats, including BlockDiag, BPMN, D2, Ditaa, GraphViz, Mermaid, PlantUML, and WireViz.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Who maintains Kroki?$q$, $q$Kroki is maintained by Yuzu tech with infrastructure support from Exoscale.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Rendering diagrams in documentation pipelines$q$, $q$Teams call the Kroki API to render text-based diagrams into images for wikis, static sites, and docs.$q$, $q$Technical writers and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$Consolidating multiple diagram tools$q$, $q$Instead of installing separate renderers for Mermaid, PlantUML, and GraphViz, teams use one Kroki endpoint for all of them.$q$, $q$Engineering teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$overview$q$, $q$What is Kroki?$q$, 2, ARRAY[$q$Kroki is an open-source, MIT-licensed API service that creates diagrams from textual descriptions, consolidating over 25 diagram libraries (including Mermaid, PlantUML, GraphViz, and D2) behind one unified HTTP interface.$q$, $q$It is maintained by Yuzu tech with infrastructure support from Exoscale, which also runs a free public instance at kroki.io.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', $q$who-its-for$q$, $q$Who Kroki is for$q$, 2, ARRAY[$q$Kroki is aimed at developers and documentation teams who need to render many different text-based diagram formats without installing and maintaining a separate tool for each one.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d01ba1ee-34ac-4433-8e64-30da756ce4a2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Graphviz ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Graphviz is free, open-source software that generates diagrams from text-based graph descriptions.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Graphviz is free, open-source graph visualization software that renders text descriptions into diagrams in 30+ output formats.$q$,
  og_description = $q$Graphviz is free, open-source graph visualization software that renders text descriptions into diagrams in 30+ output formats.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '810dd7ba-142d-43eb-a0cd-c0bc68503b42';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '810dd7ba-142d-43eb-a0cd-c0bc68503b42' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Text-based graph description$q$, $q$Diagrams are defined in the DOT language, a simple text format for describing graphs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Multiple layout engines$q$, $q$Supports several layout algorithms for different graph styles, such as hierarchical and force-directed layouts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$30+ output formats$q$, $q$Renders to image formats (PNG, JPEG, PDF), web formats (SVG), and specialized formats like JSON and PostScript.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Extensive styling$q$, $q$Supports colors, fonts, tabular node layouts, line styles, hyperlinks, and custom shapes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Cross-domain applications$q$, $q$Used in networking, bioinformatics, software engineering, database design, and machine learning visualization.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Very wide range of output formats (30+)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Mature project with active development on GitLab$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Highly customizable diagram styling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Text-based DOT language has a learning curve for non-developers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$No built-in GUI editor for visual diagram creation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$No official paid support or hosted service$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Is Graphviz free?$q$, $q$Yes, Graphviz is free and open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$What language is used to define Graphviz diagrams?$q$, $q$Graphviz uses the DOT language, a simple text format for describing graphs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$What formats can Graphviz export to?$q$, $q$Graphviz supports over 30 output formats, including PNG, JPEG, PDF, SVG, JSON, and PostScript.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Where is Graphviz developed?$q$, $q$The Graphviz codebase is maintained on GitLab, where issues and development are tracked publicly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Software architecture diagrams$q$, $q$Developers use Graphviz to auto-generate dependency graphs and architecture diagrams from text.$q$, $q$Software engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$Network and data visualization$q$, $q$Graphviz renders network topologies and relationship graphs in fields like bioinformatics and database design.$q$, $q$Researchers and data engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$overview$q$, $q$What is Graphviz?$q$, 2, ARRAY[$q$Graphviz is free, open-source software for visualizing graphs and networks. It takes text descriptions of graphs, written in the DOT language, and renders them into diagrams in formats such as PNG, SVG, and PDF.$q$, $q$The software supports multiple layout engines and over 30 output formats, and is used across networking, bioinformatics, software engineering, database design, and machine learning.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', $q$who-its-for$q$, $q$Who Graphviz is for$q$, 2, ARRAY[$q$Graphviz suits developers, researchers, and engineers who need to programmatically generate diagrams from structured text data rather than drawing them manually.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('810dd7ba-142d-43eb-a0cd-c0bc68503b42', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── LibreOffice ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LibreOffice is a free, open-source office suite with word processing, spreadsheet, presentation, and database tools.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LibreOffice is a free, open-source office suite from The Document Foundation with Writer, Calc, Impress, Draw, Base, and Math.$q$,
  og_description = $q$LibreOffice is a free, open-source office suite from The Document Foundation with Writer, Calc, Impress, Draw, Base, and Math.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '54c13dd3-4248-499f-8fcf-083dadd9d1bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '54c13dd3-4248-499f-8fcf-083dadd9d1bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Writer$q$, $q$Word processing application for creating and editing documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Calc$q$, $q$Spreadsheet application for data analysis and calculations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Impress$q$, $q$Presentation software for building slide decks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Draw$q$, $q$Vector diagramming and illustration tool.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Base$q$, $q$Database management application.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Math$q$, $q$Editor for creating mathematical formulas.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Completely free with no cost to use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Open source under the Mozilla Public License v2.0$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Includes six integrated applications covering most office needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Maintained by a global community under The Document Foundation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Website does not specify supported operating systems in detail$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$No official paid support tier listed on the homepage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Formatting compatibility with Microsoft Office files can vary by document complexity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Is LibreOffice free?$q$, $q$Yes, LibreOffice is free and open-source software, licensed under the Mozilla Public License v2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Who develops LibreOffice?$q$, $q$LibreOffice is developed by The Document Foundation with contributions from a global community.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$What applications are included in LibreOffice?$q$, $q$LibreOffice includes Writer (word processing), Calc (spreadsheets), Impress (presentations), Draw (diagramming), Base (databases), and Math (formula editing).$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Free office suite alternative$q$, $q$Individuals and organizations use LibreOffice as a no-cost alternative to commercial office suites.$q$, $q$Individuals and businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$Document creation and editing$q$, $q$Writer, Calc, and Impress cover word processing, spreadsheets, and presentations for everyday office work.$q$, $q$General office users$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$overview$q$, $q$What is LibreOffice?$q$, 2, ARRAY[$q$LibreOffice is a free, open-source office productivity suite developed by The Document Foundation and a global community of contributors.$q$, $q$It includes six applications: Writer for word processing, Calc for spreadsheets, Impress for presentations, Draw for diagramming, Base for databases, and Math for formula editing, and is licensed under the Mozilla Public License v2.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', $q$who-its-for$q$, $q$Who LibreOffice is for$q$, 2, ARRAY[$q$LibreOffice is suited to individuals, schools, and organizations that want a full-featured office suite without licensing costs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('54c13dd3-4248-499f-8fcf-083dadd9d1bb', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── ONLYOFFICE ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ONLYOFFICE is an office suite for editing documents, spreadsheets, and presentations, offered as free open-source software and paid cloud/enterprise plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/admin/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Latvia$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$ONLYOFFICE is an AGPL-licensed office suite with free desktop/mobile editors, a free DocSpace Startup plan, and paid Business/Enterprise tiers.$q$,
  og_description = $q$ONLYOFFICE is an AGPL-licensed office suite with free desktop/mobile editors, a free DocSpace Startup plan, and paid Business/Enterprise tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ab659340-1acd-4acc-9653-f4c90a759519';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ab659340-1acd-4acc-9653-f4c90a759519' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Document co-editing$q$, $q$Supports character and paragraph-level real-time co-editing on documents, spreadsheets, and presentations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$AI-powered assistants$q$, $q$Includes AI features for document generation and text processing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$PDF forms and editing$q$, $q$Create and edit PDF forms in addition to standard document types.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$40+ integrations$q$, $q$Integrates with platforms such as Nextcloud, Odoo, and WordPress.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Three-level encryption$q$, $q$Encrypts data at rest, in transit, and end-to-end.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Cross-platform apps$q$, $q$Free desktop apps for Windows, Linux, and macOS, plus mobile apps for iOS and Android.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$DocSpace rooms$q$, $q$Business plan offers unlimited collaboration rooms with SSO and branding customization.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Free desktop and mobile editors are available for all users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Open-source Community Edition is available under AGPL 3.0 with source on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$DocSpace Startup cloud plan is free for small teams (up to 3 admins, 12 rooms)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Used by large organizations including UNESCO, Fujitsu, and Oracle$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$40+ third-party integrations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Full pricing for self-hosted Enterprise licensing is not transparent and requires a large upfront lifetime license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Business cloud plan pricing scales per admin, which can get costly for larger teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Advanced features like SSO and audit trail are locked to paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Is ONLYOFFICE free?$q$, $q$ONLYOFFICE offers free desktop editors, free mobile apps, a free open-source Community Edition (AGPL 3.0), and a free DocSpace Startup cloud plan; paid Business and Enterprise plans are also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$How much does ONLYOFFICE DocSpace Business cost?$q$, $q$The DocSpace Business plan starts at $20 per admin per month, with unlimited rooms and 250 GB storage per admin.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Is ONLYOFFICE open source?$q$, $q$Yes, ONLYOFFICE is distributed under the AGPL 3.0 license with source code available on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$What platforms does ONLYOFFICE support?$q$, $q$ONLYOFFICE is available on Windows, Linux, macOS, iOS, Android, and via web browsers.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Who owns ONLYOFFICE?$q$, $q$ONLYOFFICE is developed by Ascensio System SIA, based in Latvia.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Self-hosted document collaboration$q$, $q$Organizations deploy the open-source Community Edition on their own servers for full control over data.$q$, $q$IT teams and privacy-conscious organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Cloud document rooms for teams$q$, $q$DocSpace Business provides unlimited collaboration rooms with SSO and branding for growing teams.$q$, $q$Businesses and agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Startup (DocSpace)$q$, $q$Free$q$, NULL, $q$["Up to 3 admins","Unlimited users and guests","Up to 12 rooms","2 GB storage","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Business (DocSpace)$q$, $q$$20/admin/month$q$, $q$monthly$q$, $q$["Unlimited rooms","250 GB storage per admin","Professional support","SSO","Branding customization","2 monthly backups"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$Enterprise (DocSpace)$q$, $q$Custom$q$, NULL, $q$["On-premise deployment","Unlimited admins, rooms, and storage","Enterprise-level support with SLA","SAML SSO and AD sync"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$overview$q$, $q$What is ONLYOFFICE?$q$, 2, ARRAY[$q$ONLYOFFICE is an office suite for creating, editing, and collaborating on documents, spreadsheets, presentations, and PDFs, developed by Ascensio System SIA, based in Latvia.$q$, $q$It is offered as an AGPL 3.0-licensed open-source Community Edition with free desktop and mobile apps, alongside paid DocSpace Business and on-premise Enterprise cloud plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', $q$who-its-for$q$, $q$Who ONLYOFFICE is for$q$, 2, ARRAY[$q$ONLYOFFICE suits organizations that want a self-hostable, open-source alternative to commercial office suites, as well as teams that prefer a managed cloud document workspace with SSO and branding.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab659340-1acd-4acc-9653-f4c90a759519', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Collabora Online ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Collabora Online is an open-source, browser-based document suite built on LibreOffice, offered free for testing and via paid subscriptions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€3/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Collabora Online is an open-source browser-based office suite built on LibreOffice, with a free CODE edition and paid Business/Enterprise plans.$q$,
  og_description = $q$Collabora Online is an open-source browser-based office suite built on LibreOffice, with a free CODE edition and paid Business/Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '314b57b0-8a83-4a7f-9610-e611f8f2c94f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '314b57b0-8a83-4a7f-9610-e611f8f2c94f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Real-time collaborative editing$q$, $q$Multiple users can view, edit, and collaborate on documents simultaneously in the browser.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Writer, Calc, Impress, Draw$q$, $q$Covers text documents, spreadsheets, presentations, and graphics editing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Format compatibility$q$, $q$Compatible with Microsoft Office, ODF, and other document formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$API and theming$q$, $q$Customizable integrations via APIs and theming for embedding into other applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Kubernetes scalability$q$, $q$Scales via the COOL Controller for Kubernetes deployments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Fully open-source with an auditable codebase$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Free CODE (Community) edition available for testing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Built on LibreOffice, a mature office suite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Used by organizations including Nextcloud, Univention, and CERN$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Supports Windows, macOS, Linux, iOS, Android, and Chromebooks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Production deployment for your own infrastructure requires a paid subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Business plan pricing scales per user, which can add up for larger teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$CODE edition is intended for testing rather than production use$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Is Collabora Online free?$q$, $q$The CODE (Community) edition is free for home use and testing; production deployment requires a paid Business or Enterprise subscription.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$How much does Collabora Online cost?$q$, $q$The Business plan starts at €3 per user per month for up to 99 users; Enterprise pricing is custom for 100+ users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Is Collabora Online open source?$q$, $q$Yes, Collabora Online is fully open source with an auditable codebase, built on LibreOffice.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$What platforms does Collabora Online support?$q$, $q$Collabora Online supports Windows, macOS, Linux, iOS, Android, and Chromebooks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Self-hosted document editing for platforms$q$, $q$Organizations embed Collabora Online into products like Nextcloud to add browser-based document editing.$q$, $q$Platform integrators and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Testing and evaluation$q$, $q$The free CODE edition lets teams try browser-based collaborative editing before committing to a paid deployment.$q$, $q$Developers and evaluators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Development Edition (CODE)$q$, $q$Free$q$, NULL, $q$["On-premise deployment","Rolling updates","For home, testing, and startups"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Business$q$, $q$€3/user/month$q$, $q$monthly$q$, $q$["Up to 99 users","Long Term Support","Service Level Agreement","Signed security updates","Customer portal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["100+ users","All Business features","Roadmap input","Integration support","Desktop and mobile support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$overview$q$, $q$What is Collabora Online?$q$, 2, ARRAY[$q$Collabora Online is an open-source, browser-based document editing suite built on LibreOffice, enabling real-time collaborative editing of text documents, spreadsheets, presentations, and graphics.$q$, $q$It is offered as a free CODE (Community) edition for testing, plus paid Business and Enterprise subscriptions for production deployment on your own infrastructure, provided by Collabora Productivity Ltd.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', $q$who-its-for$q$, $q$Who Collabora Online is for$q$, 2, ARRAY[$q$Collabora Online suits organizations that want to self-host browser-based document editing or embed it into another platform, such as Nextcloud, rather than relying on a third-party cloud office suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('314b57b0-8a83-4a7f-9610-e611f8f2c94f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── CryptPad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CryptPad is an open-source, end-to-end encrypted collaborative office suite with documents, spreadsheets, and more.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€5/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$France$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$CryptPad is an open-source, end-to-end encrypted office suite with free 1GB accounts and paid plans from €5/month.$q$,
  og_description = $q$CryptPad is an open-source, end-to-end encrypted office suite with free 1GB accounts and paid plans from €5/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '41beb071-a49d-4ab2-b0b3-1264edc2d746';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '41beb071-a49d-4ab2-b0b3-1264edc2d746' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$End-to-end encryption$q$, $q$All data is encrypted client-side so even CryptPad's developers cannot access document contents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Real-time collaboration$q$, $q$Multiple users can edit documents simultaneously.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Full office suite$q$, $q$Includes rich text documents, spreadsheets, presentations, Kanban boards, forms, code editors, diagrams, and whiteboards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Anonymous access$q$, $q$Users can collaborate without creating an account or providing personal information.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Self-hostable$q$, $q$Organizations can deploy their own CryptPad instance.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Zero-knowledge, end-to-end encrypted by default$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Open source with source code available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Free tier includes 1GB storage with full feature access$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Can be used anonymously without an account$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Self-hostable for organizations wanting full control$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Paid plans are needed for more storage beyond the 1GB free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Enterprise self-hosted plans start at a relatively high €1,500/year$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Encryption model may complicate account/password recovery$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Is CryptPad free?$q$, $q$Yes, CryptPad offers a free tier with 1GB storage and full feature access; paid plans from €5/month add more storage and priority support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Is CryptPad open source?$q$, $q$Yes, CryptPad is free and open-source software with source code available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$How does CryptPad protect privacy?$q$, $q$CryptPad uses end-to-end, client-side encryption, meaning documents are encrypted before leaving the user's browser.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Who develops CryptPad?$q$, $q$CryptPad is developed and maintained by XWiki SAS, a French company.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Can I self-host CryptPad?$q$, $q$Yes, CryptPad can be self-hosted on your own infrastructure, and enterprise plans offer managed hosting starting from €1,500/year.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Privacy-focused document collaboration$q$, $q$Teams that need end-to-end encrypted collaboration use CryptPad instead of conventional cloud office suites.$q$, $q$Privacy-conscious individuals and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Anonymous collaborative editing$q$, $q$Users can create and share encrypted documents via link without registering an account.$q$, $q$Journalists, activists, and ad hoc collaborators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Free$q$, $q$€0$q$, NULL, $q$["1GB storage","Full feature access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$CryptPad.fr paid plans$q$, $q$€5-€100/month$q$, $q$monthly$q$, $q$["Additional storage","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$Enterprise (Mini)$q$, $q$€3,000/year$q$, $q$annual$q$, $q$["50 users","100GB storage","Managed hosting or on-premise support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$overview$q$, $q$What is CryptPad?$q$, 2, ARRAY[$q$CryptPad is an open-source, end-to-end encrypted collaborative office suite accessible through a web browser, developed and maintained by XWiki SAS, a French company.$q$, $q$It includes rich text documents, spreadsheets, presentations, Kanban boards, forms, code editors, diagrams, and whiteboards, with all data encrypted client-side before it leaves the browser.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', $q$who-its-for$q$, $q$Who CryptPad is for$q$, 2, ARRAY[$q$CryptPad is suited to individuals and organizations that prioritize privacy and want document collaboration where even the hosting provider cannot read the content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41beb071-a49d-4ab2-b0b3-1264edc2d746', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Etherpad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Etherpad is a free, open-source, self-hosted web editor for real-time collaborative text editing.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Etherpad is a free, Apache 2.0-licensed, self-hosted real-time collaborative text editor with 200+ plugins.$q$,
  og_description = $q$Etherpad is a free, Apache 2.0-licensed, self-hosted real-time collaborative text editor with 200+ plugins.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69a475e1-9bb8-4bf6-9842-69059a3261a0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69a475e1-9bb8-4bf6-9842-69059a3261a0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Real-time collaborative editing$q$, $q$Multiple users can edit the same document simultaneously with instant synchronization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Authorship tracking$q$, $q$Every keystroke is attributed to its author with full revision history preserved.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Time slider$q$, $q$Lets users review a document's complete edit history character-by-character.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Plugin ecosystem$q$, $q$Over 200 plugins add features like comments, images, tables, code highlighting, video chat, and OAuth/LDAP authentication.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Optional AI plugins$q$, $q$AI features are available as optional plugins that point to models of the user's choice on their own infrastructure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Self-hosted, no telemetry$q$, $q$Runs on your own server with no forced updates or telemetry.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Completely free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Self-hosted, giving full data control with no telemetry$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Large plugin ecosystem with 200+ extensions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Mature project, active for over 16 years with millions of users$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Used by organizations like the Wikimedia Foundation and EU institutions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Requires self-hosting and server maintenance since there's no official managed cloud service$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$No built-in enterprise support plan mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Feature set depends on which plugins are installed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Is Etherpad free?$q$, $q$Yes, Etherpad is free, open-source software released under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Do I need to host Etherpad myself?$q$, $q$Yes, Etherpad is designed for self-hosting; users run their own server instances.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Does Etherpad support plugins?$q$, $q$Yes, there are over 200 plugins available for features like comments, tables, video chat, and authentication integrations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Who uses Etherpad?$q$, $q$Etherpad is used by organizations including the Wikimedia Foundation, EU public institutions, universities, and newsrooms.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$What platforms does Etherpad support?$q$, $q$Etherpad server runs cross-platform, with native apps available for Android and iOS plus a command-line client.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Real-time collaborative note-taking$q$, $q$Teams and communities use self-hosted Etherpad instances for live meeting notes and shared documents.$q$, $q$Civic-tech groups and newsrooms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$Institutional document collaboration$q$, $q$Universities and public institutions deploy Etherpad for collaborative writing with full data sovereignty.$q$, $q$Educational and government institutions$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$overview$q$, $q$What is Etherpad?$q$, 2, ARRAY[$q$Etherpad is a free, open-source, self-hosted web editor that enables multiple users to edit the same document simultaneously in real time, with full authorship tracking and revision history.$q$, $q$Released under the Apache 2.0 license, it has been active for over 16 years, supports 105 languages, and has a plugin ecosystem of more than 200 extensions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', $q$who-its-for$q$, $q$Who Etherpad is for$q$, 2, ARRAY[$q$Etherpad suits organizations and communities that want a self-hosted, privacy-respecting alternative to commercial real-time document editors, such as institutions, newsrooms, and civic-tech projects.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69a475e1-9bb8-4bf6-9842-69059a3261a0', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── EtherCalc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$EtherCalc is an open-source, self-hostable web spreadsheet for real-time collaborative editing.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$EtherCalc is a free, open-source, self-hostable spreadsheet app for real-time collaborative editing, with a REST API.$q$,
  og_description = $q$EtherCalc is a free, open-source, self-hostable spreadsheet app for real-time collaborative editing, with a REST API.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eddc5a12-a813-48d5-b150-695f5bfdf5f3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eddc5a12-a813-48d5-b150-695f5bfdf5f3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Real-time collaborative spreadsheets$q$, $q$Multiple users can edit the same spreadsheet simultaneously by sharing a URL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$REST API$q$, $q$Provides a REST API for programmatic access to spreadsheet data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Self-hosting via Docker$q$, $q$Can be self-hosted using Docker Compose without requiring Redis or other external services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$XLSX import/export$q$, $q$Supports importing and exporting spreadsheets in XLSX format.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Deployable to Cloudflare Workers$q$, $q$Can also be deployed to Cloudflare Workers as an alternative to self-hosting.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Free and open source, self-hostable with Docker$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Simple sharing model: send a URL to collaborate instantly$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$REST API allows programmatic integration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$XLSX import/export for compatibility with spreadsheet files$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Uses a mix of several open-source licenses across different components rather than one unified license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Requires setting up a reverse proxy with TLS for internet-facing production use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Less feature-rich than commercial spreadsheet applications like Excel or Google Sheets$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Is EtherCalc free?$q$, $q$Yes, EtherCalc is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Can EtherCalc be self-hosted?$q$, $q$Yes, EtherCalc can be self-hosted using Docker Compose, or deployed to Cloudflare Workers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Does EtherCalc support Excel files?$q$, $q$Yes, EtherCalc supports XLSX import and export.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$How do I collaborate on an EtherCalc spreadsheet?$q$, $q$You share the spreadsheet's URL with others, and they can edit it together in real time.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Quick shared spreadsheets$q$, $q$Users create a spreadsheet and share the link for instant real-time collaboration without setting up accounts.$q$, $q$Small teams and ad hoc collaborators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$Self-hosted spreadsheet backend$q$, $q$Developers self-host EtherCalc and use its REST API to integrate spreadsheet functionality into other applications.$q$, $q$Developers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$overview$q$, $q$What is EtherCalc?$q$, 2, ARRAY[$q$EtherCalc is a free, open-source web spreadsheet application that enables real-time collaborative editing by sharing a URL, with a REST API for programmatic access.$q$, $q$It can be self-hosted via Docker Compose or deployed to Cloudflare Workers, and supports XLSX import/export.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', $q$who-its-for$q$, $q$Who EtherCalc is for$q$, 2, ARRAY[$q$EtherCalc suits developers and teams who want a lightweight, self-hostable, real-time collaborative spreadsheet with API access, rather than a full commercial spreadsheet suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eddc5a12-a813-48d5-b150-695f5bfdf5f3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── LimeSurvey ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LimeSurvey is a survey and form-building platform available as an open-source community edition or paid cloud plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€29/month$q$,
  founded_year = 2006,
  company_size = NULL,
  headquarters = $q$Hamburg, Germany$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$LimeSurvey is a GPL-licensed open-source survey platform with cloud plans from €29/month, 800+ templates, and 80+ languages.$q$,
  og_description = $q$LimeSurvey is a GPL-licensed open-source survey platform with cloud plans from €29/month, 800+ templates, and 80+ languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea21bbfa-3554-42a3-a4a1-7aac41c0974f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$800+ survey templates$q$, $q$Pre-built templates across industries speed up survey creation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$30+ question types$q$, $q$Offers a wide range of customizable question types for building surveys and forms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Logic branching and personalization$q$, $q$Supports conditional logic to personalize the survey flow per respondent.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Multi-language support$q$, $q$Surveys can be created and taken in over 80 languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$GDPR compliance and SSL encryption$q$, $q$Built with GDPR compliance and SSL encryption for data protection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Built-in analytics and dashboards$q$, $q$Provides response analytics and dashboards within the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$AI-assisted translations (beta)$q$, $q$Includes a beta feature for AI-assisted survey translation.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Accessibility compliance$q$, $q$Built to WCAG 2.2 Level AA accessibility standards.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Open-source Community Edition available under GPL license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Free tier lets users get started before committing to a paid plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Broad language support (80+ languages) and 800+ templates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Serves a large user base, cited as 60K+ companies in 160+ countries$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$WCAG 2.2 Level AA accessibility compliance$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Cloud plan pricing scales with response volume and admin users, which can add up for larger surveys$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Corporate plan requires contacting sales for custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Self-hosting the community edition requires managing your own server infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Is LimeSurvey free?$q$, $q$LimeSurvey offers a free, GPL-licensed open-source Community Edition you can self-host, plus a free tier to evaluate the cloud service; paid cloud plans start at €29/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Where is LimeSurvey based?$q$, $q$LimeSurvey is headquartered in Hamburg, Germany, and was founded in 2006.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$How many languages does LimeSurvey support?$q$, $q$LimeSurvey supports more than 80 languages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Is LimeSurvey GDPR compliant?$q$, $q$Yes, LimeSurvey is built with GDPR compliance and SSL encryption.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Does LimeSurvey offer discounts?$q$, $q$Yes, students, teachers, and charitable organizations receive discounts of 30-50% off cloud plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Academic and research surveys$q$, $q$Universities use LimeSurvey's logic branching and multi-language support for research data collection.$q$, $q$Researchers and universities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Self-hosted survey deployments$q$, $q$Organizations that need full data control self-host the open-source Community Edition.$q$, $q$IT teams and privacy-conscious organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Business feedback collection$q$, $q$Companies use cloud plans with white-label branding and priority support to run customer or employee surveys.$q$, $q$Businesses$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Open source, GPL licensed","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Expert$q$, $q$€29/month or €348/year$q$, $q$annual$q$, $q$["3 admin users","10,000 responses/year","1 GB storage","White-label domain and custom branding"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Business$q$, $q$€75/month or €900/year$q$, $q$annual$q$, $q$["5-10 admin users","50,000 responses/year","3 GB storage","Priority email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$Corporate$q$, $q$Custom$q$, NULL, $q$["Tailored users and responses","SSO, LDAP, SAML","Dedicated server","VIP support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$overview$q$, $q$What is LimeSurvey?$q$, 2, ARRAY[$q$LimeSurvey is a survey and form-building platform, founded in 2006 and headquartered in Hamburg, Germany, offered both as a GPL-licensed open-source Community Edition and as paid cloud hosting plans.$q$, $q$It provides 800+ templates, 30+ question types, logic branching, support for 80+ languages, and GDPR-compliant infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', $q$who-its-for$q$, $q$Who LimeSurvey is for$q$, 2, ARRAY[$q$LimeSurvey suits researchers, universities, public sector organizations, and businesses that need customizable, multi-language surveys, whether self-hosted for data control or run on LimeSurvey's cloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea21bbfa-3554-42a3-a4a1-7aac41c0974f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;


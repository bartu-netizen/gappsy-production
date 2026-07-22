-- Enrichment marathon batch: Taskwarrior, Tasmota, TaxJar, Teable, Teachable, Teamgate, TeamSupport, Teamtailor

-- ── Taskwarrior ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Taskwarrior is a free, open-source command-line tool for managing task lists, offering powerful filtering, tagging, and reporting for developers and power users who prefer working in a terminal.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Taskwarrior Review: Free Command-Line Task Manager$q$, seo_title),
  seo_meta_description = COALESCE($q$Taskwarrior is a free, open-source command-line task manager with tagging, filtering, and custom reports. See features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Taskwarrior is a free and open-source command-line task management tool that has been in active development since 2006, currently maintained by Gothenburg Bit Factory under the MIT license. It is designed for developers, sysadmins, and other terminal-native users who want to track a task list without leaving the command line. Core capabilities include quick task entry and modification, a flexible tagging system, priority levels, due dates and recurring tasks, projects and subprojects, custom and colorized reports, user-defined attributes, hook scripts for automation, and synchronization across machines via Taskserver. Companion tools in the same ecosystem include Timewarrior for time tracking and Taskshell for an interactive shell. Because Taskwarrior is entirely open source, there is no subscription or license fee; the project is funded through GitHub Sponsors and volunteer contributions rather than venture capital or a company. It runs on Linux, macOS, BSD, and other Unix-like systems, and is available through most package managers. Taskwarrior appeals to a niche but dedicated audience of power users who value speed, scriptability, plain-text data ownership, and deep customization over the visual polish of mainstream task apps like Todoist or Things. As of the current 3.x release series, it remains one of the most established and actively maintained command-line task managers available.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '083ec4ab-767e-4d64-abab-5bc86ae9e884' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Command-Line Interface$q$, $q$Fast task entry, modification, and completion using simple terminal commands.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Tagging and Filtering$q$, $q$Flexible tags and complex filter expressions to slice through large task lists.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Priorities and Due Dates$q$, $q$Assign urgency, due dates, and recurring schedules to keep work on track.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Projects and Subprojects$q$, $q$Organize tasks hierarchically across projects and subprojects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Custom Reports$q$, $q$Build tailored report layouts and color rules for how tasks are displayed.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Hook Scripts$q$, $q$Trigger external scripts on task events for automation and integrations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Synchronization$q$, $q$Sync tasks across devices using Taskserver.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Companion Tools$q$, $q$Timewarrior for time tracking and Taskshell for an interactive shell experience.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Completely free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Extremely fast and lightweight, ideal for terminal workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Highly customizable filtering, reports, and automation via hook scripts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Full control over locally stored task data$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Active community and long development history since 2006$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Steep learning curve for users unfamiliar with command-line tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$No official polished mobile app (relies on third-party clients)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$No built-in team collaboration or shared workspaces$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Minimal visual interface compared to mainstream task apps$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Setup and syncing require some technical configuration$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Is Taskwarrior free?$q$, $q$Yes, Taskwarrior is completely free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$What platforms does Taskwarrior run on?$q$, $q$Linux, macOS, BSD, and other Unix-like systems; Windows users typically run it via WSL.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Does Taskwarrior have a mobile app?$q$, $q$There is no official mobile app, but community-built clients exist for some platforms.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$How do I sync tasks across devices?$q$, $q$Taskwarrior supports synchronization through Taskserver, a self-hosted or third-party sync service.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Who maintains Taskwarrior?$q$, $q$The project is maintained by Gothenburg Bit Factory and a community of open-source contributors.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Can I automate tasks in Taskwarrior?$q$, $q$Yes, hook scripts let you trigger custom code on events like adding or completing a task.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Is there a graphical interface for Taskwarrior?$q$, $q$Taskwarrior itself is command-line only, though third-party GUIs and terminal UIs built on top of it exist.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$What is Timewarrior?$q$, $q$Timewarrior is a companion open-source time-tracking tool that integrates with Taskwarrior.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Developer Task Tracking$q$, $q$Developers who live in the terminal use Taskwarrior to track coding tasks and bugs without switching context to a browser or app.$q$, $q$Software developers and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Personal Productivity for Power Users$q$, $q$Individuals who prefer plain-text, scriptable tools use Taskwarrior to manage personal task lists with custom tags, priorities, and reports.$q$, $q$Command-line power users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Automated Workflow Tracking$q$, $q$Teams and individuals use Taskwarrior hook scripts to integrate task management into automated pipelines and personal automation setups.$q$, $q$Automation-focused technical users$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$Taskwarrior$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open source under the MIT license","Unlimited tasks and projects","Full command-line feature set","Optional GitHub Sponsors support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '083ec4ab-767e-4d64-abab-5bc86ae9e884';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$overview$q$, $q$What Is Taskwarrior$q$, 2, ARRAY[$q$Taskwarrior is a free and open-source command-line application for managing a task list. First released in 2006 and now maintained by Gothenburg Bit Factory, it is built for people who prefer working entirely inside a terminal rather than a browser or mobile app.$q$, $q$The tool is intentionally minimal and fast, focused on letting users add, modify, complete, and query tasks with short commands. Data is stored locally, and the project ships companion tools such as Timewarrior for time tracking and Taskshell for an interactive shell experience.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Taskwarrior supports flexible tagging, priority levels, due dates, recurring tasks, and hierarchical projects and subprojects. Its reporting engine lets users build fully custom, colorized reports and filter tasks using sophisticated query expressions.$q$, $q$Advanced users extend Taskwarrior with hook scripts that run custom code on events like adding or completing a task, and with Taskserver for syncing a task list across multiple machines.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Taskwarrior is completely free and open source under the MIT license, with no paid tiers or subscriptions. Development is funded through voluntary contributions and GitHub Sponsors rather than commercial licensing.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('083ec4ab-767e-4d64-abab-5bc86ae9e884', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Tasmota ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Tasmota is a free, open-source alternative firmware for ESP8266 and ESP32 based smart devices that replaces cloud-dependent stock firmware with fully local control over MQTT, HTTP, Serial, and a web UI.$q$, short_description),
  pricing_model = COALESCE($q$free/open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Tasmota: Open-Source ESP8266/ESP32 Firmware Guide$q$, seo_title),
  seo_meta_description = COALESCE($q$Tasmota is free, open-source firmware for ESP8266 and ESP32 smart devices with full local control. See features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Tasmota is a free, open-source firmware project for ESP8266, ESP32, ESP32-S, and ESP32-C3 based smart home devices, created by Theo Arends starting in January 2016 as a fork of the stock Sonoff firmware, originally named Sonoff-MQTT-OTA. It replaces manufacturer cloud firmware on smart plugs, switches, sensors, lighting, curtain motors, and other IoT hardware with fully local control, removing dependency on vendor cloud servers. Tasmota devices can be managed through a web UI, MQTT, HTTP, Serial, or KNX, and support automation via timers, rules, or Berry scripting. The project supports well over 2,000 device profiles out of the box and integrates with home automation platforms such as Home Assistant and openHAB. Installation is typically done via flashing tools such as Tasmotizer or the browser-based Tasmota WebInstaller. Tasmota has no company behind it and no pricing tiers; it is maintained by an open-source community on GitHub and distributed under an open-source license. It is popular among smart home hobbyists and privacy-conscious users who want to keep IoT devices working entirely on a local network, independent of a vendor's cloud availability, and is commonly compared to ESPHome as a leading open-source alternative firmware option.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Local-Only Control$q$, $q$Operate devices entirely over the local network without any cloud dependency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Broad Device Support$q$, $q$Configuration templates for thousands of ESP8266 and ESP32 based devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Multiple Protocols$q$, $q$Control devices via web UI, MQTT, HTTP, Serial, or KNX.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Automation Rules and Timers$q$, $q$Built-in rule engine plus Berry scripting for custom automation logic.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Over-the-Air Updates$q$, $q$Flash and update firmware without physical access after initial setup.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Home Automation Integrations$q$, $q$Works with Home Assistant, openHAB, and other MQTT-based hubs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Web-Based Installer$q$, $q$Flash firmware directly from a browser using the Tasmota WebInstaller.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Active Open-Source Community$q$, $q$Frequent releases and community-contributed device templates.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Completely free, open-source, no subscription or cloud account required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Keeps smart home devices working without an internet connection$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Supports thousands of ESP8266 and ESP32 based devices out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Deep automation via built-in rules and Berry scripting$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Large, active community with frequent updates and device templates$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Requires flashing firmware, which carries some technical risk$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Some manufacturers lock devices, making flashing difficult or voiding warranties$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$No official customer support channel, only community-based support$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$User interface is functional but less polished than commercial smart home apps$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Not every device or sensor on the market is supported$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Is Tasmota free?$q$, $q$Yes, Tasmota is completely free, open-source firmware.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$What hardware does Tasmota support?$q$, $q$ESP8266, ESP32, ESP32-S, and ESP32-C3 based smart devices, with templates for thousands of specific products.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Do I need the cloud to use Tasmota?$q$, $q$No, Tasmota is designed for entirely local control over MQTT, HTTP, Serial, or a local web UI.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$How do I install Tasmota on a device?$q$, $q$Most users flash devices using the browser-based Tasmota WebInstaller or a tool such as Tasmotizer.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Does Tasmota work with Home Assistant?$q$, $q$Yes, Tasmota integrates with Home Assistant and other MQTT-based home automation platforms.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Who created Tasmota?$q$, $q$Tasmota was created by Theo Arends, starting in January 2016 as a fork of Sonoff's stock firmware.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Is flashing Tasmota reversible?$q$, $q$In most cases devices can be reflashed back to stock firmware, though this varies by device and is not guaranteed.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$How is Tasmota different from ESPHome?$q$, $q$Both are open-source alternative firmware projects for ESP chips; Tasmota emphasizes a built-in web UI and rule engine, while ESPHome emphasizes YAML-based configuration tightly integrated with Home Assistant.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Privacy-Focused Smart Home Setup$q$, $q$Homeowners flash Tasmota onto smart plugs and switches to keep device control entirely on their local network, avoiding manufacturer cloud services.$q$, $q$Privacy-conscious smart home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Custom IoT Automation$q$, $q$Makers and hobbyists use Tasmota's rule engine and Berry scripting to build custom automations on top of low-cost ESP-based hardware.$q$, $q$IoT hobbyists and makers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Extending Legacy or Cloud-Locked Devices$q$, $q$Users replace discontinued or cloud-dependent stock firmware on devices such as Sonoff switches with Tasmota to keep them functional long-term.$q$, $q$Smart home tinkerers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$Tasmota Firmware$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open-source firmware for ESP8266 and ESP32 devices","Full local control with no cloud requirement","Community-maintained device templates","Regular firmware releases"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '4a94ac23-3cd5-4a86-822c-cdd69541e32e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$overview$q$, $q$What Is Tasmota$q$, 2, ARRAY[$q$Tasmota is open-source firmware for ESP8266 and ESP32 based smart devices, created by Theo Arends beginning in January 2016. It was originally built to replace the stock cloud-dependent firmware on Sonoff smart plugs and switches with a version that runs entirely on the local network.$q$, $q$Today Tasmota supports thousands of devices from many manufacturers, including switches, sensors, lighting, and curtain motors, and is maintained by an active open-source community on GitHub rather than a company.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Tasmota devices can be controlled and configured through a built-in web UI, MQTT, HTTP, Serial, or KNX, without any dependency on a manufacturer's cloud service. Automation is handled through built-in timers and rules or more advanced Berry scripting.$q$, $q$The firmware integrates with popular home automation hubs such as Home Assistant and openHAB, and can typically be installed using the browser-based Tasmota WebInstaller without needing to open the device.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Tasmota is completely free and open source, with no licensing fees, subscriptions, or paid tiers. It is distributed and maintained purely through community contribution.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4a94ac23-3cd5-4a86-822c-cdd69541e32e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── TaxJar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$TaxJar is a sales tax automation platform, now part of Stripe, that helps e-commerce and SaaS businesses calculate, report, and file sales tax across US jurisdictions.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$39/month$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$200+ employees at the time of its 2021 acquisition by Stripe$q$, company_size),
  headquarters = COALESCE($q$Woburn, Massachusetts, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$TaxJar Review: Sales Tax Automation by Stripe$q$, seo_title),
  seo_meta_description = COALESCE($q$TaxJar automates US sales tax calculation, nexus tracking, and filing. See TaxJar pricing, features, pros, cons, and FAQs from Stripe's tax platform.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$TaxJar is a cloud-based sales tax compliance platform founded in 2013 to help e-commerce and SaaS businesses automate US sales tax calculation, nexus tracking, reporting, and filing. Stripe acquired TaxJar in 2021 for roughly $850-900 million, and TaxJar now operates as part of Stripe's revenue and tax compliance infrastructure while continuing to run as a standalone product. TaxJar connects to platforms such as Shopify, Amazon, WooCommerce, and Stripe itself to pull order data, calculate accurate rates at checkout, track when a business crosses economic nexus thresholds in a state, generate jurisdiction-level reports, and automatically file and remit returns through its AutoFile feature. Pricing starts with a Starter plan at $39 per month for up to 200 orders and includes a Professional plan at $99 per month with phone support, more AutoFile credits, and a dedicated Customer Success Manager; both plans offer a 30-day free trial and a discount for annual billing. TaxJar is aimed at online sellers, marketplaces, and finance teams that need to stay compliant with sales tax rules across thousands of US tax jurisdictions without manually tracking rate changes or filing deadlines in each state.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '12d24fe7-48a0-44d8-984c-abefbbe5363a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Sales Tax Calculation$q$, $q$Real-time, jurisdiction-accurate tax rates applied at checkout.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Economic Nexus Tracking$q$, $q$Dashboard and alerts for when a business crosses state nexus thresholds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$AutoFile$q$, $q$Automated filing and remittance of sales tax returns in supported states.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Jurisdiction-Level Reporting$q$, $q$Detailed reports broken down by state, county, and local jurisdiction.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Platform Integrations$q$, $q$Connects with Shopify, Amazon, WooCommerce, Stripe, and other sales channels.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Developer API$q$, $q$REST API for custom sales tax calculation integrations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Audit Support$q$, $q$Notice management and support during state tax audits.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$CSV and Data Import$q$, $q$Simple and advanced import options for order and sales data.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Backed by Stripe's infrastructure and reliability after the 2021 acquisition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Automates filing and remittance in states with AutoFile, saving significant manual work$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Broad integration coverage with major e-commerce and payment platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Clear nexus tracking helps businesses avoid unexpected tax exposure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Transparent, published pricing with a 30-day free trial$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Focused on US sales tax only, not international VAT or GST$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$AutoFile credits are limited per plan; extra filings cost more$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Higher-volume sellers may need the pricier Professional plan for adequate support$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Setup and nexus configuration can be complex for multi-state sellers$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Integration limits on the Starter tier compared to Professional$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Is TaxJar owned by Stripe?$q$, $q$Yes, Stripe acquired TaxJar in 2021, and it now operates as part of Stripe's tax compliance offerings.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$How much does TaxJar cost?$q$, $q$Plans start at $39/month for the Starter tier and $99/month for the Professional tier, with a discount for annual billing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Does TaxJar file sales tax returns automatically?$q$, $q$Yes, through its AutoFile feature, TaxJar can automatically file and remit sales tax returns in supported states using included AutoFile credits.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$What platforms does TaxJar integrate with?$q$, $q$TaxJar integrates with Shopify, Amazon, WooCommerce, Stripe, and other major sales and payment platforms.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Does TaxJar handle international tax?$q$, $q$TaxJar's core product focuses on US sales tax across state and local jurisdictions.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Is there a free trial?$q$, $q$Yes, both TaxJar plans offer a 30-day free trial.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$What is economic nexus?$q$, $q$It is the sales or transaction threshold that determines when a business must start collecting sales tax in a given state; TaxJar tracks this automatically.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Can TaxJar help with a state tax audit?$q$, $q$Yes, the Professional plan includes audit support and notice management.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$E-Commerce Sales Tax Compliance$q$, $q$Online stores use TaxJar to calculate accurate sales tax at checkout across every US state and automatically file returns as they grow.$q$, $q$E-commerce businesses and Shopify or WooCommerce sellers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Multi-State Nexus Monitoring$q$, $q$Growing businesses use TaxJar's nexus dashboard to know exactly when they cross a sales threshold that requires tax registration in a new state.$q$, $q$Finance and accounting teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$SaaS and Marketplace Tax Automation$q$, $q$SaaS companies and marketplaces integrate TaxJar's API to calculate tax programmatically at the point of sale.$q$, $q$SaaS and marketplace developers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Starter$q$, $q$$39/month$q$, $q$monthly (annual discount available)$q$, NULL, $q$["Up to 200 orders per month","Up to 3 data import integrations","Email support with guaranteed response time","2 AutoFile credits per year","Simple and advanced CSV import","Developer sandbox","Jurisdiction-level sales tax reporting","Economic nexus checker","Up to 10 team users"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$Professional$q$, $q$$99/month$q$, $q$monthly (annual discount available)$q$, NULL, $q$["Up to 10 total integrations (data import plus API)","Email and phone support with guaranteed response time","Dedicated onboarding and Customer Success Manager","4 AutoFile credits per year","10,000 API calls per minute","Economic nexus dashboard with alerts","Audit support and notice management","Unlimited filing frequency notices","Up to 10 team users"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '12d24fe7-48a0-44d8-984c-abefbbe5363a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$overview$q$, $q$What Is TaxJar$q$, 2, ARRAY[$q$TaxJar is a sales tax compliance platform founded in 2013 to help internet businesses automate sales tax calculation, nexus tracking, reporting, and filing across the United States. In 2021, Stripe acquired TaxJar to build out its tax compliance infrastructure.$q$, $q$TaxJar connects to e-commerce and payment platforms to pull order data automatically, then applies jurisdiction-accurate tax rates and tracks when a business needs to register in a new state based on economic nexus rules.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include real-time sales tax calculation, an economic nexus dashboard with alerts, jurisdiction-level reporting, and a developer API. Its AutoFile feature automatically files and remits sales tax returns in supported states, reducing manual filing work.$q$, $q$TaxJar also offers audit support and notice management, along with CSV import options and integrations with major sales channels like Shopify, Amazon, and WooCommerce.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('12d24fe7-48a0-44d8-984c-abefbbe5363a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$TaxJar offers two published plans: Starter at $39/month and Professional at $99/month, both with a 30-day free trial and a discount for annual billing. Additional AutoFile credits and Flex Fees for temporary volume spikes are available beyond the included allotments.$q$]::text[], 2);


-- ── Teable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Teable is an open-source, PostgreSQL-native no-code database that gives teams an Airtable-like spreadsheet interface backed by real database power, with self-hosted and cloud options.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Pro from $10/seat/month)$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Teable Review: Open-Source Airtable Alternative$q$, seo_title),
  seo_meta_description = COALESCE($q$Teable is an open-source, PostgreSQL-native no-code database. See Teable pricing, features, pros, cons, and FAQs versus Airtable.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Teable is an open-source, no-code database platform built directly on PostgreSQL, positioned as a next-generation Airtable alternative. Launched around 2023, it combines a familiar spreadsheet-style interface with a real relational database underneath, offering Grid, Kanban, Calendar, Gallery, and Form views alongside real-time collaboration. Teable supports AI-powered fields that auto-populate data, an integrated AI chat for querying the database, and an App Builder for creating internal tools without code. Because it runs on native PostgreSQL, Teable is built to scale to large datasets, with its Business plan supporting up to 1,000,000 rows per space and unlimited rows per table, well beyond what typical spreadsheet-based no-code tools handle. The Community Edition is free and self-hostable under the AGPL license, while Teable also offers a hosted cloud service with a Free tier and paid Pro ($10/seat/month billed yearly) and Business ($20/seat/month billed yearly) plans that add features like SSO, custom domains, and an authority matrix for granular permissions. The project has attracted over 21,000 GitHub stars and backing from investors including Baidu Ventures, Vertex Ventures China, and ZhenFund. Teable targets startups, operations teams, and developers who want Airtable-style flexibility without giving up SQL-grade performance or the option to self-host.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$PostgreSQL-Native Architecture$q$, $q$A real relational database underneath a familiar spreadsheet UI.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Multiple Views$q$, $q$Grid, Kanban, Calendar, Gallery, and Form views on the same data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Real-Time Collaboration$q$, $q$Multiple users editing and viewing data simultaneously.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$AI-Powered Fields and Chat$q$, $q$Auto-populate fields and query the database using AI.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$App Builder$q$, $q$Build custom internal tools and workflows without code.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Self-Hosting Option$q$, $q$Free, open-source Community Edition under the AGPL license.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$High Row Capacity$q$, $q$Supports up to 1,000,000 rows per space on the Business plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Automation Runs$q$, $q$Built-in automation with per-plan run limits.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Free, open-source self-hosted edition with no artificial row limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Handles much larger datasets than typical spreadsheet-based no-code tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Familiar Airtable-like interface lowers the learning curve$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Transparent per-seat cloud pricing with a usable free tier$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Active open-source community with rapid GitHub star growth$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Younger product with a shorter track record than established competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$AI features consume metered credits that can run out on lower tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Self-hosting requires technical setup and PostgreSQL familiarity$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Enterprise-grade features like SSO are limited to the higher-priced Business plan$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Smaller integration and template ecosystem compared to Airtable$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Is Teable free?$q$, $q$Yes, Teable offers a free self-hosted Community Edition under the AGPL license and a free tier on its hosted cloud service.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$How much does Teable Pro cost?$q$, $q$The Pro plan starts at $10/seat/month billed yearly, or $12/month billed monthly.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Can I self-host Teable?$q$, $q$Yes, the Community Edition can be self-hosted for free since it is open source.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Is Teable built on a real database?$q$, $q$Yes, Teable is built natively on PostgreSQL rather than a proprietary spreadsheet engine.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$How many rows can Teable handle?$q$, $q$The Business plan supports up to 1,000,000 rows per space, with unlimited rows per table.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Does Teable have AI features?$q$, $q$Yes, Teable offers AI-powered fields and an integrated AI chat for querying data, using a metered credit system.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Does Teable support single sign-on?$q$, $q$SSO and domain verification are available on the Business plan.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Who is behind Teable?$q$, $q$Teable is developed by an open-source team and backed by investors including Baidu Ventures, Vertex Ventures China, and ZhenFund.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Self-Hosted Internal Database$q$, $q$Engineering and ops teams self-host Teable's Community Edition to build internal tools and databases without relying on a third-party cloud service.$q$, $q$Engineering and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$No-Code App Building$q$, $q$Startups use Teable's App Builder and multiple views to create lightweight internal apps and dashboards without writing code.$q$, $q$Startups and no-code builders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Large-Scale Data Management$q$, $q$Teams outgrowing spreadsheet-based tools move to Teable to manage large datasets with real database performance while keeping a spreadsheet-style interface.$q$, $q$Data and operations teams handling large datasets$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Free$q$, $q$$0/seat/month$q$, $q$N/A$q$, NULL, $q$["200 credits","100 automation runs","1,000 rows","1GB attachments","AI chat, AI field, and app builder included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Pro$q$, $q$$10/seat/month billed yearly ($12/month billed monthly)$q$, $q$monthly or yearly$q$, NULL, $q$["1,000 credits per seat","25,000 automation runs","250,000 rows","10GB attachments","1-year row comment and history retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Business$q$, $q$$20/seat/month billed yearly ($24/month billed monthly)$q$, $q$monthly or yearly$q$, NULL, $q$["2,000 credits per seat","100,000 automation runs","1,000,000 rows","100GB attachments","Custom app domain, authority matrix, domain verification, and SSO","3-year row comment and history retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$Community Edition (Self-Hosted)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Open source under the AGPL license","Self-hosted deployment","Core database and view features","No seat-based licensing fee"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '29ae5ed4-0528-4ac2-93c1-e33536bd6b2f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$overview$q$, $q$What Is Teable$q$, 2, ARRAY[$q$Teable is an open-source, no-code database built natively on PostgreSQL, launched around 2023 as a next-generation alternative to spreadsheet-style database tools like Airtable.$q$, $q$It presents a familiar spreadsheet interface on top of a real relational database, letting teams get the ease of a no-code tool without the row and performance limits typical of spreadsheet-based platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Teable supports Grid, Kanban, Calendar, Gallery, and Form views on the same underlying data, along with real-time collaboration for teams working together. AI-powered fields and an integrated AI chat let users auto-populate data and query the database in natural language.$q$, $q$An App Builder allows teams to create custom internal tools without writing code, and because Teable is PostgreSQL-native it can handle very large datasets, up to 1,000,000 rows per space on the Business plan.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Teable offers a free, self-hostable Community Edition under the AGPL license, plus a hosted cloud service with a Free tier and paid Pro ($10/seat/month billed yearly, $12/month billed monthly) and Business ($20/seat/month billed yearly, $24/month billed monthly) plans that add SSO, custom domains, and higher usage limits.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('29ae5ed4-0528-4ac2-93c1-e33536bd6b2f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Teachable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Teachable is an online course creation platform that lets creators and businesses build, market, and sell courses, coaching, and digital products, now part of the Hotmart Company.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$39/month (Starter plan)$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$Approximately 300-340 employees (2026, as part of Hotmart Company)$q$, company_size),
  headquarters = COALESCE($q$New York, New York, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Teachable Review: Online Course Platform Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Teachable lets creators sell online courses and digital products. See Teachable pricing, features, pros, cons, and FAQs for 2026.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Teachable is an online course and digital product platform founded in 2014 by Ankur Nagpal, building on an earlier 2013 project called Fedora, and headquartered in New York City. It lets creators, coaches, and businesses build branded course sites and sell video courses, coaching packages, digital downloads, and communities without needing separate hosting or payment infrastructure. Teachable was acquired by the Brazilian creator-commerce company Hotmart in 2020 and now operates as part of the larger Hotmart Company group. Its creator plans run from Starter at $39/month (or $29/month billed annually) with a 7.5% transaction fee, up to Builder ($89/month), Growth ($189/month), and a Custom tier for businesses selling over $60,000 per year; Builder and above remove Teachable's platform transaction fee. Teachable also offers Enterprise plans (Core and Pro) priced from $6,000 to $12,000 per year for schools and larger organizations that need SSO, white-labeling, and dedicated account management. Key features include an AI-assisted course builder, iOS and Android student apps, global payment support, certificates, affiliate marketing tools, and bulk student imports on higher tiers. Teachable has powered over 100,000 creators and billions of dollars in course sales, competing with platforms like Kajabi, Thinkific, and Podia in the creator economy and online education space.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Course and Product Builder$q$, $q$Build video courses, coaching offers, and digital downloads with AI-assisted content tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Global Payments$q$, $q$Accept payments from students worldwide with built-in checkout.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Mobile Apps$q$, $q$Dedicated iOS and Android apps for students to access courses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Affiliate Marketing$q$, $q$Built-in affiliate program tools on Builder plan and above.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Course Certificates$q$, $q$Issue completion certificates to students automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Custom Permissions and Bulk Imports$q$, $q$Manage larger teams and student rosters on the Growth plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$White-Labeling$q$, $q$Remove Teachable branding on paid plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Enterprise SSO$q$, $q$Single sign-on and dedicated account management on Enterprise tiers.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$No coding required to launch a fully branded course site$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Backed by Hotmart's global creator-commerce infrastructure since 2020$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$0% platform transaction fees on Builder plan and above$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Strong track record with over 100,000 creators and billions in course sales$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Mobile apps give students a native way to consume course content$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Starter plan charges a 7.5% transaction fee on every sale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Pricing rises quickly for creators who need multiple admin users or high student caps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Enterprise pricing requires a significant annual commitment starting at $6,000$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Less design flexibility than fully custom-built websites$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Payment processing fees apply on top of subscription costs$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$How much does Teachable cost?$q$, $q$Creator plans start at $39/month (or $29/month billed annually) for Starter, up to $189/month for Growth, plus a Custom tier for larger businesses.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Does Teachable charge transaction fees?$q$, $q$The Starter plan charges a 7.5% transaction fee; Builder and higher plans have 0% platform transaction fees, though payment processing fees still apply.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Who owns Teachable?$q$, $q$Teachable is owned by the Hotmart Company, which acquired it in 2020.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Where is Teachable based?$q$, $q$Teachable is headquartered in New York, New York.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Does Teachable have a mobile app?$q$, $q$Yes, Teachable offers dedicated iOS and Android apps for students.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Can I sell coaching or digital downloads, not just courses?$q$, $q$Yes, Teachable supports courses, coaching, communities, and digital downloads as sellable products.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Does Teachable offer an Enterprise plan?$q$, $q$Yes, Enterprise plans start at $6,000/year (Core) and $12,000/year (Pro), with custom pricing for larger organizations.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$When was Teachable founded?$q$, $q$Teachable was founded in 2014 by Ankur Nagpal, building on an earlier 2013 platform called Fedora.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Independent Creator Course Sales$q$, $q$Solo creators and coaches use Teachable to package expertise into paid video courses and coaching offers without building their own website infrastructure.$q$, $q$Independent creators and coaches$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Corporate and Team Training$q$, $q$Businesses use Teachable's Growth and Enterprise plans to deliver branded training content with custom permissions for multiple admins.$q$, $q$Businesses delivering internal or customer training$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Educational Institutions$q$, $q$Schools and training organizations use Teachable Enterprise for SSO, white-labeling, and dedicated account management at scale.$q$, $q$Schools and larger education providers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Starter$q$, $q$$39/month ($29/month billed annually)$q$, $q$monthly or annual$q$, NULL, $q$["7.5% transaction fee","5 products","100 active students","1 admin user","Up to 1TB video storage","AI course creation tools, mobile apps, global payments, certificates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Builder$q$, $q$$89/month ($69/month billed annually)$q$, $q$monthly or annual$q$, NULL, $q$["0% platform transaction fee","10 products","1,000 active students","1 admin user","Affiliate program, real-time support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Growth$q$, $q$$189/month ($139/month billed annually)$q$, $q$monthly or annual$q$, NULL, $q$["0% platform transaction fee","50 products","5,000 active students","5 admin users","Remove Teachable branding, bulk imports, custom permissions, free subtitles and translations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Custom$q$, $q$Contact sales$q$, $q$custom$q$, NULL, $q$["For businesses selling $60,000+ per year","Dedicated success manager","Priority support and white-glove onboarding"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Enterprise Core$q$, $q$$6,000/year$q$, $q$annual$q$, NULL, $q$["250 users","25 courses","5 admin seats","SSO, white-label, dedicated account manager"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$Enterprise Pro$q$, $q$$12,000/year$q$, $q$annual$q$, NULL, $q$["1,000 users","50 courses","15 admin seats","All Core features plus advanced capabilities"]$q$::jsonb, 5);

DELETE FROM tool_content_blocks WHERE tool_id = '331c1d71-2a89-499a-9b96-e38d4d4f0feb';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$overview$q$, $q$What Is Teachable$q$, 2, ARRAY[$q$Teachable is an online course and digital product platform founded in 2014 by Ankur Nagpal, building on an earlier 2013 project called Fedora, and headquartered in New York City. It was acquired by the Brazilian creator-commerce company Hotmart in 2020 and now operates as part of the Hotmart Company group.$q$, $q$The platform lets creators, coaches, and businesses build a branded course site and sell video courses, coaching packages, digital downloads, and communities without needing separate hosting, payment, or student-management infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Teachable includes an AI-assisted course builder, global payment support, dedicated iOS and Android apps for students, completion certificates, and affiliate marketing tools on higher plans. Growth-tier customers get bulk student imports, custom permissions, and free subtitles and translations.$q$, $q$Enterprise customers get single sign-on, white-labeling, and dedicated account management, positioning Teachable for both individual creators and larger training organizations.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('331c1d71-2a89-499a-9b96-e38d4d4f0feb', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Creator plans range from Starter at $39/month ($29/month billed annually) up to Growth at $189/month, with a Custom tier for larger sellers. Enterprise plans start at $6,000/year for Core and $12,000/year for Pro. Starter charges a 7.5% transaction fee, while Builder and above have 0% platform transaction fees.$q$]::text[], 2);


-- ── Teamgate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Teamgate is a cloud-based sales CRM built for small and mid-sized sales teams, offering pipeline management, sales analytics, and workflow automation.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $39.90/user/month)$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$Approximately 10-15 employees (small, independent team)$q$, company_size),
  headquarters = COALESCE($q$Vilnius, Lithuania$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Teamgate CRM Review: Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Teamgate is a cloud sales CRM for small and mid-sized teams. See Teamgate pricing, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Teamgate is a cloud-based sales CRM founded in 2012 in Vilnius, Lithuania, originally under the name Synergy Cloud, with an additional office in London, UK. It is built for small and mid-sized sales teams and SaaS companies that want pipeline management, contact and deal tracking, sales analytics, and workflow automation without the complexity of enterprise CRM suites. Teamgate's free Starter plan supports up to two users with basic pipeline tools and 500 contacts, while paid tiers add unlimited contacts, email sync, in-app calling and SMS, sales dashboards, lead scoring, and an open API. The Team plan is priced at $39.90 per user per month and the Growth plan at $59.90 per user per month, both billed monthly with roughly a 20% discount for annual billing; higher tiers add 24/7 support, dedicated account managers, and multi-currency support. Teamgate positions itself for sales-led growth companies, from early-stage startups to established SMBs, and remains a relatively small, independent company compared to CRM giants like Salesforce or HubSpot. It is commonly evaluated as a simpler, more affordable CRM alternative for teams that want strong pipeline visibility and sales reporting without a lengthy implementation process.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Visual Sales Pipeline$q$, $q$Drag-and-drop deal stages with customizable pipelines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Sales Analytics Dashboards$q$, $q$Visual reporting on pipeline health and rep performance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Email Sync$q$, $q$Two-way email integration synced to contacts and deals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$In-App Calling and SMS$q$, $q$Make calls and send texts directly from the CRM.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Lead Scoring$q$, $q$Prioritize leads based on configurable scoring rules.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Workflow Automation$q$, $q$Automate repetitive sales tasks and follow-ups.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Open API$q$, $q$Connect Teamgate to other business tools.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Multi-Currency Support$q$, $q$Manage deals across different currencies on the Growth plan.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Free Starter plan makes it accessible for very small teams$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Simpler setup and lower learning curve than enterprise CRMs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Transparent per-user pricing with an annual billing discount$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Includes calling, SMS, and email sync without extra add-on products$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Dedicated account management included on paid tiers$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Smaller company and support footprint than major CRM vendors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Free plan is capped at 2 users and 500 contacts$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Fewer third-party integrations than larger CRM platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Limited brand recognition outside Europe$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Advanced features like lead scoring require the higher-priced Growth plan$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Does Teamgate have a free plan?$q$, $q$Yes, the Starter plan is free for up to 2 users with basic pipeline tools and 500 contacts.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$How much does Teamgate cost?$q$, $q$The Team plan is $39.90 per user per month and the Growth plan is $59.90 per user per month, both with a discount for annual billing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Where is Teamgate based?$q$, $q$Teamgate is headquartered in Vilnius, Lithuania, with an additional office in London, UK.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$When was Teamgate founded?$q$, $q$Teamgate was founded in 2012, originally under the name Synergy Cloud.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Does Teamgate support calling and SMS?$q$, $q$Yes, in-app dialing and SMS are available starting on the Team plan.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Does Teamgate have an API?$q$, $q$Yes, the Growth plan includes access to an Open API.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Is there a free trial?$q$, $q$Yes, Teamgate offers a free trial in addition to its free Starter plan.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Who is Teamgate designed for?$q$, $q$Teamgate is designed for small and mid-sized sales teams and SaaS companies seeking straightforward pipeline management.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Startup Sales Pipeline Management$q$, $q$Early-stage startups use Teamgate's free and entry-level plans to track leads and deals without committing to an expensive CRM.$q$, $q$Early-stage startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$SMB Sales Team Automation$q$, $q$Small and mid-sized sales teams use Teamgate's workflow automation and email sync to reduce manual data entry.$q$, $q$SMB sales teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Sales Performance Reporting$q$, $q$Sales managers use Teamgate's dashboards and lead scoring to focus reps on the highest-value opportunities.$q$, $q$Sales managers and team leads$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Starter$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Up to 2 users","500 contacts","1 customizable pipeline","Basic contact tools, pipeline management, calendar sync","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Team$q$, $q$$39.90/user/month$q$, $q$monthly (20% discount annually)$q$, NULL, $q$["Full email sync","Workflow automation","Sales dashboards","Dedicated account manager","Unlimited contacts","3 customizable pipelines","In-app dialing and SMS","24/7 chat and email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$Growth$q$, $q$$59.90/user/month$q$, $q$monthly (20% discount annually)$q$, NULL, $q$["Unlimited users and customizable pipelines","Advanced analytics","Lead scoring","Open API","Multi-currency support","Unlimited integrations","24/7 phone and video support","Premier onboarding"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$overview$q$, $q$What Is Teamgate$q$, 2, ARRAY[$q$Teamgate is a cloud-based sales CRM founded in 2012 in Vilnius, Lithuania, originally under the name Synergy Cloud, with an additional office in London, UK. It is built for small and mid-sized sales teams that want pipeline visibility without the complexity of enterprise CRM suites.$q$, $q$The platform combines contact and deal tracking, sales analytics, and workflow automation in a single, relatively lightweight product aimed at sales-led growth companies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Teamgate offers a visual, drag-and-drop sales pipeline, sales analytics dashboards, two-way email sync, and in-app calling and SMS. Higher tiers add lead scoring, workflow automation, an open API, and multi-currency support.$q$, $q$Paid plans also include dedicated account management and 24/7 support, giving smaller sales teams access to service levels typically reserved for larger CRM contracts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81d4337a-5ffd-4ad7-a2a7-d1137c5dc4ed', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Teamgate offers a free Starter plan for up to 2 users, a Team plan at $39.90 per user per month, and a Growth plan at $59.90 per user per month, both billed monthly with roughly a 20% discount for annual billing.$q$]::text[], 2);


-- ── TeamSupport ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$TeamSupport is a B2B customer support platform that helps technical support teams manage tickets, live chat, and account-level customer health with tools like its Customer Distress Index.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$45/month (Starter, billed annually)$q$, starting_price),
  founded_year = COALESCE(2008, founded_year),
  company_size = COALESCE($q$51-200 employees (LinkedIn); other estimates report around 66 employees as of 2024$q$, company_size),
  headquarters = COALESCE($q$Dallas, Texas, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$TeamSupport Review: B2B Customer Support Software$q$, seo_title),
  seo_meta_description = COALESCE($q$TeamSupport is B2B customer support software with account-level health tracking. See pricing, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$TeamSupport is a B2B customer support software company founded in 2008 and headquartered in Dallas, Texas, with additional offices in Denver, Colorado, and Cape Town, South Africa. Unlike consumer-focused helpdesk tools, TeamSupport is purpose-built for business-to-business support teams that need to track relationships at the account level rather than just the individual ticket or user level. Its best-known feature is the Customer Distress Index (CDI), a proprietary account health score that blends product usage, sentiment, and support activity to flag at-risk customers before they churn. The platform includes ticketing, a customer portal, knowledge base, playbooks for automated workflows, and an AI assistant called Kevin AI. TeamSupport acquired live chat provider SnapEngage in 2021 to add messaging and live chat capabilities. Pricing starts at $45/month (billed annually) for the Starter plan, which supports up to 5 users, rising to $65/month for Professional (unlimited users) and $85/month for Scale (unlimited users, more playbooks, and analytics), with live chat and messaging available as a $15/agent/month add-on across all plans. TeamSupport is privately held and backed by growth investors including Level Equity, and is aimed at B2B software and technology companies whose support success depends on tracking whole-account health rather than isolated support interactions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3478a3af-daa1-4153-b114-3f47610904fd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3478a3af-daa1-4153-b114-3f47610904fd' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Customer Distress Index$q$, $q$Proprietary account-level health score combining usage, sentiment, and support activity.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Ticketing System$q$, $q$Centralized ticket management built for B2B account relationships.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Kevin AI$q$, $q$Built-in AI assistant for support workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Playbooks$q$, $q$Automated workflows and action sequences for support teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Customer Portal$q$, $q$Self-service portal for B2B customers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Knowledge Base$q$, $q$Searchable help content to deflect repetitive tickets.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Messaging and Live Chat$q$, $q$Add-on live chat and messaging via the SnapEngage acquisition.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Insights Analytics$q$, $q$Reporting and analytics add-on for support performance.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Purpose-built for B2B account-level support rather than generic ticketing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Customer Distress Index gives early warning on at-risk accounts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Unlimited users on Professional and Scale plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Combines ticketing, chat, knowledge base, and automation in one platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Established company with support operations since 2008$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Starter plan is capped at 5 users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Several features such as live chat, analytics, and extra playbooks are priced as separate add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Pricing can add up quickly once add-ons are included$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Smaller ecosystem and brand recognition than larger helpdesk platforms like Zendesk$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Assisted data import and professional services carry extra hourly or per-record fees$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$How much does TeamSupport cost?$q$, $q$Plans start at $45/month for Starter (billed annually, up to 5 users), $65/month for Professional, and $85/month for Scale (both with unlimited users).$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$What is the Customer Distress Index?$q$, $q$It is TeamSupport's proprietary account health score that combines usage, sentiment, and support activity to flag at-risk B2B customers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Is TeamSupport built for B2B or B2C support?$q$, $q$TeamSupport is specifically designed for B2B customer support, tracking relationships at the account level.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Does TeamSupport include live chat?$q$, $q$Live chat and messaging are available as a $15/agent/month add-on across all plans, via the SnapEngage acquisition.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Where is TeamSupport headquartered?$q$, $q$TeamSupport is headquartered in Dallas, Texas, with offices in Denver and Cape Town.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$When was TeamSupport founded?$q$, $q$TeamSupport was founded in 2008.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Does TeamSupport have an AI assistant?$q$, $q$Yes, TeamSupport includes an AI assistant called Kevin AI on Professional and Scale plans.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Are there additional fees beyond the subscription?$q$, $q$Yes, add-ons like extra playbooks, broadcast messages, analytics, and assisted data import carry separate costs.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$B2B Account Health Monitoring$q$, $q$B2B software companies use TeamSupport's Customer Distress Index to identify at-risk accounts before they churn.$q$, $q$B2B customer success and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Technical Support Ticketing$q$, $q$Technical support teams use TeamSupport's ticketing system and knowledge base to manage complex, multi-contact B2B support cases.$q$, $q$Technical support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Support Workflow Automation$q$, $q$Support operations teams use TeamSupport playbooks to automate repetitive escalation and follow-up workflows.$q$, $q$Support operations managers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Starter$q$, $q$$45/month$q$, $q$billed annually$q$, NULL, $q$["Up to 5 users","Ticketing","Messaging and live chat available as $15/agent/month add-on","AI tools","Basic training available"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Professional$q$, $q$$65/month$q$, $q$billed annually$q$, NULL, $q$["Unlimited users","All Starter features","Customer intelligence","Kevin AI","1 playbook","Customer portal","Knowledge base"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$Scale$q$, $q$$85/month$q$, $q$billed annually$q$, NULL, $q$["Unlimited users","All Professional features","3 playbooks","Insights analytics add-on","Custom fields","Automation","Broadcast messaging (500 messages/month)"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3478a3af-daa1-4153-b114-3f47610904fd';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$overview$q$, $q$What Is TeamSupport$q$, 2, ARRAY[$q$TeamSupport is a B2B customer support software company founded in 2008 and headquartered in Dallas, Texas, with additional offices in Denver and Cape Town. It is purpose-built for business-to-business support teams that need to track relationships at the account level rather than just the individual ticket.$q$, $q$Its best-known feature is the Customer Distress Index, a proprietary account health score that combines product usage, sentiment, and support activity to flag at-risk customers before they churn.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$TeamSupport includes ticketing, a customer portal, knowledge base, and playbooks for automated support workflows, along with a built-in AI assistant called Kevin AI. In 2021, TeamSupport acquired live chat provider SnapEngage to add messaging and live chat capabilities.$q$, $q$Higher-tier plans add more automation playbooks, custom fields, and an Insights analytics add-on for deeper reporting on support performance.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3478a3af-daa1-4153-b114-3f47610904fd', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$TeamSupport's published plans are Starter at $45/month (up to 5 users), Professional at $65/month, and Scale at $85/month, all billed annually with unlimited users on Professional and Scale. Live chat and messaging are available as a $15/agent/month add-on, and additional playbooks, analytics, and data import carry separate fees.$q$]::text[], 2);


-- ── Teamtailor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Teamtailor is a Swedish applicant tracking system and employer branding platform that helps companies attract, manage, and hire candidates through career sites and recruitment workflows.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$Custom pricing (reported to start around $229/month for small teams)$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$501-1,000 employees (LinkedIn); other estimates report 380-589 employees depending on source and date$q$, company_size),
  headquarters = COALESCE($q$Stockholm, Sweden$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Teamtailor Review: ATS and Employer Branding Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Teamtailor is an applicant tracking and employer branding platform from Stockholm. See features, pricing, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Teamtailor is a recruitment software company founded in 2013 and headquartered in Stockholm, Sweden, focused on applicant tracking (ATS) combined with employer branding tools. More than 13,000 companies across over 90 countries use Teamtailor to build branded career sites, manage job postings, track candidates through hiring pipelines, and collaborate on interviews and offers. The platform includes over 250 features, such as unlimited job postings, unlimited users, video interviewing, referral tools, GDPR-compliant candidate data handling, and integrations with LinkedIn and other HR tech. Teamtailor does not publish fixed pricing tiers; instead it uses a custom, quote-based model that scales with company size and hiring volume rather than a flat per-seat fee, with reported starting costs around $229/month (roughly $2,750/year) for small teams and mid-market companies often paying $6,000 to $15,000 per year. It offers a 14-day free trial and separate go-to-market tracks for small-to-midsize businesses versus enterprise organizations with 1,000+ employees. Teamtailor has grown into a company with several hundred employees across multiple continents and reported roughly $41.8 million in annual recurring revenue as of 2025, competing with recruitment platforms like Greenhouse, Lever, and Workable in the ATS and employer branding space.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '18a08b34-9438-45e5-b3b9-9e7969c6add2' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Career Site Builder$q$, $q$Build branded, customizable career pages without a developer.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Applicant Tracking$q$, $q$Manage candidates through configurable hiring pipelines.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Employer Branding Tools$q$, $q$Showcase company culture to attract passive candidates.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Unlimited Job Postings and Users$q$, $q$No per-job or per-seat caps included in the platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Video Interviewing$q$, $q$Conduct and review video interviews within the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Referral Program Tools$q$, $q$Built-in employee referral workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$GDPR-Compliant Data Handling$q$, $q$Candidate data management aligned with EU privacy rules.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$HR Tech Integrations$q$, $q$Connects with LinkedIn, job boards, and existing HR systems.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Strong employer branding tools alongside core ATS functionality$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Unlimited job postings and users included in every plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Wide integration coverage across job boards and HR tech$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Used by a large, established customer base of over 13,000 companies globally$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$14-day free trial available before committing to a quote$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$No published pricing, requiring a sales conversation for any quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Can be more expensive than lightweight ATS tools for very small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Pricing scales with company size, which can make costs less predictable$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Feature depth of 250+ features can mean a learning curve for smaller teams$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Primarily strongest for mid-market and enterprise hiring needs$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$How much does Teamtailor cost?$q$, $q$Teamtailor uses custom, quote-based pricing that scales with company size, with reported starting costs around $229/month for small teams.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Where is Teamtailor headquartered?$q$, $q$Teamtailor is headquartered in Stockholm, Sweden.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$When was Teamtailor founded?$q$, $q$Teamtailor was founded in 2013.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Does Teamtailor offer a free trial?$q$, $q$Yes, Teamtailor offers a 14-day free trial.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Are there user limits on Teamtailor plans?$q$, $q$No, Teamtailor includes unlimited job postings and unlimited users on its plans.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Does Teamtailor include employer branding tools?$q$, $q$Yes, employer branding and career site building are core parts of the platform, not just applicant tracking.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$How many companies use Teamtailor?$q$, $q$Teamtailor is used by more than 13,000 companies in over 90 countries.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Does Teamtailor serve enterprise companies?$q$, $q$Yes, Teamtailor has separate offerings for small-to-midsize businesses and enterprise organizations with 1,000+ employees.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Employer Branding and Career Sites$q$, $q$Talent teams use Teamtailor to build a branded career site that showcases culture and attracts passive candidates.$q$, $q$Talent acquisition and employer branding teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Structured Candidate Pipeline Management$q$, $q$Recruiters use Teamtailor's ATS to move candidates through configurable hiring stages with team collaboration.$q$, $q$Recruiters and hiring managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Enterprise-Scale Recruiting$q$, $q$Large organizations use Teamtailor's enterprise offering to standardize hiring workflows across departments and regions.$q$, $q$Enterprise HR and recruiting organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Small to Midsize Business$q$, $q$Custom quote (reported to start around $229/month)$q$, $q$annual or custom$q$, NULL, $q$["Unlimited job postings and users","Career site builder","Applicant tracking","Employer branding tools","Customer support for all users"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$Enterprise (1,000+ employees)$q$, $q$Custom quote$q$, $q$annual or custom$q$, NULL, $q$["All small to midsize business features","Advanced permissions and workflows for large organizations","Dedicated enterprise support","Scales to high-volume, multi-region hiring"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '18a08b34-9438-45e5-b3b9-9e7969c6add2';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$overview$q$, $q$What Is Teamtailor$q$, 2, ARRAY[$q$Teamtailor is a recruitment software company founded in 2013 and headquartered in Stockholm, Sweden, combining applicant tracking with employer branding tools. More than 13,000 companies in over 90 countries use it to manage hiring.$q$, $q$The platform is built around the idea that recruiting is also a marketing problem, giving companies tools to build a branded career site alongside a traditional ATS workflow.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Teamtailor includes a career site builder, configurable candidate pipelines, video interviewing, employee referral tools, and GDPR-compliant candidate data handling. Every plan includes unlimited job postings and unlimited users.$q$, $q$The platform integrates with LinkedIn and other HR tech, and offers over 250 features across sourcing, screening, interviewing, and offer management.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18a08b34-9438-45e5-b3b9-9e7969c6add2', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Teamtailor does not publish fixed pricing tiers; costs are quote-based and scale with company size and hiring volume rather than a flat per-seat fee. Reported starting costs are around $229/month for small teams, with mid-market companies often paying $6,000 to $15,000 per year. A 14-day free trial is available.$q$]::text[], 2);



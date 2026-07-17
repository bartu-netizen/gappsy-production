-- Enrichment batch: Vikunja, Kanboard, Wekan, Huly, Tuleap, YouTrack, Aha!, Productboard, ProdPad, airfocus, Dragonboat, Craft.io, Roadmunk, SharpCloud, ProductPlan, Portfoleon, Zeda.io, Savio, Canny, Frill, Nolt, Sleekplan, Upvoty, Featurebase, UserVoice, Stonly, Lucky Orange, UXCam, Contentsquare, Glassbox, Quantum Metric, Snowplow, RudderStack, Jitsu, Meltano, Singer, Mage, Node-RED, Latenode, KonnectzIT, Inngest, Webhook.site, Beeceptor, Mockoon, MockServer, WireMock, Bruno, Insomnia, HTTPie, Yaak, Scalar, Stoplight, ReadMe, Mintlify, Fern, Speakeasy, Bump.sh, Redocly, Docusaurus, MkDocs, VitePress, Nextra, Starlight, Sphinx, Material for MkDocs, Storybook, Chromatic, Percy, Applitools, BrowserStack
-- Publishes 70 bulk-imported tool(s) with full editorial content.

-- ── Vikunja ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hostable task manager with list, Kanban, Gantt, and table views.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€4/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vikunja: open-source task manager. Self-host free (AGPLv3) or use Vikunja Cloud from €4/month with a 14-day trial.$q$,
  og_description = $q$Vikunja: open-source task manager. Self-host free (AGPLv3) or use Vikunja Cloud from €4/month with a 14-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9d064484-1e39-4835-a77c-89f6fd35cc99';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9d064484-1e39-4835-a77c-89f6fd35cc99' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Multiple views$q$, $q$Organize work using List, Kanban, Gantt, or Table views for the same project.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Self-hosting$q$, $q$Fully open-source (AGPLv3) and free to self-host, giving teams control over their own data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Vikunja Cloud$q$, $q$A paid managed hosting option that handles updates and backups automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Task details$q$, $q$Tasks support due dates, labels, descriptions, and file attachments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Quick command search$q$, $q$A command-style search interface for fast navigation between tasks and projects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Import tools$q$, $q$Built-in migration from Todoist, Trello, and Microsoft To Do.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Sharing and collaboration$q$, $q$Projects can be shared with others, with tasks assignable to team members.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Open source (AGPLv3) and free to self-host indefinitely$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Multiple project views (List, Kanban, Gantt, Table) in one tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Built-in importers from Todoist, Trello, and Microsoft To Do$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Vikunja Cloud includes a 14-day free trial and cancel-anytime billing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Independent, bootstrapped project not backed by VC funding$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Self-hosting requires running and maintaining your own server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Cloud plans are paid — no permanently free hosted tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Attachment storage is capped by plan (10GB on Personal, 50GB on Organization)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Is Vikunja free?$q$, $q$Yes, if self-hosted — Vikunja is open source under AGPLv3. The managed Vikunja Cloud service is paid, starting at €4/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Is Vikunja open source?$q$, $q$Yes, its source code is publicly available under the AGPLv3 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Can I migrate my tasks from another app?$q$, $q$Vikunja includes built-in import tools for Todoist, Trello, and Microsoft To Do.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Does Vikunja Cloud offer a free trial?$q$, $q$Yes, all Vikunja Cloud plans include a 14-day free trial and can be cancelled anytime.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Is there a plan for teams?$q$, $q$Yes, the Organization plan is priced per user (€5/month, or €50/year with an annual discount) and supports unlimited teams.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Privacy-focused personal task management$q$, $q$Individuals who want to own their task data can self-host Vikunja or use the Personal cloud plan.$q$, $q$Individuals and privacy-conscious users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Self-hosted team project tracking$q$, $q$Organizations that prefer running their own infrastructure can self-host Vikunja under its open-source license.$q$, $q$IT teams and self-hosting organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Household task sharing$q$, $q$The Family plan supports up to 5 users sharing projects under a single subscription.$q$, $q$Families and households$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Personal$q$, $q$€4/month or €40/year$q$, $q$monthly$q$, $q$["1 user","Unlimited lists, tasks, reminders, filters, and share links","10GB attachment storage","Email and community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Family$q$, $q$€10/month or €99/year$q$, $q$monthly$q$, $q$["Up to 5 users","Shared household projects","One subscription, one bill"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$Organization$q$, $q$€5/user/month or €50/user/year$q$, $q$monthly$q$, $q$["Unlimited users and teams","50GB attachment storage","Priority email support","Centralized team billing"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$overview$q$, $q$What is Vikunja?$q$, 2, ARRAY[$q$Vikunja is an open-source task and project management application that can be self-hosted or used through its managed Vikunja Cloud service.$q$, $q$It offers List, Kanban, Gantt, and Table views for the same underlying tasks, along with built-in importers for Todoist, Trello, and Microsoft To Do.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', $q$who-its-for$q$, $q$Who Vikunja is for$q$, 2, ARRAY[$q$Vikunja suits individuals and organizations that want data ownership and are comfortable self-hosting an AGPLv3 open-source tool, as well as those who prefer a paid, managed cloud alternative with a 14-day trial.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d064484-1e39-4835-a77c-89f6fd35cc99', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Kanboard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Kanban board software for self-hosted project and task management.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Kanboard is a free, MIT-licensed, self-hosted Kanban board tool with WIP limits, automation, and LDAP/OAuth2 login.$q$,
  og_description = $q$Kanboard is a free, MIT-licensed, self-hosted Kanban board tool with WIP limits, automation, and LDAP/OAuth2 login.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd35f0bfc-a880-4f59-aa8f-867b297a21c1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd35f0bfc-a880-4f59-aa8f-867b297a21c1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Kanban board visualization$q$, $q$Drag-and-drop tasks between customizable columns to track project status.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Work-in-progress limits$q$, $q$Limit how many tasks can sit in a column at once to keep teams focused.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Subtasks, attachments, and comments$q$, $q$Tasks support subtasks, file attachments, and threaded comments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Search and filter query language$q$, $q$A dedicated query syntax for searching and filtering tasks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Automated actions$q$, $q$Trigger automated workflow actions based on task events.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$LDAP and OAuth2 authentication$q$, $q$Supports LDAP and OAuth2 login providers for team access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Multi-language interface$q$, $q$Translated into 30+ languages.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Completely free under the permissive MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Lightweight with a simple self-hosted installation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Large open-source contributor base (334+ contributors)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Automated workflow actions based on task events$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$LDAP and OAuth2 support for enterprise authentication$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$No official hosted/cloud version — self-hosting only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Requires ongoing server maintenance and updates by the user$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$No AI features$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Simpler, more minimal interface than many modern SaaS competitors$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Is Kanboard free?$q$, $q$Yes, Kanboard is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Does Kanboard offer a hosted/cloud version?$q$, $q$Kanboard is designed for self-hosted deployment; no official paid cloud hosting is offered on kanboard.org.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Can I use single sign-on with Kanboard?$q$, $q$Yes, Kanboard supports LDAP and OAuth2 authentication providers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Is Kanboard open source?$q$, $q$Yes, it is distributed under the MIT License with contributions from 334+ people.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Lightweight self-hosted Kanban$q$, $q$Small teams that want a simple, self-hosted Kanban board without SaaS subscription costs.$q$, $q$Small dev teams and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$On-premises project tracking$q$, $q$Organizations requiring full control over where task data is stored can run Kanboard on their own servers.$q$, $q$IT and security-conscious organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Workflow automation via query language$q$, $q$Teams that want to script filters and automated actions using Kanboard's built-in query syntax.$q$, $q$Technical teams and administrators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$Self-Hosted$q$, $q$Free$q$, NULL, $q$["Unlimited use, MIT licensed","Self-host on your own server","LDAP/OAuth2 authentication","30+ language translations"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$overview$q$, $q$What is Kanboard?$q$, 2, ARRAY[$q$Kanboard is a free, open-source Kanban board application built for self-hosted deployment. It emphasizes simplicity and visual clarity, letting teams organize tasks into customizable columns with drag-and-drop.$q$, $q$It is distributed under the MIT license and maintained by Frédéric Guillot along with more than 334 contributors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', $q$who-its-for$q$, $q$Who Kanboard is for$q$, 2, ARRAY[$q$Kanboard fits teams and individuals who want a free, self-hosted Kanban tool and are comfortable installing and maintaining it on their own infrastructure, including those who need LDAP or OAuth2 authentication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d35f0bfc-a880-4f59-aa8f-867b297a21c1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Wekan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted Kanban board built with Meteor and MongoDB under the MIT license.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$WeKan is a free, open-source Kanban board with Docker, Snap, and Sandstorm deployment options and 105+ languages.$q$,
  og_description = $q$WeKan is a free, open-source Kanban board with Docker, Snap, and Sandstorm deployment options and 105+ languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8d61482f-100a-4065-95f7-81efc054d452';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8d61482f-100a-4065-95f7-81efc054d452' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Real-time Kanban boards$q$, $q$Boards update in real time as collaborators make changes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Customizable cards and lists$q$, $q$Boards, lists, and cards can be configured to fit different workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Multiple deployment options$q$, $q$Deployable via Docker, Snap, Sandstorm, or direct source installation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Multi-language support$q$, $q$Translated into 105+ languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Active open development$q$, $q$Over 15,000 commits with 21,000+ GitHub stars and frequent updates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Optional commercial support$q$, $q$Paid commercial support is available separately via wekan.fi.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Fully free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Very active development with frequent updates$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Multiple deployment options (Docker, Snap, Sandstorm, source)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Large, active community (21,000+ GitHub stars, 3,000+ forks)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Translated into 105+ languages$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$No official free-hosted SaaS version — requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Runs on Node.js, Meteor, and MongoDB, requiring technical setup$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$4GB RAM recommended for production use$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Commercial support is a separate paid add-on$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Is WeKan free?$q$, $q$Yes, WeKan is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$How is WeKan deployed?$q$, $q$It can be self-hosted via Docker, Snap packages, Sandstorm, or installed directly from source.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Is commercial support available?$q$, $q$Yes, paid commercial support is offered separately through wekan.fi.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$What are the system requirements?$q$, $q$A minimum of 1GB RAM is required, with 4GB recommended for production deployments; it uses Node.js, Meteor, and MongoDB.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Self-hosted team Kanban$q$, $q$Teams wanting a free, self-hosted alternative to commercial Kanban tools.$q$, $q$Development and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Personal task boards$q$, $q$Individuals organizing personal projects visually with kanban-style cards.$q$, $q$Individual users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Multi-language deployments$q$, $q$Organizations needing a Kanban tool localized into one of 105+ supported languages.$q$, $q$International or multilingual teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["MIT license","Docker, Snap, and Sandstorm deployment","105+ languages"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$overview$q$, $q$What is Wekan?$q$, 2, ARRAY[$q$WeKan is a free, open-source Kanban board application that can be self-hosted using Docker, Snap, Sandstorm, or a direct source install.$q$, $q$The project is under active development, built on Node.js, Meteor, and MongoDB, and has accumulated over 15,000 commits and 21,000+ GitHub stars.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', $q$who-its-for$q$, $q$Who Wekan is for$q$, 2, ARRAY[$q$Wekan suits teams and individuals who want a free, actively-maintained, self-hosted Kanban board and are prepared to run their own Node.js/MongoDB infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8d61482f-100a-4065-95f7-81efc054d452', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Huly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, all-in-one platform combining project management, chat, docs, and video calls.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Huly is an open-source, all-in-one work platform with a free unlimited-user plan and paid tiers from $19.99/month.$q$,
  og_description = $q$Huly is an open-source, all-in-one work platform with a free unlimited-user plan and paid tiers from $19.99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9c31b644-e9f8-4a6c-b3aa-e7960053e0dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9c31b644-e9f8-4a6c-b3aa-e7960053e0dc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Team Planner$q$, $q$A centralized calendar showing individual tasks across the team.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Project management with GitHub sync$q$, $q$Track tasks and sync issues with GitHub repositories.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Virtual Office$q$, $q$Video and audio conferencing with customizable virtual spaces.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Chat$q$, $q$Direct messaging and group conversations built into the platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Collaborative documents$q$, $q$Real-time collaborative document editing with rich formatting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Unified inbox$q$, $q$Centralized notification management across the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Open source$q$, $q$Source code is publicly available on GitHub.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Free Common plan with unlimited users and 10GB storage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Open source and self-hostable via GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Combines project management, chat, docs, and video in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$GitHub sync for project tracking$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Usage-based paid tiers scale storage and video/audio traffic$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$AI features (Huly MetaBrain) are announced but not yet available$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Paid tiers are priced around storage/traffic caps rather than feature gates, which can be less predictable$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Newer platform with a smaller ecosystem than established competitors like Jira or Notion$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Is Huly free?$q$, $q$Yes, the Common plan is free with unlimited users, unlimited Huly objects, 10GB storage, and 10GB video/audio traffic.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$What do the paid Huly plans cost?$q$, $q$Rare is $19.99/month, Epic is $99.99/month, and Legendary is $399.99/month, each increasing storage and video/audio traffic allowances; custom pricing is also available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Is Huly open source?$q$, $q$Yes, its code is available on GitHub at hcengineering/platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Does Huly have AI features?$q$, $q$AI capabilities (referred to as Huly MetaBrain) are announced but listed as still in development at the time of writing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Replacing multiple SaaS tools$q$, $q$Teams wanting to consolidate Linear, Jira, Slack, and Notion-style tools into one platform.$q$, $q$Startups and small-to-mid teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Self-hosted all-in-one workspace$q$, $q$Organizations that want to self-host an open-source alternative to proprietary work platforms.$q$, $q$Self-hosting organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$GitHub-integrated project tracking$q$, $q$Development teams that want project tasks synced directly with GitHub.$q$, $q$Software development teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Common$q$, $q$Free$q$, NULL, $q$["Unlimited users","10GB storage per workspace","10GB video/audio traffic"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Rare$q$, $q$$19.99/month$q$, $q$monthly$q$, $q$["Unlimited users","100GB storage","100GB video/audio traffic"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Epic$q$, $q$$99.99/month$q$, $q$monthly$q$, $q$["Unlimited users","1TB storage","500GB video/audio traffic"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$Legendary$q$, $q$$399.99/month$q$, $q$monthly$q$, $q$["Unlimited users","10TB storage","2TB video/audio traffic"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$overview$q$, $q$What is Huly?$q$, 2, ARRAY[$q$Huly is an open-source, all-in-one platform that bundles project management, team chat, collaborative documents, and video conferencing into a single workspace.$q$, $q$It offers a free Common plan with unlimited users, and paid tiers (Rare, Epic, Legendary) that scale storage and video/audio traffic allowances.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', $q$who-its-for$q$, $q$Who Huly is for$q$, 2, ARRAY[$q$Huly suits teams looking to replace several separate tools (project tracking, chat, docs, video) with one platform, including those who want an open-source, self-hostable option.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9c31b644-e9f8-4a6c-b3aa-e7960053e0dc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Tuleap ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Application Lifecycle Management platform for agile planning, requirements, and testing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tuleap is an open-source ALM platform for agile project management, requirements traceability, and test management.$q$,
  og_description = $q$Tuleap is an open-source ALM platform for agile project management, requirements traceability, and test management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '932248d2-07e2-4834-ad47-abd847ca7ad8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '932248d2-07e2-4834-ad47-abd847ca7ad8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Agile project management$q$, $q$Supports Scrum, Kanban, and hybrid agile frameworks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Requirements management$q$, $q$Baseline tracking and requirements traceability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Test management$q$, $q$Centralized test planning and validation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$SAFe program management$q$, $q$Support for scaled agile (SAFe) at the enterprise level.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Issue tracking and DevOps$q$, $q$Integrated Git repositories and CI/CD capabilities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Compliance and traceability$q$, $q$Supports ISO, ASPICE, and IEC 62304 compliance requirements.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Flexible deployment$q$, $q$Available as cloud, on-premises, or air-gapped deployments, including France-based hosting for data sovereignty.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Open-source, auditable core with no proprietary black box$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Strong compliance support (ISO, ASPICE, IEC 62304) for regulated industries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Flexible deployment: cloud, on-premises, or air-gapped$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Covers the full ALM lifecycle in one platform (planning, requirements, testing, DevOps)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Tuleap Campus offers a free option for educational/community use$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Enterprise pricing is not publicly listed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Broad feature set may be more complex than needed for small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Now part of the Dassault Systèmes portfolio, which may shift product direction over time$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Is Tuleap open source?$q$, $q$Yes, Tuleap has an open-source, auditable core.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$What is Tuleap Campus?$q$, $q$A free offering intended for educational and community use.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Can Tuleap be self-hosted?$q$, $q$Yes, it supports on-premises and air-gapped deployments in addition to cloud hosting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Who develops Tuleap?$q$, $q$Tuleap is developed by Enalean SAS, a European software company, and the product has joined the Dassault Systèmes portfolio.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Regulated industry compliance$q$, $q$Teams needing ISO, ASPICE, or IEC 62304 traceability for medical, automotive, or aerospace software.$q$, $q$Regulated engineering and medical device teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Open-source ALM for enterprises$q$, $q$Organizations wanting an auditable, open-source alternative to proprietary ALM suites.$q$, $q$Enterprise IT and engineering organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Scaled agile program management$q$, $q$Enterprises running SAFe programs across multiple teams.$q$, $q$Large agile organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$Tuleap Campus$q$, $q$Free$q$, NULL, $q$["Educational and community use"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$overview$q$, $q$What is Tuleap?$q$, 2, ARRAY[$q$Tuleap is an open-source Application Lifecycle Management (ALM) platform that centralizes agile project management, requirements traceability, test management, and DevOps in one tool.$q$, $q$It is developed by Enalean SAS and offers cloud, on-premises, and air-gapped deployment options, with a free Tuleap Campus tier for education and community use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', $q$who-its-for$q$, $q$Who Tuleap is for$q$, 2, ARRAY[$q$Tuleap fits organizations in regulated industries needing compliance traceability, as well as enterprises wanting an open-source, self-hostable ALM platform covering the full development lifecycle.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('932248d2-07e2-4834-ad47-abd847ca7ad8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── YouTrack ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$JetBrains' project management and issue tracker, free for teams of up to 10 users.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$4.50/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$YouTrack by JetBrains is a free issue tracker for teams up to 10 users, with paid Cloud plans from $4.50/user/month.$q$,
  og_description = $q$YouTrack by JetBrains is a free issue tracker for teams up to 10 users, with paid Cloud plans from $4.50/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2f12a930-1f2e-4928-8d88-770f30751680';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2f12a930-1f2e-4928-8d88-770f30751680' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Free for small teams$q$, $q$Free for teams of up to 10 users.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Agile boards$q$, $q$Board-based views for tracking issues and project management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Helpdesk projects$q$, $q$Free for up to 3 support agents with unlimited reporters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Cloud and self-hosted options$q$, $q$Available as JetBrains-hosted Cloud or a self-managed Server/on-prem deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Free trial$q$, $q$A free trial is available for evaluating paid tiers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$JetBrains ecosystem integration$q$, $q$Built by JetBrains, the company behind IntelliJ IDEA and other developer tools.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Completely free for teams of up to 10 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Helpdesk projects free for up to 3 agents with unlimited reporters$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Per-user Cloud pricing decreases at higher user volumes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Choice of Cloud or self-hosted deployment$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Backed by JetBrains, an established developer tools company$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$JetBrains raised Cloud per-user prices effective October 2025$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Per-user pricing model can become costly for larger teams (11+ users)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Detailed self-hosted/Server pricing was not confirmed on the pages reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Is YouTrack free?$q$, $q$Yes, YouTrack Cloud is free for teams of up to 10 users, and Helpdesk projects are free for up to 3 agents.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$How much does YouTrack cost beyond 10 users?$q$, $q$As of October 2025 pricing, Cloud subscriptions start around $5.40/user/month billed monthly or $4.50/user/month billed annually, with per-user rates decreasing as more users are added.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Does YouTrack offer a free trial?$q$, $q$Yes, a free trial is available via the product's download/trial page.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Who makes YouTrack?$q$, $q$YouTrack is developed by JetBrains.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Free issue tracking for small teams$q$, $q$Teams of up to 10 users can use YouTrack Cloud at no cost.$q$, $q$Small teams and startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Developer-centric project management$q$, $q$Teams already using JetBrains IDEs who want an integrated issue tracker.$q$, $q$Software development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Customer support ticketing$q$, $q$Support teams can use YouTrack's Helpdesk projects, free for up to 3 agents.$q$, $q$Customer support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 10 users","Helpdesk free for up to 3 agents, unlimited reporters"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$Cloud (paid)$q$, $q$From $4.50/user/month (annual) or $5.40/user/month (monthly)$q$, $q$monthly$q$, $q$["For 11+ users","Per-user rate decreases at higher volumes"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$overview$q$, $q$What is YouTrack?$q$, 2, ARRAY[$q$YouTrack is a project management and issue tracking tool made by JetBrains. It is free for teams of up to 10 users and offers paid Cloud plans beyond that, with per-user pricing that decreases at scale.$q$, $q$It also includes Helpdesk-style support projects, free for up to 3 agents with unlimited reporters, and can be deployed via JetBrains' Cloud or as a self-hosted instance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', $q$who-its-for$q$, $q$Who YouTrack is for$q$, 2, ARRAY[$q$YouTrack suits small teams that want a free issue tracker, as well as larger development and support organizations, particularly those already using other JetBrains developer tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2f12a930-1f2e-4928-8d88-770f30751680', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Aha! ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Product management suite for roadmapping, strategy, ideas, and delivery, with a 30-day free trial.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$74.59/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Aha! is a product management suite for roadmaps, strategy, and delivery, starting at $74.59/user/month with a free trial.$q$,
  og_description = $q$Aha! is a product management suite for roadmaps, strategy, and delivery, starting at $74.59/user/month with a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d3b022c-eecd-4869-9efc-0b614824aa91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d3b022c-eecd-4869-9efc-0b614824aa91' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Roadmaps$q$, $q$Strategic planning and roadmap visualization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Discovery$q$, $q$Customer interview management for product research.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Ideas$q$, $q$Feedback collection and idea consolidation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Whiteboards$q$, $q$Collaborative ideation and wireframing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Builder$q$, $q$AI-powered prototype and application creation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Aha! Develop and Teamwork$q$, $q$Engineering workflow management and project delivery coordination.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Elle AI assistant$q$, $q$An AI assistant built into the platform to accelerate product work.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Free read-only users$q$, $q$On Enterprise and Enterprise+ plans, reviewer and viewer seats are free.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Comprehensive suite covering strategy through delivery in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Free reviewer/viewer seats on Enterprise and Enterprise+ plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Built-in Elle AI assistant and AI-powered Aha! Builder$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$40+ tool integrations included even on the entry Premium plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$30-day free trial to evaluate before purchasing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$No public free plan — paid only, starting at $74.59/user/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Many capabilities (Discovery, Builder, Develop, Teamwork, Knowledge Advanced) are priced as separate add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Enterprise+ requires annual billing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Premium pricing tier makes it a bigger investment than lighter product-management tools$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Does Aha! offer a free plan?$q$, $q$No public free plan is offered; Aha! provides a 30-day free trial instead.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$What is the starting price for Aha!?$q$, $q$The Premium plan starts at $74.59 per user per month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Are viewer and reviewer seats free?$q$, $q$Yes, on the Enterprise and Enterprise+ plans, read-only users (reviewers and viewers) are free.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Does Aha! have AI features?$q$, $q$Yes, it includes the Elle AI assistant and Aha! Builder, an AI-powered prototype and application creation tool.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Can I add other Aha! products individually?$q$, $q$Yes, products like Aha! Discovery, Develop, Teamwork, and Builder are available as separate add-ons with their own per-user pricing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$End-to-end product management$q$, $q$Product teams wanting one suite spanning strategy, roadmapping, ideas, and delivery tracking.$q$, $q$Product management teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Enterprise stakeholder visibility$q$, $q$Organizations that need many read-only stakeholders to view roadmaps without paying per seat.$q$, $q$Enterprise organizations with large stakeholder groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$AI-assisted prototyping$q$, $q$Teams that want to generate prototypes and applications with Aha! Builder's AI capabilities.$q$, $q$Product and design teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Premium$q$, $q$$74.59/user/month$q$, $q$monthly$q$, $q$["Strategy setting","Roadmap building","Dependency management","AI assistant access","Whiteboards and ideas capture","40+ integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Enterprise$q$, $q$$124.99/user/month$q$, $q$monthly$q$, $q$["All read-only users free","Aha! Teamwork and Develop integration","Unlimited free reviewers and viewers"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$Enterprise+$q$, $q$$149/user/month$q$, $q$annual$q$, $q$["All read-only users free","OKRs and capacity planning","Custom tables and worksheets","Advanced license management","Power BI integration"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$overview$q$, $q$What is Aha!?$q$, 2, ARRAY[$q$Aha! is a product management platform made up of several integrated products — Roadmaps, Discovery, Ideas, Whiteboards, Builder, Develop, Teamwork, and Knowledge — covering the full cycle from strategy to delivery.$q$, $q$Plans start at $74.59 per user per month on the Premium tier, with higher Enterprise tiers offering free read-only seats and additional capabilities like OKRs and capacity planning.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', $q$who-its-for$q$, $q$Who Aha! is for$q$, 2, ARRAY[$q$Aha! suits product teams and larger enterprises that want a single, comprehensive suite for roadmapping, feedback, and delivery, especially organizations with many stakeholders who only need read-only visibility.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d3b022c-eecd-4869-9efc-0b614824aa91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Productboard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Product management platform for centralizing feedback, roadmapping, and AI-assisted spec generation.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/maker/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Productboard centralizes customer feedback and roadmaps, with a free plan and paid tiers from $19/maker/month.$q$,
  og_description = $q$Productboard centralizes customer feedback and roadmaps, with a free plan and paid tiers from $19/maker/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '44247eb4-4fad-4252-a448-315159706699';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '44247eb4-4fad-4252-a448-315159706699' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Customer insights$q$, $q$Centralize feedback from multiple sources and identify trends.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Roadmapping$q$, $q$Align teams on priorities and communicate product direction.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$AI spec generation (Spark)$q$, $q$Convert ideas into delivery-ready specifications using built-in AI agents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Strategic planning$q$, $q$Connect feature ideas to business objectives and goals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Cross-functional collaboration$q$, $q$Shared workspace for product managers, developers, leadership, marketing, and sales.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Impact measurement$q$, $q$Track outcomes from specs through shipped features.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Product usage integrations$q$, $q$Connects with tools like Amplitude and Mixpanel on paid plans.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Spark AI features included across all plans, with monthly AI credits$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Business plan includes a 14-day free trial$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Used by large companies including Autodesk, Zoom, Salesforce, and Coca-Cola$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Enterprise plan adds SAML SSO and SCIM provisioning$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$AI usage is capped by monthly credits, with paid top-ups required beyond that$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Business plan requires a minimum of 2 makers; Enterprise requires a minimum of 5$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Free plan is limited to 500 feedback notes, 25 contributors, and 1 teamspace$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Business/Enterprise per-maker pricing rises quickly compared to the Free/Plus tiers$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Does Productboard have a free plan?$q$, $q$Yes, the Free plan includes unlimited roadmaps, 500 feedback notes, 25 contributors, and 1 teamspace at $0/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$What is the starting paid price?$q$, $q$The Plus plan starts at $19/maker/month billed annually, or $25/maker/month billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Is there a free trial?$q$, $q$Yes, the Business plan offers a 14-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Does Productboard include AI features?$q$, $q$Yes, all plans include Spark AI features with a monthly AI credit allowance that scales by plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$What does the Enterprise plan add?$q$, $q$Enterprise adds unlimited contributors, SAML SSO, SCIM provisioning, custom roles/permissions, and a Salesforce integration, with a minimum of 5 makers.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Centralizing customer feedback$q$, $q$Product teams that need to aggregate feedback from many channels into one place.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Free entry-level roadmapping$q$, $q$Small teams or startups that want a no-cost roadmap tool before upgrading.$q$, $q$Startups and small product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Enterprise product operations$q$, $q$Larger organizations needing SSO, SCIM, and custom permissions for product management at scale.$q$, $q$Enterprise product organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["50 AI credits/month shared","Unlimited roadmaps","500 feedback notes","25 contributors","1 teamspace","1 product portal"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Plus$q$, $q$$19/maker/month (annual) or $25/maker/month (monthly)$q$, $q$monthly$q$, $q$["250 AI credits/maker/month","Manual and dynamic customer segments","Feedback loop closing","Amplitude and Mixpanel integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Business$q$, $q$$59/maker/month (annual, min. 2 makers) or $75/maker/month (monthly)$q$, $q$monthly$q$, $q$["500 AI credits/maker/month","Unlimited feedback notes and teamspaces","Shared skills library","2 product portals","14-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$Enterprise$q$, $q$Custom (min. 5 makers, annual billing)$q$, $q$annual$q$, $q$["800 AI credits/maker/month","Unlimited contributors","SAML SSO and SCIM provisioning","Custom roles and permissions","Salesforce integration"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$overview$q$, $q$What is Productboard?$q$, 2, ARRAY[$q$Productboard is a product management platform that centralizes customer feedback, helps teams build and align on roadmaps, and uses built-in AI (Spark) to turn ideas into delivery-ready specifications.$q$, $q$It offers a free plan alongside paid Plus, Business, and Enterprise tiers priced per 'maker' (active product team member), with AI credit allowances that scale by plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44247eb4-4fad-4252-a448-315159706699', $q$who-its-for$q$, $q$Who Productboard is for$q$, 2, ARRAY[$q$Productboard fits product teams of any size — from startups using the free plan to enterprise product organizations that need SSO, SCIM, and custom permissions on the Enterprise tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44247eb4-4fad-4252-a448-315159706699', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44247eb4-4fad-4252-a448-315159706699', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44247eb4-4fad-4252-a448-315159706699', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44247eb4-4fad-4252-a448-315159706699', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44247eb4-4fad-4252-a448-315159706699', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── ProdPad ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Product management software for building lean roadmaps, managing ideas, and tracking OKRs with AI-assisted feedback synthesis.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ProdPad is product management software combining roadmaps, idea management, feedback, and OKRs, with an AI CoPilot and a free trial.$q$,
  og_description = $q$ProdPad is product management software combining roadmaps, idea management, feedback, and OKRs, with an AI CoPilot and a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f214525d-5b01-44d9-b029-88a13d27b4e6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f214525d-5b01-44d9-b029-88a13d27b4e6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Now-Next-Later roadmaps$q$, $q$Build lean, timeline-free roadmaps using the Now-Next-Later framework invented by ProdPad's founders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Idea management$q$, $q$Capture, organize, and prioritize product ideas in a dedicated backlog separate from the roadmap.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Customer feedback hub$q$, $q$Collect feedback from customers and internal teams, then use AI to detect recurring patterns and themes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$OKRs and objectives$q$, $q$Track objectives and key results and connect them directly to roadmap initiatives.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Product portfolio management$q$, $q$Manage multiple products or roadmaps together for organizations with more than one product line.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$ProdPad CoPilot$q$, $q$An AI assistant that helps write roadmap content, prioritize ideas, and summarize customer feedback.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Integrations$q$, $q$Connects to delivery and collaboration tools including Jira, Azure DevOps, GitHub, Trello, Slack, Salesforce, Intercom, Linear, Confluence, and Microsoft Teams.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Invented the widely used Now-Next-Later roadmap format$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Built by the founders of Mind the Product, giving it deep roots in the PM community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Free trial requires no credit card and can be extended by completing onboarding tasks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Unlimited free 'Reviewer' accounts let stakeholders view and comment without a paid seat$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Broad set of integrations with delivery tools like Jira and Azure DevOps$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Specific plan names and per-seat pricing are not published; you must start a trial or contact sales to see pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Reviewer accounts have limited permissions compared to full paid seats$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Does ProdPad offer a free trial?$q$, $q$Yes. ProdPad offers a minimum 7-day free trial with no credit card required, and the trial can be extended beyond 30 days by completing certain tasks in the product.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Is there a free plan?$q$, $q$ProdPad doesn't publish a permanent free tier for editors, but it offers unlimited free 'Reviewer' accounts that can add and edit ideas and feedback with limited viewing permissions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$What is the Now-Next-Later roadmap?$q$, $q$It's a roadmap framework invented by ProdPad's founders that organizes work into Now, Next, and Later horizons instead of fixed dates.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Does ProdPad have AI features?$q$, $q$Yes. ProdPad CoPilot is built into the product to help with writing, prioritization, organization, and synthesizing customer feedback.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$What tools does ProdPad integrate with?$q$, $q$ProdPad integrates with delivery and collaboration tools including Jira, Azure DevOps, GitHub, Trello, Slack, Salesforce, Intercom, Linear, Confluence, and Microsoft Teams.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Lean roadmapping without fixed dates$q$, $q$Product teams use the Now-Next-Later framework to communicate priorities without committing to exact delivery dates.$q$, $q$Product managers and product leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Centralizing customer feedback$q$, $q$Teams funnel feedback from multiple channels into ProdPad and use AI to spot recurring themes that inform the roadmap.$q$, $q$Product and customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Connecting OKRs to delivery$q$, $q$Organizations track objectives and key results alongside the roadmap items meant to achieve them.$q$, $q$Product leaders and executives$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Free Trial$q$, $q$Free$q$, NULL, $q$["Minimum 7-day trial, extendable beyond 30 days","No credit card required","Access to all features during the trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$Enterprise$q$, NULL, NULL, $q$["Custom pricing for large organizations","Requires contacting sales"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$overview$q$, $q$What is ProdPad?$q$, 2, ARRAY[$q$ProdPad is product management software that connects roadmaps, idea management, customer feedback, and OKRs in one system. It was created by Janna Bastow and Simon Cast, co-founders of Mind the Product, and popularized the Now-Next-Later roadmap format that many product teams use today.$q$, $q$The platform includes ProdPad CoPilot, an AI assistant that helps with writing roadmap content, prioritizing ideas, and summarizing customer feedback, alongside integrations with tools like Jira, Azure DevOps, and Slack.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', $q$who-its-for$q$, $q$Who ProdPad is for$q$, 2, ARRAY[$q$ProdPad is aimed at product managers and product leaders who want to separate strategic roadmapping from delivery tracking, and who need a dedicated place to manage ideas and feedback before they become roadmap commitments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f214525d-5b01-44d9-b029-88a13d27b4e6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── airfocus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered product management platform for prioritization, roadmapping, and OKRs, built by Lucid Software.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$airfocus is an AI-powered product management platform for prioritization, portfolio roadmaps, and OKRs, part of Lucid Software. No free trial.$q$,
  og_description = $q$airfocus is an AI-powered product management platform for prioritization, portfolio roadmaps, and OKRs, part of Lucid Software. No free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1630ac29-62d1-433c-a8cb-b173926de875';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1630ac29-62d1-433c-a8cb-b173926de875' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$AI-powered prioritization$q$, $q$Uses AI to help product teams prioritize initiatives and support decisions based on strategy, feedback, and roadmap data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$OKRs and objectives$q$, $q$Tracks objectives and key results alongside roadmap items.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Portfolio roadmaps$q$, $q$Visualizes roadmaps across multiple products with dependency tracking between initiatives.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Customer feedback and insights$q$, $q$Surfaces patterns automatically from incoming customer feedback.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Branded customer portal$q$, $q$Lets customers submit and track feedback through a portal branded to your company.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$AI agents and MCP server$q$, $q$Includes AI agents for feedback triage and PRD co-authoring that work alongside tools like Claude and Copilot via an MCP server.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Risk and drift detection$q$, $q$Flags portfolio-level risks and blockers in real time.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$AI agents work alongside external tools like Claude and Copilot via an MCP server$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Portfolio-level dependency tracking and risk/drift detection for complex organizations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$EU-based hosting option is offered$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Backed by Lucid Software, a larger visual collaboration company$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Discounted pricing available for eligible startups, nonprofits, and educational organizations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$No free trial; evaluating the product requires booking a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Pricing for both plans (Professional and Enterprise) is not published and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Advanced integrations (Jira Server, Azure DevOps Server, Salesforce) and SSO/SCIM are reserved for the Enterprise tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Does airfocus offer a free trial?$q$, $q$No. airfocus states it does not offer a free trial, but prospective customers can book a personalized demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$What plans does airfocus offer?$q$, $q$airfocus offers a Professional plan and an Enterprise plan, both billed monthly or annually with pricing available on request.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Does airfocus include AI features?$q$, $q$Yes. airfocus includes an AI agent for tasks like feedback triage, an insights agent on the Enterprise plan, and an MCP server that lets it work with external AI tools like Claude and Copilot.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Is airfocus part of another company?$q$, $q$Yes, airfocus is part of Lucid Software.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Does airfocus offer discounts?$q$, $q$Yes, discounted pricing is available for eligible startups, nonprofits, and educational organizations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Portfolio-level product prioritization$q$, $q$Product leaders use airfocus to prioritize initiatives across multiple products with AI-assisted decision support.$q$, $q$Product leaders at multi-product organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Centralizing customer feedback$q$, $q$Teams collect feedback through a branded customer portal and let AI surface recurring patterns.$q$, $q$Product and customer-facing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Tracking OKRs alongside delivery$q$, $q$Enterprise customers connect OKRs and portfolio management to see how initiatives ladder up to strategic goals.$q$, $q$Enterprise product organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Professional$q$, NULL, $q$monthly$q$, $q$["Unlimited contributors and workspaces","Roadmaps and advanced prioritization","3-level custom hierarchy","Feedback management and branded portal","Core integrations","airfocus AI agent and MCP server"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$Enterprise$q$, NULL, $q$monthly$q$, $q$["Everything in Professional","Objectives and OKRs","Portfolio management and capacity planning","Insights agent and activity reporting","Unlimited hierarchy levels","Jira Server, Azure DevOps Server, and Salesforce integrations","Portal SSO, IP whitelisting, SAML SSO, and SCIM provisioning","Enterprise onboarding and training"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$overview$q$, $q$What is airfocus?$q$, 2, ARRAY[$q$airfocus is a product management platform, part of Lucid Software, that combines strategy, customer insights, and roadmapping with AI-assisted prioritization. It includes AI agents for feedback triage and PRD drafting, plus an MCP server that lets it connect to external AI tools like Claude and Copilot.$q$, $q$The platform is built for organizations managing multiple products, offering portfolio roadmaps with dependency tracking and automatic risk or drift detection across the portfolio.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', $q$who-its-for$q$, $q$Who airfocus is for$q$, 2, ARRAY[$q$airfocus targets product leaders and teams at larger, complex organizations that need portfolio-level visibility rather than a single team's roadmap. There is no free trial, so evaluation happens through a demo.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1630ac29-62d1-433c-a8cb-b173926de875', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Dragonboat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Dragonboat is a product portfolio management platform using AI agents to align strategy, planning, and delivery across enterprise teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dragonboat is an AI-powered product portfolio operating system for strategy, planning, and PDLC management, with Starter and Enterprise plans.$q$,
  og_description = $q$Dragonboat is an AI-powered product portfolio operating system for strategy, planning, and PDLC management, with Starter and Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Portfolio operating system$q$, $q$Acts as a live semantic source of truth for product portfolio data, connecting strategy, intake, planning, and roadmap apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Strategies and Outcomes$q$, $q$Connects OKRs to roadmaps and tracks planned versus actual outcomes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Headless API and MCP access$q$, $q$Provides a headless API and Model Context Protocol (MCP) access so AI agents can interact with portfolio data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Ambient Agent$q$, $q$An AI agent that automatically tracks and reports across the product development lifecycle (PDLC), integrating with Jira, Azure DevOps, Asana, and Slack.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Impact analysis$q$, $q$Runs real-time impact analysis to detect ripple effects and risk across the portfolio.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Customer insights$q$, $q$Centralizes customer insights to inform planning decisions.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Includes a headless API and MCP server for connecting AI agents to portfolio data$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Starter plan includes free read-only and requestor access for up to 100 users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$SOC 2 certified with a stated policy that customer data is not used for external model training$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Integrates with common delivery tools including Jira, Azure DevOps, Asana, and Slack$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$No pricing is published for either the Starter or Enterprise plan; both require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$No free trial is mentioned$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Advanced capabilities like two-factor authentication, SSO, and a dedicated Customer Success Manager are reserved for the Enterprise tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Does Dragonboat offer a free trial?$q$, $q$No free trial is mentioned on the pricing page; both the Starter and Enterprise plans require contacting sales for pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$What is included in the free access on Dragonboat's Starter plan?$q$, $q$The Starter plan includes free read-only and requestor access for up to 100 users, alongside paid access for editors.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Does Dragonboat support AI agents?$q$, $q$Yes. Dragonboat provides a headless API and MCP (Model Context Protocol) access so AI agents can read and act on portfolio data, plus its own Ambient Agent that tracks and reports across the PDLC.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Is Dragonboat SOC 2 certified?$q$, $q$Yes, Dragonboat states it is SOC 2 certified and does not use customer data to train external models.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$What integrations does Dragonboat support?$q$, $q$Dragonboat integrates with Jira, Azure DevOps, Asana, and Slack, with additional connectors available via API.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Enterprise portfolio orchestration$q$, $q$CPOs and product operations leaders use Dragonboat to get unified visibility across a large portfolio of products and initiatives.$q$, $q$Chief Product Officers and product operations leaders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Connecting strategy to delivery$q$, $q$Teams link OKRs to roadmap items and track planned versus actual outcomes over time.$q$, $q$Product managers and product leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$AI-agent-driven reporting$q$, $q$Organizations use the Ambient Agent and API/MCP access to automate tracking and reporting across the PDLC.$q$, $q$Product operations and engineering-adjacent teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Starter$q$, NULL, NULL, $q$["Ambient Agent for auto-tracking and reporting across the PDLC","Integrations with Jira, Azure DevOps, Asana, and Slack","Strategies and Outcomes connecting OKRs to roadmaps","Customer insights and product roadmapping","Free read-only and requestor access for up to 100 users"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$Enterprise$q$, NULL, NULL, $q$["Everything in Starter","Support for complex organizational structures and taxonomies","Portfolio-level insights with trend analysis and risk prediction","Advanced integrations with data transformation","Two-factor authentication and SSO","Dedicated Customer Success Manager"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$overview$q$, $q$What is Dragonboat?$q$, 2, ARRAY[$q$Dragonboat is a product portfolio management platform that positions itself as an 'ontology-native operating system,' giving executives, product teams, and AI agents a shared, live view of strategy, investments, and product lifecycle data.$q$, $q$It includes built-in apps for strategy, intake, planning, and roadmapping, along with a headless API and MCP (Model Context Protocol) access that lets external AI agents read and act on portfolio data. An Ambient Agent automatically tracks and reports across the product development lifecycle.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', $q$who-its-for$q$, $q$Who Dragonboat is for$q$, 2, ARRAY[$q$Dragonboat is built for enterprise organizations, particularly CPOs, CTOs, and product operations leaders who manage complex, multi-team product portfolios and want AI-assisted visibility across strategy and delivery.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe1e4171-5d16-4d7e-a68f-6c8c85d5aa76', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Craft.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Craft.io is an end-to-end product management platform combining strategy, feedback, prioritization, roadmapping, and built-in Guru AI.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/editor/month (billed annually, Starter plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Craft.io is a product management platform with roadmapping, feedback, OKRs, and built-in Guru AI, starting at $19/editor/month billed annually.$q$,
  og_description = $q$Craft.io is a product management platform with roadmapping, feedback, OKRs, and built-in Guru AI, starting at $19/editor/month billed annually.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '78f287c8-68d3-4606-a4ac-c4ef808b1063';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '78f287c8-68d3-4606-a4ac-c4ef808b1063' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Guru AI$q$, $q$Built-in AI that automates epic summarization, release note creation, and go-to-market brief preparation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Roadmapping and backlog management$q$, $q$Combines visual roadmaps with backlog and feature definition tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Prioritization frameworks$q$, $q$Includes multiple built-in frameworks for prioritizing backlog items.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Feedback collection$q$, $q$Collects and organizes customer feedback alongside the product backlog.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$OKRs and product strategy$q$, $q$Available as an add-on for tracking objectives and key results tied to roadmap execution.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Dependency management$q$, $q$Tracks dependencies between roadmap items on the Pro plan and above.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Design tool integrations$q$, $q$Connects to Figma, Adobe XD, Sketch, Mural, Axure, InVision, and Miro on the Pro plan and above.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Portfolio management$q$, $q$Enterprise plan supports multi-level OKRs, portfolio roadmaps, and cross-product dependencies.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Unlimited free contributor and viewer seats; only editors, team leaders, and admins require paid licenses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Guru AI is included even on the entry-level Starter plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Broad integration list including Jira, Azure DevOps, GitHub, GitLab, Confluence, Figma, and Salesforce$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$OKRs, feedback portal, and capacity planning are paid add-ons on the Starter and Pro plans rather than included$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Slack and Microsoft Teams integrations were not yet available at the time of review$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Enterprise pricing is custom and requires a demo$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$How much does Craft.io cost?$q$, $q$Craft.io's Starter plan costs $24/editor/month billed monthly, or $19/editor/month billed annually. The Pro plan is $99/editor/month monthly or $79/editor/month annually. Enterprise pricing is custom.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Does Craft.io offer a free trial?$q$, $q$Yes, Craft.io offers a 14-day free trial that doesn't require a credit card.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Are viewer and contributor seats free on Craft.io?$q$, $q$Yes. Only editors, team leaders, and admins need a paid license; contributors and viewers are unlimited and free.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$What AI features does Craft.io include?$q$, $q$Craft.io includes Guru AI, which automates epic summaries, release notes, and go-to-market briefs, on all plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$What's included in Craft.io's add-ons?$q$, $q$OKRs and product strategy, the feedback portal, and capacity planning are available as add-ons for $20/month ($15/month billed annually) on the Starter and Pro plans, and are included by default on Enterprise.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$End-to-end product management$q$, $q$Teams use Craft.io to move from strategy and feedback through prioritization and roadmapping in one platform.$q$, $q$Product managers and product owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Portfolio and cross-team roadmaps$q$, $q$Enterprise customers manage multi-level OKRs and cross-product dependencies across a product portfolio.$q$, $q$Chief Product Officers and product portfolio managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$AI-assisted documentation$q$, $q$Product teams use Guru AI to generate release notes and go-to-market briefs from existing product data.$q$, $q$Product managers and product operations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Starter$q$, $q$$24/editor/month monthly, $19/editor/month billed annually$q$, $q$monthly$q$, $q$["Unlimited free contributors","Single workspace","Up to 3 workspace views and 3 personal views","Up to 5 custom fields","Roadmaps, backlog management, and prioritization","Guru templates, views, and Guru AI"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Pro$q$, $q$$99/editor/month monthly, $79/editor/month billed annually$q$, $q$monthly$q$, $q$["Everything in Starter","Unlimited workspaces, custom fields, and Guru views","Unlimited prioritization frameworks","Dependency management","Design tool integrations (Figma, Adobe XD, and others)","LiveShare and automated progress tracking"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$Enterprise$q$, NULL, $q$annual$q$, $q$["Everything in Pro","Product portfolio management","Multi-level OKRs and portfolio roadmaps","Cross-product dependencies and automation rules","All add-ons included","SSO, SAML, and audit logs","Slack, Microsoft Teams, and Salesforce integrations","Dedicated customer success manager and 24/7 priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$overview$q$, $q$What is Craft.io?$q$, 2, ARRAY[$q$Craft.io is an end-to-end product management platform covering strategy, feedback collection, prioritization, roadmapping, and execution in one workspace. It includes Guru AI, a built-in assistant for epic summaries, release notes, and go-to-market briefs.$q$, $q$Pricing is seat-based: only editors, team leaders, and admins require a paid license, while contributor and viewer seats are unlimited and free. Plans range from a $19-$24/editor/month Starter tier to custom Enterprise pricing with portfolio management and cross-product dependencies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', $q$who-its-for$q$, $q$Who Craft.io is for$q$, 2, ARRAY[$q$Craft.io is built for product managers, product owners, and product operations teams, scaling from small teams on the Starter plan up to Chief Product Officers managing multi-product portfolios on Enterprise.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78f287c8-68d3-4606-a4ac-c4ef808b1063', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Roadmunk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Roadmunk, now Tempo's Strategic Roadmaps, is a roadmapping platform for visualizing product strategy and tracking cross-team dependencies.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/editor/month (billed annually, Starter plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Roadmunk (now Strategic Roadmaps by Tempo) offers roadmapping, idea management, and dependency tracking, starting at $19/editor/month annually.$q$,
  og_description = $q$Roadmunk (now Strategic Roadmaps by Tempo) offers roadmapping, idea management, and dependency tracking, starting at $19/editor/month annually.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Multiple roadmap views$q$, $q$Build roadmaps in timeline, swimlane, and table formats.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Idea Manager$q$, $q$Prioritize and manage a backlog of ideas separately from the roadmap.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Portfolio roadmaps$q$, $q$Aggregate multiple team roadmaps into one portfolio view on the Business plan and above.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Dependency tracking$q$, $q$Shows dependencies between projects across teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Customer feedback collection$q$, $q$Collects feedback and links it to roadmap items on the Business plan and above.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Two-way Jira/Azure DevOps sync$q$, $q$Optional add-on on Business, included on Professional, for two-way syncing with Jira and Azure DevOps.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$14-day free trial with access to Business-tier features, including native Jira integration$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$ISO/IEC 27001 and 27701 certified, with GDPR and AICPA SOC compliance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Wide integration list: Jira, Azure DevOps, Asana, Monday.com, Pivotal Tracker, Shortcut, Trello, GitHub, and GitLab$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Backed by Tempo, giving it continued investment after the acquisition$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$The Roadmunk brand has been folded into Tempo as 'Strategic Roadmaps (Roadmunk),' and roadmunk.com now redirects to Tempo's site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Two-way Jira/Azure DevOps sync is an extra add-on on the Business plan ($9/collaborator/month) rather than included$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Enterprise pricing is custom and requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Is Roadmunk still a separate product?$q$, $q$Roadmunk has been rebranded as 'Strategic Roadmaps (Roadmunk)' under Tempo, and roadmunk.com now redirects to Tempo's website.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$How much does Roadmunk/Strategic Roadmaps cost?$q$, $q$The Starter plan is $19/editor/month, Business is $49/editor/month, and Professional is $99/editor/month, all billed annually. Enterprise pricing is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Does it offer a free trial?$q$, $q$Yes, a 14-day free trial provides access to Business-tier features, minus API tokens.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$What integrations does it support?$q$, $q$It integrates with Jira, Azure DevOps, Asana, Monday.com, Pivotal Tracker, Shortcut, Trello, GitHub, and GitLab, plus SSO.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Cross-team dependency visibility$q$, $q$Product and engineering teams track dependencies between projects across a shared roadmap.$q$, $q$Product managers and engineering leads$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Idea-to-roadmap workflow$q$, $q$Teams capture and prioritize ideas in the Idea Manager before promoting them onto the roadmap.$q$, $q$Product managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Executive-ready roadmap presentations$q$, $q$Teams build boardroom-ready timeline and swimlane roadmaps for stakeholder updates.$q$, $q$Product leaders and executives$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Starter$q$, $q$$19/editor/month$q$, $q$annual$q$, $q$["Unlimited roadmaps","One-way sync with Jira, Azure DevOps, and Trello","Shareable roadmaps","3 reviewers included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Business$q$, $q$$49/editor/month$q$, $q$annual$q$, $q$["Everything in Starter","Feedback and collection insights","Customizable portals","Idea management","Portfolio roadmaps and dependencies","API access","5 reviewers included","Optional two-way Jira/Azure DevOps sync at $9/collaborator/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Professional$q$, $q$$99/editor/month$q$, $q$annual$q$, $q$["Everything in Business","Advanced visualizations","Real-time publishing for roadmaps","Usage reports","SSO integration","Two-way Jira/Azure DevOps sync included","10 reviewers included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$Enterprise$q$, NULL, $q$annual$q$, $q$["Everything in Professional","Private cloud","Advanced customization","Custom reviewer limits"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$overview$q$, $q$What is Roadmunk?$q$, 2, ARRAY[$q$Roadmunk is a product roadmapping platform for creating and sharing timeline, swimlane, and table-based roadmaps, alongside an Idea Manager for prioritizing a separate backlog. It has been acquired by Tempo and is now marketed as 'Strategic Roadmaps (Roadmunk),' with roadmunk.com redirecting to Tempo's website.$q$, $q$Paid plans run from a $19/editor/month Starter tier to a $99/editor/month Professional tier (both billed annually), plus custom Enterprise pricing. A 14-day free trial gives access to Business-tier features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', $q$who-its-for$q$, $q$Who Roadmunk is for$q$, 2, ARRAY[$q$Roadmunk is aimed at product managers and cross-functional teams that need dependency tracking and multiple roadmap visualizations, now positioned within Tempo's broader Jira-focused product suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9bd53de-0b4e-4fb9-8496-c57e0f61e8eb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SharpCloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SharpCloud, part of Lumivero, is a strategic portfolio management platform connecting data sources into interactive visual decision views.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Denver, Colorado, United States$q$,
  languages = '{}',
  seo_meta_description = $q$SharpCloud is a strategic portfolio management platform, part of Lumivero, with interactive visualizations, dependency mapping, and scenarios.$q$,
  og_description = $q$SharpCloud is a strategic portfolio management platform, part of Lumivero, with interactive visualizations, dependency mapping, and scenarios.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3fab6cc8-c5a3-4994-9a63-35d7fa62bebc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Data integration$q$, $q$Connects portfolio, project, and risk data across existing business systems without replacing them.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Interactive visualizations$q$, $q$Offers timeline, grid, radar, and kanban views for exploring complex portfolio data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Dependency mapping$q$, $q$Shows how initiatives, risks, and outcomes interconnect.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Scenario modeling$q$, $q$Supports what-if analysis and trade-off evaluation across the portfolio.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Automated data sync$q$, $q$Scheduled synchronization from source systems such as Excel, SharePoint, Microsoft Project, Azure DevOps, and Jira.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Flexible deployment$q$, $q$Available as SaaS on Microsoft Azure (US, UK, EU, and government cloud regions) or on-premises/private cloud on Windows or Linux/Docker.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Used by enterprise and government clients including Network Rail and the UK Ministry of Defence, per the company's client list$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Supports both SaaS and on-premises/private cloud deployment$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$SAML 2.0 SSO integration with Azure Active Directory and Okta$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Connects to a wide range of existing enterprise systems (Excel, SharePoint, Microsoft Project, Azure DevOps, Jira, SQL databases) rather than requiring data migration$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Pricing is not published; all three license tiers (Creator, Collaborator, Read-Only) require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Minimum license counts apply per tier (e.g., minimum 50 Read-Only licenses)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$No SharpCloud-specific AI features were disclosed on its product page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$What license tiers does SharpCloud offer?$q$, $q$SharpCloud offers Creator (minimum 2 licenses), Collaborator (minimum 5 licenses), and Read-Only (minimum 50 licenses) tiers, all billed annually.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Is SharpCloud cloud-based or on-premises?$q$, $q$Both. SharpCloud is available as SaaS on Microsoft Azure across US, UK, EU, and government cloud regions, or as an on-premises/private cloud deployment on Windows or Linux/Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Who owns SharpCloud?$q$, $q$SharpCloud is owned by Lumivero and remains branded as SharpCloud within Lumivero's Risk & Decision software suite.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$What industries use SharpCloud?$q$, $q$SharpCloud's stated clients span aerospace and defense, energy, manufacturing, financial services, and government, including Amcor, Network Rail, and the UK Ministry of Defence.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Strategic portfolio management$q$, $q$Enterprises consolidate portfolio, project, and risk data from multiple systems into one interactive view.$q$, $q$Portfolio and program managers at large enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Risk and dependency visualization$q$, $q$Teams map dependencies between initiatives, risks, and outcomes to support decision-making.$q$, $q$Risk and strategy teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Regulated or on-premises deployments$q$, $q$Government and defense organizations deploy SharpCloud on-premises or in private cloud where SaaS isn't permitted.$q$, $q$Government and defense agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Creator$q$, NULL, $q$annual$q$, $q$["Full platform access","Minimum 2 licenses"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Collaborator$q$, NULL, $q$annual$q$, $q$["Data maintenance and exploration access","Minimum 5 licenses"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$Read-Only$q$, NULL, $q$annual$q$, $q$["View and comment only","Minimum 50 licenses"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$overview$q$, $q$What is SharpCloud?$q$, 2, ARRAY[$q$SharpCloud is a strategic portfolio management platform, now part of Lumivero, that connects data from existing business systems into a single interactive environment for visualizing portfolios, mapping dependencies, and running scenario analysis.$q$, $q$It's deployed either as SaaS on Microsoft Azure across several regions or on-premises/private cloud on Windows or Linux/Docker, and licensed through three annually billed tiers: Creator, Collaborator, and Read-Only.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', $q$who-its-for$q$, $q$Who SharpCloud is for$q$, 2, ARRAY[$q$SharpCloud targets large enterprises and government/defense organizations managing complex portfolios, particularly those in aerospace, energy, manufacturing, and financial services who need to connect existing systems rather than replace them.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fab6cc8-c5a3-4994-9a63-35d7fa62bebc', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── ProductPlan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ProductPlan is a product management platform combining visual roadmapping with AI-moderated customer research surveys.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ProductPlan combines visual roadmapping with AI-moderated research surveys and a Research Agent, used by 1,000+ companies. Pricing via demo.$q$,
  og_description = $q$ProductPlan combines visual roadmapping with AI-moderated research surveys and a Research Agent, used by 1,000+ companies. Pricing via demo.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '73f568cf-6fdf-4904-bb21-3fb27cb40d1c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Visual timeline roadmaps$q$, $q$Builds roadmaps designed to be readable across the whole organization, not just the product team.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$AI-moderated research$q$, $q$Runs customer research surveys with AI-generated adaptive follow-up questions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Research Agent$q$, $q$An AI agent that answers questions about customer research data in plain language.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Portfolio visibility$q$, $q$Shows roadmaps across multiple products and teams in one view.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Jira integration$q$, $q$Native integration with Jira to align roadmap plans with engineering execution.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Prioritization frameworks$q$, $q$Includes customizable frameworks for prioritizing roadmap items.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Milestone-based launch planning$q$, $q$Plans product launches around key milestones.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Unlimited viewers are included at no extra cost; pricing is based only on active editors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$AI-moderated research surveys automatically synthesize responses into structured insights$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Stated scale: 1,000+ customers, 23M+ initiatives planned, and 860K roadmaps built$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$4.3/5 rating on G2, per the company's own site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$No public pricing; all tiers require booking a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$No free trial or free plan mentioned$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Native integration is limited to Jira, with other tools requiring the API$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$How is ProductPlan priced?$q$, $q$ProductPlan uses a seat-based model charging only for editors who build and manage roadmaps; viewers are included at no additional cost. Specific per-seat pricing isn't published and requires a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Does ProductPlan offer a free trial?$q$, $q$No free trial is mentioned on ProductPlan's site; pricing details require booking a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$What is the Research Agent?$q$, $q$It's an AI feature that lets users ask questions about customer research data and get answers in plain language.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Does ProductPlan integrate with Jira?$q$, $q$Yes, ProductPlan has a native Jira integration to keep roadmap plans aligned with engineering work, plus an API for other integrations.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$How many customers use ProductPlan?$q$, $q$ProductPlan states it has more than 1,000 customers, with over 23 million initiatives planned and 860,000 roadmaps built on the platform.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Organization-wide roadmap communication$q$, $q$Product teams share visual timeline roadmaps that non-technical stakeholders can understand.$q$, $q$Product managers and executive stakeholders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Evidence-based prioritization$q$, $q$Teams run AI-moderated customer research surveys and feed synthesized insights directly into roadmap decisions.$q$, $q$Product managers and researchers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$Cross-team portfolio visibility$q$, $q$Organizations with 3 to 20+ product managers use ProductPlan to see roadmaps across multiple products and teams.$q$, $q$Product leaders at multi-team organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$overview$q$, $q$What is ProductPlan?$q$, 2, ARRAY[$q$ProductPlan is a product management platform that pairs visual, timeline-based roadmapping with AI-moderated customer research. Its Research Agent lets users ask questions about customer data in plain language, and survey responses are automatically synthesized into structured insights.$q$, $q$The company reports more than 1,000 customers and 860,000 roadmaps built on the platform. Pricing is seat-based, charging only for editors while viewers are unlimited and free, but specific rates are not published and require a demo.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', $q$who-its-for$q$, $q$Who ProductPlan is for$q$, 2, ARRAY[$q$ProductPlan is aimed at product teams ranging from 3 to 20+ product managers across industries like SaaS, insurance, fintech, retail, manufacturing, and government, who need both roadmapping and customer research in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73f568cf-6fdf-4904-bb21-3fb27cb40d1c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Portfoleon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Portfoleon is portfolio planning software for prioritizing projects against OKRs with timeline, spreadsheet, Kanban, and pivot table views.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$48/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Portfoleon is portfolio planning software with OKRs, scenario planning, and multiple views, priced at $48/user/month with a free trial.$q$,
  og_description = $q$Portfoleon is portfolio planning software with OKRs, scenario planning, and multiple views, priced at $48/user/month with a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4754e964-cca0-48dc-adc6-88e29e111bd1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4754e964-cca0-48dc-adc6-88e29e111bd1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Weighted OKRs$q$, $q$Set objectives and key results with weighted importance to guide project prioritization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Project prioritization$q$, $q$Prioritizes projects based on their contribution to strategic outcomes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Scenario planning$q$, $q$Supports multiple plan versions for what-if scenario comparisons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Multiple visualization boards$q$, $q$Includes timeline, spreadsheet, Kanban, and pivot table views of the same portfolio data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Resource allocation$q$, $q$Identifies resource bottlenecks across the portfolio.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Progress monitoring$q$, $q$Tracks progress throughout the execution cycle.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Only editor accounts are billed; unlimited free read-only accounts are included$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Multiple view types (timeline, spreadsheet, Kanban, pivot table) built on the same underlying data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Free trial available via sign-up$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Integrates with Zapier, Jira, Azure DevOps, Asana, Mailchimp, Slack, and Trello$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Perpetual, self-hosted licensing option available under the Enterprise plan$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Run by a small team, which may limit support responsiveness compared to larger vendors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$No AI capabilities were disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Enterprise pricing is custom and requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$How much does Portfoleon cost?$q$, $q$The Portfolio plan costs $48/user/month billed monthly, with a discounted annual option saving 20%. Enterprise pricing is custom, including a perpetual self-hosted option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Does Portfoleon offer a free trial?$q$, $q$Yes, a free trial is available through sign-up.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Are read-only accounts free on Portfoleon?$q$, $q$Yes, Portfoleon offers unlimited free read-only accounts; only editor accounts require a paid subscription.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$What integrations does Portfoleon support?$q$, $q$Portfoleon integrates with Zapier, Jira, Azure DevOps, Asana, Mailchimp, Slack, and Trello, and offers an API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$OKR-driven project prioritization$q$, $q$Teams weight objectives and key results to prioritize which projects to fund and staff.$q$, $q$Portfolio and program managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Scenario comparison$q$, $q$Planners build multiple plan versions to compare trade-offs before committing resources.$q$, $q$Strategy and planning teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Resource bottleneck identification$q$, $q$Teams use resource allocation views to spot where capacity is constrained across the portfolio.$q$, $q$Resource and capacity planners$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Portfolio$q$, $q$$48/user/month$q$, $q$monthly$q$, $q$["Unlimited portfolios, boards, and custom fields","Unlimited users and items","Drafts and revisions","Single sign-on","Resource management","Unlimited free read-only accounts"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$Enterprise$q$, NULL, NULL, $q$["Custom configuration","Perpetual self-hosted licensing option available"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$overview$q$, $q$What is Portfoleon?$q$, 2, ARRAY[$q$Portfoleon is portfolio planning software built to turn strategy into action by weighting OKRs and prioritizing projects based on their contribution to those outcomes. It offers timeline, spreadsheet, Kanban, and pivot table views of the same portfolio data, plus scenario planning across multiple plan versions.$q$, $q$Pricing is per editor at $48/user/month, with unlimited free read-only accounts included, and an Enterprise tier that adds a perpetual, self-hosted licensing option.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', $q$who-its-for$q$, $q$Who Portfoleon is for$q$, 2, ARRAY[$q$Portfoleon is aimed at portfolio and strategy teams that need to connect OKRs to project prioritization and compare multiple planning scenarios before committing resources.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4754e964-cca0-48dc-adc6-88e29e111bd1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zeda.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zeda.io is an AI-powered product discovery platform that centralizes customer feedback to generate insights and prioritize roadmaps.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$499/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Zeda.io is an AI product discovery platform for centralizing feedback and prioritizing roadmaps, starting at $499/month with a 14-day trial.$q$,
  og_description = $q$Zeda.io is an AI product discovery platform for centralizing feedback and prioritizing roadmaps, starting at $499/month with a 14-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7ac86fa0-12e3-4373-bceb-3db29dc3719e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Centralized Voice of Customer$q$, $q$Collects feedback from Slack, Intercom, surveys, interviews, and other sources into one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$AI feedback analysis$q$, $q$Analyzes incoming feedback automatically and generates insight reports.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Ask AI$q$, $q$A generative AI tool for testing hypotheses against collected feedback data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Opportunity Radar$q$, $q$Uses AI to predictively identify emerging issues and opportunities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Impact-first roadmaps$q$, $q$Builds roadmaps and OKRs prioritized by revenue and customer impact.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$In-app feedback widgets and portals$q$, $q$Collects feedback directly in-product and through public or private customer portals.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$5,000+ integrations via Zapier$q$, $q$Connects to CRM, communication, and analytics tools through Zapier.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$14-day free trial available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$90-day prorated refund guarantee if unsatisfied$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$AI-powered insight generation and an 'Ask AI' natural-language query tool over feedback data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Offers migration support from competing tools including ProductBoard, Aha!, Airfocus, UserVoice, and Canny$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Notable stated clients include Microsoft, Twilio, PayPal, and Google$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$No monthly billing option; the Standard plan requires an annual commitment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Starting price of $499/month is higher than many competitors' entry-level plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Custom/demo-based pricing beyond the published Standard plan is not detailed publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$How much does Zeda.io cost?$q$, $q$Zeda.io's Standard plan starts at $499/month, billed annually. There is no monthly billing option.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Does Zeda.io offer a free trial?$q$, $q$Yes, a 14-day free trial is available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Does Zeda.io offer refunds?$q$, $q$Yes, Zeda.io states a 90-day refund guarantee with a prorated refund if you're unsatisfied.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$What is Ask AI?$q$, $q$Ask AI is a generative AI tool in Zeda.io that lets teams test hypotheses and query feedback data in natural language.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Why doesn't Zeda.io offer monthly billing?$q$, $q$Zeda.io states its yearly commitment is meant to align both companies toward a longer-term partnership rather than a month-to-month arrangement.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Centralizing scattered customer feedback$q$, $q$Teams pull feedback from Slack, Intercom, surveys, and interviews into one system instead of tracking it manually.$q$, $q$Product and customer success teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$AI-assisted opportunity discovery$q$, $q$Product teams use Opportunity Radar and Ask AI to surface emerging issues before they escalate.$q$, $q$Product managers at SaaS and B2B companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Revenue-aligned roadmapping$q$, $q$Teams prioritize roadmap items using impact-first scoring tied to revenue and OKRs.$q$, $q$Product leaders focused on business impact$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$Standard$q$, $q$$499/month$q$, $q$annual$q$, $q$["Auto feedback capture and centralization","5,000+ integrations via Zapier","AI product insights and validation tools","Revenue-first roadmaps with OKRs","AI-powered release notes","Call transcript and CSV import","Public/private customer portals","In-app feedback widgets"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$overview$q$, $q$What is Zeda.io?$q$, 2, ARRAY[$q$Zeda.io is an AI-powered product discovery platform that centralizes Voice of Customer data from sources like Slack, Intercom, surveys, and interviews, then uses AI to generate insight reports and predict emerging opportunities through its Opportunity Radar feature.$q$, $q$Its Standard plan starts at $499/month, billed annually only, with a 14-day free trial and a 90-day prorated refund guarantee. The company reports clients including Microsoft, Twilio, PayPal, and Google.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', $q$who-its-for$q$, $q$Who Zeda.io is for$q$, 2, ARRAY[$q$Zeda.io is aimed at product, customer success, sales, and marketing teams at SaaS and B2B companies that need to turn scattered customer feedback into prioritized, revenue-aligned roadmaps.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7ac86fa0-12e3-4373-bceb-3db29dc3719e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Savio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Savio centralizes customer feature requests from Slack, HubSpot, Intercom, and more so teams can prioritize by revenue.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Savio centralizes feature requests from HubSpot, Intercom, Slack, and more, letting product teams prioritize by ARR and votes.$q$,
  og_description = $q$Savio centralizes feature requests from HubSpot, Intercom, Slack, and more, letting product teams prioritize by ARR and votes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69b064f9-d2d3-4029-9481-48380ca63924';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69b064f9-d2d3-4029-9481-48380ca63924' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Centralized feedback collection$q$, $q$Aggregates feature requests from Slack, HubSpot, Intercom, Zendesk, Salesforce, and Help Scout into one inbox.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Revenue-based prioritization$q$, $q$Sorts requests by number of requesters, total ARR, opportunity value, and account MRR.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$CRM data filtering$q$, $q$Filters and segments feature requests using customer data pulled from HubSpot or Salesforce.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Structured intake forms$q$, $q$Custom fields let Sales and Customer Success teams log feedback consistently.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Dev tool sync$q$, $q$Pushes feature-request status updates from Jira, Linear, or Shortcut back into the connected CRM.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Public voting boards$q$, $q$Lets customers vote on and follow feature requests directly.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Ties feature requests directly to ARR and account value for revenue-driven prioritization$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Wide range of native integrations, including HubSpot, Salesforce, Intercom, Zendesk, Slack, and Help Scout$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Unlimited free (non-admin) users on every plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$14-day free trial with no credit card required$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Entry-level Essential plan includes only 1 paid user before per-seat charges apply$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$CRM integrations (HubSpot, Salesforce) are limited to the higher Business tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Enterprise pricing is not published and requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Does Savio offer a free plan?$q$, $q$No, Savio does not offer a permanently free plan, but it provides a 14-day free trial with no credit card required, plus unlimited free (non-admin) users on every paid plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$What tools does Savio integrate with?$q$, $q$Savio integrates with Slack, HubSpot, Intercom, Zendesk, Salesforce, Help Scout, Jira, Linear, Shortcut, Segment.com, and Zapier, plus a Chrome extension and API.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$How much does Savio cost?$q$, $q$Paid plans start at $39/month for Essential, with Professional at $79/month and Business at $249/month; Enterprise pricing is custom.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Can Sales and Customer Success teams use Savio?$q$, $q$Yes, Savio includes structured data-entry fields designed for Sales and Success teams to log customer feedback.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Revenue-driven roadmap prioritization$q$, $q$Product teams rank feature requests by total ARR and requester count to decide what to build next.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Consolidating scattered feedback$q$, $q$Teams pull feature requests out of Slack threads, support tickets, and CRM notes into one searchable system.$q$, $q$Product and support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Sales-to-product feedback loop$q$, $q$Sales reps log feature gaps encountered in deals so product teams can see which requests affect revenue.$q$, $q$Sales teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Essential$q$, $q$$39/month$q$, $q$monthly$q$, $q$["1 paid user (additional at $23/mo)","Unlimited free users","Basic prioritization","1 roadmap","Voting board","Intercom, Help Scout, Slack integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Professional$q$, $q$$79/month$q$, $q$monthly$q$, $q$["1 paid user (additional at $39/mo)","Customer segmentation","5 roadmaps","Product areas","Chrome extension","Zendesk, Zapier, API, Shortcut, Jira integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Business$q$, $q$$249/month$q$, $q$monthly$q$, $q$["1 paid user (additional at $49/mo)","Multiple products","Unlimited roadmaps","Segment.com integration","HubSpot and Salesforce CRM integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["SLAs","Priority support","Custom onboarding","Custom contracts","DPA","Invoice billing"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$overview$q$, $q$What is Savio?$q$, 2, ARRAY[$q$Savio is a feedback management platform that centralizes customer feature requests pulled from tools like Slack, HubSpot, Intercom, Zendesk, Salesforce, and Help Scout into a single, searchable system.$q$, $q$Instead of relying on spreadsheets or scattered channels, teams use Savio to sort requests by number of requesters, total ARR, and account MRR, then sync status updates back to Jira, Linear, or Shortcut.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', $q$who-its-for$q$, $q$Who Savio is for$q$, 2, ARRAY[$q$Savio suits product, sales, and customer success teams at B2B software companies that want feature requests weighed against revenue data from HubSpot or Salesforce rather than raw vote counts alone.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69b064f9-d2d3-4029-9481-48380ca63924', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Canny ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Canny is an AI feedback platform that captures requests from sales and support calls and ranks them by revenue impact.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$79/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Canny captures feedback with AI Autopilot, ranks requests by revenue impact, and offers roadmaps and changelogs. Free plan available.$q$,
  og_description = $q$Canny captures feedback with AI Autopilot, ranks requests by revenue impact, and offers roadmaps and changelogs. Free plan available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de66f380-8299-4b3a-b413-b14569d70119';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de66f380-8299-4b3a-b413-b14569d70119' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$AI Autopilot$q$, $q$Automatically captures feedback from sales calls, support tickets, and other conversations without manual entry.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Centralized feedback repository$q$, $q$Aggregates customer requests from Slack, Gong, Intercom, Salesforce, HubSpot, and more into one board.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Revenue-based prioritization$q$, $q$Ranks feature requests by revenue impact and customer demand.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Public roadmap$q$, $q$Shares planned, in-progress, and shipped features with customers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Product changelog$q$, $q$Announces released features back to the users who requested them.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Feedback portal$q$, $q$Collects structured suggestions directly from customers through a dedicated channel.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$AI Autopilot reduces manual feedback logging from calls and tickets$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Broad integration list including Salesforce, HubSpot, Gong, Slack, Jira, and Zendesk$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Used at scale, with Canny citing 100K+ registered companies$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Business-tier pricing (CRM integrations, SSO) is custom and not published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Free plan is capped at 25 tracked users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Pro plan billed monthly (~$95/month) costs more than the discounted annual rate ($79/month)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Does Canny have a free plan?$q$, $q$Yes, Canny offers a free plan supporting up to 25 tracked users with unlimited feedback and access to Autopilot AI.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$How much does Canny's Pro plan cost?$q$, $q$The Pro plan is $79/month when billed yearly (about $95/month billed monthly) and supports 100+ tracked users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$What does Canny's AI Autopilot do?$q$, $q$It automatically captures feedback from sales calls, support conversations, and other customer communications instead of requiring manual entry.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$What integrations does Canny support?$q$, $q$Canny integrates with Slack, Gong, Intercom, Salesforce, HubSpot, Zapier, GitHub, Zendesk, Jira, Asana, and ClickUp, among 20+ platforms.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Revenue-informed roadmapping$q$, $q$Product teams rank features by revenue impact instead of raw vote counts alone.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Sales feature-gap tracking$q$, $q$Sales organizations quantify feature gaps encountered with prospects.$q$, $q$Sales teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Customer success expansion signals$q$, $q$CS managers spot expansion and churn-prevention opportunities from aggregated feedback.$q$, $q$Customer success teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["25 tracked users","Unlimited feedback","Autopilot AI"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Pro$q$, $q$$79/month (billed yearly)$q$, $q$annual$q$, $q$["100+ tracked users","PM integrations","Advanced privacy"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$Business$q$, $q$Custom$q$, NULL, $q$["5,000+ tracked users","SSO integrations","CRM integrations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$overview$q$, $q$What is Canny?$q$, 2, ARRAY[$q$Canny is a customer feedback platform that captures, organizes, and prioritizes feature requests to help product teams decide what to build next.$q$, $q$Its AI Autopilot feature automatically pulls feedback out of sales calls, support conversations, and other customer communications, while a revenue-weighted prioritization model helps teams rank requests by business impact rather than vote count alone.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', $q$who-its-for$q$, $q$Who Canny is for$q$, 2, ARRAY[$q$Canny fits product teams, sales organizations, and customer success managers who want a shared, revenue-aware view of customer feedback, plus a public roadmap and changelog to close the loop with users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de66f380-8299-4b3a-b413-b14569d70119', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Frill ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Frill is a customer feedback platform with an ideas board, public roadmap, changelog, and surveys, embeddable on any site.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Frill lets teams collect ideas, run a public roadmap, publish changelogs, and send surveys, with plans starting at $25/month.$q$,
  og_description = $q$Frill lets teams collect ideas, run a public roadmap, publish changelogs, and send surveys, with plans starting at $25/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '03aaf3ac-9023-4be0-9d5d-f55fb6fecd05' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Ideas board$q$, $q$Customers vote, comment, and follow feature requests.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Public roadmap$q$, $q$Drag-and-drop, reprioritizable roadmap that can be embedded on a website.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Announcements and changelog$q$, $q$Release notifications shown through an embeddable widget.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Surveys$q$, $q$NPS, CSAT, polls, and open feedback surveys.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Priority matrix$q$, $q$Visual 2D benefit-vs-cost analysis to help weigh ideas.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$White labeling$q$, $q$Removes Frill branding and adds a custom domain on higher tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$SSO and custom domains$q$, $q$Enterprise authentication options for larger teams.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Wide integration catalog, cited by Frill as 100+ integrations including Jira, Slack, Zendesk, and Linear$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$All paid tiers include unlimited teammates, tracked users, SSO, webhooks, and API access$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Priority matrix gives a visual way to weigh ideas by benefit vs. cost$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$No permanently free plan; only a 14-day trial is offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Entry-level Startup plan is capped at 50 ideas and 1 survey$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$White labeling and privacy controls require the pricier Growth tier ($149/month) or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Does Frill have a free plan?$q$, $q$No, Frill does not list a permanently free plan; it offers a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$What's included in Frill's cheapest plan?$q$, $q$The Startup plan ($25/month) includes 50 ideas, 1 survey, and unlimited admins and widgets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Can I remove Frill branding?$q$, $q$Yes, white labeling to remove Frill branding is available as an add-on and is included starting at the Growth tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Does Frill integrate with other tools?$q$, $q$Yes, Frill states it offers 100+ integrations, including Jira, Slack, Zendesk, and Linear.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Public roadmap communication$q$, $q$Teams share what's planned, in progress, and shipped with customers via an embeddable roadmap.$q$, $q$Product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Structured customer surveys$q$, $q$Teams run NPS, CSAT, and open feedback surveys alongside idea collection.$q$, $q$SaaS companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Idea collection widget$q$, $q$Sites embed a voting board directly into their product or marketing site.$q$, $q$Product and marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Startup$q$, $q$$25/month$q$, $q$monthly$q$, $q$["50 ideas","1 survey","Unlimited admins and widgets"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Business$q$, $q$$49/month$q$, $q$monthly$q$, $q$["Everything in Startup","Unlimited ideas","3 surveys"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Growth$q$, $q$$149/month$q$, $q$monthly$q$, $q$["Everything in Business","Unlimited surveys","Privacy controls","White labeling"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$Enterprise$q$, $q$$349/month$q$, $q$monthly$q$, $q$["SOC2 compliance","Audit logs","IP whitelisting","Dedicated hosting and support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$overview$q$, $q$What is Frill?$q$, 2, ARRAY[$q$Frill is an all-in-one customer feedback platform that lets product teams collect ideas, run a public roadmap, publish changelogs, and send surveys, all embeddable directly inside a product or website.$q$, $q$Paid plans scale from a $25/month Startup tier up to a $349/month Enterprise tier with SOC2 compliance, audit logs, and IP whitelisting, and every paid plan includes SSO, webhooks, and API access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', $q$who-its-for$q$, $q$Who Frill is for$q$, 2, ARRAY[$q$Frill suits product teams and SaaS companies that want a single embeddable widget for feedback collection, roadmap sharing, and release announcements without stitching together separate tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('03aaf3ac-9023-4be0-9d5d-f55fb6fecd05', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Nolt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nolt is a feedback board and roadmap tool for collecting, prioritizing, and acting on user feedback, from $29/month per board.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nolt offers feedback boards, roadmaps, and changelogs with SSO and integrations like Slack and Jira, starting at $29/month per board.$q$,
  og_description = $q$Nolt offers feedback boards, roadmaps, and changelogs with SSO and integrations like Slack and Jira, starting at $29/month per board.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '464182df-a73e-41ff-88d0-d38b16891925';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '464182df-a73e-41ff-88d0-d38b16891925' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Feedback boards$q$, $q$Customizable public boards with voting and commenting to collect and rank ideas.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Roadmap$q$, $q$Shareable roadmap used to prioritize feedback and communicate plans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Privacy controls$q$, $q$Boards can be public, private to specific users, or password-protected, with domain-restricted access.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$SSO$q$, $q$Supports SAML 2.0 and other single sign-on providers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Moderation tools$q$, $q$Manual moderation, a profanity filter, user banning, and conversation locking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Data export$q$, $q$Feedback board data can be exported to Google Sheets or Microsoft Excel.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Integrations$q$, $q$Connects with Slack, Discord, GitHub, and Trello on the Essential plan, plus Zapier, Intercom, Microsoft Teams, Linear, Monday, Asana, and Jira on Pro.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Unlimited users, content, and admins on every plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Strong privacy and access controls, including password-protected boards, domain restriction, and SSO$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$10-day free trial of the Pro plan with no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Built-in moderation tools such as a profanity filter, banning, and manual approval$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$No free plan; the cheapest plan is $29/month for a single board with no third-party integrations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Zapier and most integrations (Jira, Linear, Asana, Monday) are limited to the $69/month Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$More than 5 boards or custom branding requires custom Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Does Nolt have a free plan?$q$, $q$No, Nolt has no free plan; new boards start with a 10-day free trial of the Pro plan and no credit card is required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$How much does Nolt cost?$q$, $q$The Essential plan is $29/month for one board, the Pro plan is $69/month for up to 5 boards, and Enterprise pricing is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Can Nolt boards be private?$q$, $q$Yes, boards can be made public, private to specific users, or password-protected, with access restricted by email domain.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$What integrations does the Essential plan include?$q$, $q$The Essential plan includes Slack, Discord, GitHub, and Trello; integrations like Jira, Linear, and Zapier require the Pro plan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Public feedback board$q$, $q$Companies let users submit and vote on feature ideas through a branded board.$q$, $q$Product and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Roadmap communication$q$, $q$Teams share a public roadmap of planned and in-progress work.$q$, $q$Product managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Restricted-access feedback$q$, $q$Teams collect feedback from a private, domain-restricted, or password-protected audience.$q$, $q$Enterprise teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Essential$q$, $q$$29/month$q$, $q$monthly$q$, $q$["1 board","Custom fields","Custom statuses","Private boards","Roadmap","SSO","Slack, Discord, GitHub, Trello integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Pro$q$, $q$$69/month$q$, $q$monthly$q$, $q$["Up to 5 boards","Password-protected boards","Domain-restricted access","Zapier, Make, Pabbly","Intercom, Microsoft Teams, Linear, Monday, Asana, Jira","Google Sheets/Excel export"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["More than 5 boards","Custom branding","Compliance features"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$overview$q$, $q$What is Nolt?$q$, 2, ARRAY[$q$Nolt is a feedback board and roadmap platform that helps teams collect user feedback, plan work, and keep customers informed through a public roadmap and changelog.$q$, $q$Plans start at $29/month for a single board on the Essential tier, rising to $69/month for up to 5 boards with a wider integration set on the Pro tier; there is no permanently free plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', $q$who-its-for$q$, $q$Who Nolt is for$q$, 2, ARRAY[$q$Nolt fits product and support teams that want granular privacy controls, such as password-protected or domain-restricted boards, alongside standard voting and roadmap features.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('464182df-a73e-41ff-88d0-d38b16891925', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Sleekplan ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sleekplan is an AI-powered feedback platform with boards, roadmaps, changelogs, and NPS surveys, with a free Indie plan.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$13/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sleekplan collects feedback, auto-categorizes it with AI, and builds roadmaps and changelogs, with a free plan and paid tiers from $13/month.$q$,
  og_description = $q$Sleekplan collects feedback, auto-categorizes it with AI, and builds roadmaps and changelogs, with a free plan and paid tiers from $13/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ed72e564-3150-4ee6-ad02-fc3247f087ae';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ed72e564-3150-4ee6-ad02-fc3247f087ae' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Feedback boards$q$, $q$Public or private boards with voting, comments, and AI auto-categorization.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Roadmap$q$, $q$Drag-and-drop prioritization, shared publicly or kept internal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Changelog$q$, $q$Release notes with reactions, embeds, and an in-app widget.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$NPS and surveys$q$, $q$Targeted pulse surveys with sentiment scoring.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$AI automation$q$, $q$Duplicate merging, tagging, and triage of feedback across channels.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$PM Agent$q$, $q$Scheduled, multi-step automation for recurring product-management tasks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$MCP server$q$, $q$Integrates with Claude and Cursor.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Free-forever Indie plan with unlimited feedback and subscribers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$30-day free trial with no credit card required on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$AI-assisted duplicate merging, tagging, and triage reduce manual moderation work$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Reports 99.99% uptime and GDPR compliance$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Free Indie plan is limited to a single-admin workspace$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$AI credits are capped by plan (1,000/month on Starter, 5,000/month on Business)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Branding removal and custom domain require the Business tier or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Is Sleekplan free?$q$, $q$Yes, the Indie plan is free forever with unlimited feedback and subscribers, though limited to a single-admin workspace.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Does Sleekplan offer a free trial on paid plans?$q$, $q$Yes, every paid plan includes a 30-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$How does Sleekplan use AI?$q$, $q$Sleekplan uses AI to auto-categorize feedback, merge duplicates, tag and triage items, run its PM Agent automation, and connect via an MCP server to Claude and Cursor.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$What does the Starter plan cost?$q$, $q$The Starter plan is $13/month billed yearly and includes 3 team seats, CSAT/NPS with 1,000 AI credits, SSO, API access, and webhooks.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Startup feedback collection$q$, $q$Small teams start on the free Indie plan and upgrade as they grow.$q$, $q$Startups and indie makers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$AI-assisted feedback triage$q$, $q$Teams use AI to merge duplicate requests and tag incoming feedback automatically.$q$, $q$Product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Customer sentiment tracking$q$, $q$Teams run NPS and CSAT surveys with sentiment scoring and topic analytics.$q$, $q$Product and customer success teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Indie$q$, $q$Free forever$q$, NULL, $q$["Unlimited feedback and subscribers","Feedback board","Changelog and roadmap","Single-admin workspace"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Starter$q$, $q$$13/month (billed yearly)$q$, $q$annual$q$, $q$["3 team seats","CSAT/NPS with 1,000 AI credits","SSO","API access","Webhooks"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Business$q$, $q$$38/month (billed yearly)$q$, $q$annual$q$, $q$["10 team seats","5,000 monthly AI credits","Surveys","Topic analytics","Branding removal","Custom domain"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited team seats","SAML SSO (Okta, Azure AD, Auth0)","Custom contracts/invoicing","Multi-workspace organizations"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$overview$q$, $q$What is Sleekplan?$q$, 2, ARRAY[$q$Sleekplan is a feedback management platform that collects customer feedback from multiple channels, uses AI to find themes and merge duplicates, and helps teams publish roadmaps and changelogs.$q$, $q$It offers a free-forever Indie plan for single-admin teams, plus paid tiers starting at $13/month that add AI credits, surveys, SSO, and API access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', $q$who-its-for$q$, $q$Who Sleekplan is for$q$, 2, ARRAY[$q$Sleekplan suits product teams that want AI-assisted feedback triage and are comparing free-tier feedback tools before committing to a paid plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed72e564-3150-4ee6-ad02-fc3247f087ae', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Upvoty ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Upvoty is a feedback board and roadmap platform with AI duplicate detection and plans starting at $15/month.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Upvoty offers feedback boards, public roadmaps, and AI duplicate detection (Merge AI), with plans from $15/month and a 14-day free trial.$q$,
  og_description = $q$Upvoty offers feedback boards, public roadmaps, and AI duplicate detection (Merge AI), with plans from $15/month and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b032034e-3c48-43b1-b97e-319af0c7611f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b032034e-3c48-43b1-b97e-319af0c7611f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Feedback boards$q$, $q$Voting, tags, filters, and moderation tools for collecting ideas.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Public roadmap$q$, $q$Displays planned, in-progress, and completed items.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Automated changelog$q$, $q$Notifies voters automatically when a requested feature ships.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Merge AI$q$, $q$AI-powered detection of duplicate feedback posts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$SSO and private boards$q$, $q$User SSO plus password-protected board options.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Custom domain and branding$q$, $q$Hosts feedback boards on a custom domain with branded styling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Multi-language support$q$, $q$Supports 20+ languages for feedback boards.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$14-day free trial with no credit card required on all plans$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$AI-powered duplicate detection (Merge AI) reduces manual triage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Custom domain, branding removal, and SSO available starting on the entry Power plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Supports 20+ languages for multi-region feedback boards$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$No free plan; the cheapest plan is $15/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Multiple projects require the top Hyper plan ($49/month); lower tiers are limited to one project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Enterprise pricing (SAML SSO, dedicated success manager) is not published$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Does Upvoty have a free plan?$q$, $q$No, Upvoty has no free plan, but all plans include a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$What does Upvoty's Power plan include?$q$, $q$The Power plan ($15/month) includes 1 project, unlimited boards and tracked users, a public roadmap, custom branding, a custom domain, custom SSO, and API access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$What is Merge AI?$q$, $q$Merge AI is Upvoty's feature for automatically detecting duplicate feedback posts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Can I run multiple projects on Upvoty?$q$, $q$Unlimited projects require the Hyper plan ($49/month); the Power and Super plans are limited to one project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Multi-language feedback collection$q$, $q$Global teams run feedback boards in 20+ languages.$q$, $q$International SaaS teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Automated release communication$q$, $q$Teams notify voters automatically when a requested feature ships.$q$, $q$Product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Branded feedback portal$q$, $q$Teams host a fully branded feedback board on their own custom domain.$q$, $q$Product and marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Power$q$, $q$$15/month$q$, $q$monthly$q$, $q$["1 project","Unlimited boards and tracked users","Public roadmap","Custom branding and domain","Custom SSO","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Super$q$, $q$$25/month$q$, $q$monthly$q$, $q$["1 project","Custom domain","Changelog","All integrations","Priority support","Custom SSO"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Hyper$q$, $q$$49/month$q$, $q$monthly$q$, $q$["Unlimited projects","Custom SSO","All integrations","Upvoty MCP","API and webhooks"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited everything","SAML SSO","Custom DPA","Dedicated success manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$overview$q$, $q$What is Upvoty?$q$, 2, ARRAY[$q$Upvoty is a feedback management platform that lets product teams collect user input through voting boards, prioritize requests, and share a public roadmap and changelog.$q$, $q$Its Merge AI feature automatically flags duplicate feedback posts, and plans start at $15/month with a 14-day free trial requiring no credit card.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', $q$who-its-for$q$, $q$Who Upvoty is for$q$, 2, ARRAY[$q$Upvoty suits product teams, including international and multi-language audiences, that want a branded, custom-domain feedback board with automated duplicate detection.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b032034e-3c48-43b1-b97e-319af0c7611f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Featurebase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Featurebase combines an omnichannel support inbox, AI support agent, and feedback/roadmap tools, with a free plan.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Featurebase unifies a support inbox, AI agent Fibi, and feedback/roadmap tools; a free plan is available, paid plans start at $29/seat/month.$q$,
  og_description = $q$Featurebase unifies a support inbox, AI agent Fibi, and feedback/roadmap tools; a free plan is available, paid plans start at $29/seat/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69ed37d5-2093-4b7b-87b5-2affc6a03505';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69ed37d5-2093-4b7b-87b5-2affc6a03505' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Omnichannel inbox$q$, $q$Unifies in-app, Slack, Discord, and email conversations in one interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Fibi AI agent$q$, $q$Automated issue resolution to reduce support workload, available on paid tiers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Feedback hub$q$, $q$Collects user feedback with voting and a public roadmap.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$AI feedback prioritization$q$, $q$Surfaces high-impact product opportunities from collected feedback.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Help center$q$, $q$AI-native documentation with multi-language support and search.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Changelog$q$, $q$Public changelog pages and an in-app widget with release segmentation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Workflows and automations$q$, $q$SLA management, trial extensions, and discount offers on the Professional tier and above.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Free plan available for individuals, including live chat and a unified inbox$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Reports SOC 2, GDPR, and CCPA compliance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Startup program offers an 86% discount plus a year of free Fibi AI for eligible early-stage companies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Broad integration set including Slack, Discord, Jira, HubSpot, Zendesk, Linear, GitHub, ClickUp, and Zapier$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Free plan excludes AI support and is limited to 1 seat$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$AI resolutions are billed per use ($0.49 each) in addition to per-seat pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Slack support and workflow automation require the pricier Professional plan or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Is Featurebase free?$q$, $q$Yes, Featurebase offers a free plan for 1 seat with live chat, a unified inbox, and mobile app access, though without AI support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$How does Featurebase price AI support?$q$, $q$Paid plans charge $0.49 per AI resolution in addition to the per-seat monthly price.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$What's included in the Growth plan?$q$, $q$The Growth plan ($29/seat/month billed yearly) adds the Fibi AI agent, email support, AI Copilot, AI replies and macros, and custom domains.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Does Featurebase offer startup discounts?$q$, $q$Yes, startups under 2 years old with fewer than 6 employees can get an 86% discount on Professional features plus a year of free Fibi AI.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Unified customer support inbox$q$, $q$Support teams manage in-app, Slack, Discord, and email tickets in one place.$q$, $q$Support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Public feedback and roadmap$q$, $q$Product teams collect votes and publish a public roadmap.$q$, $q$Product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$AI-assisted ticket resolution$q$, $q$Teams offload repetitive support tickets to the Fibi AI agent.$q$, $q$Growing support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Free$q$, $q$$0$q$, NULL, $q$["1 seat","Live chat with unlimited conversations","Unified inbox and ticketing","Mobile app","Internal notes","No AI support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Growth$q$, $q$$29/seat/month (billed yearly) + $0.49/AI resolution$q$, $q$annual$q$, $q$["Fibi AI agent","Email support","AI Copilot","AI replies and macros","Custom domains","Basic analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Professional$q$, $q$$59/seat/month (billed yearly) + $0.49/AI resolution$q$, $q$annual$q$, $q$["Slack support","Workflows and automations","SLAs","User segmentation","Multilingual support","API/MCP/Webhooks","20 free Lite seats"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$Enterprise$q$, $q$$99/seat/month (billed yearly) + $0.49/AI resolution$q$, $q$annual$q$, $q$["Multi-brand workspace","SSO and identity management","Custom admin roles","Advanced HubSpot/Azure DevOps/AD integrations","Custom invoicing","50 free Lite seats"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$overview$q$, $q$What is Featurebase?$q$, 2, ARRAY[$q$Featurebase combines a customer support inbox, an AI support agent called Fibi, and feedback/roadmap tools into a single platform, covering in-app, Slack, Discord, and email channels.$q$, $q$It offers a free plan for individuals, with paid plans starting at $29/seat/month (billed yearly) plus a per-resolution charge for AI-handled support tickets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', $q$who-its-for$q$, $q$Who Featurebase is for$q$, 2, ARRAY[$q$Featurebase suits support and product teams that want to combine ticketing, AI-assisted resolution, and public feedback/roadmap management in one tool, from solo founders on the free plan to multi-team organizations on Professional or Enterprise.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69ed37d5-2093-4b7b-87b5-2affc6a03505', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── UserVoice ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$UserVoice is a customer intelligence platform that aggregates feedback and uses AI to weight requests by revenue impact.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$UserVoice aggregates customer feedback across Salesforce, Zendesk, and Gong, using AI to reveal revenue-weighted product insights.$q$,
  og_description = $q$UserVoice aggregates customer feedback across Salesforce, Zendesk, and Gong, using AI to reveal revenue-weighted product insights.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bd278a62-8daf-4a08-9776-46b01f241b6d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Multi-source aggregation$q$, $q$Connects Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, and Azure DevOps into one feedback stream.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Revenue weighting$q$, $q$Correlates customer problems with deal size, expansion, and retention.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$AI theme detection$q$, $q$Automatically surfaces emerging trends and customer needs from feedback data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Role-specific dashboards$q$, $q$Tailored views for product, sales, customer success, and support teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Churn signal detection$q$, $q$Flags early indicators that UserVoice states can appear 6-12 months before a customer churns.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Deep integrations with enterprise tools like Salesforce, Gong, Gainsight, and Azure DevOps$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$AI-driven theme detection and revenue weighting go beyond simple upvote counting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$SOC 2 Type 2 certified, and states GDPR and WCAG compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$30-day hands-on trial available via a guided demo workspace$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$No public pricing; plans require booking a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Pricing is usage-based (feedback volume, tools, integrations) rather than a flat published rate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$No self-serve signup; onboarding goes through a sales/demo process$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Does UserVoice publish its pricing?$q$, $q$No, UserVoice does not list plan prices publicly; pricing is based on feedback volume, tools used, and integrations connected.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Can I try UserVoice before buying?$q$, $q$Yes, booking a demo sets up a workspace so a team can try UserVoice hands-on for 30 days.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$What CRMs and support tools does UserVoice integrate with?$q$, $q$UserVoice integrates with Salesforce, Zendesk, Gainsight, Gong, Slack, Jira, and Azure DevOps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$What is UserVoice's churn signal detection?$q$, $q$It is an AI feature designed to surface signals that UserVoice states can appear 6-12 months before a customer churns.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Revenue-weighted prioritization$q$, $q$Product teams rank customer problems by correlation with deal size and retention.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Churn risk detection$q$, $q$Customer success teams monitor early churn signals surfaced from feedback data.$q$, $q$Customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Cross-functional feedback dashboards$q$, $q$Sales, support, and product teams each get a tailored view of the same underlying feedback data.$q$, $q$Cross-functional teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$overview$q$, $q$What is UserVoice?$q$, 2, ARRAY[$q$UserVoice is a customer intelligence platform that aggregates feedback signals from tools like Salesforce, Zendesk, Gong, Slack, Jira, and Azure DevOps, then applies AI analysis to surface revenue-weighted insights.$q$, $q$Rather than ranking requests by vote count alone, UserVoice correlates customer problems with deal size, expansion, and retention, and includes churn signal detection intended to flag risk months in advance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$who-its-for$q$, $q$Who UserVoice is for$q$, 2, ARRAY[$q$UserVoice targets product, customer success, revenue operations, and sales teams at B2B software companies that need feedback prioritized by business impact and are comfortable going through a sales/demo process rather than self-serve signup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Stonly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Stonly is a knowledge management platform that uses interactive guides and AI to power customer self-service and support agent assistance.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Stonly builds interactive guides and a conversational AI bot to cut support tickets and speed up customer service teams.$q$,
  og_description = $q$Stonly builds interactive guides and a conversational AI bot to cut support tickets and speed up customer service teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '28d621bc-8148-478e-91f4-93954281f173';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '28d621bc-8148-478e-91f4-93954281f173' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Interactive Guides & Articles$q$, $q$Step-by-step interactive content designed to go beyond static knowledge-base articles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Conversational AI Bot$q$, $q$Answers customer questions automatically, with a reported 92% response accuracy.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Agent Assist$q$, $q$Automatically summarizes support tickets and drafts responses for agents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Content Management$q$, $q$Versioning, access controls, templates, and content health monitoring for knowledge bases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Workflow Editor$q$, $q$A WYSIWYG multimedia editor for building branching, decision-tree style guides.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Auto-Translation & SEO$q$, $q$Publishes guides in multiple languages and optimizes them for search.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Help Desk Integrations$q$, $q$Connects with Zendesk, Freshdesk, Salesforce, and ServiceNow.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Interactive, step-by-step guides can resolve issues static help articles can't.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Conversational AI bot and Agent Assist can reduce ticket volume and resolution time.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$A free Basic plan lets small teams try the product after the trial ends without paying.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Integrates with major help desk platforms including Zendesk, Freshdesk, Salesforce, and ServiceNow.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Detailed pricing for the Small Business and Enterprise plans is not published and requires contacting sales.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$The free Basic plan is limited to 400 monthly views, 5 guides, and 1 team member.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$AI Agents, SSO, and white-label options are restricted to the Enterprise tier.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Does Stonly offer a free plan?$q$, $q$Yes. After the 14-day Small Business trial ends, accounts can move to a free Basic plan with 400 monthly guide views, 5 published guides, and 1 team member.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$What AI features does Stonly include?$q$, $q$Stonly offers a conversational AI bot for customer-facing answers and an Agent Assist tool that summarizes tickets and drafts responses for support agents.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Which help desks does Stonly integrate with?$q$, $q$Stonly integrates with Zendesk, Freshdesk, Salesforce, ServiceNow, and other platforms.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Is Stonly's pricing public?$q$, $q$Only the Small Business plan's feature set is described publicly; exact prices and Enterprise pricing require contacting Stonly directly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Self-Service Deflection$q$, $q$Interactive guides let customers troubleshoot issues on their own instead of opening a support ticket.$q$, $q$Customer support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Agent Assist for Support Teams$q$, $q$Automatic ticket summarization and AI-drafted responses help agents resolve issues faster.$q$, $q$Contact center agents$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Faster Employee Onboarding$q$, $q$Interactive guides used internally to train new support staff more quickly.$q$, $q$Support team managers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Basic$q$, $q$Free$q$, $q$monthly$q$, $q$["400 monthly guide views","5 published guides","1 team member"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Small Business$q$, NULL, NULL, $q$["Unlimited guides and tours","1 knowledge base","4,000 monthly guide views","5 team members","Full-path analytics and versioning","Integrations with Segment, Zapier, Freshpaint, RudderStack","14-day free trial included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited guide views and team members","AI Agents and automations","SSO and private knowledge bases","Help desk integrations (Salesforce, Zendesk, Freshdesk, Front)","Dedicated success manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$overview$q$, $q$What is Stonly?$q$, 2, ARRAY[$q$Stonly is a knowledge management platform built around interactive, step-by-step guides rather than static help articles, paired with a conversational AI bot and an Agent Assist tool that summarizes tickets and drafts responses.$q$, $q$The platform reports customer results such as an 80% decrease in support tickets, a 20% reduction in resolution time, and a 58% reduction in training time, and lists customers including RemoteLock, Devialet, Tonal, Fastned, and Siemens.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28d621bc-8148-478e-91f4-93954281f173', $q$who-its-for$q$, $q$Who Stonly is for$q$, 2, ARRAY[$q$Stonly targets support and customer service teams, including contact centers, at companies in insurance, retail, banking, and marketplace industries that want to reduce support ticket volume and speed up agent training.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28d621bc-8148-478e-91f4-93954281f173', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28d621bc-8148-478e-91f4-93954281f173', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28d621bc-8148-478e-91f4-93954281f173', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28d621bc-8148-478e-91f4-93954281f173', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Lucky Orange ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lucky Orange combines heatmaps, session recordings, funnels, and surveys with Discovery AI to help businesses find and fix conversion issues.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$32/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lucky Orange offers heatmaps, session recordings, funnels, and AI-powered Discovery AI to diagnose website conversion problems.$q$,
  og_description = $q$Lucky Orange offers heatmaps, session recordings, funnels, and AI-powered Discovery AI to diagnose website conversion problems.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '33ec13b1-2e9a-4373-9b50-55b018d5adaa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Discovery AI$q$, $q$Analyzes live visitor behavior and answers specific questions about site performance, with a direct link to the supporting evidence.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Dynamic Heatmaps$q$, $q$Tracks clicks, scrolls, and mouse movement across pages, including dynamic elements and pop-ups.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Session Recordings$q$, $q$Video playback of real visitor sessions, filterable by specific behaviors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Conversion Funnels$q$, $q$Identifies where visitors drop off within a defined flow.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Surveys & Live Chat$q$, $q$Built-in visitor communication tools included with every plan at no extra charge.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Live Visitor View$q$, $q$Watch visitor activity on the site as it happens in real time.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$All plans include the full feature set (heatmaps, recordings, funnels, surveys, live chat) rather than gating features by tier.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$7-day free trial with full feature access and no credit card required.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Discovery AI links directly to the visitor evidence behind its answers.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Reports being used by over 500,000 websites worldwide.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Pricing is based on monthly tracked sessions, so cost rises as site traffic grows.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Discovery AI is referenced as an add-on, suggesting it may not be bundled into every plan by default.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Additional websites on one account cost $5 per extra site.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Enterprise-level traffic (700,000+ sessions) requires contacting sales for custom pricing.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Does Lucky Orange offer a free trial?$q$, $q$Yes, a 7-day free trial with full feature access is offered, and no credit card is required to start.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$How is Lucky Orange priced?$q$, $q$Plans are tiered by monthly tracked sessions, starting at $32/month for 3,500 sessions (Build) up to $839/month for 300,000+ sessions (Scale), billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$What is Discovery AI?$q$, $q$An AI feature that analyzes live visitor behavior and gives direct answers about site performance with links to the supporting evidence.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Can I track more than one website on an account?$q$, $q$Yes, additional websites can be added for $5 per site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Conversion Rate Optimization$q$, $q$Combining heatmaps and funnels to find and fix drop-off points in a checkout or signup flow.$q$, $q$Ecommerce and marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$UX Friction Debugging$q$, $q$Using session recordings to observe exactly where users get stuck or confused.$q$, $q$Product and UX teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$In-Context Customer Feedback$q$, $q$Using built-in surveys and live chat to collect visitor feedback without adding another tool.$q$, $q$Growth and support teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Build$q$, $q$$32/month$q$, $q$annual$q$, $q$["3,500 monthly sessions tracked","Heatmaps, session recordings, funnels, surveys, live chat"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Grow$q$, $q$$72/month$q$, $q$annual$q$, $q$["10,000 monthly sessions tracked","All core features included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Expand$q$, $q$$199/month$q$, $q$annual$q$, $q$["50,000+ monthly sessions tracked","All core features included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Scale$q$, $q$$839/month$q$, $q$annual$q$, $q$["300,000+ monthly sessions tracked","All core features included"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["700,000+ monthly sessions","Custom quote"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$overview$q$, $q$What is Lucky Orange?$q$, 2, ARRAY[$q$Lucky Orange is a website analytics and optimization platform combining dynamic heatmaps, session recordings, conversion funnels, surveys, and live chat with an AI feature called Discovery AI that analyzes live visitor behavior and answers questions about site performance.$q$, $q$The company reports the platform is used on over 500,000 websites worldwide, with plans tiered by the number of monthly tracked sessions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', $q$who-its-for$q$, $q$Who Lucky Orange is for$q$, 2, ARRAY[$q$Lucky Orange is aimed at businesses of any type that want to understand and improve website performance and user experience, from small sites on the entry-level Build plan to larger sites needing Enterprise-level session volume.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33ec13b1-2e9a-4373-9b50-55b018d5adaa', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── UXCam ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$UXCam is a mobile and web product analytics platform offering session replay, heatmaps, and an AI analyst called Tara AI for user behavior insights.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$UXCam offers mobile session replay, heatmaps, and an AI analyst (Tara AI) to help teams understand user behavior in apps.$q$,
  og_description = $q$UXCam offers mobile session replay, heatmaps, and an AI analyst (Tara AI) to help teams understand user behavior in apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Tara AI Analyst$q$, $q$An AI analyst that answers product questions in seconds by analyzing millions of data points.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Session Replay$q$, $q$Watch real user sessions to observe natural app behavior.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Heatmaps$q$, $q$Visualize where users tap, scroll, and engage most within an app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Issue Analytics$q$, $q$Helps teams identify and resolve app issues effectively.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Funnel Analytics$q$, $q$Customizable funnels for analyzing user journeys and drop-off points.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Retention & Segmentation$q$, $q$Analyzes user retention and segments audiences for deeper analysis.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Reports being installed in over 37,000 products, indicating broad mobile app adoption.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Tara AI can answer specific product questions instantly instead of requiring manual dashboard digging.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Free trial offers full feature access before committing to a paid plan.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Used across industries including ecommerce, healthcare, finance, and telecommunications.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$No public pricing — plans require submitting a form and waiting up to 24 hours for a custom quote.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Pricing is usage-based (session volume), making costs harder to predict upfront.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Primarily built for mobile app analytics, with web analytics as a secondary capability.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Does UXCam publish its pricing?$q$, $q$No, pricing is usage-based and requires requesting a custom quote through a form.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Is there a free trial?$q$, $q$Yes, UXCam offers a free trial with full feature access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$What is Tara AI?$q$, $q$UXCam's built-in AI analyst that answers product questions by analyzing session and behavioral data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$What platforms does UXCam support?$q$, $q$Mobile app analytics is the primary focus, with web analytics support also available.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Mobile App UX Debugging$q$, $q$Using session replay and heatmaps to find where mobile users struggle within an app.$q$, $q$Mobile product and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Retention & Churn Analysis$q$, $q$Using retention analytics and segmentation to identify what drives users to leave.$q$, $q$Growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Support Root-Cause Analysis$q$, $q$Using session replay to investigate reported issues without needing user-provided steps.$q$, $q$Customer support specialists$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$overview$q$, $q$What is UXCam?$q$, 2, ARRAY[$q$UXCam is a product analytics platform for mobile apps and websites that combines qualitative tools like session replay and heatmaps with quantitative analytics such as funnels, retention, and segmentation.$q$, $q$It includes an AI analyst called Tara AI that analyzes large volumes of data to answer product questions directly, and the company reports its SDK is installed in more than 37,000 products across 50+ countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$who-its-for$q$, $q$Who UXCam is for$q$, 2, ARRAY[$q$UXCam serves product teams, engineers, customer support specialists, and growth teams at companies of all sizes, spanning industries like ecommerce, healthcare, finance, and telecommunications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Contentsquare ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Contentsquare is an experience intelligence platform unifying web, mobile, and voice-of-customer data with AI-powered analytics for enterprise brands.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Contentsquare unifies session replay, product analytics, and voice-of-customer data with AI insights for enterprise digital teams.$q$,
  og_description = $q$Contentsquare unifies session replay, product analytics, and voice-of-customer data with AI insights for enterprise digital teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '416c2613-6ccd-4b41-aea6-5f51b4411966';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '416c2613-6ccd-4b41-aea6-5f51b4411966' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Experience Analytics$q$, $q$Session replay, heatmaps, funnels, and zone-based journey analysis.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Product Analytics$q$, $q$AI-powered dashboards and account-level analytics for user journeys.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Voice of Customer$q$, $q$Collects survey feedback with AI-powered response analysis.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Experience Monitoring$q$, $q$Detects errors and performance slowdowns in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Conversation Intelligence$q$, $q$Analyzes customer interactions at scale.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Sense AI Agent$q$, $q$A contextual AI assistant that surfaces recommendations from behavioral data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Mobile App Analytics$q$, $q$Tracks mobile app usage without manual tagging.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Free plans are available for both Experience Analytics (200k sessions) and Voice of Customer (100 responses), letting teams start without paying.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Combines multiple products — session replay, product analytics, voice of customer, and conversation intelligence — under one company.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$New accounts get a 15-day trial of the Growth plan with no payment required.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Reports serving 3,000+ enterprise and mid-market brands.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Higher tiers (Pro, Enterprise) across all products require contacting sales for custom pricing.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Experience Analytics, Voice of Customer, and Product Analytics are priced and packaged as separate products, which can complicate purchasing.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Free plan session and response limits are relatively low for higher-traffic sites.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Does Contentsquare have a free plan?$q$, $q$Yes, free tiers exist for Experience Analytics (200k monthly sessions) and Voice of Customer (100 monthly responses).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$What does the Growth plan cost?$q$, $q$Experience Analytics Growth starts at $49/month; Voice of Customer Growth starts at $99/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Is there a free trial?$q$, $q$Yes, new accounts receive a 15-day trial of the Growth plan with no payment required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$What is Sense?$q$, $q$Contentsquare's contextual AI agent that provides automated analysis and recommendations from customer behavioral data.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Ecommerce Conversion Optimization$q$, $q$Using session replay, heatmaps, and journey analysis to improve online conversion rates.$q$, $q$Ecommerce and marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Enterprise Product Research$q$, $q$Using product analytics and account-level dashboards to guide roadmap decisions.$q$, $q$Product and design/UX teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Customer Feedback Analysis$q$, $q$Collecting and analyzing survey responses alongside behavioral data.$q$, $q$CX and voice-of-customer teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Experience Analytics Free$q$, $q$$0$q$, $q$monthly$q$, $q$["200k monthly sessions","1 project","Session replay, heatmaps, funnels","Basic surveys"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Experience Analytics Growth$q$, $q$$49/month$q$, $q$monthly$q$, $q$["From 7k monthly sessions","3 projects","Zone-based heatmaps","Journey analysis","AI summaries"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Voice of Customer Free$q$, $q$$0$q$, $q$monthly$q$, $q$["100 monthly responses","3 surveys","AI-powered analysis","Basic integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$Voice of Customer Growth$q$, $q$$99/month$q$, $q$monthly$q$, $q$["From 500 monthly responses","Unlimited surveys","Advanced targeting","11+ integrations"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$overview$q$, $q$What is Contentsquare?$q$, 2, ARRAY[$q$Contentsquare is an experience intelligence platform that aggregates customer data across web, mobile, conversations, and agent interactions, combining session replay, product analytics, experience monitoring, and voice-of-customer tools with an AI agent called Sense.$q$, $q$The company reports serving over 3,000 enterprise and mid-market brands and tracking data across more than 1.3 million websites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', $q$who-its-for$q$, $q$Who Contentsquare is for$q$, 2, ARRAY[$q$Contentsquare targets marketing, product, design/UX, ecommerce, and data analytics teams at enterprise and mid-market brands in industries such as retail, B2B, financial services, travel and hospitality, and automotive.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('416c2613-6ccd-4b41-aea6-5f51b4411966', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Glassbox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Glassbox is a digital customer experience analytics platform with session replay, journey mapping, and AI-assisted insights for regulated industries.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Glassbox provides session replay, journey mapping, and AI-assisted analytics for financial services, insurance, and e-commerce brands.$q$,
  og_description = $q$Glassbox provides session replay, journey mapping, and AI-assisted analytics for financial services, insurance, and e-commerce brands.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '32c09a08-ca8d-4425-b7ea-3b78968f97a4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Augmented Journey Map$q$, $q$Visual mapping of customer journeys across sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Session Replay$q$, $q$Instant playback of digital interactions for troubleshooting and analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Struggle & Error Analysis$q$, $q$Flags friction points and errors within the user experience.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Mobile App Analytics$q$, $q$Rated by G2 users for satisfaction and ease of use.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Glassbox Insights Assistant$q$, $q$AI-driven delivery of insights extracted from session data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Rapid Response$q$, $q$Real-time detection and resolution of visitor struggles.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Tagless Data Capture$q$, $q$Collects behavioral data without manual tagging.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Digital Record Keeping$q$, $q$Supports compliance and fraud-prevention use cases.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Built with regulated industries (financial services, insurance) in mind, including compliance-focused record keeping.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Named a G2 Summer 2025 Leader in the e-commerce category, with high marks for mobile app analytics satisfaction and ease of use.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Tagless data capture reduces manual implementation overhead.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Rapid Response enables real-time action on visitor struggles rather than only after-the-fact analysis.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Pricing is not published and requires contacting sales.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$No free trial or free plan is mentioned.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Positioned mainly at enterprise-level organizations, which may not suit smaller businesses.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Is Glassbox pricing public?$q$, $q$No, pricing is not published and requires contacting Glassbox directly.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$What industries does Glassbox focus on?$q$, $q$It is used heavily in financial services, insurance, and e-commerce, including compliance-sensitive use cases.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Does Glassbox use AI?$q$, $q$Yes, its Insights Assistant delivers AI-driven analysis of session and journey data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Has Glassbox won any industry recognition?$q$, $q$Yes, G2 named it a Summer 2025 Leader in e-commerce analytics, with high satisfaction ratings for mobile app analytics.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Compliance & Fraud Prevention$q$, $q$Using digital record keeping and session replay to support regulatory and fraud-prevention requirements in banking and insurance.$q$, $q$Compliance and risk teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Mobile App Experience Optimization$q$, $q$Using mobile app analytics and journey mapping to improve app experiences.$q$, $q$Product and UX teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$Real-Time Struggle Resolution$q$, $q$Using Rapid Response to detect and act on visitor struggles as they happen.$q$, $q$Customer experience teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$overview$q$, $q$What is Glassbox?$q$, 2, ARRAY[$q$Glassbox is a customer intelligence platform providing digital experience analytics through session replay, an Augmented Journey Map, struggle and error analysis, and an AI-driven Insights Assistant, aimed at web and mobile channels.$q$, $q$The platform lists customers such as SoFi, Sainsbury's, Marriott, and Bank Leumi, and was named a G2 Summer 2025 Leader in the e-commerce analytics category.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', $q$who-its-for$q$, $q$Who Glassbox is for$q$, 2, ARRAY[$q$Glassbox targets financial services, insurance, and e-commerce/retail organizations, serving marketing, product, UX, CX, data analytics, engineering, and compliance teams at enterprise-level businesses in regulated industries.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('32c09a08-ca8d-4425-b7ea-3b78968f97a4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Quantum Metric ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Quantum Metric is an enterprise digital analytics platform with Felix Agentic AI, autonomously surfacing customer experience insights from session data.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Quantum Metric uses Felix Agentic AI and session replay to surface enterprise customer experience insights across web and mobile.$q$,
  og_description = $q$Quantum Metric uses Felix Agentic AI and session replay to surface enterprise customer experience insights across web and mobile.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '546750c3-813f-430c-a551-e76c5f6484f1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '546750c3-813f-430c-a551-e76c5f6484f1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Felix Agentic AI$q$, $q$An autonomous agent that continuously analyzes customer journeys and surfaces insights automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Session Replay$q$, $q$Video playback of user interactions for behavior analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Autocapture$q$, $q$Automatically captures 300+ metrics without manual tagging.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Segment Builder$q$, $q$Builds audience segments using nested criteria.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Interaction Heatmaps$q$, $q$Visualizes clicks, scrolls, and user attention across pages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Performance Monitoring$q$, $q$Analyzes page performance and quantifies its business impact.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Voice of Customer$q$, $q$Connects customer feedback to behavioral data in real time.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Data Streaming & Activation$q$, $q$Sends captured insights to data warehouses and other systems.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Felix Agentic AI runs continuously in the background and is described as providing transparent reasoning rather than a black-box output.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Autocapture removes the need for manual event tagging across 300+ metrics.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Reports processing 8 billion sessions monthly and reaching roughly half of worldwide internet users, indicating significant scale.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Integrates with Adobe Experience Platform and Salesforce Lightning Analytics.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Pricing is not public — all plans are custom quotes based on digital properties, session volume, and support tier.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$No free trial or free plan is mentioned.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Positioned for enterprise organizations, which may be cost-prohibitive for smaller businesses.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Is Quantum Metric pricing public?$q$, $q$No, all plans are enterprise custom quotes based on usage and support needs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$What is Felix Agentic AI?$q$, $q$Quantum Metric's autonomous AI agent that continuously investigates customer journeys and surfaces insights without manual queries.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Does Quantum Metric support mobile apps?$q$, $q$Yes, native mobile app analytics is supported alongside web.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$What integrations does Quantum Metric offer?$q$, $q$It integrates with Adobe Experience Platform, Salesforce Lightning Analytics, and data warehouses via streaming.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Enterprise Digital Experience Optimization$q$, $q$Using session replay, heatmaps, and Felix Agentic AI to continuously improve digital experiences.$q$, $q$Enterprise product and CX teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Performance Impact Analysis$q$, $q$Quantifying how page performance issues affect business outcomes.$q$, $q$Engineering and technology teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$Customer Feedback Correlation$q$, $q$Connecting voice-of-customer feedback with real behavioral data.$q$, $q$Voice-of-customer and analytics teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$overview$q$, $q$What is Quantum Metric?$q$, 2, ARRAY[$q$Quantum Metric is a digital analytics platform that captures behavioral, technical, and business signals across web and mobile, centered on Felix Agentic AI, an autonomous agent that continuously analyzes customer journeys and surfaces insights.$q$, $q$The company reports processing 8 billion sessions monthly and lists customers including Virgin Atlantic, Wyndham Hotels, Lenovo, and lululemon.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', $q$who-its-for$q$, $q$Who Quantum Metric is for$q$, 2, ARRAY[$q$Quantum Metric serves enterprise organizations across retail, financial services, travel and hospitality, telecommunications, and healthcare, supporting product, technology, marketing, analytics, CX, UX, and support teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('546750c3-813f-430c-a551-e76c5f6484f1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Snowplow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Snowplow is a customer data infrastructure platform that captures and streams real-time behavioral data to power analytics and AI agents.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2012,
  company_size = NULL,
  headquarters = $q$London, UK and Boston, MA, US$q$,
  languages = '{}',
  seo_meta_description = $q$Snowplow streams real-time, validated behavioral data to warehouses and AI agents, founded in 2012 and based in London and Boston.$q$,
  og_description = $q$Snowplow streams real-time, validated behavioral data to warehouses and AI agents, founded in 2012 and based in London and Boston.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '62cb1717-61b9-4a9b-aab8-e3aeee5ab747';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '62cb1717-61b9-4a9b-aab8-e3aeee5ab747' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Real-Time Event Streaming$q$, $q$Streams validated behavioral event data to warehouses, lakes, and streams as it happens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Custom Event Schemas$q$, $q$Enforces data governance with validated, custom event schemas.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$AI Agent Integration$q$, $q$Connects customer context to AI agents via LangChain, AWS Bedrock, Google Vertex AI, and Vercel.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Human vs. AI Traffic Distinction$q$, $q$Separates and measures AI agent traffic from human visitor traffic.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Compliance Controls$q$, $q$Supports GDPR, CCPA, ISO 27001, and HIPAA data privacy requirements.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Self-Hosted or Managed Options$q$, $q$Available as a self-hosted pipeline or as the fully managed Snowplow Platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$No vendor lock-in — organizations own and control their own behavioral data.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Supports major AI agent frameworks (LangChain, AWS Bedrock, Google Vertex AI, Vercel) for feeding validated data to AI systems.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$14-day free trial available for the managed Snowplow Platform with no credit card required.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Established company founded in 2012, with well-known customers including Strava, Burberry, and Experian.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$No public pricing for either the self-hosted or managed platform — both require contacting sales.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$The self-hosted option targets teams already familiar with the earlier open-source project and requires managing infrastructure.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$No permanent free tier; only a time-limited trial is offered.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Is Snowplow open source?$q$, $q$Snowplow offers a self-hosted pipeline option (evolved from its earlier open-source project) alongside its fully managed Snowplow Platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Is there a free trial?$q$, $q$Yes, a 14-day free trial of the managed Snowplow Platform is available with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$When was Snowplow founded?$q$, $q$2012.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Where is Snowplow headquartered?$q$, $q$London, UK, with an additional office in Boston, MA.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$How does Snowplow support AI use cases?$q$, $q$It streams validated, real-time customer context to AI agents and copilots via integrations like LangChain, AWS Bedrock, and Google Vertex AI.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Feeding AI Agents Validated Data$q$, $q$Streaming real-time, validated customer context to AI agents and copilots.$q$, $q$AI and data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Real-Time Product & Marketing Analytics$q$, $q$Streaming behavioral event data into warehouses and lakes for analysis.$q$, $q$Data and product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Regulated-Industry Data Collection$q$, $q$Collecting behavioral data under GDPR, CCPA, ISO 27001, or HIPAA requirements.$q$, $q$Teams with strict compliance needs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Snowplow Platform (Free Trial)$q$, $q$Free for 14 days$q$, NULL, $q$["Full product access","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Self-Hosted Pipeline$q$, $q$Custom$q$, NULL, $q$["Self-managed single production pipeline","SLULA 1.1 license terms"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$Snowplow Platform$q$, $q$Custom$q$, NULL, $q$["Fully managed, scalable pipeline","Real-time UI console","AI-ready data modeling","Enterprise security"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$overview$q$, $q$What is Snowplow?$q$, 2, ARRAY[$q$Snowplow is a customer context infrastructure platform that captures, validates, and streams real-time behavioral data from digital user interactions, powering advanced analytics and AI agent decision-making with first-party data.$q$, $q$Founded in 2012 and headquartered in London, UK and Boston, MA, Snowplow lists customers including AutoTrader, Strava, Burberry, HelloFresh, and Experian.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', $q$who-its-for$q$, $q$Who Snowplow is for$q$, 2, ARRAY[$q$Snowplow serves product and data teams at enterprise companies across gaming, retail, travel, and e-commerce that need advanced analytics and AI-ready behavioral data infrastructure without vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62cb1717-61b9-4a9b-aab8-e3aeee5ab747', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── RudderStack ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$RudderStack is a customer data platform that collects, unifies, and activates customer data, with AI agents for natural-language data workflows.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$265/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RudderStack collects and activates customer data across your stack, with a free plan, 200+ destinations, and RudderAI natural-language workflows.$q$,
  og_description = $q$RudderStack collects and activates customer data across your stack, with a free plan, 200+ destinations, and RudderAI natural-language workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'db57c4c5-6372-4dcb-8aeb-de596d7f6b20' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Event Collection$q$, $q$16 SDKs for web, mobile, and server-side tracking, plus webhooks and transformations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Identity & Profiles$q$, $q$Builds customer 360 profiles with pre-computed features like LTV and propensity scoring.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$RudderAI Agentic Workflows$q$, $q$Natural-language interfaces for building audiences and exploring data, plus infrastructure-as-code for engineers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Data Governance$q$, $q$Schema management, event validation, consent automation, and PII handling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Activation$q$, $q$200+ real-time destination integrations for sending data to business tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Warehouse-Native Architecture$q$, $q$Connects directly to Snowflake, BigQuery, Redshift, Databricks, and Azure.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Free plan includes 250K events/month with 16 SDK sources and 200+ destinations.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Self-hosted open-source version available under the Elastic 2.0 license on all plans.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$RudderAI natural-language agents aim to reduce manual instrumentation work.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Compliant with GDPR, SOC 2 Type 2, CCPA, and HIPAA.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Free plan is limited to community Slack support and production-only workspaces.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Growth plan support is email-only, which may be limited for teams needing hands-on help.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Enterprise-grade support (dedicated TAM/CSM) is reserved for the custom-priced Enterprise plan.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Does RudderStack have a free plan?$q$, $q$Yes, a free plan with 250K events/month, 16 SDKs, and 200+ destinations is available at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$What does the Growth plan cost?$q$, $q$$265/month (with a 15% discount for annual billing), covering up to 1 million events/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Is RudderStack open source?$q$, $q$Yes, a self-hosted open-source version is available under the Elastic 2.0 license across all plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$What compliance standards does RudderStack meet?$q$, $q$GDPR, SOC 2 Type 2, CCPA, and HIPAA.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Unifying Customer Data$q$, $q$Collecting and unifying customer data across a marketing and analytics stack.$q$, $q$Data and analytics teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Natural-Language Audience Building$q$, $q$Using RudderAI to build audiences and explore data without writing queries.$q$, $q$Business and marketing users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Warehouse-Native Data Pipelines$q$, $q$Streaming events directly into Snowflake, BigQuery, Redshift, or Databricks.$q$, $q$Data engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["250K events/month","16 SDK sources","200+ cloud destinations","Community Slack support","Up to 10 team members"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Growth$q$, $q$$265/month$q$, $q$monthly$q$, $q$["Up to 1 million events/month (scalable)","Unlimited team members and tracking plans","30-minute warehouse sync","2 workspaces","25 Reverse ETL connections","30-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["5-minute warehouse sync","Unlimited transformations","HIPAA compliance","SSO","Dedicated Technical Account Manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$overview$q$, $q$What is RudderStack?$q$, 2, ARRAY[$q$RudderStack is a customer data platform that collects, unifies, and activates customer data across an organization's tech stack, offering 16 SDKs, 200+ destination integrations, and warehouse-native connections to Snowflake, BigQuery, Redshift, Databricks, and Azure.$q$, $q$Its RudderAI agentic workflows add natural-language interfaces for building audiences and exploring data, and the company reports delivering over 300 billion events monthly for customers including Glassdoor, Crate & Barrel, and Vercel.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', $q$who-its-for$q$, $q$Who RudderStack is for$q$, 2, ARRAY[$q$RudderStack is built for data, engineering, and analytics teams, as well as product managers and business users, who need to manage and activate customer data at scale while meeting GDPR, SOC 2, CCPA, and HIPAA requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db57c4c5-6372-4dcb-8aeb-de596d7f6b20', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Jitsu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Jitsu is an open-source customer data platform that captures event data and streams it in real time to your data warehouse.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jitsu is an open-source, MIT-licensed customer data platform streaming event data in real time to your data warehouse.$q$,
  og_description = $q$Jitsu is an open-source, MIT-licensed customer data platform streaming event data in real time to your data warehouse.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '99ecac84-e959-4bdd-9c5f-dac64779d3d2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '99ecac84-e959-4bdd-9c5f-dac64779d3d2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Real-Time Event Streaming$q$, $q$Delivers behavioral event data to your warehouse as it happens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Jitsu Functions$q$, $q$JavaScript-based functions to modify or filter events before storage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Automatic Identity Resolution$q$, $q$Builds a real-time identity graph from incoming events.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Multi-Source Integration$q$, $q$Connects websites, apps, APIs, and CRM systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Custom Domains$q$, $q$Reduces ad-blocker interference with tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Self-Hosting Option$q$, $q$Deploy on your own infrastructure or use the managed Jitsu Cloud service.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Free plan supports up to 200,000 active events/month with no credit card required.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$100% open source under the MIT license, so it can be self-hosted without licensing cost.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Implementation is described as adding a single tag to start capturing data.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Free plan includes ClickHouse UI/API access and unlimited destinations.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$No AI-powered features are advertised, unlike several competing customer data platforms.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Business plan sync frequency (up to hourly) is slower than the Enterprise plan's per-minute syncing.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Additional active events and syncs beyond plan limits incur per-unit overage charges ($40 per extra 1M events, $20 per extra sync).$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Is Jitsu free?$q$, $q$Yes, the Free plan supports 200,000 active events/month at no cost, and the self-hosted open-source version is free under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$What does the Business plan cost?$q$, $q$$99/month, including 2 million active events/month, with overage pricing beyond that.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Can Jitsu be self-hosted?$q$, $q$Yes, Jitsu can be deployed on-prem, in a private cloud, or self-hosted, in addition to Jitsu Cloud.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Which data warehouses does Jitsu support?$q$, $q$Snowflake, BigQuery, Redshift, Postgres, MySQL, and ClickHouse.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Warehouse-First Data Collection$q$, $q$Streaming event data directly into a data warehouse the team already owns.$q$, $q$Data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Avoiding Vendor Lock-In$q$, $q$Self-hosting an open-source data pipeline instead of depending on a proprietary vendor.$q$, $q$Developers and data teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Consolidating Multi-Source Events$q$, $q$Bringing together data from websites, apps, APIs, and CRM systems into one pipeline.$q$, $q$Analytics teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Unlimited captured events","200k active events/month","Unlimited connectors (1 daily active sync)","Jitsu Cloud, Private Cloud, or On-Prem deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Business$q$, $q$$99/month$q$, $q$monthly$q$, $q$["2M active events/month ($40 per extra 1M)","Up to 1-hour sync frequency","5 monthly active syncs ($20 per extra sync)","Free trial available"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom active event limits","Up to 1-minute sync frequency","Unlimited monthly active syncs"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted, MIT license","No usage limits","Community support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$overview$q$, $q$What is Jitsu?$q$, 2, ARRAY[$q$Jitsu is an open-source customer data platform that collects event data from websites, apps, email, chatbots, and CRMs and streams it in real time to data warehouses such as Snowflake, BigQuery, Redshift, Postgres, MySQL, and ClickHouse.$q$, $q$It is available as a free-tier managed service, a paid Business or Enterprise plan, and a fully self-hosted MIT-licensed open-source version, and lists customers including PandaDoc, Investing.com, and Rarible.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', $q$who-its-for$q$, $q$Who Jitsu is for$q$, 2, ARRAY[$q$Jitsu is aimed at developers and data teams who want to consolidate customer event data into their own data warehouse while maintaining control and avoiding vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99ecac84-e959-4bdd-9c5f-dac64779d3d2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Meltano ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Meltano is an open-source ETL platform with 600+ connectors for building version-controlled data pipelines.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Meltano is an open-source ETL platform with 600+ connectors, dbt integration, and a pay-per-compute Meltano Cloud tier.$q$,
  og_description = $q$Meltano is an open-source ETL platform with 600+ connectors, dbt integration, and a pay-per-compute Meltano Cloud tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ecb792b6-733d-4b42-9447-29bbd9fb6b62';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ecb792b6-733d-4b42-9447-29bbd9fb6b62' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$600+ pre-built connectors$q$, $q$Extract and load data using a large library of pre-built connectors for sources and destinations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Extract & Load replication$q$, $q$Supports full, incremental, and log-based replication strategies for moving data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$dbt & Elementary integration$q$, $q$Built-in support for dbt transformations and Elementary data validation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Pipelines as code$q$, $q$Pipeline configuration is version-controlled, treating data infrastructure as code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Custom connector SDK$q$, $q$The Meltano SDK lets teams build their own custom connectors when a pre-built one doesn't exist.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Orchestration options$q$, $q$Pipelines can be orchestrated via Meltano Cloud or integrated with Apache Airflow, Dagster, or Orchestra.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Free and open source at its core$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Large library of 600+ connectors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Native dbt integration for transformations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Version-controlled, infrastructure-as-code pipeline configuration$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Used by companies including GitLab, Netlify, and HackerOne$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Meltano Cloud pricing is based on compute hours, not published as flat dollar amounts on the pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Aimed at data engineers, so it lacks a simplified point-and-click interface for non-technical users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Requires orchestration tooling (Airflow, Dagster, Orchestra, or Meltano Cloud) for scheduling$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Is Meltano free?$q$, $q$Yes, Meltano is open source and free to self-host. A paid managed offering, Meltano Cloud, is also available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$How many connectors does Meltano support?$q$, $q$Meltano provides access to more than 600 pre-built connectors for data sources and destinations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Does Meltano support data transformations?$q$, $q$Yes, Meltano integrates with dbt for transformation and Elementary for data validation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Who maintains Meltano?$q$, $q$Meltano is an open-source project maintained by Matatika.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Self-hosted ELT pipelines$q$, $q$Data engineers build and version-control extract-and-load pipelines using the open-source core.$q$, $q$Data engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Managed data pipelines$q$, $q$Teams that don't want to manage infrastructure run pipelines on Meltano Cloud, billed by compute hours.$q$, $q$Data teams without dedicated infrastructure ops$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Custom connector development$q$, $q$Teams needing a connector outside the 600+ library build one with the Meltano SDK.$q$, $q$Engineering teams with unique data sources$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Starter (Cloud)$q$, NULL, $q$monthly$q$, $q$["200 compute hours/month","25 workspaces","Access to all 600+ connectors"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Growth (Cloud)$q$, NULL, $q$monthly$q$, $q$["2,000 compute hours/month","100 workspaces","8 hours/month engineering support","Shared account management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Scale (Cloud)$q$, NULL, $q$monthly$q$, $q$["5,000 compute hours/month","Unlimited workspaces","15 hours/month engineering support","Dedicated account management"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$Enterprise (Cloud)$q$, $q$Custom$q$, NULL, $q$["Unlimited compute hours","Custom connectors","Negotiated engineering hours","Custom SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$overview$q$, $q$What is Meltano?$q$, 2, ARRAY[$q$Meltano is an open-source ETL (extract, transform, load) platform that helps data teams build and manage data pipelines using more than 600 pre-built connectors.$q$, $q$It treats pipeline configuration as code, supports full, incremental, and log-based replication, and integrates with dbt for transformations. A paid Meltano Cloud tier offers managed infrastructure billed by compute hours instead of data volume.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', $q$who-its-for$q$, $q$Who Meltano is for$q$, 2, ARRAY[$q$Meltano is built for data engineers who want programmatic, version-controlled control over ELT pipelines rather than a purely point-and-click interface, and who may pair it with Airflow, Dagster, or Meltano Cloud for orchestration.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ecb792b6-733d-4b42-9447-29bbd9fb6b62', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Singer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Singer is a free, open-source specification for building Taps and Targets that extract and load data between systems.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Singer is a free, open-source ETL spec using JSON-based Taps and Targets to move data between databases, APIs, and files.$q$,
  og_description = $q$Singer is a free, open-source ETL spec using JSON-based Taps and Targets to move data between databases, APIs, and files.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '33ad3642-ef12-4121-a02e-a01f3f57bc2b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '33ad3642-ef12-4121-a02e-a01f3f57bc2b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Taps for extraction$q$, $q$Taps are scripts that extract data from a source such as a database, API, file, or queue.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Targets for loading$q$, $q$Targets are scripts that receive data from any tap and load it into a destination.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$JSON message protocol$q$, $q$Taps and Targets communicate over JSON and JSON Schema, so any tap can pair with any target.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Incremental extraction$q$, $q$Supports maintaining state between runs so pipelines can extract data incrementally.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Unix-style composability$q$, $q$Uses simple pipes rather than daemons or custom plugin systems, following a Unix-inspired design.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Simple, composable Unix-pipe architecture$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Ecosystem of 100+ community-built taps and targets$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Works across databases, APIs, files, and queues$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$No official hosted/managed version from Singer itself; Stitch offers a commercial managed option built on the spec$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$No built-in scheduling or orchestration layer$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Requires technical setup to write or run taps and targets$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Is Singer free?$q$, $q$Yes, Singer is a completely free, open-source specification and set of tools.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$What are Taps and Targets?$q$, $q$Taps are extraction scripts that pull data from a source, and Targets are loading scripts that receive data from any tap and load it into a destination.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Is there a hosted version of Singer?$q$, $q$Singer itself is not a hosted service, but it is sponsored by Stitch, a fully managed data pipeline product that can schedule Singer taps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$How many taps and targets are available?$q$, $q$The Singer ecosystem includes over 100 community-built taps and targets.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Custom ETL scripting$q$, $q$Engineers write or reuse Taps and Targets to move data between a specific source and destination.$q$, $q$Data engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$Data consolidation$q$, $q$Organizations use Singer components to consolidate data from multiple tools into a single warehouse.$q$, $q$Data teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$overview$q$, $q$What is Singer?$q$, 2, ARRAY[$q$Singer is an open-source specification for building Taps (extraction scripts) and Targets (loading scripts) that communicate over a shared JSON message format.$q$, $q$Because any tap can work with any target, teams can mix and match components from a community ecosystem of 100+ taps and targets to move data between databases, APIs, files, and queues.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', $q$who-its-for$q$, $q$Who Singer is for$q$, 2, ARRAY[$q$Singer suits data engineers who want a free, composable, Unix-style approach to writing ETL scripts, rather than a fully managed pipeline product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('33ad3642-ef12-4121-a02e-a01f3f57bc2b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Mage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mage is a data and AI workflow platform with an open-source core, an AI Sidekick, and a usage-based managed cloud from $100/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$100/month + usage$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mage.ai builds data and AI workflows with an AI Sidekick and Autopilot monitoring, plus a managed cloud starting at $100/month.$q$,
  og_description = $q$Mage.ai builds data and AI workflows with an AI Sidekick and Autopilot monitoring, plus a managed cloud starting at $100/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1d48d5fd-47e9-414e-af53-a8687df65dbb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1d48d5fd-47e9-414e-af53-a8687df65dbb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$AI Sidekick$q$, $q$Generates workflows from natural-language descriptions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Autopilot$q$, $q$Automatically monitors, validates, recovers, and optimizes production workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$AI-ready data output$q$, $q$Converts workflow outputs into trusted context for analytics and AI agents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Data unification$q$, $q$Integrates sources such as Stripe and Salesforce with destinations such as BigQuery.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Governance controls$q$, $q$Provides visibility, permissions, approvals, and auditability over workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Flexible deployment$q$, $q$Supports fully managed cloud, hybrid cloud, private cloud, and on-premises deployment models.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Open-source core available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$AI-assisted workflow creation from natural language$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Autopilot handles monitoring and recovery of production workflows automatically$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Deployment flexibility across cloud, hybrid, private, and on-premises$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Used by enterprise customers including Samsung, IBM, JPMorgan Chase, and Nokia$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Entry managed plan uses usage-based billing ($0.50 per CPU core/hour and $0.50 per 4GB RAM/hour) on top of the $100/month base, which can be hard to predict$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Enterprise, hybrid, private, and on-premises deployments require contacting sales for custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Limited public pricing detail beyond the entry-level managed plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Is Mage open source?$q$, $q$Mage has an open-source core, alongside fully managed cloud and enterprise deployment options.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$How much does Mage cost?$q$, $q$The self-serve managed plan starts at $100/month plus usage-based infrastructure costs of $0.50 per CPU core/hour and $0.50 per 4GB RAM/hour. Enterprise and hybrid/private/on-premises deployments use custom pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Does Mage use AI?$q$, $q$Yes, Mage includes an AI Sidekick that generates workflows from natural-language descriptions and prepares AI-ready data for analytics and AI agents.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$What deployment options does Mage support?$q$, $q$Mage supports fully managed cloud, hybrid cloud, private cloud, and on-premises deployment models.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$AI-assisted pipeline building$q$, $q$Teams describe a workflow in natural language and let the AI Sidekick generate it.$q$, $q$Data and analytics teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Autonomous workflow operations$q$, $q$Autopilot monitors and recovers production data workflows without manual intervention.$q$, $q$Data engineering / operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$AI agent data preparation$q$, $q$Organizations convert raw workflow output into trusted, reusable context for downstream AI agents.$q$, $q$Enterprises building AI applications$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Start on Your Own$q$, $q$$100/month + usage$q$, $q$monthly$q$, $q$["One development environment","Unlimited users","Usage-based infrastructure ($0.50 per CPU core/hour, $0.50 per 4GB RAM/hour)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$Enterprise / Hybrid / Private / On-Premises$q$, $q$Custom$q$, NULL, $q$["Custom infrastructure and support","Package discounts available","Contact sales required"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$overview$q$, $q$What is Mage?$q$, 2, ARRAY[$q$Mage is a platform for building and running data and AI workflows, with an AI Sidekick that generates workflows from natural-language prompts and an Autopilot feature that monitors, validates, and recovers production workflows automatically.$q$, $q$It has an open-source core and a managed cloud offering that starts at $100/month plus usage-based compute costs, alongside hybrid, private, and on-premises deployment options for larger organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', $q$who-its-for$q$, $q$Who Mage is for$q$, 2, ARRAY[$q$Mage is aimed at data teams, operations teams, and enterprises that need to automate data workflows and prepare AI-ready data, including large organizations such as Samsung, IBM, JPMorgan Chase, and Nokia.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1d48d5fd-47e9-414e-af53-a8687df65dbb', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Node-RED ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Node-RED is a free, open-source, browser-based visual tool for wiring together hardware, APIs, and online services.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2013,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Node-RED is a free, open-source flow-based programming tool for wiring devices, APIs, and services, governed by the OpenJS Foundation.$q$,
  og_description = $q$Node-RED is a free, open-source flow-based programming tool for wiring devices, APIs, and services, governed by the OpenJS Foundation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0f2485e-46a1-44ad-84ac-a606befaef5f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Visual flow editor$q$, $q$A browser-based drag-and-drop editor for wiring together flows that automate tasks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$5,000+ community nodes$q$, $q$A large library of community-built nodes and flows extends what Node-RED can connect to.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Event-driven Node.js runtime$q$, $q$Built on Node.js with a non-blocking, event-driven architecture.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Edge and IoT deployment$q$, $q$Runs on low-cost hardware such as Raspberry Pi, BeagleBone Black, and Arduino, as well as Android.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Cloud deployment options$q$, $q$Can be deployed locally via Docker/Node.js, or run on FlowFuse, AWS, or Microsoft Azure.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Large ecosystem of 5,000+ community nodes and flows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Runs on inexpensive hardware for home automation and IoT edge use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Governed by the OpenJS Foundation with active project leadership$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Mature project in active development since 2013$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$No official Node-RED-run cloud hosting; commercial hosting is provided by third-party sponsor FlowFuse$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Visual flow-based programming can become harder to manage for very complex logic$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Community nodes vary in quality and maintenance since they are contributed by third parties$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Is Node-RED free?$q$, $q$Yes, Node-RED is free and open source, distributed via npm.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Who created Node-RED?$q$, $q$Node-RED was created in early 2013 by Nick O'Leary and Dave Conway-Jones of IBM's Emerging Technology Services group, and they continue leading the project today.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$What organization governs Node-RED?$q$, $q$Node-RED is governed by the OpenJS Foundation, with FlowFuse as its current active sponsor.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$What hardware can run Node-RED?$q$, $q$Node-RED runs on Docker and standard Node.js installations, as well as low-cost devices such as Raspberry Pi, BeagleBone Black, and Arduino, plus Android.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Home automation$q$, $q$Hobbyists wire together smart-home devices and services using the visual flow editor.$q$, $q$Home automation hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$Industrial and IoT control$q$, $q$Engineers deploy Node-RED on edge hardware to automate industrial and IoT processes.$q$, $q$Industrial and IoT engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$API and service integration$q$, $q$Developers wire APIs and online services together without building custom backend glue code.$q$, $q$Developers and integrators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$overview$q$, $q$What is Node-RED?$q$, 2, ARRAY[$q$Node-RED is a free, open-source, low-code programming tool for event-driven applications, offering a browser-based visual editor for wiring together hardware devices, APIs, and online services.$q$, $q$Created in 2013 by Nick O'Leary and Dave Conway-Jones at IBM, it is now governed by the OpenJS Foundation and supported by a library of more than 5,000 community-built nodes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', $q$who-its-for$q$, $q$Who Node-RED is for$q$, 2, ARRAY[$q$Node-RED serves hobbyists building home automation projects as well as engineers deploying industrial control and IoT edge solutions on hardware like Raspberry Pi and Arduino.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b0f2485e-46a1-44ad-84ac-a606befaef5f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Latenode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Latenode is a visual workflow automation platform combining 5,500+ app integrations, AI models, and custom JavaScript code.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan available; paid usage from approximately $10.80/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Latenode combines a visual workflow builder with 5,500+ integrations and built-in AI models, with a free tier and usage-based CPU pricing.$q$,
  og_description = $q$Latenode combines a visual workflow builder with 5,500+ integrations and built-in AI models, with a free tier and usage-based CPU pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f977f684-1fe1-4506-a3eb-4159d62fd97f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Visual workflow builder$q$, $q$A drag-and-drop canvas for building automations from simple 3-node flows up to complex multi-agent systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$1,200+ AI models and apps$q$, $q$Access to AI models including GPT-4o, Claude, and Gemini without managing separate API keys.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$5,500+ integrations$q$, $q$Pre-built connectors across platforms such as Salesforce, HubSpot, Slack, Notion, and Shopify.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Custom JavaScript nodes$q$, $q$Full custom-code capability inside workflow nodes for complex logic.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$AI agents$q$, $q$Supports multi-agent architectures and agentic orchestration for autonomous processes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Enterprise security$q$, $q$SOC 2 Type II, GDPR compliance, SSO, and RBAC are included across all plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Free plan with 10,000 CPU seconds and 5 active workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Unified pricing covers integrations and AI model usage without separate API keys$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Supports custom JavaScript for complex automation logic$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Enterprise security features (SOC 2, GDPR, SSO, RBAC) included on all plans, not gated to top tiers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Positioned as lower-cost than Zapier, Make, and n8n$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Usage-based CPU-second billing can make cost estimation less predictable than flat-rate plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$The Managed Service tier starts at $199/month for hands-on implementation support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Legally registered as Nocode LTD with limited public company background information$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Is Latenode free?$q$, $q$Yes, Latenode offers a free plan with 10,000 CPU seconds and 5 active workflows per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Do I need my own AI API keys?$q$, $q$No, Latenode provides access to 1,200+ AI models and apps, including GPT-4o, Claude, and Gemini, without requiring separate API credentials.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$How is Latenode priced beyond the free plan?$q$, $q$Paid usage is billed by CPU seconds, for example approximately $10.80/month for 100,000 CPU seconds, plus a Managed Service tier starting at $199/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Can I write custom code in Latenode workflows?$q$, $q$Yes, Latenode supports full custom JavaScript code inside workflow nodes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Lead capture and routing$q$, $q$Marketing and sales teams automatically capture and route leads across systems.$q$, $q$Marketing and sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$AI-generated content workflows$q$, $q$Teams use built-in AI models to generate content as part of an automation.$q$, $q$Content and marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Invoice and document processing$q$, $q$Finance teams automate invoice processing and data extraction.$q$, $q$Finance and operations teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$AI chatbots with memory$q$, $q$Teams build chatbots with persistent memory using Latenode's AI agent capabilities.$q$, $q$Support and product teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10,000 CPU seconds","5 active workflows"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Pay-as-You-Go$q$, $q$~$10.80/month per 100,000 CPU seconds$q$, $q$monthly$q$, $q$["Usage-based CPU-second billing","1,200+ AI models & apps","5,500+ integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Managed Service$q$, $q$From $199/month$q$, $q$monthly$q$, $q$["Partner implementation","Ongoing support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$Embedded iPaaS$q$, $q$Custom$q$, NULL, $q$["White-labeled solution for SaaS companies"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$overview$q$, $q$What is Latenode?$q$, 2, ARRAY[$q$Latenode is a business process automation platform that pairs a visual drag-and-drop workflow builder with 5,500+ pre-built integrations and 1,200+ AI models, without requiring users to manage separate API keys.$q$, $q$It offers a free plan (10,000 CPU seconds, 5 active workflows), usage-based pay-as-you-go pricing, a $199/month managed service tier, and an embedded iPaaS option for SaaS companies, with enterprise security (SOC 2, GDPR, SSO, RBAC) included on every plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', $q$who-its-for$q$, $q$Who Latenode is for$q$, 2, ARRAY[$q$Latenode serves both technical teams who want custom JavaScript and full integration access, and non-technical business teams across marketing, sales, finance, and operations who use pre-built automation solutions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f977f684-1fe1-4506-a3eb-4159d62fd97f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── KonnectzIT ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$KonnectzIT is a no-code integration platform for connecting apps through drag-and-drop automations called Konnectz.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month (Pro plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$KonnectzIT connects 400+ apps with no-code drag-and-drop automations, offering a free-forever plan and paid tiers starting at $15/month.$q$,
  og_description = $q$KonnectzIT connects 400+ apps with no-code drag-and-drop automations, offering a free-forever plan and paid tiers starting at $15/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '26b90793-47fc-44e2-b4ed-aaab363f429f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '26b90793-47fc-44e2-b4ed-aaab363f429f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Visual drag-and-drop builder$q$, $q$Build multi-app automations, called Konnectz, using a visual workflow builder.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$400+ app library$q$, $q$Connects CRMs, email tools, communication apps, payment platforms, calendars, project management, scheduling, and storage services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Unlimited workflows on all plans$q$, $q$Unlimited Konnectz are available even on the free plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$API and webhook connections$q$, $q$Apps not in the built-in library can be connected using APIs and webhooks.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Free-forever plan available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Unlimited automations (Konnectz) even on the free tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$No-code visual builder requires no technical setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Affordable paid tiers starting at $15/month$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Smaller app library (400+) compared to larger automation platforms like Zapier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Positioned primarily for small businesses rather than complex enterprise integration needs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Limited independently documented information on company founding and background$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Is KonnectzIT free?$q$, $q$KonnectzIT offers a free-forever plan with unlimited Konnectz (workflows), alongside paid Pro, Team, and Agency plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$How much does KonnectzIT cost?$q$, $q$Paid plans start at $15/month for Pro, $39/month for Team, and $59/month for Agency.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$How many apps does KonnectzIT support?$q$, $q$KonnectzIT's library includes 400+ apps spanning CRMs, email, communication, payments, calendars, project management, scheduling, and storage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Who is KonnectzIT built for?$q$, $q$KonnectzIT is built for small businesses automating repetitive processes, with notable usage among founders, CEOs, and directors in e-learning and marketing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Small business process automation$q$, $q$Small business owners automate repetitive tasks across CRM, email, and payment tools.$q$, $q$Small business owners and founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Marketing workflow automation$q$, $q$Marketing and e-learning teams connect apps to automate lead and content workflows.$q$, $q$Marketing and e-learning teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Free$q$, $q$$0$q$, NULL, $q$["Unlimited Konnectz (workflows)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Pro$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Access to 400+ app integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Team$q$, $q$$39/month$q$, $q$monthly$q$, $q$["Team collaboration features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$Agency$q$, $q$$59/month$q$, $q$monthly$q$, $q$["Agency-level usage and management"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$overview$q$, $q$What is KonnectzIT?$q$, 2, ARRAY[$q$KonnectzIT is a no-code app integration platform that lets users build automations, called Konnectz, using a visual drag-and-drop builder across a library of 400+ apps.$q$, $q$It offers a free-forever plan with unlimited workflows, plus paid Pro ($15/month), Team ($39/month), and Agency ($59/month) tiers for higher usage and team needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', $q$who-its-for$q$, $q$Who KonnectzIT is for$q$, 2, ARRAY[$q$KonnectzIT is aimed at small businesses, with notable usage among founders, CEOs, and directors in e-learning, marketing, and internet-based businesses looking to automate repetitive tasks without heavy technical overhead.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26b90793-47fc-44e2-b4ed-aaab363f429f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Inngest ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Inngest is a durable execution platform for building reliable workflows, AI agents, and background jobs directly in application code.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$99/month (Pro plan); free Hobby plan available$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$San Francisco, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Inngest is a durable execution platform for reliable AI agents and workflows, with a free Hobby plan and Pro starting at $99/month.$q$,
  og_description = $q$Inngest is a durable execution platform for reliable AI agents and workflows, with a free Hobby plan and Pro starting at $99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3acb1b38-990d-4851-be0b-cc32baa33857';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3acb1b38-990d-4851-be0b-cc32baa33857' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Durable execution$q$, $q$Steps retry independently from their failure point without restarting the entire run.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Flow control$q$, $q$Rate limiting, per-tenant concurrency limits, and throttling for workflow execution.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Agent observability$q$, $q$Step-level tracing, replay functionality, and evaluation metrics for AI agents and workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$SDK-based integration$q$, $q$Embeds into existing applications via an SDK supporting Next.js, Node.js, and Python.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Compliance$q$, $q$SOC 2 Type II compliant, with a HIPAA BAA available for regulated industries.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Free Hobby plan with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Embeds directly into existing application code without new infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Step-level tracing, replay, and evaluation for debugging workflows and AI agents$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$SOC 2 Type II compliant with HIPAA BAA available$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Used by companies including Replit, ElevenLabs, Cohere, SoundCloud, and TripAdvisor$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Pro plan pricing scales with usage (executions, concurrency, data ingested), which can raise costs at higher scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Enterprise-only features like SAML, RBAC, and 90-day trace retention require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$SDK-based approach means it's built for developers working in code rather than a visual/no-code interface$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Is Inngest free?$q$, $q$Yes, Inngest has a free Hobby plan with no credit card required, including 50k executions and 500k events ingested per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$How much does Inngest's Pro plan cost?$q$, $q$The Pro plan starts at $99/month and includes 1M+ executions and 100+ concurrent executions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$When was Inngest founded?$q$, $q$Inngest released its durable execution platform in 2022.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Where is Inngest based?$q$, $q$Inngest is headquartered in San Francisco, with a remote-first team.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$AI agent orchestration$q$, $q$Teams building AI agents use Inngest for durable execution and step-level observability.$q$, $q$AI application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Background job processing$q$, $q$Developers run reliable background jobs that survive failures and deployments.$q$, $q$Backend engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Event-driven workflows$q$, $q$Teams build event-driven systems and scheduled jobs without managing separate infrastructure.$q$, $q$Developers in regulated industries$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Hobby$q$, $q$$0/month$q$, $q$monthly$q$, $q$["50k executions","5 concurrent executions","500 MB span data ingested","500k events ingested","100k queue depth","50 realtime connections","Basic tracing, metrics, alerts"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Pro$q$, $q$$99/month$q$, $q$monthly$q$, $q$["1M+ executions","100+ concurrent executions","5 GB span data ingested","5M+ events ingested","1M+ queue depth","1000 realtime connections","Granular tracing, metrics, alerts + 7 day trace retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Customizable resource limits","90 day trace retention","Dedicated Slack channel","SAML, RBAC, audit trails"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$overview$q$, $q$What is Inngest?$q$, 2, ARRAY[$q$Inngest is a durable execution platform that manages reliable execution of workflows, AI agents, and background jobs, embedding durability and observability into application code rather than requiring separate infrastructure.$q$, $q$Founded in 2022 and headquartered in San Francisco, it offers a free Hobby plan, a $99/month Pro plan, and custom Enterprise pricing, and is SOC 2 Type II compliant with a HIPAA BAA available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', $q$who-its-for$q$, $q$Who Inngest is for$q$, 2, ARRAY[$q$Inngest is built for developers and teams building AI applications, complex workflows, and systems that need reliable execution at scale, including those in regulated industries requiring compliance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3acb1b38-990d-4851-be0b-cc32baa33857', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Webhook.site ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Webhook.site generates free, unique URLs and email addresses to instantly inspect, test, and automate incoming HTTP requests and emails.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$7.50/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Webhook.site gives developers free unique URLs to inspect incoming webhooks and emails, with paid plans from $7.50/month.$q$,
  og_description = $q$Webhook.site gives developers free unique URLs to inspect incoming webhooks and emails, with paid plans from $7.50/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Webhook testing$q$, $q$Receive and inspect incoming HTTP requests in real time at a unique URL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Email capture$q$, $q$Generates unique email addresses for testing email integrations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$DNS monitoring (DNSHook)$q$, $q$Captures and inspects DNS queries for testing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Request replay$q$, $q$Re-executes previously captured requests.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Workflow automation$q$, $q$A drag-and-drop workflow builder with AI capabilities for automating actions on incoming requests.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Native integrations$q$, $q$Connects to Google Sheets, Slack, AWS S3, Dropbox, SFTP, databases, and JavaScript.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Free tier requires no signup for quick webhook testing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Supports both webhook and email testing use cases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Includes a built-in workflow/automation builder$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Native integrations with common tools like Slack, S3, and Google Sheets$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Request replay simplifies debugging$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Free tier is limited to 100 requests per unique URL and URLs expire$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Permanent addresses and account protection require a paid plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Advanced features like SSO, custom domains, and white-labeling are reserved for paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Is Webhook.site free?$q$, $q$Yes, Webhook.site offers a free tier limited to 100 requests per unique URL, with URLs that expire after a set period.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$How much do paid plans cost?$q$, $q$Paid plans start from $7.50/month and include unlimited requests and emails, permanent protected addresses, and up to 100,000 request history.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Can I test email integrations?$q$, $q$Yes, Webhook.site generates unique email addresses so you can capture and inspect test emails.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Does Webhook.site support automation?$q$, $q$Yes, it includes a drag-and-drop workflow builder with AI capabilities for automating actions on captured requests.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Webhook debugging$q$, $q$Developers inspect incoming webhook payloads in real time during integration development.$q$, $q$Developers and automation engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Email integration testing$q$, $q$Teams generate disposable email addresses to test outbound email flows.$q$, $q$QA and engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Request-triggered automation$q$, $q$Teams use the workflow builder to automate actions when specific requests are received.$q$, $q$Automation engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 100 requests per unique URL","URLs expire after a set period","No account protection"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$Paid$q$, $q$From $7.50/month$q$, $q$monthly$q$, $q$["Unlimited requests and emails","Permanent addresses with account protection","Up to 100,000 request history","Workflows, schedules, SSO, custom domains"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$overview$q$, $q$What is Webhook.site?$q$, 2, ARRAY[$q$Webhook.site generates free, unique URLs and email addresses and lets you see everything sent there instantly, making it easy to test, transform, and automate incoming web requests and emails without building custom infrastructure.$q$, $q$The free tier allows up to 100 requests per URL before expiry, while paid plans starting at $7.50/month add unlimited requests, permanent protected addresses, and advanced features like workflows, SSO, and custom domains.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', $q$who-its-for$q$, $q$Who Webhook.site is for$q$, 2, ARRAY[$q$Webhook.site is used by software developers, automation engineers, and organizations building integrations that depend on webhooks or email communications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f5c5646b-b55a-44bf-ba99-9b66ef0e4eb8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Beeceptor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Beeceptor lets developers instantly create mock REST, GraphQL, SOAP, and gRPC API servers without writing backend code.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month (Individual plan); free plan available$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Beeceptor creates instant mock API servers from OpenAPI, GraphQL, or WSDL specs, with a free plan and paid tiers from $10/month.$q$,
  og_description = $q$Beeceptor creates instant mock API servers from OpenAPI, GraphQL, or WSDL specs, with a free plan and paid tiers from $10/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e2b9e0f1-deda-4938-ab90-97882bfe5810' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$AI-powered mock generation$q$, $q$Generates mock servers from API specs including OpenAPI, WSDL, GraphQL SDL, and proto files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$No-code rule configuration$q$, $q$Set matching rules and custom responses without writing code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Real-time request inspection$q$, $q$Inspect incoming requests live for debugging webhooks and callbacks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Dynamic responses$q$, $q$Generate responses dynamically using request data and headers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Schema-less CRUD storage$q$, $q$Built-in mock database supporting CRUD operations without a predefined schema.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Proxy and record mode$q$, $q$Switch between live and mock modes, recording real responses for later replay.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Network condition simulation$q$, $q$Simulate latency, timeouts, and errors for failure testing.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Local tunnel$q$, $q$Routes payloads to a developer's local machine during testing.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Free forever plan with no signup barrier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Supports multiple API protocols: REST, GraphQL, SOAP, and gRPC$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$AI-assisted mock creation directly from API specs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Processes over 10 million requests daily at 99.9% uptime$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$20% discount for annual billing on paid plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Free tier is limited to 50 requests/day and 3 mock rules$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Higher-usage tiers add per-million-request overage fees (e.g. +$40 per extra 1M requests on Scale)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Enterprise features like SSO, audit logs, and on-premise deployment require higher-tier or custom plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Is Beeceptor free?$q$, $q$Yes, Beeceptor has a free forever plan limited to 50 requests/day and 3 mock rules, with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$What API protocols does Beeceptor support?$q$, $q$Beeceptor supports mock servers for REST, GraphQL, SOAP, and gRPC APIs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$How much do paid plans cost?$q$, $q$Paid plans start at $10/month for Individual, $25/month for Team, and $99/month for Scale, with a custom-priced Enterprise tier and a 20% discount for annual billing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$How reliable is Beeceptor?$q$, $q$Beeceptor reports processing over 10 million requests daily across 1,000+ mock servers launched daily, with 99.9% uptime.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$API development without a backend$q$, $q$Developers mock APIs from specs to build frontend or integration code before the real backend exists.$q$, $q$Frontend and integration developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$QA test automation$q$, $q$QA teams simulate API responses, latency, and errors to test failure handling.$q$, $q$QA and test automation teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Product demos$q$, $q$Teams use mock servers to run product demos without depending on live backend systems.$q$, $q$Product and sales engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["50 requests/day per endpoint","3 mock rules","Limited AI assistance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Individual$q$, $q$$10/month$q$, $q$monthly$q$, $q$["15,000 requests/month per endpoint","Up to 50 mock rules","AI-powered mock creation","Persistent local tunnel","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Team$q$, $q$$25/month$q$, $q$monthly$q$, $q$["100,000 requests/month per endpoint","Up to 250 mock rules","CI/CD integration","Custom domain","mTLS","Unlimited team members"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Scale$q$, $q$$99/month$q$, $q$monthly$q$, $q$["1M+ requests/month per endpoint","Up to 500 mock rules","Audit logs","Forward proxy","API contract drift detection","+$40 per extra 1M requests"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited usage options","On-premise deployment","SSO","Dedicated support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$overview$q$, $q$What is Beeceptor?$q$, 2, ARRAY[$q$Beeceptor is a platform for creating mock API servers without backend infrastructure, generating REST, GraphQL, SOAP, and gRPC mock servers from uploaded API specs or no-code configuration.$q$, $q$It offers a free forever plan (50 requests/day, 3 mock rules) and paid tiers from $10/month up to a custom Enterprise plan, and reports processing over 10 million requests daily at 99.9% uptime.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', $q$who-its-for$q$, $q$Who Beeceptor is for$q$, 2, ARRAY[$q$Beeceptor is used by development and QA teams, software architects, and API-based companies looking to accelerate integrations, testing, and demos without depending on live backend systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2b9e0f1-deda-4938-ab90-97882bfe5810', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Mockoon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mockoon is a free, open-source desktop app for designing and running mock REST APIs locally, with an optional paid Cloud tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$100/month (billed annually)$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mockoon: free open-source tool to design and run mock REST APIs locally, with an optional Cloud plan for team collaboration.$q$,
  og_description = $q$Mockoon: free open-source tool to design and run mock REST APIs locally, with an optional Cloud plan for team collaboration.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd7ffccc1-7061-4b16-994f-9a8923b1a11b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$API Mocking$q$, $q$Design and run mock REST APIs in seconds through an intuitive desktop interface, with no remote deployment or account needed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Dynamic Templating & Rules Matching$q$, $q$Simulate realistic scenarios and test edge cases using templating and rule-based response matching.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Requests Recording$q$, $q$Capture real HTTP requests from a live API and replay them to quickly build mocks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Proxy Mode$q$, $q$Forward unmocked requests through to a real API while mocking only selected endpoints.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$OpenAPI Compatibility$q$, $q$Import and export OpenAPI specifications to fit existing API design workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$CLI & Docker$q$, $q$Run mocks headlessly on servers, in Docker containers, or serverless platforms (AWS Lambda, GCP Functions, Firebase Functions), and in CI/CD (GitHub Actions, CircleCI, TravisCI).$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Mockoon Cloud Collaboration$q$, $q$Deploy mocks to the cloud and collaborate with a team in real time (paid Cloud tier).$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Free, open-source desktop app with no account required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Supports Windows, macOS, and Linux$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$CLI and Docker support for CI/CD and headless environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$OpenAPI import/export fits existing API design workflows$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Active, offline-first, privacy-friendly project maintained since 2017$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Real-time team collaboration and cloud deployment require a paid Mockoon Cloud subscription$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Team plan is priced at $100/month billed annually rather than offering a lower-cost individual paid tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Enterprise pricing is custom/quote-only, requiring direct contact$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Is Mockoon free?$q$, $q$Yes, the desktop application, CLI, and Docker image are open-source and free to use with no account required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$What is Mockoon Cloud?$q$, $q$A paid add-on offering cloud-hosted mock deployments and real-time team collaboration, with the Team plan starting at $100/month billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Does Mockoon Cloud offer a free trial?$q$, $q$Yes, a 14-day free trial is available (no card needed for work emails; 7 days with a card for others).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$What platforms does Mockoon support?$q$, $q$Windows, macOS, and Linux desktop installs, plus CLI and Docker for servers and CI/CD.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Can Mockoon import OpenAPI specs?$q$, $q$Yes, Mockoon is compatible with OpenAPI for importing and exporting API designs.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Local API mocking during frontend development$q$, $q$Frontend and full-stack developers mock backend REST APIs locally before real endpoints exist.$q$, $q$Frontend/full-stack developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$CI/CD test mocking$q$, $q$Teams run Mockoon via CLI or Docker in pipelines to mock dependencies for automated tests.$q$, $q$QA/DevOps engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Team collaboration on shared mocks$q$, $q$Organizations use Mockoon Cloud to deploy and collaborate on mock APIs in real time.$q$, $q$Engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Free desktop app for Windows, macOS, and Linux","CLI and Docker image for headless/self-hosted use","No account required","Full core mocking, templating, and proxy features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Team$q$, $q$$100/month$q$, $q$annual$q$, $q$["5 team members","3 API mocks deployed in the cloud with real-time collaboration","100,000 monthly calls included","200 AI-generated endpoints per month per user","Team-level role-based access control","Web UI access","Next business day support","All open-source features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["All Team plan features","Custom quotas and limits","Optional dedicated instances","Enterprise support with a customer success manager","Custom payment options (PO, invoicing, bank transfer)","Custom Google Cloud region deployment","1-year audit trail retention","Contractual 99.9% availability SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$overview$q$, $q$What is Mockoon?$q$, 2, ARRAY[$q$Mockoon is an open-source tool for designing and running mock REST APIs. Its free desktop application lets developers create functioning mock APIs in seconds, entirely offline and without creating an account.$q$, $q$Beyond the desktop app, Mockoon offers a CLI and Docker image for running mocks on servers, in CI/CD pipelines, or on serverless platforms, plus an optional paid Mockoon Cloud tier for deploying mocks to the cloud and collaborating with a team in real time.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', $q$who-its-for$q$, $q$Who Mockoon is for$q$, 2, ARRAY[$q$Mockoon suits individual developers who want a fast, free, offline way to mock REST APIs during local development, as well as teams that need shared, cloud-hosted mocks and are willing to pay for the Mockoon Cloud Team or Enterprise plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7ffccc1-7061-4b16-994f-9a8923b1a11b', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── MockServer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MockServer is a free, open-source tool to mock, proxy, and verify HTTP, HTTPS, gRPC, and GraphQL APIs for testing.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Free open-source MockServer mocks, proxies, and verifies HTTP/HTTPS, gRPC, and GraphQL APIs for fast, deterministic tests.$q$,
  og_description = $q$Free open-source MockServer mocks, proxies, and verifies HTTP/HTTPS, gRPC, and GraphQL APIs for fast, deterministic tests.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Mocking$q$, $q$Return controllable, dynamic responses for any request to isolate services under test.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Proxying$q$, $q$Record, replay, and inject chaos into real traffic passing through a proxy.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Verification$q$, $q$Assert which requests were sent, using MockServer as part of test assertions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Chaos Testing$q$, $q$Inject latency, errors, dropped connections, and malformed responses to test resilience.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Broad Protocol Support$q$, $q$Supports HTTP/1.1, HTTP/2, HTTP/3, HTTPS, gRPC, AsyncAPI messaging, GraphQL, and OAuth2/OIDC.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$LLM Mocking$q$, $q$Mocks OpenAI, Anthropic, and Bedrock-style APIs, including token streaming.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Interactive Debugging$q$, $q$Set breakpoints to pause and modify requests and responses live.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Load Testing$q$, $q$Run built-in declarative load scenarios.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Completely free and open source, no SaaS account required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Broad protocol support including HTTP/2, HTTP/3, gRPC, and GraphQL$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Multiple deployment options: Docker, executable JAR, Helm/Kubernetes, Testcontainers, Homebrew$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Client libraries for many languages: Java, JavaScript, Python, Ruby, Go, .NET, Rust, PHP$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Built-in chaos and load testing in addition to basic mocking$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$No managed/hosted SaaS offering documented on the site — requires running and managing your own instance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$No listed company, founding year, or dedicated commercial support plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Documentation does not state an explicit license type$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Is MockServer free?$q$, $q$Yes, MockServer is free and open-source with no SaaS account required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$How do I run MockServer?$q$, $q$Via Docker, an executable JAR, Homebrew, Kubernetes Helm charts, or Testcontainers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$What protocols does MockServer support?$q$, $q$HTTP/1.1, HTTP/2, HTTP/3, HTTPS, gRPC, AsyncAPI messaging, GraphQL, and OAuth2/OIDC.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Can MockServer mock AI/LLM APIs?$q$, $q$Yes, it includes built-in mocking for OpenAI, Anthropic, and Bedrock-style APIs with token streaming.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Which languages have client libraries?$q$, $q$Java, JavaScript, Python, Ruby, Go, .NET, Rust, and PHP, plus a REST API and CLI.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Automated integration testing$q$, $q$QA teams mock external dependencies to make integration tests fast, isolated, and deterministic.$q$, $q$QA/backend engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$Chaos and resilience testing$q$, $q$Teams inject latency, errors, and malformed responses to test how services handle failures.$q$, $q$SRE/backend engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$AI application testing$q$, $q$Developers mock LLM provider APIs (OpenAI, Anthropic, Bedrock) to test AI features without calling live APIs.$q$, $q$AI/ML engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$overview$q$, $q$What is MockServer?$q$, 2, ARRAY[$q$MockServer is a free, open-source tool that mocks, records, and proxies HTTP and HTTPS services so tests can run fast, isolated, and deterministic.$q$, $q$It supports a broad range of protocols including HTTP/2, HTTP/3, gRPC, GraphQL, AsyncAPI messaging, and OAuth2/OIDC, and can be deployed via Docker, an executable JAR, Kubernetes Helm charts, or Testcontainers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', $q$who-its-for$q$, $q$Who MockServer is for$q$, 2, ARRAY[$q$MockServer is aimed at backend, QA, and SRE engineers who need to mock, verify, and stress-test HTTP-based service dependencies, including teams building and testing AI applications that call LLM provider APIs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b64d2ca-a1dc-4aae-a2ec-4b86bf0052dc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── WireMock ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WireMock is an open-source HTTP API simulation tool, with an optional hosted WireMock Cloud tier for teams and enterprises.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$WireMock: open-source API mocking and simulation tool, with WireMock Cloud offering free and enterprise hosted plans.$q$,
  og_description = $q$WireMock: open-source API mocking and simulation tool, with WireMock Cloud offering free and enterprise hosted plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f7b90709-b508-4388-a295-d5608f207c11';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f7b90709-b508-4388-a295-d5608f207c11' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Request matching$q$, $q$Matches requests on URL patterns, headers, query parameters, cookies, and request body.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Dynamic response templating$q$, $q$Generates dynamic responses using Handlebars templating.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Record and playback$q$, $q$Records real API traffic and replays it for realistic test scenarios.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Fault simulation$q$, $q$Simulates network delays and malformed responses to test edge cases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Request verification$q$, $q$Verifies that expected requests were made during test runs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Flexible deployment$q$, $q$Runs as a standalone JAR, embedded in tests, or as a Docker container.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$WireMock Cloud (hosted)$q$, $q$A commercial hosted platform adding stateful mocking, database import, OpenAPI sync, and UI-based mock creation with AI support.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Free and open source with no cost for the core simulation engine$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Supports fault simulation, request verification, and Handlebars-based dynamic responses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Flexible deployment as a standalone JAR, embedded library, or Docker container$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Broad framework support including Java (Maven, Gradle, Kotlin, Scala SBT) and .NET via WireMock.Net$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$WireMock Cloud offers a free plan with no credit card required$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$WireMock Cloud's free plan is limited to 1,000 API calls/month, one user, and 3 mock APIs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$WireMock Cloud Enterprise pricing is not publicly listed and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Stateful mocking, team collaboration, and SSO/RBAC require the paid Enterprise tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Free plan on WireMock Cloud caps request rate at 10 requests per second$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Is WireMock free to use?$q$, $q$Yes, the core WireMock tool is free and open source. WireMock Cloud, the hosted commercial platform, also has a free plan with usage limits.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Does WireMock have a hosted cloud offering?$q$, $q$Yes, WireMock Cloud is a commercial hosted platform with a free tier (1,000 calls/month, 1 user, 3 mock APIs) and a custom-priced Enterprise tier.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$What languages and frameworks does WireMock support?$q$, $q$WireMock supports Java (via Maven, Gradle for Groovy/Kotlin) and Scala SBT, plus .NET via the WireMock.Net implementation, and can run standalone or in Docker.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Does WireMock Cloud include AI features?$q$, $q$Yes, WireMock Cloud offers UI-based mock creation with AI support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$API testing without live dependencies$q$, $q$Simulate third-party or internal APIs so applications can be tested without relying on real, live services.$q$, $q$QA engineers and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Parallel feature development$q$, $q$Develop and test against simulated API responses before the real backend is ready.$q$, $q$Development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Fault and chaos testing$q$, $q$Use WireMock Cloud's chaos testing to simulate network delays and malformed responses for resilience testing.$q$, $q$SRE and QA teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Free$q$, $q$$0$q$, NULL, $q$["1,000 API calls/month","1 user","Up to 3 mock APIs","Shared multi-tenant cluster","REST, gRPC, GraphQL support","10 requests/second rate limit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$Enterprise$q$, $q$Custom quote$q$, NULL, $q$["Unlimited API calls","Unlimited team members","Dedicated private instance","Stateful mocking","Team collaboration and SSO/RBAC","Chaos testing","Git sync"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$overview$q$, $q$What is WireMock?$q$, 2, ARRAY[$q$WireMock is an open-source tool for simulating HTTP-based APIs, described by its maker as "the industry standard for scalable API simulation." It lets developers mock request/response behavior, including request matching on URLs, headers, query parameters, cookies, and body content, along with dynamic response generation via Handlebars templating.$q$, $q$Beyond the free, open-source core (which can run standalone, embedded in tests, or in Docker), WireMock also offers WireMock Cloud, a hosted commercial platform with stateful mocking, OpenAPI synchronization, CI/CD integration, and chaos testing. WireMock Cloud has a free tier and a custom-priced Enterprise tier for larger teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', $q$who-its-for$q$, $q$Who WireMock is for$q$, 2, ARRAY[$q$WireMock suits developers and QA teams working in Java or .NET ecosystems who need to test applications against simulated dependencies, verify request behavior, or develop features in parallel with backend teams before real APIs are available.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f7b90709-b508-4388-a295-d5608f207c11', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Bruno ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bruno is an open-source, Git-native API client with local-first storage, offering paid Pro and Ultimate plans for teams.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bruno: open-source, offline-first API client storing collections as Git-tracked files; paid Pro and Ultimate plans add team features.$q$,
  og_description = $q$Bruno: open-source, offline-first API client storing collections as Git-tracked files; paid Pro and Ultimate plans add team features.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a27d9c1d-671b-4574-89ec-95d7edf9ea00' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Git-native storage$q$, $q$Collections are stored as plain text files and folders directly in your filesystem, trackable in Git.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Local-first, no cloud sync$q$, $q$Data stays on the user's machine with no required cloud synchronization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$No login required$q$, $q$The app can be used without creating an account or logging in.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Version control integration$q$, $q$Works natively with Git and other version control systems for team collaboration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Enterprise permissions via Git$q$, $q$Leverages existing Git-based access controls and audit logs instead of a proprietary permissions system.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Cross-platform desktop app and CLI$q$, $q$Available for Windows, macOS, and Linux, plus a CLI for automation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Fully open source with local-first, offline storage of collections as plain text files$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Git-native workflow enables version control and collaboration without a proprietary cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$No login or account required to use the core application$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$SOC 2 Type I certified, with no AI training on user data$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Cross-platform desktop app for Windows, macOS, and Linux, plus a CLI$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$14-day free trial of the Ultimate plan with no credit card required$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Free Open Source tier is limited to 2 workspaces, public Git providers only, and 5 OpenAPI syncs per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$SSO/SCIM and enterprise support are only available on the paid Ultimate tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Unlimited workspaces and private Git provider support require the paid Pro or Ultimate plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$No mobile app is documented$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Is Bruno free to use?$q$, $q$Yes, Bruno's Open Source tier is free ($0). Paid Pro ($6/user/month) and Ultimate ($11/user/month) tiers, billed annually, add team and enterprise features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Does Bruno store data in the cloud?$q$, $q$No, Bruno is local-first: collections are stored as plain text files on your machine, with sharing handled through Git.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$What platforms does Bruno support?$q$, $q$Bruno is available for Windows, macOS, and Linux, plus a CLI, and can be installed via Winget, Chocolatey, or Scoop on Windows.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Is there a free trial for the paid plans?$q$, $q$Yes, a 14-day free trial of the Ultimate plan is available without requiring a credit card.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Offline, Git-based API testing$q$, $q$Work with a local-first API client that stores collections as files without relying on cloud sync.$q$, $q$Individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Team API collaboration via Git$q$, $q$Use the Pro or Ultimate plan to share collections across a team using Git-based access controls.$q$, $q$Engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Enterprise API governance$q$, $q$Use the Ultimate plan's SSO/SCIM, custom terms, and security review for organization-wide rollout.$q$, $q$Enterprise IT and security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Open Source$q$, $q$$0$q$, NULL, $q$["2 workspaces","Public Git providers only","5 OpenAPI syncs/month","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Pro$q$, $q$$6/user/month$q$, $q$annual$q$, $q$["Unlimited workspaces","Public + private Git providers","Unlimited OpenAPI syncs","2 user management/license admins","48-hour support SLA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$Ultimate$q$, $q$$11/user/month$q$, $q$annual$q$, $q$["Everything in Pro","Unlimited user management/license admins","SSO & SCIM","Custom terms, DPA, and security review","24-hour support SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$overview$q$, $q$What is Bruno?$q$, 2, ARRAY[$q$Bruno is an open-source API client positioned as a developer-first alternative to cloud-based API platforms. It stores collections as plain text files directly in the filesystem, so they can be tracked and shared through Git rather than a proprietary cloud sync layer.$q$, $q$Beyond the free Open Source tier, Bruno offers paid Pro ($6/user/month) and Ultimate ($11/user/month) plans, billed annually, that add unlimited workspaces, private Git provider support, unlimited OpenAPI syncs, and, on Ultimate, SSO/SCIM and enterprise support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', $q$who-its-for$q$, $q$Who Bruno is for$q$, 2, ARRAY[$q$Bruno is aimed at developers and teams who want a local-first, Git-native API client without mandatory cloud accounts, and at organizations (including Microsoft, Autodesk, Capital One, Cisco, Comcast, GitHub, Oracle, Nike, and Vanguard, per the site) that want Git-based governance over API collections.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a27d9c1d-671b-4574-89ec-95d7edf9ea00', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Insomnia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Insomnia is a Kong-owned API platform supporting REST, GraphQL, gRPC, and WebSocket, with free and paid plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Insomnia by Kong: API client for REST, GraphQL, gRPC, and WebSocket testing, with a free Essentials tier and paid Pro/Enterprise plans.$q$,
  og_description = $q$Insomnia by Kong: API client for REST, GraphQL, gRPC, and WebSocket testing, with a free Essentials tier and paid Pro/Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '26e0091a-2dbf-4bce-9fd3-e6410e5065db';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '26e0091a-2dbf-4bce-9fd3-e6410e5065db' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Multi-protocol API client$q$, $q$Supports REST, GraphQL, gRPC, WebSocket (WSS), and Socket.io endpoints.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$API design$q$, $q$OpenAPI spec-based design with real-time preview.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$API testing$q$, $q$Unlimited collection tests with pre/post-request scripting.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$API mocking$q$, $q$Generates dynamic mock responses from specs or descriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$MCP client$q$, $q$Native Model Context Protocol server testing support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Inso CLI$q$, $q$Command-line tool for CI/CD automation and spec validation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Git sync collaboration$q$, $q$Syncs projects via Git, local storage, or cloud, with role-based access controls.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Free Essentials tier includes unlimited projects, collection runner, and full HTTP/gRPC/GraphQL support$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Supports REST, GraphQL, gRPC, WebSocket (WSS), and Socket.io protocols in one client$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Includes Inso CLI for CI/CD automation and spec validation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Native MCP (Model Context Protocol) client for testing MCP servers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Enterprise plan adds SSO/SCIM, native vault integrations (AWS, GCP, HashiCorp, Azure), and SOC 2 Type 2 compliance$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Free Essentials tier limits Git Sync to 3 users and mock server requests to 1,000/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$SSO (SAML/OIDC) is only available on the $45/user/month Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Enterprise self-serve pricing caps at 50 users; larger teams must contact sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Is Insomnia free to use?$q$, $q$Yes, the Essentials plan is free ($0/user/month). Paid Pro ($12/user/month) and Enterprise ($45/user/month) plans, billed annually, add collaboration and governance features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Who owns Insomnia?$q$, $q$Insomnia is owned by Kong Inc.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$What API protocols does Insomnia support?$q$, $q$REST, GraphQL, gRPC, WebSocket (WSS), and Socket.io.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Does Insomnia offer a CLI?$q$, $q$Yes, the Inso CLI supports CI/CD automation and API spec validation.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Does Insomnia support single sign-on?$q$, $q$Yes, SSO via SAML/OIDC with SCIM automation is available on the Enterprise plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$API design and testing$q$, $q$Design, test, and debug REST, GraphQL, gRPC, and WebSocket APIs using the free Essentials tier.$q$, $q$Individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Team collaboration on APIs$q$, $q$Use the Pro plan for unlimited Git Sync users, organizations, and 10,000 monthly mock server requests.$q$, $q$Scaling teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Enterprise API governance$q$, $q$Use the Enterprise plan for SSO, native vault integrations, domain capture, and dedicated support.$q$, $q$Large organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Essentials$q$, $q$$0/user/month$q$, NULL, $q$["Git Sync for up to 3 users","Native Git/Filesystem CLI","Unlimited projects and collection runner","No login required for Scratch Pad","Full HTTP, gRPC, and GraphQL support","1,000 mock server requests/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Pro$q$, $q$$12/user/month$q$, $q$annual$q$, $q$["Unlimited Git Sync users","Unlimited organizations","Role-based access control","10,000 mock server requests/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$Enterprise$q$, $q$$45/user/month$q$, $q$annual$q$, $q$["Unlimited mock server requests","SSO (SAML/OIDC) with SCIM","Native vault integrations (AWS, GCP, HashiCorp, Azure)","Domain capture/lock","Enterprise support","Kong Professional Services addon"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$overview$q$, $q$What is Insomnia?$q$, 2, ARRAY[$q$Insomnia is an API development platform owned by Kong Inc., used for designing, testing, debugging, and mocking APIs across REST, GraphQL, gRPC, WebSocket (WSS), and Socket.io protocols. It includes the Inso CLI for CI/CD automation and a native MCP client for testing Model Context Protocol servers.$q$, $q$Insomnia offers a free Essentials tier alongside paid Pro ($12/user/month) and Enterprise ($45/user/month) plans, billed annually, which add unlimited Git Sync collaborators, higher mock server request limits, SSO/SCIM, and native secrets-vault integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', $q$who-its-for$q$, $q$Who Insomnia is for$q$, 2, ARRAY[$q$Insomnia is used by individual developers on its free Essentials tier, scaling teams on the Pro plan needing broader Git Sync collaboration, and large organizations on the Enterprise plan requiring SSO, vault integrations, and dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26e0091a-2dbf-4bce-9fd3-e6410e5065db', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── HTTPie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HTTPie is an open-source API testing toolset with a CLI, a cross-platform desktop app, and a web app.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, United States$q$,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$HTTPie: open-source CLI, desktop, and web API client with AI-assisted request building. See features, platforms, and what's verified.$q$,
  og_description = $q$HTTPie: open-source CLI, desktop, and web API client with AI-assisted request building. See features, platforms, and what's verified.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f1c58995-800c-4ef6-9481-0dcaa3734eff' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Terminal/CLI$q$, $q$The original open-source command-line tool, installable via apt, brew, choco, pip, port, snap, yum, and more; installs both `http` and `https` commands.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Expressive syntax$q$, $q$Expressive and intuitive command syntax with first-class JSON support and colorized, formatted terminal output.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Desktop app$q$, $q$A graphical, cross-platform desktop application (Mac, Windows, Linux) currently in public beta, offering the CLI's functionality in a GUI.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Web app$q$, $q$A browser-based version of HTTPie accessible without installing anything.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$AI-assisted work$q$, $q$The Desktop app advertises the ability to 'leverage the power of AI-assisted work' alongside a dedicated HTTPie AI product.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Organization tools$q$, $q$Spaces, collections, and tabs for organizing requests, plus variables and environments for request parametrization.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Offline & account-optional$q$, $q$The Desktop app can be used offline and without creating an account, with cross-device sync and auto-save when signed in.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Sessions and auth$q$, $q$Persistent sessions, forms and file uploads, HTTPS/proxy/authentication support, a wget-like download mode, and an extensions API for authentication.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$CLI is free, open source, and has over 47,900 GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Available across CLI, desktop, and web, so teams can pick the interface that fits their workflow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Desktop app works offline and doesn't require an account$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Simple, human-readable request syntax with strong JSON support$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Backed by $6.5M seed funding from Coatue, Blossom Capital, and founders of Intercom, Checkout.com, and Monzo$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$The Desktop app is still in public beta$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$No public pricing page was found, so cost of any paid tiers (if they exist) is unclear$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Detailed documentation on integrations and enterprise/team features is not surfaced on the marketing site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Is HTTPie free?$q$, $q$The HTTPie CLI is free and open source. The Desktop app can also be used offline and without an account; no public pricing page currently lists paid plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$What platforms does HTTPie Desktop support?$q$, $q$HTTPie Desktop is described as cross-platform, supporting Mac, Windows, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Is HTTPie CLI open source?$q$, $q$Yes, the CLI is open source, with the project describing itself as 'Open Source. Open minded' and having over 47,900 GitHub stars.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Does HTTPie have AI features?$q$, $q$HTTPie markets 'AI-assisted work' in its Desktop app and has a separate HTTPie AI product, though detailed capabilities are not fully documented on the homepage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$Command-line API testing$q$, $q$Developers use the HTTPie CLI to send and debug HTTP requests directly from the terminal with readable, colorized output.$q$, $q$Developers and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$GUI-based API workflows$q$, $q$Teams that prefer a visual interface can use the Desktop or Web app to organize requests into spaces and collections.$q$, $q$API developers and QA testers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$overview$q$, $q$What is HTTPie?$q$, 2, ARRAY[$q$HTTPie is an API testing toolset that started as an open-source command-line tool and has grown into a suite including a cross-platform Desktop app (public beta) and a Web app. The CLI supports expressive syntax, first-class JSON handling, and colorized terminal output, and is installable through common package managers like apt, brew, pip, and snap.$q$, $q$The company, HTTPie Inc., is based in San Francisco and has raised a $6.5M seed round from investors including Coatue and Blossom Capital. The CLI alone has amassed over 47,900 GitHub stars.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', $q$who-its-for$q$, $q$Who HTTPie is for$q$, 2, ARRAY[$q$HTTPie suits developers who want a fast, readable way to test APIs from the terminal, as well as teams who prefer a GUI via the Desktop or Web app for organizing requests into collections and spaces.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1c58995-800c-4ef6-9481-0dcaa3734eff', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Yaak ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Yaak is a local-first, MIT-licensed desktop API client for HTTP, GraphQL, gRPC, WebSocket, and SSE requests.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$79/year$q$,
  founded_year = 2024,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Yaak: open-source, local-first API client for HTTP, GraphQL, gRPC, WebSocket and SSE. Free for personal use; paid licenses for commercial use.$q$,
  og_description = $q$Yaak: open-source, local-first API client for HTTP, GraphQL, gRPC, WebSocket and SSE. Free for personal use; paid licenses for commercial use.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '80059e68-8557-45a3-a76c-b2d0817a3a9c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '80059e68-8557-45a3-a76c-b2d0817a3a9c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Multi-protocol requests$q$, $q$Send HTTP, GraphQL, gRPC, WebSocket, and SSE requests from one app.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Dynamic templating$q$, $q$Request templating with variables and template functions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Full request debugging$q$, $q$Inspect redirects, cookies, and headers for each request.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Built-in Git collaboration$q$, $q$Projects are stored as plain-text files with built-in Git integration for team collaboration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Import from other tools$q$, $q$Import existing collections from Postman, Insomnia, OpenAPI, cURL, and Swagger.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Broad authentication support$q$, $q$Automatically handles OAuth 1/2, AWS v4, JWT, Basic, Bearer, and API Key authentication.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Local-only privacy$q$, $q$Local-only data storage, secrets encrypted with ChaCha20-Poly1305 in the OS keychain, and zero telemetry.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Agent/MCP connectivity$q$, $q$Connect your own AI agents via the CLI or an MCP server.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$MIT-licensed source code that can be audited and self-built$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Free for personal use with no account required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Local-first with zero telemetry and encrypted secret storage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Supports HTTP, GraphQL, gRPC, WebSocket, and SSE in one app$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Built-in Git collaboration using plain-text project files$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Prebuilt binaries require a paid commercial license for business use even though the source is MIT-licensed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Desktop-only (Mac, Windows, Linux) — no web or mobile version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$No native AI features; AI usage requires connecting your own agents$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Is Yaak free?$q$, $q$Yaak is free for personal use. Commercial use of the prebuilt binaries requires a paid license (annual or lifetime), even though the source code is MIT-licensed.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Is Yaak open source?$q$, $q$Yes, the source code is MIT-licensed and can be audited or self-built; licensing fees apply only to the official prebuilt binaries.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$What platforms does Yaak support?$q$, $q$Yaak is available for Mac, Windows, and Linux.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Does Yaak have built-in AI?$q$, $q$No native AI is built in, but Yaak lets you connect your own agents via its CLI or MCP server.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Who makes Yaak?$q$, $q$Yaak is made by Mountain Loop Labs, founded by Greg, the creator of Insomnia (sold in 2019). Yaak launched in January 2024.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Privacy-focused API testing$q$, $q$Developers who want a local-first client with zero telemetry and encrypted secrets can test APIs without sending data to a cloud service.$q$, $q$Privacy-conscious developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Multi-protocol development$q$, $q$Teams working across REST, GraphQL, gRPC, and WebSocket APIs can use a single client instead of separate tools.$q$, $q$Backend and full-stack developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Team collaboration via Git$q$, $q$Since projects are stored as plain-text files, teams can collaborate on API collections using their existing Git workflow.$q$, $q$Development teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Free$q$, $q$$0$q$, NULL, $q$["Personal use only","30-day free trial for commercial evaluation, no credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Individual (Annual)$q$, $q$$79/year$q$, $q$annual$q$, $q$["Commercial use","Lifetime fallback license","Email support","Boosted roadmap influence","Single non-transferable license"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Individual (Lifetime)$q$, $q$$349 one-time$q$, NULL, $q$["Commercial use","Lifetime license with future updates","Email support","Boosted roadmap influence","Single non-transferable license"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$Business (Annual)$q$, $q$$149/user/year$q$, $q$annual$q$, $q$["Commercial use","Lifetime fallback license","Priority email support","Premium roadmap influence","Transferable licenses","SSO and user provisioning"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$overview$q$, $q$What is Yaak?$q$, 2, ARRAY[$q$Yaak is a local-first desktop API client for sending HTTP, GraphQL, gRPC, WebSocket, and SSE requests. It's built by Mountain Loop Labs, founded by Greg, the creator of Insomnia (sold in 2019), and launched in January 2024.$q$, $q$The source code is MIT-licensed and can be audited or self-built, but the official prebuilt binaries require a paid commercial license for business use — the app is free only for personal use, with a 30-day trial for commercial evaluation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', $q$who-its-for$q$, $q$Who Yaak is for$q$, 2, ARRAY[$q$Yaak fits developers who want a privacy-respecting, local-first API client for multiple protocols, and teams that prefer storing API collections as plain-text files for Git-based collaboration.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80059e68-8557-45a3-a76c-b2d0817a3a9c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Scalar ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Scalar builds API interfaces: hosted docs, an open-source API client, SDK generation, and an API registry.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$72/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Scalar: hosted API docs, open-source API client, SDK generation, and API registry. Free plan available; Pro starts at $72/month.$q$,
  og_description = $q$Scalar: hosted API docs, open-source API client, SDK generation, and API registry. Free plan available; Pro starts at $72/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '28399fdf-a1aa-4b4e-bf6f-644cc671a0ab' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$API Docs$q$, $q$Write documentation using Markdown, MDX, OpenAPI, and AsyncAPI, with two-way Git synchronization and support for custom HTML/CSS/JS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$AI/MCP chat$q$, $q$API Docs include AI/MCP chat capabilities for interacting with documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$SDK generation$q$, $q$Generates type-safe client libraries from OpenAPI documents in TypeScript, Python, Golang, PHP, Java, and Ruby.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$API Client$q$, $q$An open-source, offline-first, cross-platform (Linux, Windows, macOS) API client built on OpenAPI standards, positioned as a Postman alternative.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$API Registry$q$, $q$Manages and versions OpenAPI documents with Git integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Hosted MCP servers$q$, $q$Pro plan includes hosted MCP servers and automated GitHub workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Custom domains$q$, $q$Pro plan supports custom domains and subdomains for hosted documentation.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Free plan includes hosted OpenAPI docs, a built-in API client, and unlimited viewer seats$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$API Client is open-source and offline-first with no vendor lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$SDK generation covers six languages (TypeScript, Python, Golang, PHP, Java, Ruby)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Two-way Git synchronization for documentation content$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Enterprise plan offers SSO/SAML, RBAC, and SLA-backed priority support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Pro plan is $72/month plus $100/month per additional individual SDK language$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Free plan is limited to 1 editor seat and 50 Agent Scalar credits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Enterprise pricing requires booking a demo rather than public quoting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Is Scalar free?$q$, $q$Yes, Scalar offers a Free plan with hosted OpenAPI docs, a built-in API client, 50 Agent Scalar credits, unlimited viewer seats, and 1 editor seat.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$How much does Scalar Pro cost?$q$, $q$The Pro plan is $72/month and adds custom domains, Git Sync with Markdown/MDX, SDKs, hosted MCP servers, automated GitHub workflows, and more editor seats.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Is the Scalar API Client open source?$q$, $q$Yes, Scalar's API Client is open-source, offline-first, and cross-platform (Linux, Windows, macOS).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$What languages does Scalar generate SDKs for?$q$, $q$Scalar can generate type-safe SDKs in TypeScript, Python, Golang, PHP, Java, and Ruby; each additional individual SDK language costs $100/month on Pro or Enterprise.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Does Scalar have Enterprise features?$q$, $q$Yes, the Enterprise plan (custom pricing) includes full developer portals, SSO/SAML, RBAC, priority SLA support, and SDK/MCP migration services.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Hosted API documentation$q$, $q$Teams publish OpenAPI-based reference docs with Git-synced Markdown/MDX content and custom branding.$q$, $q$API and developer experience teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Self-hosted API testing$q$, $q$Developers use Scalar's open-source, offline-first API Client as a Postman alternative without vendor lock-in.$q$, $q$Individual developers and teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$SDK distribution$q$, $q$Companies generate and maintain type-safe client SDKs across six languages directly from their OpenAPI spec.$q$, $q$API providers and platform teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Free$q$, $q$$0$q$, NULL, $q$["Hosted OpenAPI docs","Built-in API client","50 Agent Scalar credits","Unlimited viewer seats","1 editor seat"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Pro$q$, $q$$72/month$q$, $q$monthly$q$, $q$["Custom domains and subdomains","Git Sync with Markdown/MDX support","SDKs in multiple languages","Hosted MCP servers","Automated GitHub workflows","Additional editor seats","500 Agent Scalar credits","Full developer portal access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$Enterprise$q$, $q$Custom (demo required)$q$, NULL, $q$["Full developer portals","SSO/SAML authentication","Role-based access control (RBAC)","Priority support with SLAs","SDK and MCP migration services","Dedicated Slack/Teams channel"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$overview$q$, $q$What is Scalar?$q$, 2, ARRAY[$q$Scalar is a platform for building API interfaces: hosted documentation (Markdown, MDX, OpenAPI, AsyncAPI with two-way Git sync), an open-source offline-first API Client positioned as a Postman alternative, SDK generation for six languages, and an API Registry for versioning OpenAPI documents.$q$, $q$The company is led by CEO Marc Laventure and describes its core values as Accessibility, Open-Source, and API First.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', $q$who-its-for$q$, $q$Who Scalar is for$q$, 2, ARRAY[$q$Scalar suits API teams that want hosted, Git-synced documentation plus SDK generation, and individual developers who want an open-source, self-hostable API client as an alternative to closed-source tools.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28399fdf-a1aa-4b4e-bf6f-644cc671a0ab', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Stoplight ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Stoplight is a design-first platform for building, documenting, mocking, and governing OpenAPI-based APIs, now operating under SmartBear.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$44/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Stoplight: design-first API platform for OpenAPI editing, mock servers, docs, and governance, now part of SmartBear.$q$,
  og_description = $q$Stoplight: design-first API platform for OpenAPI editing, mock servers, docs, and governance, now part of SmartBear.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '28f84c5e-8df6-4846-8228-5943ba6223e8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '28f84c5e-8df6-4846-8228-5943ba6223e8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Visual API Editor$q$, $q$A visual editor with comprehensive OpenAPI and JSON Schema support lets teams design and prototype APIs without writing complex syntax by hand.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Automatic Mock Servers$q$, $q$Mock servers are generated automatically, stay up-to-date with the API design, and support request and response validation for testing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Interactive Documentation$q$, $q$API documentation is generated automatically alongside design work, with a live preview available directly in the editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Style Guides & Governance$q$, $q$Built-in and custom style guides enforce design consistency, with shared style guides available on Pro and Enterprise plans to promote governance across an API portfolio.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Component Reusability$q$, $q$Schemas and components can be reused across multiple APIs, with centralized updates that propagate to all dependent APIs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Git Sync$q$, $q$Integrates with GitHub, GitLab, Bitbucket, and Azure so teams can work with API design artifacts directly in their existing Git workflow.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$SSO & Activity Logs$q$, $q$The Pro Team plan adds LDAP/SAML SSO, workspace groups, and activity logs for larger organizations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Open Source Tooling$q$, $q$Stoplight maintains three open-source projects: Spectral (linting), Prism (mocking), and Elements (documentation).$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Free perpetual plan available for a single user and project$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$All paid plans include a 14-day free trial$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Visual editor lowers the barrier to working with OpenAPI and JSON Schema$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Built-in and shared style guides support API governance across teams$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Reusable components reduce duplication across an API portfolio$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Open-source tools (Spectral, Prism, Elements) are available alongside the hosted platform$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Paid plans charge per additional user beyond the included seats, which can increase cost for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Enterprise pricing is custom and not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Free plan is limited to 1 user and 1 project$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Now operates as part of SmartBear following its 2023 acquisition, rather than as a fully independent company$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Is there a free plan for Stoplight?$q$, $q$Yes, Stoplight offers a Free plan for $0 that includes 1 user, 1 project, the API editor, visual designer, interactive docs, and instant/local mock servers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Does Stoplight offer a free trial?$q$, $q$Yes, all paid plans (Basic, Startup, Pro Team) include a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Is Stoplight still an active, standalone product?$q$, $q$Yes, Stoplight's website and pricing remain active under the Stoplight brand, though the company now operates as part of SmartBear Software following an acquisition announced in 2023.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$What Git providers does Stoplight integrate with?$q$, $q$Stoplight integrates with GitHub, GitLab, Bitbucket, and Azure for Git-based API design workflows.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Does Stoplight provide open-source tools?$q$, $q$Yes, Stoplight maintains three open-source projects: Spectral for linting, Prism for mocking, and Elements for documentation.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Design-first API development$q$, $q$Developers use the visual editor and mock servers to design, validate, and prototype APIs before writing implementation code.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$API governance across teams$q$, $q$Shared style guides, component reuse, and activity logs help program leaders enforce consistency across a growing API portfolio.$q$, $q$API program leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Enterprise API strategy$q$, $q$Enterprise plans offer unlimited projects and teams, custom payment terms, and priority support for organization-wide API transformation.$q$, $q$Tech executives / enterprise API teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Free$q$, $q$$0$q$, NULL, $q$["1 user","1 project","API editor","OpenAPI/JSON Schema visual designer","Interactive docs","Instant and local mock servers"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Basic$q$, $q$$44/month (annual) or $56/month (monthly)$q$, $q$monthly$q$, $q$["3 users included","Unlimited projects","OpenAPI/JSON Schema visual designer","Interactive documentation","Mock servers","Design validation","Git sync","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Startup$q$, $q$$113/month (annual) or $147/month (monthly)$q$, $q$monthly$q$, $q$["8 users included","Unlimited projects","Private projects","Multi-branch support","Custom domains/theming","Google Analytics integration","14-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Pro Team$q$, $q$$362/month (annual) or $453/month (monthly)$q$, $q$monthly$q$, $q$["15 users included","Up to 20 teams","Shared style guides","Workspace groups","LDAP/SAML SSO","Activity logs","Component libraries","14-day free trial"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited projects and teams","Custom payment terms and invoicing","Priority support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$overview$q$, $q$What is Stoplight?$q$, 2, ARRAY[$q$Stoplight is a design-first OpenAPI platform for creating, documenting, mocking, and managing APIs through a visual editor with comprehensive OpenAPI and JSON Schema support.$q$, $q$The platform includes automatic mock servers, live documentation previews, reusable components, and built-in style guides for design governance, alongside Git sync with GitHub, GitLab, Bitbucket, and Azure.$q$, $q$Stoplight was acquired by SmartBear Software, announced in 2023, and now operates as part of SmartBear's API development portfolio while continuing to operate under the Stoplight brand and pricing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', $q$who-its-for$q$, $q$Who Stoplight is for$q$, 2, ARRAY[$q$Stoplight serves developers who want to design quality APIs visually, program leaders who need to coordinate and track API teams, and tech executives driving organization-wide API strategy.$q$, $q$Its free plan suits individual developers working on a single project, while Basic, Startup, and Pro Team plans scale to growing teams, and Enterprise supports large organizations needing unlimited projects, custom terms, and priority support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('28f84c5e-8df6-4846-8228-5943ba6223e8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── ReadMe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ReadMe is an API documentation platform with a WYSIWYG editor, interactive API reference, and AI-assisted doc writing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Starter plan); Pro plans from $250/month billed annually$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ReadMe is an API documentation platform with a free Starter plan, interactive API reference, Git sync, and AI-assisted doc writing.$q$,
  og_description = $q$ReadMe is an API documentation platform with a free Starter plan, interactive API reference, Git sync, and AI-assisted doc writing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '889a35b0-763a-4ca4-86bc-b657c47e2c33';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '889a35b0-763a-4ca4-86bc-b657c47e2c33' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$WYSIWYG Editor$q$, $q$Edit documentation directly in the browser without needing to write raw markdown or code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Bi-Directional Git Sync$q$, $q$Keeps docs in sync with GitHub, GitHub Enterprise Server, or GitLab repositories in both directions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Interactive API Reference$q$, $q$Auto-generates an interactive, testable API reference from an OpenAPI spec.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Visual API Designer$q$, $q$Build and edit an API definition visually without writing a spec by hand.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$AI Writer$q$, $q$Analyzes pull requests and drafts documentation updates when underlying code changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$AI Linter$q$, $q$Enforces a custom style guide automatically across documentation pages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Branching & Reviews$q$, $q$Branch-based collaboration workflow for proposing and reviewing documentation changes.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$MCP Server$q$, $q$Exposes ReadMe documentation to AI assistants and agents such as Claude and Cursor.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Free Starter plan includes a custom domain, bi-directional Git sync, and an interactive API reference.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$AI Writer drafts documentation updates automatically from pull requests.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Branch-based review workflow lets teams collaborate on docs like code.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Used by companies including NVIDIA, Amazon, and PagerDuty.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Branching, private docs, and most AI features require the paid Pro plan ($250/month billed annually).$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Enterprise plan pricing starts at $3,000+/month for multi-project support and SSO.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Ask AI is a separate $150/month add-on rather than included in the Pro plan.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Does ReadMe have a free plan?$q$, $q$Yes, the Starter plan is free and includes a custom domain, bi-directional Git sync, and an interactive API reference.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$What does the Pro plan cost?$q$, $q$Pro is billed at $250/month on an annual plan and adds branching and reviews, private docs, the AI Linter, and GitHub AI Writer.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Can ReadMe generate documentation from an OpenAPI spec?$q$, $q$Yes, it supports OpenAPI specs with an interactive API explorer, plus a Visual API Designer for building docs without a spec.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Does ReadMe integrate with GitHub and GitLab?$q$, $q$Yes, it offers bi-directional Git sync with GitHub, GitHub Enterprise Server, and GitLab.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Does ReadMe support single sign-on?$q$, $q$SSO through Microsoft Entra ID, Google Workspace, or Okta is available on the Enterprise plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Public API documentation$q$, $q$Publish an interactive, branded API reference generated from an OpenAPI spec.$q$, $q$API-first companies and developer relations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Docs that update with code$q$, $q$Use the AI Writer to draft documentation changes automatically when a pull request changes API behavior.$q$, $q$Engineering and technical writing teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Starter$q$, $q$$0$q$, $q$monthly$q$, $q$["Custom domain","Bi-directional sync","Interactive API reference","Usage metrics","Markdown editor","Customizable themes","AI Dropdown, LLMs.txt, MCP Server"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Pro$q$, $q$$250/month$q$, $q$annual$q$, $q$["All Starter features","Invite teammates","Branching and reviews","Private docs","Landing page","Changelog/recipes/forums","Custom MDX components","Ask AI Lite, AI Linter, GitHub AI Writer"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$Enterprise$q$, $q$$3,000+/month$q$, $q$annual$q$, $q$["All Pro features","Multiple combined projects","No ReadMe branding","User roles & access control","Audit logs","SSO/OAuth","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$overview$q$, $q$What is ReadMe?$q$, 2, ARRAY[$q$ReadMe is a developer-facing documentation platform for publishing API references, guides, and changelogs. It combines a browser-based WYSIWYG editor with bi-directional Git sync, so teams can edit docs visually or keep them in sync with a GitHub or GitLab repository.$q$, $q$The platform builds an interactive API reference from an OpenAPI spec and includes AI features such as an AI Writer that drafts documentation updates from pull requests and an AI Linter that enforces a style guide across pages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', $q$who-its-for$q$, $q$Who ReadMe is for$q$, 2, ARRAY[$q$ReadMe suits API-first companies and developer relations teams that need a public or private API reference, and engineering teams that want documentation changes tracked alongside code through branching and pull-request-driven AI drafts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('889a35b0-763a-4ca4-86bc-b657c47e2c33', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Mintlify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mintlify is a documentation platform with a web editor, AI chat, and an MCP server, used by companies including Anthropic and Coinbase.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Starter plan); Pro and Enterprise plans available$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mintlify offers a free Starter plan plus Pro/Enterprise tiers for building AI-ready, self-updating documentation.$q$,
  og_description = $q$Mintlify offers a free Starter plan plus Pro/Enterprise tiers for building AI-ready, self-updating documentation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f62cd71f-7351-4b7b-9348-da3ff16476e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Web Editor$q$, $q$Build and edit documentation directly in the browser with a custom domain.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$MCP Server$q$, $q$Exposes documentation through the Model Context Protocol so AI agents can read it.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$API Playground$q$, $q$Interactive API testing embedded directly in the documentation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$AI Chat / Assistant$q$, $q$Lets readers ask questions answered from the documentation content (Pro and above).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Agent Score$q$, $q$Assesses how well AI agents can read and use a site's documentation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Automations & Preview Deployments$q$, $q$Automated workflows and preview builds available on the Pro plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$SSO / SCIM / RBAC$q$, $q$Enterprise-grade access controls available on the Enterprise plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Free Starter plan includes full platform access, a custom domain, and an MCP server.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Reports over 20,000 companies as users, including Anthropic, Amazon, AT&T, and Coinbase.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$States 99.99% uptime across all services.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Agent-native features (MCP server, Agent Score) are built specifically for AI-agent-readable docs.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Pro plan pricing is not listed publicly on the site; requires sign-up to see cost.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$AI credits (10,000/month on Starter) incur overage charges of $0.01 per credit beyond the included amount.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Enterprise features such as SSO, SCIM, and RBAC require contacting sales.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Is Mintlify free?$q$, $q$Yes, the Starter plan is free and includes full platform access, a custom domain, and an MCP server.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$What is Mintlify's Agent Score?$q$, $q$It's a feature that assesses whether AI agents can effectively read and use a site's documentation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Does Mintlify support single sign-on?$q$, $q$SSO, SCIM, and RBAC are available on the Enterprise plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$How many AI credits come with the free plan?$q$, $q$The Starter plan includes 10,000 AI credits per month, with overages billed at $0.01 per credit.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Agent-readable API docs$q$, $q$Publish documentation optimized for both human readers and AI agents via the MCP server and Agent Score.$q$, $q$Startups and developer platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Enterprise documentation governance$q$, $q$Manage access control and security for internal and external docs using SSO, SCIM, and RBAC.$q$, $q$Enterprise platform and security teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Starter$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Full platform access","Custom domain","Web editor","Authentication","MCP server","API playground","10,000 AI credits/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Pro$q$, $q$Not publicly listed$q$, NULL, $q$["Everything in Starter","Agent","Assistant","Automations","Preview deployments","Admin APIs"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Pro","SSO/SCIM/RBAC","Performance SLA","Advanced insights","Enterprise security & legal","Migration & support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$overview$q$, $q$What is Mintlify?$q$, 2, ARRAY[$q$Mintlify is a documentation platform built around a browser-based web editor, an MCP server, and an API playground. It positions itself as an 'agent-native' platform, adding features such as AI chat over the documentation and an Agent Score that measures how well AI agents can read a site's docs.$q$, $q$The Starter plan is free and includes full platform access, a custom domain, and 10,000 AI credits per month. Paid Pro and Enterprise plans add automations, admin APIs, and enterprise access controls such as SSO, SCIM, and RBAC.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', $q$who-its-for$q$, $q$Who Mintlify is for$q$, 2, ARRAY[$q$Mintlify fits startups and developer platform teams that want a free, hosted documentation site with AI chat, and enterprises that need SSO, SCIM, and RBAC for internal and external documentation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f62cd71f-7351-4b7b-9348-da3ff16476e0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Fern ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fern generates API documentation, SDKs, and CLIs from OpenAPI, GraphQL, AsyncAPI, and gRPC specs, and operates as a Postman company.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (Hobby plan); Team plan from $150/month ($112.50/month billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fern turns API specs into documentation, SDKs, and CLIs, with a free Hobby plan and paid Team/Enterprise tiers.$q$,
  og_description = $q$Fern turns API specs into documentation, SDKs, and CLIs, with a free Hobby plan and paid Team/Enterprise tiers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b5894d70-a0dc-4dd7-8b8a-620802d83100' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Docs as Code$q$, $q$Manage documentation alongside source code using git-based workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$SDK Generation$q$, $q$Generates client libraries from OpenAPI, GraphQL, AsyncAPI, and gRPC specifications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Built-in AI Chat$q$, $q$Lets documentation readers ask questions answered from the docs content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$MCP Server$q$, $q$Exposes documentation and APIs through the Model Context Protocol.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$llms.txt Generation$q$, $q$Auto-generates machine-readable markdown so LLMs and agents can consume the docs.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Multi-Source Aggregation$q$, $q$Combines documentation content from multiple repositories into one site.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Self-Hosting Option$q$, $q$Deploy documentation on Fern's cloud or self-host it.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Postman Integration$q$, $q$Natively generates and publishes Postman collections.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Free Hobby plan includes guides, an API reference, changelogs, an API explorer, and 250 AI credits per month.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$SOC 2 Type II certified with annual penetration tests.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Customers include ElevenLabs, Auth0, NVIDIA, and Deepgram.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Now backed by Postman, extending access to Postman's collection tooling.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Team plan pricing ($150/month) is per team and caps at 5 members before requiring Enterprise.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Enterprise features like SSO and self-hosting require a custom, sales-negotiated plan.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Fern was acquired by Postman, which could affect long-term product direction.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Is Fern free to use?$q$, $q$Yes, the Hobby plan is free forever and includes 2 team members and 250 AI credits per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$What does the Team plan cost?$q$, $q$$150/month billed monthly, or $112.50/month billed annually, for up to 5 team members and 1,000 AI credits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Is Fern part of Postman?$q$, $q$Yes, Fern's website states it is 'a Postman company' following an acquisition.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Can Fern generate SDKs?$q$, $q$Yes, it generates client libraries from OpenAPI, GraphQL, AsyncAPI, and gRPC specs.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Multi-language SDK generation$q$, $q$Generate client SDKs across languages directly from an existing API spec.$q$, $q$API platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Free hosted API docs$q$, $q$Publish a documentation site with guides, an API reference, and a changelog at no cost on the Hobby plan.$q$, $q$Startups and individual developers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Hobby$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Free forever","2 team members","250 AI credits","Custom domain","Password-protected docs","Guides, API refs, changelogs, API explorer, web editor"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Team$q$, $q$$150/month ($112.50/month billed annually)$q$, $q$monthly$q$, $q$["All Hobby features","5 team members","1,000 AI credits","Custom subpath","Version/product switching","PDF exports","14-day trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["All Team features","Visitor authentication (JWT, SSO)","Role-based access control","Translated content","Self-hosting","Dedicated support channel"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$overview$q$, $q$What is Fern?$q$, 2, ARRAY[$q$Fern generates API documentation, SDKs, and CLIs from specifications written in OpenAPI, GraphQL, AsyncAPI, or gRPC. It manages docs as code with git-based workflows and includes a built-in AI chat so readers can ask questions answered from the documentation itself.$q$, $q$Fern is now described on its site as 'a Postman company' following an acquisition, and it natively supports generating and publishing Postman collections.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', $q$who-its-for$q$, $q$Who Fern is for$q$, 2, ARRAY[$q$Fern fits API platform teams that want auto-generated, multi-language SDKs from a spec, and startups or individual developers who want a free hosted documentation site with guides, an API reference, and a changelog.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b5894d70-a0dc-4dd7-8b8a-620802d83100', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Speakeasy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Speakeasy generates SDKs and CLIs from OpenAPI specs, and offers a separate AI control plane for governing AI agent access to company systems.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (SDK & MCP generation, 250 operations/language); Business plan from $720/month ($600/month billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Speakeasy generates SDKs and MCP servers from OpenAPI specs, with a free tier, paid Business/Enterprise plans, and an AI control plane product.$q$,
  og_description = $q$Speakeasy generates SDKs and MCP servers from OpenAPI specs, with a free tier, paid Business/Enterprise plans, and an AI control plane product.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a18645e2-a581-4fd2-afca-e3a533873c8b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a18645e2-a581-4fd2-afca-e3a533873c8b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$SDK & MCP Generation$q$, $q$Generates client SDKs and Model Context Protocol servers from OpenAPI specs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Auto-Publish$q$, $q$Publishes generated SDKs automatically to a package manager.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$OAuth & Webhooks$q$, $q$Adds OAuth support, webhooks, and SSE to generated SDKs (Business plan).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$AI Control Plane$q$, $q$A control layer for connecting AI agents to SaaS tools, APIs, and internal systems with policy enforcement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Real-Time Inspection$q$, $q$Blocks PII, secrets, and prompt-injection attempts in AI agent traffic.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Pre-Built Integrations$q$, $q$Includes Salesforce, Slack, HubSpot, and identity providers such as Okta and Entra ID.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Usage Observability$q$, $q$Tracks AI agent usage by team, tool, and user with a full audit trail.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Free tier for SDK/MCP generation includes 250 operations per language and community Slack support.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Customers retain ownership of generated code even after cancelling a plan.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$SOC 2 Type II and ISO 27001 certified.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Supports MCP-based agents including Claude, ChatGPT, Cursor, and GitHub Copilot.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Business plan is priced per licensed programming language, which adds up for multi-language SDK support.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$The AI Control Plane product is Enterprise-only with 'tailored' pricing that is not public.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Founding year, headquarters, and company size are not published on the site.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Does Speakeasy have a free plan?$q$, $q$Yes, the SDK & CLI free tier includes SDK/MCP generation with 250 operations per language.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$What does the Business plan cost?$q$, $q$$720/month per licensed language, or $600/month billed annually, with a free trial available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$What happens to generated SDK code if I cancel?$q$, $q$Speakeasy states customers own 100% of the code already generated, though new code can no longer be generated without an active plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Does Speakeasy support MCP-based AI agents?$q$, $q$Yes, it supports Claude, ChatGPT, Cursor, GitHub Copilot, and other MCP-compatible agents.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Multi-language SDK generation$q$, $q$Generate type-safe client SDKs and CLIs directly from an OpenAPI spec.$q$, $q$API platform engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$AI agent access governance$q$, $q$Control and audit which internal systems and SaaS tools AI agents can reach.$q$, $q$Enterprise security and IT teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["SDK & MCP generation","Auto-publish to package manager","OpenAPI toolchain access","250 operations per language","Community Slack support","Single language license"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Business$q$, $q$$720/month ($600/month billed annually)$q$, $q$monthly$q$, $q$["Per licensed programming language","OAuth support","Webhooks and SSE","Docsite integration","250 operations per language","Free trial available"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Enterprise (SDKs & CLIs)$q$, $q$Custom$q$, NULL, $q$["Dedicated Slack support","Concierge onboarding and migration","Service/support SLAs","SSO and audit logs"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$Enterprise (AI Control Plane)$q$, $q$Custom / tailored$q$, NULL, $q$["SaaS catalog integrations","Custom server creation","Code mode efficiency","Serverless hosting"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$overview$q$, $q$What is Speakeasy?$q$, 2, ARRAY[$q$Speakeasy started as an SDK and CLI generation tool: it turns an OpenAPI spec into type-safe client SDKs and MCP servers, with a free tier for a single language and paid Business/Enterprise plans for teams needing OAuth support, webhooks, and dedicated support.$q$, $q$The company has since added a second product, an AI Control Plane, which acts as a control layer for connecting AI agents such as Claude, ChatGPT, and Cursor to a company's SaaS tools, APIs, and internal systems, with policy enforcement, real-time inspection for PII/secrets, and usage observability.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', $q$who-its-for$q$, $q$Who Speakeasy is for$q$, 2, ARRAY[$q$API platform engineers use Speakeasy to auto-generate SDKs and MCP servers from their OpenAPI spec, while enterprise security and IT teams use the AI Control Plane to govern and audit which internal systems AI agents can access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a18645e2-a581-4fd2-afca-e3a533873c8b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Bump.sh ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Bump.sh publishes API documentation portals and deploys MCP servers from OpenAPI and AsyncAPI specs, with automatic breaking-change detection.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$50/month (Basic plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bump.sh turns OpenAPI and AsyncAPI specs into hosted documentation and MCP servers, with plans starting at $50/month.$q$,
  og_description = $q$Bump.sh turns OpenAPI and AsyncAPI specs into hosted documentation and MCP servers, with plans starting at $50/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a078e17b-44db-40a3-bdc1-7247b3634fc8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$API Documentation Portals$q$, $q$Generates branded, searchable documentation from OpenAPI, AsyncAPI, and Arazzo specs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Diff & Preview on PRs$q$, $q$Shows API spec differences and a live preview on every pull request.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$MCP Servers$q$, $q$Deploys managed or on-premise MCP servers directly from API specs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Breaking Change Detection$q$, $q$Automatically flags breaking changes before deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Automatic Changelog$q$, $q$Generates a changelog on every release (Pro plan and above).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Usage Analytics$q$, $q$Shows logs, debug sessions, and reports on how developers and agents use the API.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$CLI & GitHub Integration$q$, $q$Integrates with git-based CI/CD workflows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Automatically detects breaking changes and generates changelogs on release.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Deploys managed MCP servers directly from OpenAPI/AsyncAPI specs.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Pro plan includes a 14-day free trial.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Open-source projects can request free access to the Pro plan.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$No permanent free plan; the Basic plan starts at $50/month.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Basic plan caps usage at 10 API docs, 5 MCP tools, and 20 external users.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$On-premise deployment and SSO require the Custom plan with contact-sales pricing.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Does Bump.sh have a free plan?$q$, $q$No, but the Pro plan includes a 14-day free trial, and open-source projects can request free access.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$What does the Basic plan include?$q$, $q$$50/month for up to 10 API docs, 5 MCP tools, 3 internal users, and 20 external users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Can Bump.sh detect breaking API changes?$q$, $q$Yes, it automatically flags breaking changes and shows diffs and previews on pull requests.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Can Bump.sh generate MCP servers?$q$, $q$Yes, it deploys managed or on-premise MCP servers from OpenAPI, AsyncAPI, and Arazzo specs.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Branded API documentation portals$q$, $q$Publish searchable, branded API docs with CI-based deployment from a git repository.$q$, $q$Platform and API teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Hosted MCP servers from existing specs$q$, $q$Generate managed MCP servers directly from OpenAPI/AsyncAPI specs to support AI agent integrations.$q$, $q$Teams building AI-agent integrations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Basic$q$, $q$$50/month$q$, $q$monthly$q$, $q$["10 API docs","5 MCP tools","3 internal users","20 external users","OpenAPI/AsyncAPI/Arazzo support","CLI & GitHub integration","Custom domain and logo"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Pro$q$, $q$$250/month$q$, $q$monthly$q$, $q$["30 API docs","50 MCP tools","5 internal users","40 external users","Branches management","API Explorer","Private MCP servers","Full CI integration","Release rollback","Automatic changelog","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$Custom$q$, $q$Contact sales$q$, NULL, $q$["Unlimited internal/external users","SSO","Reverse proxy & embed mode","On-premise MCP dataplane","Custom reports and analytics","99.99% SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$overview$q$, $q$What is Bump.sh?$q$, 2, ARRAY[$q$Bump.sh publishes hosted API documentation portals from OpenAPI and AsyncAPI specifications, showing a diff and preview on every pull request and flagging breaking changes automatically before deployment.$q$, $q$The platform also deploys MCP (Model Context Protocol) servers generated from the same specs, plus usage analytics showing how developers and AI agents interact with the API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', $q$who-its-for$q$, $q$Who Bump.sh is for$q$, 2, ARRAY[$q$Bump.sh fits platform and API teams that want CI-driven, branded documentation portals, and teams that want a managed MCP server generated directly from their existing OpenAPI or AsyncAPI spec.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a078e17b-44db-40a3-bdc1-7247b3634fc8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Redocly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Redocly is an API documentation platform (Realm) built around the open-source Redoc renderer, with plans starting at $10 per seat/month.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$10/seat/month (Pro plan)$q$,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$Austin, Texas, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Redocly's Realm platform builds API docs from OpenAPI and AsyncAPI specs, starting at $10/seat/month with a 30-day free trial.$q$,
  og_description = $q$Redocly's Realm platform builds API docs from OpenAPI and AsyncAPI specs, starting at $10/seat/month with a 30-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '01c9cb83-d21b-4761-b79e-7d589ccbad23';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '01c9cb83-d21b-4761-b79e-7d589ccbad23' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Reunite$q$, $q$Collaborative tool for API design review with side-by-side visual diffs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Redoc$q$, $q$Open-source API reference generator supporting OpenAPI, GraphQL, AsyncAPI, and SOAP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Revel$q$, $q$Developer hub for API onboarding and analytics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Reef$q$, $q$Internal API catalog and governance tool.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Mock Servers$q$, $q$Generates mock servers directly from API definitions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Remote Content$q$, $q$Single-sources content for reuse across multiple documentation sets.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$AI Search$q$, $q$Available on the Enterprise plan for searching across documentation.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$MCP Servers$q$, $q$Available on the Enterprise plan for exposing docs to AI agents.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Redoc, the underlying open-source renderer, has over 1M weekly npm downloads and is free to use standalone.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Realm platform reports over 212,000 companies as users and 1B+ APIs linted.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$30-day free trial on both Pro and Enterprise plans.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Modular add-ons (Revel, Reef) let teams pay only for the products they need.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$No permanent free tier for the hosted Realm platform; Pro starts at $10/seat/month.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Enterprise features (SSO, RBAC, AI search, MCP servers) require the $24/seat/month Enterprise plan.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Add-on products (Revel, Reef) cost extra per seat on top of the base plan.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Is Redoc free?$q$, $q$The open-source Redoc renderer is free to use standalone; the hosted Realm platform (Pro/Enterprise) is a paid product with a 30-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$What does the Pro plan cost?$q$, $q$$10 per seat/month, billed monthly, including 1 project and 100 pages.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$What's included in Enterprise?$q$, $q$$24 per seat/month, adding SSO, RBAC, AI search, and MCP servers on top of Pro features.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Where is Redocly headquartered?$q$, $q$Austin, Texas.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Free OpenAPI reference rendering$q$, $q$Embed the open-source Redoc renderer to display an interactive API reference at no cost.$q$, $q$Individual developers and small projects$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$API documentation governance$q$, $q$Manage collaborative review, an internal API catalog, and governance across many APIs.$q$, $q$Platform and API governance teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Pro$q$, $q$$10/seat/month$q$, $q$monthly$q$, $q$["Reunite with custom domain hosting","1 project","100 pages","Redoc (OpenAPI/GraphQL/AsyncAPI/SOAP)","Mock servers","Linting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Enterprise$q$, $q$$24/seat/month$q$, $q$monthly$q$, $q$["Everything in Pro","500 pages","SSO","Guest SSO","RBAC","Remote content","AI search","MCP Servers"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$Enterprise+$q$, $q$Custom$q$, $q$annual$q$, $q$["Everything in Enterprise","Data residency options","Procurement/security questionnaire support","Single-tenant hosting","Premium support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$overview$q$, $q$What is Redocly?$q$, 2, ARRAY[$q$Redocly is an API documentation platform, called Realm, built around the open-source Redoc renderer. Redoc itself is free and widely used (over 1M weekly npm downloads) to render interactive API references from OpenAPI, GraphQL, AsyncAPI, or SOAP definitions.$q$, $q$The commercial Realm platform adds collaborative review (Reunite), a developer hub (Revel), an internal API catalog (Reef), mock servers, and enterprise features such as SSO, RBAC, and AI search. Plans start at $10/seat/month with a 30-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', $q$who-its-for$q$, $q$Who Redocly is for$q$, 2, ARRAY[$q$Individual developers can use the free, open-source Redoc renderer directly. Platform and API governance teams managing many APIs across an organization are the primary audience for the paid Realm platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('01c9cb83-d21b-4761-b79e-7d589ccbad23', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Docusaurus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Docusaurus is a free, open-source static site generator for building documentation sites with Markdown/MDX and React, maintained by Meta.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Portuguese$q$, $q$Korean$q$, $q$Chinese$q$]::text[],
  seo_meta_description = $q$Docusaurus is Meta's free, open-source static site generator for building documentation sites with Markdown, MDX, and React.$q$,
  og_description = $q$Docusaurus is Meta's free, open-source static site generator for building documentation sites with Markdown, MDX, and React.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7736f4e7-14df-4b55-a27c-530d35d06fd1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7736f4e7-14df-4b55-a27c-530d35d06fd1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$MDX Support$q$, $q$Write docs and blog posts in MDX, which Docusaurus compiles into static HTML.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$React Customization$q$, $q$Extend and customize a site's layout by writing React components.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Built-in Localization$q$, $q$Out-of-the-box internationalization using git, Crowdin, or any translation manager.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Document Versioning$q$, $q$Supports maintaining documentation for multiple versions of a project at once.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Algolia Search Integration$q$, $q$Official built-in support for Algolia documentation search.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Built-in Blog$q$, $q$Includes a blogging feature alongside standard documentation pages.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Completely free and open source, maintained by Meta Open Source.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Built-in versioning lets projects support docs for multiple releases at once.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Out-of-the-box localization workflow via git or Crowdin.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Official Algolia search integration.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Deeper customization requires familiarity with React and MDX.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Self-hosted — teams must handle their own build and deployment.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$No built-in AI features.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Is Docusaurus free?$q$, $q$Yes, it's a free, open-source project maintained by Meta.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Does Docusaurus support multiple languages?$q$, $q$Yes, it has built-in localization support using git, Crowdin, or other translation managers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Can I version my documentation with Docusaurus?$q$, $q$Yes, it supports maintaining documentation for multiple versions of a project simultaneously.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Does Docusaurus support search?$q$, $q$Yes, it officially supports Algolia documentation search.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Versioned open-source docs$q$, $q$Publish documentation that tracks multiple released versions of a project.$q$, $q$Open-source project maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$Customizable docs sites$q$, $q$Build a documentation site with custom React components and layouts.$q$, $q$Developer teams and technical writers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$overview$q$, $q$What is Docusaurus?$q$, 2, ARRAY[$q$Docusaurus is a free, open-source static site generator maintained under Meta Open Source. It converts Markdown and MDX content into static HTML websites and lets teams customize layouts with React components.$q$, $q$Built-in features include document versioning for supporting multiple releases at once, out-of-the-box localization via git or Crowdin, and official Algolia search integration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', $q$who-its-for$q$, $q$Who Docusaurus is for$q$, 2, ARRAY[$q$Docusaurus suits open-source projects that need versioned, searchable documentation, and developer teams or technical writers who want a customizable, React-based documentation site.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7736f4e7-14df-4b55-a27c-530d35d06fd1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MkDocs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MkDocs is a free, open-source static site generator that builds project documentation from Markdown files and a single YAML config file.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MkDocs is a free, open-source static site generator for project documentation, created in 2014 and configured via one YAML file.$q$,
  og_description = $q$MkDocs is a free, open-source static site generator for project documentation, created in 2014 and configured via one YAML file.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1bde5f50-16ca-4a06-bfe7-446daf35604f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1bde5f50-16ca-4a06-bfe7-446daf35604f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Markdown-Based Authoring$q$, $q$Write documentation content entirely in Markdown.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Single YAML Config$q$, $q$Configure navigation, theme, and plugins through one mkdocs.yml file.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Live Preview$q$, $q$Preview the site while working, with auto-reload on save.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Host Anywhere$q$, $q$Builds static HTML deployable to GitHub Pages, Amazon S3, or any static host.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Built-in Themes$q$, $q$Ships with 'mkdocs' and 'readthedocs' themes, plus support for third-party themes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Plugin & Extension Support$q$, $q$Extensible via Markdown extensions and plugins.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Completely free and open source.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Simple, single-file YAML configuration is easy to learn.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Deployable to any static host, including GitHub Pages and Amazon S3.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Supports custom and third-party themes.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Built-in theming is more limited than some design-focused generators.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$No built-in AI or hosted search features.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Requires Python tooling to build and serve the site.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Is MkDocs free?$q$, $q$Yes, it's free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$When was MkDocs created?$q$, $q$It was originally created by Tom Christie in 2014.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Where can I host a MkDocs site?$q$, $q$Anywhere that serves static HTML, including GitHub Pages and Amazon S3.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Does MkDocs support themes?$q$, $q$Yes, it ships with built-in 'mkdocs' and 'readthedocs' themes and supports custom or third-party themes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Python project documentation$q$, $q$Document a Python library or tool using Markdown and a single config file.$q$, $q$Open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$Lightweight docs sites$q$, $q$Build a config-file-driven documentation site without a heavier framework.$q$, $q$Developer teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$overview$q$, $q$What is MkDocs?$q$, 2, ARRAY[$q$MkDocs is a free, open-source static site generator, originally created by Tom Christie in 2014, geared toward building project documentation. Content is written in Markdown and the site is configured through a single mkdocs.yml file.$q$, $q$It builds static HTML that can be hosted anywhere, including GitHub Pages or Amazon S3, and ships with built-in 'mkdocs' and 'readthedocs' themes alongside support for custom and third-party themes and plugins.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', $q$who-its-for$q$, $q$Who MkDocs is for$q$, 2, ARRAY[$q$MkDocs fits open-source maintainers and developer teams who want a lightweight, Markdown-based documentation site driven by a single configuration file rather than a heavier framework.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1bde5f50-16ca-4a06-bfe7-446daf35604f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── VitePress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$VitePress is a free, open-source static site generator built on Vite and Vue for creating documentation sites from Markdown.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Chinese$q$, $q$Portuguese$q$, $q$Russian$q$, $q$Spanish$q$, $q$Korean$q$, $q$Persian$q$, $q$Japanese$q$]::text[],
  seo_meta_description = $q$VitePress is a free, MIT-licensed static site generator built on Vite and Vue for Markdown-based documentation sites.$q$,
  og_description = $q$VitePress is a free, MIT-licensed static site generator built on Vite and Vue for Markdown-based documentation sites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3fb0f468-f238-4fb1-a656-36ced87d1401';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3fb0f468-f238-4fb1-a656-36ced87d1401' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Markdown-Focused Authoring$q$, $q$Write content in Markdown with Vue components embedded directly.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Vite-Powered Dev Server$q$, $q$Instant server start and fast hot-module updates during development.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Custom Vue Themes$q$, $q$Build fully custom site themes using Vue components.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Static HTML Output$q$, $q$Pre-renders static HTML for fast initial load, then uses client-side routing after load.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Built-in Internationalization$q$, $q$Supports documentation and site content in multiple languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$llms.txt Support$q$, $q$Provides /llms.txt and /llms-full.txt endpoints for LLM-optimized documentation access.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Free and open source under the MIT License.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Built on Vite, giving a fast dev server start and hot updates.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Maintained under the official Vue.js GitHub organization.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Provides llms.txt/llms-full.txt for LLM- and agent-friendly documentation access.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Best suited for teams already using Vue; less of a native fit for non-Vue stacks.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$No built-in AI features beyond the llms.txt export.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Requires Node.js/Vite tooling knowledge to customize themes.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Is VitePress free?$q$, $q$Yes, it's free and open source under the MIT License.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$What is VitePress built on?$q$, $q$Vite and Vue.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Does VitePress support internationalization?$q$, $q$Yes, its documentation is available in English, Chinese, Portuguese, Russian, Spanish, Korean, Persian, and Japanese.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Does VitePress work with AI tools or LLMs?$q$, $q$It provides /llms.txt and /llms-full.txt endpoints for LLM-optimized access to its documentation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Vue ecosystem documentation$q$, $q$Build fast, Vue-native documentation sites for libraries and projects.$q$, $q$Vue and JavaScript developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Markdown-first docs with custom theming$q$, $q$Create a lightweight documentation site with custom Vue-based themes.$q$, $q$Open-source maintainers and developer teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$overview$q$, $q$What is VitePress?$q$, 2, ARRAY[$q$VitePress is a free, open-source static site generator built on Vite and Vue, released under the MIT License and maintained under the official Vue.js GitHub organization. It turns Markdown content into documentation sites, with Vue components usable directly inside the Markdown.$q$, $q$It benefits from Vite's fast dev server and hot-module updates, pre-renders static HTML for fast initial loads, and supports custom themes built with Vue. It also exposes /llms.txt and /llms-full.txt for LLM-optimized documentation access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$who-its-for$q$, $q$Who VitePress is for$q$, 2, ARRAY[$q$VitePress fits Vue and JavaScript developers documenting libraries or projects in the Vue ecosystem, and open-source maintainers who want a lightweight, Markdown-first docs generator with custom theming.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Nextra ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nextra is a free, open-source static site generator that combines Next.js with MDX for building documentation and content sites.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Nextra: an open-source Next.js and MDX framework for building fast, searchable documentation and content websites.$q$,
  og_description = $q$Nextra: an open-source Next.js and MDX framework for building fast, searchable documentation and content websites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '81e4c7de-ab42-4127-ae48-4dd99e1894fb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$MDX-Powered Content$q$, $q$Combines Markdown with MDX 3, letting authors embed React components directly in pages.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Built-in Full-Text Search$q$, $q$Indexes content automatically at build time and provides fast full-text search powered by Pagefind.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Shiki Syntax Highlighting$q$, $q$Build-time syntax highlighting for code blocks powered by the Shiki highlighter.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Internationalization (i18n)$q$, $q$Organize pages into locale-specific folders and Nextra handles the routing for multiple languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Automatic Next.js Optimization$q$, $q$Converts Markdown links and images to Next.js Link and Image components automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$File-System Routing$q$, $q$Pages are generated from the file structure, with support for Server/Client Components and ISR.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Built directly on Next.js, inheriting React's ecosystem and features like ISR$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Fast, offline-capable full-text search built in via Pagefind$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Native internationalization support for multi-language docs sites$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Build-time syntax highlighting via Shiki with no extra configuration$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Requires familiarity with Next.js and React to customize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$No official hosting or enterprise support plan — deployment must be handled separately$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Documentation must be built and maintained by the developer rather than through a hosted dashboard$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Is Nextra free to use?$q$, $q$Yes, Nextra is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$What content format does Nextra use?$q$, $q$Nextra uses MDX 3, which combines Markdown with React components.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Does Nextra support multiple languages?$q$, $q$Yes, Nextra supports internationalization by organizing pages into locale-specific folders.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Does Nextra include search?$q$, $q$Yes, Nextra automatically indexes content at build time and provides full-text search powered by Pagefind.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$What framework is Nextra built on?$q$, $q$Nextra is built on Next.js.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Technical documentation sites$q$, $q$Teams write docs in MDX and get syntax highlighting, search, and i18n without custom tooling.$q$, $q$Developer tools and open-source projects$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Content-driven marketing or blog sites$q$, $q$Combine Markdown content with React components for blogs or marketing pages built on Next.js.$q$, $q$Development teams already using Next.js$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$Open Source$q$, $q$Free$q$, NULL, $q$["MDX 3 support","Built-in full-text search (Pagefind)","Internationalization","Shiki syntax highlighting"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$overview$q$, $q$What is Nextra?$q$, 2, ARRAY[$q$Nextra is an open-source site generation framework built on top of Next.js and MDX. It lets developers write pages in Markdown/MDX while getting the routing, rendering, and performance features of Next.js, including Server/Client Components and Incremental Static Regeneration.$q$, $q$It ships with build-time syntax highlighting via Shiki, automatic full-text search powered by Pagefind, dark mode, and built-in internationalization through locale-specific folders.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('81e4c7de-ab42-4127-ae48-4dd99e1894fb', $q$who-its-for$q$, $q$Who Nextra is for$q$, 2, ARRAY[$q$Nextra suits developers and teams already working in the Next.js/React ecosystem who want to build documentation, blogs, or content sites without adopting a separate, unrelated static site generator.$q$]::text[], 1);


-- ── Starlight ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Starlight is a free, open-source documentation site framework built on Astro with built-in search, i18n, and SEO.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$Spanish$q$, $q$Japanese$q$, $q$French$q$, $q$Italian$q$, $q$Indonesian$q$, $q$Chinese (Simplified)$q$, $q$Portuguese (Brazil)$q$, $q$Portuguese$q$, $q$Korean$q$, $q$Turkish$q$, $q$Russian$q$, $q$Hindi$q$, $q$Danish$q$, $q$Ukrainian$q$, $q$Persian$q$]::text[],
  seo_meta_description = $q$Starlight: an open-source Astro framework for building fast, accessible documentation websites with i18n and search.$q$,
  og_description = $q$Starlight: an open-source Astro framework for building fast, accessible documentation websites with i18n and search.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ffe3fec8-5847-4750-b01a-593c7901730d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ffe3fec8-5847-4750-b01a-593c7901730d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Built-in Site Search$q$, $q$Ships with full-text search out of the box, no extra configuration required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Internationalization (i18n)$q$, $q$Native support for building multi-language documentation sites.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Markdown, MDX, and Markdoc Support$q$, $q$Write content in Markdown, MDX, or Markdoc markup formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Type-Safe Frontmatter$q$, $q$Built-in frontmatter schema validation backed by TypeScript.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Framework-Agnostic Components$q$, $q$Extend the UI with components from React, Vue, Svelte, Solid, and other frameworks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$SEO Defaults$q$, $q$Includes sensible default SEO settings for documentation sites.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Built on Astro, so pages ship with minimal client-side JavaScript$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Supports Markdown, MDX, and Markdoc out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Native i18n and search without extra plugins$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Can be extended with UI components from multiple frontend frameworks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Requires working knowledge of Astro to customize deeply$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$No official hosted or managed offering — must be deployed like any other Astro site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Newer project relative to longer-established documentation tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Is Starlight free?$q$, $q$Yes, Starlight is open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$What framework does Starlight run on?$q$, $q$Starlight is built on top of Astro.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$What content formats does Starlight support?$q$, $q$Markdown, MDX, and Markdoc.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Does Starlight support multiple languages?$q$, $q$Yes, it has built-in internationalization support.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Can I use React or Vue components in Starlight?$q$, $q$Yes, Starlight supports UI components from frameworks like React, Vue, Svelte, and Solid.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Open-source project documentation$q$, $q$Teams write and host documentation sites with search and i18n built in.$q$, $q$Open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Product and developer documentation$q$, $q$Companies build developer-facing docs sites within an existing Astro project.$q$, $q$Developer tools companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Full-text search","Internationalization","Markdown/MDX/Markdoc support","Type-safe frontmatter"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$overview$q$, $q$What is Starlight?$q$, 2, ARRAY[$q$Starlight is an open-source documentation framework built on the Astro web framework. It provides navigation, search, internationalization, and SEO defaults so teams can focus on writing content instead of building documentation infrastructure from scratch.$q$, $q$Content can be authored in Markdown, MDX, or Markdoc, and the interface can be extended with components from React, Vue, Svelte, Solid, and other UI frameworks supported by Astro.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffe3fec8-5847-4750-b01a-593c7901730d', $q$who-its-for$q$, $q$Who Starlight is for$q$, 2, ARRAY[$q$Starlight is aimed at teams and open-source projects that already use, or are willing to use, Astro and want a fast, low-friction documentation site with search and multi-language support built in.$q$]::text[], 1);


-- ── Sphinx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sphinx is a free, open-source documentation generator that turns reStructuredText or MyST Markdown into HTML, PDF, and other formats.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2007,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Sphinx: open-source documentation generator behind the Python docs, with automatic API docs and multi-format output.$q$,
  og_description = $q$Sphinx: open-source documentation generator behind the Python docs, with automatic API docs and multi-format output.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a5b8e104-a176-4bca-a581-3d1e42859374';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a5b8e104-a176-4bca-a581-3d1e42859374' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Automatic API Documentation$q$, $q$Generates API references directly from Python (and other language) docstrings and source code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$reStructuredText & MyST Markdown$q$, $q$Write content in reStructuredText or MyST-flavored Markdown.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Cross-Referencing$q$, $q$Powerful cross-referencing across pages and between separate projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Multiple Output Formats$q$, $q$Builds HTML, LaTeX/PDF, ePub, Texinfo, and more from a single source.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Extensible Architecture$q$, $q$Supports numerous built-in and third-party extensions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Theming$q$, $q$Built-in and third-party themes for customizing generated documentation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Powers documentation for major projects including Python, the Linux kernel, and Project Jupyter$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Single source can build to many output formats, including HTML and PDF$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Mature, extensive extension ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Strong automatic API documentation support for Python$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$reStructuredText has a steeper learning curve than plain Markdown$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Configuration and theming can require more setup than newer documentation tools$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$No official hosted or managed service — self-hosting or a static host is required$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Is Sphinx free?$q$, $q$Yes, Sphinx is open-source software.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$What markup languages does Sphinx support?$q$, $q$reStructuredText and MyST Markdown.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$What output formats can Sphinx generate?$q$, $q$HTML, LaTeX (for PDF), ePub, Texinfo, and more via builders.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$What is Sphinx best known for?$q$, $q$It is the tool used to build Python's official documentation.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Does Sphinx support languages besides Python for API docs?$q$, $q$Yes, its automatic documentation features extend to C++ and other languages via extensions.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Python and software API documentation$q$, $q$Generate reference documentation directly from source code docstrings.$q$, $q$Library and framework maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Large open-source project documentation$q$, $q$Build multi-format documentation, such as HTML and PDF, from a single source.$q$, $q$Open-source projects and technical writing teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Automatic API documentation","Multiple output formats","Cross-referencing","Extension ecosystem"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$overview$q$, $q$What is Sphinx?$q$, 2, ARRAY[$q$Sphinx is an open-source documentation generator that converts source files written in reStructuredText or MyST Markdown into HTML, LaTeX/PDF, ePub, Texinfo, and other output formats from a single source.$q$, $q$It is best known as the tool behind Python's official documentation and is also used by projects such as the Linux kernel and Project Jupyter, with strong support for automatically generating API references from source code.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a5b8e104-a176-4bca-a581-3d1e42859374', $q$who-its-for$q$, $q$Who Sphinx is for$q$, 2, ARRAY[$q$Sphinx suits software developers and technical writers who need structured, cross-referenced, multi-format documentation — particularly Python projects that want API references generated directly from docstrings.$q$]::text[], 1);


-- ── Material for MkDocs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Material for MkDocs is a free, open-source Material Design theme for MkDocs with built-in search and 60+ language translations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Material for MkDocs: an open-source, MIT-licensed theme that turns Markdown into a fast, searchable documentation site.$q$,
  og_description = $q$Material for MkDocs: an open-source, MIT-licensed theme that turns Markdown into a fast, searchable documentation site.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e0491910-91ba-45bf-9e66-510a9761281d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e0491910-91ba-45bf-9e66-510a9761281d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Instant Search$q$, $q$Search runs entirely in the browser, works offline, and returns results instantly.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$10,000+ Icons & Emojis$q$, $q$Built-in icon and emoji library usable directly from Markdown.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Code Annotations$q$, $q$Add rich callouts, diagrams, and images inline within code blocks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Social Cards$q$, $q$Automatically generates social-share preview images for each page.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Responsive Material Design$q$, $q$Adapts automatically across desktop, tablet, and mobile devices.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$60+ Language Translations$q$, $q$The theme's interface is available in more than 60 languages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Insiders Program$q$, $q$Sponsors get early access to new features before public release.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Free, open source, and MIT licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Cited on the site as used by more than 50,000 individuals and organizations$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Extremely fast, offline-capable client-side search$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Highly customizable colors, fonts, and icons without HTML/CSS/JS knowledge$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Actively maintained since 2016$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Some new features are gated behind the paid Insiders sponsorship program before public release$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Requires MkDocs, a separate Python-based static site generator, to function$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Deep customization still requires configuration knowledge$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Is Material for MkDocs free?$q$, $q$Yes, the theme is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$What is MkDocs Insiders?$q$, $q$A sponsorship program that gives early access to new features before they're released publicly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$How many languages does it support?$q$, $q$The theme's interface is available in more than 60 languages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Does it include a search feature?$q$, $q$Yes, it includes an instant, offline-capable search that runs in the browser.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Who maintains Material for MkDocs?$q$, $q$It has been maintained by Martin Donath since 2016.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Open-source project documentation$q$, $q$Teams publish searchable, professional-looking documentation sites from Markdown.$q$, $q$Open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Internal and product documentation$q$, $q$Organizations build branded, responsive documentation sites without frontend expertise.$q$, $q$Technical writing and DevRel teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Community (Free)$q$, $q$Free$q$, NULL, $q$["Material Design theme","Instant search","Icons & emojis","Social cards"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$Insiders$q$, $q$Sponsorship-based$q$, NULL, $q$["Early access to new features","Supports ongoing development"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$overview$q$, $q$What is Material for MkDocs?$q$, 2, ARRAY[$q$Material for MkDocs is a free, MIT-licensed theme for MkDocs that turns Markdown into a professional, searchable static documentation site. It has been maintained by Martin Donath since 2016.$q$, $q$It includes an offline-capable instant search, a large built-in icon and emoji library, code annotations, automatic social preview cards, and translations for its interface in more than 60 languages.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', $q$who-its-for$q$, $q$Who Material for MkDocs is for$q$, 2, ARRAY[$q$It suits open-source maintainers, technical writers, and DevRel teams who want a fast, polished, and highly customizable documentation site without writing custom HTML, CSS, or JavaScript.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0491910-91ba-45bf-9e66-510a9761281d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Storybook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Storybook is a free, open-source frontend workshop for building, testing, and documenting UI components in isolation.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Storybook: open-source tool for developing, testing, and documenting UI components in isolation, with 77M+ monthly downloads.$q$,
  og_description = $q$Storybook: open-source tool for developing, testing, and documenting UI components in isolation, with 77M+ monthly downloads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '546237d7-afb6-42b7-8b01-ab03163155ce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '546237d7-afb6-42b7-8b01-ab03163155ce' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Isolated Component Development$q$, $q$Build and preview UI components separately from the rest of the application in a local workshop.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Interaction Testing$q$, $q$Simulate and verify user interactions like clicks and typing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Visual Testing Support$q$, $q$Detect visual regressions in components, including via the Chromatic add-on.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Auto-Generated Documentation$q$, $q$Generate documentation pages directly from component stories.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Addon Ecosystem$q$, $q$Extend functionality with a wide range of community and official add-ons.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$MCP for AI Tools$q$, $q$Introduces MCP support for integrating Storybook with AI-assisted React development.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Large-scale adoption: 77.33 million monthly downloads and 2,282+ contributors, per the official site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Framework-agnostic, fitting the broader component-driven development ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Strong addon ecosystem for testing, accessibility, and documentation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Backed by an enterprise offering (Chromatic) for teams needing hosted visual testing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Runs as a local dev server; hosting or publishing requires separate setup or a service like Chromatic$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Initial setup and story-writing add overhead to a project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Deeper testing/enterprise capabilities depend on the paid Chromatic service rather than Storybook itself$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Is Storybook free?$q$, $q$Yes, Storybook is open source and free to use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$What is Storybook used for?$q$, $q$Building, testing, and documenting UI components in isolation from the rest of an application.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Does Storybook include visual testing?$q$, $q$Storybook supports visual and interaction testing, with deeper visual testing available through Chromatic.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Who maintains Storybook?$q$, $q$It's maintained by the Storybook team, the same team behind Chromatic.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$What is the latest version of Storybook?$q$, $q$Storybook 10, per the official site at the time of writing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Component library development$q$, $q$Teams build and catalog reusable UI components with live previews.$q$, $q$Frontend and design systems teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$UI testing and documentation$q$, $q$Developers document component states and run interaction tests within Storybook.$q$, $q$Engineering teams practicing component-driven development$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Component workshop","Interaction testing","Auto-generated docs","Addon ecosystem"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$overview$q$, $q$What is Storybook?$q$, 2, ARRAY[$q$Storybook is an open-source frontend workshop for building, testing, and documenting UI components in isolation from the rest of an application. It runs as a local dev environment where components can be browsed, organized, and interacted with independently.$q$, $q$It supports interaction testing, auto-generated documentation, and a large addon ecosystem, and is developed by the same team that builds Chromatic, which provides hosted visual testing and UI review on top of Storybook.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('546237d7-afb6-42b7-8b01-ab03163155ce', $q$who-its-for$q$, $q$Who Storybook is for$q$, 2, ARRAY[$q$Storybook is built for frontend engineering and design systems teams practicing component-driven development who need to build, test, and document UI components independently of a full application.$q$]::text[], 1);


-- ── Chromatic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Chromatic is a UI testing and review platform from the Storybook team for visual, interaction, and accessibility testing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$179/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Chromatic: visual, interaction, and accessibility testing for UI components, with a free plan and paid plans from $179/month.$q$,
  og_description = $q$Chromatic: visual, interaction, and accessibility testing for UI components, with a free plan and paid plans from $179/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Visual Testing$q$, $q$Detects UI bugs in appearance, layout, fonts, and colors across builds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Accessibility Testing$q$, $q$Flags WCAG violations directly within the review workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Interaction Testing$q$, $q$Verifies click, type, hover, and drag interactions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$UI Review$q$, $q$Lets designers, PMs, and engineers comment on and approve UI changes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$TurboSnap$q$, $q$Speeds up test runs by only re-testing components affected by a change.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$CI/CD Integration$q$, $q$Adds automatic status checks to pull and merge requests across major CI providers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Storybook Hosting$q$, $q$Centralizes components, stories, tests, and docs in one workspace.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Free plan with 5,000 billed snapshots/month and unlimited projects and users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Built by the team behind Storybook, with deep native integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Also supports Playwright and Cypress alongside Storybook$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$TurboSnap reduces snapshot usage and speeds up test runs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Cited on the site as used by GitHub, Adobe, the BBC, and other large organizations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Paid plans scale by snapshot volume, which can raise costs for large component libraries$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Multi-browser testing (Safari, Firefox, Edge) requires the Starter plan or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Custom domains and SSO are limited to Pro/Enterprise tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Does Chromatic have a free plan?$q$, $q$Yes, it offers a free plan with 5,000 billed snapshots/month and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$How much does Chromatic cost?$q$, $q$Paid plans start at $179/month (Starter) and $399/month (Pro); Enterprise is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$What can Chromatic test?$q$, $q$Visual, interaction, and accessibility issues in UI components.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Does Chromatic support tools other than Storybook?$q$, $q$Yes, it also integrates with Playwright and Cypress.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Is there a free option for open-source projects?$q$, $q$Yes, Chromatic offers a free program for eligible open-source projects.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Automated visual regression testing$q$, $q$Catch unintended UI changes in pull requests before merge.$q$, $q$Frontend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Cross-functional UI review$q$, $q$Designers and PMs review and approve visual changes without reading code.$q$, $q$Product and design teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["5,000 billed snapshots","Chrome testing","Unlimited projects, users, and collaborators","Git/CI integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Starter$q$, $q$$179/month$q$, $q$monthly$q$, $q$["35,000 billed snapshots","Multi-browser testing (Safari, Firefox, Edge)","Everything in Free"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Pro$q$, $q$$399/month$q$, $q$monthly$q$, $q$["85,000 billed snapshots","Custom domain","Everything in Starter"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited snapshots","SSO & custom Git integrations","Priority support with SLA","Data retention options"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$overview$q$, $q$What is Chromatic?$q$, 2, ARRAY[$q$Chromatic is a UI testing and review platform built by the team behind Storybook. It catches visual, interaction, and accessibility issues in UI components before they reach production, and provides a shared workspace where designers, PMs, and engineers can review and approve changes.$q$, $q$It integrates with Storybook, Playwright, and Cypress, and adds status checks to pull and merge requests across CI providers including GitHub, GitLab, Bitbucket, CircleCI, and Jenkins.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', $q$who-its-for$q$, $q$Who Chromatic is for$q$, 2, ARRAY[$q$Chromatic is aimed at frontend and design systems teams using component-driven development who need automated visual regression testing plus a review workflow that non-engineers can participate in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4eb8addb-6a5e-46d7-8b12-ad4c212cdb1d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Percy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Percy, by BrowserStack, is an AI-powered visual testing platform that catches UI regressions in CI/CD pipelines.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Percy by BrowserStack: AI-powered visual testing with a free plan of 5,000 screenshots/month and CI/CD integrations.$q$,
  og_description = $q$Percy by BrowserStack: AI-powered visual testing with a free plan of 5,000 screenshots/month and CI/CD integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0521ec36-4a18-4308-8b35-efe654ddfaa1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0521ec36-4a18-4308-8b35-efe654ddfaa1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Visual Regression Testing$q$, $q$Captures and compares screenshots across browsers and screen sizes to catch layout bugs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Visual Review Agent$q$, $q$AI feature that prioritizes meaningful visual changes with natural-language summaries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Intelli-ignore$q$, $q$Automatically filters out dynamic content like carousels and ads from comparisons.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Root Cause Analysis$q$, $q$Helps pinpoint whether a visual change originated from the DOM, CSS, or layout.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Storybook & CI/CD Integrations$q$, $q$Works with Storybook, Playwright, Selenium, and 50+ CI/CD and SCM tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Git-Style Review Workflow$q$, $q$Supports branching- and merging-style workflows for reviewing visual changes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Free plan includes 5,000 screenshots per month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Backed by BrowserStack's real device and browser cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$AI-assisted review is claimed to cut review time by 3x$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Broad integration support across 50+ CI/CD, SCM, and collaboration tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Works with popular frameworks like Storybook, Playwright, and Selenium$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Detailed paid-tier pricing is not publicly listed and requires visiting BrowserStack's pricing page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Operates as part of BrowserStack rather than as a fully independent product$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Effective use requires integrating into an existing CI/CD pipeline$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Is Percy free?$q$, $q$Yes, Percy offers a free plan with 5,000 screenshots per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Who owns Percy?$q$, $q$Percy is owned and operated by BrowserStack.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$What testing frameworks does Percy work with?$q$, $q$Storybook, Playwright, Selenium, and other frameworks via 50+ integrations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Does Percy use AI?$q$, $q$Yes, its Visual Review Agent and Visual AI Engine use AI to prioritize meaningful changes and reduce noise.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Can Percy test across multiple browsers?$q$, $q$Yes, it supports cross-browser and responsive visual testing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$CI/CD visual regression testing$q$, $q$Automatically catch unintended UI changes on every pull request.$q$, $q$Frontend and QA engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Component-level visual testing$q$, $q$Test individual UI components via Storybook integration.$q$, $q$Design systems teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["5,000 screenshots/month"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$overview$q$, $q$What is Percy?$q$, 2, ARRAY[$q$Percy is a visual testing and review platform owned by BrowserStack. It automates the detection of visual regressions by capturing and comparing screenshots across browsers and screen sizes, and integrates into existing CI/CD pipelines.$q$, $q$AI-powered features, including a Visual Review Agent and Intelli-ignore, prioritize meaningful visual changes and filter out noise from dynamic content like carousels or ads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', $q$who-its-for$q$, $q$Who Percy is for$q$, 2, ARRAY[$q$Percy suits frontend and QA teams that want automated visual regression testing wired into their CI/CD pipeline, including teams already using Storybook, Playwright, or Selenium.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0521ec36-4a18-4308-8b35-efe654ddfaa1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Applitools ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Applitools is an AI-powered visual and functional testing platform built on its proprietary Visual AI engine.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Applitools: AI-driven visual testing platform with self-healing tests, cross-browser coverage, and a free trial.$q$,
  og_description = $q$Applitools: AI-driven visual testing platform with self-healing tests, cross-browser coverage, and a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '56030237-fe9d-4c89-85b0-e8fc3b277439';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '56030237-fe9d-4c89-85b0-e8fc3b277439' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Visual AI$q$, $q$AI-based visual comparison engine, trained on 4B+ user interfaces per the company, that avoids pixel-by-pixel false positives.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Self-Healing Tests$q$, $q$Automatically adapts and maintains tests as the UI changes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Cross-Platform Testing$q$, $q$Tests websites, web apps, native mobile apps, UI components, and PDFs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Multiple Authoring Methods$q$, $q$Write tests via SDKs, a codeless recorder, or an NLP-based test builder.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Root Cause Analysis$q$, $q$Automated insights that help pinpoint the cause of test failures.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Flexible Deployment$q$, $q$Available as SaaS, dedicated cloud (AWS, Azure, GCP), or on-premises.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$60+ Integrations$q$, $q$Connects with CI/CD, source control, bug tracking, and chat tools.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$AI-driven Visual AI engine reduces false positives from dynamic content$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Supports web, mobile, component, and PDF testing from one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Flexible deployment options: SaaS, dedicated cloud, or on-premises$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Free trial available to evaluate before purchasing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Multiple ways to author tests (SDK, codeless recorder, NLP builder)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Contracts are typically annual, which may not suit short-term needs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Test-unit-based pricing model can be harder to estimate costs upfront$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Is Applitools pricing public?$q$, $q$No, Applitools pricing is quote-based; details are not listed publicly on the site.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Does Applitools offer a free trial?$q$, $q$Yes, a free trial is available through registration.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$What is Visual AI?$q$, $q$Applitools' proprietary AI engine for visual comparison, designed to avoid the false positives of pixel-based comparisons.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Can Applitools test mobile apps?$q$, $q$Yes, it supports native mobile app testing in addition to web and components.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$How is Applitools priced?$q$, $q$Pricing is based on "Test Units," with contracts typically running for one year.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Visual regression testing at scale$q$, $q$Use Visual AI to catch appearance bugs across browsers and devices without flaky pixel comparisons.$q$, $q$QA engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Enterprise-grade testing with strict security needs$q$, $q$Deploy Applitools in a dedicated cloud or on-premises for organizations with compliance requirements.$q$, $q$Enterprises in regulated industries such as finance and healthcare$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Starter$q$, $q$Custom (quote-based)$q$, $q$annual$q$, $q$["50 test units","Unlimited users","Unlimited test executions","Free trial available"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Public Cloud$q$, $q$Custom (quote-based)$q$, $q$annual$q$, $q$["1-year data retention","Dedicated customer success engineer"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$Dedicated Cloud$q$, $q$Custom (quote-based)$q$, $q$annual$q$, $q$["SSO support","Enterprise-grade security","Optional on-premises deployment"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$overview$q$, $q$What is Applitools?$q$, 2, ARRAY[$q$Applitools is a testing platform built around Visual AI, a proprietary computer-vision engine the company says has analyzed more than 4 billion user interfaces, used to validate the visual appearance of websites, web apps, native mobile apps, UI components, and PDFs.$q$, $q$Tests can be authored through SDKs, a codeless recorder, or an NLP-based builder, and the platform can be deployed as SaaS, on a dedicated cloud, or fully on-premises.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', $q$who-its-for$q$, $q$Who Applitools is for$q$, 2, ARRAY[$q$Applitools is aimed at QA engineers, SDETs, and developers at organizations — including regulated industries like finance and healthcare — that need visual and functional test coverage with flexible, security-conscious deployment options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('56030237-fe9d-4c89-85b0-e8fc3b277439', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── BrowserStack ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$BrowserStack is a cloud platform for testing websites and mobile apps on real browsers and 30,000+ real devices.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$BrowserStack: cloud-based cross-browser and device testing trusted by 50,000+ customers, with free trial and paid plans from $29/month.$q$,
  og_description = $q$BrowserStack: cloud-based cross-browser and device testing trusted by 50,000+ customers, with free trial and paid plans from $29/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '509b81fc-5715-4f19-a1df-3b3b13c8ed42' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Real Device Cloud$q$, $q$Test on 30,000+ real iOS and Android devices plus real desktop browsers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Live Manual Testing$q$, $q$Interactively test on real browsers and devices in the cloud.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Test Automation (Automate)$q$, $q$Run Selenium, Cypress, and Playwright automated tests on real browser and device infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$AI Agents$q$, $q$20+ AI agents embedded across the testing lifecycle for tasks like test generation and self-healing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Accessibility Testing$q$, $q$Automated WCAG compliance testing for web and mobile apps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Visual Testing (Percy)$q$, $q$Automated visual regression testing integrated into the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$150+ Integrations$q$, $q$Connects with Selenium, Cypress, Playwright, Jenkins, GitHub, Jira, Slack, and more.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Access to 30,000+ real mobile devices plus real desktop browsers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Broad integration support across 150+ tools, including CI/CD, issue trackers, and chat$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Combines manual (Live), automated (Automate), visual (Percy), and accessibility testing in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$AI agents built into the testing workflow$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Cited on the site as used by more than 50,000 customers globally$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Tiered pricing can become costly for teams needing multiple parallel tests or full device/browser coverage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Some premium features (SIM card support, payment testing, advanced analytics) are limited to higher-tier plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Individual/Freelancer plans have limited monthly testing minutes compared to unlimited team plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Does BrowserStack offer a free trial?$q$, $q$Yes, a free trial is available.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$How many devices does BrowserStack support?$q$, $q$More than 30,000 real iOS and Android devices, plus real desktop browsers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$What testing types does BrowserStack support?$q$, $q$Live manual testing, automated testing (Automate), visual testing (Percy), and accessibility testing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$How much does BrowserStack cost?$q$, $q$Plans start around $29/month for individual Live Desktop testing, with Team and Enterprise plans priced separately.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Does BrowserStack support test automation frameworks?$q$, $q$Yes, including Selenium, Cypress, and Playwright.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Cross-browser compatibility testing$q$, $q$Verify websites render correctly across real browsers and OS combinations.$q$, $q$QA and web development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Mobile app testing on real devices$q$, $q$Test iOS and Android apps on thousands of real physical devices instead of emulators.$q$, $q$Mobile app development teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Live Desktop$q$, $q$$29/month$q$, $q$annual$q$, $q$["Real browser manual testing","Unlimited testing minutes","24/7 email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Live Desktop & Mobile$q$, $q$$39/month$q$, $q$annual$q$, $q$["Real browser and mobile manual testing"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Automate Chrome$q$, $q$$59/month$q$, $q$annual$q$, $q$["1 parallel automated test on Chrome"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Automate Desktop & Mobile Pro$q$, $q$$225/month$q$, $q$annual$q$, $q$["1 parallel test across desktop and mobile","AI agents for automation","Advanced analytics"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$Team / Enterprise$q$, $q$Custom$q$, NULL, $q$["5+ or 25+ users","Volume discounts","SIM card and payment testing support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$overview$q$, $q$What is BrowserStack?$q$, 2, ARRAY[$q$BrowserStack is a cloud-based testing platform that lets teams test websites and mobile apps on real browsers and more than 30,000 real iOS and Android devices, rather than emulators. It covers live manual testing, automated testing (Automate), visual testing via Percy, and accessibility testing in one platform.$q$, $q$It offers 150+ integrations with tools like Selenium, Cypress, Playwright, Jenkins, GitHub, Jira, and Slack, and has built 20+ AI agents into the testing lifecycle for tasks such as test generation and self-healing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', $q$who-its-for$q$, $q$Who BrowserStack is for$q$, 2, ARRAY[$q$BrowserStack is built for development and QA teams that need to validate web and mobile apps across real browsers and devices at scale, from individual freelancers to enterprises running large automated test suites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('509b81fc-5715-4f19-a1df-3b3b13c8ed42', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;


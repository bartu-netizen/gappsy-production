-- Enrichment marathon batch: Assembly Employee Recognition, Asterisk, Astra Security, athenaOne, Atomic CRM, Atomic Server, Atsumeru, Attio

-- ── Assembly Employee Recognition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Assembly is an employee recognition and engagement platform where teams give peer-to-peer shout-outs, celebrate milestones, and redeem rewards.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$3/user/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Santa Monica, California, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Assembly: Employee Recognition & Rewards Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Assembly lets teams recognize peers, celebrate milestones, and redeem rewards, with AI-powered engagement insights via Dora.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Assembly is an employee recognition and engagement SaaS platform founded in 2017 and based in Santa Monica, California. It helps HR and people-ops teams build workplace culture through peer-to-peer recognition, automated celebrations of birthdays, work anniversaries, and new hires, and structured awards and challenges tied to company values. Recognition is backed by a points-based rewards system that employees can redeem through a global catalog, including gift cards and charitable donations. Assembly also includes 'Dora,' an AI-powered analytics hub that surfaces engagement trends, culture insights, and nudges for managers, alongside advanced people analytics dashboards for HR leaders. The platform integrates with everyday workplace tools such as Slack, Microsoft Teams, and BambooHR so recognition can happen inside existing workflows. Assembly is sold on a subscription basis, with an 'Empower' plan priced at $3 per user per month (billed annually) covering recognition, celebrations, rewards, and Dora AI insights, and a custom-priced Enterprise plan adding advanced security, compliance, and tailored implementation support. It is aimed at organizations of any size — from startups to large enterprises — with a particular focus on remote, hybrid, and distributed teams that need structured ways to keep employees engaged and connected. Assembly is highly rated on G2 for employee recognition software.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b80f26c5-559d-4dd6-a520-9913d10938f6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Peer-to-Peer Recognition$q$, $q$Employees and managers give public shout-outs and appreciation tied to company values.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Celebrations & Milestones$q$, $q$Automated recognition of birthdays, work anniversaries, and new hires.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Awards & Challenges$q$, $q$Custom programs that reinforce specific company values and behaviors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Global Rewards Catalog$q$, $q$Employees redeem points for gift cards, merchandise, or charitable donations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Dora AI Insights$q$, $q$AI-powered dashboards that surface engagement trends and manager nudges.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Workplace Integrations$q$, $q$Native connections with Slack, Microsoft Teams, and BambooHR.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Highly rated on G2 for employee recognition software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Deep integration with Slack and Microsoft Teams for in-workflow recognition$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$AI-powered engagement insights via Dora$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Flexible, points-based global rewards catalog$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Full plan comparison and Enterprise pricing require booking a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Per-seat subscription costs can add up for large organizations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Some advanced security and customization features are Enterprise-only$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$What is Assembly?$q$, $q$Assembly is an employee recognition and engagement platform that lets teams give peer recognition, celebrate milestones, and redeem points-based rewards.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$How much does Assembly cost?$q$, $q$Assembly's published Empower plan starts at $3 per user per month billed annually; Enterprise pricing is custom and requires contacting sales.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Does Assembly integrate with Slack and Microsoft Teams?$q$, $q$Yes, Assembly natively integrates with Slack, Microsoft Teams, and BambooHR.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Does Assembly offer a free trial?$q$, $q$Assembly's website does not publicly list a self-serve free trial; prospective customers are directed to book a demo for pricing and access.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Employee engagement & retention programs$q$, $q$HR teams use Assembly to run structured recognition and rewards programs that reduce turnover.$q$, $q$HR and People Ops teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Remote/hybrid culture building$q$, $q$Distributed teams use Assembly's Slack/Teams integrations to keep recognition visible across locations.$q$, $q$Remote and hybrid organizations$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Empower$q$, $q$$3/user/month$q$, $q$Annual$q$, NULL, $q$["Milestone celebrations","Announcements","Awards & Challenges","Global reward catalog","Peer-to-peer recognition","Points and budget controls","Dora AI hub","Advanced people analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Advanced security & compliance","Custom integrations","Enterprise-grade support","Tailored implementation"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'b80f26c5-559d-4dd6-a520-9913d10938f6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Assembly is a cloud-based employee recognition and engagement platform designed to help HR teams build connected, high-performing workplace cultures. It centers on peer-to-peer recognition, letting employees and managers give public shout-outs tied to company values.$q$, $q$Beyond recognition, Assembly automates milestone celebrations, runs value-reinforcing awards and challenges, and lets employees redeem earned points through a global rewards catalog.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core features include peer recognition and shout-outs, automated birthday/anniversary/new-hire celebrations, custom awards and challenge programs, and a points-based rewards catalog redeemable for gift cards or donations.$q$, $q$Assembly also offers Dora, an AI-powered insights hub that flags engagement gaps and trends, plus advanced people analytics and native integrations with Slack, Microsoft Teams, and BambooHR.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Assembly's published Empower plan costs $3 per user per month when billed yearly and includes recognition, celebrations, rewards, points/budget controls, and the Dora AI hub. An Enterprise tier with custom pricing adds advanced security, compliance, and dedicated implementation support, priced after a sales conversation.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Assembly targets HR and people-operations teams at organizations of any size, with particular appeal to companies managing remote or hybrid workforces that want a structured, always-on way to reinforce culture and reduce turnover.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b80f26c5-559d-4dd6-a520-9913d10938f6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Asterisk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Asterisk is a free, open-source framework for building PBX systems, VoIP gateways, and telephony applications, created in 1999 and maintained by Sangoma.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Asterisk: Open-Source PBX & Telephony Framework$q$, seo_title),
  seo_meta_description = COALESCE($q$Asterisk is a free, open-source toolkit for building PBX, VoIP, and telephony applications, maintained by Sangoma since its 1999 launch.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Asterisk is a free, open-source software framework for building telephony applications, originally created in 1999 by Mark Spencer of Digium. Since Digium's acquisition, Asterisk has been maintained as part of Sangoma Technologies' open-source telephony portfolio, alongside the FreePBX graphical management interface. At its core, Asterisk turns a general-purpose computer into a full-featured PBX, supporting call routing, interactive voice response (IVR), voicemail, call recording, and conferencing. It implements a wide range of VoIP and telephony protocols, including SIP and IAX2, letting it interconnect traditional PSTN lines, SIP trunks, and VoIP endpoints. Developers can extend Asterisk through its dialplan scripting and APIs such as AGI, AMI, and ARI, making it a common foundation for custom PBX systems, call centers, and commercial VoIP platforms built by telecom providers and integrators worldwide. Asterisk itself has no license fees or paid tiers — it is distributed under an open-source license and typically self-hosted on Linux servers, though it lacks a built-in graphical interface (most deployments pair it with FreePBX or a similar front end). It is best suited for organizations and developers with telephony or Linux systems expertise who need a highly customizable, cost-free alternative to proprietary PBX hardware and software, rather than turnkey plug-and-play users.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5208a8e5-fcd9-4333-a413-ca2e73058d97' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$PBX Core Engine$q$, $q$Turns a server into a full-featured private branch exchange.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$VoIP Protocol Support$q$, $q$Supports SIP, IAX2, and other protocols for interconnecting VoIP and PSTN endpoints.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$IVR & Call Routing$q$, $q$Configurable interactive voice response and call-routing logic via the dialplan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Conferencing$q$, $q$Built-in audio conferencing capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Voicemail & Call Recording$q$, $q$Native voicemail boxes and call recording.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Extensible APIs$q$, $q$AGI, AMI, and ARI interfaces let developers integrate custom applications.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Free and fully open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Highly extensible and customizable for bespoke telephony needs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Large, long-running community and ecosystem (25+ years)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Works with a wide range of SIP trunking providers and telephony hardware$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Requires Linux and telephony expertise to install, configure, and secure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$No built-in graphical interface (commonly requires FreePBX or similar)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Self-hosting means the operator owns all maintenance and security responsibility$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Is Asterisk free to use?$q$, $q$Yes, Asterisk is free and open source with no licensing cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Who maintains Asterisk?$q$, $q$Asterisk was created by Mark Spencer of Digium in 1999 and is now maintained by Sangoma Technologies.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Does Asterisk include a graphical interface?$q$, $q$No, Asterisk is configured via its dialplan and config files by default; most users pair it with FreePBX for a web-based GUI.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$What protocols does Asterisk support?$q$, $q$Asterisk supports SIP, IAX2, and other VoIP and traditional telephony protocols.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$Custom PBX deployment$q$, $q$Businesses build in-house phone systems tailored to their call-routing needs.$q$, $q$IT and telecom teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$VoIP platform development$q$, $q$Providers build commercial calling and conferencing platforms on top of Asterisk.$q$, $q$Developers and VoIP service providers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5208a8e5-fcd9-4333-a413-ca2e73058d97';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Asterisk is an open-source framework for building PBX systems, VoIP gateways, and other telephony applications. Created in 1999 by Mark Spencer, it is now maintained by Sangoma Technologies, which also develops the FreePBX graphical interface commonly paired with it.$q$, $q$Running on standard server hardware, Asterisk handles call routing, IVR, voicemail, conferencing, and interconnection between the PSTN and VoIP networks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Asterisk supports core PBX functionality, wide VoIP protocol coverage (including SIP and IAX2), IVR and call routing, conferencing, and voicemail/call recording.$q$, $q$It is extensible through a dialplan scripting language and APIs (AGI, AMI, ARI), letting developers integrate it with custom applications, call centers, and third-party systems.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Asterisk suits IT and telecom teams building custom PBX deployments, as well as VoIP service providers and developers building commercial calling platforms, provided they have the Linux and telephony expertise to configure and maintain a self-hosted system.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5208a8e5-fcd9-4333-a413-ca2e73058d97', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Astra Security ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Astra Security is a continuous penetration testing platform combining AI-powered vulnerability scanning with expert-led pentests for web apps, APIs, and cloud.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$69/month (DAST Scanner Lite)$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Claymont, Delaware, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Astra Security: Continuous Pentesting Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Astra Security offers AI-powered continuous penetration testing for web apps, APIs, and cloud infrastructure, backed by certified security experts.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Astra Security, operated by ASTRA IT, Inc. and founded in 2018 by Ananda Krishna and Shikhil Sharma, is a continuous penetration testing platform for web applications, APIs, and cloud infrastructure. It combines an AI-powered DAST (dynamic application security testing) scanner covering over 10,000 vulnerability tests, including the OWASP Top 10 and known CVEs, with manual penetration testing performed by certified security experts (PTaaS). Astra's product line also includes an API Security platform that discovers shadow and undocumented APIs and tests them for vulnerabilities, and a Cloud Vulnerability Scanner that checks for 400+ misconfigurations across AWS, Azure, and GCP. Results and remediation guidance flow into a collaborative dashboard, with integrations for Jira, Slack, and CI/CD pipelines, plus a Trust Center for sharing compliance evidence with customers and auditors. Astra sells its DAST scanner, API security, cloud security, and pentest-as-a-service products as separate subscriptions, priced monthly or annually (with a discount for annual billing), alongside a one-week $7 trial offering full platform access. It is aimed at security-conscious engineering and compliance teams — particularly those pursuing SOC 2, HIPAA, or ISO certifications — and reports serving over 1,000 engineering teams across 70+ countries.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$PTaaS (Pentest-as-a-Service)$q$, $q$Manual penetration testing by certified experts with real-time developer collaboration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$DAST Vulnerability Scanner$q$, $q$Automated scanning covering 10,000+ vulnerabilities including OWASP Top 10 and CVEs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$API Security Platform$q$, $q$Discovers shadow and undocumented APIs and scans them for vulnerabilities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Cloud Vulnerability Scanner$q$, $q$Detects 400+ misconfigurations across AWS, Azure, and GCP.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Trust Center$q$, $q$Shareable compliance evidence for customers, prospects, and auditors.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Workflow Integrations$q$, $q$Connects with Jira, Slack, and CI/CD pipelines for remediation tracking.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Combines automated scanning with human-verified penetration testing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Broad coverage across web apps, APIs, and cloud infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Compliance-oriented reporting for SOC 2, HIPAA, and ISO$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Used by over 1,000 engineering teams across 70+ countries$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Web, API, cloud, and PTaaS products are priced and purchased separately$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Enterprise-grade features require a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$May offer more scope than very small teams need for basic scanning$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$What does Astra Security do?$q$, $q$Astra Security provides continuous penetration testing that combines AI-powered vulnerability scanning with expert-led manual pentests for web apps, APIs, and cloud infrastructure.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$How much does Astra cost?$q$, $q$Pricing varies by product: the DAST scanner starts at $69/month, PTaaS plans start at $1,999/year, and API/cloud security products range from $99-$499/month, with custom Enterprise pricing available.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Does Astra offer a free trial?$q$, $q$Yes, Astra offers a $7 one-week trial with full platform access and no credit card required.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Does Astra combine automated and manual testing?$q$, $q$Yes, Astra pairs its automated DAST scanner with manual penetration testing performed by certified security experts.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Compliance-driven security testing$q$, $q$Teams use Astra to meet SOC 2, HIPAA, or ISO requirements with documented pentest evidence.$q$, $q$Security and compliance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Continuous vulnerability management$q$, $q$Engineering teams run ongoing scans against web apps and APIs instead of relying on annual pentests.$q$, $q$Engineering and DevSecOps teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Scanner Lite$q$, $q$$69/month$q$, $q$Monthly$q$, NULL, $q$["1 target","3 scans/month","Authenticated scanning","1 integration","AI-powered fixes"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Scanner$q$, $q$$199/month$q$, $q$Monthly$q$, NULL, $q$["1 target","Unlimited scans","Unlimited integrations","AI fixes","4 vetted scans annually"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Scanner Agency$q$, $q$$499/month$q$, $q$Monthly$q$, NULL, $q$["5 target pool","Unlimited scans","AI fixes","Vetted scans","Dedicated account manager"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Pentest Auto$q$, $q$$1,999/year$q$, $q$Annual$q$, NULL, $q$["Autonomous pentest","Same-day first report","One expert rescan"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$Pentest Expert$q$, $q$$5,999/year$q$, $q$Annual$q$, NULL, $q$["Manual pentest by certified experts","Cloud config review","API testing","2 rescans","Compliance reporting"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Astra Security is a continuous penetration testing platform that replaces one-off annual pentests with ongoing, AI-assisted vulnerability scanning combined with expert-led manual testing. Founded in 2018 and headquartered in Claymont, Delaware, it covers web applications, APIs, and cloud infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Astra's DAST scanner runs over 10,000 vulnerability tests, including OWASP Top 10 checks and known CVEs, with AI-suggested fixes. Its PTaaS offering pairs automated scanning with certified human pentesters and real-time collaboration between testers and developers.$q$, $q$The API Security platform discovers shadow and zombie APIs and scans them for vulnerabilities, while the Cloud Vulnerability Scanner checks for 400+ misconfigurations across AWS, Azure, and GCP. Astra also integrates with Jira, Slack, and CI/CD pipelines, and offers a Trust Center for sharing compliance evidence.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Astra prices its products separately. The DAST Scanner starts at $69/month (Scanner Lite) up to $499/month (Scanner Agency), with annual billing saving roughly 15%. PTaaS plans run from $1,999/year (Pentest Auto) to $5,999/year (Pentest Expert), API Security from $199-$499/month, and Cloud Security from $99-$199/month. Enterprise tiers across all product lines are custom-priced. A $7 one-week trial gives full platform access.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Astra is built for security-conscious engineering teams and compliance-driven organizations pursuing certifications like SOC 2, HIPAA, or ISO, who need continuous rather than point-in-time vulnerability testing.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb7ddf3-25d3-4c05-bc83-0b82d47bf1b6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── athenaOne ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$athenaOne is athenahealth's cloud-based EHR, practice management, and revenue cycle platform for ambulatory healthcare practices.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(1997, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Boston, Massachusetts, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$athenaOne: Cloud EHR & Practice Management Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$athenaOne by athenahealth combines EHR, practice management, medical billing, and patient engagement tools for ambulatory care practices.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$athenaOne is a cloud-based, all-in-one healthcare software platform from athenahealth, a company founded in 1997 by Jonathan Bush and Todd Park and now headquartered in Boston, Massachusetts. The platform combines electronic health records (EHR), practice management, medical billing, and revenue cycle management into a single system for ambulatory (outpatient) medical practices. Core capabilities include clinical documentation and charting, scheduling, claims submission and denial management, prior authorization workflows, and patient engagement tools such as online scheduling and messaging. athenahealth positions athenaOne as an integrated, AI-native platform, layering automation and AI-assisted workflows on top of its long-running network of claims and clinical data across many connected practices, which it uses to help identify billing and coding issues. Pricing for athenaOne is not published on athenahealth's website; the vendor works with prospective customers on a custom quote, and industry sources report that some athenahealth pricing models are tied to a percentage of a practice's collections rather than a flat per-provider fee. athenaOne is aimed at physician practices, clinics, and other ambulatory care organizations that want a single vendor covering clinical, billing, and patient engagement needs rather than stitching together separate EHR and billing systems.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2debbb6c-85ad-4634-b256-8049d7c1bd11' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Electronic Health Records$q$, $q$Cloud-based clinical documentation and charting for ambulatory care.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Practice Management$q$, $q$Scheduling and administrative workflow tools for medical practices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Medical Billing & Revenue Cycle Management$q$, $q$Claims submission, denial management, and collections support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Prior Authorization$q$, $q$Workflow tools to manage payer prior-authorization requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Patient Engagement Tools$q$, $q$Online scheduling and patient communication features.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$All-in-one EHR, billing, and patient engagement suite$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Cloud-based, reducing on-premise IT infrastructure needs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Backed by a large network of connected practices and claims data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Strong focus on revenue cycle and claims denial management$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Pricing is not publicly published and requires a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Some billing models reportedly tie cost to a percentage of collections$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Implementation and onboarding can be involved for smaller practices$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$What is athenaOne?$q$, $q$athenaOne is athenahealth's integrated cloud platform combining EHR, practice management, medical billing, and patient engagement tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Who makes athenaOne?$q$, $q$athenaOne is made by athenahealth, founded in 1997 and headquartered in Boston, Massachusetts.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$How is athenaOne priced?$q$, $q$athenahealth does not publish athenaOne pricing; it provides custom quotes, and some reports indicate certain plans are tied to a percentage of a practice's collections.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Is athenaOne cloud-based?$q$, $q$Yes, athenaOne is delivered as a cloud-based platform rather than on-premise software.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Integrated EHR and billing$q$, $q$Practices use athenaOne to manage clinical documentation and medical billing in one system.$q$, $q$Physician practices and clinics$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$Revenue cycle management$q$, $q$Administrators use athenaOne's claims and denial management tools to improve collections.$q$, $q$Practice administrators and billing teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '2debbb6c-85ad-4634-b256-8049d7c1bd11';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$athenaOne is athenahealth's integrated cloud platform for ambulatory healthcare practices, combining EHR, practice management, medical billing, and revenue cycle management in one system. athenahealth was founded in 1997 and is now headquartered in Boston, Massachusetts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform covers clinical documentation and EHR charting, scheduling and practice management, medical billing, claims denial management, and prior authorization, alongside patient engagement tools like online scheduling and messaging.$q$, $q$athenahealth markets athenaOne as an AI-native platform, applying automation across billing and clinical workflows and drawing on data from its network of connected practices.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$athenaOne is built for ambulatory medical practices and clinics that want clinical, billing, and patient engagement functionality from a single vendor, along with practice administrators managing revenue cycle operations.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2debbb6c-85ad-4634-b256-8049d7c1bd11', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Atomic CRM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Atomic CRM is an open-source, customizable CRM toolkit by Marmelab built on React, Supabase, and shadcn/ui, available self-hosted or as a managed subscription.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted); €25/month (Starter, managed)$q$, starting_price),
  founded_year = COALESCE(2024, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Nancy, France$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Atomic CRM: Open-Source, Customizable CRM Toolkit$q$, seo_title),
  seo_meta_description = COALESCE($q$Atomic CRM is an open-source CRM built with React and Supabase by Marmelab, free to self-host or available as a managed subscription from €25/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Atomic CRM is an open-source CRM toolkit built by Marmelab, a software studio headquartered in Nancy, France, and introduced in 2024. Rather than offering a rigid, one-size-fits-all CRM, Atomic CRM is designed to be customized by developers to fit a business's specific sales process. It includes standard CRM functionality such as contact and company management, note-taking, data import/export, and a Kanban-style deal pipeline, along with more advanced capabilities like single sign-on via SAML, email-to-note automation, API access, and multilingual support. A distinguishing feature is an 'AI harness for Claude Code' that lets non-technical team members request changes to the CRM using natural-language prompts. Atomic CRM is built on a modern stack — React, TypeScript, shadcn/ui, Tailwind CSS, TanStack Query, and Supabase/PostgreSQL — and can be run entirely self-hosted for free under an open-source license, or used as a managed, Supabase-hosted service. Paid managed tiers start with a Starter plan at €25/month, a Team plan at €50/month, and custom Enterprise pricing, with SOC 2, ISO 27001, and HIPAA compliance options available on managed plans. It targets developers and organizations that want full data ownership and deep customization without vendor lock-in, as an alternative to closed commercial CRMs.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Contact & Company Management$q$, $q$Organize contacts, companies, and notes in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Deal Pipeline / Kanban Board$q$, $q$Visualize and manage sales deals through customizable pipeline stages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Email-to-Note Automation$q$, $q$Automatically capture email correspondence as CRM notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$SAML Single Sign-On$q$, $q$Enterprise-grade authentication for managed deployments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$API Access$q$, $q$Programmatic access for integrating Atomic CRM with other systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$AI Harness for Claude Code$q$, $q$Lets non-technical users customize the CRM via natural-language prompts.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Fully open source with complete source-code transparency$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Self-hostable for full data ownership and no vendor lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Modern, actively maintained tech stack (React, Supabase, TypeScript)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$AI-assisted customization via Claude Code integration$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$A newer product (2024) with a smaller ecosystem than established CRMs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Self-hosting requires technical setup and ongoing maintenance$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Some enterprise features like SSO are tied to managed/paid plans$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Is Atomic CRM free?$q$, $q$Yes, Atomic CRM is free and open source to self-host; Marmelab also offers paid managed hosting plans starting at €25/month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Who built Atomic CRM?$q$, $q$Atomic CRM was built by Marmelab, a software development studio based in Nancy, France.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Can I self-host Atomic CRM?$q$, $q$Yes, Atomic CRM can be fully self-hosted using its open-source codebase and a Supabase/PostgreSQL backend.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$What tech stack does Atomic CRM use?$q$, $q$It's built with React, TypeScript, shadcn/ui, Tailwind CSS, TanStack Query, and Supabase/PostgreSQL.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Customizable self-hosted CRM$q$, $q$Technical teams self-host and modify Atomic CRM to fit their exact sales process.$q$, $q$Developers and technical teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Managed CRM without lock-in$q$, $q$Small businesses use the managed hosting option to avoid running infrastructure while retaining data ownership.$q$, $q$Small business sales teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Free (self-hosted)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full open-source access","Self-hosted deployment","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Starter$q$, $q$€25/month$q$, $q$Monthly$q$, NULL, $q$["Managed hosting","SAML SSO","Email integration","API access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Team$q$, $q$€50/month$q$, $q$Monthly$q$, NULL, $q$["Managed hosting","SAML SSO","Email integration","API access","Team features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Custom deployment","Compliance options (SOC 2, ISO 27001, HIPAA)"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'c0b30aa3-ea8d-4c30-98b3-03b802c687b0';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Atomic CRM is an open-source CRM toolkit created by Marmelab, a French software studio based in Nancy, and introduced in 2024. It's designed for developers who want to adapt a CRM to their specific business process rather than conform to a rigid off-the-shelf tool.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Atomic CRM covers contact and company management, notes, data import/export, and a Kanban-style deal pipeline. Advanced capabilities include SAML single sign-on, email-to-note automation, API access, mobile access, and multilingual support.$q$, $q$It also includes an AI harness for Claude Code, letting non-technical users request CRM customizations through natural-language prompts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Atomic CRM is free to self-host under its open-source license. Marmelab also offers managed hosting with a Starter plan at €25/month, a Team plan at €50/month, and custom Enterprise pricing; all managed plans include SAML SSO, email integration, and API access.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Atomic CRM suits developers and technical teams that want full customization and data ownership, as well as small businesses wanting a managed CRM without long-term vendor lock-in.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0b30aa3-ea8d-4c30-98b3-03b802c687b0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Atomic Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Atomic Server is a free, open-source, self-hosted graph database and headless CMS for modeling and sharing Atomic Data in real time, built by Ontola.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Netherlands$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Atomic Server: Open-Source Real-Time Graph Database$q$, seo_title),
  seo_meta_description = COALESCE($q$Atomic Server is a free, open-source, self-hosted CMS and graph database for modeling and sharing Atomic Data, built in Rust by Ontola.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Atomic Server is a free, open-source graph database and headless CMS for creating, sharing, and modeling 'Atomic Data,' a modular data specification. The Atomic Data project was started in 2020 by Joep Meindertsma, CEO of Ontola, a Netherlands-based software development firm, and Atomic Server remains developed and maintained as part of Ontola's work with an active open-source community. Written in Rust with a React/TypeScript front end, Atomic Server is designed to be extremely lightweight (around an 8MB download) and fast, with sub-millisecond median response times. It functions as a real-time, event-sourced database: data changes sync instantly via WebSockets, supporting collaborative document editing and group chat, full-text search with fuzzy matching, and a schema-validated, Airtable-like table editor. It supports multiple serialization formats including JSON-LD and RDF/XML, built-in authorization controls, and AI integration via the Model Context Protocol (MCP) for connecting with various AI model providers. Atomic Server is entirely free to use, distributed under the MIT license, and intended to be self-hosted. It targets developers and organizations that want a flexible, customizable, self-hosted alternative to commercial headless CMS and database platforms, particularly those who value real-time collaboration and strict, linked-data-style schema modeling.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Real-Time Graph Database$q$, $q$Event-sourced data storage with instant sync via WebSockets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Full-Text Search$q$, $q$Fast, fuzzy-matching search across stored data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Collaborative Editing & Chat$q$, $q$Real-time collaborative document editing and group chat features.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Schema-Validated Table Editor$q$, $q$Airtable-like table editing with strict schema validation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Multiple Serialization Formats$q$, $q$Supports JSON-LD, RDF/XML, and other linked-data formats.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$MCP-Based AI Integration$q$, $q$Connects to AI model providers via the Model Context Protocol.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Free and fully open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Extremely lightweight (~8MB) with sub-millisecond median response times$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Flexible, schema-based data modeling built on linked-data principles$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Supports real-time multi-user collaboration$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Requires self-hosting and technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Smaller community and ecosystem than mainstream CMS platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Documentation and feature set are still actively evolving$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Is Atomic Server free?$q$, $q$Yes, Atomic Server is free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Who develops Atomic Server?$q$, $q$Atomic Server is developed by Ontola, a Netherlands-based software firm led by Joep Meindertsma, with an open-source community.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Can Atomic Server be self-hosted?$q$, $q$Yes, Atomic Server is designed to be self-hosted; it has a small footprint of around 8MB.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$What is Atomic Data?$q$, $q$Atomic Data is a modular data specification that Atomic Server implements, used for linking and modeling data across systems.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Self-hosted headless CMS$q$, $q$Developers use Atomic Server as a flexible, self-hosted content and data backend.$q$, $q$Developers and technical teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$Real-time collaborative data modeling$q$, $q$Teams use Atomic Server's table editor and sync features for shared, structured datasets.$q$, $q$Small technical teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'd84ff4aa-f743-48ec-bcc7-7292ca1a5767';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Atomic Server is a free, open-source graph database and headless CMS for modeling and sharing 'Atomic Data.' The project was started in 2020 by Joep Meindertsma of Ontola, a Netherlands-based software firm, and is written in Rust with a React/TypeScript front end.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Atomic Server offers a real-time, event-sourced database with WebSocket-based sync, full-text fuzzy search, collaborative document editing and group chat, and a schema-validated, Airtable-style table editor.$q$, $q$It supports multiple serialization formats (including JSON-LD and RDF/XML), built-in authorization controls, and AI integration via the Model Context Protocol (MCP).$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Atomic Server is aimed at developers and technical teams who want a lightweight, self-hosted, and highly customizable alternative to commercial headless CMS or database platforms, especially those needing real-time collaboration and structured data modeling.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d84ff4aa-f743-48ec-bcc7-7292ca1a5767', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Atsumeru ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Atsumeru is a free, open-source, self-hosted media server for organizing and reading manga, comics, and light novels across devices.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Atsumeru: Self-Hosted Manga & Comics Server$q$, seo_title),
  seo_meta_description = COALESCE($q$Atsumeru is a free, open-source, self-hosted server for organizing and reading manga, comics, and light novels, with Windows, Linux, and Android apps.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Atsumeru is a free, open-source, self-hosted media server for managing and reading manga, comics, and light novels. Its name comes from the Japanese word for 'to gather,' reflecting its purpose of consolidating a personal digital library in one place. Users organize their collections into categories and sections, and can edit metadata using the ComicInfo.xml or book_info.json formats. Atsumeru supports a wide range of file formats, including CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu, and provides two-way reading-history synchronization so progress carries over between devices. The project is community-driven and open source, distributed with no licensing cost, and is supported through a public GitHub repository and a Telegram community. It ships with manager applications for Windows and Linux and a dedicated Android client for reading on mobile. Atsumeru is aimed at manga, comics, and light-novel enthusiasts who want to self-host their own library server rather than rely on cloud-based or proprietary reading apps, and who are comfortable running and maintaining self-hosted software.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95db99cc-d2cd-4227-a213-282aa828ef80';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95db99cc-d2cd-4227-a213-282aa828ef80' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '95db99cc-d2cd-4227-a213-282aa828ef80';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Library Organization$q$, $q$Organize collections into categories and sections.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Metadata Editing$q$, $q$Edit item metadata via ComicInfo.xml or book_info.json.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Multi-Format Support$q$, $q$Reads CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Cross-Device Reading Sync$q$, $q$Two-way reading-history synchronization across devices.$q$, 3);

DELETE FROM tool_pros WHERE tool_id = '95db99cc-d2cd-4227-a213-282aa828ef80';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Free and fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Broad file format support for manga, comics, and light novels$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Cross-device reading-progress synchronization$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Active community support via GitHub and Telegram$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '95db99cc-d2cd-4227-a213-282aa828ef80';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Requires self-hosting and some technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$No official iOS app mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Smaller community than mainstream self-hosted alternatives like Komga or Kavita$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '95db99cc-d2cd-4227-a213-282aa828ef80';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Is Atsumeru free?$q$, $q$Yes, Atsumeru is free and open source with no licensing cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$What file formats does Atsumeru support?$q$, $q$Atsumeru supports CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu files.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Is Atsumeru self-hosted?$q$, $q$Yes, Atsumeru is designed to be self-hosted on your own server or Windows/Linux machine.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Does Atsumeru have a mobile app?$q$, $q$Yes, Atsumeru offers a dedicated Android client for reading on mobile devices.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '95db99cc-d2cd-4227-a213-282aa828ef80';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Personal manga/comics library hosting$q$, $q$Enthusiasts self-host Atsumeru to organize and read their digital manga and comics collections.$q$, $q$Manga and comics enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$Home media server for light novels$q$, $q$Self-hosting hobbyists run Atsumeru alongside other home-lab services to manage reading libraries.$q$, $q$Self-hosting hobbyists$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '95db99cc-d2cd-4227-a213-282aa828ef80';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Atsumeru is a free, open-source, self-hosted media server built for organizing and reading manga, comics, and light novels. Users build a personal digital library, organized into categories and sections, that can be accessed and read across multiple devices.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Atsumeru supports metadata editing via ComicInfo.xml or book_info.json, and reads a wide range of formats including CBZ, CBR, CB7, PDF, ePub, FB2, and DjVu.$q$, $q$It offers two-way reading-history synchronization across devices, along with dedicated manager applications for Windows and Linux and an Android client for mobile reading.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Atsumeru is built for manga, comics, and light-novel enthusiasts who want to self-host their own reading library and are comfortable running and maintaining open-source, self-hosted software.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95db99cc-d2cd-4227-a213-282aa828ef80', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Attio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Attio is an AI-native CRM that automates go-to-market workflows with AI agents, real-time data sync, and flexible data modeling for revenue teams.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from €29/user/month billed annually)$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Attio: AI-Native CRM for Go-to-Market Teams$q$, seo_title),
  seo_meta_description = COALESCE($q$Attio is an AI-native CRM with real-time data sync, automation workflows, and AI agents, used by go-to-market teams to run revenue operations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Attio is an AI-native CRM founded in 2019 and headquartered in London, United Kingdom, backed by investors including a16z, GV, Redpoint Ventures, and Balderton Capital. It's built around a flexible, real-time data model that automatically syncs contact, company, and deal data from connected email, calendar, and other tools, rather than relying on manual data entry. Attio's 'Universal Context' layer unifies emails, calls, product usage, and other connected-tool data into a single record view, and its AI features include 'Ask Attio' for natural-language search and record creation, automation Workflows, outreach Sequences, Call Intelligence for recording and analyzing meetings, and configurable AI agents for research, lead scoring, and other automated tasks. The platform integrates with over 50 tools, including Slack, Notion, Linear, Apollo, Stripe, and email/calendar providers. Attio is sold on a freemium model: a Free plan supports up to 3 seats, Plus and Pro plans add private lists, call intelligence, sequences, and advanced permissions at per-seat monthly pricing (with an annual-billing discount), and an Enterprise plan offers custom pricing with unlimited objects/teams, SSO, and SCIM. Attio is aimed at sales and revenue operations teams — from early-stage startups to larger go-to-market organizations — that want an automation- and AI-heavy alternative to traditional CRMs.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Ask Attio$q$, $q$AI-powered natural-language search and record creation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Workflows$q$, $q$Automation for orchestrating revenue processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Sequences$q$, $q$Personalized, automated outreach campaigns.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Call Intelligence$q$, $q$Records and analyzes sales calls and meetings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Universal Context$q$, $q$Unified data layer combining emails, calls, product usage, and connected tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$AI Agents$q$, $q$Configurable agents for research, lead scoring, and custom automation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Data Enrichment$q$, $q$Automatic lead research and ICP scoring.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Deep automation and configurable AI agent capabilities$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Real-time data sync and flexible, customizable object modeling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Usable free plan for small teams (up to 3 seats)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Wide integration ecosystem with 50+ connected apps$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Pro and Enterprise tiers get expensive on a per-seat basis at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Some advanced AI and automation features are limited to paid tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Newer entrant than legacy CRMs, so its third-party ecosystem is still maturing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Is Attio free?$q$, $q$Attio offers a Free plan for up to 3 seats with core CRM and data-sync features; paid Plus, Pro, and Enterprise plans unlock more capacity and features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$What makes Attio 'AI-native'?$q$, $q$Attio builds AI agents, natural-language search, and automated workflows directly into the CRM, rather than adding AI as a bolt-on feature.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Does Attio integrate with Slack and Notion?$q$, $q$Yes, Attio integrates with Slack, Notion, and 50+ other tools through its App Store.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Who is Attio for?$q$, $q$Attio is designed for sales, marketing, and revenue operations teams that want to automate go-to-market workflows.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Startup GTM & sales process building$q$, $q$Early-stage teams use Attio's flexible data model to build a CRM around their specific sales process.$q$, $q$Startup sales and RevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Enterprise revenue operations automation$q$, $q$Larger sales organizations use Attio's Workflows and AI agents to automate pipeline management at scale.$q$, $q$Enterprise sales and RevOps teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Free$q$, $q$€0/user/month$q$, $q$Monthly or Annual$q$, NULL, $q$["Real-time contact syncing","Automatic data enrichment","Up to 3 seats"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Plus$q$, $q$€36/user/month (€29 billed annually)$q$, $q$Monthly or Annual$q$, NULL, $q$["Private lists","Enhanced email sending","No seat limits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Pro$q$, $q$€86/user/month (€69 billed annually)$q$, $q$Monthly or Annual$q$, NULL, $q$["Call Intelligence","Sequences","Advanced permissions","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$Enterprise$q$, $q$Custom$q$, $q$Annual$q$, NULL, $q$["Unlimited objects and teams","Advanced security and admin controls","SSO and SCIM"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'de92e42f-5f05-4f16-b06e-4b8b254d19ad';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Attio is an AI-native CRM founded in 2019 and headquartered in London. It's built around a flexible, real-time data model that automatically syncs contact, company, and deal data, rather than requiring manual entry, and layers AI agents and automation on top of that data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Attio's 'Ask Attio' feature enables natural-language search and record creation, while Workflows automate revenue processes and Sequences power personalized outreach campaigns. Call Intelligence records and analyzes meetings, and configurable AI agents can handle research, scoring, and other automated tasks.$q$, $q$Its 'Universal Context' layer unifies data from email, calls, product usage, and connected tools into a single view, backed by automatic data enrichment and real-time reporting.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Attio offers a Free plan (up to 3 seats) with real-time contact syncing and data enrichment. Plus (€36/user/month, or €29 billed annually) adds private lists and unlimited seats; Pro (€86/user/month, or €69 billed annually) adds Call Intelligence, Sequences, and advanced permissions. Enterprise pricing is custom and billed annually, adding unlimited objects/teams, SSO, and SCIM.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Attio integrates with more than 50 tools through its App Store, including Slack, Notion, Linear, Apollo, Stripe, Granola, and email/calendar providers, plus support for AI assistants like Claude and ChatGPT.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Attio targets sales, marketing, and revenue operations teams — from early-stage startups to larger go-to-market organizations — that want automation and AI agents to reduce manual CRM upkeep and headcount needs.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de92e42f-5f05-4f16-b06e-4b8b254d19ad', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


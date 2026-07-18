-- Enrichment marathon batch: Akkoma, Albato, Alchemer, alf, Alfresco, Alfresco Community Edition, Algolia, Alitu

-- ── Akkoma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Akkoma is a free, open-source, self-hosted microblogging server for the ActivityPub fediverse, forked from Pleroma for faster development and richer features.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Akkoma: Open-Source Fediverse Server$q$, seo_title),
  seo_meta_description = COALESCE($q$Akkoma is a free, self-hosted ActivityPub microblogging server forked from Pleroma, offering custom emoji, quote posts, and faster development.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Akkoma is a free and open-source microblogging server for the ActivityPub fediverse, distributed under the AGPLv3 license. It is a fork of Pleroma that began development in 2022, created to support a faster development pace and more user customization than mainline Pleroma. Akkoma federates with Mastodon, Pleroma, Misskey, and other ActivityPub-compatible services, so accounts on an Akkoma instance can follow and interact with users across the wider fediverse. Key features include unlimited media attachments per post, custom emoji reactions, Misskey-flavored Markdown with animation support, unlimited post editing, quote posts, polls, and threaded discussions. It supports multiple frontends, including a Mastodon-compatible interface, and the project reports meaningful performance improvements over Pleroma. Akkoma has no company behind it; it is maintained by open-source contributors, and users either join an existing public Akkoma instance or self-host their own server (options include Heroku-style PaaS providers and container deployments). It is best suited for privacy-conscious individuals, communities, and organizations who want a self-hosted, ad-free social media presence with full control over their data and moderation, and who are comfortable with (or willing to learn) server administration.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '747424fb-e9a8-434a-b7eb-6df34846ecf9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$ActivityPub federation$q$, $q$Interoperates with Mastodon, Pleroma, Misskey, and other ActivityPub-based fediverse servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Custom emoji reactions$q$, $q$React to posts with custom emoji, beyond simple likes/boosts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Rich post formatting$q$, $q$Misskey-flavored Markdown with support for animations in posts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Unlimited post editing$q$, $q$Edit published posts without limits, unlike some fediverse platforms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Quote posts and polls$q$, $q$Native support for quote posting, polls, and threaded discussions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Multiple frontends$q$, $q$Includes a Mastodon-compatible web interface alongside Akkoma's native frontend.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Faster-paced development than mainline Pleroma, with more expressive posting features$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Full control over data and moderation via self-hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Interoperable with the broader ActivityPub fediverse (Mastodon, Misskey, etc.)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Requires technical skill and server administration to self-host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$No official managed hosting or commercial support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Smaller instance/user network than Mastodon$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Fast-moving development can introduce breaking changes between versions$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Is Akkoma free to use?$q$, $q$Yes. Akkoma is free, open-source software licensed under the AGPLv3, with no subscription cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Do I have to host Akkoma myself?$q$, $q$No. You can join an existing public Akkoma instance, or self-host your own server if you want full control.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Is Akkoma compatible with Mastodon?$q$, $q$Yes. Akkoma federates over ActivityPub, so it can interact with Mastodon accounts, and it also offers a Mastodon-compatible frontend and API support for many Mastodon apps.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$How is Akkoma different from Pleroma?$q$, $q$Akkoma is a fork of Pleroma that started in 2022 to enable faster development and additional features, such as richer formatting and reactions.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Personal or community fediverse presence$q$, $q$Run a small, self-hosted microblogging server for yourself or a community, free from centralized platform moderation.$q$, $q$Privacy-conscious individuals and online communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$Organizational fediverse account$q$, $q$Host an official ActivityPub-based social presence with full control over data and infrastructure.$q$, $q$Tech-savvy organizations and administrators$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '747424fb-e9a8-434a-b7eb-6df34846ecf9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Akkoma is a decentralized, self-hosted social networking server built on the ActivityPub protocol, the same open standard used by Mastodon and other fediverse software. It began as a fork of Pleroma in 2022, created to enable a faster-paced development cycle and closer alignment with features found in Misskey.$q$, $q$Because Akkoma speaks ActivityPub, accounts on an Akkoma instance can follow, be followed by, and interact with users on Mastodon, Pleroma, Misskey, and other compatible fediverse servers, forming part of a single interconnected social network with no central authority.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Akkoma supports unlimited media attachments per post, custom emoji reactions, Misskey-flavored Markdown formatting with animation support, unlimited post editing, quote posts, polls, and threaded conversations. It ships with multiple frontend options, including a Mastodon-compatible web interface, so users can pick the client experience they prefer.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', $q$self-hosting-and-development$q$, $q$Self-Hosting & Licensing$q$, 2, ARRAY[$q$Akkoma is free and open-source software licensed under the AGPLv3. There is no vendor or subscription fee; users either join an existing public Akkoma instance or self-host their own server on infrastructure such as generic Linux VPS hosts, container platforms, or PaaS providers.$q$, $q$As a fast-moving community project, Akkoma has no dedicated commercial support, so self-hosters generally rely on the project's documentation and community channels for help.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('747424fb-e9a8-434a-b7eb-6df34846ecf9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Albato ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Albato is a no-code integration and automation platform connecting 1,000+ apps, with an embeddable white-label iPaaS for SaaS companies to offer native integrations.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE($q$20-50 employees$q$, company_size),
  headquarters = COALESCE($q$Setúbal, Portugal$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Portuguese$q$, $q$Spanish$q$]::text[],
  seo_title = COALESCE($q$Albato: No-Code App Integration & iPaaS$q$, seo_title),
  seo_meta_description = COALESCE($q$Albato connects 1,000+ apps with no-code workflow automation and an embeddable iPaaS for SaaS companies. Free plan available; paid plans from $15/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Albato is a no-code integration platform (iPaaS) made by Albato Limited, headquartered in Setúbal, Portugal, and founded in 2018. It lets individuals and businesses connect over 1,000 pre-built app connectors (including Telegram, OpenAI, Shopify, Google Sheets, Discord, Trello, and Monday.com) into automated workflows without writing code. Beyond its standard automation product, Albato offers 'Albato Embedded,' a white-label iPaaS that SaaS companies can embed directly into their own products via headless API or iFrame, letting their customers build integrations without leaving the host application. Pricing is freemium: a Free plan offers 100 transactions/month and 5 active automations; the Pro plan starts at $15/month (billed annually) and includes unlimited automations, AI-powered automation features, AI agents, and data migration tools; a Teams plan and custom enterprise pricing are also available. The platform includes AI-assisted workflow building, Universal MCP (Model Context Protocol) support, bulk data migration, and single sign-on. Security certifications include SOC 2 Type II and GDPR compliance, with AES-256 encryption at rest and TLS in transit. Albato is aimed at small and mid-sized businesses automating repetitive cross-app tasks, and at SaaS product teams wanting to offer native, branded integrations to their own customers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3b94af22-0e27-4952-855a-be2baf62f997';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3b94af22-0e27-4952-855a-be2baf62f997' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$No-code workflow builder$q$, $q$Build multi-step automations across apps using a visual builder, no coding required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$1,000+ app connectors$q$, $q$Pre-built integrations spanning marketing, sales, e-commerce, and productivity tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Albato Embedded$q$, $q$White-label iPaaS that SaaS companies can embed into their own product via headless API or iFrame.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$AI-powered automation$q$, $q$Albato AI and AI agents assist in building and running automated workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Universal MCP support$q$, $q$Supports the Model Context Protocol for connecting AI tools and workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Bulk data migration$q$, $q$Move data in bulk between connected applications.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$SSO and enterprise security$q$, $q$Single sign-on, SOC 2 Type II certification, and GDPR-compliant data handling.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Large library of 1,000+ pre-built app connectors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Generous free tier with 100 transactions and 5 automations/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Albato Embedded offers a distinctive white-label option for SaaS vendors$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$AI-assisted automation building$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Higher-tier Teams plan is still rolling out ('coming soon' as of this writing)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Overage fees apply once transaction limits are exceeded$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Advanced enterprise features and custom pricing require contacting sales$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Does Albato have a free plan?$q$, $q$Yes. The Free plan includes 100 transactions and 5 active automations per month at no cost.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$What is Albato Embedded?$q$, $q$It's a white-label iPaaS product that SaaS companies can embed directly into their own applications so their customers can build integrations natively.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$How many apps does Albato integrate with?$q$, $q$Albato offers more than 1,000 pre-built app connectors.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Is there a free trial for paid plans?$q$, $q$Yes, a 7-day free trial is available on the Pro plan.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Cross-app workflow automation$q$, $q$Automate repetitive tasks between marketing, sales, and productivity apps without a developer.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Embedded native integrations$q$, $q$Offer branded, native integrations inside your own SaaS product using Albato Embedded.$q$, $q$SaaS product and engineering teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Free$q$, $q$$0$q$, $q$monthly$q$, NULL, $q$["100 transactions/month","5 active automations","2 steps per automation","7-day log storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Pro$q$, $q$$15/month (billed annually) or $22/month (billed monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Up to 2M transactions/month","Unlimited automations","Albato AI and AI agents","Data migration","30-day log storage","7-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Teams$q$, $q$$65/month (billed annually) or $93/month (billed monthly)$q$, $q$monthly or annual$q$, NULL, $q$["From 5,000 transactions/month","5 team seats","Priority support","Shared workspaces"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$Custom$q$, $q$Contact sales$q$, $q$custom$q$, NULL, $q$["Flexible transaction limits","Dedicated success manager","Custom integrations","SLA support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '3b94af22-0e27-4952-855a-be2baf62f997';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Albato is a no-code integration platform-as-a-service (iPaaS) founded in 2018 and headquartered in Setúbal, Portugal. It lets users build automated workflows across more than 1,000 supported applications without writing code, and it separately offers 'Albato Embedded,' a white-label integration layer that SaaS companies can embed directly into their own products.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform provides a visual no-code workflow builder, 1,000+ pre-built app connectors, AI-powered automation and AI agents, bulk data migration tools, and Universal MCP support. Albato Embedded adds white-label branding, headless API and iFrame embedding, and a 'Solutions' feature for grouping integrations by use case, so SaaS vendors can offer native integrations under their own brand.$q$, $q$Security and compliance features include SOC 2 Type II certification, GDPR compliance with a Data Processing Agreement, AES-256 encryption at rest, and TLS 1.2/1.3 encryption in transit.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Albato follows a freemium model. The Free plan includes 100 transactions and 5 active automations per month at no cost. The Pro plan costs $15/month billed annually (or $22/month billed monthly) and unlocks unlimited automations, up to 2 million transactions/month, Albato AI, AI agents, and data migration. A Teams plan (around $65-93/month) and a Custom enterprise tier with dedicated support are also offered. A 7-day free trial is available on paid plans, and annual billing saves up to 30% versus monthly.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b94af22-0e27-4952-855a-be2baf62f997', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Alchemer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Alchemer (formerly SurveyGizmo) is an omnichannel customer feedback platform for surveys, review monitoring, workflow automation, and AI-driven analytics.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$55/month per user$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Boulder, Colorado, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Alchemer: Customer Feedback & Survey Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Alchemer collects and analyzes customer feedback via surveys, reviews, and social monitoring, with AI analytics and 400+ integrations. Plans from $55/user/mo.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Alchemer, formerly known as SurveyGizmo, is an omnichannel customer feedback and experience management platform made by Alchemer LLC, headquartered in Boulder, Colorado, and founded in 2006. It serves more than 11,000-13,000 companies worldwide across CX, HR, and market research use cases. The platform is organized around four capability areas: Compass (local listings and search/maps visibility), Collect (survey design, in-app and website feedback, and review/social media monitoring), Connect (workflow automation with 400+ pre-built integrations such as Salesforce, HubSpot, and Slack), and Clarity (AI-powered sentiment analysis and dashboards). Pricing is per-user subscription: the Collaborator plan starts at $55/month per user (about $26.25/month billed annually) with unlimited surveys and 75,000 annual responses; Professional ($165/month per user, capped at 3 users) adds custom branding, templates, and advanced logic; Full Access ($275/month per user, capped at 3 users) adds advanced research question types and statistical analysis tools; teams larger than 3 users need a custom Business Platform plan. A 7-day free trial is available with no credit card required. Alchemer has been recognized in Gartner's Magic Quadrant for Voice of Customer platforms for five consecutive years, and it targets CX, market research, and operations teams that need flexible survey logic and cross-channel feedback collection at small-team through enterprise scale.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '000dcbeb-599f-406b-9ce6-de68152c9f9a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Survey design and distribution$q$, $q$Build surveys with advanced logic and branching, distributed via web, email, in-app, or offline.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Review and social monitoring$q$, $q$Track online reviews and social media mentions alongside survey feedback.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Workflow automation$q$, $q$Automate feedback-triggered workflows with 400+ pre-built integrations, including Salesforce, HubSpot, and Slack.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$AI-powered analytics$q$, $q$Clarity module uses AI for sentiment analysis and generates insight dashboards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Local listings management$q$, $q$Compass module manages business listing visibility across search and maps.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Advanced statistical tools$q$, $q$Full Access plan includes advanced research question types and statistical analysis.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Deep survey logic and customization options$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Large integration ecosystem (400+ pre-built connectors)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Recognized as a Gartner Magic Quadrant Leader for Voice of Customer platforms for multiple years$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Scales from small teams to enterprise use cases$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Per-user pricing becomes expensive as team size or response volume grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Professional and Full Access plans are capped at 3 users before requiring custom Business Platform pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Annual response volumes are limited by plan tier$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Is there a free trial for Alchemer?$q$, $q$Yes, a 7-day free trial is available with no credit card required.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$What was Alchemer previously called?$q$, $q$Alchemer was formerly known as SurveyGizmo.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$How many integrations does Alchemer offer?$q$, $q$Alchemer offers 400+ pre-built integrations, including Salesforce, HubSpot, and Slack.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Can more than 3 users share a Professional or Full Access plan?$q$, $q$No. Teams larger than 3 users need to move to a custom-priced Business Platform account.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Customer experience feedback programs$q$, $q$Collect and analyze feedback across surveys, reviews, and social channels in one platform.$q$, $q$CX and marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Complex market research surveys$q$, $q$Build branching, logic-driven surveys with advanced statistical analysis.$q$, $q$Market researchers and analysts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Feedback-driven workflow automation$q$, $q$Trigger automated actions in CRMs and other tools based on survey responses.$q$, $q$Enterprise operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Collaborator$q$, $q$$55/month per user (or ~$26.25/month billed annually)$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited surveys","75,000 annual responses","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Professional$q$, $q$$165/month per user (max 3 users)$q$, $q$monthly or annual$q$, NULL, $q$["100,000 annual responses","Custom templates and branding","Advanced logic and scripting","Email and phone support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Full Access$q$, $q$$275/month per user (max 3 users)$q$, $q$monthly or annual$q$, NULL, $q$["125,000 annual responses","Advanced research question types","Advanced statistical analysis tools"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$Business Platform$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["More than 3 users","Custom volume and support terms"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '000dcbeb-599f-406b-9ce6-de68152c9f9a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Alchemer, formerly SurveyGizmo, is an omnichannel customer feedback and experience management platform founded in 2006 and headquartered in Boulder, Colorado. It collects, analyzes, and acts on feedback gathered from surveys, in-app prompts, online reviews, and social media, serving over 11,000 companies across more than 80 countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform is built around four pillars: Compass for local listings management, Collect for survey design and review/social monitoring, Connect for workflow automation with 400+ pre-built integrations, and Clarity for AI-powered sentiment analysis and dashboards. Advanced logic, branching, custom scripting, and statistical analysis tools are available on higher-tier plans.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Alchemer prices per user per month. Collaborator starts at $55/month per user (about $26.25/month billed annually) with unlimited surveys and 75,000 annual responses. Professional is $165/month per user (up to 3 users) with 100,000 annual responses and custom branding. Full Access is $275/month per user (up to 3 users) with 125,000 annual responses and advanced statistical tools. Teams larger than 3 users require a custom Business Platform account. A 7-day free trial requires no credit card.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('000dcbeb-599f-406b-9ce6-de68152c9f9a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── alf ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$alf.io is a free, open-source event ticketing and attendance management platform that organizers self-host for full control over payments, data, and privacy.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$Italian$q$, $q$Spanish$q$, $q$German$q$, $q$Dutch$q$, $q$French$q$, $q$Turkish$q$, $q$Romanian$q$, $q$Portuguese$q$]::text[],
  seo_title = COALESCE($q$alf.io: Open-Source Event Ticketing System$q$, seo_title),
  seo_meta_description = COALESCE($q$alf.io is a free, self-hosted, open-source ticketing platform for conferences and events, supporting Stripe, PayPal, and offline check-in apps.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$alf.io (also written Alf.io) is a free and open-source event attendance management and ticketing system, launched in 2014 and licensed under GPLv3 for its web application (with an Apache 2-licensed mobile app). It is built for event organizers who prioritize privacy, security, and fair pricing, covering the full event lifecycle from ticket sales through check-in and reporting. It supports multiple payment methods, including Stripe, Mollie, Revolut, PayPal, bank transfer, and on-site payment. A companion iOS/Android app handles ticket scanning, check-in, and lead capture, and the project also supports Raspberry Pi-powered offline check-in kiosks with badge printing for events without reliable internet. The ticket purchase flow is available in nine languages: English, Italian, Spanish, German, Dutch, French, Turkish, Romanian, and Portuguese. Security features include HTTPS, Content Security Policy, and PCI-compliant payment handling, and any analytics integration (such as Google Analytics) has privacy protections enabled by default. Because alf.io is self-hosted, there are no licensing or per-ticket platform fees; organizers deploy it themselves on platforms such as Heroku, Google Kubernetes Engine, or Clever Cloud, or use a third-party managed hosting provider such as Swicket. It suits conference, meetup, and community event organizers who want a privacy-respecting, cost-free alternative to commercial ticketing platforms and are comfortable managing their own infrastructure or working with a hosting partner.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '433a3a94-7166-44ad-9b8c-9a9efd28f698' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Flexible payment options$q$, $q$Accept Stripe, Mollie, Revolut, PayPal, bank transfer, or on-site payments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Mobile check-in app$q$, $q$iOS/Android app for ticket scanning, check-in, and lead capture.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Offline check-in stations$q$, $q$Raspberry Pi-powered kiosks with badge printing for offline event check-in.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Multi-language ticketing$q$, $q$Ticket purchase flow available in nine languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Privacy-first design$q$, $q$Privacy protections enabled by default for optional analytics integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Self-hostable deployment$q$, $q$Deployable on Heroku, Google Kubernetes Engine, Clever Cloud, and other platforms.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$No platform or per-ticket fees since it's self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Strong privacy and security defaults$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Choice of multiple payment providers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Active open-source community and sponsor support$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Requires technical setup and hosting knowledge to self-manage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$No official vendor support unless using a third-party managed host like Swicket$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Smaller feature/plugin ecosystem than large commercial ticketing platforms$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Is alf.io free to use?$q$, $q$Yes. The web application is GPLv3-licensed open-source software with no usage fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Do I need to host alf.io myself?$q$, $q$Yes, for the core open-source project. A managed hosting alternative called Swicket, built on alf.io, is also available.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$What payment processors does alf.io support?$q$, $q$Stripe, Mollie, Revolut, PayPal, bank transfer, and on-site payment.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Does alf.io have a mobile app?$q$, $q$Yes, an iOS/Android app is available for check-in scanning and lead capture.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Self-hosted conference ticketing$q$, $q$Sell and manage tickets for conferences or meetups without platform fees.$q$, $q$Conference and meetup organizers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$Offline venue check-in$q$, $q$Use Raspberry Pi kiosks to check in attendees at venues without reliable internet.$q$, $q$Event staff and volunteers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '433a3a94-7166-44ad-9b8c-9a9efd28f698';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$alf.io is a free and open-source event attendance management system launched in 2014, built for organizers who prioritize privacy, security, and fair pricing. It covers the full event lifecycle, from ticket distribution and sales through on-site check-in and post-event reporting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform supports multiple payment methods including Stripe, Mollie, Revolut, PayPal, bank transfer, and on-site payment, and offers a native iOS/Android app for ticket scanning, check-in, and lead capture. It also supports Raspberry Pi-powered offline check-in stations with badge printing for venues with unreliable connectivity. The purchase flow is available in nine languages, and security is handled via HTTPS, Content Security Policy, and PCI-compliant payment processing.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', $q$licensing-and-deployment$q$, $q$Licensing & Self-Hosting$q$, 2, ARRAY[$q$alf.io's web application is licensed under GPLv3 and its mobile app under Apache 2, with no usage fees or mandatory statistics collection. Organizers self-host the platform on infrastructure such as Heroku, OpenShift, Google Kubernetes Engine, or Clever Cloud, or can use Swicket, a third-party managed hosting alternative built on alf.io. The project is supported through Open Collective and organizational sponsors.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('433a3a94-7166-44ad-9b8c-9a9efd28f698', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Alfresco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Alfresco is an enterprise content, process, and governance management platform, originally founded in 2005 and now developed by Hyland, used to manage documents and automate workflows.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2005, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Westlake, Ohio, USA (Hyland headquarters)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Alfresco: Enterprise Content Management by Hyland$q$, seo_title),
  seo_meta_description = COALESCE($q$Alfresco is Hyland's enterprise content, process, and governance management platform for document workflows, collaboration, and compliance.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Alfresco is an open-standards-based enterprise content, process, and governance management platform originally founded in 2005 by John Newton and John Powell as Alfresco Software, Inc. It was acquired by private equity firm Thomas H. Lee Partners in 2018 and then by Hyland Software in September 2020, and is now marketed as the Alfresco Platform within Hyland's content services portfolio. The platform provides web-based document management accessible across devices, intelligent process automation for content-centric workflows, enterprise collaboration extensions for Microsoft 365 and Google Docs, information governance and lifecycle automation, and AI-powered content enrichment and metadata extraction. It is built on open standards and APIs, allowing organizations to extend and customize it. Alfresco targets mid-size to large organizations across healthcare, financial services, government, insurance, education, manufacturing, and retail that need to modernize document management, automate content workflows, and meet governance and compliance requirements, including HR, legal, and accounting departments. Pricing for the commercial Alfresco Platform is not publicly disclosed and requires contacting Hyland's sales team, though a free trial download is available. Hyland has been recognized as a Leader in Gartner's Magic Quadrant for Document Management. A separate, free open-source version called Alfresco Community Edition shares most of the same underlying codebase but lacks official vendor support.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '35a25125-49a7-491d-af00-f68e8a653d0c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '35a25125-49a7-491d-af00-f68e8a653d0c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '35a25125-49a7-491d-af00-f68e8a653d0c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Document management$q$, $q$Web-based tools to find, access, and manage content across devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Process automation$q$, $q$Integrated workflow tools that streamline content-centric business processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Microsoft 365 and Google Docs extensions$q$, $q$Enterprise collaboration extensions that connect Alfresco to common office suites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Information governance$q$, $q$Automates information lifecycle management for compliance needs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$AI content enrichment$q$, $q$Automatic metadata extraction and content enrichment tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Open APIs and extensibility$q$, $q$Built on open standards for custom integrations with other systems.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '35a25125-49a7-491d-af00-f68e8a653d0c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Mature, open-standards-based enterprise content management platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Strong governance and compliance tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Deep integrations with Microsoft 365 and Google Docs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Backed by Hyland's broader enterprise content services expertise$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '35a25125-49a7-491d-af00-f68e8a653d0c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Pricing is not publicly disclosed, requiring a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Enterprise-focused feature set and setup may be more than small teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Full feature set generally requires paid Enterprise licensing versus the free Community Edition$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '35a25125-49a7-491d-af00-f68e8a653d0c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Who develops Alfresco?$q$, $q$Hyland Software develops and sells the Alfresco Platform, having acquired Alfresco in September 2020.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Is Alfresco open source?$q$, $q$Alfresco originated as an open-source project; today, the commercial Alfresco Platform is proprietary, while a separate Alfresco Community Edition remains free and open source.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Is there a free trial?$q$, $q$Yes, a free trial download is available for evaluation.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$What industries use Alfresco?$q$, $q$Healthcare, financial services, government, insurance, education, manufacturing, and retail, among others.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '35a25125-49a7-491d-af00-f68e8a653d0c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Governed enterprise document management$q$, $q$Centralize and govern documents with lifecycle automation and compliance controls.$q$, $q$IT and compliance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$Content-centric process automation$q$, $q$Automate document-driven business workflows across departments.$q$, $q$Operations and process teams$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '35a25125-49a7-491d-af00-f68e8a653d0c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Alfresco is an enterprise content, process, and governance management platform originally founded in 2005 by John Newton and John Powell. After being acquired by Thomas H. Lee Partners in 2018 and then by Hyland Software in 2020, it is now developed and sold by Hyland as the Alfresco Platform, part of Hyland's broader content services offering.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Alfresco provides web-based document management accessible from any device, intelligent process automation for content-centric workflows, and enterprise collaboration extensions for Microsoft 365 and Google Docs. Information governance capabilities automate the content lifecycle, while AI-powered tools handle content enrichment and metadata extraction. The platform is built on open standards and APIs for extensibility and integration with other business systems.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Hyland does not publish pricing for the Alfresco Platform; prospective customers must request a quote or demo. A free trial download is available for evaluation.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Alfresco is aimed at mid-size to large organizations in healthcare, financial services, government, insurance, education, manufacturing, and retail that need to modernize document management, automate content-centric processes, and meet governance and compliance requirements — including HR, legal, and accounting departments specifically.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', $q$development-history$q$, $q$Company History$q$, 2, ARRAY[$q$Alfresco Software was founded in 2005 to build an open-source alternative to proprietary enterprise content management systems. It was acquired by Thomas H. Lee Partners in 2018 and by Hyland Software in September 2020, and Hyland has since been recognized as a Leader in Gartner's Magic Quadrant for Document Management.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('35a25125-49a7-491d-af00-f68e8a653d0c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Alfresco Community Edition ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Alfresco Community Edition is the free, open-source content services platform that shares its core codebase with Hyland's commercial Alfresco Platform.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2005, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Alfresco Community Edition: Free Open-Source ECM$q$, seo_title),
  seo_meta_description = COALESCE($q$Alfresco Community Edition is a free, LGPLv3-licensed, self-hosted content management platform sharing its core code with the commercial Alfresco Platform.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Alfresco Community Edition is the free, open-source distribution of Alfresco's content services platform, originating from Alfresco Software's founding in 2005 and now maintained under Hyland's stewardship following Hyland's 2020 acquisition of Alfresco. It is licensed under LGPLv3 and shares more than 90% of its source code with the commercial Alfresco Platform (Enterprise Edition), providing document/content repository management, web-based access across devices, and open APIs for building custom integrations. Unlike the paid Alfresco Platform, Community Edition receives no official vendor support or SLA — support comes from the open-source community — and it lacks some of the enterprise governance and AI features available in the paid product. The project remains actively maintained, with regular numbered releases; for example, version 25.1 shipped in March 2025, 25.2 in July 2025, 25.3 in November 2025, and 26.1 in March 2026. It is distributed through official Alfresco/Hyland community channels and mirrored on platforms like SourceForge and GitHub. Alfresco Community Edition suits developers, small IT teams, and cost-conscious organizations that want a self-hosted, no-license-fee enterprise content management system and are comfortable maintaining their own infrastructure without vendor support.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Free content repository$q$, $q$Document and content management with no license fees, shared core code with the Enterprise edition.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Web-based access$q$, $q$Access and manage content from a browser across devices.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Open APIs$q$, $q$Build custom integrations and extensions on open standards.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Active release cadence$q$, $q$Regular numbered releases (e.g., 25.x, 26.1) with security and stability fixes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Self-hosted deployment$q$, $q$Deploy and control your own infrastructure with no vendor lock-in.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Free to use with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Shares over 90% of its codebase with the commercial Alfresco Platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Actively maintained with regular releases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Full self-hosted control over data and deployment$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$No official vendor support or SLA — community support only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Requires technical expertise to deploy, configure, and maintain$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Lacks some enterprise-only governance and AI features available in the paid Alfresco Platform$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Is Alfresco Community Edition still maintained?$q$, $q$Yes. It receives regular releases, including version 26.1 in March 2026.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$What license does it use?$q$, $q$Alfresco Community Edition is licensed under LGPLv3.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$How is it different from the paid Alfresco Platform?$q$, $q$It shares most of the same core codebase but lacks official vendor support and some enterprise governance and AI features found in the commercial Enterprise edition.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Where can I download it?$q$, $q$Through official Alfresco/Hyland community channels, as well as mirrors on SourceForge and GitHub.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Free, self-hosted ECM evaluation$q$, $q$Evaluate or build on a full-featured content management system without licensing cost.$q$, $q$Developers and small IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$Cost-conscious document management$q$, $q$Run enterprise-grade content management without paying for commercial licensing.$q$, $q$SMBs and open-source-first organizations$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '2fed864f-8761-4cf7-88e9-e53eb76e2f42';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Alfresco Community Edition is the free, open-source version of the Alfresco content services platform, tracing back to Alfresco Software's founding in 2005 and now maintained under Hyland, which acquired Alfresco in 2020. It is licensed under LGPLv3 and shares more than 90% of its codebase with the paid Alfresco Enterprise Platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Community Edition provides a document/content repository with web-based access across devices, and open APIs for building custom integrations and extensions. Because it shares the majority of its code with the commercial Enterprise edition, it offers much of the same core content management functionality.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$pricing-overview$q$, $q$Pricing & Support$q$, 2, ARRAY[$q$Alfresco Community Edition is free to download and use, with no license fees. However, it does not include official vendor support or an SLA — users rely on community resources, documentation, and forums instead of Hyland's commercial support channels.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', $q$development-history$q$, $q$Ongoing Development$q$, 2, ARRAY[$q$The project remains actively maintained with regular numbered releases. Recent versions include 25.1 (March 2025), 25.2 (July 2025), 25.3 (November 2025), and 26.1 (March 2026), each including security fixes, stability improvements, and platform updates.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2fed864f-8761-4cf7-88e9-e53eb76e2f42', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Algolia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Algolia is an AI-powered search and discovery platform (API/SaaS) that helps websites and apps deliver fast, relevant search, recommendations, and personalization.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$800-1,000 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Portuguese$q$, $q$Spanish$q$, $q$Italian$q$]::text[],
  seo_title = COALESCE($q$Algolia: AI-Powered Search & Discovery API$q$, seo_title),
  seo_meta_description = COALESCE($q$Algolia provides AI-powered search, recommendations, and personalization APIs for websites and apps, with a free tier and usage-based pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Algolia is an AI-powered search and discovery platform founded in 2012 by Nicolas Dessaigne and Julien Lemoine, headquartered in San Francisco with additional offices in Paris, London, New York, Bucharest, and Sydney. It provides search-as-a-service APIs and tools that let websites and applications deliver fast, typo-tolerant, relevant search, along with recommendations and personalization based on user behavior. The platform runs on infrastructure spanning more than 70 data centers across 17 regions and serves over 18,000 customers in more than 150 countries. Product capabilities include Agent Studio for building AI agents, generative and RAG-powered conversational search experiences, an analytics dashboard, and data enrichment/transformation tools, along with pre-built connectors for platforms like Shopify, Adobe, Salesforce, AWS, and Microsoft. Pricing follows a usage-based freemium model: the free Build plan includes 10,000 search requests and 1 million records per month; the Grow plan charges $0.50 per additional 1,000 search requests beyond the free quota; Grow Plus charges $1.75 per additional 1,000 requests and adds AI Synonyms, AI Ranking, and advanced personalization; and the Elevate tier is a custom annual contract with features like NeuralSearch, real-time personalization, and a 99.99% availability SLA. Algolia has been named a Leader in Gartner's Magic Quadrant for Search and Product Discovery for three consecutive years, and it primarily serves ecommerce, SaaS, media, and enterprise engineering teams building search-driven digital experiences.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1da597ed-cb15-440d-b621-139ce7ffa976';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1da597ed-cb15-440d-b621-139ce7ffa976' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$AI-driven search$q$, $q$Fast, typo-tolerant, relevance-ranked search results.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Recommendations engine$q$, $q$Behavioral analytics power personalized product and content recommendations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Personalization$q$, $q$Customize search and browse experiences per user.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Agent Studio$q$, $q$Build and deploy AI agents on top of Algolia's search infrastructure.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Generative/RAG search$q$, $q$Conversational search experiences powered by retrieval-augmented generation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Analytics dashboard$q$, $q$Unified insights into search performance and user behavior.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Pre-built connectors$q$, $q$Integrations with Shopify, Adobe, Salesforce, AWS, Microsoft, and more.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Fast, reliable search infrastructure across 70+ data centers in 17 regions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Generous free tier for development and small projects$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Strong ecommerce and SaaS integration ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Recognized as a Gartner Magic Quadrant Leader for Search and Product Discovery multiple years running$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Usage-based pricing can become costly at high query or record volumes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Advanced AI features (AI Synonyms, NeuralSearch) are concentrated in higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Elevate tier requires an annual contract and custom pricing negotiation$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Does Algolia have a free plan?$q$, $q$Yes, the Build plan is free and includes 10,000 search requests and 1 million records per month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Who founded Algolia?$q$, $q$Nicolas Dessaigne and Julien Lemoine founded Algolia in 2012.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Is Algolia usage-based?$q$, $q$Yes, paid plans (Grow and Grow Plus) charge per additional search request and record beyond the included free quota.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$What platforms does Algolia integrate with?$q$, $q$Pre-built connectors are available for Shopify, Adobe, Salesforce, AWS, Microsoft, commercetools, and others.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Ecommerce product search$q$, $q$Power fast, relevant product search and recommendations on ecommerce sites.$q$, $q$Ecommerce teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$In-app and documentation search$q$, $q$Add fast search to SaaS products or documentation sites.$q$, $q$Developers and product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Enterprise RAG search$q$, $q$Build retrieval-augmented, conversational search experiences at enterprise scale.$q$, $q$Enterprise engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Build$q$, $q$Free$q$, $q$monthly$q$, NULL, $q$["10,000 search requests/month","1M records","10,000 AI Recommendation requests/month","10,000 crawls/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Grow$q$, $q$$0.50 per additional 1,000 search requests beyond 10K free; $0.40 per additional 1,000 records beyond 100K$q$, $q$monthly, no contract$q$, NULL, $q$["Keyword search and browse","Query suggestions","10 rules per index","Manual synonyms","30-day analytics retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Grow Plus$q$, $q$$1.75 per additional 1,000 search requests beyond 10K free; $0.40 per additional 1,000 records beyond 100K$q$, $q$monthly, no contract$q$, NULL, $q$["Everything in Grow","10,000 rules per index","AI Synonyms and AI Ranking","Advanced personalization","90-day analytics retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$Elevate$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["NeuralSearch","AI Collections and Smart Groups","Real-time personalization","99.99% availability SLA","SSO and enhanced support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '1da597ed-cb15-440d-b621-139ce7ffa976';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Algolia is an AI-powered search and discovery platform founded in 2012 by Nicolas Dessaigne and Julien Lemoine, headquartered in San Francisco with offices in Paris, London, New York, Bucharest, and Sydney. It offers search-as-a-service APIs that help websites and applications deliver fast, relevant search experiences, serving over 18,000 customers in more than 150 countries on infrastructure spanning 70+ data centers across 17 regions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core capabilities include AI-driven search and retrieval, a behavioral recommendations engine, and personalization tools. Agent Studio enables teams to build and deploy AI agents, while generative and RAG-powered features support conversational search experiences. Algolia also provides a unified analytics dashboard, data enrichment and transformation tools, and pre-built connectors for platforms such as Shopify, Adobe, Salesforce, AWS, and Microsoft.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Algolia uses a usage-based freemium model. The free Build plan includes 10,000 search requests and 1 million records per month. The Grow plan charges $0.50 per additional 1,000 search requests and $0.40 per additional 1,000 records beyond included quotas, with no contract required. Grow Plus charges $1.75 per additional 1,000 search requests and adds AI Synonyms, AI Ranking, and advanced personalization. The Elevate tier requires an annual contract with custom pricing and adds NeuralSearch, real-time personalization, and a 99.99% availability SLA.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Algolia is used by ecommerce businesses, SaaS companies, media and documentation platforms, B2B commerce enterprises, and higher education institutions to power in-app or on-site search, recommendations, and personalization.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1da597ed-cb15-440d-b621-139ce7ffa976', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Alitu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Alitu is an all-in-one podcast production platform for recording, AI-assisted editing, hosting, and publishing, built by the team behind The Podcast Host.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$38/month$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Alitu: All-in-One Podcast Production Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Alitu simplifies podcast recording, AI-assisted editing, hosting, and publishing in one platform, starting at $38/month with a 7-day free trial.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Alitu is an all-in-one podcast production platform built by the team behind The Podcast Host, aimed at non-technical creators who want to produce and publish episodes without deep audio-editing skills. It bundles a built-in recorder for calls and interviews (or file upload), transcript-based AI-assisted editing with automatic noise removal, volume leveling, and voice enhancement ('Magic Filters' that strip out filler words and silence), a royalty-free music library, and one-click publishing to Apple Podcasts and Spotify. It also includes free podcast hosting for up to 1,000 downloads per month (additional hosting is $10/month for up to 10,000 downloads), a free podcast website builder, AI-generated show notes, and transcripts available in 17 languages. The core Standard plan costs $38/month, or $32/month billed annually, with no long-term contract and a 30-day money-back guarantee after the first charge; a 7-day free trial with 2 hours of audio processing is available. A separate 'Fully Hands-Off Editing' add-on service costs $295/month (with the first month at $1) for organizers who want a human editor handling weekly or fortnightly turnaround. A multi-show discount brings two shows to $63/month combined. Alitu is best suited for independent or business podcasters who want an integrated, low-friction recording-to-publishing workflow rather than assembling separate recording, editing, and hosting tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Built-in recorder$q$, $q$Record calls and interviews directly, or upload existing audio/video files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$AI-assisted editing$q$, $q$Transcript-based editing with automatic noise removal, leveling, and voice enhancement.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Magic Filters$q$, $q$Automatically strips filler words and silence from recordings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$One-click publishing$q$, $q$Publish episodes directly to Apple Podcasts and Spotify.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Free hosting and website$q$, $q$Includes podcast hosting up to 1,000 downloads/month and a free podcast website.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$AI show notes and transcripts$q$, $q$AI-generated show notes and transcripts available in 17 languages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Episode scheduling and analytics$q$, $q$Schedule releases in advance and track downloads and listener location.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Beginner-friendly with minimal technical setup required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Bundles recording, editing, hosting, and website in one subscription$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$AI-assisted editing speeds up production significantly$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$No long-term contract, plus a 30-day money-back guarantee$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$$38/month starting price is higher than some standalone hosting-only tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$The fully hands-off human editing add-on is expensive at $295/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$May lack the depth of control that advanced/professional audio engineers need$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Is there a free trial for Alitu?$q$, $q$Yes, a 7-day free trial with 2 hours of audio processing is available.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Does Alitu include podcast hosting?$q$, $q$Yes, free hosting is included for up to 1,000 downloads/month, with additional hosting at $10/month for up to 10,000 downloads.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Who makes Alitu?$q$, $q$Alitu is built by the team behind The Podcast Host.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Can I cancel Alitu anytime?$q$, $q$Yes, there's no long-term contract, and Alitu offers a 30-day money-back guarantee after the first charge.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Independent podcast production$q$, $q$Record, edit, and publish episodes end-to-end without separate tools or an audio editor.$q$, $q$Solo and non-technical podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Multi-show podcast management$q$, $q$Run more than one show under a discounted combined plan.$q$, $q$Small podcast networks and businesses$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Standard$q$, $q$$38/month ($32/month billed annually)$q$, $q$monthly or annual$q$, NULL, $q$["Recording, AI editing, hosting up to 1,000 downloads/month","Free podcast website","AI-generated show notes","Transcripts in 17 languages"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Additional Hosting$q$, $q$$10/month$q$, $q$monthly$q$, NULL, $q$["Hosting up to 10,000 downloads/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$Fully Hands-Off Editing$q$, $q$$295/month (first month $1)$q$, $q$monthly$q$, NULL, $q$["Weekly or fortnightly turnaround","Human editor handles episode editing","Includes all Standard features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$2 Shows$q$, $q$$63/month combined$q$, $q$monthly$q$, NULL, $q$["Multi-show discount versus running two separate Standard plans"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '1273dc8b-9d1c-4cf2-8d57-e63805eee23b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Alitu is an all-in-one podcast production platform created by the team behind The Podcast Host, designed to let non-technical creators record, edit, host, and publish podcast episodes from a single tool rather than juggling separate recording, editing, and hosting software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Alitu includes a built-in recorder for calls and interviews (or file upload), AI-assisted, transcript-based editing with automatic noise removal, volume leveling, and voice enhancement, plus 'Magic Filters' that strip filler words and silence. It offers one-click publishing to Apple Podcasts and Spotify, a royalty-free music library, AI-generated show notes, and transcripts in 17 languages, along with a free podcast website builder and episode scheduling.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$The Standard plan costs $38/month, or $32/month billed annually, and includes free hosting for up to 1,000 downloads/month (additional hosting is $10/month for up to 10,000 downloads). A 7-day free trial with 2 hours of audio processing is available, along with a 30-day money-back guarantee and no long-term contract. A separate 'Fully Hands-Off Editing' service costs $295/month (first month $1) for hands-off human editing, and running two shows together costs $63/month combined.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Alitu targets non-technical, independent podcasters across business, education, community, and entertainment shows, as well as small teams or networks running multiple shows who want an integrated recording-to-publishing workflow without hiring a dedicated audio editor.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1273dc8b-9d1c-4cf2-8d57-e63805eee23b', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;


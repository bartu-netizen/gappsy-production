-- Enrichment marathon batch: Answer, Ant Media Server, Antville, Anubis, AnyCable, Anyscale, AnythingLLM, Anytype

-- ── Answer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apache Answer is a free, open-source Q&A platform for building community forums, help centers, and knowledge bases, governed by the Apache Software Foundation.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$Chinese (Simplified)$q$]::text[],
  seo_title = COALESCE($q$Apache Answer: Free Open-Source Q&A Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Apache Answer is a free, open-source Q&A platform for communities and knowledge bases, governed by the Apache Software Foundation. Self-host it for free.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apache Answer is a free, open-source question-and-answer platform used to build community forums, developer help centers, and structured knowledge bases. It originated in 2022 when SegmentFault (a Chinese developer Q&A community operating under ONES.com) open-sourced its Answer software, entered the Apache Incubator in October 2023, and graduated to a Top-Level Apache Software Foundation project in December 2024. It is released under the Apache License 2.0 and is maintained by a community of contributors rather than a single vendor. Functionally, Apache Answer resembles Stack Overflow: users post questions, submit answers, vote on content, and earn reputation points and badges for participation. It includes a tagging system for organizing content, built-in search, user profiles, and a plugin architecture that lets administrators extend functionality such as login providers or notification integrations. The interface has been translated into multiple languages, including English and Simplified Chinese, by the contributor community. There is no official managed hosting offering, so Apache Answer must be self-hosted, typically via Docker. It suits engineering teams, open-source projects, and companies that want a branded, self-hosted Q&A community or internal knowledge base without recurring SaaS subscription costs, and that have the technical capacity to deploy and operate a self-hosted web application.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b5cba06-a001-4209-a582-cc94a5c108b0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b5cba06-a001-4209-a582-cc94a5c108b0' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Q&A with voting$q$, $q$Users ask questions, post answers, and upvote or downvote content to surface the best responses.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Reputation and badges$q$, $q$A gamification system awards reputation points and badges for helpful contributions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Tagging and search$q$, $q$Content is organized with tags and discoverable through built-in search.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Plugin architecture$q$, $q$Administrators can extend the platform with plugins, such as login providers or notification integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Multi-language interface$q$, $q$Community-translated into multiple languages, including English and Simplified Chinese.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Self-hostable$q$, $q$Deployable via Docker on your own infrastructure, giving full control over data and branding.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Completely free and open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Backed by Apache Software Foundation governance for long-term project stability$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Extensible via a plugin system$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Active development with regular releases and community translations$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$No official managed/hosted version — requires self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Smaller plugin and integration ecosystem than commercial alternatives like Discourse or Zendesk$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Requires technical capacity to deploy, configure, and maintain$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Is Apache Answer free to use?$q$, $q$Yes. Apache Answer is free and open source under the Apache License 2.0, with no licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Who maintains Apache Answer?$q$, $q$It is maintained by a community of contributors under the governance of the Apache Software Foundation, having originated from SegmentFault's Answer project.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Can I self-host Apache Answer?$q$, $q$Yes, it is designed to be self-hosted, typically deployed via Docker on your own server or cloud infrastructure.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Does Apache Answer support languages other than English?$q$, $q$Yes, the community has translated the interface into multiple languages, including Simplified Chinese.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Community Q&A site$q$, $q$Run a public Stack Overflow-style question-and-answer community around a product, technology, or topic.$q$, $q$Open-source projects and online communities$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Internal knowledge base$q$, $q$Host a self-managed Q&A knowledge base for internal support and documentation.$q$, $q$Engineering and support teams$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full source code access","Apache License 2.0","Community support","Plugin extensibility"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '6b5cba06-a001-4209-a582-cc94a5c108b0';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache Answer is an open-source Q&A platform for creating community discussion sites, developer help centers, and internal knowledge bases. It was open-sourced in 2022 by the team behind SegmentFault, China's largest developer Q&A community, then donated to the Apache Software Foundation, entering the Apache Incubator in October 2023 and graduating to a Top-Level Project in December 2024.$q$, $q$The software is released under the Apache License 2.0 and is developed openly by a global community of contributors under ASF governance, rather than by a single commercial vendor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Apache Answer follows the familiar Stack Overflow-style model: members post questions, submit answers, and vote content up or down, with a reputation and badge system that rewards active participation. Content is organized with a tagging system and surfaced through built-in search.$q$, $q$A plugin system allows administrators to extend the platform, for example by adding authentication connectors or notification channels, and the interface has been translated into multiple languages by contributors, including English and Simplified Chinese.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', $q$development-history$q$, $q$Development History$q$, 2, ARRAY[$q$Answer was initiated internally in June 2022 by the SegmentFault team and publicly open-sourced that October. After entering Apache Incubator in October 2023, the project shipped multiple Apache releases, translations, and community contributions before graduating as an Apache Top-Level Project in December 2024, giving it long-term foundation-backed governance.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b5cba06-a001-4209-a582-cc94a5c108b0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Ant Media Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ant Media Server is a live video streaming engine offering ultra-low-latency WebRTC, HLS, and SRT streaming, with a free open-source Community Edition and a paid Enterprise Edition.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Community Edition)$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$New York, NY, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ant Media Server: Ultra-Low-Latency Streaming$q$, seo_title),
  seo_meta_description = COALESCE($q$Ant Media Server delivers ultra-low-latency WebRTC, HLS, and SRT live streaming. Free open-source Community Edition; paid Enterprise Edition available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ant Media Server is a live video streaming engine built by Ant Media, a company founded in 2017 and headquartered in New York. It provides ultra-low-latency streaming using WebRTC alongside support for RTMP, RTSP, SRT, WHIP/WHEP, LL-HLS, DASH, and CMAF, making it suitable for interactive video applications such as live broadcasting, video conferencing, and OTT/streaming platforms. The software ships in two editions: a free, Apache-licensed Community Edition with core streaming functionality, and a paid Enterprise Edition that adds features like clustering and auto-scaling, adaptive bitrate streaming, recording, and a REST API for platform integration. Ant Media Server can be self-hosted on-premise or deployed through public cloud marketplace images on AWS, Azure, and Google Cloud, and Enterprise licensing is available on hourly, monthly, annual, or perpetual terms alongside a free trial. The product is aimed at developers and businesses building real-time video products — including live event broadcasting, telehealth, education, and social/live-streaming apps — who need low-latency delivery at scale without building a streaming stack from scratch. Because the Enterprise Edition is a commercial, per-instance licensed product, pricing details and advanced clustering features are gated behind a paid tier, while the Community Edition remains free for smaller or self-managed deployments.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2d8087e6-e022-4b9c-9760-d491836887d8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2d8087e6-e022-4b9c-9760-d491836887d8' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Ultra-low-latency WebRTC streaming$q$, $q$Delivers sub-second latency live video using WebRTC alongside traditional protocols.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Multi-protocol support$q$, $q$Supports RTMP, RTSP, SRT, WHIP/WHEP, LL-HLS, DASH, CMAF, and Zixi ingest/output.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Auto-scaling clustering$q$, $q$Enterprise Edition can auto-scale across on-premise or cloud infrastructure to handle large audiences.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Cloud marketplace deployment$q$, $q$Available as ready-to-launch images on AWS, Azure, and Google Cloud marketplaces.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Recording and playback$q$, $q$Supports recording live streams for later on-demand playback.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$REST API$q$, $q$Provides an API for integrating streaming functionality into custom applications.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Free, open-source Community Edition available under Apache license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Sub-second latency streaming via WebRTC$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Flexible deployment: on-premise, cloud marketplace, or hybrid$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Broad protocol support for ingest and delivery$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Advanced features like clustering and auto-scaling require the paid Enterprise Edition$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Self-hosting requires server administration and streaming infrastructure expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Full Enterprise pricing requires contacting sales for custom deployments$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Is Ant Media Server free?$q$, $q$The Community Edition is free and open source under the Apache license, but the Enterprise Edition with advanced features is a paid, licensed product.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$What protocols does Ant Media Server support?$q$, $q$It supports WebRTC, RTMP, RTSP, SRT, WHIP/WHEP, LL-HLS, DASH, CMAF, and Zixi.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Can Ant Media Server be self-hosted?$q$, $q$Yes, it can be deployed on-premise or via marketplace images on AWS, Azure, and Google Cloud.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Who makes Ant Media Server?$q$, $q$It is developed by Ant Media, a company founded in 2017 and headquartered in New York.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Live event broadcasting$q$, $q$Stream live events to large audiences with low latency.$q$, $q$Broadcasters and event platforms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Video conferencing and interactive apps$q$, $q$Build real-time, interactive video experiences such as conferencing or live shopping.$q$, $q$Developers building interactive video products$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$OTT and streaming platforms$q$, $q$Deliver adaptive-bitrate video-on-demand and live channels at scale.$q$, $q$Media and OTT companies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Community Edition$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Core WebRTC/RTMP streaming","Self-hosted","Apache licensed"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$Enterprise Edition$q$, $q$From approximately $109/month$q$, $q$Hourly, monthly, annual, or perpetual license$q$, NULL, $q$["Clustering and auto-scaling","Adaptive bitrate","Recording and playback","REST API","Priority support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '2d8087e6-e022-4b9c-9760-d491836887d8';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ant Media Server is a self-hosted or cloud-deployed live video streaming engine focused on ultra-low-latency delivery via WebRTC. Built by Ant Media, founded in 2017 and headquartered in New York, it targets developers building interactive video products such as live broadcasting, video conferencing, and OTT streaming services.$q$, $q$The software is distributed as a free, open-source Community Edition (Apache-licensed) and a paid Enterprise Edition that adds clustering, auto-scaling, and additional protocol/feature support for production-scale deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ant Media Server supports a broad range of streaming protocols, including WebRTC, RTMP, RTSP, SRT, WHIP/WHEP, LL-HLS, DASH, CMAF, and Zixi, letting developers ingest and deliver video across formats. Enterprise deployments support auto-scaling clusters for handling large concurrent viewer counts, adaptive bitrate streaming, recording and playback, and a REST API for integrating streaming into custom applications.$q$, $q$It can be deployed on-premise or through official marketplace images on AWS, Azure, and Google Cloud.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The Community Edition is free and open source under the Apache license but has a limited feature set. The Enterprise Edition is commercially licensed per instance/server, offered on hourly, monthly, annual, or perpetual terms, with a free self-hosted trial available for evaluation.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d8087e6-e022-4b9c-9760-d491836887d8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Antville ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Antville is a free, open-source multi-user blogging and website hosting platform built on the Helma Object Publisher, running as a community host since 2001.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2001, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_title = COALESCE($q$Antville: Free Open-Source Blog Hosting Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Antville is a free, open-source multi-user blogging platform built on Helma Object Publisher, hosting thousands of community websites since 2001.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Antville is an open-source, multi-user website and blog hosting platform originally created in 2001 by developers Robert Gaggl and Hannes Wallnöfer, built on the Helma Object Publisher, a Java-based web application framework. The flagship instance, antville.org, functions as a free, donation-supported community host and was one of the earliest weblog communities in the German-speaking internet, though it also serves English-language sites. As of 2026, antville.org reports thousands of hosted websites (over 3,400 total, with roughly 1,500 publicly accessible), and the site remains actively used, with new posts and comments appearing regularly. The software itself is free and open source, and technically inclined users can self-host their own Antville instance using the project's Helma-based codebase, which is maintained on the project's own Git hosting service. Antville is best suited to individuals or small communities who want lightweight, no-cost blog or personal-website hosting with a long operating history, rather than users seeking a modern, feature-rich CMS. Because it runs on a niche, decades-old Java framework rather than mainstream web technologies, it has a smaller ecosystem and less contemporary tooling than modern blogging platforms like WordPress or Ghost, but it continues to be maintained and funded through community donations.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Multi-user site hosting$q$, $q$Allows individuals to create and manage their own hosted blog or website on antville.org.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Built on Helma Object Publisher$q$, $q$Runs on a Java-based web application framework forked and maintained by the Antville project.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Self-hostable$q$, $q$The underlying software is open source and can be self-hosted independently of antville.org.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Long-running community$q$, $q$Operating continuously since 2001 with thousands of hosted sites.$q$, 3);

DELETE FROM tool_pros WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Free to use with no signup fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Open source and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Long operating history and established community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Low barrier to entry for simple blogs$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Built on a dated, niche Java framework (Helma) rather than mainstream web technology$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Limited modern CMS features compared to platforms like WordPress or Ghost$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Documentation and community are largely oriented around a German-speaking audience$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Relies on donations, so long-term hosting continuity isn't guaranteed$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Is Antville free to use?$q$, $q$Yes, antville.org offers free, donation-supported hosting for blogs and websites.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Can I self-host Antville?$q$, $q$Yes, the underlying software is open source and can be deployed on your own server.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$When was Antville created?$q$, $q$Antville was created in 2001 by developers Robert Gaggl and Hannes Wallnöfer.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$What technology does Antville run on?$q$, $q$It runs on the Helma Object Publisher, a Java-based web application framework.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Personal blogging$q$, $q$Host a free personal blog on an established community platform.$q$, $q$Individual bloggers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Community website hosting$q$, $q$Run a small community or niche website without hosting costs.$q$, $q$Small online communities$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$Community Hosting$q$, $q$Free (donation-supported)$q$, $q$N/A$q$, NULL, $q$["Hosted blog/website on antville.org","Public or private site visibility","API access"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '06494ee1-ad30-4cee-bd7c-a25eb468d7da';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Antville is an open-source multi-user blogging and website hosting platform created in 2001 by Robert Gaggl and Hannes Wallnöfer, built on the Helma Object Publisher, a Java web application framework. The main instance, antville.org, operates as a free, donation-funded community host and was one of the first weblog communities in the German-speaking internet.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$current-status$q$, $q$Current Status$q$, 2, ARRAY[$q$As of 2026, antville.org lists thousands of hosted websites, with over 1,500 publicly accessible, and continues to see active posting and commenting. The platform is sustained through community donations and remains a functioning, if niche, hosting service more than two decades after launch.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', $q$development-history$q$, $q$Development History$q$, 2, ARRAY[$q$Antville is built on a forked version of the Helma Object Publisher framework, and its source code is maintained on the project's own self-hosted Git service. Because it predates most modern blogging platforms, it reflects an early-2000s architecture and remains a niche, community-maintained project rather than a commercially backed product.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06494ee1-ad30-4cee-bd7c-a25eb468d7da', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Anubis ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Anubis is a free, open-source proof-of-work challenge tool that blocks AI scraper bots and abusive crawlers before they reach a website's origin server.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2025, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Anubis: Open-Source AI Scraper & Bot Protection$q$, seo_title),
  seo_meta_description = COALESCE($q$Anubis is a free, open-source proof-of-work firewall that blocks AI scrapers and bots before they reach your site. MIT licensed, made by Techaro.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Anubis is a free, open-source web firewall created by developer Xe Iaso and released on January 19, 2025, now maintained by Techaro, a Canadian software company. It was built in response to AI companies' web crawlers overwhelming self-hosted infrastructure (originally Xe Iaso's Git server) while ignoring robots.txt restrictions. Anubis works as a reverse proxy placed in front of a website: before a client can reach the backend, it must solve a SHA-256 proof-of-work challenge inspired by Hashcash, which imposes a small computational cost intended to be negligible for typical human visitors but expensive for large-scale automated scraping. The project is MIT licensed, written primarily in Go, and self-hosted; it lets administrators configure bot allow/deny policies to reduce false positives against legitimate crawlers such as search engines. It gained rapid adoption, surpassing 19,000 GitHub stars within about a year of release, as small open-source projects, public infrastructure, and community wikis sought defenses against AI scraper traffic. Beyond the free open-source version, Techaro also offers BotStopper, a corporate-friendly, unbranded variant with custom templating and branding options, made available to GitHub Sponsors contributing at higher tiers. Anubis is best suited for site operators, open-source project maintainers, and small teams who need a lightweight, self-hostable defense against automated scraping without adopting a full commercial bot-management service.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Proof-of-work challenge gate$q$, $q$Requires clients to solve a SHA-256 computational challenge before reaching the protected site.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Configurable bot policies$q$, $q$Administrators can allowlist or block specific bots and crawlers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Reverse proxy deployment$q$, $q$Deploys in front of an existing web service without modifying the backend application.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Custom challenge pages$q$, $q$Supports branding and customization of the challenge/error pages shown to visitors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Open source (MIT licensed)$q$, $q$Fully open-source and self-hostable, with source code on GitHub.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$BotStopper commercial variant$q$, $q$An unbranded, enterprise-friendly version available to GitHub Sponsors at higher tiers.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Lightweight and effective against large-scale AI scraper traffic per widespread community adoption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Easy to self-host as a reverse proxy in front of existing infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Configurable to reduce false positives against legitimate crawlers$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Proof-of-work challenges can add friction or block legitimate automated tools, such as archival crawlers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Requires reverse-proxy setup and some technical familiarity to deploy correctly$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$BotStopper's commercial pricing isn't published as a standard price list$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Is Anubis free to use?$q$, $q$Yes, the core Anubis software is free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$What does Anubis protect against?$q$, $q$It protects websites from AI scraper bots and abusive automated crawlers using proof-of-work challenges.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Who makes Anubis?$q$, $q$It was created by developer Xe Iaso and is now maintained by Techaro, a Canadian company.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Is there a paid version of Anubis?$q$, $q$Techaro offers BotStopper, an unbranded commercial variant, available to GitHub Sponsors at higher contribution tiers.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Protecting self-hosted infrastructure$q$, $q$Shield Git servers, wikis, and forums from AI scraper overload.$q$, $q$Open-source project maintainers and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Small community sites$q$, $q$Give small sites and communities a lightweight bot defense without commercial bot-management services.$q$, $q$Small teams and community operators$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Self-hosted","MIT licensed","Community support via GitHub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$BotStopper (GitHub Sponsors)$q$, $q$Available at higher GitHub Sponsors tiers$q$, $q$Monthly$q$, NULL, $q$["Unbranded challenge pages","Custom templating","Corporate-friendly deployment"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anubis is an open-source proof-of-work firewall that protects websites from AI scraper bots and abusive automated crawlers. It was created by developer Xe Iaso and released on January 19, 2025, after an Amazon web crawler overwhelmed their self-hosted Git server while ignoring robots.txt. The project is now maintained by Techaro, a Canadian company.$q$, $q$Anubis sits as a reverse proxy in front of a web service, forcing incoming clients to solve a SHA-256 proof-of-work challenge, inspired by Hashcash, before reaching the origin server.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The core challenge mechanism imposes a small computational cost on each client, intended to be imperceptible for normal browsing but costly at the scale automated scrapers operate. Administrators can configure bot allow/deny policies to whitelist legitimate crawlers, such as search engines, and customize challenge pages. Anubis is released under the MIT license and is written primarily in Go.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The core Anubis software is free and open source. Techaro also offers BotStopper, an unbranded, corporate-friendly variant with custom branding and templating support, distributed as a Docker image and made available to GitHub Sponsors at higher contribution tiers rather than through a standard published price list.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7c6ea2e-65ac-40a4-81a3-fc77e0f7c752', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── AnyCable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AnyCable is a real-time WebSocket server with delivery guarantees, presence tracking, and message ordering, integrating with Rails, Laravel, Node.js, and other backends.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$Free (open source); Pro from $1,490/year$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AnyCable: Real-Time WebSocket Server$q$, seo_title),
  seo_meta_description = COALESCE($q$AnyCable is a real-time WebSocket server with delivery guarantees for Rails, Laravel, and Node.js apps. Open source, with a $1,490/year Pro tier.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AnyCable is a real-time communication server that handles WebSocket connections with delivery guarantees, presence tracking, and message ordering, designed to run as a standalone process alongside an existing application backend. Created by Vladimir Dementyev and developed by Evil Martians, it has been open source since 2017 and is used in production by more than 50 companies. AnyCable automatically recovers missed messages after connectivity interruptions and maintains connections during application deployments, and it can handle over 10,000 concurrent connections per server with low memory overhead. It supports multiple application frameworks, including Ruby on Rails (with native Hotwire/Turbo support), Laravel, Node.js, and Python, as well as any backend via its HTTP API, and it uses an embedded NATS pub/sub layer so it requires no extra infrastructure components beyond the HTTP API. The open-source edition includes Hotwire support, JWT authentication, and Prometheus/StatsD instrumentation for free. A commercial Pro tier, priced at $1,490 per year with a two-month free trial, unlocks unlimited instances, cluster-mode consistency guarantees, slow-drain shutdown behavior, and binary compression; a managed hosted offering and hourly consulting ($200/hour) for setup, deployment, and load testing are also available. AnyCable suits engineering teams building real-time features — chat, notifications, live updates — who need a scalable, framework-agnostic WebSocket layer, particularly Rails and Hotwire applications replacing Action Cable in production.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Delivery guarantees$q$, $q$Automatically recovers missed messages after connectivity interruptions and preserves connections through deploys.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$High connection capacity$q$, $q$Handles 10,000+ concurrent connections per server with low memory overhead.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Multi-framework support$q$, $q$Integrates with Rails/Hotwire, Laravel, Node.js, Python, and any backend via HTTP API.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Embedded pub/sub$q$, $q$Ships with an embedded NATS layer, avoiding the need for extra infrastructure components.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$On-premise deployment$q$, $q$Can be deployed on-premise for compliance needs such as HIPAA.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Built-in observability$q$, $q$Includes Prometheus and StatsD instrumentation for monitoring.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Handles high connection concurrency efficiently$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Framework-agnostic, working with Rails, Laravel, Node.js, and more$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Strong delivery-guarantee and reconnection handling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Actively maintained by Evil Martians, a known developer studio$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Pro features (unlimited instances, cluster consistency) require a paid $1,490/year license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Adds a separate server process to operate, increasing infrastructure complexity$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Documentation and community are most mature for the Ruby/Rails ecosystem$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Is AnyCable free?$q$, $q$The open-source edition is free and includes core features like Hotwire support and JWT authentication. A paid Pro tier ($1,490/year) adds enterprise features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$What frameworks does AnyCable support?$q$, $q$It supports Rails, Laravel, Node.js, Python, and any backend that can use its HTTP API.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$How many connections can AnyCable handle?$q$, $q$A single AnyCable server can handle over 10,000 concurrent connections with low memory overhead.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Who built AnyCable?$q$, $q$It was created by Vladimir Dementyev and is developed by Evil Martians, open source since 2017.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Real-time notifications$q$, $q$Push live notifications and updates to users in Rails/Hotwire or other web apps.$q$, $q$Web application engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Replacing Action Cable at scale$q$, $q$Swap in AnyCable as a more scalable, production-grade WebSocket server for Rails apps.$q$, $q$Rails developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Chat and live collaboration$q$, $q$Power chat, presence, and collaborative features requiring reliable message delivery.$q$, $q$SaaS product teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Hotwire support","JWT authentication","Prometheus/StatsD instrumentation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Pro$q$, $q$$1,490/year$q$, $q$Annual$q$, NULL, $q$["Unlimited instances","Cluster-mode consistency","Slow drain on shutdown","Binary compression","2-month free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$Consulting$q$, $q$$200/hour$q$, $q$Hourly$q$, NULL, $q$["Setup and deployment support","Load testing"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'a457e2a0-cf21-4282-b4c7-bfaec9f56dc1';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AnyCable is a real-time WebSocket server that runs alongside an application's backend to handle long-lived connections at scale. It was created by Vladimir Dementyev and has been developed as open source by Evil Martians since 2017, with production use at more than 50 companies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AnyCable provides delivery guarantees, automatically recovering missed messages after network interruptions and preserving connections through application deployments. It handles over 10,000 concurrent connections per server with low memory overhead, and integrates with Rails (including native Hotwire/Turbo support), Laravel, Node.js, and Python, or any backend via HTTP API. It uses an embedded NATS pub/sub layer, requiring no additional infrastructure beyond the HTTP API.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The open-source edition is free and includes Hotwire support, JWT authentication, and Prometheus/StatsD instrumentation. A Pro plan costs $1,490 per year (with a two-month free trial) and adds unlimited instances, cluster-mode consistency, slow-drain shutdown, and binary compression. A managed hosted offering is also in development, and consulting for setup, deployment, and load testing is billed at $200 per hour.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a457e2a0-cf21-4282-b4c7-bfaec9f56dc1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Anyscale ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Anyscale is a managed platform built on the open-source Ray framework for running distributed AI training, data processing, and inference workloads at scale.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$Pay-as-you-go, from about $0.0135/hour (CPU); $100 free credit for new users$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Anyscale: Managed Platform for Ray & AI Scaling$q$, seo_title),
  seo_meta_description = COALESCE($q$Anyscale is a managed platform for distributed AI training and data processing, built on Ray. Usage-based pricing with a $100 free credit to start.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Anyscale is a managed compute platform for running distributed AI and data-intensive workloads, built on Ray, the open-source distributed computing framework created by the same founding team. The company was founded in 2019 by Ion Stoica, Michael I. Jordan, Philipp Moritz, and Robert Nishihara, and is headquartered in San Francisco, California. Anyscale is aimed at foundation model builders and AI/ML engineering teams that need to run distributed training, multimodal data curation (video, image, text, audio), batch embedding generation, and post-training optimization without manually managing GPU clusters. Its platform orchestrates training across GPU clusters with elastic scaling, provides multi-cloud support to run identical code across AWS, GCP, and Azure, and pools GPU resources dynamically across teams. Enterprise-oriented features include SSO, SAML, SCIM, and audit logging. Pricing is usage-based: customers pay for the compute they consume, with rates such as roughly $0.0135/hour for CPU instances and several dollars per hour for higher-end GPUs like the A100, plus volume-discounted committed contracts for larger workloads. New users receive $100 in credits. Anyscale offers both a Hosted deployment (limited regions, business-hours support) and a Bring-Your-Own-Cloud option supporting any cloud, region, or on-prem environment with 24/7 enterprise SLAs. The underlying Ray framework has over 500 million downloads and 41,000+ GitHub stars, reflecting broad adoption in the open-source AI community. Anyscale is best suited for organizations running large-scale model training or inference who want Ray's distributed-computing benefits without operating the infrastructure themselves.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be678c6c-acd6-4ec2-a468-efd166188d17';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be678c6c-acd6-4ec2-a468-efd166188d17' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Distributed training orchestration$q$, $q$Runs model training across GPU clusters with elastic scaling.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Multimodal data pipelines$q$, $q$Processes and curates video, image, text, and audio data at scale.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Batch embedding generation$q$, $q$Generates embeddings at scale for search and retrieval applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Multi-cloud orchestration$q$, $q$Runs identical code across AWS, GCP, and Azure.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$GPU pooling$q$, $q$Dynamically shares GPU resources across teams and workloads.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Enterprise security and governance$q$, $q$Includes SSO, SAML, SCIM, and audit logging.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Built on Ray, a widely-adopted open-source distributed computing framework$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Flexible deployment via Hosted or Bring-Your-Own-Cloud options$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Usage-based pricing avoids fixed monthly fees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Enterprise-grade security and governance features$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Primarily targets large-scale AI/ML teams, with a learning curve for smaller teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$GPU compute costs can become significant at scale$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Hosted plan is limited to select regions with business-hours-only support$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$What is Anyscale built on?$q$, $q$Anyscale is built on Ray, the open-source distributed computing framework created by Anyscale's founders.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$How is Anyscale priced?$q$, $q$Anyscale uses usage-based, pay-as-you-go pricing for compute, with volume-discounted committed contracts also available. New users get $100 in credits.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Who founded Anyscale?$q$, $q$Anyscale was founded in 2019 by Ion Stoica, Michael I. Jordan, Philipp Moritz, and Robert Nishihara.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Can Anyscale run on my own cloud infrastructure?$q$, $q$Yes, its Bring-Your-Own-Cloud (BYOC) option supports deployment on any cloud, region, or on-prem environment.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Large-scale model training$q$, $q$Train and fine-tune large models across distributed GPU clusters.$q$, $q$AI/ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Batch inference and embeddings$q$, $q$Generate embeddings and run batch inference at scale for search and retrieval.$q$, $q$Data and ML infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Enterprise AI infrastructure$q$, $q$Standardize distributed AI compute across multiple clouds with enterprise governance controls.$q$, $q$Enterprises building foundation models$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Hosted$q$, $q$Pay-as-you-go from ~$0.0135/hour (CPU)$q$, $q$Usage-based$q$, NULL, $q$["Limited regions","VM deployment","Business-hours support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Bring Your Own Cloud (BYOC)$q$, $q$Usage-based$q$, $q$Usage-based$q$, NULL, $q$["Any cloud, region, or on-prem","VM or Kubernetes deployment","24/7 enterprise SLAs"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$Committed Contracts$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Volume discounts","GPU reservation options"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'be678c6c-acd6-4ec2-a468-efd166188d17';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anyscale is a managed platform for building and scaling data-intensive AI workloads, built on Ray, the open-source distributed computing framework. The company was founded in 2019 by Ray's original creators — Ion Stoica, Michael I. Jordan, Philipp Moritz, and Robert Nishihara — and is headquartered in San Francisco, California.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform orchestrates distributed model training across GPU clusters with elastic scaling, and provides pipelines for preparing multimodal data (video, image, text, audio) and generating embeddings at scale for search and retrieval. It supports multi-cloud orchestration across AWS, GCP, and Azure, and pools GPU resources dynamically across teams, with SSO, SAML, SCIM, and audit logging for enterprise governance.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Anyscale uses usage-based, pay-as-you-go pricing with no fixed monthly fee, charging for compute consumed — for example, roughly $0.0135/hour for CPU-only instances up to several dollars per hour for high-end GPUs like the A100. Volume-discounted committed contracts are available for larger commitments, and new customers receive $100 in credits. Deployment is offered either as a limited-region Hosted service or as Bring-Your-Own-Cloud (BYOC) with 24/7 enterprise SLAs across any cloud, region, or on-prem environment.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be678c6c-acd6-4ec2-a468-efd166188d17', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── AnythingLLM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AnythingLLM is an open-source, local-first AI application for chatting with documents and running AI agents privately and offline, made by Mintplex Labs.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (desktop/self-hosted); Cloud from $50/month$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AnythingLLM: Chat With Docs & AI Agents, Privately$q$, seo_title),
  seo_meta_description = COALESCE($q$AnythingLLM is an open-source, local-first app to chat with documents and run AI agents offline. Free desktop app; cloud plans start at $50/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AnythingLLM is an open-source AI application, created by Mintplex Labs (founded in 2022 and part of Y Combinator's Summer 2022 batch), that lets users chat with their own documents and run AI agents locally and offline. It is designed as a privacy-focused alternative to purely cloud-based AI assistants: the free desktop app requires no account and can run entirely on-device, keeping data local by default. AnythingLLM supports processing documents such as PDFs, Word files, CSVs, and codebases, and integrates with custom or enterprise LLM providers, including OpenAI, Azure, and AWS, as well as locally-run models, giving users flexibility in where their data and inference happen. Additional capabilities include multi-modal support for text, images, and audio, a built-in developer API, a community hub for extensions, and one-click LLM installation. The software is MIT licensed and open source, and can be self-hosted via Docker in addition to running as a desktop app on macOS, Windows, and Linux. Beyond the free desktop and self-hosted options, Mintplex Labs offers paid cloud hosting plans: a Basic tier at $50/month for individuals or small teams under five users, a Pro tier at $99/month for larger startups, and custom Enterprise pricing for on-premise installation, dedicated support SLAs, and white-label branding. AnythingLLM suits individuals, developers, and organizations that want private, document-grounded AI chat and agent capabilities without depending entirely on a third-party cloud AI service.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Local and offline document chat$q$, $q$Chat with PDFs, Word docs, CSVs, and codebases entirely on-device.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Multi-provider LLM support$q$, $q$Connects to OpenAI, Azure, AWS, or locally-run models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$AI agents$q$, $q$Build and run AI agents on top of your own documents and data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Multi-modal support$q$, $q$Handles text, images, and audio inputs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Built-in developer API$q$, $q$Provides an API for integrating AnythingLLM into other applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Open source and self-hostable$q$, $q$MIT licensed, deployable via Docker for full control over infrastructure.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Strong privacy and local-first design with no forced data sharing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Free desktop app requiring no account$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Flexible support for multiple LLM providers, including local models$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Open source under the MIT license$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Cloud plans are priced per user-tier rather than pure usage-based pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Enterprise pricing isn't publicly listed and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Self-hosting via Docker requires some technical setup$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Is AnythingLLM free?$q$, $q$Yes, the desktop app and self-hosted Docker deployment are free and open source. Paid cloud hosting plans start at $50/month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Can AnythingLLM run offline?$q$, $q$Yes, the desktop app is designed to run locally and offline without requiring a cloud account.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$What LLM providers does AnythingLLM support?$q$, $q$It supports custom and enterprise providers including OpenAI, Azure, and AWS, as well as locally-run models.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Who makes AnythingLLM?$q$, $q$It is made by Mintplex Labs, a company founded in 2022 that went through Y Combinator's Summer 2022 batch.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$What platforms does AnythingLLM support?$q$, $q$The desktop app runs on macOS, Windows, and Linux, with additional self-hosted and cloud deployment options.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Private document Q&A$q$, $q$Chat with personal or company documents without sending data to a third-party cloud AI service.$q$, $q$Privacy-conscious individuals and teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Building AI agents on proprietary data$q$, $q$Create AI agents that operate over your own documents and knowledge base.$q$, $q$Developers and technical teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$On-premise enterprise AI deployment$q$, $q$Deploy a self-hosted AI chat and agent platform within enterprise infrastructure.$q$, $q$Enterprises with data residency requirements$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Desktop / Self-Hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Local/offline operation","No account required","Open source (MIT)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Cloud Basic$q$, $q$$50/month$q$, $q$Monthly$q$, NULL, $q$["Private instance","Custom subdomain","For teams under 5 users, <100 documents"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Cloud Pro$q$, $q$$99/month$q$, $q$Monthly$q$, NULL, $q$["Larger teams and document volumes","72-hour support SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["On-premise installation","Custom support SLA","White-label branding","Custom domain"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'b9045b0b-a0f9-495a-a06c-21acb051ac12';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AnythingLLM is an open-source AI application for chatting with documents and running AI agents locally and offline. It is made by Mintplex Labs, founded in 2022 and part of Y Combinator's Summer 2022 batch, and is positioned as a privacy-focused alternative to purely cloud-based AI assistants.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AnythingLLM processes documents including PDFs, Word files, CSVs, and codebases, and connects to custom or enterprise LLM providers such as OpenAI, Azure, and AWS, as well as locally-run models. It supports multi-modal input (text, images, audio), a built-in developer API, a community extension hub, and one-click LLM installation.$q$, $q$The desktop app runs on macOS, Windows, and Linux with no account required, and the software can also be self-hosted via Docker for teams that want full infrastructure control.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The desktop application and self-hosted Docker deployment are free and open source under the MIT license. Mintplex Labs also offers paid cloud hosting: a Basic plan at $50/month for individuals or teams under five users with under 100 documents, a Pro plan at $99/month for larger startups, and custom Enterprise pricing for on-premise installation, dedicated support SLAs, and white-label branding.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9045b0b-a0f9-495a-a06c-21acb051ac12', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Anytype ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Anytype is a local-first, end-to-end encrypted note-taking and knowledge-management app that syncs peer-to-peer across devices without relying on corporate servers.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Switzerland$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Anytype: Local-First, Encrypted Notes & Wiki App$q$, seo_title),
  seo_meta_description = COALESCE($q$Anytype is a local-first, encrypted note and knowledge app for Mac, Windows, Linux, iOS & Android. Free plan available; paid plans from $99/year.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Anytype is a local-first, end-to-end encrypted note-taking and knowledge-management application made by Any Association, a company founded in 2023 and based in Switzerland. It positions itself as a privacy-preserving alternative to cloud-based tools like Notion, storing data on the user's device first and syncing peer-to-peer across devices rather than routing everything through corporate servers. All content is encrypted on-device using a locally generated 12-word recovery phrase, and the company states it has no technical ability to decrypt user content. Anytype works fully offline by default, with optional encrypted cloud backup and sync, and it is available on macOS, Windows, Linux, iOS, and Android. Functionally, it lets users build custom object types, relations, and databases to organize information for use cases ranging from personal wikis to lightweight project management or CRM-style tracking, and it includes graph visualization for exploring relationships between notes and concepts. Pricing follows a freemium model: the free Explorer plan includes a limited amount of network storage and a small number of shared spaces; paid individual plans, Builder ($99/year) and Co-Creator ($299/year), increase network storage, the number of editors per shared space, and add priority support and a custom name; and a Business plan with custom space, editor, and pricing terms is available on request. Anytype suits privacy-conscious individuals and small teams who want a flexible, offline-capable note and database tool without vendor lock-in to a single company's servers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Local-first storage$q$, $q$Data is stored on-device first and works fully offline by default.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$End-to-end encryption$q$, $q$Content is encrypted on-device using a locally generated recovery phrase, with no vendor access to user data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Peer-to-peer sync$q$, $q$Syncs across a user's devices without routing through corporate servers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Custom object types and databases$q$, $q$Lets users build flexible databases, relations, and object types for varied use cases.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Graph visualization$q$, $q$Visualizes relationships between notes and objects as an interactive graph.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Cross-platform apps$q$, $q$Available on macOS, Windows, Linux, iOS, and Android.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Strong privacy model with on-device encryption and no vendor data lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Generous free tier with fully offline functionality$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Flexible database and object system for varied knowledge-management use cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Available across desktop and mobile platforms$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Smaller ecosystem and fewer integrations than established tools like Notion or Obsidian$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Larger shared spaces and team collaboration require a paid Builder or Co-Creator plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$As an actively evolving young product, some features are still maturing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Is Anytype free?$q$, $q$Yes, Anytype offers a free Explorer plan with limited network storage and shared spaces. Paid plans start at $99/year.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Does Anytype work offline?$q$, $q$Yes, it is local-first and works fully offline by default, with optional encrypted sync when online.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Is my data encrypted in Anytype?$q$, $q$Yes, all content is encrypted on-device using a locally generated recovery phrase, and Anytype states it cannot decrypt user content.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$What platforms does Anytype support?$q$, $q$Anytype is available on macOS, Windows, Linux, iOS, and Android.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Who makes Anytype?$q$, $q$Anytype is made by Any Association, founded in 2023 and based in Switzerland.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Personal knowledge management$q$, $q$Build a personal wiki or note system with custom databases and relations.$q$, $q$Individuals organizing personal knowledge$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Privacy-conscious note-taking$q$, $q$Take notes and manage information without relying on a corporate cloud server.$q$, $q$Privacy-conscious users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Small team collaboration$q$, $q$Share spaces with a small team while retaining control over data storage and encryption.$q$, $q$Small teams and collaborators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Explorer$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["1 GB network space","3 shared spaces","3 space members per shared space"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Builder$q$, $q$$99/year$q$, $q$Annual$q$, NULL, $q$["Unique custom name","128 GB network space","3 shared spaces","10 editors per shared space","Unlimited viewers","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Co-Creator$q$, $q$$299/year$q$, $q$Annual$q$, NULL, $q$["Shorter unique custom name","256 GB network space","Unlimited viewers per shared space","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$Business$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Custom network space size","Custom number of editors and shared spaces","Unlimited viewers"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'f42ac86a-c4b1-4cf3-a87c-d19f8fba60da';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anytype is a local-first, end-to-end encrypted note-taking and knowledge-management app made by Any Association, founded in 2023 and based in Switzerland. It is designed as a privacy-preserving alternative to cloud-based productivity tools, storing data on-device first and syncing peer-to-peer across a user's own devices.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Users can create custom object types, relations, and databases to organize information for use cases like personal wikis, project tracking, or lightweight CRM, and explore relationships between notes through graph visualization. The app works fully offline by default, with optional encrypted sync and cloud backup when connectivity is available.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$privacy-and-data$q$, $q$Privacy and Data$q$, 2, ARRAY[$q$All content is encrypted on-device using a 12-word recovery phrase generated locally, and Anytype states it has no technical ability to decrypt user content — only the user holds the keys. Data is encrypted before it leaves the device to sync with other devices or backup nodes.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Anytype offers a free Explorer plan with a limited amount of network storage and a small number of shared spaces. Paid plans include Builder at $99/year (more network storage, more editors per shared space, priority support) and Co-Creator at $299/year (further increased storage and a shorter custom name). A Business plan with custom terms is available on request.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f42ac86a-c4b1-4cf3-a87c-d19f8fba60da', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;


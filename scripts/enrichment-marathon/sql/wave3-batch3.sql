-- Enrichment marathon batch: Artalk, Artboard Studio, Artera, Asana, asciinema, Ashby, AsmBB

-- ── Artalk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Artalk is a free, open-source, self-hosted comment system for websites and blogs, built with a Go server and a lightweight ~40KB vanilla JavaScript client.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Artalk: Self-Hosted Open Source Comment System$q$, seo_title),
  seo_meta_description = COALESCE($q$Artalk is a free, self-hosted comment system for blogs and websites, built with Go and a lightweight JS client. Docker deploy, Markdown, moderation.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Artalk is a free and open-source, self-hosted comment system designed for blogs, personal websites, and web applications, developed by the ArtalkJS project on GitHub under the MIT license. It consists of a lightweight (~40KB), framework-agnostic vanilla JavaScript client and a Go-based server, making it fast to run and easy to deploy via Docker, prebuilt binaries, go install, or Linux package managers. Artalk supports nested/threaded comments, Markdown formatting, image uploads, comment moderation with an admin panel, multi-site management from a single instance, social login, email notifications, page view statistics, dark mode, LaTeX rendering, and a plugin system for extensibility. Because it is self-hosted, site owners retain full control of their comment data rather than relying on a third-party SaaS provider such as Disqus. Artalk is commonly used with static site generators like Hugo, Hexo, and Jekyll, as well as with WordPress and other CMS platforms, via its client widget and HTTP API. There is no paid tier — the software is entirely free, and the only cost is hosting the server and database yourself. It has around 2,300 GitHub stars and active releases. Artalk is best suited for developers, bloggers, and technically inclined website owners who want a privacy-respecting, customizable comment widget without recurring subscription fees, and who are comfortable managing their own server infrastructure.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Nested Comments$q$, $q$Hierarchical, threaded comment display with flexible, freely selectable sorting options.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Markdown & Image Support$q$, $q$Users can format comments with Markdown and attach images.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Docker Deployment$q$, $q$One-click self-hosted deployment via Docker, prebuilt binaries, or Linux packages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Multi-Site Management$q$, $q$Manage comments across multiple websites from one Artalk instance and admin panel.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Moderation Tools$q$, $q$Built-in comment moderation and an admin dashboard for managing discussions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Lightweight Client$q$, $q$~40KB vanilla JS widget with no framework dependencies.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Dark Mode & LaTeX$q$, $q$Built-in dark mode and LaTeX math rendering support for technical blogs.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Email Notifications$q$, $q$Notifies users by email of new replies and comment activity.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Completely free and open source (MIT license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Full ownership of comment data via self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Lightweight, fast client and Go-based server$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Easy Docker-based deployment$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Requires self-hosting and server maintenance — no official managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$No official paid support team; relies on community and GitHub issues$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Less mainstream than SaaS comment platforms like Disqus$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Is Artalk free to use?$q$, $q$Yes, Artalk is completely free and open source under the MIT license; the only cost is hosting your own server.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Does Artalk require a database?$q$, $q$Yes, Artalk's Go server needs a database such as SQLite, MySQL, or PostgreSQL to store comments.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Can Artalk be used with static site generators?$q$, $q$Yes, Artalk works well with Hugo, Hexo, Jekyll, and other static site generators, as well as WordPress, via its client widget and API.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Is there a hosted or managed version of Artalk?$q$, $q$No, Artalk is designed to be self-hosted; there is no official managed SaaS offering.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Blog Comment System$q$, $q$Add a privacy-friendly, ad-free comment section to a personal blog or static site.$q$, $q$Bloggers and static site generator users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$Self-Hosted Website Discussions$q$, $q$Run comments entirely on your own infrastructure instead of a third-party SaaS widget.$q$, $q$Developers and privacy-conscious site owners$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Artalk is a self-hosted comment system for blogs and websites, released as open source under the MIT license by the ArtalkJS project. It pairs a lightweight vanilla JavaScript client with a Go-based server, so site owners can add a full-featured comment widget without depending on a third-party SaaS provider.$q$, $q$Because Artalk runs on infrastructure the site owner controls, all comment data stays under their ownership. It is commonly paired with static site generators such as Hugo, Hexo, and Jekyll, as well as with WordPress and other CMS platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Artalk supports nested, threaded comments with flexible sorting, Markdown formatting, image uploads, and LaTeX rendering for technical content. An admin panel provides comment moderation and multi-site management from a single instance, while built-in email notifications alert users to replies.$q$, $q$The client is roughly 40KB and works without a JavaScript framework, keeping page load overhead low. Dark mode and a plugin system for extending functionality round out the feature set.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Artalk itself is free and open source with no paid tiers. The only cost is hosting the server, typically on a VPS, along with a database (SQLite, MySQL, or PostgreSQL). Deployment is available via Docker, prebuilt binaries, go install, or Linux distribution packages.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78ee4a6d-bbdd-4f4a-95bc-52afbbf2105f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Artboard Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Artboard Studio is a browser-based mockup generator with 5,000+ device, apparel, packaging, and print templates for designers and marketers.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$$9/month$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Toronto, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Artboard Studio: Online Mockup Generator & Editor$q$, seo_title),
  seo_meta_description = COALESCE($q$Create realistic device, apparel, and packaging mockups online with Artboard Studio's 5,000+ templates, Figma plugin, and AI mockup generator.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Artboard Studio is a browser-based mockup generator and editor for designers, marketers, and agencies, founded in 2016 and headquartered in Toronto, Canada. It grew out of Mockup Zone, an earlier digital marketplace for design content started by co-founder and CEO Mucahit Gayiran, who partnered with CTO Hooman to turn it into a SaaS product; the company has raised funding from investors including Techstars Toronto and 212. The platform provides a library of over 5,000 mockup templates spanning device mockups (phones, laptops, watches), apparel (t-shirts, hoodies), packaging (boxes, bottles), print materials (posters, books), and branding items (billboards, mugs, stationery), all editable directly in the browser without installing design software. Users can place static images or video into mockups and export as PNG, JPEG, WEBP, or video formats (MP4/WEBM). The product includes an AI mockup generator that creates mockups from text prompts, plus official plugins for Figma and Adobe Express that bring the mockup library into existing design workflows. Pricing follows a freemium model: a free tier for basic use, a Lite plan at $9/month, a Pro plan at $19/month with unlimited exports (both billed annually), and a one-time Lifetime Mockup plan at $129. Artboard Studio is best suited for freelance designers, in-house creative teams, and marketers who need fast, realistic product visuals for portfolios, client presentations, or ecommerce listings without hiring a photographer or 3D artist.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$5,000+ Mockup Library$q$, $q$Device, apparel, packaging, print, and branding mockups covering most common presentation needs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Browser-Based Editor$q$, $q$Create and edit mockups entirely in the browser with no software installation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Video Mockups$q$, $q$Place video into mockups and export as MP4 or WEBM.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$AI Mockup Generator$q$, $q$Generate mockups from text prompts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Figma & Adobe Express Plugins$q$, $q$Bring the mockup library directly into existing design tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Multiple Export Formats$q$, $q$Export finished mockups as PNG, JPEG, or WEBP.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Very large, ready-made mockup library$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$No design software installation required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$One-time Lifetime plan avoids ongoing subscription cost$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Native Figma and Adobe Express plugin integration$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Unlimited exports require a paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Browser-based tool requires an internet connection$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$AI mockup generator is a newer feature with less track record than the core mockup library$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Is Artboard Studio free?$q$, $q$It offers a free tier with limited features; paid plans start at $9/month for more exports and features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Does Artboard Studio have a one-time payment option?$q$, $q$Yes, it offers a Lifetime Mockup plan for a one-time $129 payment.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Does Artboard Studio integrate with Figma?$q$, $q$Yes, there is an official Figma plugin, as well as an Adobe Express plugin.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Can I create video mockups?$q$, $q$Yes, Artboard Studio supports placing video into mockups and exporting as MP4 or WEBM.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Client Presentations$q$, $q$Showcase app, packaging, or branding designs in realistic mockups for client review.$q$, $q$Freelance and agency designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Ecommerce Product Visuals$q$, $q$Generate product mockups for online store listings without physical photography.$q$, $q$Marketers and small business owners$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Access to the browser-based mockup editor","Limited exports"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Lite$q$, $q$$9/month$q$, $q$annual$q$, NULL, $q$["Expanded mockup access","More monthly exports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Pro$q$, $q$$19/month$q$, $q$annual$q$, NULL, $q$["Unlimited exports","Full mockup library access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Lifetime Mockup$q$, $q$$129$q$, $q$one-time$q$, NULL, $q$["One-time payment for ongoing access"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Artboard Studio is a browser-based mockup generator and editor, founded in 2016 in Toronto, Canada. It grew out of Mockup Zone, an earlier design content marketplace, before its founders built it into a standalone SaaS mockup tool backed by investors including Techstars Toronto.$q$, $q$The platform lets designers and marketers apply their own images or video to a library of realistic mockup templates and export finished visuals for portfolios, presentations, and ecommerce listings — all without installing design software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Artboard Studio offers more than 5,000 mockup templates across devices, apparel, packaging, print, and branding categories. Its editor runs entirely in the browser, and it supports video mockups that export as MP4 or WEBM in addition to standard PNG, JPEG, and WEBP image formats.$q$, $q$An AI mockup generator can produce mockups from text prompts, and official Figma and Adobe Express plugins let designers pull the mockup library directly into their existing tools.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Artboard Studio offers a free tier plus paid plans: Lite at $9/month and Pro at $19/month with unlimited exports (both billed annually). A one-time Lifetime Mockup plan is also available for $129.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Artera ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Artera (formerly WELL Health) is a healthcare AI communication platform that automates patient scheduling, intake, and messaging via voice, text, and email.$q$, short_description),
  pricing_model = COALESCE(NULL, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Santa Barbara, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Artera: AI Patient Communication for Healthcare$q$, seo_title),
  seo_meta_description = COALESCE($q$Artera is a healthcare AI platform automating patient scheduling, intake, and messaging via voice, text, and email, used by 1,000+ health organizations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Artera is a healthcare technology company that provides an agentic AI platform for automating patient communication and administrative workflows. Founded in 2015 by Guillaume De Zwirek and Joe Tischler, the company was originally known as WELL Health and rebranded to Artera in October 2022; it is headquartered in Santa Barbara, California. Artera's platform, marketed as 'Harmony,' coordinates AI agents across the patient journey — including appointment scheduling, patient intake forms, prescription refill requests, referral management, and closing gaps in care — while keeping human staff in the loop for oversight and escalation. Communication happens across voice, text, and email channels, with multilingual support and clinical triage that routes urgent patient messages to appropriate staff. The platform integrates with major electronic health record (EHR) systems used by hospitals and clinics. Artera reports serving more than 1,000 healthcare organizations, including Federally Qualified Health Centers (FQHCs), multi-specialty health systems, federal agencies, and specialty practices across more than a dozen medical specialties such as cardiology, oncology, orthopedics, and pediatrics. The company states it has powered over 2 billion patient interactions and has been ranked #1 in KLAS for Patient Communications. Pricing is not publicly disclosed and is handled through a custom sales process based on organization size and needs. Artera is built for healthcare provider organizations — not individual consumers — seeking to reduce missed appointments, administrative burden, and staff workload through AI-assisted patient outreach.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$AI Service Squads$q$, $q$Purpose-built AI agent bundles for specific healthcare workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Harmony Orchestration$q$, $q$Coordinates multiple AI agents across the patient journey with human oversight.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Multi-Channel Messaging$q$, $q$Reaches patients via voice, text, and email.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$EHR Integrations$q$, $q$Connects with major electronic health record systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Clinical Triage & Routing$q$, $q$Flags urgent patient messages for appropriate staff follow-up.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Multilingual Support$q$, $q$Communicates with patients in multiple languages.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Used by over 1,000 healthcare organizations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Multi-channel outreach (voice, text, email) can reduce missed appointments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Deep EHR integration reduces manual staff work$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Reported #1 ranking in KLAS for Patient Communications$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Pricing is not publicly available$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Built for healthcare organizations, not usable by individual consumers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Requires an enterprise sales and implementation process to get started$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Was Artera formerly known as WELL Health?$q$, $q$Yes, the company rebranded from WELL Health to Artera in October 2022.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Who uses Artera?$q$, $q$Health systems, FQHCs, specialty practices, and federal health agencies use Artera for patient communication.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Does Artera integrate with EHR systems?$q$, $q$Yes, it integrates with major electronic health record platforms.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Is Artera's pricing public?$q$, $q$No, pricing is not published; organizations must contact Artera's sales team.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Appointment Reminders & Scheduling$q$, $q$Automate patient scheduling and reduce no-shows across a health system.$q$, $q$Hospitals and multi-specialty health systems$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Patient Intake Automation$q$, $q$Collect intake forms and pre-visit information via text and voice before appointments.$q$, $q$FQHCs and specialty practices$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Artera is a healthcare AI communication platform founded in 2015 by Guillaume De Zwirek and Joe Tischler. Originally known as WELL Health, the company rebranded to Artera in October 2022 and is headquartered in Santa Barbara, California.$q$, $q$The platform automates patient-facing communication and administrative workflows for healthcare provider organizations, coordinating AI agents across scheduling, intake, and follow-up while keeping human staff in the loop for oversight.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Artera's 'Harmony' platform orchestrates AI agents across the patient journey, handling appointment scheduling, intake forms, prescription refill requests, referral management, and care-gap closure. Communication spans voice, text, and email, with multilingual support and clinical triage that routes urgent symptoms to staff.$q$, $q$The platform integrates with major EHR systems, letting patient communication workflows connect directly to a provider's existing clinical records.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Artera serves healthcare provider organizations rather than individual consumers, including Federally Qualified Health Centers, multi-specialty health systems, federal health agencies, and specialty practices across more than a dozen medical specialties. The company reports over 1,000 healthcare organizations use its platform.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Asana ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Asana is a work and project management platform for planning, tracking, and managing team tasks, with AI Studio agents built into workflows.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2008, founded_year),
  company_size = COALESCE($q$~1,700 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Asana: Work & Project Management Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Asana helps teams plan, track, and manage projects and tasks, with a free plan for small teams and paid plans starting at $10.99/user/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Asana is a work and project management platform founded in 2008 by Dustin Moskovitz and Justin Rosenstein, headquartered in San Francisco, California, with roughly 1,700 employees. It helps teams plan, organize, and track tasks and projects through list, board, calendar, and timeline/Gantt views, connected by what Asana calls the 'Work Graph' — a data model linking goals, portfolios, projects, and tasks. Asana has expanded into agentic work management, offering built-in 'AI Teammates' (such as a Launch Planner, Workflow Optimizer, Compliance Specialist, and Status Reporter) that operate alongside human team members with scoped permissions and audit trails, along with AI Studio for building custom automations and agents. The platform integrates with over 200 third-party tools including Slack, Salesforce, Tableau, and Power BI. Pricing follows a freemium model: a free Personal plan (currently limited to 2 users for new accounts), a Starter plan at $10.99/user/month billed annually ($13.49 monthly), an Advanced plan at $24.99/user/month billed annually, and custom-priced Enterprise and Enterprise+ tiers with SAML authentication, user provisioning (SCIM), and enhanced security controls. Asana reports that 85% of Fortune 100 companies use its platform and has been named a Leader in Gartner's Magic Quadrant for Collaborative Work Management for three consecutive years. It is best suited for teams and organizations of any size looking to centralize task management, cross-functional project tracking, and AI-assisted workflow automation in one system.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Multiple Views$q$, $q$List, board, calendar, and timeline/Gantt views for tasks and projects.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Work Graph$q$, $q$Connected data model linking goals, portfolios, projects, and tasks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$AI Teammates$q$, $q$Pre-built AI agents (e.g., Workflow Optimizer, Status Reporter) that work within projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$AI Studio$q$, $q$Build custom automations and AI agents for specific workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Reporting & Dashboards$q$, $q$Built-in reporting and portfolio-level status tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$200+ Integrations$q$, $q$Connects with Slack, Salesforce, Tableau, Power BI, and other tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Forms & Automations$q$, $q$Intake forms and unlimited workflow automations on paid plans.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Free plan available for small teams$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Flexible views suit many project management styles$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Strong third-party integration ecosystem$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$AI Teammates and AI Studio add automation without extra tools$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Free plan is limited to 2 users on new accounts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Advanced features (goals, portfolios, AI Studio credits) require Advanced or Enterprise plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Per-user pricing can get expensive for large teams$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Feature depth can mean a learning curve for new users$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Is Asana free?$q$, $q$Yes, Asana offers a free Personal plan, currently limited to 2 users, with unlimited tasks and projects.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$How much does Asana cost?$q$, $q$Paid plans start at $10.99/user/month (Starter, billed annually), with Advanced at $24.99/user/month and custom Enterprise pricing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$What are Asana's AI Teammates?$q$, $q$They are pre-built AI agents, such as a Workflow Optimizer and Status Reporter, that work alongside human team members inside Asana projects.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Does Asana integrate with other tools?$q$, $q$Yes, Asana integrates with 200+ tools including Slack, Salesforce, Tableau, and Power BI.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Cross-Functional Project Tracking$q$, $q$Coordinate tasks and deadlines across marketing, product, and operations teams.$q$, $q$Mid-size to large organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$AI-Assisted Workflow Automation$q$, $q$Use AI Teammates and AI Studio to automate repetitive project and reporting tasks.$q$, $q$Teams looking to reduce manual coordination work$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Personal$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Up to 2 users","Unlimited tasks and projects","List, board, and calendar views","100+ integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Starter$q$, $q$$10.99/user/month$q$, $q$annual ($13.49 monthly)$q$, NULL, $q$["Unlimited users","Timeline/Gantt views","Reporting dashboards","Unlimited automations","Forms","Custom fields"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Advanced$q$, $q$$24.99/user/month$q$, $q$annual$q$, NULL, $q$["Unlimited portfolios","Goals management","Workload tracking","Approvals/proofing","Salesforce/Tableau/Power BI support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["SAML authentication","User provisioning (SCIM)","Universal workload","Capacity planning"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$Enterprise+$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Enhanced security and compliance controls"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Asana was founded in 2008 by Dustin Moskovitz and Justin Rosenstein and is headquartered in San Francisco, California. It is a work and project management platform used to plan, organize, and track tasks and projects across teams.$q$, $q$Tasks and projects are connected through Asana's 'Work Graph,' a data model linking goals, portfolios, projects, and individual tasks, and viewable through list, board, calendar, and timeline/Gantt layouts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Asana has added agentic work management features, including pre-built 'AI Teammates' — such as a Workflow Optimizer, Status Reporter, Compliance Specialist, and Data Quality Manager — that work within projects alongside human team members, each with scoped permissions and audit trails. AI Studio lets teams build custom automations and agents for specific workflows.$q$, $q$The platform includes reporting dashboards, workflow automations, custom fields, and forms on paid plans, plus over 200 integrations with tools such as Slack, Salesforce, Tableau, and Power BI.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Asana's Personal plan is free, currently limited to 2 users for new accounts. Paid plans start with Starter at $10.99/user/month billed annually ($13.49 billed monthly), followed by Advanced at $24.99/user/month billed annually, and custom-priced Enterprise and Enterprise+ tiers for larger organizations with additional security and governance needs.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ad2069a-0cd7-4145-92c6-cbbc7fc26c7a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── asciinema ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$asciinema is a free, open-source tool for recording and sharing terminal sessions as lightweight, text-based (not video) recordings.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$asciinema: Free Terminal Session Recorder$q$, seo_title),
  seo_meta_description = COALESCE($q$asciinema is free, open-source software for recording and sharing terminal sessions as text-based recordings, embeddable anywhere on the web.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$asciinema is a free and open-source tool for recording and sharing terminal sessions, created by Marcin Kulik. The project began in 2011 as 'ascii.io' and was renamed and published to PyPI as asciinema in 2013. Unlike traditional screen-recording software that captures video, asciinema records terminal sessions as lightweight, text-based '.cast' files, keeping recordings small and letting viewers copy-paste text directly from a played-back session. The ecosystem has two main open-source components: the asciinema CLI recorder/player, licensed under GPLv3, and the asciinema server that powers the hosting platform behind asciinema.org, licensed under Apache License 2.0. Recordings can be hosted for free on asciinema.org, embedded in blogs and documentation via a JavaScript player, or self-hosted by running an instance of asciinema server on one's own infrastructure. The tool also supports live terminal streaming. There are no paid plans or subscription tiers — asciinema.org hosting and all official client and server software are free to use, with asciinema.org's infrastructure provided by Brightbox. asciinema is aimed at developers, educators, and open-source maintainers who want to demonstrate command-line tools, write technical tutorials, or share reproducible terminal walkthroughs without producing traditional screen-recording video files.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a871d31-fa92-435d-8be7-8639d7f2476f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a871d31-fa92-435d-8be7-8639d7f2476f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3a871d31-fa92-435d-8be7-8639d7f2476f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Text-Based Recording$q$, $q$Captures terminal sessions as compact, text-based .cast files instead of video.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Copy-Paste Playback$q$, $q$Viewers can select and copy text directly from a played-back recording.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Embeddable Player$q$, $q$Embed recordings in blogs, docs, and presentations via a JS player.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Live Streaming$q$, $q$Stream a live terminal session to viewers in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Free Hosting$q$, $q$Host recordings for free on asciinema.org.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Self-Hostable Server$q$, $q$Run your own asciinema server instance instead of using asciinema.org.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '3a871d31-fa92-435d-8be7-8639d7f2476f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Completely free, open-source, and self-hostable$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Recordings are tiny compared to screen-recording video$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Copy-pasteable terminal output improves accessibility and reuse$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Simple CLI workflow — record, then share a link$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '3a871d31-fa92-435d-8be7-8639d7f2476f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Only captures terminal/CLI sessions, not GUI applications$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Viewers need the asciinema player (or an embed) rather than a standard video player$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Self-hosting the server requires basic sysadmin knowledge$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '3a871d31-fa92-435d-8be7-8639d7f2476f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Is asciinema free?$q$, $q$Yes, asciinema is free and open-source software with no paid tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Can I self-host asciinema?$q$, $q$Yes, the asciinema server (Apache License 2.0) can be self-hosted instead of using asciinema.org.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$What license does asciinema use?$q$, $q$The CLI is licensed under GPLv3, and the server is licensed under Apache License 2.0.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Does asciinema record video?$q$, $q$No, it records terminal sessions as text-based .cast files rather than video.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3a871d31-fa92-435d-8be7-8639d7f2476f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$CLI Tool Demos$q$, $q$Show a command-line tool or workflow in documentation or a README.$q$, $q$Open-source maintainers and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$Technical Tutorials$q$, $q$Embed reproducible, copy-pasteable terminal walkthroughs in blog posts or courses.$q$, $q$Technical writers and educators$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '3a871d31-fa92-435d-8be7-8639d7f2476f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$asciinema is a free, open-source tool created by Marcin Kulik for recording and sharing terminal sessions. It began in 2011 as 'ascii.io' before being renamed and published as asciinema in 2013.$q$, $q$Instead of producing video, asciinema records sessions as lightweight, text-based '.cast' files, which keep file sizes small and let viewers copy-paste text directly out of a played-back recording.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Recordings can be embedded in blogs, documentation, and presentations via a JavaScript player, or shared as a link hosted on asciinema.org. The project also supports live terminal streaming for real-time demonstrations.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', $q$pricing-overview$q$, $q$Pricing & Self-Hosting$q$, 2, ARRAY[$q$asciinema has no paid plans. The CLI (GPLv3) and server software (Apache License 2.0) are both open source and free, and asciinema.org hosts recordings for free. Users who prefer not to rely on asciinema.org can self-host the asciinema server on their own infrastructure.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a871d31-fa92-435d-8be7-8639d7f2476f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Ashby ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ashby is an all-in-one recruiting platform combining an ATS, sourcing CRM, interview scheduling, and analytics with embedded AI tools.$q$, short_description),
  pricing_model = COALESCE($q$Subscription$q$, pricing_model),
  starting_price = COALESCE($q$$400/month$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE($q$~110 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Ashby: All-in-One Recruiting Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Ashby combines an ATS, CRM, scheduling, and analytics with embedded AI, used by teams at Shopify, Notion, and Linear. Plans start at $400/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ashby is an all-in-one recruiting platform founded in 2018 by Benjamin Encz and Abhik Pramanik, headquartered in San Francisco with roughly 110 employees. It consolidates the core hiring workflow — applicant tracking (ATS), candidate relationship management (CRM) and sourcing, interview scheduling automation, and recruiting analytics — into a single system, with AI features embedded across the platform, including an AI Notetaker that records, transcribes, and summarizes interviews. Ashby is used by companies such as Xero, Shopify, Notion, Linear, Zapier, Replit, and Deel. Pricing is tiered by company size: the Foundations plan costs $400/month for companies up to 100 employees, billed monthly or with a 10% discount annually; the Plus plan (101–1,000 employees) and Enterprise plan (1,000+ employees) are custom-priced based on company size, usage, and commitment. Ashby also sells a separate usage-based Ashby Analytics product for companies with 100+ employees that want real-time recruiting analytics layered on top of an existing ATS they aren't ready to replace, plus an Advanced Scheduling add-on. The platform connects to existing recruiting tools via API and third-party integrations. Ashby is designed for talent acquisition teams at startups through large enterprises that want to replace a patchwork of separate sourcing, ATS, scheduling, and analytics tools with one connected recruiting system.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Applicant Tracking (ATS)$q$, $q$Manage candidates and hiring pipelines in one system.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Sourcing CRM$q$, $q$Build and manage outbound candidate pipelines and relationships.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Scheduling Automation$q$, $q$Automate interview coordination and calendar logistics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$AI Notetaker$q$, $q$Records, transcribes, and summarizes candidate interviews.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Recruiting Analytics$q$, $q$Custom reporting and dashboards on hiring funnel performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$API & Integrations$q$, $q$Connects with existing HR and recruiting tools via API.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Combines ATS, CRM, scheduling, and analytics in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Used by well-known tech companies (Shopify, Notion, Linear, Zapier)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$AI features (notetaking, automation) embedded throughout$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Analytics product available separately for teams not ready to switch ATS$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Starting price ($400/month) may be high for very small teams or solo recruiters$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Plus and Enterprise pricing is custom and not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Built primarily for dedicated talent acquisition teams, less suited to ad hoc hiring$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$How much does Ashby cost?$q$, $q$The Foundations plan starts at $400/month for companies up to 100 employees; larger companies get custom Plus or Enterprise pricing.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Who founded Ashby?$q$, $q$Ashby was founded in 2018 by Benjamin Encz and Abhik Pramanik.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Does Ashby include interview scheduling?$q$, $q$Yes, scheduling automation is part of the platform, with an Advanced Scheduling add-on for more complex workflows.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Can I use Ashby's analytics without switching my ATS?$q$, $q$Yes, Ashby Analytics is sold separately on a usage basis for companies using another ATS.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Consolidating Recruiting Tools$q$, $q$Replace separate ATS, CRM, and scheduling tools with one connected system.$q$, $q$In-house talent acquisition teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Scaling Hiring at Growth-Stage Companies$q$, $q$Manage growing candidate volume and interview scheduling as headcount scales.$q$, $q$Startups and growth-stage companies$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Foundations$q$, $q$$400/month$q$, $q$monthly or annual (10% discount)$q$, NULL, $q$["Full recruiting suite for companies up to 100 employees"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Plus$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["For companies with 101–1,000 employees","Scales with usage and commitment"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["For companies with 1,000+ employees","Predictable pricing for consolidated spend"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'ad6a6164-cd5b-4456-afd7-cd85def0c06a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Ashby is an all-in-one recruiting platform founded in 2018 by Benjamin Encz and Abhik Pramanik, headquartered in San Francisco. It consolidates applicant tracking, sourcing CRM, interview scheduling, and recruiting analytics into a single connected system.$q$, $q$The platform is used by talent acquisition teams at companies including Xero, Shopify, Notion, Linear, Zapier, Replit, and Deel.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ashby combines an applicant tracking system (ATS) with a sourcing CRM, scheduling automation, and custom recruiting analytics and dashboards. AI is embedded throughout, including an AI Notetaker that records, transcribes, and summarizes candidate interviews, and the platform connects to existing HR and recruiting tools via API.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Ashby's Foundations plan costs $400/month for companies up to 100 employees, billed monthly or with a 10% annual discount. The Plus plan (101–1,000 employees) and Enterprise plan (1,000+ employees) are custom-priced. Ashby Analytics is sold separately on a usage basis for companies with 100+ employees using another ATS.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6a6164-cd5b-4456-afd7-cd85def0c06a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── AsmBB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AsmBB is a free, open-source, self-hosted forum engine written entirely in assembly language (FASM), built for speed and minimal server resources.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AsmBB: Self-Hosted Forum Software in Assembly$q$, seo_title),
  seo_meta_description = COALESCE($q$AsmBB is a free, open-source forum engine written in assembly language (FASM), using SQLite and FastCGI for a lightweight, high-performance board.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AsmBB is a free and open-source, self-hosted forum (bulletin board) engine created by John Found, written entirely in assembly language using the FlatAssembler (FASM) toolchain. It is distributed under the EUPL-1.1 license, with source code and a reference forum hosted at asm32.info. AsmBB uses SQLite (with the SQLeet encrypted-database extension) as its storage backend and communicates with the web server via FastCGI; it has been tested with Nginx, Apache, Lighttpd, Hiawatha, and RWASA. Because it is written in assembly with very few dependencies, AsmBB is designed to be extremely lightweight and fast, able to run on low-resource servers while serving high traffic without lag, and its minimal dependency surface is positioned as a security advantage, with optional encrypted-database support to protect forum data in the event of a server breach. Core forum features include user registration, threaded discussions, a tagging system, and email integration. The software's own reference deployment (board.asm32.info) hosts over 16,000 posts across roughly 325 threads with close to 500 registered users, demonstrating the software in active production use. AsmBB is best suited for developers and system administrators who want a minimal-footprint, high-performance discussion board — particularly in low-level programming, systems, and assembly-language communities — and who are comfortable running self-hosted, source-compiled software rather than a mainstream PHP- or Node-based forum platform.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Written in Assembly$q$, $q$Entire forum engine built in FASM assembly language for maximum performance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$SQLite Backend$q$, $q$Uses SQLite, with optional SQLeet encryption, for storage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$FastCGI Interface$q$, $q$Runs behind Nginx, Apache, Lighttpd, and other servers via FastCGI.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Threaded Discussions & Tagging$q$, $q$Supports threaded topics with a tagging system.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Low Resource Usage$q$, $q$Designed to run on weak, low-resource servers under high traffic.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Email Integration$q$, $q$Built-in email notifications for forum activity.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Extremely lightweight and fast due to the assembly implementation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Minimal dependencies reduce attack surface$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Proven in production on its own reference forum (asm32.info)$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Requires self-hosting and comfort running assembly-based software$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Small community compared to mainstream forum software like phpBB or Discourse$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Documentation and ecosystem are niche, aimed at low-level/systems programmers$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Is AsmBB free?$q$, $q$Yes, AsmBB is free and open source under the EUPL-1.1 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$What language is AsmBB written in?$q$, $q$It is written entirely in assembly language using the FlatAssembler (FASM).$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$What database does AsmBB use?$q$, $q$SQLite, with optional SQLeet encryption support.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Who created AsmBB?$q$, $q$AsmBB was created by John Found.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Low-Resource Community Forums$q$, $q$Run a discussion board on minimal server hardware without performance issues.$q$, $q$Systems administrators and hobbyist server operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$Assembly & Systems Programming Communities$q$, $q$Host discussion for low-level programming and assembly-language topics.$q$, $q$Assembly and systems programmers$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'd5ce25b0-07e3-40a6-8303-50176e4ba9cf';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AsmBB is a self-hosted forum engine created by John Found and written entirely in assembly language using the FlatAssembler (FASM) toolchain. It is open source under the EUPL-1.1 license, with source code and a live reference forum hosted at asm32.info.$q$, $q$The forum uses SQLite (with optional SQLeet encryption) for storage and a FastCGI interface to communicate with the web server, and has been tested against Nginx, Apache, Lighttpd, Hiawatha, and RWASA.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Being written in assembly with very few dependencies, AsmBB is built to run on low-resource servers while handling high traffic without lag. Core forum functionality includes user registration, threaded discussions, a tagging system, and email integration, alongside optional encrypted-database support for added security.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', $q$pricing-overview$q$, $q$Pricing & Self-Hosting$q$, 2, ARRAY[$q$AsmBB is free and open source with no paid tiers. It must be self-hosted; the project's own reference deployment at board.asm32.info runs over 16,000 posts across roughly 325 threads with close to 500 registered users.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5ce25b0-07e3-40a6-8303-50176e4ba9cf', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;


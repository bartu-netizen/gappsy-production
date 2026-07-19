-- Enrichment marathon batch: Squidex, SquirrelMail, Squirrly SEO, SRS, Stable Diffusion, Stack AI, Stacker, stackstorm

-- ── Squidex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Squidex is an open-source headless CMS built on .NET that lets developers manage structured content through GraphQL and REST APIs, available as self-hosted software or a managed cloud service.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (self-hosted); paid Cloud plans available$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Baden-Baden, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Squidex Review: Open-Source Headless CMS Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Squidex is a free, open-source headless CMS with GraphQL and REST APIs. See pricing, features, pros and cons, and FAQs for developers and teams.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Squidex is a free, open-source headless content management system (CMS) created by German developer Sebastian Stehle, built on .NET (ASP.NET Core) with MongoDB as its data store. It lets developers and content teams define custom content schemas that are automatically exposed through both GraphQL and REST APIs, making it suitable for powering websites, mobile apps, and other digital products from a single content backend. Squidex can be self-hosted for free using Docker or Kubernetes, giving organizations full control over their data and infrastructure, or consumed as a managed SaaS through Squidex Cloud, which offers a free tier plus paid tiers priced around monthly API call quotas (roughly 20,000 calls on the free tier, scaling into the millions on paid tiers), asset storage, and contributor counts. Key features include visual schema modeling, content versioning and audit history, role-based editorial workflows, multi-language localization, an integrated digital asset manager, and webhook-driven integrations for real-time automation. Squidex is best suited for development teams comfortable with the .NET ecosystem who want an API-first CMS without vendor lock-in, as well as enterprises with data residency requirements that need to self-host. It competes with other headless CMS platforms such as Contentful, Strapi, and Sanity, differentiating itself primarily through its fully open-source, self-hostable core.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$GraphQL and REST APIs$q$, $q$Every content item is automatically exposed through both a GraphQL endpoint and a versioned REST API for flexible integration with any frontend framework.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Visual Content Modeling$q$, $q$A schema builder lets teams define custom content types, fields, and validation rules without writing code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Multi-language Localization$q$, $q$Built-in support for managing content in multiple languages and locales from a single content item.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Role-based Workflows$q$, $q$Configurable roles, permissions, and content approval workflows for editorial teams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Asset Management$q$, $q$A built-in digital asset manager for images, videos, and documents with automatic image resizing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Webhooks and Event Integration$q$, $q$Real-time webhooks notify external systems when content changes, enabling automation pipelines.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Self-hosted or Cloud$q$, $q$Deployable via Docker or Kubernetes on-premises, or consumed as a managed SaaS through Squidex Cloud.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Open Source Core$q$, $q$Full source code available on GitHub under an open license, allowing self-hosting without vendor lock-in.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Free to self-host with no licensing fees since the core is fully open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Both GraphQL and REST APIs are generated automatically for every content model$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Strong versioning and audit history for content changes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Active GitHub community with regular releases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Works well for developers already in the .NET ecosystem$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Steeper learning curve than SaaS-only headless CMS options for non-technical users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Self-hosting requires managing MongoDB and infrastructure, adding operational overhead$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Smaller plugin and integration ecosystem than larger CMS platforms like Contentful$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Cloud pricing beyond the free tier is not fully transparent and often requires contacting sales$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Documentation and community support can be thinner than more mainstream CMS products$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Is Squidex free?$q$, $q$Yes, the self-hosted, open-source edition of Squidex is free under its open-source license. Squidex Cloud also offers a free tier with usage limits, plus paid tiers for higher API traffic and storage.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$What is Squidex built with?$q$, $q$Squidex is built on .NET (ASP.NET Core) with MongoDB as its default data store, and it can be self-hosted using Docker or Kubernetes.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Does Squidex support GraphQL?$q$, $q$Yes, Squidex automatically generates a GraphQL API alongside a REST API for every content schema.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Who created Squidex?$q$, $q$Squidex was created by German software engineer Sebastian Stehle and has since grown into an open-source project with community contributors.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Can Squidex be self-hosted?$q$, $q$Yes, Squidex can be deployed on your own infrastructure using Docker images, in addition to the managed Squidex Cloud offering.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$What is Squidex used for?$q$, $q$Squidex is used as a headless CMS to manage structured content, such as blog posts, product data, or documentation, that is delivered via API to websites, mobile apps, and other frontends.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Does Squidex support multiple languages?$q$, $q$Yes, Squidex has built-in localization features for managing content in multiple languages within a single schema.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$How does Squidex compare to Contentful?$q$, $q$Squidex offers similar structured-content and API-first capabilities to Contentful but is open source and can be self-hosted for free, whereas Contentful is a closed-source SaaS product.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Developer-led Content Platforms$q$, $q$Engineering teams use Squidex as the content backend for custom websites, mobile apps, and product catalogs via its REST and GraphQL APIs.$q$, $q$Software development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Self-hosted Enterprise CMS$q$, $q$Organizations with data residency or compliance requirements self-host Squidex on their own infrastructure to keep full control over content and hosting.$q$, $q$Enterprises and regulated industries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Multi-brand and Multi-language Content Hubs$q$, $q$Marketing teams managing multiple websites or regional variants use Squidex's localization and schema reuse to centralize content operations.$q$, $q$Marketing and content teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, $q$one-time$q$, NULL, $q$["Full source code on GitHub","Unlimited apps and content","Self-managed hosting via Docker or Kubernetes","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Cloud Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["About 20,000 API calls per month","Limited asset storage","Community support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Cloud Basic$q$, $q$Contact sales$q$, $q$monthly$q$, NULL, $q$["About 450,000 API calls per month","More asset storage","Email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Cloud Professional$q$, $q$Contact sales$q$, $q$monthly$q$, NULL, $q$["About 1,500,000 API calls per month","Higher asset storage and contributor limits"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$Cloud Business$q$, $q$Contact sales$q$, $q$monthly$q$, NULL, $q$["About 4,500,000 API calls per month","Highest quotas","Priority support"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '63cfef32-95ca-4b6d-8212-b1eeaaace93b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$overview$q$, $q$What Is Squidex$q$, 2, ARRAY[$q$Squidex is an open-source headless content management system that stores structured content and exposes it through REST and GraphQL APIs, letting developers pull content into any website, mobile app, or product experience. It was created by German developer Sebastian Stehle and built on the .NET stack with MongoDB as its backing store.$q$, $q$Unlike traditional CMS platforms that couple content storage with a specific frontend, Squidex separates the two: content editors work in a browser-based backend to create schemas and manage entries, while developers consume that content programmatically. The project is available as free, self-hosted, open-source software on GitHub, or as a managed SaaS through Squidex Cloud.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Squidex centers on customizable content schemas, automatic API generation, and editorial workflow tools. Each schema editors define instantly becomes queryable through both GraphQL and REST endpoints, with built-in support for content versioning, localization, role-based permissions, and an integrated asset manager for media files. Webhooks let Squidex notify other systems, such as static site generators or CI pipelines, whenever content changes, making it suitable for JAMstack and headless frontend architectures.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Squidex offers two paths to adoption: self-hosting the open-source core for free using Docker or Kubernetes, or subscribing to Squidex Cloud, the managed SaaS version. Squidex Cloud includes a free tier with a limited monthly API call allowance, and paid tiers that scale API traffic, asset storage, and contributor limits; pricing for paid Cloud tiers is generally provided on request through Squidex's sales team.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('63cfef32-95ca-4b6d-8212-b1eeaaace93b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SquirrelMail ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SquirrelMail is a free, open-source webmail client written in PHP that provides IMAP-based email access through a browser, designed to run on low-resource servers with minimal client requirements.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(1999, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SquirrelMail: Free Open-Source PHP Webmail Client$q$, seo_title),
  seo_meta_description = COALESCE($q$SquirrelMail is a free, open-source PHP webmail client with IMAP support. Learn its history, features, and current maintenance status.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SquirrelMail is a free and open-source webmail client written in PHP, first released in 1999 by brothers Luke and Nathan Ehresman. It provides a browser-based interface for reading and sending email over the IMAP protocol, and was originally designed to run on low-end servers and load quickly even in basic browsers, without relying on JavaScript. SquirrelMail is licensed under the GNU General Public License (GPL) version 2 or later and was, for many years, bundled into the default webmail options of shared hosting control panels and major Linux distributions. There is no company behind SquirrelMail; it has always been a community-maintained, volunteer open-source project with no paid pricing tiers. However, SquirrelMail's active development has largely stalled: the last official numbered release was version 1.4.22 in 2011, and later builds exist only as unofficial SVN development snapshots (referred to as 1.4.23-svn). Major hosting platforms, including cPanel, dropped official support around 2018, and known security vulnerabilities in older releases remain unpatched in the official codebase. As a result, SquirrelMail today is primarily of interest to legacy system administrators, PHP developers studying older codebases, or self-hosters willing to accept the security tradeoffs of largely unmaintained software; most current deployments favor modern alternatives such as Roundcube.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$IMAP-based Webmail$q$, $q$Connects to any standard IMAP mail server to read and send email through a browser.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$No JavaScript Required$q$, $q$The interface is built with plain HTML and PHP so it works in minimal or older browsers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Plugin Architecture$q$, $q$Administrators can extend functionality with community-built plugins for address books, filters, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Multi-language Support$q$, $q$Translations are available for numerous languages through community-contributed locale packs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Low Server Resource Requirements$q$, $q$Designed to run on modest hosting hardware, making it popular with budget shared hosting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$GPL Open Source License$q$, $q$Fully free to use, modify, and redistribute under the GNU GPL v2 or later.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Address Book and Folder Management$q$, $q$Built-in tools for organizing contacts and email folders.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Theme Customization$q$, $q$Supports custom themes for adjusting the look of the webmail interface.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Completely free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Extremely lightweight, running well on low-resource servers and old browsers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Long track record and wide historical adoption across hosting platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Simple, minimal interface that is easy to learn$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Plugin system allows administrators to extend functionality$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Development has largely stalled since the last official release in 2011$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Known security vulnerabilities remain unpatched in official releases$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Interface looks and feels dated compared to modern webmail clients$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Major hosting platforms like cPanel have dropped official support$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Lacks native mobile-responsive design common in newer webmail tools$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Is SquirrelMail still maintained?$q$, $q$Development has slowed dramatically since 2011; the project continues through unofficial SVN snapshots rather than regular numbered releases, and many consider it largely unmaintained.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Is SquirrelMail free?$q$, $q$Yes, SquirrelMail is completely free and open source under the GNU General Public License.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Who created SquirrelMail?$q$, $q$SquirrelMail was created in 1999 by brothers Luke and Nathan Ehresman.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Is SquirrelMail safe to use today?$q$, $q$Because known security vulnerabilities remain unpatched in official releases, security-conscious users are generally advised to migrate to actively maintained alternatives like Roundcube.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$What protocol does SquirrelMail use?$q$, $q$SquirrelMail connects to mail servers using the IMAP protocol.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Does SquirrelMail require JavaScript?$q$, $q$No, it was specifically designed to work without JavaScript so it renders in minimal browsers.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Can SquirrelMail be customized?$q$, $q$Yes, through its plugin architecture and theme system administrators can extend and customize the interface.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$What replaced SquirrelMail on most hosting platforms?$q$, $q$Roundcube has become the more common default webmail client on modern hosting control panels.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Legacy Shared Hosting Webmail$q$, $q$Hosting providers historically offered SquirrelMail as the default browser-based email client for shared hosting customers.$q$, $q$Web hosting providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Low-Bandwidth or Low-Resource Environments$q$, $q$Organizations with limited server resources or users on slow connections use SquirrelMail because it renders without JavaScript and loads quickly.$q$, $q$Resource-constrained IT environments$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Educational and Legacy System Study$q$, $q$Developers and students reference SquirrelMail's PHP codebase to study early 2000s-era open-source webmail architecture.$q$, $q$PHP developers and students$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, $q$one-time$q$, NULL, $q$["Full source code","Legacy/unmaintained status","GPL license","Community plugins"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'ffdd687a-015f-403d-bcd0-a5b07aaf6e74';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$overview$q$, $q$What Is SquirrelMail$q$, 2, ARRAY[$q$SquirrelMail is a free, open-source webmail client written in PHP that lets users read, compose, and manage email through a web browser via the IMAP protocol. It was created in 1999 by brothers Luke and Nathan Ehresman with the explicit goal of running well on low-end servers and rendering in simple browsers without requiring JavaScript.$q$, $q$For much of the 2000s and early 2010s, SquirrelMail was one of the most widely deployed webmail clients, bundled by default into many shared web hosting control panels and Linux distribution repositories. It is licensed under the GNU General Public License version 2 or later, and the project has never operated as a commercial company, having always been maintained by volunteer contributors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SquirrelMail's core feature set reflects its origins as a lightweight, dependency-free webmail client: full IMAP support for connecting to standard mail servers, a plugin architecture that lets administrators add features like address books, filters, and spam controls, multi-language interface translations, and a minimal-footprint HTML interface that avoids JavaScript so it works in basic browsers and over slow connections. Its plugin ecosystem, built by the community over two decades, extends the base client with calendar tools, PGP encryption support, and various administrative utilities.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SquirrelMail is entirely free and open source; there is no paid tier, subscription, or commercial license. Organizations self-host SquirrelMail on their own web and mail servers, incurring only their own infrastructure costs. Because the project has no company or vendor behind it, there is no official paid support offering, though third-party consultants and hosting providers sometimes offer support as a service.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ffdd687a-015f-403d-bcd0-a5b07aaf6e74', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Squirrly SEO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Squirrly SEO is an AI-powered WordPress SEO plugin that gives site owners a daily SEO roadmap, keyword research, on-page optimization guidance, and rank tracking directly inside the WordPress dashboard.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $9.99/month)$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Squirrly SEO Review: WordPress SEO Plugin Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Squirrly SEO is an AI-powered WordPress SEO plugin with keyword research, audits, and rank tracking. See pricing plans, features, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Squirrly SEO is an AI-powered search engine optimization plugin for WordPress, founded in September 2012 by Florin Muresan (CEO) and Calin Vingan (CTO), with the company legally based in London, UK and its product team working from Cluj-Napoca, Romania. The plugin has been downloaded more than 1.3 million times and gives WordPress site owners a daily SEO task roadmap, AI-assisted keyword research, live on-page optimization scoring as they write content, an SEO audit suite, and rank tracking, all without leaving the WordPress editor. Squirrly SEO uses a freemium pricing model: a Free plan covers one website with limited monthly keyword research and audit credits, while paid plans start at 9.99 US dollars per month for the PRO tier (5 websites, 25 focus pages, 50 AI keyword researches per month), scaling up through a Web Dev Kit plan aimed at agencies and a Business plan with expanded website, keyword, and audit quotas. It is positioned as an alternative to Yoast SEO and Rank Math, differentiated by its emphasis on AI-guided daily tasks rather than static checklists. Squirrly SEO is best suited for WordPress bloggers, content marketers, and small agencies wanting an all-in-one keyword research, on-page optimization, and rank-tracking tool inside their existing WordPress dashboard.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2bc1080d-a815-4f4e-a679-844e458a7639';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2bc1080d-a815-4f4e-a679-844e458a7639' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Daily SEO Roadmap$q$, $q$Generates a prioritized daily list of SEO tasks and content opportunities for each website.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$AI Keyword Research$q$, $q$Suggests keyword opportunities using AI analysis of search data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Live Content Assistant$q$, $q$Scores blog posts and pages in real time against target keywords while writing in the WordPress editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$SEO Audit Suite$q$, $q$Scans pages for on-site technical SEO issues and provides fix recommendations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Rank Tracking$q$, $q$Monitors keyword ranking positions over time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Schema Markup Support$q$, $q$Helps pages qualify for rich results by adding structured data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$SERP Snippet Preview$q$, $q$Shows how a page's title and description will appear in search results before publishing.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Multi-site Management$q$, $q$Agency-focused plans let users manage SEO across multiple client WordPress sites from one account.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$All-in-one tool covering keyword research, on-page optimization, audits, and rank tracking$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Free plan available for small sites getting started with SEO$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$AI-guided daily tasks make SEO approachable for non-experts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Built specifically for WordPress with tight editor integration$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Established plugin with over a decade of development and 1.3 million-plus downloads$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Free plan quotas for keyword researches and audit pages are limited for larger sites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Less widely adopted than category leaders like Yoast SEO and Rank Math$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Higher-tier plans can become costly for agencies managing many client sites$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$WordPress-only, so it is not usable on other content management systems$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Some advanced features require navigating multiple add-on products such as Web Dev Kit and Starbox$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Is Squirrly SEO free?$q$, $q$Yes, Squirrly SEO offers a free plan for one website with limited monthly keyword research and audit allowances; paid plans start at 9.99 US dollars per month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Who founded Squirrly SEO?$q$, $q$Squirrly SEO was founded in September 2012 by Florin Muresan and Calin Vingan.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$What platform does Squirrly SEO work on?$q$, $q$Squirrly SEO is a plugin built specifically for WordPress.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$How is Squirrly SEO different from Yoast SEO?$q$, $q$Squirrly SEO emphasizes an AI-generated daily task roadmap and live content scoring, while Yoast focuses more on static readability and SEO checklists per page.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Does Squirrly SEO include rank tracking?$q$, $q$Yes, paid plans include keyword rank tracking to monitor search position changes over time.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Does Squirrly SEO offer agency plans?$q$, $q$Yes, the Web Dev Kit and Business plans are designed for agencies managing multiple client websites.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Does Squirrly SEO support schema markup?$q$, $q$Yes, the plugin can add structured data to help pages qualify for rich search results.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$How many times has Squirrly SEO been downloaded?$q$, $q$Squirrly SEO has surpassed 1.3 million downloads on WordPress.org.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Solo Bloggers and Small Business Sites$q$, $q$Site owners use the Free or PRO plan to research keywords and optimize blog posts without hiring an SEO specialist.$q$, $q$Bloggers and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Content Marketing Teams$q$, $q$In-house marketers use the daily roadmap and content assistant to plan and optimize a steady stream of blog content around target keywords.$q$, $q$Content marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$WordPress Agencies$q$, $q$Agencies use the Web Dev Kit or Business plans to manage SEO across many client WordPress sites from a single account.$q$, $q$WordPress agencies and freelance consultants$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["1 website","1 focus page per account","5 AI keyword researches per month","1 audit suite page per month","Lite audit suite version","Basic SEO training"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$PRO$q$, $q$$9.99/month$q$, $q$monthly$q$, NULL, $q$["5 websites","25 focus pages per account","50 AI keyword researches per month","100 audit suite pages per month","Premium audit suite version","Professional rank tracking","Email and social media support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Web Dev Kit$q$, $q$$51.20/month$q$, $q$monthly$q$, NULL, $q$["10 websites","70 focus pages per account","300 AI keyword researches per month","300 audit suite pages per month","2,000 SERP checker credits","Full content analytics","Custom client credit limits","Business-level training"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$Business$q$, $q$$71.99/month$q$, $q$monthly$q$, NULL, $q$["7 websites","70 focus pages per account","300 AI keyword researches per month","300 audit suite pages per month","3,000 SERP checker credits","Full content analytics","Business-level training"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '2bc1080d-a815-4f4e-a679-844e458a7639';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$overview$q$, $q$What Is Squirrly SEO$q$, 2, ARRAY[$q$Squirrly SEO is a WordPress SEO plugin that combines keyword research, on-page content scoring, technical audits, and rank tracking into a single dashboard built directly into WordPress. It was founded in 2012 by Florin Muresan and Calin Vingan and has grown into one of the more established AI-assisted SEO tools in the WordPress plugin ecosystem, with over 1.3 million downloads.$q$, $q$Rather than presenting SEO as a one-time checklist, Squirrly SEO organizes optimization work around Focus Pages and a daily task roadmap, guiding site owners toward specific keyword opportunities and content improvements as they write.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Squirrly SEO's toolset spans the full SEO workflow: AI-assisted keyword research that suggests ranking opportunities, a live content assistant that scores blog posts and pages against target keywords while writing, a technical SEO audit suite that flags on-site issues, and rank tracking to monitor keyword positions over time. The plugin also includes SERP snippet previews, internal linking suggestions, and schema markup support to help pages qualify for rich results.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2bc1080d-a815-4f4e-a679-844e458a7639', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Squirrly SEO follows a freemium model. The Free plan supports one website with limited monthly keyword research and audit allowances. The PRO plan starts at 9.99 US dollars per month and expands quotas to 5 websites, 25 focus pages, and 50 AI keyword researches per month. Higher tiers, the Web Dev Kit and Business plans, are priced for agencies and larger teams managing multiple client websites, with expanded website counts, SERP checker credits, and full content analytics.$q$]::text[], 2);


-- ── SRS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SRS (Simple Realtime Server) is an open-source, high-performance real-time video streaming server supporting RTMP, WebRTC, HLS, SRT, and other protocols for building live streaming and video conferencing infrastructure.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$Chinese$q$]::text[],
  seo_title = COALESCE($q$SRS (Simple Realtime Server): Open-Source Streaming Server$q$, seo_title),
  seo_meta_description = COALESCE($q$SRS is a free, open-source real-time video server supporting RTMP, WebRTC, HLS, and SRT. Learn features, use cases, and how it compares.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SRS, which stands for Simple Realtime Server, is a free and open-source, MIT-licensed real-time video streaming server first started in 2013 and hosted at ossrs.io and on GitHub under the ossrs organization. It functions as a media gateway that ingests, converts between, and distributes live video streams across multiple protocols, including RTMP, WebRTC, HLS, HTTP-FLV, HTTP-TS, SRT, MPEG-DASH, and GB28181, with codec support for H.264, H.265, AV1, VP9, AAC, Opus, and G.711. Built in ANSI C++ using coroutine-based concurrency rather than async callbacks, SRS is designed to be cloud-native, shipping as a Docker image with Kubernetes deployment support and built-in telemetry. It works alongside common streaming tools such as FFmpeg, OBS Studio, and VLC in a typical publish-and-play server model, making it suitable for live streaming platforms, video conferencing backends, and IPTV or surveillance systems that need protocol conversion between RTMP, SRT, and WebRTC. Because SRS is entirely open source with no company or paid tier, there is no official commercial pricing; organizations self-host it on their own infrastructure and rely on the GitHub community, documentation, and blog for support. It is aimed primarily at backend and infrastructure engineers building custom live-streaming products rather than non-technical end users.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Multi-protocol Streaming Gateway$q$, $q$Ingests and converts between RTMP, WebRTC, HLS, HTTP-FLV, SRT, MPEG-DASH, and GB28181.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Broad Codec Support$q$, $q$Supports H.264, H.265, AV1, VP9, AAC, Opus, and G.711 codecs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Low-latency WebRTC Output$q$, $q$Converts incoming streams to WebRTC for sub-second browser-based playback.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Cloud-native Deployment$q$, $q$Ships as a Docker image with Kubernetes support and built-in telemetry.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Coroutine-based Architecture$q$, $q$Built in ANSI C++ using coroutines instead of async callbacks for simpler, high-throughput stream handling.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Compatibility with Standard Streaming Tools$q$, $q$Works with FFmpeg, OBS Studio, and VLC in a publish-and-play workflow.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Cross-platform Support$q$, $q$Runs on Linux, Windows, and macOS.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Open Source and Self-hostable$q$, $q$Fully free under the MIT license with source code available on GitHub.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Completely free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Supports an unusually wide range of streaming protocols in a single server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Cloud-native design makes it straightforward to deploy in Docker and Kubernetes environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Active GitHub community and ongoing development since 2013$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Coroutine-based architecture is designed for high concurrency without callback complexity$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Requires self-hosting and infrastructure management, with no managed SaaS offering$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Documentation and community support are primarily developer-oriented, with a learning curve for newcomers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$No official enterprise support contract or SLA from a company$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Best suited to teams with backend and DevOps expertise rather than non-technical users$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Advanced protocol conversion setups can require careful configuration to avoid latency or quality issues$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Is SRS free?$q$, $q$Yes, SRS is completely free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$What does SRS stand for?$q$, $q$SRS stands for Simple Realtime Server.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$What protocols does SRS support?$q$, $q$SRS supports RTMP, WebRTC, HLS, HTTP-FLV, HTTP-TS, SRT, MPEG-DASH, and GB28181.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$When was SRS started?$q$, $q$The SRS project began in 2013.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Can SRS run in Docker?$q$, $q$Yes, SRS provides an official Docker image and supports Kubernetes deployment.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$What is SRS used for?$q$, $q$SRS is used to build live streaming platforms, video conferencing backends, and protocol-conversion gateways between RTMP, SRT, and WebRTC.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$What programming language is SRS written in?$q$, $q$SRS is written in ANSI C++ (98).$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Does SRS support low-latency streaming?$q$, $q$Yes, SRS can output WebRTC and SRT for low-latency delivery in addition to higher-latency formats like HLS.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Live Streaming Platforms$q$, $q$Developers use SRS as the ingest and distribution backbone for custom live streaming products, converting RTMP camera or encoder feeds into HLS and WebRTC for viewers.$q$, $q$Streaming platform engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Video Conferencing and Real-time Communication$q$, $q$Teams building WebRTC-based conferencing or interactive streaming tools use SRS as a media server handling stream routing and low-latency delivery.$q$, $q$Real-time communication developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$IPTV and Surveillance Systems$q$, $q$Organizations use SRS's GB28181 and protocol conversion support to integrate IP camera feeds into streaming and monitoring systems.$q$, $q$IPTV and video surveillance integrators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, $q$one-time$q$, NULL, $q$["Full source code on GitHub","MIT license","All streaming protocols and codecs","Docker and Kubernetes deployment","Community support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'abc2721a-0a2c-4cbe-a939-ce3315e4592a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$overview$q$, $q$What Is SRS$q$, 2, ARRAY[$q$SRS, short for Simple Realtime Server, is an open-source real-time video streaming server that began development in 2013. It is designed to be a lightweight but high-efficiency media server capable of ingesting live video from encoders like OBS Studio or FFmpeg and redistributing it across a wide range of streaming protocols.$q$, $q$The project is maintained as a community-driven open-source effort under the ossrs GitHub organization and published at ossrs.io. SRS is written in ANSI C++ and uses coroutine-based concurrency, which its maintainers describe as avoiding the complexity of traditional async callback-based streaming server designs, while remaining portable across Linux, Windows, and macOS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SRS supports an unusually broad set of streaming protocols out of the box, including RTMP, WebRTC, HLS, HTTP-FLV, HTTP-TS, SRT, MPEG-DASH, and GB28181, along with codec support for H.264, H.265, AV1, VP9, AAC, Opus, and G.711. This lets SRS act as a protocol gateway, converting a single incoming stream, for example RTMP from OBS, into multiple output formats simultaneously, such as WebRTC for low-latency browser playback and HLS for broad compatibility. SRS is also built to be cloud-native, with an official Docker image, Kubernetes deployment support, and built-in telemetry for monitoring streaming infrastructure at scale.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SRS is completely free and open source under the MIT license, with no paid tiers, subscriptions, or per-stream fees from the project itself. Organizations deploy SRS on their own servers or cloud infrastructure and pay only for their own hosting and bandwidth costs. Support is community-based through GitHub issues, the project blog, and documentation rather than a commercial support contract.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('abc2721a-0a2c-4cbe-a939-ce3315e4592a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Stable Diffusion ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Stable Diffusion is a family of open-source, text-to-image generative AI models developed by Stability AI that turn text prompts into images and can run locally or via Stability AI's paid API.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (open weights); API from about $0.01 per credit$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE($q$150-200 employees$q$, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Stable Diffusion: Open-Source AI Image Generator Guide$q$, seo_title),
  seo_meta_description = COALESCE($q$Stable Diffusion is Stability AI's open-source text-to-image model. See how it works, pricing, versions, and key features for creators and developers.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Stable Diffusion is a family of open-source, text-to-image generative AI models created by Stability AI, a company founded in 2019 by Emad Mostaque and headquartered in London, United Kingdom. First released publicly in August 2022, Stable Diffusion became one of the most widely used AI image generators because its model weights are openly downloadable and can run on consumer-grade GPUs, unlike closed models such as DALL-E or Midjourney that are only accessible through hosted apps. The model has gone through several major versions, culminating in Stable Diffusion 3.5 (released October 2024), which includes Large, Large Turbo, and Medium variants. Stable Diffusion 3.5 is distributed under the Stability AI Community License, which is free for research, non-commercial use, and commercial use by organizations or individuals with under 1 million US dollars in annual revenue; larger organizations must obtain an Enterprise License directly from Stability AI. Beyond free local use, Stability AI also offers a pay-as-you-go API priced around 0.01 US dollars per credit, with an image from the Large model costing roughly 6.5 credits (about 6.5 cents) and Turbo costing about 4 credits, and no subscription is required. Stable Diffusion is used by developers building AI image tools, digital artists, marketers generating creative assets, and researchers studying generative AI, and it can be fine-tuned or run through third-party interfaces like Automatic1111 or ComfyUI.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5355600e-7720-44d4-a9be-5558cbddc251';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5355600e-7720-44d4-a9be-5558cbddc251' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Text-to-Image Generation$q$, $q$Produces original images from natural-language text prompts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Open Model Weights$q$, $q$Model weights are downloadable and can run locally rather than only through a hosted app.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Image-to-Image and Inpainting$q$, $q$Supports transforming existing images and editing specific regions with new generated content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Multiple Model Variants$q$, $q$Offers Large, Large Turbo, and Medium versions of Stable Diffusion 3.5 balancing quality and speed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Fine-tuning Support$q$, $q$Can be fine-tuned on custom datasets to match specific styles or brands.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Runs on Consumer Hardware$q$, $q$Designed to run on consumer-grade GPUs rather than requiring specialized data-center infrastructure.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Pay-as-you-go API$q$, $q$Stability AI offers a hosted API with credit-based pricing and no required subscription.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Large Third-party Ecosystem$q$, $q$Supported by community tools like Automatic1111 and ComfyUI for local use and workflow customization.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Open model weights allow free local use and full control over deployment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$No subscription required for API access; pricing is pay-as-you-go$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Large community ecosystem of fine-tuned models, plugins, and interfaces$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Runs on consumer-grade hardware, lowering the barrier to entry$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Multiple model variants let users balance image quality against generation speed$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Running the model locally requires a capable GPU and technical setup$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Enterprise commercial use above the revenue threshold requires a separate paid license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Output quality and prompt-following can lag behind some closed competitors like Midjourney in certain styles$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Licensing terms between the Community and Enterprise License can be confusing for businesses to interpret$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Community-contributed fine-tunes vary widely in quality and licensing clarity$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Is Stable Diffusion free?$q$, $q$Yes, the model weights are free to download and run under the Stability AI Community License for research, non-commercial, and most commercial use; large enterprises need an Enterprise License.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Who created Stable Diffusion?$q$, $q$Stable Diffusion was created by Stability AI, a company founded in 2019 by Emad Mostaque and headquartered in London.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$When was Stable Diffusion released?$q$, $q$Stable Diffusion was first released publicly in August 2022.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$What is Stable Diffusion 3.5?$q$, $q$Stable Diffusion 3.5 is the latest major model family, released in October 2024, including Large, Large Turbo, and Medium variants.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Can Stable Diffusion run on my own computer?$q$, $q$Yes, because its weights are open, Stable Diffusion can run locally on consumer GPUs using tools like Automatic1111 or ComfyUI.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$How much does the Stability AI API cost?$q$, $q$The API is pay-as-you-go, priced at about 0.01 US dollars per credit, with a Large model image costing roughly 6.5 credits.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Is Stable Diffusion open source?$q$, $q$Its weights are openly available under the Stability AI Community License, though the license includes usage conditions rather than being a fully unrestricted open-source license.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$What is Stable Diffusion used for?$q$, $q$It is used for AI art generation, product and marketing imagery, game and concept art, and as a base model for custom fine-tuned image generation tools.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Digital Art and Creative Content$q$, $q$Artists and designers use Stable Diffusion to generate concept art, illustrations, and creative assets from text prompts.$q$, $q$Digital artists and designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Marketing and Product Imagery$q$, $q$Marketing teams generate campaign visuals, social media graphics, and product mockups without commissioning custom photography.$q$, $q$Marketing and creative teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$AI Application Development$q$, $q$Developers embed Stable Diffusion into their own apps and services via self-hosted deployment or the Stability AI API to offer image generation features.$q$, $q$AI and software developers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Open Weights (Self-Hosted)$q$, $q$Free$q$, $q$one-time$q$, NULL, $q$["Full model weights download","Stability AI Community License","Run locally on own hardware","Free for organizations under $1M annual revenue"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$API Pay-as-you-go$q$, $q$About $0.01 per credit$q$, $q$usage-based$q$, NULL, $q$["No monthly subscription required","Roughly 6.5 credits per Large model image","Roughly 4 credits per Turbo model image","Hosted infrastructure"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$Enterprise License$q$, $q$Custom pricing$q$, $q$contact sales$q$, NULL, $q$["Commercial license for organizations over $1M annual revenue","Dedicated support","Custom terms"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '5355600e-7720-44d4-a9be-5558cbddc251';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$overview$q$, $q$What Is Stable Diffusion$q$, 2, ARRAY[$q$Stable Diffusion is a text-to-image generative AI model developed by Stability AI, a UK-based AI company founded in 2019 by Emad Mostaque. First released publicly in August 2022, Stable Diffusion generates original images from text prompts using a diffusion-based deep learning process.$q$, $q$What set Stable Diffusion apart from competitors like DALL-E and Midjourney was its open release of model weights, allowing anyone to download and run the model on their own hardware, including consumer GPUs, rather than only through a hosted application. This openness spurred a large ecosystem of community tools, fine-tuned model variants, and third-party interfaces such as Automatic1111 and ComfyUI.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Stable Diffusion generates images from natural-language text prompts and also supports image-to-image transformation, inpainting, outpainting, and fine-tuning on custom datasets. The latest major release, Stable Diffusion 3.5, introduced Large, Large Turbo, and Medium model variants that trade off image quality against generation speed and hardware requirements, and it can run on consumer hardware rather than requiring specialized data-center GPUs. Because the model weights are open, developers can fine-tune Stable Diffusion for specific art styles, product categories, or brand aesthetics, and integrate it directly into their own applications rather than depending on a third-party hosted API.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Stable Diffusion's model weights are free to download and run locally under the Stability AI Community License, which permits free research, non-commercial, and commercial use for organizations or individuals with under 1 million US dollars in annual revenue; organizations above that threshold need an Enterprise License from Stability AI. For users who prefer not to run the model themselves, Stability AI's hosted API uses a pay-as-you-go credit system priced at about 0.01 US dollars per credit, with no monthly subscription required; a single image from the Large model costs roughly 6.5 credits, and the faster Turbo variant costs about 4 credits per image.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5355600e-7720-44d4-a9be-5558cbddc251', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Stack AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Stack AI is a no-code platform for building and deploying enterprise AI agents and workflows that connect large language models to internal data and business systems without writing code.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (Enterprise plan custom-priced)$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Stack AI: No-Code Enterprise AI Agent Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Stack AI lets enterprises build and deploy no-code AI agents and workflows. See pricing, features, founders, and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Stack AI is a no-code platform for building and deploying AI agents and automated workflows, founded in 2022 by MIT-trained engineers Bernard Aceituno and Toni Rosinol and headquartered in San Francisco, California. The company went through Y Combinator and has raised roughly 19 million US dollars in total funding, including a 3 million US dollar seed round in 2023 and a 16 million US dollar Series A in 2025 led by Lobby Capital and LifeX Ventures. Stack AI lets non-developers connect large language models to internal data sources, documents, and business systems using a visual, drag-and-drop workflow builder, targeting IT teams and operations leaders who need to automate document processing, internal knowledge management, and multi-step business workflows without custom engineering. In 2024 and 2025 the company repositioned from a broader SMB audience to focus specifically on enterprise customers, marketing itself as an AI Agents for the Enterprise platform for Fortune 500-scale organizations. Pricing follows a freemium model: a Free plan includes 500 workflow runs per month, two projects, and one user seat with community support via Discord, while the Enterprise plan is custom-priced and adds unlimited projects, dedicated infrastructure, on-premises and VPC deployment options, single sign-on, and SOC 2, HIPAA, and GDPR compliance support.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '24da33b5-7fec-4150-97a5-ac2d1c92593c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$No-code Workflow Builder$q$, $q$Visual, drag-and-drop interface for chaining LLM calls, data sources, and logic into AI agents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Enterprise Data Connectors$q$, $q$Connects AI agents to internal documents, knowledge bases, and business systems.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$On-premises and VPC Deployment$q$, $q$Supports deploying agents within a customer's own infrastructure for data control.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Single Sign-On and Compliance$q$, $q$Offers SSO along with SOC 2, HIPAA, and GDPR compliance support for enterprise buyers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Multi-model Support$q$, $q$Lets teams build workflows using different large language models depending on the task.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Dedicated Solution Engineers$q$, $q$Enterprise customers get dedicated technical support for building and deploying agents.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Project-based Organization$q$, $q$Workflows are organized into projects with configurable team seats and access.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Usage-based Run Allocation$q$, $q$Plans are scoped around monthly workflow run allocations that scale with plan tier.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$No-code interface makes building AI agents accessible to non-developers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Strong enterprise deployment options, including on-premises and VPC hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Backed by credible investors and has passed through Y Combinator$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Compliance support for SOC 2, HIPAA, and GDPR suits regulated industries$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Free plan available for evaluating the platform before committing$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$2024-2025 pivot toward enterprise-only customers reduced accessibility for small businesses and individuals$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Enterprise plan pricing is not publicly disclosed and requires a sales conversation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Free plan's 500 monthly runs and single seat are limiting for real production use$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Newer company founded in 2022 with a shorter track record than some competitors$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$No-code tools can hit complexity ceilings for highly custom or unusual workflows$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Is Stack AI free?$q$, $q$Stack AI offers a Free plan with 500 workflow runs per month, two projects, and one seat; larger usage requires the custom-priced Enterprise plan.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Who founded Stack AI?$q$, $q$Stack AI was founded in 2022 by Bernard Aceituno and Toni Rosinol.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Where is Stack AI based?$q$, $q$Stack AI is headquartered in San Francisco, California.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Who is Stack AI for?$q$, $q$Stack AI is aimed primarily at enterprise IT and operations teams that need to build AI agents and automate workflows without custom software development.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Does Stack AI support on-premises deployment?$q$, $q$Yes, the Enterprise plan includes on-premises and VPC deployment options.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$How much funding has Stack AI raised?$q$, $q$Stack AI has raised approximately 19 million US dollars, including a 2023 seed round and a 2025 Series A.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Is Stack AI a no-code platform?$q$, $q$Yes, Stack AI provides a visual, drag-and-drop workflow builder for creating AI agents without writing code.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Does Stack AI support compliance requirements like HIPAA?$q$, $q$Yes, the Enterprise plan includes SOC 2, HIPAA, and GDPR compliance support.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Enterprise Document Processing$q$, $q$IT teams use Stack AI to build agents that extract, summarize, and route information from large volumes of internal documents.$q$, $q$Enterprise IT and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Internal Knowledge Management$q$, $q$Organizations connect Stack AI agents to internal knowledge bases so employees can query company information through a conversational interface.$q$, $q$Enterprise knowledge management teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Regulated Industry Workflow Automation$q$, $q$Companies in finance, healthcare, and other regulated sectors use Stack AI's on-premises and compliance features to automate workflows while meeting data governance requirements.$q$, $q$Regulated enterprises in finance and healthcare$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["500 workflow runs per month","2 projects","1 seat","Community support via Discord"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Enterprise$q$, $q$Custom pricing$q$, $q$contact sales$q$, NULL, $q$["Custom run allocation","Unlimited projects","Customizable team seats","All features and data loaders","Dedicated infrastructure","Dedicated solution engineers","On-premises and VPC deployment","Single sign-on","SOC 2, HIPAA, and GDPR compliance"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$overview$q$, $q$What Is Stack AI$q$, 2, ARRAY[$q$Stack AI is a no-code platform that lets organizations build and deploy AI agents and automated workflows by connecting large language models to internal data sources and business systems, without writing custom code. It was founded in 2022 by Bernard Aceituno and Toni Rosinol, both MIT-trained engineers, and is headquartered in San Francisco.$q$, $q$The company went through Y Combinator and has raised approximately 19 million US dollars in funding across a 2023 seed round and a 2025 Series A. Since 2024, Stack AI has repositioned itself specifically toward enterprise customers, describing itself as an AI Agents for the Enterprise platform aimed at IT and operations teams inside large organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Stack AI's core product is a visual workflow builder that lets users chain together LLM calls, document loaders, APIs, and business logic into working AI agents without writing code. It supports connecting to internal knowledge bases and documents so agents can answer questions or automate processes using an organization's own data, and it offers enterprise-focused deployment options including on-premises and VPC hosting, single sign-on, and compliance support for SOC 2, HIPAA, and GDPR requirements.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Stack AI uses a freemium pricing model. The Free plan includes 500 workflow runs per month, two projects, and a single user seat, with support provided through a community Discord server. The Enterprise plan is custom-priced and adds unlimited projects, custom run allocations, adjustable team seats, dedicated infrastructure, dedicated solution engineers, on-premises and VPC deployment options, single sign-on, and SOC 2, HIPAA, and GDPR compliance.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── Stacker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Stacker is a no-code platform that lets teams build internal tools, client portals, and custom apps on top of data sources like Airtable and Google Sheets, using a prompt-to-app AI builder.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$50/month (Standard plan, 250 credits)$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$London, United Kingdom$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Stacker: No-Code Internal Tools and App Builder$q$, seo_title),
  seo_meta_description = COALESCE($q$Stacker is a no-code platform for building internal tools and client portals from Airtable or Google Sheets. See pricing, features, and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Stacker is a no-code platform, founded in 2017 by Sam Davyson and Michael Skelly and headquartered in London, United Kingdom, that helps operations teams and small businesses build internal tools, custom CRMs, and client-facing portals on top of existing data sources such as Airtable and Google Sheets. The company has raised roughly 23 million US dollars in total funding, including a 20 million US dollar Series A in 2021 led by Andreessen Horowitz with participation from Y Combinator and Initialized Capital. Stacker's product connects directly to a team's spreadsheet or database so the resulting app always reflects the latest records, and it layers on role-based access controls that let businesses expose different views to internal staff versus external clients. The platform has since evolved to include a prompt-to-app AI builder, letting users describe the app they need in natural language and have Stacker generate a working relational database and interface. Pricing is credit-based and starts with a Standard plan at 50 US dollars per month for 250 credits, scaling up through higher credit tiers of 500, 1,000, 2,500, 5,000, and 10,000 credits per month, with an Enterprise plan offering custom credit volumes, single sign-on, and dedicated onboarding. A free trial with 100 US dollars of non-expiring credits is available with no credit card required.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Prompt-to-App AI Builder$q$, $q$Generates a working relational database and interface from a natural-language app description.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Airtable and Google Sheets Integration$q$, $q$Connects directly to existing spreadsheets and databases so apps stay in sync with source data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Role-based Access Control$q$, $q$Exposes different data views and permissions to internal staff versus external clients from one dataset.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Client Portals$q$, $q$Purpose-built support for building secure, branded portals for external clients and customers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$White-labeling and Custom Domains$q$, $q$Lets businesses brand their Stacker-built apps as their own product.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Workflow Automations$q$, $q$Supports scheduled and triggered automations within built apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$No Per-seat Pricing$q$, $q$Credit-based pricing rather than per-user seat fees, useful for apps with many external users.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Extensive Integration Library$q$, $q$Connects to over 2,000 third-party tools and data sources.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$No-code approach lets non-developers build functional internal tools and client portals quickly$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Credit-based pricing avoids per-seat costs, which suits apps with many external client users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Strong fit for teams already using Airtable or Google Sheets as their data layer$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$AI prompt-to-app builder speeds up initial app creation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Backed by significant venture funding, including a $20 million Series A from Andreessen Horowitz$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Credit-based pricing can become expensive as usage scales beyond the base tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Dependent on underlying data sources like Airtable, which have their own cost and scaling limits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Less suited to highly custom or complex application logic than full-code development$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Enterprise pricing is not publicly disclosed and requires contacting sales$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Recent rebrand from stackerhq.com to stacker.ai may cause some confusion for existing users$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Is Stacker free?$q$, $q$Stacker is not free, but it offers a free trial with 100 US dollars of non-expiring credits and no credit card required; paid plans start at 50 US dollars per month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Who founded Stacker?$q$, $q$Stacker was founded in 2017 by Sam Davyson and Michael Skelly.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$What data sources does Stacker connect to?$q$, $q$Stacker connects directly to sources such as Airtable and Google Sheets, along with a library of over 2,000 integrations.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Can Stacker build client portals?$q$, $q$Yes, Stacker is specifically designed to support secure, role-based client portals in addition to internal tools.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Does Stacker use AI to build apps?$q$, $q$Yes, Stacker includes a prompt-to-app AI builder that generates a database and interface from a natural-language description.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$How is Stacker priced?$q$, $q$Stacker uses a credit-based subscription model starting at 50 US dollars per month for 250 credits, with higher tiers for more usage.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Where is Stacker based?$q$, $q$Stacker is headquartered in London, United Kingdom.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Has Stacker rebranded?$q$, $q$Yes, Stacker's website now redirects from stackerhq.com to stacker.ai, reflecting product evolution toward AI-assisted app building.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Internal Operations Tools$q$, $q$Operations teams replace manual spreadsheet workflows with structured internal apps for tracking projects, inventory, or customer records.$q$, $q$Operations and business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Client and Partner Portals$q$, $q$Businesses build secure, branded portals that give external clients or partners controlled access to relevant data.$q$, $q$Agencies and service businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Custom CRM Replacement$q$, $q$Small businesses use Stacker to build a lightweight custom CRM on top of existing Airtable or Google Sheets data rather than adopting a heavier, generic CRM platform.$q$, $q$Small businesses and startups$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Standard (250 credits)$q$, $q$$50/month$q$, $q$monthly$q$, NULL, $q$["Unlimited agents","All 2,000-plus integrations","Unlimited customer portals","White-label support","Custom domains","Multi-channel access","Scheduled automations","No per-seat charges"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Standard (500 credits)$q$, $q$$100/month$q$, $q$monthly$q$, NULL, $q$["Same feature set as Standard with a larger monthly credit allocation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Standard (1,000 credits)$q$, $q$$200/month$q$, $q$monthly$q$, NULL, $q$["Same feature set as Standard with a larger monthly credit allocation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Standard (2,500 credits)$q$, $q$$500/month$q$, $q$monthly$q$, NULL, $q$["Same feature set as Standard with a larger monthly credit allocation"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Standard (5,000 credits)$q$, $q$$1,000/month$q$, $q$monthly$q$, NULL, $q$["Same feature set as Standard with a larger monthly credit allocation"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Standard (10,000 credits)$q$, $q$$2,000/month$q$, $q$monthly$q$, NULL, $q$["Same feature set as Standard with a larger monthly credit allocation"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$Enterprise$q$, $q$Custom pricing$q$, $q$contact sales$q$, NULL, $q$["Custom credit volumes","Dedicated onboarding","SLA with priority support","Security review and DPA","Single sign-on with advanced access controls","Bring your own LLM","Custom integrations"]$q$::jsonb, 6);

DELETE FROM tool_content_blocks WHERE tool_id = '443eb7f9-9f62-4c2d-9263-264fcc76d4ee';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$overview$q$, $q$What Is Stacker$q$, 2, ARRAY[$q$Stacker is a no-code platform, founded in 2017 by Sam Davyson and Michael Skelly and based in London, that lets operations teams turn existing spreadsheets and databases into fully functional internal tools, custom CRMs, and client-facing portals. Rather than requiring a fresh data migration, Stacker connects directly to sources like Airtable and Google Sheets so any app built on top of it stays in sync with the underlying records.$q$, $q$The company has raised about 23 million US dollars in funding, including a 20 million US dollar Series A round led by Andreessen Horowitz in 2021, with earlier backing from Y Combinator and Initialized Capital. More recently, Stacker added an AI-driven, prompt-to-app builder that generates a working database and interface from a natural-language description of the app a user wants.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Stacker's core capability is turning a spreadsheet or database connection into a structured app with forms, tables, dashboards, and role-based views, without requiring custom development. Role-based access controls let teams expose different data and permissions to internal staff versus external clients from the same underlying dataset, which makes Stacker popular for client portals as well as internal operations tools. The newer AI builder lets users describe their desired app in plain language and have Stacker scaffold the relational data model and interface automatically, and the platform also supports automations, custom domains, and white-labeled client-facing apps.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Stacker uses a credit-based subscription model. The Standard plan starts at 50 US dollars per month for 250 credits, with higher credit tiers available at 100, 200, 500, 1,000, and 2,000 US dollars per month for progressively larger credit allocations. All Standard-tier plans include unlimited customer portals, white-label branding, custom domains, and access to Stacker's integration library, with no per-seat charges. The Enterprise plan offers custom credit volumes, dedicated onboarding, an SLA with priority support, and single sign-on, and a free trial including 100 US dollars of non-expiring credits is available without a credit card.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('443eb7f9-9f62-4c2d-9263-264fcc76d4ee', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── stackstorm ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$StackStorm is a free, open-source, event-driven automation platform that lets DevOps and security teams build if-this-then-that rules and complex workflows connecting infrastructure, applications, and ChatOps tools.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Palo Alto, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$StackStorm: Open-Source Event-Driven Automation Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$StackStorm is a free, open-source automation engine for DevOps, security, and ChatOps workflows. See features, history, and use cases.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$StackStorm is a free, open-source, event-driven automation platform originally founded in 2013 by Evan Powell and Dmitri Zimine as a company headquartered in Palo Alto, California, with early funding from XSeed Capital. StackStorm lets DevOps, IT operations, and security teams build automation rules ranging from simple if-this-then-that triggers to complex multi-step workflows that connect applications, infrastructure, and monitoring tools, and it is widely associated with ChatOps-style automation and automated incident remediation. The company was acquired by Brocade Communications Systems in 2016, then transitioned to Extreme Networks in 2017 as part of Extreme's acquisition of Brocade's data center networking business, which offered a commercial product built on StackStorm called Extreme Workflow Composer. In October 2019, Extreme Networks transitioned StackStorm to the Linux Foundation to give the open-source project neutral, community-driven governance, and it continues to operate as a Linux Foundation project today with no company or paid tiers behind the core software. StackStorm is completely free and open source, hosted on GitHub, with enterprise support available only through third-party partners such as Encore Technologies and Bitovi rather than an official vendor. Notable production users have included Netflix, which built its Winston self-service remediation platform on StackStorm, as well as Pearson and Target.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Event-driven Rules Engine$q$, $q$Triggers automation ranging from simple if-then rules to complex multi-step workflows based on system events.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$YAML-based Workflow Definitions$q$, $q$Workflows and automation packs are defined declaratively, making them version-controllable.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$ChatOps Integration$q$, $q$Connects to chat platforms so teams can trigger and monitor automation from a shared chat interface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Automated Remediation$q$, $q$Detects issues via triggers and runs predefined recovery workflows without manual intervention.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Broad Integration Pack Ecosystem$q$, $q$Community-maintained integration packs connect StackStorm to a wide range of infrastructure and application tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Continuous Deployment Support$q$, $q$Can be used to orchestrate automated deployment pipelines alongside other DevOps tooling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Security Response Automation$q$, $q$Supports SOAR-style, meaning Security Orchestration, Automation, and Response, use cases for automated incident response.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Linux Foundation Governance$q$, $q$Operates under neutral, community-driven open-source governance rather than a single vendor.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Completely free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Neutral Linux Foundation governance reduces single-vendor lock-in risk$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Proven at large-scale production use, including Netflix's Winston remediation platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Flexible enough to cover DevOps automation, ChatOps, and security response use cases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Large ecosystem of community-maintained integration packs$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$No official vendor-backed enterprise support or SLA since the transition to the Linux Foundation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Setup and workflow authoring have a steep learning curve, especially for complex YAML-based workflows$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Development pace and community activity have slowed compared to the platform's Brocade and Extreme era$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Requires self-hosting and infrastructure management with no managed cloud offering$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Best suited to teams with dedicated DevOps or platform engineering expertise$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Is StackStorm free?$q$, $q$Yes, StackStorm is completely free and open source, governed as a Linux Foundation project.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Who created StackStorm?$q$, $q$StackStorm was founded in 2013 by Evan Powell and Dmitri Zimine.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Is StackStorm still maintained?$q$, $q$Yes, StackStorm continues to be maintained as an open-source project under Linux Foundation governance, though development pace has slowed since its earlier commercially backed years.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$What happened to StackStorm's original company?$q$, $q$StackStorm was acquired by Brocade Communications Systems in 2016, transitioned to Extreme Networks in 2017, and moved to the Linux Foundation in 2019.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$What is StackStorm used for?$q$, $q$StackStorm is used for event-driven DevOps automation, ChatOps, automated incident remediation, and security orchestration and response.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Does StackStorm offer paid enterprise support?$q$, $q$Not directly from StackStorm itself; commercial support is available through third-party partners such as Encore Technologies and Bitovi.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Who uses StackStorm in production?$q$, $q$Notable users have included Netflix, which built its Winston remediation platform on StackStorm, along with Pearson and Target.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$What language are StackStorm workflows written in?$q$, $q$StackStorm workflows and automation packs are typically defined in YAML.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Automated Incident Remediation$q$, $q$Site reliability and operations teams use StackStorm to automatically detect and remediate infrastructure issues without manual intervention.$q$, $q$Site reliability engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$ChatOps-driven Operations$q$, $q$DevOps teams trigger and monitor deployments and operational tasks directly from chat platforms using StackStorm's ChatOps integrations.$q$, $q$DevOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Security Orchestration and Automated Response$q$, $q$Security teams use StackStorm's event-driven workflows to automate incident response and threat remediation steps.$q$, $q$Security operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, $q$one-time$q$, NULL, $q$["Full source code on GitHub","Linux Foundation governed project","Community integration packs","Community support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '50396ab1-b0af-4e6a-b697-fc5496e9b3b7';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$overview$q$, $q$What Is StackStorm$q$, 2, ARRAY[$q$StackStorm is a free, open-source, event-driven automation engine that connects applications, infrastructure, and monitoring systems so teams can automate remediation, deployments, and operational workflows. It was founded in 2013 by Evan Powell and Dmitri Zimine, with early backing from XSeed Capital, and launched out of stealth in 2014 as a company headquartered in Palo Alto, California.$q$, $q$StackStorm's ownership changed hands twice: Brocade Communications Systems acquired the company in 2016, and Brocade's data center networking assets, including StackStorm, moved to Extreme Networks in 2017. In October 2019, Extreme Networks transitioned the open-source project to the Linux Foundation, giving it neutral, community-based governance that continues today with no single commercial vendor behind the core software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$StackStorm centers on an automation rules engine that reacts to events from connected systems, ranging from simple if-this-then-that triggers to complex, multi-step workflows defined in YAML. It integrates with infrastructure tools, monitoring systems, and chat platforms to support ChatOps-style automation, where teams trigger and observe automation directly from a chat interface. StackStorm also supports automated remediation, where it detects an issue through an event trigger and runs a predefined recovery workflow without human intervention, a pattern popularized by Netflix's internally built Winston platform on top of StackStorm.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$StackStorm is completely free and open source, distributed under an open-source license and governed as a Linux Foundation project with no company selling paid tiers of the core software. There is no official enterprise edition or vendor-provided SLA; organizations that want commercial support typically work with third-party partners such as Encore Technologies, Bitovi, Ammeon, or Orchestral rather than paying StackStorm itself.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50396ab1-b0af-4e6a-b697-fc5496e9b3b7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;


-- Enrichment marathon batch: Typefully, Typemill, Typesense, TYPO3, Uberall, Ubersuggest, Ucraft, Udemy

-- ── Typefully ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Typefully is a distraction-free writing and scheduling tool for X (Twitter), LinkedIn, Threads, and Bluesky, built for creators and businesses who write threads and long-form social posts.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE($q$Remote (Italy-founded team)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Typefully Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Typefully is a writing and scheduling app for X, LinkedIn, Threads and Bluesky. See pricing, features, pros and cons before you sign up.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Typefully is a social media writing and scheduling application focused on X (Twitter), LinkedIn, Threads, and Bluesky, built by Italian founders Fabrizio Rinaldi and Francesco Di Lorenzo. It began as a weekend side project in June 2020, went viral on Hacker News, and grew into a bootstrapped business reporting over 220,000 users and roughly 1.6 million dollars in annual recurring revenue with a small team of around ten people; Twitter and Medium co-founder Evan Williams is a notable angel investor. Before Typefully, the same founders built and later sold Mailbrew, an email digest product, to focus fully on Typefully after it took off. The core product is a distraction-free editor for composing and scheduling threads and long posts, with a drag-and-drop thread composer, live character counts, an AI writing assistant, analytics on post performance, content curation and evergreen recycling tools, and team collaboration features. Typefully offers a free plan with limited scheduling, alongside paid tiers that unlock AI writing, analytics, and automation, with a Team plan aimed at multi-person accounts. It differentiates itself from generic social schedulers like Buffer or Hootsuite by focusing narrowly on writing quality and creator growth on text-first platforms, and it competes most directly with tools like Tweet Hunter and Hypefury in the X-growth-tool category, emphasizing a cleaner writing experience over broad multi-platform posting breadth. It is a popular choice among indie founders, writers, and creators who publish threads regularly.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05a53179-48a2-447f-a61a-608232327b8e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05a53179-48a2-447f-a61a-608232327b8e' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Thread composer$q$, $q$Drag-and-drop editor for writing and reordering multi-post threads with live character counts and preview.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$AI writing assistant$q$, $q$AI-powered drafting, rewriting, and hook suggestions available on paid plans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Multi-platform scheduling$q$, $q$Write once and schedule to X, LinkedIn, Threads, and Bluesky.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Analytics$q$, $q$Tracks impressions, engagement, and growth trends for published posts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Content curation and recycling$q$, $q$Save evergreen posts into a library and re-queue them automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Distraction-free writing mode$q$, $q$A clean editor built to reduce the friction of writing long-form social content.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Team collaboration$q$, $q$Shared workspaces and multi-seat accounts for teams managing several accounts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Auto-split and preview$q$, $q$Automatically detects thread breaks and shows an accurate native preview before publishing.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Purpose-built writing experience that many creators find better than X's native composer$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Clean, minimal interface with fast keyboard-driven workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Genuine free plan to try before paying$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Strong reputation among the X and LinkedIn creator community$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Supports multiple text-first platforms from one editor$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Free plan is very limited, allowing only one scheduled post at a time$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$AI features are locked behind higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Narrower platform support than broad social schedulers like Buffer or Hootsuite$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$No native support for visual-first platforms like Instagram or TikTok$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Team plan pricing can add up quickly for larger accounts$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$What is Typefully used for?$q$, $q$Typefully is used to write, schedule, and analyze posts and threads on X, LinkedIn, Threads, and Bluesky.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Is Typefully free?$q$, $q$Yes, Typefully has a free plan, but it only allows one scheduled post at a time; paid plans start around 8 dollars per month.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Who founded Typefully?$q$, $q$Typefully was created by Fabrizio Rinaldi and Francesco Di Lorenzo, who previously built the email app Mailbrew.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Does Typefully support LinkedIn?$q$, $q$Yes, Typefully supports writing and scheduling for LinkedIn in addition to X, Threads, and Bluesky.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Does Typefully have an AI writing assistant?$q$, $q$Yes, an AI assistant for drafting and improving posts is available on the Creator and Team plans.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Is Typefully better than Twitter's native composer?$q$, $q$Many users find Typefully's editor cleaner for drafting threads, with features like reordering and live previews the native composer lacks.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Can teams use Typefully together?$q$, $q$Yes, the Team plan supports multiple seats and shared workspaces for managing accounts collaboratively.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Who invested in Typefully?$q$, $q$Typefully is largely bootstrapped, with Twitter and Medium co-founder Evan Williams as a notable angel investor.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Growing an X audience$q$, $q$Creators use Typefully to draft and schedule threads designed to maximize engagement and follower growth.$q$, $q$Independent creators and writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Personal branding on LinkedIn$q$, $q$Professionals use Typefully to plan and schedule consistent LinkedIn posts alongside their X content.$q$, $q$Founders and marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Team content operations$q$, $q$Marketing teams use Typefully's collaboration tools to manage multiple brand or founder accounts from one workspace.$q$, $q$Startup marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Free$q$, $q$$0$q$, $q$monthly$q$, NULL, $q$["1 scheduled post","Basic editor","Limited scheduling"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Starter$q$, $q$$8/month$q$, $q$monthly$q$, NULL, $q$["Unlimited scheduling","Basic analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Creator$q$, $q$$19/month$q$, $q$monthly$q$, NULL, $q$["AI writing assistant","Advanced analytics","Content curation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$Team$q$, $q$$39/month$q$, $q$monthly per seat$q$, NULL, $q$["Multi-seat collaboration","Shared workspaces","All Creator features"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '05a53179-48a2-447f-a61a-608232327b8e';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$overview$q$, $q$What Is Typefully$q$, 2, ARRAY[$q$Typefully is a writing-first tool for composing, scheduling, and publishing content on X (Twitter), LinkedIn, Threads, and Bluesky. It was built by Fabrizio Rinaldi and Francesco Di Lorenzo, the same duo behind the email digest app Mailbrew, which they sold once Typefully's growth took off after launching in mid-2020.$q$, $q$The product centers on a minimal, distraction-free editor designed to make writing threads and long posts feel easier than typing directly into X or LinkedIn's native composers. It has grown into a bootstrapped, profitable company used by hundreds of thousands of creators, marketers, and founders.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Typefully's thread composer lets writers draft multi-post threads with drag-and-drop reordering, automatic thread-break detection, and a live preview that mirrors how the content will look once published.$q$, $q$Beyond writing, it includes an AI assistant for drafting and rewriting posts, scheduling and queueing across multiple platforms at once, analytics to track impressions and engagement over time, and a content curation feature for saving and recycling evergreen posts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05a53179-48a2-447f-a61a-608232327b8e', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Typefully offers a free plan limited to a single active scheduled post, useful for testing the editor before committing to a paid tier.$q$, $q$Paid plans run from a Starter tier at roughly 8 dollars per month up through a Creator tier near 19 dollars per month that unlocks AI writing and analytics, and a Team plan around 39 dollars per month per seat for collaborative accounts; annual billing typically saves about 20 percent versus paying monthly.$q$]::text[], 2);


-- ── Typemill ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Typemill is an open-source, self-hosted flat-file CMS built with Markdown for creating documentation sites, manuals, handbooks, and eBooks without a database.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE($q$Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_title = COALESCE($q$Typemill Review: Flat-File Markdown CMS Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Typemill is an open-source flat-file CMS for documentation and eBooks. Explore its pricing, plugins, and how it compares to database-driven CMS tools.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Typemill is an open-source flat-file content management system built on Slim PHP, Vue.js, and Tailwind CSS, created by German developer Sebastian Schürmanns and in active development since 2017 under his company Trendschau. Unlike database-driven CMS platforms such as WordPress or TYPO3, Typemill stores content as Markdown files on disk, so it runs on any standard PHP web space with no database and minimal setup, and content remains fully portable with no vendor lock-in. It is purpose-built for informational websites: product documentation, software manuals, knowledge bases, wikis, and handbooks, and it can also export content into eBooks and PDFs. The core software is free and open source under the MIT license, distributed on GitHub, and includes hierarchical drag-and-drop navigation, multi-language and multi-project support, role-based access controls, a REST API, Mermaid and PlantUML diagram support, and an extensible plugin and theme ecosystem. Typemill's monetization comes from optional annual licenses for premium themes and plugins layered on top of the free core: a Maker tier adds premium themes, plugins, and remote PDF generation, while a Business tier adds content revisions, variables, templates, and LDAP integration for organizations. Reported users include software vendors, research organizations such as the Max Planck Institute, and IT service companies. Typemill competes with other flat-file and Git-friendly documentation tools like GitBook, Docusaurus, and Grav, distinguishing itself through its no-database simplicity, Markdown-first workflow, and transparent, one-time-per-year licensing rather than recurring per-seat SaaS fees.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '08338430-d0a4-4361-b6b5-4d22262c823c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '08338430-d0a4-4361-b6b5-4d22262c823c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Flat-file architecture$q$, $q$Stores content as Markdown files with no database required, simplifying hosting and backups.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Markdown editing$q$, $q$A clean, user-friendly editor for writing and formatting content in Markdown.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Drag-and-drop navigation$q$, $q$Hierarchical page trees can be reordered visually without editing config files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Multi-language support$q$, $q$Supports multiple languages and multiple independent projects from one installation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Role-based access control$q$, $q$Restricts editing and publishing permissions by user role.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$eBook and PDF export$q$, $q$Converts Markdown content into downloadable eBooks and PDF documents.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Diagram support$q$, $q$Renders Mermaid and PlantUML diagrams directly within documentation pages.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Plugin and theme ecosystem$q$, $q$Extends functionality through free and premium plugins, themes, and a REST API.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Free, open-source core with no database or complex setup required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Content stays fully portable as plain Markdown files, avoiding lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Lightweight and fast, ideal for documentation-focused sites$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Transparent annual licensing instead of recurring SaaS subscriptions$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Actively maintained with regular releases since 2017$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Smaller plugin and theme ecosystem than mainstream CMS platforms like WordPress$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Best suited to documentation-style content rather than general websites or blogs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Requires comfort with self-hosting and PHP environments$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Premium features require a separate paid license on top of the free core$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$What is Typemill used for?$q$, $q$Typemill is used to build documentation sites, manuals, handbooks, knowledge bases, and eBooks from Markdown files.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Is Typemill free?$q$, $q$Yes, the core Typemill software is free and open source under the MIT license; premium themes and plugins require an annual license.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Does Typemill require a database?$q$, $q$No, Typemill is a flat-file CMS that stores content as Markdown files instead of using a database.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Who created Typemill?$q$, $q$Typemill was created by German developer Sebastian Schürmanns and has been developed since 2017.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Can Typemill export content as a PDF or eBook?$q$, $q$Yes, Typemill can convert Markdown content into eBooks and PDF documents, with remote PDF generation on the Maker license.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$What technology is Typemill built with?$q$, $q$Typemill is built with Slim PHP, Vue.js, and Tailwind CSS.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Is Typemill good for a company blog?$q$, $q$Typemill is optimized for documentation-style content rather than general blogging, though it can technically host simple pages.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Does Typemill support multiple languages?$q$, $q$Yes, Typemill supports multi-language and multi-project configurations within a single installation.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Software documentation$q$, $q$Teams use Typemill to publish product manuals and developer documentation directly from Markdown files.$q$, $q$Software companies and dev teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Internal knowledge bases$q$, $q$Organizations use Typemill to host internal wikis and handbooks without needing a database server.$q$, $q$IT and operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$eBook publishing$q$, $q$Writers use Typemill to convert structured Markdown content into downloadable eBooks and PDFs.$q$, $q$Technical writers and publishers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Community$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full core CMS","MIT license","Free themes and plugins","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Maker$q$, $q$Custom annual license$q$, $q$yearly$q$, NULL, $q$["Premium themes","Premium plugins","Remote PDF generation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$Business$q$, $q$Custom annual license$q$, $q$yearly$q$, NULL, $q$["Content revisions","Content variables","Templates","LDAP integration"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '08338430-d0a4-4361-b6b5-4d22262c823c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$overview$q$, $q$What Is Typemill$q$, 2, ARRAY[$q$Typemill is a flat-file content management system that stores all content as Markdown files rather than in a database, making it lightweight to install and easy to move between hosting environments. It was created by German developer Sebastian Schürmanns and has been actively maintained since 2017.$q$, $q$It is aimed specifically at informational and documentation-style websites, such as software manuals, knowledge bases, wikis, and internal handbooks, rather than general-purpose blogging or marketing sites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Because there is no database, Typemill can run on virtually any standard PHP web space, and its Markdown files remain fully portable and readable outside the CMS itself, avoiding vendor lock-in.$q$, $q$The platform supports hierarchical, drag-and-drop content navigation, multi-language and multi-project setups, role-based access control, diagram rendering via Mermaid and PlantUML, and extensibility through a plugin and theme system plus a REST API.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The Typemill core is completely free and open source under the MIT license, and can be self-hosted with no per-seat fees.$q$, $q$Optional annual licenses unlock premium add-ons: a Maker tier adds premium themes, plugins, and remote PDF generation, while a Business tier layers on content revisions, variables, reusable templates, and LDAP integration for enterprise use.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('08338430-d0a4-4361-b6b5-4d22262c823c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Typesense ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Typesense is an open-source, typo-tolerant search engine offering sub-50 millisecond full-text, vector, and hybrid search, positioned as a simpler, self-hostable alternative to Algolia and Elasticsearch.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Typesense Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Typesense is an open-source typo-tolerant search engine and Algolia alternative. Compare its pricing, features, and self-hosted vs Cloud options.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Typesense is an open-source, in-memory search engine written in C++ that was open-sourced on January 18, 2017 by co-founders Kishore Nallan and Jason Bosco under the company Typesense, Inc. It positions itself as a simpler and cheaper alternative to Algolia, Pinecone, and Elasticsearch, combining full-text search, vector search, and hybrid retrieval-augmented generation (RAG) style search behind a single, developer-friendly API. Typesense is designed for sub-50 millisecond search response times and includes typo tolerance, faceting, filtering, sorting, and geo-search out of the box; vector search for semantic and hybrid search was added in 2023 to keep pace with AI-driven search use cases. The self-hosted core engine is completely free and open source under the GPL-3.0 license, while Typesense, Inc. also runs a managed service called Typesense Cloud that charges based on dedicated cluster resources (memory, vCPU, and bandwidth) rather than per-record or per-search-operation pricing, with entry-level clusters starting in roughly the 7 to 22 dollar per month range depending on configuration. The company has reportedly taken no outside venture funding and operates with a small team of around ten people. Typesense is popular with developers building e-commerce search, documentation search, and internal search tools who want Algolia-like relevance and speed without proprietary lock-in or per-search billing, and it is frequently compared against Meilisearch, another open-source search alternative, as well as Elasticsearch and OpenSearch for teams needing self-hosted control.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '09b08922-47a6-4af9-bab1-b845aa9a15c7' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Typo tolerance$q$, $q$Returns relevant results even when search queries contain spelling mistakes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Sub-50ms search speed$q$, $q$In-memory C++ architecture built for near-instant search response times.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Vector and hybrid search$q$, $q$Supports semantic vector search alongside keyword search for AI-powered retrieval.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Faceting and filtering$q$, $q$Built-in support for faceted navigation, filters, and custom sort ranking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Geo-search$q$, $q$Native support for location-based and geo-distance search queries.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Simple REST API$q$, $q$Developer-friendly API designed to be easier to adopt than Elasticsearch.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Self-hosted or managed Cloud$q$, $q$Runs on your own infrastructure for free or via the managed Typesense Cloud service.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Real-time indexing$q$, $q$New and updated documents become searchable near-instantly after being indexed.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Free and open source under GPL-3.0 for self-hosted use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Fast, sub-50ms search performance out of the box$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Simpler setup and API than Elasticsearch$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Combines keyword, vector, and hybrid search in one engine$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Predictable cluster-based Cloud pricing instead of per-search fees$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Typesense Cloud has no free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Smaller ecosystem and community than Elasticsearch or Algolia$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Self-hosting requires managing infrastructure and scaling manually$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Cluster-based Cloud pricing requires estimating resource needs upfront$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Is Typesense free?$q$, $q$Yes, the self-hosted Typesense engine is free and open source under the GPL-3.0 license; the managed Typesense Cloud service is paid.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Who created Typesense?$q$, $q$Typesense was open-sourced in 2017 by Kishore Nallan and Jason Bosco through their company Typesense, Inc.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Is Typesense an Algolia alternative?$q$, $q$Yes, Typesense is commonly used as a self-hostable, open-source alternative to Algolia and Elasticsearch.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Does Typesense support vector search?$q$, $q$Yes, Typesense added vector search in 2023 to support semantic and hybrid keyword-plus-vector search.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$How much does Typesense Cloud cost?$q$, $q$Typesense Cloud pricing is based on cluster resources, with small clusters starting at roughly 7 to 22 dollars per month plus bandwidth.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$What language is Typesense written in?$q$, $q$Typesense is written in C++ for speed and low-latency in-memory search.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Can Typesense handle typo-tolerant search?$q$, $q$Yes, typo tolerance is a core built-in feature using edit-distance ranking.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Is Typesense suitable for e-commerce search?$q$, $q$Yes, Typesense is widely used for e-commerce product search, documentation search, and app search.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$E-commerce product search$q$, $q$Online stores use Typesense to power fast, typo-tolerant product search and filtering.$q$, $q$E-commerce developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Documentation and site search$q$, $q$Teams embed Typesense to give users instant, relevant search across docs and content sites.$q$, $q$Developer relations and docs teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$AI-powered retrieval$q$, $q$Developers use Typesense's vector and hybrid search for RAG pipelines and semantic search features.$q$, $q$AI application developers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Open Source (self-hosted)$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full search engine","Typo tolerance","Vector search","Self-managed infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$Typesense Cloud$q$, $q$From approximately $7-22/month$q$, $q$monthly$q$, NULL, $q$["Managed dedicated cluster","No per-search charges","Bandwidth-based add-on billing"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '09b08922-47a6-4af9-bab1-b845aa9a15c7';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$overview$q$, $q$What Is Typesense$q$, 2, ARRAY[$q$Typesense is an open-source search engine built in C++ for speed, designed to deliver typo-tolerant, sub-50 millisecond search results with a simple, developer-friendly API. It was open-sourced in January 2017 by Kishore Nallan and Jason Bosco through their company Typesense, Inc.$q$, $q$It is commonly used as a self-hosted alternative to Algolia and Elasticsearch, and has expanded to support vector and hybrid search for AI-powered retrieval use cases alongside traditional keyword search.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Typesense handles typo tolerance, faceted filtering, sorting, and geo-search natively, using ranking signals like token overlap frequency and edit distance to surface relevant results even with misspelled queries.$q$, $q$Since adding vector search in 2023, Typesense supports hybrid keyword-plus-semantic search, making it usable for both classic site search and modern AI-assisted retrieval and RAG pipelines.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The self-hosted Typesense server is 100 percent free and open source under the GPL-3.0 license, with no feature restrictions for teams willing to run and manage their own infrastructure.$q$, $q$Typesense Cloud, the managed hosting option, has no free tier and bills based on dedicated cluster resources rather than search volume, with small production clusters starting at roughly 7 to 22 dollars per month depending on memory and CPU allocation, plus bandwidth charges.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('09b08922-47a6-4af9-bab1-b845aa9a15c7', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── TYPO3 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$TYPO3 is a free, open-source enterprise content management system originally created in 1997, widely used across Europe for large, multilingual corporate and government websites.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(1997, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Düsseldorf, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Italian$q$, $q$Dutch$q$]::text[],
  seo_title = COALESCE($q$TYPO3 Review: Open-Source Enterprise CMS Features and Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$TYPO3 is a free, open-source enterprise CMS popular in Europe. Learn its history, features, community structure, and how it compares to WordPress.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$TYPO3 is a free and open-source enterprise content management system created in 1997 by Danish developer Kasper Skårhøj, who wanted a CMS that cleanly separated design from content. Early versions appeared in 1998, the first official TYPO3 release (version 3.0) shipped in 2001, and the project became open source that same year under the GNU General Public License version 2. Although created by a Dane, TYPO3 became especially popular in German-speaking countries, which led to the founding of the nonprofit TYPO3 Association in 2004 to govern the project, followed by TYPO3 GmbH in 2016 as the commercial operational arm supporting the ecosystem; TYPO3 GmbH is headquartered in Düsseldorf, Germany, with roughly 20 to 50 employees, led by CEO Daniel Fau. TYPO3 is best known as an enterprise-grade CMS for large, complex, multilingual websites, commonly chosen by government agencies, universities, and large corporations, particularly in Germany, Austria, Switzerland, and other parts of Europe. Its core strengths include native multi-site and multi-language management from a single installation, granular role-based permissions, an extensible extension ecosystem, and long-term support release cycles suited to organizations with strict compliance and stability needs. Because the software itself is entirely free to download, install, and modify, TYPO3's ecosystem instead monetizes through paid enterprise support, hosting, extensions, and certified agency services from partners in the TYPO3 Association network. It competes with other open-source and enterprise CMS platforms such as WordPress, Drupal, and Umbraco, generally positioning itself as more enterprise- and governance-oriented than WordPress, with deeper built-in multi-language and multi-site capability out of the box.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5534f256-62d0-46af-b02c-4c789873abc7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5534f256-62d0-46af-b02c-4c789873abc7' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Multi-site management$q$, $q$Manages multiple websites from a single TYPO3 installation and backend.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Multi-language support$q$, $q$Native support for translating and managing content across many languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Role-based permissions$q$, $q$Granular access control suited to large teams and complex editorial workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Extension ecosystem$q$, $q$Thousands of community and commercial extensions extend core functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Long-term support releases$q$, $q$LTS versions provide extended security and stability support for enterprise use.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Content versioning and workflows$q$, $q$Built-in workspaces and approval workflows for editorial review before publishing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Accessibility and compliance features$q$, $q$Strong support for accessibility standards favored by public-sector websites.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Headless and API capabilities$q$, $q$Can be used headlessly with APIs for decoupled front-end architectures.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Completely free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Strong built-in multi-site and multi-language management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Mature, enterprise-grade platform with long-term support options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Large, established community and agency network, especially in Europe$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Well suited to complex compliance and governance requirements$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Steeper learning curve than WordPress for smaller sites$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Smaller global community and talent pool outside German-speaking markets$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Requires developer or agency involvement for most implementations$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Hosting and support costs can add up despite the free core software$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Is TYPO3 free?$q$, $q$Yes, TYPO3's core software is free and open source under the GNU General Public License version 2.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Who created TYPO3?$q$, $q$TYPO3 was created in 1997 by Danish developer Kasper Skårhøj.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Is TYPO3 a German company?$q$, $q$TYPO3 was created by a Dane, but its governing GmbH and much of its community are based in Germany, and it is especially popular in German-speaking countries.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$What is TYPO3 used for?$q$, $q$TYPO3 is used for large, complex, multilingual websites, commonly by government agencies, universities, and enterprises.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$How is TYPO3 different from WordPress?$q$, $q$TYPO3 offers deeper built-in multi-site and multi-language management and is generally more enterprise- and governance-oriented than WordPress.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Who governs the TYPO3 project?$q$, $q$The nonprofit TYPO3 Association governs the open-source project, while TYPO3 GmbH, founded in 2016, provides commercial services.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Does TYPO3 offer long-term support?$q$, $q$Yes, TYPO3 provides long-term support release branches for organizations needing extended stability and security updates.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Is TYPO3 suitable for small websites?$q$, $q$TYPO3 can run small sites, but its complexity is generally better justified by large, multi-site, or multilingual projects.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Government and public-sector websites$q$, $q$Public institutions use TYPO3 for accessible, compliant, multilingual government portals.$q$, $q$Government agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Enterprise corporate websites$q$, $q$Large companies use TYPO3 to manage many regional and language variants of their website from one system.$q$, $q$Enterprise IT and marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Higher education websites$q$, $q$Universities use TYPO3 to manage large, multi-department website structures with distributed editorial teams.$q$, $q$Universities and educational institutions$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Community (open source)$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full core CMS","GPL v2 license","Community support","Extension ecosystem"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$Enterprise support$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["Long-term support subscriptions","Certified agency services","Priority support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5534f256-62d0-46af-b02c-4c789873abc7';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$overview$q$, $q$What Is TYPO3$q$, 2, ARRAY[$q$TYPO3 is a free, open-source content management system originally created in 1997 by Danish developer Kasper Skårhøj. The project went open source in 2001 with the release of TYPO3 3.0, and it has since grown into one of the most widely used enterprise CMS platforms in Europe, especially in German-speaking countries.$q$, $q$The project is governed by the nonprofit TYPO3 Association, founded in 2004, alongside TYPO3 GmbH, founded in 2016 as its commercial arm, based in Düsseldorf, Germany.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$TYPO3 supports managing multiple websites and languages from a single installation, with a granular, role-based permission system suited to large organizations with many content editors and approval workflows.$q$, $q$It offers a large extension ecosystem, long-term support release branches for organizations needing stability, and strong compliance-oriented features that make it a common choice for government and public-sector websites in Europe.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5534f256-62d0-46af-b02c-4c789873abc7', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$TYPO3 itself is completely free to download, install, and modify under the GNU General Public License version 2, with no license fees for the core software.$q$, $q$Organizations typically pay for hosting, implementation, and ongoing support from certified TYPO3 agencies or partners rather than for the software itself, and TYPO3 GmbH also offers commercial long-term support subscriptions for older versions.$q$]::text[], 2);


-- ── Uberall ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Uberall is a location marketing platform that helps multi-location brands manage business listings, reviews, local SEO, and near-me discoverability across search engines, maps, and AI assistants.$q$, short_description),
  pricing_model = COALESCE($q$custom$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Berlin, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Dutch$q$]::text[],
  seo_title = COALESCE($q$Uberall Review: Location Marketing Platform Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Uberall is a location marketing platform for multi-location brands. Explore its listings, reviews, and near-me SEO features, plus pricing details.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Uberall is a location marketing SaaS platform founded in Berlin in 2013 by David Federhen and Florian Hübner, built to help multi-location and franchise businesses control how they appear in local search, maps, and review platforms. The company has raised roughly 140 million dollars across multiple funding rounds, including a 25 million dollar Series B covered by TechCrunch in 2018 and a 115 million dollar Series C growth investment led by Bregal Milestone in June 2021. Uberall is headquartered in Berlin with additional offices in San Francisco, London, Paris, Amsterdam, and Detroit, and as of 2026 reports powering more than 1.3 million business locations for over 1,800 customers and partners, with a workforce in the low hundreds of employees. The platform's core capabilities include business listing management across search engines and map platforms, review monitoring and response, local SEO and location page optimization, social media posting for multi-location brands, and analytics on local search performance. In 2025 Uberall launched an agentic AI product called UB-I focused on location performance, and in 2026 it introduced GEO Studio, a Generative Engine Optimization tool built with AthenaHQ to help brands maintain visibility as consumers increasingly discover businesses through AI-powered assistants rather than traditional search. Uberall does not publish standard pricing; plans are quote-based with a stated minimum of 25 locations, positioning it toward mid-market and enterprise multi-location brands rather than single-location small businesses. It competes with other multi-location marketing and listings platforms such as Yext, Podium, and Birdeye, differentiating itself with a strong European enterprise customer base and, more recently, generative-AI-era discoverability tooling.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Business listing management$q$, $q$Keeps location data consistent and accurate across search engines, maps, and directories.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Review management$q$, $q$Monitors and responds to customer reviews across multiple platforms from one dashboard.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Local SEO and location pages$q$, $q$Optimizes individual location pages for near-me and local search visibility.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Social media management$q$, $q$Schedules and manages social posts across many locations at once.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Analytics and reporting$q$, $q$Tracks local search performance, engagement, and visibility metrics by location.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$AI-powered location performance (UB-I)$q$, $q$Agentic AI tooling launched in 2025 to help optimize location performance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Generative Engine Optimization (GEO Studio)$q$, $q$Tooling introduced in 2026 to help brands stay visible in AI-powered search assistants.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Franchise and partner management$q$, $q$Supports franchisors and resellers managing listings on behalf of many locations.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Purpose-built for large, multi-location brands and franchises$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Strong European enterprise presence with well-established local SEO tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Broad coverage across search engines, maps, and review platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Actively investing in AI and generative-search visibility tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Significant funding history supporting long-term product development$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$No published pricing, requiring a sales conversation to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Minimum of 25 locations makes it impractical for small, single-location businesses$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Enterprise focus may be more complexity than smaller multi-location brands need$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Feature depth varies by region and platform integration$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$What is Uberall used for?$q$, $q$Uberall is used by multi-location businesses to manage listings, reviews, and local SEO across search engines and maps.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$How much does Uberall cost?$q$, $q$Uberall does not publish standard pricing; plans are custom quotes with a stated minimum of 25 locations.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Who founded Uberall?$q$, $q$Uberall was founded in Berlin in 2013 by David Federhen and Florian Hübner.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Is Uberall the same as Uber?$q$, $q$No, Uberall is an unrelated location marketing company and has no connection to the rideshare company Uber.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$How much funding has Uberall raised?$q$, $q$Uberall has raised roughly 140 million dollars, including a 115 million dollar Series C led by Bregal Milestone in 2021.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Does Uberall support AI-powered search visibility?$q$, $q$Yes, Uberall launched an agentic AI product called UB-I in 2025 and a Generative Engine Optimization tool called GEO Studio in 2026.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Where is Uberall headquartered?$q$, $q$Uberall is headquartered in Berlin, Germany, with additional offices including San Francisco, London, Paris, and Amsterdam.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Is Uberall suitable for a single-location business?$q$, $q$No, Uberall targets multi-location brands and requires a minimum of 25 locations.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Multi-location listing management$q$, $q$Retail and restaurant chains use Uberall to keep hundreds of location listings accurate across search and maps.$q$, $q$Multi-location retail and restaurant brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Franchise local marketing$q$, $q$Franchisors use Uberall to give franchisees consistent local marketing tools while maintaining brand control.$q$, $q$Franchise organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Local review and reputation management$q$, $q$Brands use Uberall to monitor and respond to reviews across many locations from a single dashboard.$q$, $q$Customer experience and marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Custom$q$, $q$Quote-based (minimum 25 locations)$q$, $q$custom$q$, NULL, $q$["Listing management","Review management","Local SEO","Analytics"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$overview$q$, $q$What Is Uberall$q$, 2, ARRAY[$q$Uberall is a location marketing platform built for brands with many physical locations, helping them control how each location appears across search engines, map apps, and review sites. It was founded in Berlin in 2013 by David Federhen and Florian Hübner.$q$, $q$The platform is aimed at multi-location and franchise businesses that need consistent, accurate, and optimized local presence at scale, rather than single-location businesses managing one listing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Uberall centralizes business listing management, review monitoring and response, and local SEO across dozens or hundreds of individual location pages, all controlled from one dashboard.$q$, $q$More recently, Uberall has added AI-driven tools, including an agentic AI product called UB-I for location performance and a Generative Engine Optimization tool called GEO Studio, aimed at keeping locations visible as discovery shifts toward AI assistants.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Uberall does not publish standard pricing on its website; costs are quote-based and depend on the number of locations and features required, with a stated minimum of 25 locations.$q$, $q$This custom pricing model reflects Uberall's focus on mid-market and enterprise multi-location brands rather than individual small businesses, who are typically better served by simpler, self-serve listing tools.$q$]::text[], 2);


-- ── Ubersuggest ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ubersuggest is Neil Patel's budget-friendly SEO tool for keyword research, competitor analysis, site audits, and backlink discovery, aimed at small businesses and solo marketers.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$San Diego, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$German$q$, $q$French$q$, $q$Portuguese$q$]::text[],
  seo_title = COALESCE($q$Ubersuggest Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Ubersuggest is Neil Patel's affordable SEO tool for keyword research and site audits. Compare pricing, features, and how it stacks up against rivals.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ubersuggest is an SEO and keyword research tool created and popularized by digital marketer Neil Patel, who acquired and relaunched it as a free keyword suggestion tool before building it into a fuller SEO suite. It is operated under Patel's company (Neil Patel Digital, accessible via app.neilpatel.com), positioned as a lower-cost alternative to enterprise SEO platforms like Ahrefs, SEMrush, and Moz. The tool provides keyword ideas with search volume, competition scores, seasonal trends, and cost-per-click data; a domain overview showing organic traffic, keywords, and backlinks; a site audit feature that flags technical SEO errors and warnings; a backlink discovery tool for finding link opportunities; and rank tracking for target keywords. Ubersuggest offers a permanently free plan with limited daily searches, alongside paid subscription tiers: a Personal plan around 29 dollars per month with 125 tracked keywords and 1 project, a Business plan around 99 dollars per month with more projects and tracked keywords, and a custom Enterprise plan for larger needs; the company has also sold lifetime-access deals around 120 dollars in the past. All plans include SEO training content, email support, and AI-powered insights integrated with large language models. Ubersuggest is generally regarded as delivering roughly 70 to 80 percent of the functionality of premium enterprise SEO tools at a fraction of the price, making it popular among bloggers, solopreneurs, small business owners, and early-stage e-commerce operators who want core keyword research and site audit capability without an enterprise SEO budget, while power users needing deep backlink indexes or enterprise-scale crawling often graduate to Ahrefs or SEMrush.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bea45054-992b-496b-b59e-dba14e8219b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bea45054-992b-496b-b59e-dba14e8219b6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Keyword research$q$, $q$Suggests keyword ideas with search volume, competition, seasonal trends, and CPC data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Domain overview$q$, $q$Shows a website's organic traffic, keyword rankings, and backlink profile.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Site audit$q$, $q$Scans a website for technical SEO errors, warnings, and speed issues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Backlink discovery$q$, $q$Finds backlink opportunities and analyzes competitor link profiles.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Rank tracking$q$, $q$Tracks keyword ranking positions over time for a project's target terms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Content ideas$q$, $q$Surfaces top-performing content ideas related to target keywords.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Chrome extension$q$, $q$Provides SEO metrics directly inside Google search results via a browser extension.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$AI-powered insights$q$, $q$Integrates AI insights from large language models to support keyword and content decisions.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Significantly cheaper than premium SEO tools like Ahrefs or SEMrush$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Genuine free plan for casual keyword research$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Simple, beginner-friendly interface$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Extensive learning resources from Neil Patel's content ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Good value for solo marketers and small businesses$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Backlink index and data depth is smaller than premium competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Daily and monthly usage limits can feel restrictive for heavier use$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Not designed for large enterprise SEO teams managing many domains$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Some data accuracy concerns compared to more established SEO platforms$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Is Ubersuggest free?$q$, $q$Yes, Ubersuggest has a permanently free plan with limited daily searches; paid plans start around 29 dollars per month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Who created Ubersuggest?$q$, $q$Ubersuggest is a product created and popularized by digital marketer Neil Patel.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Is Ubersuggest the same as Uberall?$q$, $q$No, Ubersuggest is an SEO keyword research tool from Neil Patel, unrelated to Uberall, a location marketing platform.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$How does Ubersuggest compare to Ahrefs and SEMrush?$q$, $q$Ubersuggest is significantly cheaper but offers a smaller data index and fewer advanced features than Ahrefs or SEMrush.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Does Ubersuggest offer a lifetime deal?$q$, $q$Neil Patel has previously offered Ubersuggest lifetime-access deals for a one-time payment of around 120 dollars.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Does Ubersuggest have a Chrome extension?$q$, $q$Yes, Ubersuggest offers a Chrome extension that shows SEO metrics directly in Google search results.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Is Ubersuggest good for beginners?$q$, $q$Yes, it is widely regarded as a beginner-friendly, affordable entry point into SEO tools.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Does Ubersuggest include site audits?$q$, $q$Yes, Ubersuggest includes a site audit feature that identifies technical SEO issues on a website.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Blog keyword research$q$, $q$Bloggers use Ubersuggest to find keyword opportunities and content ideas for organic growth.$q$, $q$Bloggers and content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Small business local SEO$q$, $q$Small business owners use Ubersuggest to audit their site and track rankings for important local terms.$q$, $q$Small business owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$E-commerce competitor analysis$q$, $q$Store owners use Ubersuggest's domain overview to analyze competitor traffic and keyword strategies.$q$, $q$Early-stage e-commerce operators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Free$q$, $q$$0$q$, $q$n/a$q$, NULL, $q$["Limited daily searches","Basic keyword suggestions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Personal$q$, $q$$29/month$q$, $q$monthly$q$, NULL, $q$["150 reports per day","1 project","125 tracked keywords","1,000 pages audited weekly"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Business$q$, $q$$99/month$q$, $q$monthly$q$, NULL, $q$["300 reports per day","7 projects","150 tracked keywords","5,000 pages audited weekly"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["900 reports per day","15 projects","300 tracked keywords","10,000 pages audited weekly"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'bea45054-992b-496b-b59e-dba14e8219b6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$overview$q$, $q$What Is Ubersuggest$q$, 2, ARRAY[$q$Ubersuggest is an SEO tool built and popularized by digital marketer Neil Patel, offering keyword research, competitor analysis, site audits, and backlink discovery in one affordable package.$q$, $q$It is positioned as a budget-friendly entry point into SEO, aimed at bloggers, small business owners, and solo marketers rather than large enterprises with dedicated SEO teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ubersuggest provides keyword suggestions with volume, competition, seasonal trend, and CPC data, along with a domain overview showing a competitor's organic traffic, keywords, and backlink profile.$q$, $q$It also includes a site audit tool that surfaces technical SEO issues like site speed and critical errors, plus a backlink discovery feature for identifying link-building opportunities and rank tracking for target keywords.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea45054-992b-496b-b59e-dba14e8219b6', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Ubersuggest offers a permanently free plan with limited daily searches and a single project, making it accessible for casual or first-time SEO users.$q$, $q$Paid plans start with the Personal tier at around 29 dollars per month, followed by a Business tier around 99 dollars per month, and a custom-quoted Enterprise tier for larger teams and higher usage limits; a 7-day free trial and 30-day money-back guarantee are available on paid plans.$q$]::text[], 2);


-- ── Ucraft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Ucraft is a no-code website and online store builder offering drag-and-drop design, a logo maker, and white-label plans for agencies, headquartered in Glendale, California.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Glendale, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Russian$q$]::text[],
  seo_title = COALESCE($q$Ucraft Review 2026: Website Builder Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Ucraft is a no-code website and online store builder with a logo maker and white-label plans. Compare pricing, features, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Ucraft is a no-code website and e-commerce builder that began in 2010 as a templates club giving members access to professional website templates, before expanding into a full drag-and-drop website builder platform launched in 2014. The company is headquartered in Glendale, California, with additional offices reported in Armenia, and reports roughly 130 or more employees serving around 360,000 active users worldwide, with reported annual revenue in the range of 6 million dollars per recent public estimates. Ucraft's product suite includes a website builder, an online store builder with support for dozens of payment and shipping integrations, a free logo maker tool, and white-label plans that let agencies and freelancers resell websites and stores under their own brand. Pricing runs on a freemium-to-tiered model: a free website plan supports up to 15 pages, a paid Website plan starts around 8 dollars per month (or roughly 6 dollars per month billed annually) for unlimited pages and custom domains, e-commerce plans range from a Basic Shop around 13 dollars per month supporting 15 products up to a Pro Shop around 24 dollars per month supporting 1,000 products with expanded payment and shipping options, and an Unlimited plan around 75 dollars per month removes product caps entirely; a separate Agency white-label plan runs around 599 dollars per month for building and reselling up to 100 sites. Ucraft competes in the no-code website builder space against tools like Wix, Squarespace, Webflow, and Unicorn Platform, differentiating itself with a lower entry price point, an integrated logo maker, and a dedicated white-label offering aimed at design agencies and freelancers who build sites for clients.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Drag-and-drop website builder$q$, $q$No-code visual editor for building custom pages without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Logo maker$q$, $q$A built-in tool for designing a business logo alongside the website.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Online store builder$q$, $q$E-commerce features including product catalogs, payments, and shipping integrations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$White-label reselling$q$, $q$Agency plans let freelancers and agencies build and resell sites under their own brand.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$SEO tools$q$, $q$Built-in on-page SEO settings to help published sites rank in search engines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Multilingual sites$q$, $q$Supports building websites in multiple languages for international audiences.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Social selling integrations$q$, $q$Connects stores to Facebook, Instagram, Amazon, and eBay for multi-channel selling.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Membership functionality$q$, $q$Supports password-protected and membership-gated content on paid plans.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Lower entry pricing than many mainstream website builders$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Includes a free logo maker as part of the platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Dedicated white-label plans for agencies and freelancers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Large existing user base of roughly 360,000 active users$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$E-commerce and website building combined in one platform$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Free plan is limited to 15 pages with no custom domain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Design flexibility is less advanced than code-based builders like Webflow$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Higher-tier e-commerce and Agency plans get expensive quickly$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Smaller app and integration ecosystem than Wix or Shopify$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Is Ucraft free?$q$, $q$Ucraft offers a free plan limited to 15 pages; paid plans start around 8 dollars per month for unlimited pages.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$When was Ucraft founded?$q$, $q$Ucraft began as a templates club in 2010 and relaunched as a full website builder platform in 2014.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Where is Ucraft headquartered?$q$, $q$Ucraft is headquartered in Glendale, California, with additional offices including Armenia.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Does Ucraft support online stores?$q$, $q$Yes, Ucraft offers e-commerce plans ranging from a small product catalog up to unlimited products.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Does Ucraft offer white-label plans?$q$, $q$Yes, Ucraft has an Agency white-label plan for building and reselling websites under an agency's own brand.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Is Ucraft the same as Unicorn Platform?$q$, $q$No, Ucraft is a general-purpose website and store builder, while Unicorn Platform is a separate no-code landing page builder.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Does Ucraft include a logo maker?$q$, $q$Yes, Ucraft includes a free logo maker tool as part of its platform.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Does Ucraft support multiple languages?$q$, $q$Yes, Ucraft supports building multilingual websites for international audiences.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Small business websites$q$, $q$Business owners use Ucraft to launch a professional website and logo without hiring a designer.$q$, $q$Small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Online stores$q$, $q$Merchants use Ucraft's Shop plans to sell products online with integrated payments and shipping.$q$, $q$E-commerce sellers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Agency client sites$q$, $q$Design agencies use Ucraft's white-label plans to build and resell websites under their own brand.$q$, $q$Design agencies and freelancers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Free Website$q$, $q$$0$q$, $q$n/a$q$, NULL, $q$["15 pages","SSL security","Google Analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Website$q$, $q$$8/month$q$, $q$monthly$q$, NULL, $q$["Unlimited pages","Custom domain","SEO tools","Blogging"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Basic Shop$q$, $q$$13/month$q$, $q$monthly$q$, NULL, $q$["15 products","Stripe and PayPal payments","20+ integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Pro Shop$q$, $q$$24/month$q$, $q$monthly$q$, NULL, $q$["1,000 products","50+ payment methods","Social selling integrations"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Unlimited$q$, $q$$75/month$q$, $q$monthly$q$, NULL, $q$["Unlimited products","10GB digital goods per file","Square POS integration"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$Agency (white label)$q$, $q$$599/month$q$, $q$monthly$q$, NULL, $q$["Build and resell up to 100 sites","White-label branding"]$q$::jsonb, 5);

DELETE FROM tool_content_blocks WHERE tool_id = '5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$overview$q$, $q$What Is Ucraft$q$, 2, ARRAY[$q$Ucraft is a no-code website and online store builder that started as a website templates club in 2010 before relaunching as a full drag-and-drop platform in 2014. It is headquartered in Glendale, California.$q$, $q$The platform serves individuals, small businesses, and agencies who want to build websites, portfolios, and online stores without writing code, and it also offers a distinct white-label track for agencies reselling websites under their own brand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Ucraft includes a drag-and-drop website builder, a free logo maker tool, built-in SEO and blogging tools, and multilingual site support for businesses targeting multiple markets.$q$, $q$Its e-commerce features scale from a small product catalog on lower tiers up to unlimited products, dozens of payment and shipping integrations, inventory tracking, discount coupons, and social selling integrations with platforms like Facebook, Instagram, Amazon, and eBay.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Ucraft offers a free plan limited to 15 pages, and a paid Website plan starting around 8 dollars per month (about 6 dollars per month billed annually) for unlimited pages and a custom domain.$q$, $q$E-commerce plans range from Basic Shop at roughly 13 dollars per month up to Pro Shop at roughly 24 dollars per month and Unlimited at roughly 75 dollars per month, while agencies can access a white-label Agency plan around 599 dollars per month to build and resell up to 100 sites.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c6ec4b3-9d16-4b82-8c5d-237d1b928ef4', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── Udemy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Udemy is a large online course marketplace founded in 2010, offering tens of thousands of courses across business, tech, and creative skills, purchased individually or via a subscription plan.$q$, short_description),
  pricing_model = COALESCE($q$one-time$q$, pricing_model),
  starting_price = COALESCE($q$$9.99/course$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$1000+ employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$German$q$, $q$French$q$, $q$Turkish$q$, $q$Japanese$q$]::text[],
  seo_title = COALESCE($q$Udemy Review 2026: Pricing, Courses and How It Compares$q$, seo_title),
  seo_meta_description = COALESCE($q$Udemy is an online course marketplace with individual course purchases and a subscription plan. See how pricing, courses, and quality compare.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Udemy is an online learning marketplace founded in 2010 by Eren Bali, Gagan Biyani, and Oktay Caglar, offering a large catalog of courses created by independent instructors across technology, business, creative, and personal development topics. Udemy went public on NASDAQ under the ticker UDMY in October 2021, raising about 420.5 million dollars in its IPO at 29 dollars per share, and reported revenue of roughly 430 million dollars in 2020, up 56 percent from the prior year. In December 2025, rival online learning company Coursera announced an agreement to acquire Udemy for 2.5 billion dollars; the deal received stockholder approval in April 2026 and closed in mid-2026, after which Udemy's stock was delisted from NASDAQ and the company became part of Coursera rather than an independent public company. Udemy's marketplace model lets anyone create and sell video courses, with individual course prices typically ranging from 9.99 to 199.99 dollars, though frequent platform-wide sales drop most courses to the 9.99 to 14.99 dollar range for extended periods. Udemy also offers a Personal Plan subscription, giving access to a curated library of tens of thousands of courses for a recurring monthly or annual fee, positioned as better value for learners completing multiple courses per month. Separately, Udemy Business serves organizations with license-based access to curated course collections, reporting, and team management tools. Udemy competes with Coursera (now its parent), LinkedIn Learning, Skillshare, and Pluralsight, differentiating itself through an open marketplace model where instructor-created content spans an unusually broad range of practical, often niche, skill topics compared to the university-partnered content common on Coursera.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9475419b-62e2-4143-a99d-40ca73927ae3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9475419b-62e2-4143-a99d-40ca73927ae3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Open course marketplace$q$, $q$Independent instructors create and publish courses that anyone can purchase.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Lifetime course access$q$, $q$Purchased individual courses remain accessible indefinitely, including future updates.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Personal Plan subscription$q$, $q$Subscription access to a curated library of tens of thousands of courses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Udemy Business$q$, $q$B2B product offering organizations license-based access to curated content and team reporting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Certificates of completion$q$, $q$Learners receive a certificate after finishing a course.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Mobile and offline learning$q$, $q$Courses can be downloaded and watched offline via the mobile app.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Q&A and instructor interaction$q$, $q$Learners can ask questions and interact with instructors within each course.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Frequent sales and discounts$q$, $q$Platform-wide sales regularly discount most individual courses.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Enormous catalog spanning tech, business, and creative skills$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Very affordable during frequent sales, often under 15 dollars per course$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Lifetime access to purchased courses, including updates$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Anyone can become an instructor, leading to niche and practical topics$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Strong mobile app with offline viewing$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Course quality varies significantly since anyone can publish a course$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$No formal accreditation or university-backed credentials like Coursera$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Full list prices are steep before discounts are applied$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Now owned by Coursera following the 2025-2026 acquisition, with future platform direction uncertain$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Is Udemy free?$q$, $q$Udemy is not free; individual courses are purchased one-time or accessed via the Personal Plan subscription, though some free courses exist.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Who founded Udemy?$q$, $q$Udemy was founded in 2010 by Eren Bali, Gagan Biyani, and Oktay Caglar.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Is Udemy still a public company?$q$, $q$No, Udemy was acquired by Coursera in a deal announced in December 2025 that closed in 2026, and its stock was delisted from NASDAQ.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$How much do Udemy courses cost?$q$, $q$Individual courses typically list between 9.99 and 199.99 dollars, though sales frequently bring most courses down to around 9.99 to 14.99 dollars.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$What is Udemy Business?$q$, $q$Udemy Business is a separate B2B product giving organizations license-based access to curated courses, learning paths, and reporting.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Does Udemy offer certificates?$q$, $q$Yes, learners receive a certificate of completion after finishing a course, though it is not a formal academic credential.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$How is Udemy different from Coursera?$q$, $q$Udemy is an open marketplace where any instructor can publish a course, while Coursera partners primarily with universities and companies for accredited content; Coursera acquired Udemy in 2026.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Can anyone teach a course on Udemy?$q$, $q$Yes, Udemy's marketplace model allows independent instructors to create and publish their own courses.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Individual skill building$q$, $q$Learners buy specific courses on Udemy to pick up practical skills like coding, design, or marketing.$q$, $q$Individual learners and career changers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Corporate training$q$, $q$Companies use Udemy Business to give employees access to a curated library of professional development courses.$q$, $q$HR and L&D teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Instructor income$q$, $q$Subject matter experts create and sell courses on Udemy's marketplace to earn revenue from their expertise.$q$, $q$Independent instructors and educators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Individual course$q$, $q$$9.99-$199.99$q$, $q$one-time$q$, NULL, $q$["Lifetime access","Certificate of completion","Downloadable resources"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Personal Plan$q$, $q$From approximately $16.99/month$q$, $q$monthly or annual$q$, NULL, $q$["Access to curated course library","New courses added regularly"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$Udemy Business$q$, $q$Custom$q$, $q$annual license$q$, NULL, $q$["Curated content collections","Learning paths","Team reporting and analytics"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '9475419b-62e2-4143-a99d-40ca73927ae3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$overview$q$, $q$What Is Udemy$q$, 2, ARRAY[$q$Udemy is an online learning marketplace founded in 2010 by Eren Bali, Gagan Biyani, and Oktay Caglar, connecting independent instructors with learners through video courses on technology, business, creative, and personal development topics.$q$, $q$The platform went public on NASDAQ in 2021 under the ticker UDMY, and was acquired by Coursera in a deal announced in December 2025 and closed in 2026, folding Udemy into Coursera rather than remaining an independent public company.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Udemy's core marketplace lets instructors upload video courses that learners purchase individually, with lifetime access to purchased courses, downloadable resources, quizzes, and certificates of completion.$q$, $q$Beyond individual purchases, Udemy offers a Personal Plan subscription for unlimited access to a curated course library, and Udemy Business, a separate B2B product giving organizations license-based access to curated content, learning paths, and team analytics.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9475419b-62e2-4143-a99d-40ca73927ae3', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Individual courses on Udemy typically list between 9.99 and 199.99 dollars, but frequent platform-wide sales bring most courses down to the 9.99 to 14.99 dollar range for much of the year.$q$, $q$Udemy also offers a Personal Plan subscription for a recurring monthly or annual fee that grants access to a large curated course library, which tends to be better value for learners completing multiple courses per month; pricing and promotions vary by region.$q$]::text[], 2);



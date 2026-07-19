-- Enrichment marathon batch: Shelf, Shopify, Shopware, Shortcut, Shotcut, Shots, Sift Org Chart, SignNow

-- ── Shelf ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AI-powered knowledge management and answer automation platform that unifies enterprise content into an AI Data Model so support agents, contact centers, and AI agents can find and act on accurate answers.$q$, short_description),
  pricing_model = COALESCE($q$Custom, quote-based enterprise pricing$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Stamford, Connecticut, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Shelf Review 2026: AI Knowledge Management Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Shelf is an AI-powered knowledge management platform for enterprise support teams. See features, pricing, pros, cons, and FAQs before you buy.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Shelf is an AI-powered knowledge management and answer automation platform founded in 2017 and headquartered in Stamford, Connecticut, with additional offices in New York City, San Francisco, and Warsaw, Poland. The company was launched by co-founders Colin Kennedy, Tobias Jaeckel, and Sedarius Tekara Perrotta to help distributed teams and customer support organizations find accurate answers faster. Shelf's core product builds what the company calls an 'AI Data Model' - a unified, governed layer that connects an organization's scattered content sources, including help desks, wikis, CRMs, and document repositories, so that both human agents and AI agents can retrieve trustworthy, up-to-date information. The platform is used heavily by enterprise contact centers and customer support teams at companies such as Amazon, HelloFresh, Roku, KeyBank, and Nespresso to reduce average handle time, improve first-contact resolution, and safely ground generative AI chatbots and copilots in verified company knowledge. Shelf's feature set spans content lifecycle management, duplicate and outdated-content detection, semantic search, analytics on knowledge gaps, and CortexAI, its reasoning and orchestration layer for deploying AI agents across chat, voice, and email channels. Shelf raised a 52.5 million dollar Series B round in 2021 after reporting 4x annual recurring revenue growth, and it has been recognized as a G2 High Performer, a Gartner Cool Vendor, and an IDC Innovator. Pricing is not published; Shelf sells directly to enterprise buyers through a custom, quote-based sales process rather than self-serve plans.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4af91cc7-bff6-4870-8966-384ef1477386';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4af91cc7-bff6-4870-8966-384ef1477386' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$AI Data Model$q$, $q$Unifies scattered enterprise content from help desks, wikis, CRMs, and document stores into one governed knowledge layer.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$CortexAI reasoning layer$q$, $q$Orchestrates AI agents across chat, voice, and email channels, grounding responses in verified company knowledge.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Content lifecycle governance$q$, $q$Detects outdated, conflicting, and duplicate content to keep answers accurate over time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Semantic search$q$, $q$Lets agents and end users find relevant answers using natural-language queries rather than exact keyword matches.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Knowledge-gap analytics$q$, $q$Surfaces where content is missing, stale, or underperforming so knowledge teams can prioritize fixes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Multi-channel agent deployment$q$, $q$Supports deploying AI-powered answer agents across chat, voice, and email support channels.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Enterprise integrations$q$, $q$Connects with CCaaS, CRM, and helpdesk systems already in use at large organizations.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Purpose-built for grounding generative AI in verified enterprise content$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Strong presence in enterprise contact center and customer support use cases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Content governance features reduce outdated and duplicate answers reaching agents$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Backed by well-known enterprise customers and analyst recognition (G2, Gartner, IDC)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Deep integrations with existing CCaaS, CRM, and helpdesk stacks$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Pricing is not publicly available and requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Enterprise focus means it may be costly or excessive for small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Implementation and content migration can require significant setup time$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Fewer self-serve options compared to lightweight wiki or FAQ tools$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Smaller company size than some legacy knowledge management vendors$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$What is Shelf used for$q$, $q$Shelf is used by enterprise support and contact center teams to manage knowledge content and ground AI chatbots and copilots in accurate, up-to-date answers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$How much does Shelf cost$q$, $q$Shelf does not publish pricing publicly. It sells through a custom, quote-based enterprise sales process based on user count and content volume.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$When was Shelf founded$q$, $q$Shelf was founded in 2017 by Colin Kennedy, Tobias Jaeckel, and Sedarius Tekara Perrotta.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Where is Shelf headquartered$q$, $q$Shelf is headquartered in Stamford, Connecticut, with additional offices in New York City, San Francisco, and Warsaw, Poland.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Does Shelf integrate with existing support tools$q$, $q$Yes, Shelf integrates with common CCaaS, CRM, and helpdesk systems used by enterprise support teams.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Is Shelf suited for small businesses$q$, $q$Shelf is primarily built and priced for large enterprise organizations, particularly those with sizable contact center or support operations.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$What is CortexAI$q$, $q$CortexAI is Shelf's reasoning and orchestration layer for deploying AI agents across chat, voice, and email channels.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Has Shelf raised funding$q$, $q$Yes, Shelf raised a 52.5 million dollar Series B round in 2021 after reporting 4x year-over-year ARR growth.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Contact center knowledge management$q$, $q$Centralizes and governs support content so agents can find accurate answers faster and reduce handle time.$q$, $q$Enterprise customer support and contact center teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Generative AI grounding$q$, $q$Feeds verified, governed content into AI chatbots and copilots to reduce hallucinations and outdated answers.$q$, $q$AI and customer experience teams deploying GenAI assistants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Internal enterprise search$q$, $q$Gives employees a unified way to search across fragmented internal systems and documentation.$q$, $q$Large enterprises with distributed content sources$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Team$q$, $q$Contact sales$q$, $q$Custom$q$, NULL, $q$["Core knowledge management","Semantic search","Content governance tools","Standard integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$Enterprise$q$, $q$Contact sales$q$, $q$Custom$q$, NULL, $q$["CortexAI agent orchestration","Multi-channel AI agent deployment","Advanced analytics and knowledge-gap reporting","Dedicated enterprise support and security controls"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '4af91cc7-bff6-4870-8966-384ef1477386';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$shelf-overview$q$, $q$What is Shelf$q$, 2, ARRAY[$q$Shelf is an enterprise knowledge management and answer automation platform built to help support teams, contact centers, and AI agents surface accurate, governed information quickly. Founded in 2017, the company has grown from a support-focused knowledge base tool into a broader AI Data Model platform that connects scattered enterprise content sources into one searchable, trustworthy layer.$q$, $q$Shelf is positioned primarily for large organizations with complex support operations, including retail, food delivery, finance, and technology companies. Its customer base includes recognizable enterprise brands, and the platform is frequently used to ground generative AI chatbots and copilots so they answer customer and employee questions using verified, current company knowledge rather than outdated or duplicate content.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$shelf-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$At the center of Shelf's platform is the AI Data Model, which unifies content from help desks, wikis, CRMs, and document repositories into a governed knowledge layer. On top of this sits CortexAI, Shelf's reasoning and orchestration engine, which lets teams deploy AI agents across chat, voice, and email support channels while keeping answers grounded in approved content.$q$, $q$Shelf also focuses heavily on content governance, offering tools to detect outdated, conflicting, or duplicate content before it reaches agents or AI systems. Semantic search, knowledge-gap analytics, and integrations with common CCaaS and CRM systems round out a feature set designed for large-scale, regulated support environments.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4af91cc7-bff6-4870-8966-384ef1477386', $q$shelf-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Shelf does not publish self-serve pricing on its website. Instead, the company sells through a custom, quote-based enterprise sales process, with pricing typically shaped by number of users, content volume, and which modules (such as CortexAI agent deployment) a customer needs.$q$, $q$Prospective buyers should expect a sales consultation and a tailored proposal rather than a fixed monthly rate. This enterprise-sales model is common among knowledge management vendors serving large contact centers and regulated industries, where implementation scope varies significantly between customers.$q$]::text[], 2);


-- ── Shopify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Shopify is a leading commerce platform that lets merchants build, manage, and scale online stores and point-of-sale retail across web, mobile, social, and marketplaces.$q$, short_description),
  pricing_model = COALESCE($q$Tiered SaaS subscription plus transaction and payment processing fees$q$, pricing_model),
  starting_price = COALESCE($q$$5/month (Starter plan)$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE($q$7,600+ employees (publicly traded, NYSE and TSX: SHOP)$q$, company_size),
  headquarters = COALESCE($q$Ottawa, Ontario, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$Italian$q$, $q$Japanese$q$, $q$Chinese (Simplified)$q$]::text[],
  seo_title = COALESCE($q$Shopify Review 2026: Pricing, Plans, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Compare Shopify's 2026 pricing plans, features, pros and cons. See if this leading e-commerce platform fits your online store or retail business.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Shopify is a publicly traded Canadian e-commerce platform (NYSE and TSX: SHOP) founded in 2006 in Ottawa, Ontario by Tobias Lutke, Daniel Weinand, and Scott Lake, originally to sell snowboarding equipment before pivoting into the software that now powers millions of online stores. Shopify is headquartered in Ottawa and, as of the most recent public filings, employs roughly 7,600 people worldwide following a 2023 restructuring. The platform lets merchants of all sizes build online storefronts, manage inventory and orders, accept payments through Shopify Payments and other gateways, sell through point-of-sale hardware in physical retail, and distribute products across marketplaces and social channels like Instagram, TikTok, and Amazon. Shopify reported full-year 2025 revenue of 11.56 billion dollars, up 30 percent year over year, and processed over 292 billion dollars in gross merchandise volume in 2024, reflecting its position as one of the largest commerce platforms globally, serving more than 5 million businesses. In 2026, Shopify offers a tiered plan lineup including a no-storefront Agentic plan for selling through AI shopping assistants, a low-cost Starter plan for link-in-bio and social selling, and Basic, Grow, Advanced, and Plus plans that scale up in features like advanced reporting, reduced transaction fees, and enterprise-grade customization for high-volume merchants. Shopify's extensive app ecosystem, theme marketplace, and developer APIs make it one of the most extensible e-commerce platforms on the market.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8feedd41-747b-469b-a7e6-60d22adde1c3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8feedd41-747b-469b-a7e6-60d22adde1c3' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Storefront builder and themes$q$, $q$Drag-and-drop store builder with a large marketplace of customizable themes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Shopify Payments and gateways$q$, $q$Native payment processing plus support for 100+ third-party payment gateways.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Point-of-sale (POS)$q$, $q$Hardware and software for selling in physical retail locations alongside the online store.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Multi-channel selling$q$, $q$Sell across social platforms, marketplaces, and AI shopping assistants from one dashboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$App ecosystem and APIs$q$, $q$Thousands of third-party apps plus developer APIs for custom storefronts and integrations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Inventory and order management$q$, $q$Built-in tools for tracking stock, fulfilling orders, and managing shipping.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Shopify Flow and analytics$q$, $q$Workflow automation and reporting tools that scale up on higher-tier plans.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Reliable, high-uptime infrastructure that scales to very high traffic and sales volume$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Huge app and theme ecosystem for extending functionality without custom development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Easy setup for non-developers with a polished storefront builder$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Strong multi-channel and point-of-sale integration for omnichannel retail$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Scales from solo sellers up to large enterprise merchants via Shopify Plus$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Transaction fees apply unless using Shopify Payments as the payment gateway$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Costs can climb quickly once third-party apps are added$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Deep customization requires learning Shopify's Liquid templating language$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Some advanced features are gated behind higher-cost plans$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Migrating a large store away from Shopify can be difficult due to platform-specific data structures$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$How much does Shopify cost$q$, $q$Shopify's 2026 plans range from a free Agentic plan and a $5/month Starter plan up to Basic ($39/month), Grow ($105/month), Advanced ($399/month), and Plus (from $2,300/month).$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Does Shopify charge transaction fees$q$, $q$Shopify charges additional transaction fees on plans where merchants use a payment gateway other than Shopify Payments.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Can I sell in person with Shopify$q$, $q$Yes, Shopify offers point-of-sale hardware and software for in-person retail alongside its online store tools.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$What is Shopify Plus$q$, $q$Shopify Plus is Shopify's enterprise-tier plan, starting from $2,300 per month, built for high-volume merchants needing custom checkout and dedicated support.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Is Shopify good for beginners$q$, $q$Yes, Shopify's drag-and-drop builder and guided setup make it accessible to merchants without coding experience.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Is Shopify a public company$q$, $q$Yes, Shopify is publicly traded on the NYSE and Toronto Stock Exchange under the ticker SHOP.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Where is Shopify headquartered$q$, $q$Shopify is headquartered in Ottawa, Ontario, Canada.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$What is the Shopify Agentic plan$q$, $q$The Agentic plan, launched in 2026, is a free, no-storefront plan that lets merchants sell through AI shopping assistants like ChatGPT and Gemini, billed per completed sale.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Solo and small business online store$q$, $q$Launch a branded online store quickly without needing a developer.$q$, $q$Solo entrepreneurs and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Omnichannel retail with POS$q$, $q$Unify online and in-person sales, inventory, and customer data across channels.$q$, $q$Retailers with physical storefronts and online sales$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$High-volume enterprise commerce$q$, $q$Run large-scale, highly customized storefronts with dedicated support via Shopify Plus.$q$, $q$Enterprise and high-growth direct-to-consumer brands$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Starter$q$, $q$$5/month$q$, $q$Monthly$q$, NULL, $q$["Link-in-bio storefront","Social and checkout link selling","Basic reporting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Basic$q$, $q$$39/month$q$, $q$Monthly (annual discount available)$q$, NULL, $q$["Full online store","2 staff accounts","Basic reports","Discount codes"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Grow$q$, $q$$105/month$q$, $q$Monthly (annual discount available)$q$, NULL, $q$["5 staff accounts","Advanced reporting","Lower transaction fees","Third-party calculated shipping"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Advanced$q$, $q$$399/month$q$, $q$Monthly (annual discount available)$q$, NULL, $q$["15 staff accounts","Custom reports","Advanced shipping discounts","Enhanced checkout customization"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$Plus$q$, $q$From $2,300/month$q$, $q$Custom/annual contract$q$, NULL, $q$["Enterprise checkout extensibility","Higher API limits","Dedicated merchant success support","Advanced automation via Shopify Flow"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '8feedd41-747b-469b-a7e6-60d22adde1c3';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$shopify-overview$q$, $q$What is Shopify$q$, 2, ARRAY[$q$Shopify is a commerce platform founded in 2006 in Ottawa, Canada, that lets businesses of any size launch and run online stores, physical retail locations, and multi-channel selling operations from one system. Publicly traded on both the NYSE and TSX under the ticker SHOP, Shopify has grown from a niche snowboard-shop project into infrastructure powering millions of merchants worldwide.$q$, $q$The platform is used by everyone from first-time solo entrepreneurs to large global brands, thanks to a tiered plan structure that scales pricing and feature depth with business size. Shopify combines storefront hosting, payments, inventory, shipping, and marketing tools with a large third-party app ecosystem and theme marketplace.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$shopify-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$Shopify provides a drag-and-drop storefront builder and theme library, built-in payment processing through Shopify Payments (plus support for over 100 third-party gateways), and point-of-sale hardware for in-person retail. Merchants can sell across social platforms, marketplaces, and increasingly through AI shopping assistants via the Agentic plan.$q$, $q$Beyond the storefront, Shopify includes inventory, order, and shipping management, Shopify Flow for workflow automation, and built-in analytics. Its app ecosystem and developer APIs allow deep customization, while Shopify Plus adds enterprise-grade features like custom checkout extensibility for high-volume merchants.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8feedd41-747b-469b-a7e6-60d22adde1c3', $q$shopify-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Shopify's 2026 lineup includes a free, no-storefront Agentic plan for selling through AI assistants (billed per completed sale), a Starter plan at $5 per month for link-in-bio and social selling, and standard Basic, Grow, and Advanced plans priced at $39, $105, and $399 per month respectively, each unlocking more advanced reporting, staff accounts, and lower transaction fees.$q$, $q$At the top end, Shopify Plus starts from $2,300 per month and targets high-volume and enterprise merchants who need custom checkout, higher API limits, and dedicated support. Paying annually on the Basic, Grow, and Advanced plans saves approximately 25 percent compared to monthly billing.$q$]::text[], 2);


-- ── Shopware ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Shopware is a German open-source and enterprise e-commerce platform that lets B2B and B2C businesses build, customize, and scale online stores with an API-first, headless-capable architecture.$q$, short_description),
  pricing_model = COALESCE($q$Freemium open-source core plus tiered cloud/enterprise subscriptions$q$, pricing_model),
  starting_price = COALESCE($q$Free (Community Edition)$q$, starting_price),
  founded_year = COALESCE(2000, founded_year),
  company_size = COALESCE($q$400+ employees$q$, company_size),
  headquarters = COALESCE($q$Schoppingen, Germany$q$, headquarters),
  languages = ARRAY[$q$German$q$, $q$English$q$]::text[],
  seo_title = COALESCE($q$Shopware Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$See Shopware's pricing plans, features, pros and cons for 2026. Compare Germany's leading open-source e-commerce platform for B2B and B2C stores.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Shopware is a German e-commerce software company founded in 2000 in Schoppingen, Germany by brothers Stefan Hamann and Sebastian Hamann. Shopware AG is headquartered in Schoppingen and employs roughly 400 people. The company builds an open-source, API-first commerce platform written in PHP that supports both business-to-consumer and business-to-business online stores, with a headless and composable architecture that lets developers connect any frontend to Shopware's commerce backend. Shopware is the leading e-commerce platform in Germany, powering 115 of the country's top 1,000 online shops according to EHI's 2025 ranking, and an estimated 100,000 merchants worldwide use Shopware software, generating a combined 12 billion euro in revenue. Unlike Shopify, which charges transaction fees on sales, Shopware's commercial editions charge flat monthly subscription fees scaled to a merchant's gross merchandise volume. The free, self-hosted Community Edition is open source and free to use up to 1 million euro in GMV, while paid cloud and enterprise editions, named Rise, Evolve, and Beyond, add features like B2B components, advanced search, dynamic access rules, multi-inventory, subscriptions, and dedicated support with faster response times. In 2025, PayPal acquired The Carlyle Group's stake in Shopware and now holds a 41 percent ownership position, reflecting continued strategic investment in the platform, particularly for merchants seeking an alternative to Shopify with more architectural flexibility and self-hosting options.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4129c50a-55d6-450e-8940-28027dd14508';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4129c50a-55d6-450e-8940-28027dd14508' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Open-source Community Edition$q$, $q$Free, self-hostable core platform with full source code access.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$API-first, headless architecture$q$, $q$Connect any frontend to Shopware's commerce backend for composable commerce builds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Built-in B2B components$q$, $q$Tiered pricing, quote management, and buyer approval workflows for wholesale commerce.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Shopware Intelligence AI tools$q$, $q$Copilot, image editor, and 3D preview generator for faster content creation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Unlimited sales channels$q$, $q$Manage multiple storefronts and channels from a single Shopware instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Flat GMV-based pricing$q$, $q$Paid editions charge flat monthly fees scaled to sales volume instead of per-transaction fees.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Extension marketplace$q$, $q$Plugins and themes for extending functionality without custom development.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Open-source flexibility with full self-hosting control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Strong native B2B feature set for wholesale and complex pricing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$No per-transaction fees on paid cloud editions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Dominant market position in the German and DACH e-commerce market$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Backed by strategic investment from PayPal$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Smaller global app ecosystem than Shopify$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Requires more technical resources to self-host and customize$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Enterprise tiers (Evolve and Beyond) are costly for smaller merchants$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Documentation and community support skew toward German-language users$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Fewer built-in integrations tailored to the US market compared to US-based platforms$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Is Shopware free$q$, $q$Shopware's Community Edition is free and open source, usable at no cost up to 1 million euro in gross merchandise volume.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$How is Shopware different from Shopify$q$, $q$Shopware charges flat monthly fees scaled to sales volume and offers a free open-source edition, while Shopify charges per-transaction fees and has no free self-hosted option.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Who owns Shopware$q$, $q$Shopware AG is a German company; PayPal holds a 41 percent stake as of 2025 after acquiring The Carlyle Group's position.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Is Shopware open source$q$, $q$Yes, Shopware's Community Edition is open source and self-hostable.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Does Shopware charge transaction fees$q$, $q$No, Shopware's paid editions use flat monthly subscription pricing scaled to GMV rather than per-transaction fees.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Can Shopware handle B2B commerce$q$, $q$Yes, Shopware includes native B2B components like tiered pricing, quote management, and buyer approval workflows.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Where is Shopware based$q$, $q$Shopware AG is headquartered in Schoppingen, Germany.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$When was Shopware founded$q$, $q$Shopware was founded in 2000 by brothers Stefan and Sebastian Hamann.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$German and European B2C online store$q$, $q$Build a localized online store for the German or broader European market.$q$, $q$European retailers and D2C brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$B2B wholesale commerce$q$, $q$Manage tiered pricing, quotes, and buyer approvals for wholesale and B2B sales.$q$, $q$Manufacturers and wholesale distributors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Headless composable commerce$q$, $q$Connect a custom frontend to Shopware's commerce backend via API.$q$, $q$Enterprise brands and development agencies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Community Edition$q$, $q$Free$q$, $q$N/A (self-hosted, up to EUR 1M GMV)$q$, NULL, $q$["Open-source core","Modular architecture","Self-hosting","Global developer community"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Rise$q$, $q$From EUR 600/month$q$, $q$Monthly$q$, NULL, $q$["Shopware Intelligence included","3D capabilities","Unlimited sales channels","Basic support (8-hour response)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Evolve$q$, $q$From EUR 2,400/month$q$, $q$Monthly$q$, NULL, $q$["B2B components","Advanced search","Dynamic access rules","Enhanced support (4-hour response, phone support)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$Beyond$q$, $q$Custom pricing$q$, $q$Custom/annual contract$q$, NULL, $q$["Digital sales rooms","Multi-inventory","Customer-specific pricing","24/7 priority support with dedicated account manager"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '4129c50a-55d6-450e-8940-28027dd14508';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$shopware-overview$q$, $q$What is Shopware$q$, 2, ARRAY[$q$Shopware is an e-commerce software company founded in 2000 in Schoppingen, Germany by brothers Stefan and Sebastian Hamann. It has grown into Germany's leading e-commerce platform, with an estimated 100,000 merchants worldwide and a strong presence among top German online retailers.$q$, $q$The platform is built with an API-first, headless-capable architecture, allowing developers to connect any frontend to Shopware's commerce backend. This makes it popular among merchants and agencies that want more architectural flexibility than fully hosted platforms typically allow, particularly for complex B2B commerce.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$shopware-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$Shopware's Community Edition is fully open source and self-hostable, giving developers complete control over customization. Paid cloud editions add built-in B2B components such as tiered pricing, quote management, and buyer approval workflows, along with unlimited sales channels and Shopware Intelligence AI tools like a copilot, image editor, and 3D preview generator.$q$, $q$Higher tiers unlock advanced search, dynamic access rules, multi-inventory management, and subscription commerce, alongside faster support response times. Shopware's extension marketplace and theme ecosystem further extend functionality without requiring a full custom build.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4129c50a-55d6-450e-8940-28027dd14508', $q$shopware-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Shopware's Community Edition is free and open source, usable at no cost up to 1 million euro in gross merchandise volume. Paid cloud editions are priced as flat monthly subscriptions rather than per-transaction fees: Rise starts from 600 euro per month, Evolve from 2,400 euro per month, and Beyond is custom-priced for large enterprise merchants.$q$, $q$An optional Shopware Intelligence+ add-on, which unlocks unlimited access to AI tools like the copilot and 3D preview generator, costs 29 euro per month on Community Edition or 19 euro per month on paid editions.$q$]::text[], 2);


-- ── Shortcut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Shortcut (formerly Clubhouse) is project management and issue-tracking software built specifically for software development teams, combining stories, iterations, and docs in one workflow.$q$, short_description),
  pricing_model = COALESCE($q$Freemium, per-user subscription$q$, pricing_model),
  starting_price = COALESCE($q$Free (up to 10 users); paid plans from $8.50/user/month billed annually$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$New York, New York, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Shortcut Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Shortcut (formerly Clubhouse) is project management software built for software teams. See pricing, features, pros, cons and FAQs for 2026.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Shortcut is project management and software development tracking tool founded in 2014 in New York and originally launched to the public in 2016 under the name Clubhouse. The company rebranded from Clubhouse to Shortcut in September 2021 to avoid confusion with the unrelated audio social-networking app Clubhouse that launched the same year. Shortcut was built specifically for software engineering teams, combining Kanban boards, sprint-style Iterations, roadmaps, docs, and reporting in a single workspace designed to be lighter-weight and more developer-friendly than tools like Jira. The company has raised a total of about 39 million dollars in funding, including a 10 million dollar Series A led by Battery Ventures in 2017, from investors including Battery Ventures, Greylock Partners, Lerer Hippeau, Resolute Ventures, and Neu Venture Capital. Shortcut reports more than 10,000 companies worldwide use the product to plan and ship software. It integrates natively with GitHub, GitLab, Slack, Figma, and other developer tools, and offers a free plan for teams up to 10 users, paid Team and Business tiers billed per user annually, and a custom Enterprise plan with SSO, SCIM, and premium support SLAs. Shortcut also runs a nonprofit program offering free access to qualifying organizations and a startup program giving companies under 50 employees 12 months of free access. In April 2022 Shortcut earned Great Place to Work certification, with 97 percent of employees rating it a great place to work.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Kanban Stories and custom Workflows$q$, $q$Track work as Stories organized into fully customizable Kanban workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Iterations$q$, $q$Sprint-style planning cycles with velocity and progress tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Roadmaps and Objectives$q$, $q$Connect engineering work to higher-level goals and OKRs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Built-in Docs$q$, $q$Write and link specs and knowledge base content directly alongside tracked work.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Native dev-tool integrations$q$, $q$Connects with GitHub, GitLab, Slack, and Figma out of the box.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Automations$q$, $q$Automate repetitive workflow actions like status changes and assignments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Advanced Reports and custom fields$q$, $q$Build custom reporting views and track team-specific metadata.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Purpose-built for software engineering teams rather than general project management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Simpler, faster interface than heavier tools like Jira$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Generous free tier for teams up to 10 users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Transparent per-user pricing with no hidden enterprise-only paywalls at the Team/Business level$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Strong native integrations with GitHub, GitLab, and Slack$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Less suited to non-engineering teams than general-purpose PM tools like Asana$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Fewer deep workflow customizations than enterprise-grade tools like Jira$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Mobile app is less mature than the web application$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Reporting depth trails some larger, more established competitors$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Enterprise pricing is not published and requires a sales conversation$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Is Shortcut the same as Clubhouse$q$, $q$Yes, Shortcut was originally launched as Clubhouse in 2016 and rebranded to Shortcut in September 2021.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$How much does Shortcut cost$q$, $q$Shortcut has a free plan for up to 10 users, a Team plan from $8.50/user/month, a Business plan at $12/user/month (both billed annually), and custom Enterprise pricing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Is there a free plan$q$, $q$Yes, Shortcut offers a free plan for up to 10 users with core features including Kanban, Roadmap, Reports, and Docs.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Does Shortcut integrate with GitHub$q$, $q$Yes, Shortcut has native integrations with GitHub, GitLab, Slack, and Figma.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Who is Shortcut for$q$, $q$Shortcut is built primarily for software development teams that want lightweight, engineering-focused project management.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$What happened to the Clubhouse app name$q$, $q$Shortcut rebranded away from the Clubhouse name to avoid confusion with an unrelated social audio app that launched the same name in 2020.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Does Shortcut offer nonprofit or startup discounts$q$, $q$Yes, Shortcut offers a free plan for qualifying nonprofits and a startup program giving companies under 50 employees 12 months free.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Where is Shortcut headquartered$q$, $q$Shortcut is headquartered in New York, New York.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Agile sprint planning$q$, $q$Plan and track sprint-based work using Iterations and Kanban Workflows.$q$, $q$Software engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Cross-team roadmap and OKR tracking$q$, $q$Connect engineering execution to company-level objectives and roadmaps.$q$, $q$Engineering managers and product leaders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Developer-centric bug and issue tracking$q$, $q$Track bugs and technical work with native GitHub and GitLab integration.$q$, $q$Development teams shipping software products$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Free$q$, $q$$0$q$, $q$Monthly (up to 10 users)$q$, NULL, $q$["Kanban views","Roadmap","Reports","Iterations","Docs","Basic integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Team$q$, $q$$8.50/user/month$q$, $q$Billed annually$q$, NULL, $q$["Unlimited users","Advanced Reports","Work-in-progress limits","Up to 5 custom workflows","Automations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Business$q$, $q$$12/user/month$q$, $q$Billed annually$q$, NULL, $q$["Unlimited workflows","Strategic Objectives/OKRs","Advanced custom fields","Multiple Workspaces"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$Enterprise$q$, $q$Contact sales$q$, $q$Custom$q$, NULL, $q$["Volume discounts","Premier support SLAs","SSO and SCIM","Dedicated onboarding"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'b1c88fdc-36c0-46b6-b18f-74a4330788d4';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$shortcut-overview$q$, $q$What is Shortcut$q$, 2, ARRAY[$q$Shortcut is a project management and issue-tracking platform built specifically for software development teams. Founded in 2014 in New York, the product launched publicly in 2016 as Clubhouse before rebranding to Shortcut in September 2021 to avoid confusion with an unrelated social app of the same name.$q$, $q$Shortcut is designed to be lighter and more developer-friendly than heavyweight enterprise tools like Jira, while still supporting sprint planning, roadmaps, and cross-team objectives. More than 10,000 companies reportedly use Shortcut to plan and ship software.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$shortcut-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$Shortcut centers on Stories organized into customizable Kanban Workflows, with Iterations for sprint-style planning and velocity tracking. Roadmaps and Objectives let teams connect day-to-day engineering work to higher-level goals, while built-in Docs support specs and knowledge sharing alongside the tracker.$q$, $q$The platform integrates natively with GitHub, GitLab, Slack, and Figma, and includes Automations for repetitive workflow tasks, advanced Reports, and custom fields. Enterprise customers get SSO, SCIM, and premium support SLAs.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1c88fdc-36c0-46b6-b18f-74a4330788d4', $q$shortcut-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Shortcut offers a free plan for up to 10 users with core Kanban, Roadmap, Reports, Iterations, and Docs features. Paid plans are billed per user: the Team plan starts at $8.50 per user per month billed annually, and the Business plan is $12 per user per month billed annually, both with unlimited users and all integrations.$q$, $q$Shortcut Enterprise requires contacting sales and adds volume discounts, premier support SLAs, SSO and SCIM, and dedicated onboarding. Shortcut also offers a free plan for qualifying nonprofits and a startup program giving companies under 50 employees 12 months of free access.$q$]::text[], 2);


-- ── Shotcut ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Shotcut is a free, open-source, cross-platform video editor for Windows, Mac, and Linux built on the FFmpeg-powered MLT multimedia framework.$q$, short_description),
  pricing_model = COALESCE($q$Free and open source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Shotcut Review 2026: Free Open-Source Video Editor Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Shotcut is a free, open-source video editor for Windows, Mac and Linux. See features, pros, cons and FAQs before you download.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Shotcut is a free, open-source, cross-platform video editor for Windows, macOS, and Linux, maintained by Meltytech, LLC and led by developer Dan Dennedy. The current version of Shotcut began development in 2011 as a rewrite of an earlier 2004 project originally conceived by Charlie Yates, one of the co-founders of the MLT Multimedia Framework that still powers Shotcut's playback and processing engine today. Because Shotcut is built on FFmpeg, it supports hundreds of audio and video formats and codecs natively, meaning users can edit footage directly on the timeline without transcoding or importing into a proprietary format first. The application supports multi-format timelines, resolutions up to 4K and beyond hardware permitting, and offers a comprehensive library of video and audio filters including color grading, chroma key and green screen, masking, keyframeable transitions, and audio balance tools. Shotcut also includes screen, webcam, and audio capture, network stream playback, and Blackmagic Design hardware support for professional input and preview monitoring. Unlike many free video editors, Shotcut has no watermarks, no trial period limitations, and no paywalled export resolutions, meaning the full feature set is available to every user at no cost. It can also run as a portable application on Windows and Linux without installation, making it usable directly from a USB drive. Because it is a community-driven open-source project rather than a commercial company, Shotcut has no headquarters, employee count, or company size in the traditional sense; development is coordinated publicly on GitHub.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '57934454-9221-47e3-87a7-83d5b080c4a6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '57934454-9221-47e3-87a7-83d5b080c4a6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Native FFmpeg format support$q$, $q$Edit hundreds of audio and video formats directly on the timeline without transcoding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$High-resolution editing$q$, $q$Supports editing and export up to 4K and beyond, depending on system hardware.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Extensive filter library$q$, $q$Video and audio filters including color grading, masking, and keyframeable transitions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Chroma key and green screen$q$, $q$Built-in tools for compositing and background replacement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Screen, webcam, and audio capture$q$, $q$Record directly within the application without third-party capture software.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Blackmagic Design support$q$, $q$Hardware input and preview monitoring for professional workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Portable, installation-free builds$q$, $q$Run Shotcut from a USB drive on Windows and Linux without installing it.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Completely free and open source with no hidden costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$No watermarks or paywalled export features$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Wide native format support via FFmpeg$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Active open-source community with frequent releases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Runs on Windows, macOS, and Linux$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Interface is less polished and intuitive than paid editors like Premiere or Final Cut$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Performance can lag on very large 4K or 8K projects$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Fewer built-in templates and motion graphics than commercial tools$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Learning curve for advanced color grading and audio mixing tools$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$No official cloud collaboration or cloud project storage features$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Is Shotcut really free$q$, $q$Yes, Shotcut is completely free and open source with no watermarks, trial limits, or paid tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$What platforms does Shotcut support$q$, $q$Shotcut runs on Windows, macOS, and Linux.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Does Shotcut have watermarks$q$, $q$No, exported videos from Shotcut never include watermarks, regardless of resolution.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Who makes Shotcut$q$, $q$Shotcut is maintained by Meltytech, LLC and lead developer Dan Dennedy, with the current version starting development in 2011.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$What is the MLT framework$q$, $q$MLT is the open-source multimedia framework that powers Shotcut's playback and processing engine, in development since 2004.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Can Shotcut edit 4K video$q$, $q$Yes, Shotcut supports editing and exporting in 4K and higher resolutions, depending on available hardware.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Is Shotcut good for beginners$q$, $q$Shotcut offers a full professional feature set for free, though its interface has more of a learning curve than some simplified beginner editors.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Does Shotcut require an account$q$, $q$No, Shotcut can be downloaded and used without creating an account or providing payment information.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Hobbyist and YouTube content editing$q$, $q$Edit and export videos for YouTube and other platforms without any software cost.$q$, $q$Content creators and hobbyist video editors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Portable video editing$q$, $q$Run Shotcut from a USB drive on shared or public computers without installation.$q$, $q$Students and users without administrative install rights$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Screen-recording and tutorial production$q$, $q$Capture and edit screen recordings for tutorials and product demos.$q$, $q$Educators and technical content creators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Desktop Edition$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full editing feature set","4K and higher resolution export","No watermarks","No account required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$Portable Edition$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["No installation required","Runs from USB drive","Same feature set as installed version","Available for Windows and Linux"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '57934454-9221-47e3-87a7-83d5b080c4a6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$shotcut-overview$q$, $q$What is Shotcut$q$, 2, ARRAY[$q$Shotcut is a free, open-source video editor for Windows, macOS, and Linux, maintained by Meltytech, LLC and lead developer Dan Dennedy. The current version began development in 2011 as a rewrite of an earlier 2004 project, built on the FFmpeg-powered MLT Multimedia Framework that Dennedy also co-created.$q$, $q$Because it is community-driven open-source software rather than a commercial company, Shotcut has no headquarters or corporate employee count, and development is coordinated publicly on GitHub with regular community-driven releases.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$shotcut-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$Shotcut's use of FFmpeg gives it native support for hundreds of audio and video formats and codecs, so footage can be edited directly on the timeline without transcoding first. It supports multi-format timelines and resolutions up to 4K and beyond depending on hardware, alongside a large library of video and audio filters including color grading, chroma key, masking, and keyframeable transitions.$q$, $q$The editor also includes screen, webcam, and audio capture, network stream playback, and Blackmagic Design hardware support for professional monitoring. Portable, installation-free versions are available for Windows and Linux, letting users run Shotcut directly from a USB drive.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57934454-9221-47e3-87a7-83d5b080c4a6', $q$shotcut-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Shotcut is completely free to download and use, with no watermarks, trial limitations, or paywalled export resolutions. The full feature set, including 4K export and the complete filter library, is available to every user at no cost.$q$, $q$Because there is no paid tier, users are not asked to create an account or provide payment information at any point, and the software is distributed under an open-source license.$q$]::text[], 2);


-- ── Shots ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Shots.so is a browser-based mockup and screenshot generator that wraps app screenshots and product shots in device frames, backgrounds, and animated presets for marketing, App Store, and social media use.$q$, short_description),
  pricing_model = COALESCE($q$Freemium subscription$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans reported from approximately $8/month)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Shots.so Review 2026: Mockup Generator Features and Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Shots.so turns screenshots into device mockups and animated videos. See features, pricing, pros, cons and FAQs for this mockup generator.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Shots, marketed as Shots.so, is a browser-based design tool for turning plain app screenshots and product images into polished marketing visuals. Users upload a screenshot and the tool wraps it in a device frame, such as an iPhone, Android phone, iPad, MacBook, browser window, or Apple Watch, on top of a customizable background, gradient, or 3D scene, then export the result as a static image or, on paid plans, as an animated video. The product is positioned for App Store and Google Play screenshot galleries, Product Hunt launch assets, landing page hero images, and social media posts, and it ships with a growing library of ready-to-use mockup templates, animation presets, video zoom effects, and stylistic filters like noise, VHS, and glitch, alongside 3D shapes and shadow overlays. Shots.so operates on a freemium model: its free tier is usable for occasional static mockups, while paid tiers unlock features like animated and video export and additional formats such as WebP, with third-party pricing comparisons placing paid plans at roughly $8 and $12 per month. Shots.so is an unrelated commercial SaaS product focused specifically on marketing mockups rather than full video editing, and should not be confused with the open-source video editor Shotcut despite the similar-sounding name. Public information about the company behind Shots.so, including its founding year, headquarters, and team size, is limited; the product is promoted primarily through its own website and associated social media accounts, and it does not disclose employee count or incorporation details publicly.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4ed46725-5825-4345-b71d-388bad6fdf91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4ed46725-5825-4345-b71d-388bad6fdf91' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Device mockup library$q$, $q$Frames for iPhone, Android, iPad, MacBook, browser, and Apple Watch.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Customizable backgrounds and 3D scenes$q$, $q$Gradients, backgrounds, and 3D shapes to compose around a screenshot.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Animated mockups and video export$q$, $q$Turn static screenshots into animated video assets on paid plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Animation presets and parallax effects$q$, $q$Pre-built motion effects applied to mockups without manual animation work.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Stylistic filters$q$, $q$Noise, VHS, and glitch filters plus shadow overlays for stylized visuals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Multiple export formats$q$, $q$Export as static images or video with social media size presets.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Free template library$q$, $q$Ready-to-use mockup templates for quick starting points.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Fast way to create polished App Store and social screenshots$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$No design skill required to produce professional-looking mockups$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Free tier is usable for occasional, low-volume needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Animated and video export differentiates it from purely static mockup tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Browser-based with no software installation required$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Limited public information about the company or team behind the product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Advanced features like video and WebP export are gated behind paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$No desktop application, only browser-based access$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Narrower feature set than general-purpose design tools like Figma or Canva$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Pricing and plan names are not clearly published on an official pricing page$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$What is Shots.so$q$, $q$Shots.so is a browser-based tool that wraps screenshots and product images in device frames and backgrounds to create marketing mockups.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Is Shots.so free$q$, $q$Shots.so has a free tier usable for occasional static mockups, with paid plans unlocking video export and additional formats.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$How is Shots.so different from Shotcut$q$, $q$Shots.so is a screenshot mockup generator, while Shotcut is an unrelated free open-source video editor; the two share a similar name but no other connection.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$What devices can I create mockups for$q$, $q$Shots.so supports device frames including iPhone, Android phones, iPad, MacBook, browser windows, and Apple Watch.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Does Shots.so support video export$q$, $q$Yes, paid plans allow exporting animated mockups as video in addition to static images.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Who makes Shots.so$q$, $q$Public information about the company behind Shots.so is limited; founding year, headquarters, and team size are not publicly disclosed.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Can I use Shots.so for App Store screenshots$q$, $q$Yes, App Store and Google Play screenshot design is one of the product's primary use cases.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Does Shots.so add a watermark to free exports$q$, $q$The free tier is positioned for occasional use, and users should check current terms on the product website for any watermark or export limits.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$App Store and Google Play screenshots$q$, $q$Create polished device-framed screenshots for app store listings.$q$, $q$Mobile app developers and marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Product Hunt and landing page assets$q$, $q$Generate hero images and launch visuals for product marketing pages.$q$, $q$Indie founders and product marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Social media product announcements$q$, $q$Produce animated or static visuals for announcing products on social platforms.$q$, $q$Social media managers and growth teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Free$q$, $q$$0$q$, $q$Monthly$q$, NULL, $q$["Static mockup exports","Access to free template library","Limited monthly usage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Starter$q$, $q$~$8/month$q$, $q$Monthly$q$, NULL, $q$["Expanded export limits","Additional templates","Basic animation presets"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Pro$q$, $q$~$12/month$q$, $q$Monthly$q$, NULL, $q$["Animated and video export","WebP export format","Priority access to new templates"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '4ed46725-5825-4345-b71d-388bad6fdf91';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$shots-overview$q$, $q$What is Shots.so$q$, 2, ARRAY[$q$Shots.so is a browser-based tool for turning plain screenshots and product images into polished marketing visuals using device frames, backgrounds, and 3D scenes. It is aimed at people who need App Store screenshots, Product Hunt launch assets, or social media graphics without design skills or software installation.$q$, $q$Shots.so should not be confused with Shotcut, the unrelated open-source video editor; the two products share a similar-sounding name but serve entirely different purposes, with Shots.so focused on static and animated marketing mockups rather than full video editing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$shots-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$The tool provides a library of device mockups, including iPhone, Android, iPad, MacBook, browser window, and Apple Watch frames, placed over customizable backgrounds, gradients, and 3D scenes. Users can add animation presets, video zoom effects, stylistic filters like noise, VHS, and glitch, and shadow overlays to make static screenshots feel more dynamic.$q$, $q$On paid plans, mockups can be exported as animated videos in addition to static images, with multiple export formats and social media size presets available. A free template library gives users a quick starting point without building a design from scratch.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$shots-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Shots.so offers a free tier that is usable for occasional static mockups, such as a handful of images per month for social posts or blog content. Paid plans unlock additional capabilities like animated or video export and formats such as WebP.$q$, $q$Third-party pricing comparisons place Shots.so's paid tiers at roughly $8 and $12 per month, though the company does not appear to publish a dedicated public pricing page with fixed plan names, so buyers should confirm current pricing directly on the product's website before purchasing.$q$]::text[], 2);


-- ── Sift Org Chart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sift is an organizational intelligence platform that auto-builds interactive org charts and employee directories from HR, IT, and identity systems, integrating with Slack, Microsoft Teams, and Google Workspace.$q$, short_description),
  pricing_model = COALESCE($q$Per-user subscription, billed annually$q$, pricing_model),
  starting_price = COALESCE($q$$1.50/user/month (Org Chart plan, minimum 20 users)$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Detroit, Michigan, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sift Org Chart Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Sift auto-builds org charts and employee directories from your HR systems. See pricing, features, pros, cons and FAQs for 2026.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sift, also referred to as Sift Org Chart and marketed at justsift.com, is an organizational intelligence and people-directory platform founded in 2015 by Charles Hilliard and Ryan Bickham. The company, legally Sift Enterprises Corp., is headquartered in Detroit, Michigan and operates with a relatively small team of roughly 11 to 50 employees despite serving enterprise customers whose combined workforces total more than 500,000 charted employees. Sift's core product automatically builds and continuously updates interactive org charts and searchable employee directories by pulling data from HRIS platforms such as BambooHR, Gusto, Paycor, and ADP GlobalView Payroll, identity providers like Okta and Rippling, and productivity suites including Microsoft 365 and Google Workspace, so charts stay accurate as employees join, leave, or change roles without manual maintenance. Employee profiles can surface skills, interests, dotted-line reporting relationships, and contact details, and the platform is accessible directly inside Slack, Microsoft Teams, mobile apps, and company intranets, in addition to its own web app and API. Sift is billed annually on a per-user basis with plans starting at a minimum of 20 users: an Org Chart-only tier starting around $1.50 per user per month, a Directory tier around $2.00 per user per month that adds employee profiles, SSO, and white-labeling, and a bundled Complete tier around $3.25 per user per month. The platform holds a G2 Leader badge, a 4.6-star Capterra rating, and SOC 2 compliance certification, and it is aimed primarily at mid-market and enterprise HR, IT, and People Ops teams managing distributed or remote workforces.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '54840d54-d23f-400b-9a21-c910db72a31a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '54840d54-d23f-400b-9a21-c910db72a31a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Automated org chart building$q$, $q$Org charts update automatically as employee data changes, without manual editing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Searchable employee directory$q$, $q$Rich employee profiles with skills, interests, and contact details.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$HRIS integrations$q$, $q$Syncs with BambooHR, Gusto, Paycor, and ADP GlobalView Payroll, among others.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Identity provider sync$q$, $q$Connects with Okta and Rippling to keep data current automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Native Slack and Microsoft Teams apps$q$, $q$Access org charts and directory search directly inside everyday work tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Google Workspace and Microsoft 365 integration$q$, $q$Pulls and syncs organizational data from common productivity suites.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$SSO and white-labeling$q$, $q$Available on the Directory and Complete tiers for enterprise deployment.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Automatic sync eliminates manual org chart upkeep$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Deep integrations with common HR and identity systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Accessible directly inside Slack and Microsoft Teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Transparent, tiered per-user pricing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Strong G2 and Capterra ratings with SOC 2 compliance$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Minimum 20-user commitment may not suit very small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$SSO and white-labeling require the higher Directory or Complete tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Small team size relative to larger enterprise HR software incumbents$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Not a replacement for a full HRIS for core HR functions like payroll$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Pricing requires an annual billing commitment$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$What is Sift Org Chart used for$q$, $q$Sift is used to automatically build and maintain org charts and employee directories synced with a company's HR and identity systems.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$How much does Sift cost$q$, $q$Sift's plans start around $1.50 per user per month for Org Chart only, up to roughly $3.25 per user per month for the Complete tier, billed annually with a 20-user minimum.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Does Sift integrate with Slack$q$, $q$Yes, Sift has a native Slack integration alongside Microsoft Teams, Google Workspace, and Microsoft 365 support.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Who founded Sift$q$, $q$Sift was founded in 2015 by Charles Hilliard and Ryan Bickham.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Is Sift the same as an HRIS$q$, $q$No, Sift is an org chart and employee directory tool that syncs with HRIS systems rather than replacing core HR functions like payroll.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$What is the minimum number of users for Sift$q$, $q$Sift plans start with a minimum of 20 users.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Does Sift work with Google Workspace$q$, $q$Yes, Sift integrates with Google Workspace as one of its supported data and identity sources.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Is Sift good for remote teams$q$, $q$Yes, Sift is positioned specifically for distributed and remote workforces that need an always-current view of company structure.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Automated org chart maintenance$q$, $q$Keep org charts accurate automatically as a company grows and changes.$q$, $q$HR and People Ops teams at growing companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Employee directory and people search$q$, $q$Find colleagues and their roles directly inside Slack or Microsoft Teams.$q$, $q$Employees at mid-market and enterprise companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Distributed workforce visibility$q$, $q$Give leadership and staff a clear view of organizational structure across remote teams.$q$, $q$IT and People Ops teams managing remote or hybrid workforces$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Org Chart$q$, $q$$1.50/user/month$q$, $q$Billed annually (min. 20 users)$q$, NULL, $q$["Automated org chart building","Unlimited people charted","Dotted-line relationships","Google and Office 365 integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Directory$q$, $q$$2.00/user/month$q$, $q$Billed annually (min. 20 users)$q$, NULL, $q$["Employee profiles","SSO","Mobile apps","Microsoft Teams integration","White-labeling"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Complete$q$, $q$$3.25/user/month$q$, $q$Billed annually (min. 20 users)$q$, NULL, $q$["Bundled Org Chart and Directory features","Search","Analytics and Pages"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$Enterprise$q$, $q$Contact sales$q$, $q$Custom/annual contract$q$, NULL, $q$["Custom pricing for 1,000+ employees","Higher SLAs","Dedicated client success support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '54840d54-d23f-400b-9a21-c910db72a31a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$sift-org-chart-overview$q$, $q$What is Sift$q$, 2, ARRAY[$q$Sift is an organizational intelligence platform founded in 2015 by Charles Hilliard and Ryan Bickham, headquartered in Detroit, Michigan. It automatically builds and maintains interactive org charts and employee directories by syncing with a company's existing HR, identity, and productivity systems.$q$, $q$The platform is aimed at mid-market and enterprise HR, IT, and People Ops teams that need an always-accurate view of company structure, particularly organizations with distributed or remote workforces where manual org chart upkeep becomes impractical.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$sift-org-chart-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$Sift's org charts update automatically by pulling data from HRIS platforms like BambooHR, Gusto, Paycor, and ADP GlobalView Payroll, as well as identity providers such as Okta and Rippling. Employee profiles can display skills, interests, dotted-line relationships, and contact information, giving teams more context than a typical directory.$q$, $q$The platform is accessible directly inside Slack and Microsoft Teams, alongside mobile apps, company intranets, and Sift's own web app and API. Higher tiers add SSO and white-labeling, while an Analytics and Pages feature supports company-wide announcements and workforce reporting.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('54840d54-d23f-400b-9a21-c910db72a31a', $q$sift-org-chart-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sift is billed annually on a per-user basis, with plans requiring a minimum of 20 users. The Org Chart-only tier starts at roughly $1.50 per user per month, covering automated chart building and unlimited people charted.$q$, $q$A Directory tier at roughly $2.00 per user per month adds employee profiles, SSO, and white-labeling, while the bundled Complete tier at roughly $3.25 per user per month combines both Org Chart and Directory features. Organizations with more than 1,000 employees can request custom enterprise pricing with dedicated support.$q$]::text[], 2);


-- ── SignNow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$airSlate SignNow is an e-signature and document workflow platform that lets businesses send, sign, and manage legally binding documents online, with custom branded workflows and broad app integrations.$q$, short_description),
  pricing_model = COALESCE($q$Per-user subscription, monthly or annual billing$q$, pricing_model),
  starting_price = COALESCE($q$$8/user/month (Business plan, billed annually)$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE($q$800+ employees (airSlate, parent company)$q$, company_size),
  headquarters = COALESCE($q$Brookline, Massachusetts, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SignNow Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$SignNow (airSlate) is an e-signature platform for sending and signing documents online. See pricing, features, pros, cons and FAQs for 2026.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SignNow, marketed as airSlate SignNow, is an electronic signature platform originally founded in 2011 by Chris Hawkins and Andrew Ellis. The product was acquired by PDFfiller in October 2017 and is now sold as part of airSlate, a document workflow automation company headquartered in Brookline, Massachusetts. airSlate operates several related brands, including airSlate SignNow, pdfFiller, and the Document Automation Hub, under one umbrella, and the combined company employs roughly 800 people. SignNow lets individuals and businesses upload documents, add legally binding electronic signatures, and build custom multi-step signing workflows, with tools for templates, in-person signing, bulk send, and role-based signing order. It integrates with common business apps such as Salesforce, Google Workspace, and Microsoft 365, and offers an API and mobile apps for iOS and Android. Because SignNow is distinct from other e-signature products such as SignRequest, SignWell, and SignServer, it should not be confused with them despite similar naming and overlapping feature sets. SignNow's pricing is tiered by user count and billing frequency: the Business plan starts at about $8 per user per month billed annually, or $20 per month billed monthly, Business Premium adds advanced workflow and integration features at roughly $15 per user per month annually, and Enterprise pricing scales further with SSO, API access, and dedicated support, typically requiring a custom quote for large deployments. Each subscription tier includes an annual allotment of signature invites per user, with overage fees for additional signature requests beyond that allotment.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Legally binding e-signatures$q$, $q$Signed documents include a verifiable audit trail for legal compliance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Custom signing workflows$q$, $q$Build multi-step document workflows with role-based signing order.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Templates and bulk send$q$, $q$Reuse document templates and send to multiple recipients at once.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$In-person signing$q$, $q$Kiosk and tablet-based signing mode for face-to-face transactions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$API access$q$, $q$Embed e-signature capability directly into other business applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Business app integrations$q$, $q$Connects with Salesforce, Google Workspace, and Microsoft 365.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Mobile apps$q$, $q$iOS and Android apps for sending and signing documents on the go.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Affordable entry-level pricing compared to some competitors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Strong workflow and automation depth through the broader airSlate ecosystem$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Broad third-party integrations with common business apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Mobile apps for signing documents on the go$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Each plan includes an annual allotment of signature invites$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Overage fees apply once a plan's signature invite allotment is exceeded$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Advanced automation features require higher-cost tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Brand overlap with similarly named e-signature products can cause confusion$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Enterprise pricing is not published and requires a sales quote$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Interface can feel less modern than some newer e-signature competitors$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$What is SignNow$q$, $q$SignNow is an electronic signature and document workflow platform, sold as airSlate SignNow, for sending, signing, and managing legally binding documents online.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Who owns SignNow$q$, $q$SignNow is owned by airSlate, having been acquired by PDFfiller in October 2017; airSlate is headquartered in Brookline, Massachusetts.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$How much does SignNow cost$q$, $q$SignNow's Business plan starts at about $8 per user per month billed annually, with Business Premium and Enterprise tiers priced higher.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Is SignNow legally binding$q$, $q$Yes, SignNow provides legally binding electronic signatures with a verifiable audit trail.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Does SignNow have an API$q$, $q$Yes, SignNow offers an API for embedding e-signature functionality into other applications.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$How is SignNow different from SignRequest and SignWell$q$, $q$SignNow, SignRequest, and SignWell are separate, unrelated e-signature companies with different ownership and pricing despite similar naming and features.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Does SignNow offer a free trial$q$, $q$SignNow typically offers a free trial period before requiring a paid subscription; current trial terms should be confirmed on its website.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$What is airSlate$q$, $q$airSlate is a document workflow automation company that owns SignNow, pdfFiller, and the Document Automation Hub, headquartered in Brookline, Massachusetts.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Sales and HR document signing$q$, $q$Send and collect signatures on contracts, offer letters, and agreements.$q$, $q$Sales, HR, and legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Automated approval workflows$q$, $q$Build multi-step signing and approval workflows with role-based order.$q$, $q$Operations and business process teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Embedded e-signature via API$q$, $q$Add e-signature capability directly inside another application or platform.$q$, $q$Developers and software companies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Business$q$, $q$$8/user/month (annual) or $20/month (monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["100 signature invites per user per year","Templates","Bulk send","Mobile apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Business Premium$q$, $q$$15/user/month (annual) or $30/month (monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["Advanced workflow features","Additional integrations","Role-based signing order","In-person signing"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$Enterprise$q$, $q$$30/user/month (annual) or $50/month (monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["SSO","Expanded API access","Dedicated support","Volume discounts"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$signnow-overview$q$, $q$What is SignNow$q$, 2, ARRAY[$q$SignNow, marketed as airSlate SignNow, is an electronic signature platform originally founded in 2011 by Chris Hawkins and Andrew Ellis. It was acquired by PDFfiller in October 2017 and is now part of airSlate, a document workflow automation company headquartered in Brookline, Massachusetts.$q$, $q$SignNow lets individuals and businesses upload documents, collect legally binding electronic signatures, and build custom multi-step signing workflows. It is one of several related brands under the airSlate umbrella, alongside pdfFiller and the Document Automation Hub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$signnow-key-features$q$, $q$Key features$q$, 2, ARRAY[$q$SignNow supports templates and bulk send for repeat documents, role-based signing order for multi-party agreements, and an in-person signing mode for kiosk or tablet-based signing. Every signed document includes a legally binding audit trail.$q$, $q$The platform integrates with Salesforce, Google Workspace, and Microsoft 365, and offers an API for embedding signing directly into other applications, along with mobile apps for iOS and Android and role-based admin controls on Business-tier plans and above.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c7ccbb6-c9e7-4107-95f8-8f87d5e67f00', $q$signnow-pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SignNow's Business plan starts at about $8 per user per month billed annually, or $20 per month billed monthly, and includes an annual allotment of 100 signature invites per user, with overage fees for additional requests. Business Premium adds more advanced workflow and integration features at roughly $15 per user per month annually, or $30 per month billed monthly.$q$, $q$Enterprise pricing scales further with SSO, expanded API access, and dedicated support, typically priced around $30 per user per month annually or $50 per month billed monthly, with custom quotes and volume discounts available for large deployments.$q$]::text[], 2);



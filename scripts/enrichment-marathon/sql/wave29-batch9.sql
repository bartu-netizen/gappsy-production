-- Enrichment marathon batch: Vista Social, VistaCreate, Visual Studio Code, Vitally, VitePress, Vizard, vLLM, Voicenotes

-- ── Vista Social ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vista Social is an AI-powered social media management platform for scheduling, publishing, analytics, engagement, listening, and review management across major networks.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$79/month$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$New York City, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vista Social Review: Features, Pricing and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Vista Social is an AI-powered social media management tool for scheduling, analytics, engagement, and reviews. See pricing plans and key features.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vista Social is an AI-powered social media management platform founded in 2020 by Vitaly Veksler (CEO) and Reggie Azevedo, headquartered in New York City. Veksler previously built Social Report, an earlier social media tool started in 2010, and applied those lessons to Vista Social, which reportedly reached one million dollars in annual recurring revenue within about 24 months of launch with a small, mostly bootstrapped team of around two dozen employees. The platform consolidates publishing and scheduling, analytics, engagement monitoring, direct message automation, social listening, review management, employee advocacy, and a link-in-bio tool called Vista Page into one workspace supporting Facebook, Instagram, LinkedIn, TikTok, X, YouTube, Reddit, Snapchat, and Threads. Vista Social uses a subscription pricing model with no permanently free tier: the Professional plan starts at 79 dollars per month (or roughly 63 dollars per month billed annually) for 15 social profiles and 3 users, scaling up through Advanced (149 dollars per month), Scale (349 dollars per month), and a custom-priced Enterprise tier with unlimited profiles, users, and AI credits plus SSO and dedicated support. The platform has been recognized on review sites including a number-one 'easiest to use' ranking on G2 and a top social media management tool ranking on Capterra. It competes with tools such as Hootsuite, Sprout Social, Buffer, and Later, generally positioning itself as a lower-cost, feature-dense alternative aimed at agencies and marketing teams managing many client or brand accounts. Its AI Assistant and AI Knowledge features help generate captions, analyze sentiment, and answer questions about account performance, differentiating it from purely scheduling-focused competitors.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '10056aba-b816-4765-8bc7-9b81336ea50d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '10056aba-b816-4765-8bc7-9b81336ea50d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Multi-network scheduling$q$, $q$Plan and publish posts across Facebook, Instagram, LinkedIn, TikTok, X, YouTube, Reddit, Snapchat, and Threads from one calendar.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Unified engagement inbox$q$, $q$Monitor and respond to comments, mentions, and messages across connected accounts in a single stream.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$DM automation$q$, $q$Set up automated direct message flows to respond to common audience questions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Social listening$q$, $q$Track brand mentions and relevant keywords across social platforms to catch conversations in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Review management$q$, $q$Monitor and respond to customer reviews, including Google Business Profile listings, from the same dashboard.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Vista Page link-in-bio$q$, $q$Build a customizable link-in-bio landing page included with every plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$AI Assistant and AI Knowledge$q$, $q$Generate captions and get AI-powered answers about account performance using monthly AI credits.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Employee advocacy$q$, $q$Let employees share approved company content from their own profiles to extend organic reach.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Broad feature set (publishing, listening, reviews, advocacy) bundled at a lower price than many rivals$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Rated highly for ease of use on G2 and Capterra$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Supports a wide range of networks including Reddit, Snapchat, and Threads$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Vista Page link-in-bio tool included free with every plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Frequent feature releases including AI-driven tools$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$No permanently free tier for ongoing use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Advanced features like sentiment analysis and white-labeling are gated to higher tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$AI credits are capped per plan and can run out on high-volume accounts$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Enterprise pricing is not published and requires a sales conversation$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Smaller company than incumbents like Hootsuite or Sprout Social, so long-term roadmap stability is less proven$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$What is Vista Social used for$q$, $q$It is used to schedule and publish social media posts, manage engagement and reviews, monitor brand mentions, and analyze performance across multiple social networks from one dashboard.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Does Vista Social have a free plan$q$, $q$Vista Social does not currently offer a permanent free plan; the entry-level paid plan is Professional at 79 dollars per month.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Who founded Vista Social$q$, $q$Vista Social was founded in 2020 by Vitaly Veksler and Reggie Azevedo, based in New York City.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Which social networks does Vista Social support$q$, $q$It supports Facebook, Instagram, LinkedIn, TikTok, X, YouTube, Reddit, Snapchat, and Threads.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Does Vista Social include analytics$q$, $q$Yes, all plans include performance analytics, with custom reporting and country-level targeting available on Advanced and higher tiers.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Is there an agency or white-label option$q$, $q$White-label setup and client profile connections are available on the Scale and Enterprise plans.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$How does Vista Social pricing scale$q$, $q$Pricing scales by the number of connected social profiles, users, and monthly AI credits, ranging from Professional to Enterprise.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Does Vista Social offer a free trial$q$, $q$Vista Social offers a free trial period on its paid plans so teams can evaluate the platform before committing.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Agency client management$q$, $q$Agencies manage dozens of client social profiles, use white-label reporting, and collaborate with client teams inside Vista Social.$q$, $q$Digital marketing agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Brand review and reputation monitoring$q$, $q$Businesses track and respond to Google and social reviews alongside their regular social content in one workflow.$q$, $q$Local and multi-location businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$In-house social team scheduling$q$, $q$Marketing teams plan, approve, and publish content calendars across multiple brand accounts with analytics to measure results.$q$, $q$In-house marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Professional$q$, $q$$79/month$q$, $q$monthly (or $758/year)$q$, NULL, $q$["15 social profiles","3 users","10,000 DM contacts","1,000 AI credits per month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Advanced$q$, $q$$149/month$q$, $q$monthly (or $1,430/year)$q$, NULL, $q$["30 social profiles","6 users","25,000 DM contacts","2,000 AI credits per month","custom reports and integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Scale$q$, $q$$349/month$q$, $q$monthly (or $3,638/year)$q$, NULL, $q$["70 social profiles","10 users","100,000 DM contacts","3,500 AI credits per month","white-label setup and sentiment analysis"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["unlimited profiles and users","unlimited AI credits","SSO","dedicated account manager"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '10056aba-b816-4765-8bc7-9b81336ea50d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$overview$q$, $q$What Is Vista Social$q$, 2, ARRAY[$q$Vista Social is a social media management platform that brings publishing, analytics, engagement, listening, and review management into a single AI-assisted workspace. It was founded in 2020 by Vitaly Veksler, who previously built an earlier social media tool called Social Report, and Reggie Azevedo, and the company is based in New York City.$q$, $q$The platform is built for agencies, marketing teams, and enterprises that manage many social accounts at once. It supports the major networks including Facebook, Instagram, LinkedIn, TikTok, X, YouTube, Reddit, Snapchat, and Threads, and has been highlighted in case studies from companies such as ClickUp.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Vista Social covers the core social media workflow: content scheduling and publishing, a unified inbox for engagement and comment management, DM automation, social listening and monitoring, and review management for platforms like Google Business Profile.$q$, $q$It also includes an AI Assistant for generating and refining captions, sentiment analysis on higher tiers, an employee advocacy module for amplifying company content through staff accounts, and Vista Page, a built-in link-in-bio landing page tool.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('10056aba-b816-4765-8bc7-9b81336ea50d', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Vista Social uses tiered subscription pricing with no permanent free plan. Professional starts at 79 dollars per month for 15 profiles and 3 users; Advanced is 149 dollars per month for 30 profiles and 6 users; Scale is 349 dollars per month for 70 profiles and 10 users; and Enterprise offers custom pricing with unlimited profiles, users, and AI credits.$q$, $q$Annual billing saves roughly 20 percent across all published tiers. Add-ons such as employee advocacy seats and advanced listening are priced separately.$q$]::text[], 2);


-- ── VistaCreate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$VistaCreate is a free, browser-based graphic design tool with templates, AI image generation, and video editing, formerly known as Crello.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Kyiv, Ukraine$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$VistaCreate Review: Free Design Tool, Formerly Crello$q$, seo_title),
  seo_meta_description = COALESCE($q$VistaCreate (formerly Crello) is a free online graphic design platform with templates and AI tools. See features, pricing, and how it compares to Canva.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$VistaCreate is a free, browser-based graphic design platform that launched in 2016 as Crello, created by Dmitry Sergeev as a sister product to his stock photography marketplace Depositphotos, with its main engineering and design team based in Kyiv, Ukraine. Crello grew to more than one million registered users by 2019 and added mobile apps, a free template library, a music library, and a background remover before being acquired, along with Depositphotos, by Vistaprint (part of Cimpress plc) for a combined 85 million dollars in October 2021. After the acquisition, Crello was rebranded VistaCreate and folded into the broader Vista family of small-business tools alongside Vistaprint and 99designs; by 2022 it reported more than 10 million users across 192 countries. VistaCreate offers a free Starter tier with over 100,000 templates, roughly 1 million assets, and 10GB of storage, and a paid Pro tier priced around 10 dollars per month that unlocks the full 200,000-plus template library, over 170 million photos, videos, and vectors, generative AI tools, unlimited cloud storage, and a Brand Kit for storing logos, colors, and fonts. Additional features include a background remover, sticker maker, one-click resizing for different social formats, built-in social media scheduling, team collaboration for up to 10 members, and direct integration with Vistaprint for ordering printed materials. As a Canva-like tool, VistaCreate competes most directly with Canva, Adobe Express, and Crello's own former identity, differentiating itself through tighter integration with the Vista print-on-demand ecosystem and a historically generous free tier.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '51700cc4-8231-4396-a091-85f93678ab53';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '51700cc4-8231-4396-a091-85f93678ab53' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Template library$q$, $q$Over 200,000 professionally designed templates spanning social posts, presentations, print, and video.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Stock media$q$, $q$Access to more than 170 million photos, videos, and vector graphics on the Pro plan.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$AI image generation$q$, $q$Generate original images from text prompts directly inside the editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$AI text tools$q$, $q$Write and refine on-design copy using built-in AI writing assistance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Background remover$q$, $q$Automatically strip backgrounds from photos with one click.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Brand Kit$q$, $q$Store brand colors, fonts, and logos for consistent reuse across designs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$One-click resize$q$, $q$Instantly resize a finished design for different social platforms and formats.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Social media scheduling$q$, $q$Schedule and publish designs directly to connected social accounts from within VistaCreate.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Generous free tier with a large usable template and asset library$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Low-cost Pro plan compared to some competitors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$AI image generation and editing tools included$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Direct integration with Vistaprint for ordering physical prints$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Simple, beginner-friendly drag-and-drop editor$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Smaller brand recognition than Canva despite similar functionality$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Some advanced brand and team features lag behind larger design platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Free tier limits access to the full asset and template library$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Video editing tools are less advanced than dedicated video editors$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Ownership changes since the Crello-to-VistaCreate transition have led to some confusion among long-time users$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Is VistaCreate free to use$q$, $q$Yes, VistaCreate has a free Starter plan with a large template and asset library; a paid Pro plan around 10 dollars per month unlocks the full library and AI tools.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Is VistaCreate the same as Crello$q$, $q$Yes, VistaCreate was rebranded from Crello after Vistaprint acquired Crello and Depositphotos in October 2021.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Who owns VistaCreate$q$, $q$VistaCreate is owned by Vista, part of Cimpress plc, the same parent company behind Vistaprint and 99designs.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Does VistaCreate have AI features$q$, $q$Yes, it includes AI image generation, AI text writing and refinement, and AI-assisted object removal.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$How is VistaCreate different from VistaPrint$q$, $q$VistaCreate is the design tool for creating graphics and videos, while Vistaprint is the printing and physical products service; the two are integrated so designs can be ordered as prints.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Can teams collaborate in VistaCreate$q$, $q$Yes, VistaCreate supports team collaboration for up to 10 members on eligible plans.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Does VistaCreate support video editing$q$, $q$Yes, it includes basic video editing and animation tools alongside its graphic design features.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$How many users does VistaCreate have$q$, $q$VistaCreate has reported more than 10 million users across 192 countries.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Social media graphics$q$, $q$Small businesses and creators use templates to quickly produce on-brand social media posts and stories.$q$, $q$Small business owners and social media managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Print-to-digital workflow$q$, $q$Users design flyers, business cards, or posters in VistaCreate and order physical prints through the connected Vistaprint service.$q$, $q$Local businesses needing both digital and print marketing$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Quick marketing videos$q$, $q$Marketers create short promotional or social video clips using built-in video templates and animation tools.$q$, $q$Marketing teams and freelancers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Starter (Free)$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["100,000+ templates","1 million+ assets","10GB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$Pro$q$, $q$$10/month$q$, $q$monthly (introductory rate; standard around $13/month)$q$, NULL, $q$["200,000+ templates","170 million+ photos, videos and vectors","generative AI tools","unlimited storage"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '51700cc4-8231-4396-a091-85f93678ab53';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$overview$q$, $q$What Is VistaCreate$q$, 2, ARRAY[$q$VistaCreate is a free, browser-based graphic design tool for creating social media graphics, presentations, videos, and print materials using templates rather than starting from a blank canvas. It launched in 2016 under the name Crello, built by Depositphotos founder Dmitry Sergeev with an engineering and design team based mainly in Kyiv, Ukraine.$q$, $q$In October 2021, Vistaprint (part of Cimpress plc) acquired Crello and its parent company Depositphotos for a combined 85 million dollars. Crello was subsequently rebranded VistaCreate and became part of the Vista family of small-business services alongside Vistaprint and 99designs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$VistaCreate provides a large library of professionally designed templates, stock photos, videos, and vector graphics, plus a drag-and-drop editor for customizing them. It includes AI tools for image generation, text writing and refinement, and object removal, along with a background remover and sticker maker.$q$, $q$The platform supports team collaboration for up to 10 members, one-click resizing to adapt a design across multiple platforms and formats, a Brand Kit for consistent logos and colors, built-in social media scheduling, and a direct path to order printed products through the Vistaprint network.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('51700cc4-8231-4396-a091-85f93678ab53', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$VistaCreate offers a free Starter plan with access to over 100,000 templates, about 1 million assets, and 10GB of storage. The paid Pro plan costs around 10 dollars per month and unlocks the complete template library of over 200,000 designs, more than 170 million photos, videos, and vectors, generative AI features, and unlimited storage.$q$, $q$Because VistaCreate is bundled into the wider Vista ecosystem, some Pro features may also be accessible through other Vista or Vistaprint subscriptions.$q$]::text[], 2);


-- ── Visual Studio Code ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Visual Studio Code is Microsoft's free, open-source source code editor with built-in debugging, Git integration, and a vast extension marketplace.$q$, short_description),
  pricing_model = COALESCE($q$free$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$Large (part of Microsoft, 200,000+ employees)$q$, company_size),
  headquarters = COALESCE($q$Redmond, Washington, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Chinese$q$, $q$Japanese$q$, $q$Korean$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Russian$q$, $q$Portuguese$q$, $q$Italian$q$]::text[],
  seo_title = COALESCE($q$Visual Studio Code: Free Code Editor Guide and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Visual Studio Code (VS Code) is Microsoft's free, open-source code editor. Explore its features, extension marketplace, and how it compares to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Visual Studio Code, commonly called VS Code, is a free source code editor created by Microsoft and first announced at the Build conference on April 29, 2015. The underlying project, Code - OSS, was open-sourced under the MIT license on GitHub in November 2015, while the distributed VS Code build itself ships under a proprietary Microsoft license that adds telemetry and a curated extension marketplace on top of the open-source core. Built on the Electron framework using TypeScript, VS Code combines a lightweight text editor with integrated debugging, built-in Git and source control support, IntelliSense code completion, integrated terminals, and Language Server Protocol support for dozens of programming languages. Its defining feature is the Visual Studio Marketplace, an extension ecosystem with tens of thousands of extensions covering languages, themes, linters, remote development, and AI coding assistants such as GitHub Copilot. VS Code is completely free for individuals and organizations, with no paid tiers for the editor itself, though it integrates with paid Microsoft services like GitHub Copilot and Visual Studio subscriptions. Since its 2015 launch, VS Code has become the most widely used code editor among professional developers according to annual Stack Overflow developer surveys, available on Windows, macOS, and Linux, with variants including VS Code for the Web and the fully open-source Code - OSS build favored by Linux distributions and privacy-focused forks. It competes with editors and IDEs such as JetBrains' IntelliJ-based tools, Sublime Text, Vim and Neovim, and forks built on its own open-source base like Cursor and VSCodium, which strip Microsoft's proprietary telemetry and branding while retaining compatibility with most extensions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a0d08d8f-1e51-4d00-986a-4e669f665333' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$IntelliSense$q$, $q$Smart code completion based on variable types, function definitions, and imported modules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Integrated debugging$q$, $q$Set breakpoints, inspect variables, and step through code directly inside the editor for many languages and runtimes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Built-in Git support$q$, $q$Stage, commit, branch, and review diffs without leaving the editor.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Extension marketplace$q$, $q$Tens of thousands of extensions for languages, themes, linters, and productivity tools via the Visual Studio Marketplace.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Integrated terminal$q$, $q$Run shell commands in a terminal panel without switching applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Remote development$q$, $q$Edit code running in containers, WSL, or remote SSH machines as if it were local, via the Remote Development extension pack.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Language Server Protocol support$q$, $q$Rich, consistent language features such as autocomplete and go-to-definition across many programming languages.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$GitHub Copilot integration$q$, $q$Optional AI-powered code suggestions and chat directly inside the editor.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Completely free with no feature paywall for the core editor$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Enormous extension ecosystem covering nearly every language and workflow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Frequent monthly updates and active Microsoft-backed development$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Cross-platform support for Windows, macOS, and Linux$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Strong remote and container-based development support$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Can become resource-heavy with many extensions installed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Distributed VS Code build includes proprietary Microsoft telemetry and marketplace terms not present in the pure open-source Code - OSS build$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Less full-featured out of the box than dedicated IDEs like JetBrains products for some languages$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Extension quality and maintenance varies widely since the marketplace is largely community-driven$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Some enterprise-grade refactoring tools require paid extensions or a separate IDE$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Is Visual Studio Code free$q$, $q$Yes, Visual Studio Code is free to download and use for individuals and businesses, with no paid tiers for the editor itself.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$When was Visual Studio Code released$q$, $q$It was first announced on April 29, 2015, with the underlying Code - OSS project open-sourced under the MIT license later that year.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Is Visual Studio Code open source$q$, $q$The core Code - OSS project is open source under the MIT license, but the official Microsoft-distributed VS Code build adds proprietary telemetry and marketplace terms, making it not fully open source in its shipped form.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$What is the difference between Visual Studio Code and Visual Studio$q$, $q$Visual Studio Code is a lightweight, free, cross-platform code editor, while Visual Studio is Microsoft's larger, Windows-centric full IDE aimed mainly at .NET and C++ development.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Does Visual Studio Code support extensions$q$, $q$Yes, it has a large extension marketplace offering themes, language support, linters, debuggers, and AI tools like GitHub Copilot.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Can Visual Studio Code be used for remote development$q$, $q$Yes, its Remote Development extension pack allows editing code inside containers, WSL, or remote SSH servers as if working locally.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$What languages does VS Code support$q$, $q$It supports dozens of programming languages out of the box or via extensions, including JavaScript, TypeScript, Python, Go, Java, C++, and Rust.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$What platforms does VS Code run on$q$, $q$VS Code runs on Windows, macOS, and Linux, and also has a browser-based version called VS Code for the Web.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$General web and application development$q$, $q$Developers use VS Code as their primary editor for JavaScript, TypeScript, Python, and other languages, aided by IntelliSense and extensions.$q$, $q$Software developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Remote and containerized development$q$, $q$Teams edit code running inside Docker containers or remote servers directly from VS Code using its Remote Development tooling.$q$, $q$DevOps engineers and backend teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Teaching and learning to code$q$, $q$Educators and students use VS Code's free, approachable interface and debugging tools to teach programming fundamentals.$q$, $q$Students and coding bootcamps$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$Visual Studio Code$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["full editor functionality","extension marketplace access","integrated debugging and Git support","cross-platform availability"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'a0d08d8f-1e51-4d00-986a-4e669f665333';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$overview$q$, $q$What Is Visual Studio Code$q$, 2, ARRAY[$q$Visual Studio Code is a free, cross-platform source code editor developed by Microsoft. It was first announced on April 29, 2015 at Microsoft's Build conference, and the underlying open-source project, Code - OSS, was released under the MIT license on GitHub later that year.$q$, $q$Built with Electron and TypeScript, VS Code runs on Windows, macOS, and Linux and has become one of the most widely used development tools among professional programmers, repeatedly topping the Stack Overflow Developer Survey's most-used development environment rankings.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$VS Code provides IntelliSense code completion, an integrated debugger, built-in Git and source control tooling, an integrated terminal, and support for the Language Server Protocol, which enables rich language features for dozens of programming languages.$q$, $q$Its extension marketplace, the Visual Studio Marketplace, lets developers add themes, linters, formatters, remote development tools such as Dev Containers and Remote-SSH, and AI coding assistants including GitHub Copilot, all without leaving the editor.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Visual Studio Code itself is completely free to download and use, for both individuals and commercial organizations, with no paid tiers for the core editor.$q$, $q$Optional paid add-ons come from connected Microsoft services rather than the editor itself, such as a GitHub Copilot subscription for AI code completion or Visual Studio subscriptions for enterprise developer tooling.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0d08d8f-1e51-4d00-986a-4e669f665333', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Vitally ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vitally is an AI-powered customer success platform that unifies customer data, health scores, playbooks, and reporting to help CS teams manage accounts at scale.$q$, short_description),
  pricing_model = COALESCE($q$custom$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE($q$100-150 employees$q$, company_size),
  headquarters = COALESCE($q$Brooklyn, New York, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vitally Review: Customer Success Platform Features and Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Vitally is an AI-powered customer success platform with health scores, playbooks, and reporting. See features, pricing tiers, and alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vitally is a customer success platform founded in 2017 and headquartered in Brooklyn, New York, that started through the Techstars NYC accelerator before raising a 9 million dollar Series A led by Andreessen Horowitz in 2021 and a 30 million dollar Series B led by Next47 in 2023, with participation from HubSpot Ventures and NewView Capital, bringing total funding to roughly 40 million dollars. The company employs somewhere between about 100 and 150 people across North America, Europe, and South America as of 2026. Vitally consolidates customer data, dynamic health scores, playbooks and automation, project management, collaborative docs, and reporting dashboards into one workspace so customer success managers can track account health and drive retention and expansion outcomes for B2B SaaS companies. Its newer Vitally AI layer provides instant account summaries, agentic task actions, and meeting transcription and analysis. Vitally uses custom, quote-based pricing organized into three tiers named Tech-Touch, Hybrid-Touch, and High-Touch, aimed respectively at scaled one-to-many programs, blended coverage models, and fully one-to-one account management with unlimited full seats; pricing is based primarily on the number of end-customer accounts tracked in the platform rather than the number of internal users, with reported real-world deals commonly ranging from a few hundred to a few thousand dollars per month depending on account volume. All tiers share core features including unlimited automations, unlimited observer seats, single sign-on, and the full integration library. Vitally competes with other customer success platforms such as Gainsight, ChurnZero, Catalyst, and Totango, and is frequently recognized as a G2 momentum leader in the customer success category, differentiating itself with a flexible, developer-friendly data model and support for varied touch models within one product.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '354544ee-5844-47e0-abfb-03b3c7ee9886';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '354544ee-5844-47e0-abfb-03b3c7ee9886' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Dynamic health scores$q$, $q$Automatically calculate customer health based on usage, lifecycle stage, or custom segment rules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Automated playbooks$q$, $q$Trigger CSM assignment, task creation, and outreach workflows based on customer events.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Vitally AI$q$, $q$Generate instant account summaries, meeting transcripts, and agentic follow-up actions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Project and milestone tracking$q$, $q$Guide customers through onboarding and success plans with agile-style project management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Reporting dashboards$q$, $q$Track retention, expansion, and team performance KPIs across the customer base.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Collaborative docs and surveys$q$, $q$Build shared success plans and gather customer feedback without leaving the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Full integration library$q$, $q$Sync data from CRM, support, product analytics, and billing tools included on every plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Single sign-on$q$, $q$Enterprise-grade SSO included across all pricing tiers.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Flexible enough to support tech-touch, hybrid, and high-touch customer success models in one product$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Unlimited automations and observer seats included on every plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Backed by well-known investors, suggesting continued product investment$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$AI features for summarization and meeting analysis reduce manual admin work$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Strong reviewer ratings, including G2 Leader recognition in customer success$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$No public pricing makes it hard to budget without a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Pricing based on tracked accounts can get expensive for companies with a large customer base$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Smaller ecosystem and market share than category leader Gainsight$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Employee count estimates vary widely across data providers, making company scale hard to pin down$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Best suited to B2B SaaS companies, with less fit for non-subscription businesses$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$What is Vitally used for$q$, $q$Vitally is used by customer success teams to track account health, automate workflows, and manage retention and expansion for B2B SaaS customers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$How much does Vitally cost$q$, $q$Vitally does not publish list prices; it uses custom quote-based pricing across three tiers, Tech-Touch, Hybrid-Touch, and High-Touch, based mainly on the number of customer accounts tracked.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Who founded Vitally$q$, $q$Vitally was founded in 2017 and is based in Brooklyn, New York; it started through the Techstars NYC accelerator.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Does Vitally have AI features$q$, $q$Yes, Vitally AI provides instant summaries, meeting transcription and analysis, and agentic follow-up actions.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$How much funding has Vitally raised$q$, $q$Vitally has raised roughly 40 million dollars, including a 9 million dollar Series A in 2021 and a 30 million dollar Series B in 2023.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$What are Vitally's main competitors$q$, $q$Vitally competes with customer success platforms such as Gainsight, ChurnZero, Catalyst, and Totango.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Does Vitally support health scoring$q$, $q$Yes, dynamic health scores based on lifecycle stage or customer segment are a core part of the platform.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Is Vitally suited for enterprise customer success teams$q$, $q$Yes, its High-Touch plan is built for one-to-one account management with unlimited full seats and enterprise features like SSO.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Scaling tech-touch onboarding$q$, $q$PLG companies automate onboarding and check-ins for a large volume of self-serve customers using playbooks and health scores.$q$, $q$Product-led growth SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Enterprise account management$q$, $q$High-touch CS teams manage a smaller portfolio of large accounts with dedicated success plans and milestone tracking.$q$, $q$Enterprise customer success managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Cross-functional customer visibility$q$, $q$CS, sales, and support teams share a unified view of account health and history to coordinate renewals and expansion.$q$, $q$Revenue and customer experience teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Tech-Touch$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["scaled one-to-many CS","unlimited automations","unlimited observer seats","SSO"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$Hybrid-Touch$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["blended touch model support","full integration library","unlimited docs","SSO"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$High-Touch$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["one-to-one CS","unlimited full seats","unlimited automations","SSO"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '354544ee-5844-47e0-abfb-03b3c7ee9886';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$overview$q$, $q$What Is Vitally$q$, 2, ARRAY[$q$Vitally is a customer success platform that centralizes customer data, health scoring, workflows, and reporting for B2B SaaS companies. It was founded in 2017 in Brooklyn, New York, starting through the Techstars NYC accelerator before raising venture funding from investors including Andreessen Horowitz, HubSpot Ventures, and Next47.$q$, $q$The platform is designed to work across different customer success models, from tech-touch, largely automated programs serving many small accounts to high-touch, one-to-one management of a smaller number of large enterprise accounts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Vitally provides dynamic customer health scores based on lifecycle stage or segment, automated playbooks for tasks like CSM assignment, agile project plans for guiding customers through onboarding and milestones, and collaborative docs and surveys for gathering feedback.$q$, $q$Its Vitally AI layer adds instant account and meeting summaries, agentic actions that can execute follow-up tasks automatically, and reporting dashboards that track KPIs and team performance across the customer base.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('354544ee-5844-47e0-abfb-03b3c7ee9886', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Vitally does not publish list pricing; it offers three named plans, Tech-Touch, Hybrid-Touch, and High-Touch, each requiring a custom quote based primarily on the number of end-customer accounts tracked rather than the number of internal seats.$q$, $q$Reported real-world contract sizes vary widely, commonly ranging from a few hundred to a few thousand dollars per month depending on account volume and contract length, with all plans including unlimited automations, unlimited observer seats, and single sign-on.$q$]::text[], 2);


-- ── VitePress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$VitePress is a free, open-source static site generator built on Vite and Vue for turning Markdown into fast documentation websites.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$VitePress Guide: Free Vue and Vite Documentation Generator$q$, seo_title),
  seo_meta_description = COALESCE($q$VitePress is a free, open-source static site generator built on Vite and Vue for building fast documentation sites from Markdown.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$VitePress is a free and open-source static site generator created by Evan You, the author of the Vue.js framework, as the spiritual successor to his earlier project VuePress. Where VuePress was built on Webpack, VitePress is built on top of Vite, the build tool Evan You created afterward, giving it much faster server start times and hot module updates. VitePress reached its 1.0 release in March 2024 and is maintained by the core Vue.js team as an official Vue ecosystem project, distributed as an open-source npm package under the MIT license with no paid tiers, hosted on GitHub under the vuejs organization. It takes Markdown content, applies a customizable theme, and generates static HTML for fast initial page loads, while behaving like a single-page application for near-instant client-side navigation between pages after the first load. Authors can embed live Vue components and custom syntax directly inside Markdown files, and can build fully custom themes when the built-in default theme is not sufficient. VitePress is widely used to build documentation sites for open-source JavaScript and TypeScript projects, including Vite's own documentation and many libraries in the Vue ecosystem, because it requires minimal configuration to go from a folder of Markdown files to a polished, searchable documentation site. As a free, self-hosted tool rather than a commercial product, it has no company, funding, or headquarters behind it; it is community-governed similarly to Vue itself. It is most often compared to other documentation-focused static site generators such as Docusaurus, VuePress, Nextra, and Astro's Starlight, competing primarily on build speed, simplicity of setup, and tight integration with the Vue and Vite toolchains.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3fb0f468-f238-4fb1-a656-36ced87d1401';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3fb0f468-f238-4fb1-a656-36ced87d1401' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Markdown-to-site generation$q$, $q$Turn a folder of Markdown files into a themed, navigable documentation website.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Vite-powered dev server$q$, $q$Instant startup and lightning-fast hot module replacement while writing documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Vue component support$q$, $q$Embed live Vue components and interactivity directly inside Markdown pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Default theme$q$, $q$A polished, configurable default documentation theme with navigation, sidebar, and search out of the box.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Custom theming$q$, $q$Build fully custom Vue-based themes when the default theme isn't sufficient.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Static HTML output$q$, $q$Generates static HTML for fast first loads and strong SEO performance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Client-side routing$q$, $q$Behaves as a single-page app after the first load for instant page-to-page navigation.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Built-in local search$q$, $q$Optional integrated full-text search for documentation content.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Completely free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Extremely fast development experience thanks to Vite$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Minimal configuration needed to launch a documentation site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Native support for embedding Vue components in Markdown$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Actively maintained by the official Vue.js team$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Best suited to Vue-familiar teams; less natural fit for React-first organizations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Smaller plugin ecosystem than more established generators like Docusaurus$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$No built-in hosting, so users must set up their own deployment$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Primarily documentation-focused rather than general-purpose blogging or marketing sites$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Community support relies on GitHub and Discord rather than dedicated commercial support$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Is VitePress free$q$, $q$Yes, VitePress is completely free and open source under the MIT license with no paid tiers.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Who created VitePress$q$, $q$VitePress was created by Evan You, the creator of Vue.js, and is maintained by the Vue.js core team.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$What is the difference between VitePress and VuePress$q$, $q$VitePress is the newer, Vite-powered successor to VuePress, which was built on Webpack; VitePress focuses on speed and simplicity while VuePress continues to be maintained separately by its own community team.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Does VitePress require knowing Vue$q$, $q$Basic documentation sites can be built with just Markdown, but custom themes and embedded interactive components use Vue syntax.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Can VitePress be used for a blog$q$, $q$It can be adapted for blogs, but it is primarily designed and optimized for documentation-style content.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Where can VitePress sites be hosted$q$, $q$Generated static sites can be hosted anywhere static files are served, including Netlify, Vercel, GitHub Pages, and Cloudflare Pages.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$When did VitePress reach version 1.0$q$, $q$VitePress reached its 1.0 release in March 2024.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Does VitePress support search$q$, $q$Yes, it offers optional built-in local search as well as integration with third-party search providers like Algolia.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Open-source project documentation$q$, $q$Maintainers build fast, searchable documentation sites for JavaScript and TypeScript libraries directly from Markdown source files.$q$, $q$Open-source library maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Internal engineering docs$q$, $q$Engineering teams stand up internal knowledge bases and API references with minimal setup overhead.$q$, $q$Software engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Product and API reference sites$q$, $q$Companies publish developer-facing API documentation with custom theming that matches their brand.$q$, $q$Developer relations and API teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$Open Source$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["full static site generator","Vue component support","default and custom theming","MIT license, self-hosted"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '3fb0f468-f238-4fb1-a656-36ced87d1401';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$overview$q$, $q$What Is VitePress$q$, 2, ARRAY[$q$VitePress is a free, open-source static site generator for building documentation websites from Markdown content. It was created by Evan You, the creator of Vue.js, as a faster successor to his earlier project VuePress, rebuilding the same idea on top of Vite instead of Webpack.$q$, $q$VitePress reached its 1.0 release in March 2024 and is maintained by the core Vue.js team, distributed as an open-source npm package under the MIT license with no commercial offering.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$VitePress offers instant dev server start and near-instant hot module reloading thanks to Vite, along with support for embedding live Vue components directly inside Markdown pages, extended Markdown syntax such as custom containers and code group tabs, and a fully customizable theming system.$q$, $q$Generated sites serve static HTML on first load for fast performance and search engine indexing, then behave as a single-page application for instant client-side navigation on subsequent page views, giving a balance between raw performance and app-like interactivity.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$VitePress is completely free and open source under the MIT license. There are no paid tiers, subscriptions, or hosted offerings from the project itself; users self-host the generated static site on any static hosting provider such as Netlify, Vercel, or GitHub Pages.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fb0f468-f238-4fb1-a656-36ced87d1401', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Vizard ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Vizard is an AI video editing platform that automatically turns long-form videos into short, social-ready clips with captions and reframing.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Palo Alto, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Vizard AI Review: Turn Long Videos Into Short Clips$q$, seo_title),
  seo_meta_description = COALESCE($q$Vizard is an AI tool that turns long videos into short social clips with captions and auto-reframing. See features, pricing, and free plan details.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Vizard is an AI-powered video repurposing platform founded in 2021 by Gary Zhang along with co-founders Chunwei Song and Qiumiao Chen, incorporated as Vizard Corp in Delaware and headquartered in Palo Alto, California. The public product launched on Product Hunt in August 2023 and has since reported over 10 million creators and businesses using the platform, with customer logos including Google, Ubisoft, and Stanford University referenced on its marketing pages. Vizard's core function is analyzing long-form video, such as podcasts, webinars, and livestreams, and using AI to automatically identify the most engaging moments, cut them into short vertical clips, add captions and emojis, generate social captions and hashtags, and reformat the output for platforms like TikTok, Instagram Reels, and YouTube Shorts. Additional capabilities include text-based editing that lets users trim video by editing a transcript, AI B-roll insertion, caption translation into more than 100 languages, brand template customization, and team workspace collaboration. Vizard uses a freemium, credit-based pricing model: a free plan offers a limited number of monthly credits with capped upload and export limits, while paid Creator and Business plans, reported at roughly 29 dollars and 39 dollars per month respectively on monthly billing (with substantial discounts for annual commitments), raise credit allowances, remove watermarks, unlock 4K exports, and add team collaboration and more connected social accounts. The company has earned strong user ratings, including 4.7 stars on G2 and around 4.9 stars on Capterra and GetApp, and was named to G2's Best Software lists in 2025 and 2026. Vizard competes with other AI clipping tools such as Opus Clip, Descript, and Kapwing, differentiating itself with its scale of user base and breadth of AI-driven repurposing features bundled into a single workflow.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$AI clip detection$q$, $q$Automatically identifies the most engaging moments in long-form video for repurposing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Auto captions and emojis$q$, $q$Generates styled captions with emoji overlays for short-form clips.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$AI B-roll$q$, $q$Automatically suggests and inserts supplementary footage into clips.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Text-based editing$q$, $q$Trim and edit video by editing its transcript like a text document.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Auto reframing$q$, $q$Reformats footage into vertical, square, or horizontal ratios for different platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Caption translation$q$, $q$Translates captions into more than 100 languages for international audiences.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Brand templates$q$, $q$Apply consistent branded caption styles and layouts across all clips.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Team workspace$q$, $q$Invite team members to collaborate on projects and share previews.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Free plan available with no sign-up required to try basic clipping$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Large, well-established user base with strong review ratings$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Broad AI feature set covering clipping, captions, translation, and B-roll in one tool$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Text-based editing makes trimming footage fast for non-editors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Supports direct scheduling and publishing to multiple social accounts on paid plans$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Credit-based pricing can be confusing to estimate costs in advance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Free plan has tight limits on upload length, export quality, and storage duration$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$AI-selected clips sometimes require manual review and adjustment$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Advanced team and brand features are reserved for paid Business tier$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Reported pricing varies across sources, making it worth confirming current rates before purchase$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$What does Vizard do$q$, $q$Vizard uses AI to turn long-form videos into short clips optimized for platforms like TikTok, Instagram Reels, and YouTube Shorts, complete with captions and reframing.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Is Vizard free to use$q$, $q$Vizard offers a free plan with limited monthly AI credits and capped upload and export limits; paid Creator and Business plans remove most limits.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Who founded Vizard$q$, $q$Vizard was founded in 2021 by Gary Zhang along with co-founders Chunwei Song and Qiumiao Chen, and is based in Palo Alto, California.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Does Vizard support multiple languages$q$, $q$Yes, it can translate generated captions into more than 100 languages.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Can Vizard publish directly to social media$q$, $q$Yes, paid plans allow scheduling and publishing clips directly to connected social accounts.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$How does Vizard identify the best clips$q$, $q$It uses AI trained to detect engaging moments in long-form video based on speech, pacing, and content patterns.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Does Vizard remove watermarks$q$, $q$Watermarks are removed on paid Creator and Business plans; the free plan may include a watermark on exports.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$What formats can Vizard export to$q$, $q$It supports vertical, square, and horizontal formats with resolutions up to 4K on paid plans.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Podcast repurposing$q$, $q$Podcasters convert full-length episodes into short, captioned highlight clips for social distribution.$q$, $q$Podcasters and audio-to-video creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Webinar and event highlights$q$, $q$Marketing teams extract key moments from webinars and livestreams to promote on social channels.$q$, $q$Marketing and events teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Creator content repurposing$q$, $q$YouTubers and streamers turn long videos into a batch of short clips to grow audiences on TikTok and Instagram.$q$, $q$Content creators and influencers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["60 credits per month","60 minutes upload, 1080p","720p export up to 10 minutes","3-day storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Creator$q$, $q$~$29/month$q$, $q$monthly (discounted annual option available)$q$, NULL, $q$["unlimited upload minutes","4K exports, no watermark","6 social accounts","auto subtitling and translation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$Business$q$, $q$~$39/month$q$, $q$monthly (discounted annual option available)$q$, NULL, $q$["20 social accounts","team collaboration","unlimited storage","advanced AI capabilities"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$overview$q$, $q$What Is Vizard$q$, 2, ARRAY[$q$Vizard is an AI video editing platform that automatically turns long-form videos, such as podcasts, webinars, and livestreams, into short, social-media-ready clips. It was founded in 2021 by Gary Zhang with co-founders Chunwei Song and Qiumiao Chen, and is headquartered in Palo Alto, California.$q$, $q$The public product launched on Product Hunt in August 2023 and has grown to report over 10 million creators and businesses as users, with case studies referencing customers including Google, Ubisoft, and Stanford University.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Vizard's AI engine scans long videos to identify the most engaging segments and automatically cuts them into short, vertically formatted clips. It adds auto-generated captions with emoji overlays, AI-suggested B-roll, and social captions and hashtags tailored to each platform.$q$, $q$Other tools include text-based editing that lets users cut footage by editing a transcript rather than a timeline, one-click reformatting for different aspect ratios, caption translation into over 100 languages, customizable brand templates, and team workspace features for collaborative review and publishing.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3f2f1bd0-8d5c-4879-ab02-b3bb6c09dc10', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Vizard offers a free plan with a limited monthly credit allowance and capped upload length, export resolution, and storage duration. Paid plans are credit-based: the Creator plan is reported at roughly 29 dollars per month and the Business plan at roughly 39 dollars per month on monthly billing, with substantial discounts available for annual subscriptions.$q$, $q$Higher tiers raise monthly AI credits, unlock 4K exports without watermarks, increase connected social accounts, and add team collaboration and shared workspaces.$q$]::text[], 2);


-- ── vLLM ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$vLLM is an open-source, high-throughput inference and serving engine for large language models, built around the PagedAttention memory management technique.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$vLLM: Open-Source LLM Inference Engine Guide$q$, seo_title),
  seo_meta_description = COALESCE($q$vLLM is a free, open-source high-throughput inference engine for large language models built on PagedAttention. See features, use cases, and how it works.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$vLLM is an open-source library for high-throughput, memory-efficient inference and serving of large language models, originally created by Woosuk Kwon while a PhD student at UC Berkeley's Sky Computing Lab, alongside co-founders including Simon Mo, Kaichao You, and Roger Wang, with UC Berkeley professors Joseph Gonzalez and Ion Stoica serving as academic advisors. The project was introduced publicly in 2023 through a research paper and blog post describing PagedAttention, an algorithm inspired by virtual memory paging in operating systems that manages the key-value cache used during LLM inference in non-contiguous blocks, dramatically reducing memory waste. According to the vLLM team, this approach delivered up to 24 times higher throughput than the standard Hugging Face Transformers library without requiring any changes to model architecture. vLLM has since grown into one of the most active open-source AI infrastructure projects, now part of the PyTorch Foundation, with contributions from thousands of developers and financial and engineering support from major cloud and hardware companies including AWS, Google Cloud, NVIDIA, AMD, Intel, and Alibaba Cloud. The library provides an OpenAI-compatible API, support for a very wide range of open-source models, continuous batching, distributed multi-GPU and multi-node inference, and multiple quantization formats, letting teams self-host LLM inference at lower cost and higher throughput than naive serving setups. Because it is fully open source and free under a permissive license, vLLM has no company behind it, no headquarters, and no pricing plans of its own; instead it is typically deployed by engineering teams on their own infrastructure or offered as a managed backend by cloud providers. It is commonly compared to other LLM serving frameworks such as Hugging Face Text Generation Inference, NVIDIA TensorRT-LLM, and SGLang, and is widely used by companies and research labs that need to serve open-weight models like Llama, Mistral, and Qwen at scale.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$PagedAttention$q$, $q$Memory management technique that stores the KV cache in non-contiguous blocks to reduce memory waste and increase throughput.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$OpenAI-compatible API$q$, $q$Serve models behind an API that matches the OpenAI Chat Completions format for easy drop-in use.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Continuous batching$q$, $q$Dynamically batches incoming requests to maximize GPU utilization without idle time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Distributed inference$q$, $q$Supports multi-GPU and multi-node serving for very large models.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Broad model support$q$, $q$Works with a wide range of open-source LLMs including Llama, Mistral, and Qwen families.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Quantization support$q$, $q$Supports multiple quantization formats to reduce memory footprint and cost.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Streaming output$q$, $q$Supports token-by-token streaming responses for real-time applications.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Active open-source community$q$, $q$Backed by thousands of contributors and major cloud and hardware vendors under the PyTorch Foundation.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Completely free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Significantly higher throughput than naive model-serving approaches$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$OpenAI-compatible API simplifies migration from hosted APIs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Backed by major cloud and hardware vendors and a large contributor base$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Supports a very wide range of open-source model architectures$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Requires teams to manage their own GPU infrastructure and operations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$No official commercial support without going through a third-party cloud provider$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Setup and tuning can require significant systems and machine learning expertise$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Rapid development pace means frequent updates and occasional breaking changes$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Best performance depends on access to sufficiently capable GPU hardware$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$What is vLLM used for$q$, $q$vLLM is used to self-host and serve large language models with high throughput and efficient GPU memory use, typically behind an OpenAI-compatible API.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Is vLLM free$q$, $q$Yes, vLLM is completely free and open source; users only pay for the compute infrastructure they run it on.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Who created vLLM$q$, $q$vLLM was created by Woosuk Kwon during his PhD at UC Berkeley's Sky Computing Lab, along with co-founders Simon Mo, Kaichao You, and Roger Wang.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$What is PagedAttention$q$, $q$PagedAttention is the memory management algorithm at the core of vLLM that stores the key-value cache in non-contiguous blocks, similar to virtual memory paging, to reduce waste and boost throughput.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Does vLLM support an OpenAI-compatible API$q$, $q$Yes, vLLM can serve models behind an API compatible with the OpenAI Chat Completions format.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$What models does vLLM support$q$, $q$It supports a wide range of open-source LLMs, including Llama, Mistral, Qwen, and many other model families.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Who maintains vLLM today$q$, $q$vLLM is maintained by an active open-source community as part of the PyTorch Foundation, with support from companies including AWS, Google Cloud, NVIDIA, AMD, and Intel.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$How much faster is vLLM than standard serving$q$, $q$The vLLM team reports up to 24 times higher throughput compared to the standard Hugging Face Transformers library in their benchmarks.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Self-hosted LLM APIs$q$, $q$Engineering teams deploy vLLM on their own GPU infrastructure to serve open-source models behind an OpenAI-compatible API.$q$, $q$ML infrastructure and platform engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Research and academic inference$q$, $q$Research labs use vLLM to run efficient inference experiments on open-weight models without needing hosted API access.$q$, $q$AI researchers and academic labs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Cost-efficient production LLM serving$q$, $q$Companies running high-volume LLM applications use vLLM to reduce GPU cost per request compared to naive serving setups.$q$, $q$AI product teams and startups$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$Open Source$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["full inference and serving engine","OpenAI-compatible API","distributed and quantized inference support","community support via GitHub and Slack"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '1abf3a7b-a12c-4d0b-8925-d4026402d4e5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$overview$q$, $q$What Is vLLM$q$, 2, ARRAY[$q$vLLM is an open-source inference and serving engine for large language models designed for high throughput and efficient memory use. It was created by Woosuk Kwon during his PhD at UC Berkeley's Sky Computing Lab, with co-founders Simon Mo, Kaichao You, and Roger Wang, and academic advisors Joseph Gonzalez and Ion Stoica, and was introduced publicly in 2023.$q$, $q$The project centers on PagedAttention, an algorithm inspired by virtual memory paging in operating systems that manages the LLM's key-value cache in non-contiguous memory blocks, reducing waste and letting more requests be served concurrently on the same hardware.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$vLLM supports a very wide range of open-source language models with an OpenAI-compatible API, so it can often act as a drop-in replacement for hosted LLM APIs. It includes continuous batching, distributed inference across multiple GPUs and nodes, and support for several quantization formats to reduce memory and compute cost.$q$, $q$The project reports up to 24 times higher throughput than the standard Hugging Face Transformers library in benchmark comparisons, without requiring changes to model architecture, and is now part of the PyTorch Foundation with contributions from thousands of developers and backing from major cloud and hardware vendors.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$vLLM is completely free and open source. There is no vendor, license fee, or subscription; teams run it on their own infrastructure or through cloud providers that offer vLLM-based managed inference, and costs are limited to the underlying compute used to run it.$q$, $q$The project accepts donations through GitHub Sponsors and OpenCollective to support ongoing development, but this is optional and separate from using the software itself.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1abf3a7b-a12c-4d0b-8925-d4026402d4e5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Voicenotes ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Voicenotes is an AI-powered voice note-taking and meeting transcription app that captures, transcribes, and summarizes spoken thoughts and meetings.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Voicenotes Review: AI Voice Notes and Meeting Transcription$q$, seo_title),
  seo_meta_description = COALESCE($q$Voicenotes is an AI app that transcribes voice notes and meetings into summaries and action items. See features, pricing, and how it works.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Voicenotes is an AI-powered voice note-taking and meeting transcription app built by Coping Hard Inc., founded by husband-and-wife team Jijo Sunny and Aleesha Sunny, who are also the co-founders of Buy Me a Coffee, along with Jijo's brother Joseph Sunny. The company is headquartered in San Francisco and the app publicly launched in April 2024 after Voicenotes was covered by TechCrunch in May 2024 as a project from Buy Me a Coffee's founders; it has since surpassed one million downloads. Voicenotes lets users record voice memos or automatically join and transcribe meetings across platforms including Zoom, Microsoft Teams, Google Meet, Webex, and Slack, generating instant AI summaries, action items, and next steps as soon as a recording ends, with automatic language detection across more than 60 languages. Its Ask AI feature lets users query their entire library of past recordings for specific information, and content can be exported as clean PDFs, shared with a team, or piped into tools like Slack, Notion, Zapier, Obsidian, ChatGPT, and Claude. The app is available on macOS, iOS, Windows, Android, web, and Apple Watch, and Voicenotes states it is SOC 2 Type II certified and GDPR compliant with encrypted data storage. Voicenotes follows a freemium model with a free tier for getting started and a Pro plan reported at roughly 14.99 dollars per month or about 99.99 dollars per year, which unlocks unlimited transcripts and summaries, unlimited dictation, unlimited searchable history, unlimited audio imports and storage, and deeper integrations; a separate Team plan is reported at roughly 49 dollars per month. Voicenotes competes with tools such as Otter.ai, Fireflies.ai, Fathom, and Granola in the AI meeting notes and voice memo space, differentiating itself with a personal-notes-first design that grew out of a voice memo habit before expanding into meeting transcription.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Voice memo transcription$q$, $q$Automatically transcribes personal voice recordings into searchable text.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Meeting transcription$q$, $q$Joins and transcribes meetings across Zoom, Microsoft Teams, Google Meet, Webex, and Slack.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Instant AI summaries$q$, $q$Generates summaries, action items, and next steps immediately after a recording ends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Ask AI search$q$, $q$Lets users query their full library of past notes and meetings for specific information.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Multi-language detection$q$, $q$Automatically detects and transcribes speech across more than 60 languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Cross-platform apps$q$, $q$Available on macOS, iOS, Windows, Android, web, and Apple Watch.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Export and integrations$q$, $q$Exports clean PDFs and syncs with Slack, Notion, Zapier, Obsidian, ChatGPT, and Claude.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Security and compliance$q$, $q$SOC 2 Type II certified with GDPR compliance and encrypted data storage.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Combines personal voice notes and meeting transcription in one app$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Wide platform coverage including desktop, mobile, web, and watch$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Ask AI feature makes past recordings searchable by natural-language question$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Strong integration support with popular productivity and AI tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Built by an experienced founding team with a track record from Buy Me a Coffee$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Free tier is limited compared to the unlimited features on Pro$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Team plan pricing and features are less documented than the individual Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Relies on cloud processing, so an internet connection is generally needed for AI features$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Smaller, younger company than established meeting-notes competitors like Otter.ai$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Meeting bot approach may not suit teams with strict meeting-recording policies$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$What is Voicenotes used for$q$, $q$Voicenotes is used to record and transcribe voice memos and meetings, generating AI summaries, action items, and searchable notes.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Is Voicenotes free$q$, $q$Voicenotes offers a free tier to get started, with a paid Pro plan reported around 14.99 dollars per month for unlimited transcripts, dictation, and storage.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Who created Voicenotes$q$, $q$Voicenotes was created by Jijo Sunny and Aleesha Sunny, the founders of Buy Me a Coffee, along with Jijo's brother Joseph Sunny, through their company Coping Hard Inc.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Which meeting platforms does Voicenotes support$q$, $q$It supports Zoom, Microsoft Teams, Google Meet, Webex, and Slack, in addition to standalone voice memos.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Does Voicenotes support multiple languages$q$, $q$Yes, it automatically detects and transcribes speech in more than 60 languages.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Is Voicenotes secure$q$, $q$Voicenotes states it is SOC 2 Type II certified and GDPR compliant, with encrypted data storage.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$What platforms is Voicenotes available on$q$, $q$It is available on macOS, iOS, Windows, Android, the web, and Apple Watch.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Can Voicenotes integrate with other tools$q$, $q$Yes, it integrates with tools including Slack, Notion, Zapier, Obsidian, ChatGPT, and Claude.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Personal thought capture$q$, $q$Individuals record quick voice memos on the go and get them automatically transcribed and organized.$q$, $q$Professionals and individual note-takers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Automated meeting notes$q$, $q$Teams have Voicenotes join calls to transcribe discussions and generate summaries and action items automatically.$q$, $q$Sales, product, and engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Searchable knowledge capture$q$, $q$Users build a searchable archive of ideas and meetings they can query later using the Ask AI feature.$q$, $q$Founders, researchers, and knowledge workers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Free$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["basic voice note transcription","limited summaries","limited storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Pro$q$, $q$$14.99/month$q$, $q$monthly (or ~$99.99/year)$q$, NULL, $q$["unlimited transcripts and summaries","unlimited dictation","unlimited searchable history","unlimited audio imports and storage","advanced integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$Team$q$, $q$~$49/month$q$, $q$monthly$q$, NULL, $q$["shared team workspace","all Pro features","team collaboration on notes and meetings"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '7d3bbba7-c253-4909-80c5-e0f40e0575ba';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$overview$q$, $q$What Is Voicenotes$q$, 2, ARRAY[$q$Voicenotes is an AI-powered app for capturing, transcribing, and summarizing spoken voice notes and meetings. It was built by Coping Hard Inc., founded by Jijo Sunny and Aleesha Sunny, the husband-and-wife team behind Buy Me a Coffee, along with Jijo's brother Joseph Sunny, and is headquartered in San Francisco.$q$, $q$The app publicly launched in April 2024, was profiled by TechCrunch that May as a new project from Buy Me a Coffee's founders, and has since passed one million downloads across its supported platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Voicenotes automatically transcribes personal voice memos as well as meetings across Zoom, Microsoft Teams, Google Meet, Webex, and Slack, with automatic language detection across more than 60 languages and instant AI-generated summaries, action items, and next steps the moment a recording ends.$q$, $q$Its Ask AI feature allows users to search and ask questions across their entire library of past recordings, and content can be exported as PDFs, shared with teammates, or synced into tools like Slack, Notion, Zapier, Obsidian, ChatGPT, and Claude. The app is available on macOS, iOS, Windows, Android, the web, and Apple Watch.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d3bbba7-c253-4909-80c5-e0f40e0575ba', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Voicenotes offers a free tier to get started, with a Pro plan reported at roughly 14.99 dollars per month or about 99.99 dollars per year, unlocking unlimited transcripts, summaries, dictation, searchable history, and audio imports and storage.$q$, $q$A separate Team plan, reported at roughly 49 dollars per month, extends the platform for shared use across a small team.$q$]::text[], 2);



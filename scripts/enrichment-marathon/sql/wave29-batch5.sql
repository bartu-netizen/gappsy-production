-- Enrichment marathon batch: Userpilot, UserTesting, UserVoice, UserZoom, UVdesk, üWave, UXCam, v0

-- ── Userpilot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Userpilot is a code-free product growth platform that lets SaaS teams build in-app onboarding flows, tooltips, checklists, and surveys while tracking feature adoption through built-in product analytics.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$299/month$q$, starting_price),
  founded_year = COALESCE(2019, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Austin, Texas, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Userpilot Review 2026: Features, Pricing and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Userpilot is a no-code product growth platform for in-app onboarding, feature adoption, and product analytics. See pricing, features, pros and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Userpilot is a SaaS product growth platform founded in 2019 by Yazan Sehwail and Thabet Gharabeh. It lets product, marketing, and customer success teams design in-app onboarding experiences, such as tooltips, driven checklists, modals, and resource centers, without writing code. The platform also includes native product analytics (event autocapture, funnels, trends, and cohorts), in-app surveys such as NPS and CSAT, and localization support so onboarding content can be shown in multiple languages. Userpilot targets mid-market and enterprise SaaS companies looking to increase activation, feature adoption, and retention, and counts companies such as Cisco and Shutterstock among its customers. The company raised a 4.58 million dollar Series A in August 2022 led by Silicon Badia, with participation from ScOp Ventures and 500 Global, bringing total known funding to roughly 4.7 million dollars. Pricing is subscription-based across three tiers: Starter at 299 dollars per month for up to 2,000 monthly active users, Growth starting at 849 dollars per month that scales with usage and adds product analytics and A/B testing, and a custom-priced Enterprise tier with SSO and dedicated support. Userpilot competes most directly with Pendo, WalkMe, Appcues, Chameleon, and UserGuiding; it is generally positioned as a mid-market alternative to the pricier Pendo and WalkMe, while offering deeper analytics than lighter tools like UserGuiding or Userlist. There is no perpetual free plan, but Userpilot offers product demos to prospective customers. The company operates largely remote with team members across multiple continents.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$No-code in-app flow builder$q$, $q$Build tooltips, modals, driven tours, hotspots, and checklists using a visual editor without developer involvement.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Product analytics$q$, $q$Track feature usage, funnels, trends, and user paths with autocapture-based event tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$In-app surveys$q$, $q$Trigger NPS, CSAT, and custom surveys based on user behavior or lifecycle stage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$User segmentation$q$, $q$Segment users by behavior, attributes, or lifecycle stage to target onboarding content precisely.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Resource center$q$, $q$A self-serve help widget combining walkthroughs, articles, and announcements inside the product.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$A/B testing$q$, $q$Test different onboarding flows against each other to see which drives better activation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Localization$q$, $q$Serve in-app content in multiple languages based on user locale.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Integrations$q$, $q$Connect to tools like Segment, Amplitude, HubSpot, Salesforce, and Slack to sync user data.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Fast to launch flows without engineering resources$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Native analytics reduce the need for a separate usage-tracking tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Flexible user segmentation for targeted onboarding$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Regularly updated with AI-assisted content creation features$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Responsive vendor support and onboarding help$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$No perpetual free plan; entry price may be high for very early-stage startups$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Growth plan pricing scales quickly with monthly active users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Some advanced analytics and session replay require paid add-ons$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Learning curve for teams new to product-led growth tooling$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$What is Userpilot used for?$q$, $q$Teams use it to build in-app onboarding, drive feature adoption, and analyze product usage without writing code.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Does Userpilot have a free plan?$q$, $q$There is no permanent free tier; pricing starts at 299 dollars per month for the Starter plan.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Who founded Userpilot?$q$, $q$Yazan Sehwail and Thabet Gharabeh founded Userpilot in 2019.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$How does Userpilot compare to Pendo?$q$, $q$Userpilot is generally priced lower and aimed at mid-market SaaS teams, while Pendo targets larger enterprises with a broader platform.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Does Userpilot include product analytics?$q$, $q$Yes, the Growth and Enterprise plans include event autocapture, funnels, and trend analysis.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Can Userpilot run A/B tests?$q$, $q$Yes, on Growth and Enterprise plans you can test different flow variants against each other.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Is Userpilot code-free?$q$, $q$Yes, flows are built with a visual, no-code editor, though a one-time script installation is required.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Does Userpilot support multiple languages?$q$, $q$Yes, in-app content can be localized based on the user's locale.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$SaaS user onboarding$q$, $q$Guide new signups through key setup steps with checklists and tooltips to increase activation rate.$q$, $q$Product and growth teams at B2B SaaS companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Feature adoption campaigns$q$, $q$Announce and drive usage of new features through targeted in-app messages to segments of existing users.$q$, $q$Product marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$In-app customer feedback$q$, $q$Collect NPS and CSAT feedback at key moments in the user journey to inform product decisions.$q$, $q$Customer success and product teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Starter$q$, $q$$299/month$q$, $q$monthly$q$, NULL, $q$["Up to 2,000 monthly active users","In-app engagement and segmentation","NPS surveys","3 team seats","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Growth$q$, $q$From $849/month$q$, $q$monthly$q$, NULL, $q$["Everything in Starter","Advanced product analytics and event autocapture","Resource center and advanced surveys","A/B testing","15 team seats"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$Enterprise$q$, $q$Custom$q$, $q$custom contract$q$, NULL, $q$["Everything in Growth","SAML SSO and custom roles","Dedicated success manager","Data warehouse sync","Optional EU data hosting"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'b3d60135-85d7-42ac-a6e3-1d9981eb7347';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$overview$q$, $q$What Is Userpilot$q$, 2, ARRAY[$q$Userpilot is a product growth platform built for SaaS companies that want to improve user activation, feature adoption, and retention without relying on engineering resources for every onboarding change. Founded in 2019 by Yazan Sehwail and Thabet Gharabeh, the platform combines a visual, no-code flow builder with native product analytics, letting product and growth teams both design in-app experiences and measure their impact from a single tool.$q$, $q$The company raised a 4.58 million dollar Series A in 2022 led by Silicon Badia, and has grown into a widely used option in the product-led growth space, serving companies such as Cisco and Shutterstock.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Userpilot's core is a drag-and-drop editor for building tooltips, modals, driven tours, hotspots, and checklists that trigger based on user behavior or lifecycle stage. Teams can segment users by attributes or in-app actions to target the right experience to the right audience.$q$, $q$Beyond onboarding, Userpilot includes autocapture-based product analytics for tracking funnels and feature usage, in-app NPS and CSAT surveys, a self-serve resource center, A/B testing for onboarding flows, and localization so content can be served in a user's preferred language.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Userpilot uses three subscription tiers. Starter costs 299 dollars per month for up to 2,000 monthly active users with basic engagement and analytics. Growth starts at 849 dollars per month and scales with monthly active users, adding advanced analytics, event autocapture, and A/B testing.$q$, $q$Enterprise pricing is custom and adds single sign-on, custom roles, data warehouse sync, and a dedicated success manager. There is no permanent free plan, though prospective customers can request a demo.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3d60135-85d7-42ac-a6e3-1d9981eb7347', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── UserTesting ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$UserTesting is a human-insight platform that lets companies gather video-recorded feedback from real users completing tasks on websites, apps, and prototypes to inform UX and product decisions.$q$, short_description),
  pricing_model = COALESCE($q$custom$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2007, founded_year),
  company_size = COALESCE($q$1,000-2,000 employees$q$, company_size),
  headquarters = COALESCE($q$Bellevue, Washington, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$UserTesting Review 2026: Features, Pricing, History$q$, seo_title),
  seo_meta_description = COALESCE($q$UserTesting is a video-based UX research platform. Learn about its features, custom pricing, IPO and merger history, and how it compares to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$UserTesting was founded in 2007 as a usability-testing service that paid a network of everyday people to record their screen and voice while completing tasks on websites and apps, giving product and UX teams qualitative video feedback quickly. Over time the company expanded into a full human-insight platform combining unmoderated and moderated studies, prototype testing, card sorting, tree testing, and AI-assisted analysis of video and survey data, drawing on a global contributor panel. UserTesting went public on the New York Stock Exchange under the ticker USER in November 2021, raising 140 million dollars in its IPO at an implied valuation near 1.98 billion dollars. In 2022, private equity firms Thoma Bravo and Sunstone Partners acquired UserTesting for approximately 1.3 billion dollars, taking it private again. In April 2023, Thoma Bravo merged UserTesting with UserZoom, a Barcelona-founded UX research platform it had separately acquired, combining UserZoom's research methodology and QXscore benchmarking with UserTesting's contributor network and video-insight technology under the UserTesting brand; the merged company now serves more than 3,000 customers including 75 of the Fortune 100. UserTesting has also acquired TruthLab (2019) and the Norwegian company Teston (2022). Pricing is entirely custom and quote-based, structured around either test-based consumption or unlimited team-based access, with tiers called Advanced, Ultimate, and Ultimate+; there is no published starting price and prospective customers must request a quote. UserTesting competes with Maze, Lookback, UXtweak, and Optimal Workshop, and is generally positioned as the enterprise-grade option for large-scale, video-centric human insight work, distinct from feedback-voting tools like UserVoice.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0be53b91-2c15-470e-a5f9-076a0d58497b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0be53b91-2c15-470e-a5f9-076a0d58497b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Unmoderated user testing$q$, $q$Recruit contributors from a large global panel to complete tasks and record video and audio feedback.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Moderated live interviews$q$, $q$Run live video sessions with recruited participants for deeper qualitative research.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Prototype and concept testing$q$, $q$Test Figma prototypes, early concepts, and pre-launch designs with real users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Card sorting and tree testing$q$, $q$Validate information architecture and navigation structures.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$AI-assisted insight analysis$q$, $q$Automatically transcribe, tag, and highlight key moments across video responses.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Global contributor network$q$, $q$Access a vetted panel that can be filtered by demographics, device, and behavior.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$QXscore benchmarking$q$, $q$Benchmark experience quality against industry standards over time, inherited from the UserZoom merger.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Large, vetted global contributor panel with fast turnaround on studies$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Combines both moderated and unmoderated research in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$AI-assisted analysis helps synthesize findings from large volumes of video$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Enterprise-grade security, compliance, and scalability$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Strong brand recognition and adoption among Fortune 100 companies$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Pricing is opaque and generally out of reach for small teams and solo researchers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Enterprise focus means a steeper learning curve and onboarding process$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Contributor-based studies can be pricier than lightweight tools like Maze or Lookback$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Some legacy UserZoom features are still being integrated post-merger$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$When was UserTesting founded?$q$, $q$UserTesting was founded in 2007.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Is UserTesting publicly traded?$q$, $q$It went public on the NYSE in 2021 but was taken private in 2022 after being acquired by Thoma Bravo and Sunstone Partners for 1.3 billion dollars.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$What happened to UserZoom?$q$, $q$UserZoom merged with UserTesting in April 2023 and now operates as the UserZoom platform within UserTesting.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$How much does UserTesting cost?$q$, $q$Pricing is custom and quote-based; there is no published starting price.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Can I run unmoderated tests with UserTesting?$q$, $q$Yes, this is one of its core capabilities alongside moderated interviews.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Does UserTesting provide its own participants?$q$, $q$Yes, via a global contributor network, though you can also bring your own participants.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$What is QXscore?$q$, $q$A benchmarking methodology inherited from UserZoom used to score experience quality against industry norms.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Who are UserTesting's main competitors?$q$, $q$Maze, Lookback, UXtweak, and Optimal Workshop.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Pre-launch usability testing$q$, $q$Validate a new website or app flow with real users before shipping.$q$, $q$Product and UX design teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Concept and prototype validation$q$, $q$Get qualitative feedback on early-stage concepts and Figma prototypes.$q$, $q$UX researchers and product managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Ongoing experience benchmarking$q$, $q$Track experience quality scores over time across releases.$q$, $q$Enterprise CX and research operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Advanced$q$, $q$Custom$q$, $q$custom contract$q$, NULL, $q$["Test-based consumption","Core unmoderated and moderated testing","Contributor network access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Ultimate$q$, $q$Custom$q$, $q$custom contract$q$, NULL, $q$["Everything in Advanced","Expanded research methods","AI-assisted analysis"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$Ultimate+$q$, $q$Custom$q$, $q$custom contract$q$, NULL, $q$["Everything in Ultimate","Team-based unlimited testing option","Dedicated enterprise support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '0be53b91-2c15-470e-a5f9-076a0d58497b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$overview$q$, $q$What Is UserTesting$q$, 2, ARRAY[$q$UserTesting is a human-insight and UX research platform founded in 2007 that pays a network of real people to complete tasks on websites, apps, and prototypes while recording their screen, voice, and reactions on video. Product, design, and marketing teams use these recordings to understand where users struggle before or after a launch.$q$, $q$The company has had an eventful corporate history: it went public on the New York Stock Exchange in 2021, was taken private again in 2022 in a 1.3 billion dollar acquisition by Thoma Bravo and Sunstone Partners, and merged with fellow Thoma Bravo portfolio company UserZoom in 2023 to form a combined UX and human-insight research powerhouse operating under the UserTesting name.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform supports both unmoderated studies, where contributors complete tasks independently and asynchronously, and moderated live interviews for deeper qualitative research. Teams can test websites, mobile apps, and prototypes, and run card sorting or tree testing exercises to validate navigation and information architecture.$q$, $q$Since the UserZoom merger, UserTesting also includes QXscore benchmarking to track experience quality over time, along with AI-assisted transcription and highlight generation that helps teams synthesize insights from large volumes of video quickly.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0be53b91-2c15-470e-a5f9-076a0d58497b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$UserTesting does not publish fixed pricing. Plans are named Advanced, Ultimate, and Ultimate+, and customers choose between test-based consumption, where they pay based on usage, or team-based unlimited access with a defined scope.$q$, $q$Exact cost depends on team size, contributor volume, and feature requirements, and prospective customers must contact sales for a quote.$q$]::text[], 2);


-- ── UserVoice ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$UserVoice is a customer feedback management platform that lets companies collect, prioritize, and respond to product suggestions through public feedback portals, in-app widgets, and internal roadmap tools.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$999/month$q$, starting_price),
  founded_year = COALESCE(2008, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Raleigh, North Carolina, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$UserVoice Review 2026: Features, Pricing and History$q$, seo_title),
  seo_meta_description = COALESCE($q$UserVoice is a customer feedback and feature-request platform. See its pricing, features, ownership history, and how it compares to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$UserVoice was founded in February 2008 by Richard White, Lance Ivy, and Marcus Nelson in Raleigh, North Carolina, after White set out in 2006 to build a better way for software companies to capture user feedback. The platform lets companies run public or private feedback portals where customers submit and vote on ideas, alongside in-app widgets, browser-extension feedback capture, internal prioritization scoring, and communication tools to close the loop with customers about what shipped. More than 3,500 companies have used UserVoice to inform product decisions. Microsoft was a long-time high-profile user of UserVoice for products like Windows and Office, though Microsoft began retiring its UserVoice-hosted feedback sites starting in 2021 in favor of first-party feedback tools; this was a customer transition rather than a shutdown of the UserVoice company itself. UserVoice was acquired by customer-engagement vendor Verint Systems in 2021, and in November 2025 it was acquired again, this time by Curious, a holding company founded by Andrew Dumont focused on long-term ownership of profitable SaaS businesses; UserVoice had raised roughly 9.6 million dollars in funding since 2008, with its final independent funding round of 1.8 million dollars closing in August 2025, just months before the Curious acquisition. Pricing is quote-based and scales with feedback volume and integrations rather than seats, with publicly referenced tiers starting around 999 dollars per month for a Growth plan capped at 200 end users, rising through Team and Strategic tiers to a custom Enterprise plan. UserVoice competes with Canny, Productboard, and Featurebase, and is best known among established, larger organizations that adopted it early for structured feedback collection and prioritization, distinct from research tools like UserTesting or UserZoom.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bd278a62-8daf-4a08-9776-46b01f241b6d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Public and private feedback portals$q$, $q$Let customers submit, browse, and vote on ideas.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$In-app feedback widget$q$, $q$Capture suggestions directly inside the product without redirecting users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Idea prioritization scoring$q$, $q$Rank feedback using effort, votes, and revenue-weighted signals.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Roadmap communication$q$, $q$Share status updates on ideas from under review through shipped.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Browser-based feedback capture$q$, $q$Collect feedback signals from support tickets, sales calls, and other tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Segmentation and tagging$q$, $q$Organize feedback by customer segment, plan tier, or theme.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Integrations$q$, $q$Connect with helpdesk, CRM, and support tools to enrich feedback context.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Long track record and mature feature set for structured feedback management$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$No per-seat pricing, so internal stakeholders can access the tool freely$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Strong for enterprises managing large volumes of feedback across teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Idea prioritization tools help tie feedback to business impact$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$New ownership under Curious signals continued investment in the product$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Pricing is not publicly listed and starts relatively high for small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Two ownership changes in recent years may raise continuity questions for prospective buyers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Interface feels dated compared to newer entrants like Canny or Featurebase$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$High-profile customer departures, such as Microsoft's, generated negative publicity around the brand$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Who founded UserVoice?$q$, $q$Richard White, Lance Ivy, and Marcus Nelson founded UserVoice in 2008.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Is UserVoice shutting down?$q$, $q$No, the company continues to operate; Microsoft discontinued its own UserVoice-hosted feedback sites starting in 2021, which is separate from UserVoice as a company.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Who owns UserVoice now?$q$, $q$UserVoice was acquired by Verint Systems in 2021 and then by Curious in November 2025.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$How much does UserVoice cost?$q$, $q$Publicly referenced plans start around 999 dollars per month, with pricing scaling by feedback volume and integrations rather than by seat.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Does UserVoice charge per seat?$q$, $q$No, UserVoice pricing is based on feedback volume and connected integrations, not the number of internal users.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$What is UserVoice used for?$q$, $q$Collecting, organizing, and prioritizing customer feedback and feature requests, and communicating roadmap status back to customers.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$What are UserVoice's main competitors?$q$, $q$Canny, Productboard, and Featurebase.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Does UserVoice offer a free trial?$q$, $q$UserVoice does not publicly advertise a free plan; prospective customers are directed to request a demo or quote.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Feature request collection$q$, $q$Centralize customer feature requests from multiple channels into one prioritized backlog.$q$, $q$Product managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Public roadmap communication$q$, $q$Show customers what is planned, in progress, and shipped to build trust and reduce repeat requests.$q$, $q$Product marketing and customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Enterprise feedback governance$q$, $q$Aggregate and prioritize feedback across large customer bases with revenue-weighted scoring.$q$, $q$Enterprise product organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Growth$q$, $q$$999/month$q$, $q$monthly$q$, NULL, $q$["Up to 200 end users","Web portal and in-app widget","Basic feedback capture"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Team$q$, $q$$1,299/month$q$, $q$monthly$q$, NULL, $q$["Up to 3,000 users","Browser-based feedback capture","Internal communication tools"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Strategic$q$, $q$$1,499/month$q$, $q$monthly$q$, NULL, $q$["Up to 5,000 users","Feedback context tracking","Feature development tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$Enterprise$q$, $q$Custom$q$, $q$custom contract$q$, NULL, $q$["Advanced security and compliance","Priority support","Custom integrations"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'bd278a62-8daf-4a08-9776-46b01f241b6d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$overview$q$, $q$What Is UserVoice$q$, 2, ARRAY[$q$UserVoice is a customer feedback management platform founded in 2008 by Richard White, Lance Ivy, and Marcus Nelson. It helps companies collect, organize, and prioritize product feedback and feature requests from customers through public or private portals, in-app widgets, and browser-based capture tools.$q$, $q$The company has changed hands twice in recent years: Verint Systems acquired UserVoice in 2021, and in November 2025 it was acquired by Curious, a holding company built around long-term ownership of profitable SaaS products, following a final independent funding round of 1.8 million dollars just months earlier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$UserVoice centers on feedback portals where customers submit and vote on ideas, paired with an in-app widget for capturing suggestions without leaving the product. Internally, teams can score and prioritize ideas using effort, votes, and revenue-weighted signals, then communicate roadmap status back to customers as ideas move from under review to shipped.$q$, $q$Additional capture tools, including a browser extension for pulling feedback signals from support tickets and sales calls, and integrations with helpdesk and CRM tools, help enrich raw feedback with customer context.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bd278a62-8daf-4a08-9776-46b01f241b6d', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$UserVoice does not charge per seat; instead, pricing scales with feedback volume and the integrations a team connects. Publicly referenced tiers include a Growth plan around 999 dollars per month for up to 200 end users, a Team plan around 1,299 dollars per month for up to 3,000 users, and a Strategic plan around 1,499 dollars per month for up to 5,000 users.$q$, $q$A custom-priced Enterprise plan adds advanced security, compliance, and priority support. Prospective customers generally need to request a demo or quote for exact pricing.$q$]::text[], 2);


-- ── UserZoom ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$UserZoom was a Barcelona-founded UX research and usability-testing platform that merged with UserTesting in 2023 and now operates as the UserZoom platform within the combined UserTesting product suite.$q$, short_description),
  pricing_model = COALESCE($q$custom$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2007, founded_year),
  company_size = COALESCE($q$1,000-2,000 employees (as part of UserTesting)$q$, company_size),
  headquarters = COALESCE($q$San Jose, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$UserZoom (UserTesting Platform) Review 2026: History, Features$q$, seo_title),
  seo_meta_description = COALESCE($q$UserZoom is now the UserZoom platform inside UserTesting after their 2023 merger. Learn its history, features, and current pricing structure.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$UserZoom was founded in Barcelona, Spain in 2007 by Alfonso de la Nuez, Javier Darriba, and Xavier Mestres, growing out of Xperience Consulting, one of Spain's earliest UX and usability consultancies which the same founders had started in 2001. UserZoom automated the in-person usability lab studies the founders had been running manually, evolving from a tech-enabled services model into a self-serve SaaS UX research platform after enterprise clients such as Google requested direct login access around 2009 to 2010. The company grew into a full UX insight platform offering unmoderated and moderated usability testing, card sorting, tree testing, surveys, and its proprietary QXscore benchmarking methodology, eventually moving its headquarters to San Jose, California while retaining a large research and development team in Barcelona. UserZoom raised venture funding including a 34 million dollar round to expand its platform, and its customers included Amazon, Twitter, and Alibaba. In 2021, private equity firm Thoma Bravo acquired UserZoom, and in April 2023 Thoma Bravo merged UserZoom with UserTesting, a separate portfolio company it also owned, combining UserZoom's research methodology and QXscore benchmarking with UserTesting's video-insight technology and global contributor network. The combined company operates under the UserTesting name and brand, and the userzoom.com domain now redirects to a dedicated UserZoom platform page on usertesting.com; there is no longer an independently branded UserZoom product or pricing page. As a result, current pricing, plans, and roadmap for UserZoom capabilities are set entirely through UserTesting, which uses custom, quote-based pricing across Advanced, Ultimate, and Ultimate+ tiers. For research purposes, UserZoom should be understood as a legacy brand now folded into UserTesting rather than a standalone company, distinct from feedback-voting tools like UserVoice.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c692a937-f3e2-45ab-ad20-28a30d805a63' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Unmoderated and moderated usability studies$q$, $q$Run structured research tasks with real users, recorded and analyzed at scale.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$QXscore benchmarking$q$, $q$Score experience quality against industry benchmarks and track it over releases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Card sorting and tree testing$q$, $q$Test and validate information architecture decisions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Survey-based research$q$, $q$Collect quantitative feedback alongside qualitative task data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Barcelona research heritage$q$, $q$Deep UX research methodology inherited from Xperience Consulting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Enterprise research operations tools$q$, $q$Support large research teams managing many concurrent studies.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Integrated contributor network$q$, $q$Access UserTesting's global panel through the merged platform.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Deep UX research methodology and benchmarking heritage through QXscore$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Now backed by UserTesting's larger contributor network and AI analysis tools post-merger$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Strong historical enterprise customer base including Amazon, Twitter, and Alibaba$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Consultative research services available for teams that want expert-led studies$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$No longer exists as an independently branded, standalone product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Pricing and roadmap are now fully controlled by UserTesting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Legacy UserZoom customers had to transition to the merged UserTesting platform$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Brand recognition has faded since the 2023 merger, causing some confusion in the market$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Is UserZoom still a separate company?$q$, $q$No, it merged with UserTesting in April 2023 and now operates as the UserZoom platform within UserTesting.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Who founded UserZoom?$q$, $q$Alfonso de la Nuez, Javier Darriba, and Xavier Mestres founded UserZoom in Barcelona, Spain in 2007.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$What happened to userzoom.com?$q$, $q$The domain redirects to a UserZoom platform page on usertesting.com.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$What is QXscore?$q$, $q$UserZoom's proprietary methodology for benchmarking experience quality against industry standards.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Who owns UserZoom now?$q$, $q$Thoma Bravo, which also owns UserTesting; the two were merged into one company in 2023.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$How is UserZoom priced today?$q$, $q$Through UserTesting's custom, quote-based pricing, since there is no separate UserZoom pricing page anymore.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$What was the difference between UserZoom and UserTesting historically?$q$, $q$UserZoom focused on structured UX research methodology and benchmarking, while UserTesting focused on video-based human insight from a large contributor panel; the 2023 merger combined both approaches.$q$, 6, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$UX benchmarking$q$, $q$Score and track experience quality across product releases using QXscore methodology.$q$, $q$Enterprise UX research teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Information architecture testing$q$, $q$Validate navigation and content structure through card sorting and tree testing.$q$, $q$UX designers and researchers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$Large-scale research operations$q$, $q$Manage many concurrent usability studies across a large research team.$q$, $q$Enterprise research operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$UserZoom Platform (via UserTesting)$q$, $q$Custom$q$, $q$custom contract$q$, NULL, $q$["Included as part of UserTesting's Advanced, Ultimate, and Ultimate+ plans","Quote-based pricing","Contact sales for a quote"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'c692a937-f3e2-45ab-ad20-28a30d805a63';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$overview$q$, $q$What Is UserZoom$q$, 2, ARRAY[$q$UserZoom was a UX research and usability-testing platform founded in Barcelona, Spain in 2007 by Alfonso de la Nuez, Javier Darriba, and Xavier Mestres, evolving out of the founders' earlier in-person usability consultancy, Xperience Consulting. The company automated lab-based usability studies into a self-serve SaaS platform after enterprise clients like Google requested direct access around 2009 to 2010.$q$, $q$In April 2023, owner Thoma Bravo merged UserZoom with fellow portfolio company UserTesting, which it had separately acquired for 1.3 billion dollars in 2022. UserZoom no longer exists as a standalone company; it now operates as the UserZoom platform within UserTesting, and userzoom.com redirects to a page on usertesting.com.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$UserZoom's core methodology included unmoderated and moderated usability studies, card sorting and tree testing for information architecture validation, survey-based research, and its proprietary QXscore benchmarking system for tracking experience quality against industry standards over time.$q$, $q$Since the 2023 merger, these research capabilities are combined with UserTesting's larger global contributor network and AI-assisted video analysis tools, giving customers of the merged platform access to both companies' original strengths.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c692a937-f3e2-45ab-ad20-28a30d805a63', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Because UserZoom has been folded into UserTesting, there is no independent UserZoom pricing page. Access to UserZoom platform capabilities is priced through UserTesting's custom, quote-based Advanced, Ultimate, and Ultimate+ tiers.$q$, $q$Prospective customers should request pricing directly from UserTesting rather than looking for standalone UserZoom plans.$q$]::text[], 2);


-- ── UVdesk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$UVdesk is an open-source and SaaS customer support helpdesk built on PHP and Symfony, offering multichannel ticketing, automation, and a free self-hosted community edition for e-commerce and SMB support teams.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (open-source); paid plans from $8/agent/month$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$201-500 employees$q$, company_size),
  headquarters = COALESCE($q$Noida, India$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$UVdesk Review 2026: Open Source Helpdesk Features and Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$UVdesk is an open-source and SaaS helpdesk for e-commerce and SMB support teams. See its features, pricing plans, pros and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$UVdesk is a customer support helpdesk platform built by Webkul, an Indian software company founded in 2010 in Noida by Vinay Yadav, Vipin Sahu, and Prakash Sahu. UVdesk is written in PHP and MySQL on the Symfony framework and is offered in two forms: a fully open-source, self-hosted Community edition that is free to download and modify, and a hosted SaaS version with paid per-agent pricing. The platform is aimed particularly at e-commerce and marketplace sellers, consolidating support requests from channels such as email, live chat, Facebook, and marketplaces like Amazon into a single ticket queue, alongside workflow automation, canned responses, a customer self-service knowledge base, and agent performance reporting. UVdesk's SaaS plans are billed per agent, starting at roughly 8 dollars per agent per month when billed annually, or about 11 dollars per agent per month billed monthly, with a minimum of two agents; the open-source Community edition remains free indefinitely for teams willing to self-host and maintain their own instance. As part of Webkul's broader e-commerce tooling ecosystem, which also includes marketplace and multi-vendor extensions for platforms like Magento, Shopify, and WooCommerce, UVdesk integrates closely with popular online store platforms. Webkul has grown to roughly 400-plus employees and reports several million dollars in annual revenue without disclosed external venture funding, reflecting a bootstrapped growth path. UVdesk competes with other SMB and open-source helpdesk tools such as Zammad, FreeScout, and osTicket, and is most often chosen by cost-conscious e-commerce businesses that want either a free self-hosted ticketing system or an affordable hosted alternative to larger platforms like Zendesk or Freshdesk.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Multichannel ticketing$q$, $q$Aggregate support requests from email, chat, social, and marketplaces into one dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Open-source Community edition$q$, $q$Self-host the full ticketing system for free under an open license.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Workflow automation$q$, $q$Automatically route and tag tickets based on rules like issue type or priority.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Canned responses and templates$q$, $q$Speed up replies with reusable response templates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Knowledge base and customer portal$q$, $q$Let customers self-serve answers before contacting support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Marketplace integrations$q$, $q$Connect with e-commerce platforms like Magento, Shopify, and WooCommerce.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Agent performance reporting$q$, $q$Track response times, resolution rates, and agent productivity.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Symfony-based architecture$q$, $q$Built on PHP and the Symfony framework for extensibility and customization.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Genuinely free, self-hosted open-source option with no user limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Low-cost SaaS plans compared to Zendesk or Freshdesk$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Strong e-commerce and marketplace channel integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Full source-code access for custom development on the open-source edition$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Backed by Webkul, an established e-commerce tooling vendor$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Self-hosting the open-source edition requires PHP and Symfony server management skills$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Interface feels less polished than premium competitors like Zendesk or Intercom$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Smaller ecosystem of third-party integrations than larger helpdesk platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Documentation and support quality can vary for the free open-source tier$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Is UVdesk free?$q$, $q$Yes, the open-source Community edition is free to self-host; SaaS plans are paid per agent.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Who makes UVdesk?$q$, $q$Webkul, an Indian software company founded in 2010 in Noida.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$What is UVdesk built with?$q$, $q$PHP, MySQL, and the Symfony framework.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$How much does UVdesk SaaS cost?$q$, $q$Around 8 dollars per agent per month billed annually, or about 11 dollars per agent per month month-to-month, with a two-agent minimum.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Does UVdesk support e-commerce channels?$q$, $q$Yes, it integrates with marketplaces and platforms like Amazon, Magento, Shopify, and WooCommerce.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Can I self-host UVdesk?$q$, $q$Yes, the open-source Community edition can be installed on your own server.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$What are UVdesk's main competitors?$q$, $q$Zammad, FreeScout, osTicket, and hosted tools like Zendesk and Freshdesk.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Does UVdesk have automation features?$q$, $q$Yes, including automatic ticket routing, tagging, and canned response templates.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$E-commerce customer support$q$, $q$Consolidate support requests from marketplaces and storefronts into one ticketing queue.$q$, $q$E-commerce and marketplace sellers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Self-hosted support desk$q$, $q$Run a fully owned, customizable helpdesk without recurring SaaS fees.$q$, $q$Cost-conscious SMBs and developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Multichannel support operations$q$, $q$Manage email, chat, and social support from a single agent dashboard.$q$, $q$Customer support teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$Community (Open Source)$q$, $q$Free$q$, $q$self-hosted$q$, NULL, $q$["Self-hosted ticketing system","Unlimited agents","Full source code access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$SaaS (Annual)$q$, $q$$8/agent/month$q$, $q$annual$q$, NULL, $q$["Hosted ticketing","Multichannel support","Automation rules"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$SaaS (Monthly)$q$, $q$$11/agent/month$q$, $q$monthly$q$, NULL, $q$["Same features as annual plan","No annual commitment","Two-agent minimum"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'ee32ab12-332b-4d10-9733-64fdc3deca2d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$overview$q$, $q$What Is UVdesk$q$, 2, ARRAY[$q$UVdesk is a customer support ticketing platform built by Webkul, an Indian software company founded in 2010 in Noida by Vinay Yadav, Vipin Sahu, and Prakash Sahu. It is written in PHP and MySQL on the Symfony framework and is offered as both a free, self-hosted open-source Community edition and a hosted SaaS product with per-agent pricing.$q$, $q$The platform is aimed heavily at e-commerce and marketplace sellers, given Webkul's broader ecosystem of extensions for platforms like Magento, Shopify, and WooCommerce.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$UVdesk consolidates support requests from email, live chat, social channels, and marketplaces like Amazon into a single ticket dashboard, with automation rules that route and tag tickets based on criteria such as issue type or priority.$q$, $q$Additional capabilities include canned response templates, a customer-facing knowledge base and self-service portal, and agent performance reporting that tracks response times and resolution rates.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The open-source Community edition of UVdesk is free to self-host indefinitely, giving teams full source code access with no user limits. The hosted SaaS version is billed per agent, starting around 8 dollars per agent per month when billed annually, or about 11 dollars per agent per month on a month-to-month basis, with a minimum of two agents.$q$, $q$There is no free hosted SaaS tier; the free option is specifically the self-hosted open-source edition.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ee32ab12-332b-4d10-9733-64fdc3deca2d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── üWave ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$uWave is a free, open-source, self-hosted platform where communities take turns playing music, videos, or other media together in a shared, real-time listening room.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$uWave Review: Open Source Collaborative Listening Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$uWave is a free, self-hosted, open-source collaborative listening room. Learn its features, setup requirements, and how it compares to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$uWave, styled with an umlaut as üWave and hosted at u-wave.net, is a free and open-source, self-hosted collaborative listening platform in the spirit of earlier community DJ-booth services. Rather than being a company or hosted SaaS product, uWave is a software project maintained on GitHub under the u-wave organization, made up of a core server library and a web client, released under the MIT license. The platform lets a community take turns acting as a DJ, queuing up songs, talks, gameplay videos, or other media pulled from external source plugins such as YouTube and SoundCloud, while everyone in the room listens or watches together and can chat in real time. Because it is self-hosted, anyone with basic server administration skills can deploy their own uWave instance, configure it with environment variables such as a listening port, a YouTube API key, and a Redis connection, and fully control moderation, branding, and available media sources rather than relying on a centralized company-run service. There is no vendor, subscription, or company behind uWave beyond its open-source maintainers, so there are no pricing tiers, corporate headquarters, or a fixed founding date in the traditional sense; the project instead sits alongside other niche open-source alternatives to defunct commercial listening rooms, appealing to internet communities and hobbyist server operators who want a self-controlled shared listening room. As with many small open-source projects, ongoing development depends on volunteer maintainers, and users should expect to handle their own hosting, updates, and moderation rather than getting vendor support.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Turn-based DJ queue$q$, $q$Community members take turns queuing and playing media for everyone in the room.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$External media source plugins$q$, $q$Pull in songs and videos from sources like YouTube and SoundCloud.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Self-hosted deployment$q$, $q$Run your own instance on your own server infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Real-time chat$q$, $q$Chat alongside the shared listening queue.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Open-source codebase$q$, $q$Full access to the server and web client source code under the MIT license.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Configurable server settings$q$, $q$Set a custom listening port, API keys, and a Redis connection for scaling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Community hub$q$, $q$Discover and join other publicly hosted uWave communities.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Completely free and open source with no subscription cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Full control over hosting, moderation, and branding$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$A community-first alternative to defunct services like Plug.dj$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Extensible via source plugins for different media platforms$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Requires self-hosting and ongoing server maintenance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$No official vendor support, customer service, or service-level agreement$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Smaller community and fewer built-in media sources than commercial alternatives$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Documentation and setup can be technical for non-developers$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$What is uWave?$q$, $q$An open-source, self-hosted collaborative listening platform where users take turns playing media for a shared room.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Is uWave free?$q$, $q$Yes, it is free and open source under the MIT license.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Do I need to host uWave myself?$q$, $q$Yes, uWave is self-hosted, though you can also join communities already run by other hosts.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$What media sources does uWave support?$q$, $q$YouTube and SoundCloud by default, with additional sources possible through plugins.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Who maintains uWave?$q$, $q$An open-source community of maintainers under the u-wave GitHub organization.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Does uWave have a mobile app?$q$, $q$uWave is primarily a web-based client accessed through a browser rather than a native mobile app.$q$, 5, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Community listening rooms$q$, $q$Host a shared space where an online community takes turns playing music together.$q$, $q$Online community managers and hobbyists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Private DJ-booth style servers$q$, $q$Run a private, self-controlled alternative to defunct services like Plug.dj.$q$, $q$Developers and self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Group watch or listen events$q$, $q$Coordinate synchronized listening or watching sessions for gameplay videos or talks.$q$, $q$Friend groups and niche interest communities$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$Self-hosted (Open Source)$q$, $q$Free$q$, $q$one-time setup$q$, NULL, $q$["Full source code access","Unlimited rooms and users","Self-managed hosting"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'fe8cc27d-af0b-4ec3-802a-5978cdb838c9';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$overview$q$, $q$What Is uWave$q$, 2, ARRAY[$q$uWave is a free, open-source, self-hosted collaborative listening platform where members of a community take turns queuing up songs, videos, talks, or other media for everyone in the room to experience together, in the tradition of earlier shared DJ-booth style services.$q$, $q$The project is maintained on GitHub under the u-wave organization and released under the MIT license, consisting of a core server library and a web client rather than being run as a centralized commercial service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The core experience is a turn-based DJ queue: community members line up media, and playback advances from person to person while everyone listens together and chats in real time. Media can be pulled in from external sources such as YouTube and SoundCloud through source plugins.$q$, $q$Since uWave is self-hosted, operators configure their own server with settings like the listening port, API keys, and a Redis connection, giving them full control over moderation, branding, and available media sources.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$uWave itself is entirely free and open source, with no subscription fees or paid tiers, since there is no commercial vendor behind it.$q$, $q$The only real cost is the infrastructure a community chooses to run its own instance on, such as server hosting and any Redis or database services required.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fe8cc27d-af0b-4ec3-802a-5978cdb838c9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── UXCam ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$UXCam is a mobile app analytics platform that captures session recordings, heatmaps, and user journeys to help product teams diagnose UX friction and crashes in iOS and Android apps.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (up to 3,000 sessions/month); paid plans from $199/month$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$51-100 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$UXCam Review 2026: Mobile Session Recording Features, Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$UXCam is a mobile app session recording and analytics platform. See its features, pricing plans, pros and cons, and top alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$UXCam is a mobile app experience analytics platform founded in 2013 by Kishan Gupta and Richard Groves, who met through University College London's mobile-usability research work; the company maintains its main office in San Francisco alongside a Berlin, Germany research and development office and a team presence in Kathmandu, Nepal, reflecting Gupta's Nepali roots. UXCam records real user sessions inside native iOS and Android apps, turning that raw session data into heatmaps, user journey funnels, crash and rage-tap detection, and in-app event tracking so mobile product teams can see exactly where users struggle, drop off, or encounter bugs, without needing to instrument every screen manually. The platform automatically captures UI elements and gestures, letting teams retroactively analyze behavior even for events they did not explicitly track in advance, and it integrates with tools like Mixpanel, Amplitude, Firebase, and Segment. UXCam offers a free plan that includes up to 3,000 recorded sessions and 3,000 session videos per month, with paid Starter, Growth, and Enterprise tiers that layer in longer data retention, more sessions, advanced filtering, and enterprise security and compliance features; publicly cited paid pricing starts around 199 dollars per month, though the exact cost scales with monthly session volume under a hybrid subscription-plus-usage model. UXCam has grown largely through bootstrapped revenue, reporting roughly 6.3 million dollars in annual recurring revenue with a team in the 70-to-90 employee range in recent counts. It is most often compared with other mobile-focused session-recording and analytics tools such as Smartlook, Firebase Analytics, and Instabug, and is generally positioned as a mobile-first alternative to web-centric session-replay tools, distinct from research-panel platforms like UserTesting or UserZoom.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Mobile session recording$q$, $q$Capture real user sessions inside native iOS and Android apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Heatmaps$q$, $q$Visualize tap, scroll, and gesture patterns across app screens.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$User journey and funnel analysis$q$, $q$See where users drop off across multi-step flows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Crash and rage-tap detection$q$, $q$Automatically flag sessions with crashes or signs of user frustration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Automatic UI element capture$q$, $q$Retroactively analyze taps on elements without pre-defining every event.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$In-app event tracking$q$, $q$Track custom events alongside recorded sessions for deeper context.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Integrations$q$, $q$Connect with Mixpanel, Amplitude, Firebase, and Segment.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Privacy controls$q$, $q$Mask sensitive on-screen data such as personal or payment information in recordings.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Purpose-built for native mobile apps rather than adapted from a web-first tool$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Generous free tier for smaller apps or early-stage testing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Automatic capture reduces the need for extensive manual event instrumentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Combines qualitative session replay with quantitative funnel and event analytics$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Privacy masking helps meet data protection requirements for recordings$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Paid plans can get expensive quickly as session volume grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Primarily focused on mobile, not a strong fit for teams needing deep web analytics too$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Some advanced features are gated behind higher-tier plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Smaller ecosystem and brand recognition compared to Firebase or Mixpanel$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$What is UXCam used for?$q$, $q$Recording and analyzing real user sessions inside mobile apps to find UX issues and crashes.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Is UXCam free?$q$, $q$Yes, a free plan includes up to 3,000 sessions and 3,000 videos per month.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Who founded UXCam?$q$, $q$Kishan Gupta and Richard Groves founded UXCam in 2013.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Where is UXCam based?$q$, $q$San Francisco, with additional offices in Berlin, Germany and Kathmandu, Nepal.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Does UXCam work on both iOS and Android?$q$, $q$Yes, it supports native session recording on both platforms.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$How much does UXCam cost?$q$, $q$Paid plans start around 199 dollars per month, scaling with session volume.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Can UXCam detect crashes?$q$, $q$Yes, it can automatically flag sessions containing crashes or rage taps.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$What are UXCam's main competitors?$q$, $q$Smartlook, Instabug, and the analytics features within Firebase.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Mobile UX troubleshooting$q$, $q$Watch real session recordings to identify where users get stuck or confused in an app.$q$, $q$Mobile product managers and UX designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Crash and bug triage$q$, $q$Correlate crashes and errors with the exact user session that triggered them.$q$, $q$Mobile engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Onboarding funnel optimization$q$, $q$Analyze drop-off points in the sign-up or onboarding funnel to improve activation.$q$, $q$Growth and product teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["Up to 3,000 sessions per month","3,000 session videos","Basic heatmaps and analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Starter$q$, $q$From $199/month$q$, $q$monthly$q$, NULL, $q$["Increased session volume","Extended data retention","Core session recording and heatmaps"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Growth$q$, $q$Custom$q$, $q$monthly or annual$q$, NULL, $q$["Higher session volume","Advanced filtering and funnels","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["Enterprise security and compliance","Dedicated account management","Custom data retention"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'b229e34c-e034-4e3b-9b6a-44b96f0c1c77';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$overview$q$, $q$What Is UXCam$q$, 2, ARRAY[$q$UXCam is a mobile app experience analytics platform founded in 2013 by Kishan Gupta and Richard Groves, who met through mobile-usability research at University College London. The company is headquartered in San Francisco with a research and development office in Berlin, Germany, and a team presence in Kathmandu, Nepal.$q$, $q$UXCam records real user sessions inside native iOS and Android apps, then turns that data into heatmaps, funnels, and crash detection so mobile product teams can identify friction points without manually instrumenting every screen.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform automatically captures UI elements and taps, meaning teams can retroactively analyze behavior even for events they did not explicitly track ahead of time. Heatmaps and journey funnels reveal where users drop off, while crash and rage-tap detection flags sessions with likely bugs or frustration.$q$, $q$UXCam also supports in-app event tracking and integrates with analytics and crash-reporting tools like Mixpanel, Amplitude, and Firebase, along with privacy masking to obscure sensitive on-screen data in recordings.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b229e34c-e034-4e3b-9b6a-44b96f0c1c77', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$UXCam offers a free plan covering up to 3,000 recorded sessions and 3,000 session videos per month. Paid plans, starting around 199 dollars per month, add higher session volumes, longer data retention, and advanced filtering.$q$, $q$Pricing follows a hybrid subscription-plus-usage model, meaning the exact cost of Growth and Enterprise tiers scales with an app's monthly session volume rather than being fully fixed.$q$]::text[], 2);


-- ── v0 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$v0 is Vercel's AI-powered tool that generates working React and Next.js user interfaces and full-stack app code from natural-language prompts, with one-click deployment to Vercel.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free ($5 in monthly credits); paid plans from $30/user/month$q$, starting_price),
  founded_year = COALESCE(2023, founded_year),
  company_size = COALESCE($q$501-1,000 employees (Vercel)$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$v0 by Vercel Review 2026: AI UI Generator Features, Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$v0 is Vercel's AI tool for generating React and Next.js interfaces from prompts. See its features, pricing plans, and how it compares to alternatives.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$v0 is an AI-powered UI and app generation tool built by Vercel, the company founded in 2015 (originally as ZEIT) by Guillermo Rauch, creator of Socket.IO and the open-source Next.js framework, and now headquartered in San Francisco with roughly 800 employees globally. Vercel launched v0 in beta in October 2023 as an experimental tool that turns natural-language prompts into React components styled with Tailwind CSS and built on shadcn/ui, drawing over 100,000 waitlist signups in its first three weeks; it became generally available in 2024 and has since grown to several million registered developers. Since launch, v0 has evolved well beyond single-component generation: an Agent Mode enables conversational, iterative UI and app building often called vibe coding, and a 2026 platform update added a full-stack sandbox with Next.js backend support, API routes, Supabase database connectivity, Git integration, and a VS Code-style in-browser editor, turning v0 into a tool capable of producing deployable, production-oriented full-stack applications rather than just UI mockups. Because it is built by Vercel, generated projects deploy to Vercel's hosting platform in one click and align closely with the Next.js and shadcn/ui ecosystem Vercel champions elsewhere. Pricing combines subscription tiers with token-based usage: a free plan includes 5 dollars of monthly credits and a 7-messages-per-day limit, a Plus plan is 30 dollars per user per month with 30 dollars in monthly credits plus daily login credits, a Business plan is 100 dollars per user per month, and Enterprise pricing is custom with SSO and training opt-out; pay-as-you-go token pricing varies by model tier, from v0 Mini up to v0 Max Fast. v0 competes with other AI UI and app builders such as Bolt.new, Lovable, Replit Agent, and GitHub Spark, and is most differentiated by its tight integration with Next.js, shadcn/ui, and Vercel's deployment infrastructure.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7e511518-9008-4caa-98b5-24f31611a25c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7e511518-9008-4caa-98b5-24f31611a25c' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Natural-language UI generation$q$, $q$Describe an interface and get generated React components styled with Tailwind CSS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Full-stack sandbox$q$, $q$Build and preview full applications with Next.js backend, API routes, and database connectivity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Agent Mode$q$, $q$Iteratively refine and extend generated apps through ongoing conversation, sometimes called vibe coding.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$One-click Vercel deployment$q$, $q$Deploy generated projects directly to Vercel hosting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$shadcn/ui and Tailwind integration$q$, $q$Generated components follow the shadcn/ui design system and Tailwind conventions out of the box.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Git and VS Code-style editor$q$, $q$Sync generated projects to Git and edit code directly in an in-browser, VS Code-like editor.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Supabase integration$q$, $q$Connect generated apps to a Supabase database for persistent data.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Design Mode$q$, $q$Visually fine-tune generated interfaces without leaving the tool.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Fast way to go from a text description to working, styled React code$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Deep integration with Next.js, shadcn/ui, and Vercel's own deployment pipeline$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Full-stack sandbox extends it beyond UI mockups into working applications$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Large and fast-growing user base with frequent feature updates$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Free tier lets developers try it before committing to a paid plan$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Token-based pricing can be unpredictable and add up quickly for heavy use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Best fit is tightly coupled to the Vercel, Next.js, and shadcn/ui ecosystem$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Generated code sometimes still needs manual review and cleanup for production use$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Daily message limits on the free plan restrict extended experimentation$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$What is v0?$q$, $q$An AI tool from Vercel that generates React and Next.js UI and full-stack app code from natural-language prompts.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Who makes v0?$q$, $q$Vercel, the company founded in 2015 by Guillermo Rauch, creator of Next.js.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$When did v0 launch?$q$, $q$It launched in beta in October 2023 and became generally available in 2024.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Is v0 free?$q$, $q$Yes, there is a free plan with 5 dollars of monthly credits and a 7-messages-per-day limit; paid plans start at 30 dollars per user per month.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$What frameworks does v0 generate code for?$q$, $q$Primarily React and Next.js, styled with Tailwind CSS and shadcn/ui components.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Can v0 build full applications, not just UI?$q$, $q$Yes, its full-stack sandbox supports Next.js backend logic, API routes, and Supabase database connections.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Does v0 deploy automatically?$q$, $q$Generated projects can be deployed to Vercel in one click.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$What are v0's main competitors?$q$, $q$Bolt.new, Lovable, Replit Agent, and GitHub Spark.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Rapid UI prototyping$q$, $q$Generate styled, working React components from a text description in minutes.$q$, $q$Frontend developers and designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Full-stack MVP building$q$, $q$Build a working Next.js app with backend routes and a Supabase database from prompts.$q$, $q$Indie hackers and startup engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Design-to-code handoff$q$, $q$Turn a described design or rough mockup into production-ready component code.$q$, $q$Product teams and design engineers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, NULL, $q$["5 dollars in monthly credits","7 messages per day","Deploy to Vercel and Design Mode"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Plus$q$, $q$$30/user/month$q$, $q$monthly$q$, NULL, $q$["30 dollars in monthly credits per user","2 dollars daily login credits","Team collaboration and centralized billing"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Business$q$, $q$$100/user/month$q$, $q$monthly$q$, NULL, $q$["Same credit structure as Plus","Training data opt-out","Advanced team features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["SAML SSO and role-based access control","No training data usage","Priority support with guaranteed SLAs"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '7e511518-9008-4caa-98b5-24f31611a25c';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$overview$q$, $q$What Is v0$q$, 2, ARRAY[$q$v0 is an AI-powered UI and application generation tool built by Vercel, the company behind the Next.js framework, founded in 2015 by Guillermo Rauch. Launched in beta in October 2023, v0 turns natural-language prompts into working React components styled with Tailwind CSS and shadcn/ui, drawing more than 100,000 waitlist signups in its first three weeks before becoming generally available in 2024.$q$, $q$Since then, v0 has expanded well beyond simple component generation into a broader AI development platform, including a full-stack sandbox for building complete Next.js applications with backend routes and database connectivity.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Users describe an interface in plain language and v0 generates matching React components, which can be refined conversationally in Agent Mode, sometimes described as vibe coding. Generated projects can be edited visually in Design Mode or directly in a VS Code-style in-browser code editor, then synced to Git.$q$, $q$A full-stack sandbox adds Next.js backend logic, API routes, and Supabase database connectivity, letting teams build and preview working applications rather than static UI mockups, with one-click deployment to Vercel's hosting platform when ready.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7e511518-9008-4caa-98b5-24f31611a25c', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$v0 offers a free plan with 5 dollars of monthly credits and a limit of 7 messages per day. Paid plans include Plus at 30 dollars per user per month and Business at 100 dollars per user per month, both including monthly and daily login credits, with a custom-priced Enterprise tier adding SSO and training data opt-out.$q$, $q$Beyond subscriptions, v0 also uses token-based, pay-as-you-go pricing across model tiers named v0 Mini, v0 Pro, v0 Max, and v0 Max Fast, with cost varying by input, output, and cache usage.$q$]::text[], 2);



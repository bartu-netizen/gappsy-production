-- Enrichment marathon batch: Sprout Social, Spruce Health, SpyFu, SQD, SQLMesh, SquadCast, Square, Squarespace

-- ── Sprout Social ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Sprout Social is a cloud-based social media management platform that helps businesses schedule content, manage a unified inbox, run social listening, and report on performance across major social networks.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$79/month per seat (billed annually)$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$1,001-5,000 employees$q$, company_size),
  headquarters = COALESCE($q$Chicago, Illinois, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Sprout Social Review 2026: Pricing, Features and Plans$q$, seo_title),
  seo_meta_description = COALESCE($q$Sprout Social pricing starts at $79/seat/month. Compare plans, features, pros and cons of this social media management and analytics platform.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Sprout Social is a publicly traded (NASDAQ: SPT) social media management platform founded in 2010 and headquartered in Chicago, Illinois. It helps marketing, customer care, and sales teams schedule and publish content, manage a unified social inbox, run social listening and competitive analysis, and generate performance reports across networks including Instagram, Facebook, X, LinkedIn, TikTok, YouTube, and Pinterest. It is built for small businesses through large enterprises that manage multiple social profiles, collaborate across teams, and need to prove social media ROI. Pricing is subscription-based and billed per seat: Essentials starts at 79 dollars per seat per month (billed annually, or 99 dollars billed monthly) for up to 5 profiles, Standard is 199 dollars per seat per month, Professional is 299 dollars per seat per month with unlimited profiles, and Advanced is 399 dollars per seat per month with AI-enhanced replies, sentiment analysis, and API access. An Enterprise tier offers custom pricing with white-glove onboarding and dedicated support. All paid plans include a 30-day free trial with no credit card required. Add-on modules for premium analytics, social listening, and influencer marketing and employee advocacy are sold separately from the core plans. Sprout Social competes with Hootsuite, Buffer, and Later, and is best known for its deep analytics, unified inbox, and enterprise-grade reporting.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Publishing and Scheduling$q$, $q$Plan and queue posts across Instagram, Facebook, X, LinkedIn, TikTok, Pinterest, and YouTube with a visual content calendar and optimal send-time suggestions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Unified Smart Inbox$q$, $q$Consolidates comments, DMs, and mentions from every connected profile into one stream so teams can respond without switching tabs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Social Listening$q$, $q$Tracks keywords, hashtags, and brand mentions across the social web to surface trends, sentiment, and competitive intelligence.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Analytics and Reporting$q$, $q$Customizable, exportable reports covering engagement, audience growth, paid performance, and competitor benchmarks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Review Management$q$, $q$Monitors and responds to reviews on Google, Facebook, and other review sites from within the same dashboard.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$AI Assist$q$, $q$Generates and refines post copy, suggests reply language, and summarizes sentiment using built-in AI tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Employee Advocacy and Influencer Marketing$q$, $q$Add-on modules that let brands amplify content through employee networks and manage influencer partnerships and payouts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Approval Workflows and Team Collaboration$q$, $q$Content approval chains, task assignment, and message tagging for cross-functional marketing and support teams.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Deep, exportable analytics and enterprise-grade reporting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Genuinely unified inbox across all major networks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Strong, responsive customer support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Scales well from small teams to large enterprises$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Social listening add-on gives real competitive insight$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Expensive compared to lighter competitors like Buffer$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Most plans require annual prepayment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Best features (listening, API access, advanced automation) are locked behind top tiers or paid add-ons$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Per-seat pricing gets costly fast for larger teams$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Interface has a learning curve for teams new to the platform$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$How much does Sprout Social cost$q$, $q$Plans start at 79 dollars per seat per month billed annually (Essentials) and go up to 399 dollars per seat per month (Advanced), with a custom-priced Enterprise tier above that.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Does Sprout Social have a free trial$q$, $q$Yes, most plans include a 30-day free trial that does not require a credit card.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Which social networks does Sprout Social support$q$, $q$Instagram, Facebook, X, LinkedIn, TikTok, YouTube, Pinterest, and Google Business Profile, among others depending on the plan.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Is Sprout Social good for agencies$q$, $q$Yes, agencies commonly use the Professional or Advanced plans for unlimited profiles, client reporting, and approval workflows.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Does Sprout Social include social listening$q$, $q$Basic listening features are included on some plans, but full social listening is a separate paid add-on module.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Can I cancel Sprout Social anytime$q$, $q$Annual plans are prepaid for the year; monthly billing is available on some tiers at a higher rate for more flexibility.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$What is Sprout Social's parent company$q$, $q$Sprout Social, Inc. is an independent public company (Nasdaq: SPT) founded in 2010, not owned by another SaaS holding company.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$How does Sprout Social compare to Hootsuite$q$, $q$Sprout Social is generally considered stronger in analytics, reporting, and customer support, while Hootsuite offers a wider range of lower-priced plans.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Enterprise social customer care$q$, $q$Support teams use the unified inbox and approval workflows to manage high volumes of customer messages across networks with consistent response times.$q$, $q$Enterprise customer support and social care teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Multi-brand agency management$q$, $q$Agencies use unlimited profiles, white-label reporting, and content tagging to manage many client accounts from one login.$q$, $q$Digital marketing and social media agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Brand growth and competitive analysis$q$, $q$Marketing teams use social listening and competitor benchmarking to track sentiment, campaign performance, and share of voice.$q$, $q$Mid-market and enterprise marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Essentials$q$, $q$$79/seat/month annual ($99 monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Up to 5 social profiles","Optimal send-time suggestions","Profile and post-level reporting","30-day free trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Standard$q$, $q$$199/seat/month$q$, $q$annual$q$, NULL, $q$["5 social profiles","Consolidated smart inbox","Collaboration tools","Keyword and location monitoring","Unlimited AI alt text","Review management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Professional$q$, $q$$299/seat/month$q$, $q$annual$q$, NULL, $q$["Unlimited social profiles","Message tagging","Competitor and paid insights","AI Assist for post enhancement"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Advanced$q$, $q$$399/seat/month$q$, $q$annual$q$, NULL, $q$["AI-enhanced reply suggestions","Sentiment analysis","Sprout API access","Helpdesk integrations","Team productivity reports","Message spike alerts"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, NULL, $q$["White-glove onboarding","Dedicated SSO support","Priority customer support","Tailored planning"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = 'ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$overview$q$, $q$What Is Sprout Social$q$, 2, ARRAY[$q$Sprout Social is a social media management and analytics platform used by marketing, customer care, and sales teams to plan, publish, monitor, and report on social media activity from a single dashboard.$q$, $q$Founded in 2010 in Chicago, the company went public on the Nasdaq in 2019 and has grown into one of the most widely used enterprise-grade social media suites, serving agencies, mid-market brands, and Fortune 500 companies alongside smaller businesses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$At its core, Sprout Social combines a content calendar and publishing queue with a unified social inbox that consolidates messages, comments, and mentions from every connected profile into one stream.$q$, $q$Higher tiers add social listening, sentiment analysis, competitor benchmarking, review management, employee advocacy, and an influencer marketing module, along with customizable reporting dashboards that can be exported or shared with stakeholders.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ccce00ad-ab0d-46f9-a30a-defa7ebb0d6a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Sprout Social prices per seat across five tiers: Essentials (79 dollars/month annual), Standard (199 dollars/month), Professional (299 dollars/month), Advanced (399 dollars/month), and a custom-priced Enterprise tier.$q$, $q$Nearly all plans require annual prepayment, though a monthly option exists at a premium, and every tier comes with a 30-day free trial. Premium analytics, social listening, and influencer/employee advocacy tools are separate paid add-ons not bundled into the base plans.$q$]::text[], 2);


-- ── Spruce Health ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Spruce Health is a HIPAA-compliant healthcare communication platform that unifies secure messaging, telemedicine video visits, business phone, and e-fax for clinics and care teams.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$24/user/month$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Spruce Health Pricing and Features Review 2026$q$, seo_title),
  seo_meta_description = COALESCE($q$Spruce Health pricing starts at $24/user/month. Compare its HIPAA-compliant messaging, telehealth, and e-fax plans, features, pros and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Spruce Health is a HIPAA-compliant healthcare communication platform founded in 2013 and headquartered in San Francisco, California. It centralizes patient-facing communication for clinics, private practices, and care teams into one interface, combining secure two-way texting, HIPAA-compliant video telemedicine visits, a shared team inbox, business VoIP phone lines, e-fax, and automated appointment reminders. It is designed for solo practitioners, group practices, and healthcare organizations that need to replace disconnected phone systems, personal cell phones, and fax machines with a single compliant tool. Pricing is per user, per month, on month-to-month billing with no long-term contract required: the Basic plan is 24 dollars per user per month and covers phone calls, secure messaging, video telemedicine, e-fax, and team chat; the Communicator plan is 49 dollars per user per month and adds phone trees, time-of-day call routing, VoIP desk phones, API access, and bulk broadcast messaging. A 14-day free trial is available without a credit card. Spruce Health is commonly compared to tools like Weave, OhMD, and Klara in the patient communication and virtual care space, and it is best known for combining fax, phone, video, and messaging into a single HIPAA-compliant inbox rather than requiring separate point solutions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1de08da2-3fe6-4896-9da1-03448621c680';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1de08da2-3fe6-4896-9da1-03448621c680' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$HIPAA-Compliant Secure Messaging$q$, $q$Two-way SMS-style texting with patients that stays compliant, including file sharing and read receipts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Video Telemedicine$q$, $q$Secure, HIPAA-compliant video visits that patients can join from a browser link with no app download required.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Business Phone and E-Fax$q$, $q$A dedicated business phone number with calling, voicemail transcription, and e-fax sending and receiving from any device.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Shared Team Inbox$q$, $q$Conversations can be assigned, tagged, and paged to specific teammates or groups so nothing falls through the cracks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Automated Patient Communication$q$, $q$Scheduled messages, appointment reminders, and intake questionnaires reduce no-shows and manual outreach.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Mobile Payments and Billing Requests$q$, $q$Send payment requests to patients directly through the messaging thread on select plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Call Routing and Phone Trees$q$, $q$On the Communicator plan, practices can build auto-attendant phone trees and route calls based on time of day.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$API Access$q$, $q$The Communicator plan exposes an API for integrating Spruce communication data with EHRs and other practice systems.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Combines phone, fax, text, and video into one compliant inbox$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Month-to-month billing with no long-term contract$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$14-day free trial with no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Simple, transparent per-user pricing$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Well suited to small practices replacing multiple disconnected tools$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Advanced phone routing and API access require the pricier Communicator plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Limited native EHR integrations compared to some larger competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Per-user pricing can add up for practices with many staff accounts$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Some advanced workflow automation may require add-ons or higher plans$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Smaller company size than some enterprise-focused competitors$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$How much does Spruce Health cost$q$, $q$The Basic plan is 24 dollars per user per month and the Communicator plan is 49 dollars per user per month, both billed month-to-month.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Is Spruce Health HIPAA compliant$q$, $q$Yes, Spruce Health is built specifically for HIPAA-compliant communication including messaging, calls, and video visits with patients.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Does Spruce Health offer a free trial$q$, $q$Yes, a 14-day free trial is available and does not require a credit card.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Can Spruce Health replace my clinic's fax machine$q$, $q$Yes, e-fax sending and receiving from any device is included on both pricing plans.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Does Spruce Health support video telemedicine visits$q$, $q$Yes, secure HIPAA-compliant video visits are included starting on the Basic plan.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Is there a long-term contract with Spruce Health$q$, $q$No, Spruce Health uses month-to-month billing by default and customers can cancel at any time.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Who is Spruce Health best suited for$q$, $q$Solo practitioners, small group practices, and healthcare teams that want to consolidate phone, text, fax, and video into one compliant tool.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Does Spruce Health integrate with EHR systems$q$, $q$API access is available on the Communicator plan for integrating with other practice systems, though native EHR integrations are more limited than some competitors.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Solo and small group medical practices$q$, $q$Replace personal cell phones and unsecured texting with a single compliant inbox for patient communication.$q$, $q$Independent physicians and small clinics$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Telehealth-first care teams$q$, $q$Run entire patient visits through secure video calls combined with messaging and intake forms.$q$, $q$Telemedicine and virtual care providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Multi-provider group practices$q$, $q$Route calls, assign conversations, and manage shared patient communication across a larger clinical staff.$q$, $q$Group practices and multi-location clinics$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Basic$q$, $q$$24/user/month$q$, $q$monthly$q$, NULL, $q$["Secure app-based messaging","2-way SMS texting","Secure team chat","Video telemedicine","Business phone number","E-fax"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Communicator$q$, $q$$49/user/month$q$, $q$monthly$q$, NULL, $q$["Everything in Basic","Phone trees and time-of-day call routing","VoIP desk phone support","API access","Mobile payment requests","Bulk broadcast messaging"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '1de08da2-3fe6-4896-9da1-03448621c680';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$overview$q$, $q$What Is Spruce Health$q$, 2, ARRAY[$q$Spruce Health is a healthcare communication platform that gives clinics and independent practices one HIPAA-compliant inbox for phone calls, secure texting, video visits, e-fax, and team chat.$q$, $q$Founded in 2013 and based in San Francisco, Spruce Health was built to replace the mix of personal cell phones, fax machines, and unsecured texting many small healthcare practices rely on with a single compliant system.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform's core is a shared team inbox where staff can send secure messages, place and receive calls, send e-faxes, and conduct video telemedicine visits, with conversations assignable to specific teammates or groups.$q$, $q$Automated tools include appointment reminders, intake questionnaires, scheduled messages, and bulk broadcast messaging, while the Communicator plan adds business-grade phone infrastructure like auto-attendants, call routing rules, and VoIP desk phone support.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Spruce Health charges per user per month with two plans: Basic at 24 dollars per user per month and Communicator at 49 dollars per user per month for practices needing more advanced phone and workflow customization.$q$, $q$Billing is month-to-month with no long-term contract, and a 14-day free trial is available without requiring a credit card.$q$]::text[], 2);


-- ── SpyFu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SpyFu is a competitor keyword research tool that reveals the SEO and PPC keywords, ad history, and backlinks that competitors use to rank and run paid search campaigns.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$29/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2005, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Scottsdale, Arizona, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SpyFu Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$SpyFu pricing starts at $29/month. See competitor keyword research, PPC, and backlink features, plans, pros and cons of this SEO tool.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SpyFu is a competitor research tool for SEO and pay-per-click marketing, founded in 2005 and headquartered in Scottsdale, Arizona. It is built for freelancers, in-house marketers, and agencies who want to see which keywords a competitor ranks for organically and bids on in paid search, along with their historical ad copy, backlinks, and ranking history going back more than a decade. Its signature Kombat tool visualizes keyword overlap between up to three domains using a Venn-diagram style comparison to surface gaps and opportunities. SpyFu is privately held and has a small team, commonly cited around 11 to 50 employees. Pricing is subscription-based with no permanently free plan: the Basic plan starts at 29 dollars per month billed annually (39 dollars billed monthly) for a single site and limited exports; the Pro plus AI plan is 89 dollars per month billed annually (119 dollars monthly) and adds unlimited exports, ten years of historical data, and AI features including RivalFlow and ChatGPT integration; the Team or Agency plan is 187 dollars per month billed annually (249 dollars monthly) with five user seats, white-label reporting, and API access. All plans come with a 30-day money-back guarantee. SpyFu is frequently compared to Ahrefs, SEMrush, and Moz, and is generally positioned as a lower-cost alternative focused specifically on competitor intelligence rather than full-suite SEO auditing.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Competitor Keyword Research$q$, $q$See every organic keyword a domain ranks for in the top 100 results, including search volume, position, and estimated clicks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$PPC Ad History$q$, $q$View a competitor's historic Google Ads copy and the keywords they have bid on going back more than a decade.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Kombat Keyword Overlap$q$, $q$Compares up to three domains in a Venn-diagram style view to find shared and missed keyword opportunities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Backlink Analysis and Backlink Kombat$q$, $q$Identify a competitor's backlink profile and find sites linking to rivals but not to your own domain.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Rank Tracking$q$, $q$Track weekly keyword ranking changes for your own site and monitor competitors over time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$RivalFlow AI$q$, $q$AI-powered recommendations that flag content and keyword gaps based on competitor performance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Automated Reporting$q$, $q$Scheduled, white-labelable SEO and PPC reports for clients or stakeholders on higher-tier plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Domain and Keyword Exports$q$, $q$Bulk data exports of keyword and competitor data for further analysis outside the platform.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Significantly cheaper than Ahrefs or SEMrush for competitor research$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Deep historical PPC ad data going back over a decade$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Kombat tool makes keyword gap analysis fast and visual$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$30-day money-back guarantee on every plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Simple, focused interface centered on competitor intelligence$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$No permanently free plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Keyword database and site audit depth are lighter than full-suite tools like Ahrefs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Basic plan limits exports and tracked keywords significantly$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Additional user seats cost extra even on the Team plan$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Less robust technical SEO auditing compared to dedicated crawlers$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$How much does SpyFu cost$q$, $q$Plans start at 29 dollars per month billed annually (Basic) up to 187 dollars per month billed annually for the Team or Agency plan.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Does SpyFu have a free trial or free plan$q$, $q$There is no permanently free plan, but every paid plan includes a 30-day money-back guarantee.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$What is SpyFu's Kombat tool$q$, $q$Kombat is a keyword overlap comparison tool that visualizes shared and missed keywords across up to three competing domains.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Can SpyFu track my own keyword rankings$q$, $q$Yes, all plans include weekly rank tracking, with higher tiers tracking more keywords per week.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Does SpyFu show competitor PPC ads$q$, $q$Yes, SpyFu shows historical Google Ads copy and bid keywords for any domain going back many years.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$How is SpyFu different from Ahrefs or SEMrush$q$, $q$SpyFu focuses specifically on competitor SEO and PPC intelligence at a lower price point, while Ahrefs and SEMrush offer broader technical SEO auditing suites.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Does SpyFu offer an agency plan$q$, $q$Yes, the Team or Agency plan includes multiple user seats, white-label reporting, and API access.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Is SpyFu good for PPC research$q$, $q$Yes, SpyFu is particularly strong for researching a competitor's historical paid search ad copy and bid keywords.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Freelance SEO and PPC research$q$, $q$Solo marketers use the Basic plan to research competitor keywords and ad copy for a single client or site.$q$, $q$Freelance SEO and PPC consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Content and keyword gap analysis$q$, $q$Marketing teams use Kombat and RivalFlow to find keyword gaps versus direct competitors and prioritize content.$q$, $q$In-house marketing and content teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Agency competitor reporting$q$, $q$Agencies use the Team plan's multiple seats and white-label reports to deliver ongoing competitor intelligence to clients.$q$, $q$Digital marketing and SEO agencies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Basic$q$, $q$$29/month (annual) or $39/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["10,000 row search results and exports","1 Live Site tracking project","5,000 weekly tracked keyword rankings","10 automated reports","1 user seat"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Pro + AI$q$, $q$$89/month (annual) or $119/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited search results and exports","10 Live Site tracking projects","10+ years of historical data","15,000 weekly tracked keyword rankings","RivalFlow AI and ChatGPT integration","1 included user seat"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$Team / Agency$q$, $q$$187/month (annual) or $249/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["Unlimited search results, exports, and tracking projects","10+ years of historical data","50,000 weekly tracked keyword rankings","Unlimited automated reports","White-label reporting and API access","5 included user seats"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'bb2fc581-be51-4423-a4e1-a32e3a5ab109';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$overview$q$, $q$What Is SpyFu$q$, 2, ARRAY[$q$SpyFu is a competitor intelligence tool for SEO and PPC marketers that shows which keywords a domain ranks for organically, which keywords it bids on in Google Ads, and how its ad copy and rankings have changed over time.$q$, $q$Founded in 2005 and based in Scottsdale, Arizona, SpyFu built its reputation on historical search and ad data, giving users the ability to look back over a decade of a competitor's SEO and paid search activity.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The core workflow starts by entering a competitor's domain to pull organic keyword rankings, estimated traffic, PPC keywords, ad history, and backlinks, all searchable and filterable by position or search volume.$q$, $q$The Kombat tool compares up to three domains at once to visualize keyword overlap and gaps, while Backlink Kombat surfaces sites linking to competitors but not to you, and RivalFlow uses AI to recommend content and keyword opportunities based on competitor gaps.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bb2fc581-be51-4423-a4e1-a32e3a5ab109', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SpyFu offers three tiers: Basic at 29 dollars per month (annual billing), Pro plus AI at 89 dollars per month (annual billing), and Team or Agency at 187 dollars per month (annual billing), each roughly 25 percent higher when billed monthly instead of annually.$q$, $q$There is no permanently free plan, but every tier is covered by a 30-day money-back guarantee, and higher tiers unlock more historical data, tracked keywords, exports, and user seats.$q$]::text[], 2);


-- ── SQD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SQD (formerly Subsquid) is an open-source onchain data platform that delivers validated, real-time and historical blockchain data across 225-plus networks through a single streaming API.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free (open-source SDK; Cloud usage-based pricing)$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Zug, Switzerland$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SQD (Subsquid) Review 2026: Features, Pricing and Use Cases$q$, seo_title),
  seo_meta_description = COALESCE($q$SQD (formerly Subsquid) is an open-source blockchain data indexing platform. See features, pricing, and use cases for developers building on-chain apps.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SQD, formerly known as Subsquid, is an open-source blockchain data infrastructure platform founded in 2021 and headquartered in Zug, Switzerland under Subsquid Labs GmbH. It gives Web3 developers a single streaming API to access validated real-time and historical data from more than 225 blockchain networks, ingesting raw blocks, running cryptographic validation checks, and replicating data across a decentralized network of worker nodes. It is used by DeFi protocols, blockchain analytics platforms, gaming projects, and AI agents that need fast, trustworthy on-chain data, with reported customers including GMX, Morpho, and PancakeSwap collectively securing over 20 billion dollars in total value locked. The core Squid SDK and Pipes SDK are open source under an Apache 2.0 license, and the SQD Network and Portal components are open source under AGPL-3.0, allowing self-hosting. SQD Cloud offers a free playground for developing and deploying a single squid indexer at no cost, with production usage priced on a pay-as-you-go basis based on compute and storage consumption rather than raw data access, since network data retrieval itself is free. In October 2025, Subsquid Labs was acquired by Rezolve Ai, which announced a strategic repositioning toward enterprise and institutional data clients beyond Web3. SQD is best known for high-throughput, low-latency data delivery (median response times around 27 milliseconds) and a 99.9 percent uptime SLA for enterprise customers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4706f789-65d6-40a8-87da-b1e3a4ab2425' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Unified Streaming Data API$q$, $q$Access historical and real-time blockchain data from genesis to the latest block through one consistent HTTP API across 225-plus networks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Cryptographic Data Validation$q$, $q$Every block passes multiple cryptographic checks and cross-source verification before being served, targeting 100 percent data correctness.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Decentralized Worker Network$q$, $q$Data is replicated across thousands of worker nodes that sign their responses, creating a verifiable audit trail.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Open-Source SDKs$q$, $q$The Squid SDK and Pipes SDK are Apache 2.0 licensed, letting developers build and self-host custom indexing pipelines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Multi-Chain and Solana Support$q$, $q$A single API surface covers EVM-compatible chains as well as Solana, simplifying multi-chain application development.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Free Playground Environment$q$, $q$Every account gets a free playground organization to develop and deploy one squid indexer at no cost.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Low-Latency Delivery$q$, $q$Reports median response times around 27 milliseconds and sub-50 millisecond P90 latency under load.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Enterprise SLA and Self-Hosting$q$, $q$Enterprise customers get a 99.9 percent uptime SLA, and the AGPL-3.0 licensed network components can be self-hosted for full control.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Core SDKs and data access are free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Very low latency and high data correctness for on-chain queries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Single API covers 225-plus networks instead of separate integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Self-hosting option available for teams wanting full control$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Used in production by well-known DeFi protocols managing billions in TVL$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Cloud pricing is usage-based and less predictable than flat subscription tools$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Recent acquisition by Rezolve Ai introduces uncertainty about product direction$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Primarily targeted at Web3 and blockchain developers, not a general-purpose tool$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Requires technical setup and indexing knowledge to get full value$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Company size and support structure post-acquisition are not publicly detailed$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Is SQD free to use$q$, $q$The core SDKs and CLI are free and open source, network data retrieval is free, and SQD Cloud includes a free playground for a single indexer; production cloud usage is billed pay-as-you-go.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$What was SQD previously called$q$, $q$SQD was previously known as Subsquid before rebranding.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$How many blockchain networks does SQD support$q$, $q$SQD supports data access across more than 225 blockchain networks through a single API.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Is SQD open source$q$, $q$Yes, the Squid SDK and Pipes SDK are Apache 2.0 licensed, and the SQD Network and Portal are AGPL-3.0 licensed, allowing self-hosting.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Who owns SQD now$q$, $q$Subsquid Labs, the company behind SQD, was acquired by Rezolve Ai in October 2025.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$What is SQD used for$q$, $q$SQD is used to index and query historical and real-time blockchain data for DeFi protocols, analytics platforms, gaming projects, and AI agents that need on-chain data.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Does SQD support Solana$q$, $q$Yes, Solana is supported through the same API used for EVM-compatible chains.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$How fast is SQD's data delivery$q$, $q$SQD reports a median response time of around 27 milliseconds and roughly 48.5 milliseconds at the 90th percentile under load.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$DeFi protocol data indexing$q$, $q$Protocols index on-chain events like swaps, deposits, and liquidations in real time to power dashboards and risk systems.$q$, $q$DeFi and blockchain protocol engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Blockchain analytics platforms$q$, $q$Analytics products query historical and real-time on-chain data across many networks through a single API instead of managing separate RPC integrations.$q$, $q$Web3 analytics and data platform builders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$AI agents needing on-chain data$q$, $q$AI agents use validated, low-latency on-chain data feeds to make trustworthy decisions involving blockchain state.$q$, $q$AI and autonomous agent developers building on-chain$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Playground$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["One free squid indexer deployment","Free public Portal endpoint, no API key required","Ideal for development and evaluation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Cloud Pay-as-you-go$q$, $q$Usage-based (compute + storage)$q$, $q$pay-as-you-go$q$, NULL, $q$["Production-ready hosted indexing pipelines","Priced by compute and database storage consumed","Free underlying network data retrieval"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$Enterprise$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["99.9 percent uptime SLA","Dedicated support","Institutional-grade data access"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '4706f789-65d6-40a8-87da-b1e3a4ab2425';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$overview$q$, $q$What Is SQD$q$, 2, ARRAY[$q$SQD is an open-source, decentralized onchain data platform, formerly branded as Subsquid, that gives developers a single API for accessing validated blockchain data from over 225 networks.$q$, $q$Founded in 2021 in Zug, Switzerland, SQD was built to solve the reliability and cost problems of raw blockchain RPC access by validating every block through cryptographic checks and replicating data across a distributed network of worker nodes before serving it through a streaming HTTP API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Developers query historical and real-time data from genesis to the current block head through the same API, with support for both EVM chains and Solana, and can self-host the network components since the core SDKs are open source.$q$, $q$The platform validates each block using multiple cryptographic checks and cross-references multiple data sources, and provides worker-signed responses with verifiable audit trails, which is why it is used by DeFi, gaming, and compliance-focused applications that require high data correctness.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The core Squid SDK, Pipes SDK, and CLI are free and open source, and SQD Network data retrieval itself is free of charge since the network is designed to make raw blockchain data widely accessible.$q$, $q$SQD Cloud offers a free playground for deploying a single indexer at no cost, while production deployments are billed pay-as-you-go based on the compute and database storage resources consumed, with enterprise plans adding a 99.9 percent uptime SLA.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4706f789-65d6-40a8-87da-b1e3a4ab2425', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SQLMesh ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SQLMesh is an open-source data transformation framework, backwards compatible with dbt, that gives data teams DevOps-style version control, testing, and safe deployment for SQL and Python data pipelines.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free (open-source); Tobiko Cloud is custom priced$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE($q$2-10 employees$q$, company_size),
  headquarters = COALESCE($q$San Mateo, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SQLMesh Review 2026: Features, Pricing vs dbt$q$, seo_title),
  seo_meta_description = COALESCE($q$SQLMesh is a free, open-source dbt-compatible data transformation framework by Tobiko Data. See features, pricing, and how it compares to dbt.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SQLMesh is an open-source data transformation framework created by Tobiko Data, a company founded in 2022 by Iaroslav Zeigerman and brothers Tyson and Toby Mao, headquartered in San Mateo, California. It is designed for data engineers and analytics engineers who want DevOps-style practices, such as environment isolation, automated testing, and safe deployments, applied to SQL and Python data pipelines, and it is built to be format-compatible with dbt so existing dbt projects can be imported with minor changes. Its core differentiators include virtual environments that let developers spin up a full replica of a production environment without physically cloning data, intelligent incremental processing that only recomputes changed partitions instead of the whole DAG, compile-time SQL validation powered by the SQLGlot parser, and native blue-green deployment where promoting to production atomically swaps an environment pointer. The open-source project is free and licensed under Apache 2.0, with unlimited projects and no seat limits. Tobiko Cloud, the company's paid hosted offering, adds role-based access control, governance, single sign-on, and a more performant managed scheduler on top of the open-source core, priced through a platform fee plus pay-as-you-go consumption rather than per-seat licensing; exact pricing requires contacting Tobiko's sales team. SQLMesh is most often compared directly to dbt as a lower-overhead, cost-saving alternative for teams running large-scale SQL transformation pipelines.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5c5bacf6-63dd-435b-b336-2b016854189b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5c5bacf6-63dd-435b-b336-2b016854189b' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Virtual Environments$q$, $q$Instantly spin up an isolated replica of any environment without physically cloning data, making development environments effectively free.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Intelligent Incremental Models$q$, $q$Understands time-partitioned, idempotent, and forward-only incremental models and only recomputes changed partitions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$dbt Compatibility$q$, $q$Format-compatible with dbt projects, allowing teams to import existing dbt pipelines with minor changes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Compile-Time SQL Validation$q$, $q$Uses the SQLGlot parser to catch SQL errors before a pipeline runs, rather than failing mid-execution.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Blue-Green Deployments$q$, $q$Promotes changes to production by atomically swapping an environment pointer, so production never sees a partially built table.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Native Python Models$q$, $q$Python models are first-class citizens in the same DAG, with the same change-detection guarantees as SQL models.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Automated Testing and Data Quality Checks$q$, $q$Data quality checks run before a table is exposed to consumers, not after, catching issues earlier.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Tobiko Cloud Governance$q$, $q$The paid cloud offering adds role-based access control, SSO, and a managed scheduler for enterprise governance needs.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Core framework is free, open source, and Apache 2.0 licensed$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Meaningfully reduces compute and storage costs versus full DAG re-runs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$dbt-compatible, easing migration from existing dbt projects$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Compile-time SQL validation catches errors before they run in production$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Built by experienced data engineers from major tech companies$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Smaller community and ecosystem than the more established dbt$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Tobiko Cloud pricing is not publicly listed and requires a sales conversation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Small company size (2-10 employees at Tobiko Data) relative to larger data tooling vendors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Fewer third-party integrations and pre-built packages compared to dbt's package hub$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Learning curve for teams unfamiliar with virtual environments and its plan-based workflow$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Is SQLMesh free$q$, $q$Yes, the core SQLMesh framework is free and open source under an Apache 2.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Is SQLMesh compatible with dbt$q$, $q$Yes, SQLMesh is designed to be format-compatible with dbt, and existing dbt projects can typically be imported with minor changes.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Who created SQLMesh$q$, $q$SQLMesh was created by Tobiko Data, founded in 2022 by Iaroslav Zeigerman, Tyson Mao, and Toby Mao.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$What is Tobiko Cloud$q$, $q$Tobiko Cloud is Tobiko Data's paid, hosted version of SQLMesh that adds role-based access control, SSO, governance, and a managed scheduler.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$How much does Tobiko Cloud cost$q$, $q$Tobiko Cloud pricing combines a platform fee with pay-as-you-go consumption; exact pricing requires contacting Tobiko's sales team.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$What are SQLMesh's virtual environments$q$, $q$Virtual environments let developers instantly create an isolated replica of any environment without physically duplicating the underlying data.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Does SQLMesh support Python models$q$, $q$Yes, Python models are first-class and participate in the same dependency graph and change-detection system as SQL models.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$What license is SQLMesh released under$q$, $q$The open-source SQLMesh framework is released under the Apache 2.0 license.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Migrating off dbt for cost savings$q$, $q$Data teams move existing dbt projects to SQLMesh to cut compute and storage costs through smarter incremental processing and virtual environments.$q$, $q$Data engineering teams running large dbt pipelines$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$DevOps-style data pipeline management$q$, $q$Teams use blue-green deployments and compile-time validation to ship data model changes safely without breaking production tables.$q$, $q$Analytics engineers and data platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Enterprise governance with Tobiko Cloud$q$, $q$Organizations use Tobiko Cloud's RBAC, SSO, and managed scheduler to run SQLMesh at scale with enterprise access controls.$q$, $q$Enterprise data platform and governance teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$SQLMesh Open Source$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Apache 2.0 licensed core framework","Unlimited projects and models","Virtual environments and incremental models","Self-hosted scheduler"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$Tobiko Cloud$q$, $q$Custom (platform fee plus usage-based consumption)$q$, $q$custom$q$, NULL, $q$["Role-based access control and governance","Single sign-on","Managed, higher-performance scheduler","Hosted observability and monitoring"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '5c5bacf6-63dd-435b-b336-2b016854189b';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$overview$q$, $q$What Is SQLMesh$q$, 2, ARRAY[$q$SQLMesh is an open-source data transformation framework that applies DevOps practices, such as environment isolation, automated testing, and safe deployments, to SQL and Python-based data pipelines.$q$, $q$It was created by Tobiko Data, founded in 2022 by data engineers from companies including Airbnb, Apple, and Netflix, and is designed to be format-compatible with dbt so teams can migrate existing dbt projects with only minor changes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SQLMesh's virtual environments let developers create a full replica of any environment instantly without physically duplicating data, which removes much of the storage and compute cost of traditional development environments.$q$, $q$Its incremental engine understands time-partitioned, idempotent, and forward-only models, recomputing only the partitions that actually changed, while the built-in SQLGlot parser catches SQL errors at compile time and native blue-green deployment ensures production never shows a half-built table.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The core SQLMesh framework is free and open source under an Apache 2.0 license, with no limit on projects, models, or contributors.$q$, $q$Tobiko Cloud, the company's managed offering, adds role-based access control, governance, SSO, and a hosted scheduler on top of the open-source features, priced through a platform fee combined with pay-as-you-go consumption; specific pricing is only available by contacting Tobiko's sales team.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c5bacf6-63dd-435b-b336-2b016854189b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── SquadCast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SquadCast (squadcast.fm) is a remote recording studio that lets podcasters and video creators capture separate, high-quality local audio and video tracks with guests from anywhere.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (paid plans from $16/month billed annually)$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Oakland, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SquadCast.fm Review 2026: Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$SquadCast.fm is a remote podcast and video recording studio. See its free plan, paid pricing, features, pros and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SquadCast, found at squadcast.fm, is a remote recording studio for podcasters and video creators, co-founded in 2016 by Zachariah Moreno and Rockwell Felder and originally headquartered in Oakland, California. It lets hosts and guests record separate, studio-quality local audio and video tracks from anywhere with an internet connection, then automatically uploads and syncs those tracks in the cloud to avoid the compression and sync issues common with call-recording tools. The platform includes Dolby-powered audio processing, 4K video recording and export on higher tiers, built-in AI features for transcription, overdub, and content repurposing, and team collaboration tools for producers managing multiple shows. SquadCast was acquired by AI-powered editing platform Descript in August 2023 and now operates as SquadCast.fm by Descript; it is also bundled free with any Descript subscription. Pricing runs on a freemium model: a Free plan offers 1 recording hour per editor per month with a watermark; Hobbyist is 16 dollars per month billed annually (24 dollars monthly) with 10 hours and no watermark; Creator is 24 dollars per month billed annually (35 dollars monthly) with 30 hours, 4K exports, and unlimited AI features; and Business is 50 dollars per month billed annually (65 dollars monthly) with 40 hours, priority support, and unlimited AI regeneration and overdub for larger teams.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c4d5d81-6ff4-4496-8867-73b2e003226f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Separate Local Track Recording$q$, $q$Records each participant's audio and video locally in their browser for studio-quality tracks free of internet-call compression.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Automatic Cloud Sync and Backup$q$, $q$Tracks upload and sync automatically after the session, protecting against dropped connections mid-recording.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Dolby Audio Processing$q$, $q$Built-in Dolby.io audio enhancement cleans up recordings on paid plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$4K Video Recording and Export$q$, $q$Higher-tier plans support up to 4K video capture and export for video podcasts and YouTube content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$AI Transcription and Overdub$q$, $q$Automatic transcription plus AI voice regeneration and overdub tools for fixing flubbed lines without re-recording.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Multi-Show and Team Collaboration$q$, $q$Manage multiple shows and invite team members or co-producers with shared access on paid plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Integrations$q$, $q$Connects with third-party publishing and workflow tools to streamline the path from recording to a published episode.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Descript Bundle Access$q$, $q$Included free with any Descript subscription, tying recording directly into Descript's editing workflow.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Free plan available with no credit card required to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Local recording avoids the audio quality issues of live call-recording tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Bundled free with a Descript subscription$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Rollover recording hours reduce waste for infrequent podcasters$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$AI transcription and overdub built in rather than a separate purchase$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Now positioned primarily as an add-on to Descript rather than a fully independent product$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Free plan recordings include a watermark and are limited to 1 hour per month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$4K video and unlimited AI features require the pricier Creator or Business tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Smaller standalone team since folding into Descript, which may affect long-term standalone development$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Monthly billing carries a notable premium over annual billing$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Is SquadCast free$q$, $q$Yes, there is a Free plan offering 1 recording hour per editor per month with a watermark; paid plans start at 16 dollars per month billed annually.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Who owns SquadCast now$q$, $q$SquadCast was acquired by Descript in August 2023 and now operates as SquadCast.fm by Descript.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Does SquadCast record separate tracks for each guest$q$, $q$Yes, each participant's audio and video is recorded locally and separately, then synced in the cloud after the session.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Can I get SquadCast for free with Descript$q$, $q$Yes, SquadCast is included at no additional cost with any Descript subscription.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Does SquadCast support 4K video$q$, $q$4K video recording and export is available on the Creator and Business plans.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$What happens to unused recording hours on SquadCast$q$, $q$Unused hours roll over automatically, up to twice the plan's monthly hour allotment.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Does SquadCast have AI features$q$, $q$Yes, plans include AI transcription, and paid tiers add unlimited AI overdub and voice regeneration.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Who founded SquadCast$q$, $q$SquadCast was co-founded in 2016 by Zachariah Moreno and Rockwell Felder.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Solo and hobbyist podcasters$q$, $q$Casual podcasters use the Free or Hobbyist plan to record interviews with remote guests without investing in studio equipment.$q$, $q$Independent and hobbyist podcast hosts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Video podcast production$q$, $q$Creators use 4K recording and Dolby audio processing to produce video podcasts for YouTube and social clips.$q$, $q$Video podcasters and content creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Podcast networks and production teams$q$, $q$Producers manage multiple shows, invite team members, and use AI overdub to speed up editing across a recurring show schedule.$q$, $q$Podcast networks and production agencies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Free$q$, $q$$0$q$, $q$n/a$q$, NULL, $q$["1 recording hour per editor per month","1 show","10 participants","Video and screen recording","1 hour/month transcription","Exports up to 720p with watermark"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Hobbyist$q$, $q$$16/month (annual) or $24/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["10 recording hours per editor per month","5 shows","10 hours/month transcription","Unlimited watermark-free exports up to 1080p","Dolby audio processing","Basic AI suite (20 uses/month)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Creator$q$, $q$$24/month (annual) or $35/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["30 recording hours per editor per month","Unlimited shows","30 hours/month transcription","Unlimited 4K exports","Unlimited basic and advanced AI suite","Unlimited stock library access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$Business$q$, $q$$50/month (annual) or $65/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["40 recording hours per editor per month","Unlimited shows","40 hours/month transcription","Full professional AI suite","Unlimited regenerate and overdub","Priority support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '3c4d5d81-6ff4-4496-8867-73b2e003226f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$overview$q$, $q$What Is SquadCast$q$, 2, ARRAY[$q$SquadCast is a browser-based remote recording studio built specifically for podcasters and video creators who need to record high-quality, separate local tracks with guests in different locations.$q$, $q$Co-founded in 2016 and originally based in Oakland, California, SquadCast was acquired by Descript in August 2023 and now operates as SquadCast.fm by Descript, with its technology increasingly integrated into the broader Descript editing platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Each participant's audio and video is recorded locally in the browser and uploaded to the cloud after the session, which avoids the choppy audio and lip-sync drift common with real-time call-recording software.$q$, $q$Higher tiers add Dolby audio processing, 4K video export, built-in AI tools for transcription and overdub, and team features like multiple shows, integrations, and priority support for producers managing recurring recording sessions.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c4d5d81-6ff4-4496-8867-73b2e003226f', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SquadCast uses a freemium model with a Free plan offering 1 recording hour per editor per month, and three paid tiers: Hobbyist at 16 dollars per month (annual billing), Creator at 24 dollars per month (annual billing), and Business at 50 dollars per month (annual billing), each roughly 40-50 percent higher when billed monthly.$q$, $q$Unused recording hours roll over up to twice the plan's monthly allotment, extra hours can be purchased a la carte, and the tool is included at no additional cost with any Descript subscription.$q$]::text[], 2);


-- ── Square ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Square is a payments and point-of-sale platform from Block, Inc. that gives businesses hardware, software, and processing to accept payments, manage inventory, and run their operations.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free (pay-as-you-go processing fees apply)$q$, starting_price),
  founded_year = COALESCE(2009, founded_year),
  company_size = COALESCE($q$5,001-10,000 employees$q$, company_size),
  headquarters = COALESCE($q$Oakland, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Square Review 2026: POS Pricing and Processing Fees$q$, seo_title),
  seo_meta_description = COALESCE($q$Square pricing has a free plan plus Plus and Premium tiers from $49/month. Compare processing fees, features, pros and cons of Square POS.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Square is a payments and point-of-sale platform founded in 2009 by Jack Dorsey and Jim McKelvey, now operated by parent company Block, Inc., which is headquartered in Oakland, California and publicly traded on the NYSE under the ticker SQ. Square provides hardware readers and terminals, point-of-sale software, online checkout, invoicing, inventory management, payroll, and business banking tools aimed at small and mid-sized retailers, restaurants, and service businesses. Its pricing model is freemium and largely transaction-fee driven: the Free plan has no monthly subscription cost and charges 2.6 percent plus 15 cents per in-person transaction and 3.3 percent plus 30 cents per online transaction; Square Plus is 49 dollars per month per location and lowers in-person fees to 2.5 percent plus 15 cents and online fees to 2.9 percent plus 30 cents; and Square Premium is 149 dollars per month per location with the lowest fees at 2.4 percent plus 15 cents in-person. Manually keyed-in payments are charged 3.5 percent plus 15 cents across all plans. Businesses processing over 250,000 dollars per year can request custom pricing. Square is one of the most recognizable names in small business payments, competing with Toast, Clover, and Stripe Terminal, and its parent Block, Inc. also owns Cash App, Afterpay, and Tidal.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Point-of-Sale Software and Hardware$q$, $q$Card readers, terminals, and registers paired with POS software for retail, restaurant, and service businesses.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Online Store and Checkout$q$, $q$A free online store builder with integrated checkout that syncs inventory with in-person sales.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Inventory Management$q$, $q$Track stock levels, get low-stock alerts, and sync inventory across online and in-person sales channels.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Invoicing and Payment Links$q$, $q$Send digital invoices and shareable payment links for remote or service-based transactions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Payroll and Team Management$q$, $q$Run payroll, track employee hours, and manage permissions across staff accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Square Banking$q$, $q$Business banking tools including a business debit card, savings, and access to Square Loans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Appointments and Scheduling$q$, $q$Booking tools for service businesses to manage client appointments and reminders.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Analytics and Reporting$q$, $q$Built-in sales reporting and dashboards to track revenue, trends, and staff performance.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Free plan with no monthly subscription fee to get started$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Transparent, publicly listed processing rates with no long-term contract$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Wide ecosystem covering payments, payroll, banking, and inventory in one account$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Backed by a large public company (Block, Inc.) with continuous product investment$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Custom pricing available for high-volume merchants$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Per-transaction processing fees can be costly at high sales volume compared to negotiated merchant accounts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Monthly subscription required to unlock the lowest processing rates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Manually keyed payments carry the highest fee across all plans$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Block, Inc. underwent significant layoffs in 2026, which may affect support resourcing$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Some advanced features are gated behind Plus or Premium plans$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Is Square free to use$q$, $q$Yes, the Free plan has no monthly subscription cost; you only pay processing fees per transaction.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$What are Square's processing fees$q$, $q$In-person transactions are 2.6 percent plus 15 cents on the Free plan, dropping to 2.4 percent plus 15 cents on Premium; online transactions range from 3.3 percent plus 30 cents down to 2.9 percent plus 30 cents depending on plan.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Who owns Square$q$, $q$Square is a product line of Block, Inc., the publicly traded fintech company (NYSE: SQ) headquartered in Oakland, California.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$How much does Square Plus cost$q$, $q$Square Plus costs 49 dollars per month per location and lowers per-transaction processing rates compared to the Free plan.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Does Square offer custom pricing$q$, $q$Yes, businesses processing over 250,000 dollars per year can contact Square's sales team for custom processing rates.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Can Square be used for online sales$q$, $q$Yes, Square includes a free online store and checkout that syncs inventory with in-person sales.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Does Square require a long-term contract$q$, $q$No, Square has no locked-in contracts and merchants can cancel or switch plans at any time.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$When was Square founded$q$, $q$Square was founded in 2009 by Jack Dorsey and Jim McKelvey.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Retail point-of-sale$q$, $q$Small and mid-sized retailers use Square hardware and software to ring up sales, track inventory, and sync online and in-store stock.$q$, $q$Independent and small-chain retail businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Restaurant and food service payments$q$, $q$Restaurants and cafes use Square terminals and POS software to process in-person orders and manage staff and tips.$q$, $q$Restaurants, cafes, and food service businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Service business invoicing and booking$q$, $q$Service providers use Square Invoices and Appointments to bill clients and manage scheduling without in-person hardware.$q$, $q$Freelancers and service-based small businesses$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Free$q$, $q$$0/month$q$, $q$n/a$q$, NULL, $q$["No monthly subscription fee","2.6% + 15c per in-person transaction","3.3% + 30c per online transaction","Free online store"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Plus$q$, $q$$49/month per location$q$, $q$monthly$q$, NULL, $q$["2.5% + 15c per in-person transaction","2.9% + 30c per online transaction","Advanced inventory and reporting tools"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Premium$q$, $q$$149/month per location$q$, $q$monthly$q$, NULL, $q$["2.4% + 15c per in-person transaction","2.9% + 30c per online transaction","Lowest available processing rates"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$Custom$q$, $q$Custom$q$, $q$custom$q$, NULL, $q$["For businesses processing over $250,000 per year","Negotiated processing rates","Dedicated account support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '9aaf51c9-b792-42f0-8f4d-c00a00023f84';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$overview$q$, $q$What Is Square$q$, 2, ARRAY[$q$Square is a payments and point-of-sale platform that gives businesses the hardware and software to accept card payments in person and online, alongside tools for inventory, invoicing, payroll, and banking.$q$, $q$Founded in 2009 by Jack Dorsey and Jim McKelvey, Square's parent company rebranded to Block, Inc. in 2021 to reflect its expansion into Cash App, Afterpay, and other fintech products, though the Square brand and product line continue to operate under the Block umbrella from its Oakland, California headquarters.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$At its core, Square offers point-of-sale software paired with card readers and terminals for retail, restaurant, and service businesses, plus a free online store and checkout for e-commerce sales.$q$, $q$Beyond payments, Square offers inventory tracking, digital invoicing, appointment booking, payroll, team management, and Square Banking tools like business loans and a business debit card, all accessible from the same account.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9aaf51c9-b792-42f0-8f4d-c00a00023f84', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Square uses a freemium, transaction-fee-based pricing model: the Free plan has no monthly fee and charges 2.6 percent plus 15 cents per in-person transaction, while Square Plus (49 dollars per month per location) and Square Premium (149 dollars per month per location) lower per-transaction processing rates in exchange for the subscription fee.$q$, $q$Online transactions are charged 3.3 percent plus 30 cents on the Free plan, dropping to 2.9 percent plus 30 cents on Plus and Premium, and manually keyed payments are a flat 3.5 percent plus 15 cents across every plan. Businesses processing over 250,000 dollars annually can negotiate custom processing rates.$q$]::text[], 2);


-- ── Squarespace ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Squarespace is an all-in-one website builder that combines designer templates, hosting, e-commerce, and email marketing tools for individuals and small businesses to build and run a site.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$16/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2003, founded_year),
  company_size = COALESCE($q$1,001-5,000 employees$q$, company_size),
  headquarters = COALESCE($q$New York City, New York, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Squarespace Pricing and Plans Review 2026$q$, seo_title),
  seo_meta_description = COALESCE($q$Squarespace pricing starts at $16/month. Compare Basic, Core, Plus, and Advanced plans, features, pros and cons of this website builder.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Squarespace is an all-in-one website builder founded in 2003 by Anthony Casalena and headquartered in New York City, where it occupies a large office in Manhattan's West Village. It is designed for individuals, creators, and small to mid-sized businesses that want to build a professional website, online store, or portfolio without writing code, offering designer templates, a drag-and-drop editor, managed hosting, built-in SEO tools, and AI-assisted site building. Squarespace has grown to roughly 2,000 employees and trades similarly named but is entirely unrelated to the payments company Square. Pricing is subscription-based across four annually billed tiers: Basic at 16 dollars per month with a 2 percent commerce fee, Core at 23 dollars per month which waives commerce transaction fees and unlocks advanced sales tools, Plus at 39 dollars per month with lower payment processing rates for growing sellers, and Advanced at 99 dollars per month with the lowest processing rates and advanced developer and enterprise features. Every plan includes hosting, SSL security, mobile-optimized templates, SEO tools, and 24/7 customer support, and a 14-day free trial is available, though a paid plan is required to publish a site. Annual subscriptions include one year of free domain registration. Squarespace also offers built-in email marketing campaigns, member areas, and digital product sales, positioning it as a direct competitor to Wix, Webflow, and Shopify for site-building and light e-commerce use cases.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Drag-and-Drop Website Builder$q$, $q$Professionally designed templates combined with a visual editor for customizing layout, colors, and fonts without code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Built-In E-Commerce$q$, $q$Sell physical products, digital downloads, memberships, and courses with inventory and variant management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Email Marketing Campaigns$q$, $q$Design, schedule, and automate email campaigns using the same brand assets as the website.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$SEO Tools$q$, $q$Built-in SEO settings, clean URL structures, and automatic sitemap generation to help pages get indexed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$AI Website Builder$q$, $q$AI-assisted tools help generate initial site layouts, copy suggestions, and design choices during setup.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Squarespace Payments$q$, $q$Native payment processing supporting major cards and digital wallets with tiered processing rates by plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Member Areas and Digital Content$q$, $q$Gate content, courses, and community areas behind paid or free membership tiers.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Managed Hosting and Security$q$, $q$Unlimited bandwidth, SSL certificates, and cloud hosting included on every plan with no separate hosting purchase needed.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Polished, designer-quality templates out of the box$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$All-in-one pricing includes hosting, SSL, and support with no add-on hosting fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Built-in email marketing and e-commerce reduce the need for separate tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Transaction fees decrease or disappear on higher-tier plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$14-day free trial to test the editor before committing$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$A paid plan is required to publish a site; the free trial cannot go live$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Less design and code flexibility than developer-first builders like Webflow$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$E-commerce transaction fees still apply on the entry-level Basic plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Advanced e-commerce and developer features require the priciest Advanced plan$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Switching templates after launch can require substantial rebuilding$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$How much does Squarespace cost$q$, $q$Plans start at 16 dollars per month for Basic (billed annually) and go up to 99 dollars per month for the Advanced plan.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Does Squarespace have a free plan$q$, $q$No, but there is a 14-day free trial; a paid plan is required to publish a live site.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Which Squarespace plan removes transaction fees$q$, $q$The Core plan and above waive Squarespace's commerce transaction fees, while the Basic plan still charges a 2 percent fee on sales.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Is Squarespace good for e-commerce$q$, $q$Yes, Squarespace supports physical products, digital downloads, memberships, and courses, with lower payment processing rates on the Plus and Advanced plans.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Is Squarespace the same company as Square$q$, $q$No, Squarespace (website builder) and Square (payments and POS, part of Block, Inc.) are two completely unrelated companies despite the similar names.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Does Squarespace include email marketing$q$, $q$Yes, built-in email marketing campaigns with templates, scheduling, and segmentation are included on Squarespace plans.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Who founded Squarespace$q$, $q$Squarespace was founded in 2003 by Anthony Casalena while he was a student at the University of Maryland.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Does Squarespace offer a free domain$q$, $q$Yes, annual subscriptions include one year of free domain registration.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Portfolio and personal brand websites$q$, $q$Creators, photographers, and freelancers use designer templates to build a polished personal site without hiring a developer.$q$, $q$Freelancers, creators, and personal brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Small business online stores$q$, $q$Small retailers use built-in e-commerce, inventory, and payment tools to sell products directly from their website.$q$, $q$Small business owners and independent sellers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Membership and digital content sites$q$, $q$Coaches and educators use member areas and digital product sales to distribute paid courses and gated content.$q$, $q$Coaches, educators, and digital content creators$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Basic$q$, $q$$16/month$q$, $q$annual$q$, NULL, $q$["Designer templates and drag-and-drop editor","Managed hosting and SSL","2% commerce transaction fee","Basic SEO tools"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Core$q$, $q$$23/month$q$, $q$annual$q$, NULL, $q$["Waived commerce transaction fees","Advanced sales tools","Email marketing campaigns","More AI credits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Plus$q$, $q$$39/month$q$, $q$annual$q$, NULL, $q$["Lower payment processing rates (2.7% + $0.30)","Advanced e-commerce merchandising","Additional contributors","More video hosting"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$Advanced$q$, $q$$99/month$q$, $q$annual$q$, NULL, $q$["Lowest payment processing rates (2.5% + $0.30)","Advanced developer and enterprise tools","Unlimited contributors","Priority support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '1168ba68-cd18-49a6-8afd-132bb07a1cb0';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$overview$q$, $q$What Is Squarespace$q$, 2, ARRAY[$q$Squarespace is an all-in-one website builder that lets individuals and businesses design, host, and manage a website, online store, or portfolio without writing code.$q$, $q$Founded in 2003 by Anthony Casalena and headquartered in New York City, Squarespace has grown from a one-person blog hosting service into a major website builder with a large template library, built-in e-commerce, and AI-assisted design tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform's core is a drag-and-drop editor paired with professionally designed templates that adapt automatically to mobile devices, plus built-in SEO tools, managed hosting, and SSL security on every plan.$q$, $q$Higher tiers add e-commerce features like unlimited products with variants, lower or waived transaction fees, member areas and digital content sales, and built-in email marketing campaigns with segmentation and automation.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1168ba68-cd18-49a6-8afd-132bb07a1cb0', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Squarespace offers four annually billed plans: Basic at 16 dollars per month, Core at 23 dollars per month, Plus at 39 dollars per month, and Advanced at 99 dollars per month, with monthly billing available at a higher rate.$q$, $q$Commerce fees decrease as plans go up, from a 2 percent transaction fee on Basic down to 0 percent on higher tiers, and annual plans include one year of free domain registration along with a 14-day free trial to explore the editor before publishing.$q$]::text[], 2);



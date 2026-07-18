-- Enrichment marathon batch: Awardco, Awario, AWeber, AWS, AWStats, Axelor, Axiom, Azimutt

-- ── Awardco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Awardco is an employee recognition and rewards platform combining peer recognition, incentives, and a marketplace of over 300 million rewards to build workplace culture.$q$, short_description),
  pricing_model = COALESCE(NULL, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$600+ employees$q$, company_size),
  headquarters = COALESCE($q$Lindon, Utah, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Awardco: Employee Recognition & Rewards Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Awardco combines peer recognition, a global rewards marketplace, incentives, and AI-powered tools to help enterprises build employee engagement.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Awardco is an employee recognition and rewards platform founded in 2015 and headquartered in Lindon, Utah. The company was started by Steve Sonnenberg, Mike Sonnenberg, and Tanner Runia and has grown into one of the highest-rated employee recognition platforms on G2, with a 4.9-star rating across more than 6,000 reviews. Awardco lets organizations run peer-to-peer and manager-driven recognition programs, automate milestone celebrations such as birthdays and work anniversaries, and run custom incentive programs tied to business goals. Its core differentiator is a configurable rewards marketplace with more than 300 million reward options, powered by a direct partnership with Amazon Business that lets employees redeem points for real products near cost. The platform also includes Awardco Engage for employee surveys and feedback, and Awardco Intelligence, a set of AI-enhanced recognition features. Awardco integrates with HR systems including a bi-directional Workday sync, plus Slack and Microsoft Teams. It supports organizations operating in 135 countries and 163 currencies. Awardco is aimed at mid-market and enterprise HR and people teams looking to consolidate recognition, rewards, incentives, and benefits into a single platform; customers include ClickUp, Paramount, Cornell University, Zillow, and Okta. Detailed pricing is not published and requires contacting sales.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Peer & Manager Recognition$q$, $q$Tools for both peer-to-peer and manager-driven employee recognition.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Global Rewards Marketplace$q$, $q$Over 300 million reward options via a direct Amazon Business partnership, letting employees redeem points near cost.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Automated Celebrations$q$, $q$Automatically surfaces and celebrates milestones like birthdays and work anniversaries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Custom Incentive Programs$q$, $q$Configurable incentive programs tied to specific business or performance goals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Awardco Engage$q$, $q$Employee survey and feedback tools built into the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Awardco Intelligence$q$, $q$AI-enhanced features layered into recognition workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Workday Integration$q$, $q$Bi-directional data sync with Workday for HR data alignment.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Very high G2 rating (4.9/5 across 6,000+ reviews)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Massive reward catalog via Amazon Business partnership, redeemable near cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Broad global reach: 135 countries and 163 currencies supported$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Deep Workday integration for HR data sync$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Platform is enterprise-oriented, which may be more than small teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Breadth of bundled modules (recognition, surveys, incentives, benefits) can add a learning curve$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$What is Awardco used for?$q$, $q$Awardco is used by companies to run employee recognition, rewards, incentive, and benefits programs, along with employee feedback surveys, in one platform.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Does Awardco integrate with Workday?$q$, $q$Yes, Awardco offers a bi-directional data sync integration with Workday, along with integrations with Slack and Microsoft Teams.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$How does Awardco's rewards marketplace work?$q$, $q$Awardco partners directly with Amazon Business to offer a rewards catalog of over 300 million products that employees can redeem points for, near cost.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Is Awardco pricing public?$q$, $q$No, Awardco does not publish pricing on its website; prospective customers need to request a demo or contact sales for pricing.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Enterprise Recognition Programs$q$, $q$Running company-wide peer and manager recognition programs.$q$, $q$HR/People teams at large enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Performance Incentive Programs$q$, $q$Building custom incentive programs tied to sales or performance goals.$q$, $q$Sales operations and finance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$Benefits & Perks Consolidation$q$, $q$Combining recognition, rewards, and benefits administration into one system.$q$, $q$HR benefits administrators$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '4c2b396a-5709-4ddc-aa34-fdf730d1d4ac';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Awardco is an employee recognition and rewards platform founded in 2015 and headquartered in Lindon, Utah. It positions itself as a 'culture engine' that unifies recognition, rewards, incentives, benefits, and employee feedback into one system.$q$, $q$The platform is rated 4.9 out of 5 stars across more than 6,000 reviews on G2, and Awardco lists enterprise customers such as ClickUp, Paramount, Cornell University, Zillow, and Okta.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Awardco supports peer-to-peer and manager recognition, automated milestone and anniversary celebrations, and custom incentive programs tied to business goals.$q$, $q$Its rewards marketplace offers more than 300 million options through a direct partnership with Amazon Business. Awardco Engage adds employee survey and feedback tools, while Awardco Intelligence layers AI into recognition workflows.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Awardco integrates with Workday through a bi-directional data sync, and connects with Slack and Microsoft Teams so recognition can happen inside tools employees already use.$q$, $q$The platform supports organizations operating across 135 countries and 163 currencies, with multilingual capabilities for global teams.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Awardco is built for mid-market and enterprise HR and people teams that want to consolidate recognition, rewards, incentives, and benefits programs into a single platform rather than running separate point solutions.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4c2b396a-5709-4ddc-aa34-fdf730d1d4ac', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Awario ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Awario is a social listening and brand monitoring tool that tracks mentions of brands, competitors, and keywords across social media, news, blogs, and the web in real time.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$€29/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Cyprus$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Dutch$q$, $q$Japanese$q$]::text[],
  seo_title = COALESCE($q$Awario: Social Listening & Brand Monitoring Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Awario monitors brand, competitor, and keyword mentions across social media, news, and the web, with sentiment analysis, Boolean search, and reporting.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Awario is a social listening and brand monitoring platform founded in 2015. It tracks mentions of brands, products, competitors, and custom keywords across X (Twitter), Facebook, Instagram, Reddit, YouTube, Vimeo, blogs, forums, news sites, and the wider web, scanning more than 13 billion web pages daily. Awario offers sentiment analysis, Boolean and advanced search operators, location-based filtering, topic cloud visualization, and white-label PDF reporting, along with a Slack integration and a social listening API for pulling mention data into other tools. The product is aimed at PR and reputation management professionals, SEO specialists, marketing and social media teams, e-commerce businesses, and agencies that need to monitor brand sentiment, track competitors, and surface sales leads or influencer opportunities in real time. Awario runs on a subscription model with three published tiers -- Starter, Pro, and Enterprise -- priced by number of tracked topics, monthly mention volume, and team seats, plus a free trial to test the product before committing. All paid plans include Boolean search, data export, PDF and white-label reporting, and API access; higher tiers unlock more topics, higher mention volume, more stored mentions, and more team members. Awario also offers discounted programs for nonprofits and educational institutions. The interface is available in multiple languages, including English, Spanish, French, German, Dutch, and Japanese.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5c850061-a601-4133-8e98-e91d2b6054af';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5c850061-a601-4133-8e98-e91d2b6054af' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Real-Time Mention Monitoring$q$, $q$Scans over 13 billion web pages daily plus social platforms for brand and keyword mentions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Sentiment Analysis$q$, $q$Automatically classifies mentions by sentiment to gauge brand perception.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Boolean/Advanced Search$q$, $q$Precise query building using Boolean operators to filter relevant mentions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Social Listening Dashboards & Reports$q$, $q$Dashboards plus exportable, white-label PDF reports.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Topic Cloud Visualization$q$, $q$Visualizes trending topics and terms associated with monitored keywords.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Slack Integration & API Access$q$, $q$Pushes alerts into Slack and offers API access to mention data on all paid plans.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Broad source coverage combining social media, web, and news in one tool$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Boolean search enables precise, noise-free monitoring queries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$White-label reporting is useful for agencies serving clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$API access included on every paid tier$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$No permanent free plan, only a free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Pricing is shown in EUR, which may require conversion for other markets$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Feature depth versus larger competitors like Brandwatch is not independently verifiable from the website alone$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$What is Awario used for?$q$, $q$Awario is used for brand monitoring, social listening, competitor tracking, and finding sales or influencer leads by tracking mentions across social media and the web.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Does Awario offer a free plan?$q$, $q$Awario does not offer a permanent free plan, but it does offer a free trial on its paid subscription tiers.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$What social platforms does Awario monitor?$q$, $q$Awario monitors X (Twitter), Facebook, Instagram, Reddit, YouTube, Vimeo, blogs, forums, news sites, and general web content.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Does Awario have an API?$q$, $q$Yes, Awario includes API access on all of its paid plans, including the entry-level Starter plan.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Brand & Reputation Monitoring$q$, $q$Tracking what's being said about a brand across the web and social media.$q$, $q$PR and communications teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Competitor Tracking$q$, $q$Monitoring competitor mentions and market sentiment.$q$, $q$Marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Social Selling & Lead Generation$q$, $q$Finding relevant conversations to identify sales or partnership opportunities.$q$, $q$Sales teams and agencies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Starter$q$, $q$€29/mo (billed annually) or €49/mo billed monthly$q$, $q$monthly or annual$q$, NULL, $q$["3 topics","Unlimited keywords per topic","30,000 new mentions/month","5,000 stored mentions per topic","1 team member","Boolean search, data export, PDF/white-label reports, API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Pro$q$, $q$€89/mo (billed annually) or €149/mo billed monthly$q$, $q$monthly or annual$q$, NULL, $q$["15 topics","Unlimited keywords per topic","300,000 new mentions/month","15,000 stored mentions per topic","10 team members"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$Enterprise$q$, $q$€249/mo (billed annually) or €399/mo billed monthly$q$, $q$monthly or annual$q$, NULL, $q$["100 topics","Unlimited keywords per topic","1,000,000 new mentions/month","50,000 stored mentions per topic","Unlimited team members"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '5c850061-a601-4133-8e98-e91d2b6054af';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Awario is a social listening and brand monitoring platform founded in 2015 and based in Cyprus. It scans over 13 billion web pages daily plus API data to surface mentions of brands, competitors, and custom keywords.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Awario monitors X (Twitter), Facebook, Instagram, Reddit, YouTube, Vimeo, blogs, forums, news sites, and general web content, with sentiment analysis and Boolean/advanced search for precise queries.$q$, $q$Additional features include location-based monitoring, topic cloud visualization, white-label PDF reporting, a Slack integration, and a social listening API.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Awario is subscription-based across three published tiers -- Starter, Pro, and Enterprise -- differentiated by tracked topics, monthly mention volume, stored mentions, and team seats, with all paid tiers including Boolean search, data export, and API access. There is no permanent free plan, but a free trial is available.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Awario is used by PR and reputation management professionals, SEO specialists, marketing teams, e-commerce businesses, and agencies, with special discounted programs for nonprofits and educational institutions.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c850061-a601-4133-8e98-e91d2b6054af', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── AWeber ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AWeber is an email marketing and automation platform for small businesses, offering email campaigns, landing pages, sign-up forms, and AI writing tools.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$12.49/month (billed annually)$q$, starting_price),
  founded_year = COALESCE(1998, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Chalfont, Pennsylvania, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AWeber: Email Marketing & Automation for Small Business$q$, seo_title),
  seo_meta_description = COALESCE($q$AWeber offers email campaigns, automation, landing pages, and AI writing tools for small businesses, with plans starting at $12.49/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AWeber is an email marketing and automation platform founded in 1998 and originally headquartered in Chalfont, Pennsylvania; the company transitioned to a remote-first workforce in 2020. AWeber is built for small businesses, solopreneurs, and entrepreneurs who want to build email lists, send newsletters and campaigns, and automate follow-up sequences. Core features include a drag-and-drop email and landing page builder, customizable sign-up forms, an AI writing and subject-line assistant, e-commerce and payment tools for selling products directly through email, and web push notifications. AWeber connects with more than 750 third-party tools and platforms, including PayPal, Shopify, WordPress, Facebook, and Zapier, and offers dedicated automations for platforms like Etsy. Pricing is subscription-based and scales with subscriber list size (from 500 up to 150,000+ subscribers, with custom pricing above that): the Lite plan starts at $12.49/month billed annually and includes one email list, three landing pages, and three email automations, while the Plus plan starts at $19.99/month billed annually and removes subscriber/list limits along with AWeber branding, adding priority 24/7 support. A Done-For-You plan, starting at $20/month plus a $79 one-time setup fee, includes expert-built emails, landing pages, and workflows delivered within 7 days. All plans include a 14-day free trial.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Email Campaigns & Newsletters$q$, $q$Create and send email campaigns and newsletters to subscriber lists.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Email Automation$q$, $q$Automated follow-up sequences and workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Landing Page Builder$q$, $q$Drag-and-drop builder for creating landing pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Sign-Up Forms$q$, $q$Customizable forms for capturing subscribers on websites.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$AI Writing & Subject Line Assistant$q$, $q$AI tools to help draft email copy and subject lines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$E-commerce & Payments$q$, $q$Sell products and process payments directly through email.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$750+ Integrations$q$, $q$Connects with tools including PayPal, Shopify, WordPress, Facebook, and Zapier.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Long track record (founded 1998) with a mature, stable feature set$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$AI writing assistance included in paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Large integration library (750+ tools)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Transparent tiered pricing based on subscriber count$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Pricing scales up as subscriber lists grow, which can get costly at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Lite plan restricts lists, landing pages, and automations to three each$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Advanced marketing-automation depth may lag newer, automation-first platforms$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Does AWeber offer a free trial?$q$, $q$Yes, AWeber offers a 14-day free trial on its Lite and Plus plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$How is AWeber priced?$q$, $q$AWeber uses tiered subscription pricing that scales with subscriber list size, starting at $12.49/month billed annually for the Lite plan.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$What is the Done-For-You plan?$q$, $q$It's an AWeber service starting at $20/month plus a $79 one-time setup fee where AWeber's team builds emails, landing pages, and workflows for the customer.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Does AWeber include AI tools?$q$, $q$Yes, AWeber includes an AI writing and subject-line assistant to help create email content.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Small Business Email Newsletters$q$, $q$Sending regular newsletters and promotions to a customer list.$q$, $q$Small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Automated Follow-Up Sequences$q$, $q$Building automated welcome and nurture sequences for new subscribers.$q$, $q$Solopreneurs and content creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$E-commerce Email & Payments$q$, $q$Selling products and collecting payments directly through email campaigns.$q$, $q$Online sellers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Lite$q$, $q$$12.49/month$q$, $q$billed annually (higher if billed monthly)$q$, NULL, $q$["1 email list","3 landing pages","3 email automations","3 users","Basic analytics","Scales with subscriber count"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Plus$q$, $q$$19.99/month$q$, $q$billed annually (higher if billed monthly)$q$, NULL, $q$["Unlimited lists, landing pages, automations, and users","Advanced analytics","Priority 24/7 support","AWeber branding removed"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$Done For You$q$, $q$$20/month + $79 one-time setup fee$q$, $q$monthly + one-time setup$q$, NULL, $q$["Expert setup within 7 days","All Plus plan features","30 days of unlimited edits","Professional templates and weekly newsletter drafts"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AWeber is an email marketing and automation platform founded in 1998, one of the longer-running email marketing tools still active today. It was originally headquartered in Chalfont, Pennsylvania and became a remote-first company in 2020.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AWeber provides email campaign creation, automation sequences, a landing page builder, and customizable sign-up forms for websites.$q$, $q$It also includes an AI writing and subject-line assistant, e-commerce tools with payment processing, and web push notifications.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$AWeber's Lite plan starts at $12.49/month billed annually with limited lists, landing pages, and automations. The Plus plan starts at $19.99/month billed annually and removes those limits plus AWeber branding. A Done-For-You service starts at $20/month plus a $79 setup fee for expert-built campaigns. All plans include a 14-day free trial and pricing scales with subscriber count.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AWeber is aimed at small businesses, solopreneurs, and entrepreneurs seeking an affordable, full-featured email marketing solution, with more than 750 integrations including PayPal, Shopify, WordPress, and Zapier.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a33e3f3c-6c06-46f7-81a5-f47a7ab9dc18', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── AWS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AWS (Amazon Web Services) is Amazon's cloud computing platform, offering compute, storage, database, networking, and AI/ML services on a pay-as-you-go basis.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based$q$, pricing_model),
  starting_price = COALESCE($q$Free tier available$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Seattle, Washington, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AWS: Amazon's Cloud Computing Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$AWS offers 240+ pay-as-you-go cloud services spanning compute, storage, databases, networking, and AI/ML across a global infrastructure.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Amazon Web Services (AWS) is Amazon's cloud computing platform, launched in 2006 and headquartered in Seattle, Washington as part of Amazon.com. AWS provides more than 240 cloud services covering compute (EC2), storage (S3), databases (RDS and others), networking, and artificial intelligence and machine learning tools such as SageMaker and Bedrock, along with specialized offerings like Amazon Connect for customer service applications. The platform runs on a global infrastructure of 123 Availability Zones across 39 geographic regions, with additional regions announced for markets including Saudi Arabia and Chile. AWS uses a usage-based, pay-as-you-go pricing model, meaning customers pay only for the specific resources and compute time they consume, and it offers a free tier for new users to try core services at no cost. AWS serves organizations of every size, from individual developers and startups to large global enterprises, across industries including manufacturing, automotive, travel, hospitality, and retail. Developers can build on AWS using SDKs and tools for languages such as .NET, Python, Java, PHP, and JavaScript. As the largest and one of the earliest major public cloud providers, AWS is commonly used for hosting applications, running data workloads, training and deploying AI models, and building scalable, globally distributed infrastructure.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '37230cac-8680-4f59-8fa6-d34a5321ea4d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Compute (EC2 and serverless options)$q$, $q$Virtual servers and serverless compute for running applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Storage (S3 and related services)$q$, $q$Scalable object storage and related storage services.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Managed Databases (RDS)$q$, $q$Managed relational and other database services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$AI & Machine Learning (SageMaker, Bedrock)$q$, $q$Tools for building, training, and deploying AI/ML models.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Global Infrastructure$q$, $q$123 Availability Zones across 39 geographic regions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$240+ Cloud Services$q$, $q$A comprehensive catalog spanning compute, storage, networking, security, and more.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Extremely broad service catalog covering nearly every infrastructure need$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Mature, extensive global infrastructure footprint$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Free tier available for experimentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Pay-as-you-go pricing avoids upfront hardware investment$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Usage-based billing can be complex to predict and optimize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Breadth of 240+ services creates a steep learning curve$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Data egress and transfer costs can add up for high-traffic workloads$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$What is AWS used for?$q$, $q$AWS is used for hosting applications, storing data, running databases, and building and deploying AI/ML models on cloud infrastructure.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Does AWS have a free tier?$q$, $q$Yes, AWS offers a free tier that lets new users try core services at no cost within certain usage limits.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$How is AWS priced?$q$, $q$AWS uses usage-based, pay-as-you-go pricing, charging customers based on the specific resources and compute time they consume.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Who is AWS for?$q$, $q$AWS is used by organizations of all sizes, from individual developers and startups to large global enterprises across many industries.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Hosting Web Applications & APIs$q$, $q$Running scalable applications and backend services in the cloud.$q$, $q$Developers and startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$Enterprise Infrastructure Migration$q$, $q$Moving on-premises infrastructure and workloads to the cloud.$q$, $q$IT and operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$AI/ML Model Training & Deployment$q$, $q$Training and deploying machine learning models using managed AI services.$q$, $q$Data science teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '37230cac-8680-4f59-8fa6-d34a5321ea4d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AWS (Amazon Web Services) is Amazon's cloud computing platform, launched in 2006 and headquartered in Seattle, Washington. It offers over 240 services across compute, storage, databases, networking, and AI/ML.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core services include EC2 for compute, S3 for storage, and RDS for managed databases, alongside AI/ML tools such as SageMaker and Bedrock and specialized offerings like Amazon Connect.$q$, $q$AWS runs on a global infrastructure of 123 Availability Zones across 39 geographic regions, with new regions continuing to be added.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$AWS uses usage-based, pay-as-you-go pricing across its services, with a free tier available for new users to try core services without upfront cost.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AWS serves organizations of every size, from individual developers and startups to large global enterprises, across industries including manufacturing, automotive, travel, hospitality, and retail.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('37230cac-8680-4f59-8fa6-d34a5321ea4d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── AWStats ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AWStats is a free, open-source log file analyzer that generates detailed traffic and usage statistics for web, streaming, FTP, and mail servers.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2000, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AWStats: Free Open-Source Log File Analyzer$q$, seo_title),
  seo_meta_description = COALESCE($q$AWStats is a free, GPL-licensed log analyzer that turns web, FTP, and mail server logs into detailed traffic and visitor statistics.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AWStats is a free, open-source log file analyzer originally created by Laurent Destailleur, first released in 2000. It generates advanced graphical statistics from server log files for web, streaming, FTP, and mail servers, and can run either as a CGI script or from the command line. AWStats reports on unique visitors, visit duration, authenticated users, traffic broken down by day and hour, traffic by domain and country, most-viewed and entry/exit pages, browser and operating system detection (recognizing 97+ browsers and 35+ operating systems), robot and worm/attack detection, search engine and keyword referral tracking, and HTTP error rates. It supports common log formats including Apache NCSA/Combined Log Format, IIS W3C, and WebStar, and can incorporate GeoIP data for location-based reporting. AWStats is distributed under the GNU General Public License, making it free to use, modify, and redistribute, including for commercial web hosting. It requires a Perl 5 interpreter (5.007003 or later) with CGI support and access to server log files, and runs on any platform where Perl is available, including Windows and Unix/Linux. Version 8.0, released in 2025, was announced by the original author as the final version he personally maintains, with users pointed toward Matomo as an actively maintained alternative for ongoing analytics needs. AWStats remains widely used by website owners, sysadmins, and hosting providers who want self-hosted, no-cost log analytics without sending data to a third party.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '675b4134-c6dd-4c7a-8480-7fcb63af924a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Traffic & Visitor Statistics$q$, $q$Reports on unique visitors, visit duration, and page views.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Browser/OS Detection$q$, $q$Identifies 97+ browsers and 35+ operating systems from log data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Robot & Attack Detection$q$, $q$Flags robot traffic and worm/attack activity in logs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Multiple Log Format Support$q$, $q$Supports Apache NCSA/CLF, IIS W3C, and WebStar log formats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$GeoIP Location Reporting$q$, $q$Adds geographic location data to traffic reports using GeoIP.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$CGI or Command-Line Operation$q$, $q$Can run as a CGI script for web-based reports or from the command line.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Completely free and open source under the GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Self-hosted, so no traffic data is sent to a third party$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Supports multiple server log formats out of the box$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Lightweight, Perl-based tool that runs on modest hardware$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$The original author has stated no further versions will be personally released$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Requires manual setup of Perl and CGI rather than a hosted dashboard$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Interface is dated compared to modern analytics tools$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Is AWStats free?$q$, $q$Yes, AWStats is free and open source, distributed under the GNU General Public License, including for commercial use.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Is AWStats still maintained?$q$, $q$Version 8.0, released in 2025, was announced as the last version the original author will personally maintain; the project points users toward Matomo as an actively maintained alternative.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$What log formats does AWStats support?$q$, $q$AWStats supports Apache NCSA/Combined Log Format, IIS W3C, and WebStar log formats, among others.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$What are alternatives to AWStats?$q$, $q$The AWStats project itself recommends Matomo as an actively maintained alternative for ongoing web analytics.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Self-Hosted Website Traffic Analysis$q$, $q$Generating traffic and visitor statistics directly from server logs without third-party tracking.$q$, $q$Sysadmins and webmasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Web Hosting Provider Statistics$q$, $q$Offering log-based traffic statistics to hosting customers.$q$, $q$Web hosting companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$Server Log Auditing$q$, $q$Reviewing HTTP errors, robot traffic, and access patterns from raw logs.$q$, $q$IT and security teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '675b4134-c6dd-4c7a-8480-7fcb63af924a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AWStats is a free, open-source log file analyzer created by Laurent Destailleur and first released in 2000. It generates advanced graphical statistics from web, streaming, FTP, and mail server logs, running as either a CGI script or from the command line.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AWStats reports on unique visitors, visit duration, traffic by day/hour and by domain/country, and the most-viewed and entry/exit pages, along with browser and OS detection covering 97+ browsers and 35+ operating systems.$q$, $q$It also detects robots and worm/attack traffic, tracks search engine referrals and keywords, reports HTTP errors, and supports GeoIP-based location reporting across multiple log formats including Apache NCSA/CLF, IIS W3C, and WebStar.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$AWStats is distributed under the GNU General Public License and is used by sysadmins, webmasters, and hosting providers who want free, self-hosted log analytics without sending data to a third party. It requires a Perl 5 interpreter with CGI support and runs on Windows, Unix, and Linux.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('675b4134-c6dd-4c7a-8480-7fcb63af924a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Axelor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Axelor is an open-source, low-code ERP and CRM suite that unifies business applications, workflow automation, and BI/analytics on one platform.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source) + paid Pro/Enterprise plans$q$, pricing_model),
  starting_price = COALESCE($q$Free (Community edition)$q$, starting_price),
  founded_year = COALESCE(2005, founded_year),
  company_size = COALESCE($q$100+ employees$q$, company_size),
  headquarters = COALESCE($q$Paris, France$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_title = COALESCE($q$Axelor: Open-Source Low-Code ERP & CRM Suite$q$, seo_title),
  seo_meta_description = COALESCE($q$Axelor is an open-source ERP/CRM suite with low-code customization, workflow automation, and BI, used by SMEs and large enterprises.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Axelor is an open-source business application suite founded in 2005 and headquartered in Paris, France, employing over 100 people across offices on multiple continents. It unifies ERP, CRM, business process management (BPM), business intelligence, and web portals into a single low-code/no-code platform, and includes more than 50 pre-built business applications covering accounting, sales, procurement, production, HR, and project management. Axelor Studio provides a drag-and-drop interface for customizing applications without writing code, and its no-code BPM tools let users automate business processes in a few clicks. The platform includes interactive BI dashboards and reports, and Axelor Connect offers integration with more than 2,000 third-party applications through over 1,500 pre-built connectors. Axelor also supports AI provider integrations, including OpenAI, Mistral, Anthropic, and Google. The Community edition is free and open source; commercial Pro and Enterprise editions add a commercial license, additional modules (electronic invoicing, advanced BI, CAS/SSO, indexed search, an integrated AI module), and standard or priority support, with minimum seat counts and pricing available on request. Axelor serves small and mid-sized businesses up to large enterprises, with over 1 million users and customers including Trenitalia, Thyssenkrupp, Stellantis, Cdiscount, and ArcelorMittal, across manufacturing, professional services, construction, public sector, and e-commerce/distribution.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Axelor Studio$q$, $q$Low-code/no-code drag-and-drop interface for customizing business applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$No-Code BPM$q$, $q$Automates business processes and workflows without coding.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Business Intelligence & Dashboards$q$, $q$Interactive reports and dashboards for data analysis.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Axelor Connect$q$, $q$Integration with 2,000+ applications through 1,500+ pre-built connectors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$AI Provider Integrations$q$, $q$Supports OpenAI, Mistral, Anthropic, and Google AI providers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$50+ Business Applications$q$, $q$Pre-built modules for accounting, sales, procurement, production, HR, and more.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Free, open-source Community edition available$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Low-code customization reduces need for custom development$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Broad module coverage combining ERP, CRM, BPM, and BI in one suite$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Large integration ecosystem with 1,500+ connectors$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Full pricing for Pro/Enterprise editions is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Pro and Enterprise tiers require minimum user counts (10 and 20 respectively)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Breadth of modules can mean a longer implementation and setup process$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Is Axelor free?$q$, $q$Yes, Axelor offers a free, open-source Community edition; Pro and Enterprise editions are commercial and require contacting sales for pricing.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$What's the difference between Axelor Community, Pro, and Enterprise?$q$, $q$Community is free and open source with essential modules; Pro (10+ users) adds a commercial license and all business modules; Enterprise (20+ users) adds CAS/SSO, advanced BI, and an integrated AI module.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Does Axelor integrate with other software?$q$, $q$Yes, Axelor Connect provides integration with over 2,000 applications through more than 1,500 pre-built connectors.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Who uses Axelor?$q$, $q$Axelor is used by SMEs and large enterprises across manufacturing, professional services, construction, public sector, and e-commerce, including customers like Trenitalia and Stellantis.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Unified ERP/CRM for Growing Businesses$q$, $q$Consolidating sales, accounting, and operations into one platform.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Low-Code Process Automation$q$, $q$Automating internal workflows without custom development.$q$, $q$Operations and IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Enterprise Resource Planning at Scale$q$, $q$Running large-scale ERP operations across multiple business units.$q$, $q$Large enterprises and public sector organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Community$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Access to the open-source platform","Essential modules included","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Pro$q$, $q$Contact for pricing$q$, $q$Annual or monthly$q$, NULL, $q$["Minimum 10 users","Commercial license","All business modules","Electronic invoices","Standard support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$Enterprise$q$, $q$Contact for pricing$q$, $q$Annual or monthly$q$, NULL, $q$["Minimum 20 users","Everything in Pro","CAS/SSO","Advanced BI","Integrated AI module","Priority support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'e0159edf-c1a0-4793-86d2-5849a29d5b23';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Axelor is an open-source business application suite founded in 2005 and headquartered in Paris, France, with over 100 employees across offices on multiple continents. It combines ERP, CRM, BPM, BI, and web portals into a single low-code/no-code platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Axelor Studio offers a drag-and-drop interface for customizing applications without code, and its no-code BPM tools automate business processes in a few clicks.$q$, $q$The platform includes over 50 pre-built business applications spanning accounting, sales, procurement, production, HR, and project management, plus interactive BI dashboards and reports.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$The Community edition is free and open source with essential modules and community support. Pro (10+ users) and Enterprise (20+ users) editions add a commercial license, more modules, and support, with pricing available on request.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Axelor Connect integrates with more than 2,000 third-party applications through over 1,500 pre-built connectors, and the platform supports AI provider integrations including OpenAI, Mistral, Anthropic, and Google.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Axelor serves organizations from SMEs to large enterprises, with over 1 million users and customers including Trenitalia, Thyssenkrupp, Stellantis, Cdiscount, and ArcelorMittal across manufacturing, professional services, construction, public sector, and e-commerce.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0159edf-c1a0-4793-86d2-5849a29d5b23', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Axiom ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Axiom is a fully managed, usage-based observability platform for ingesting and querying logs, traces, metrics, and events at scale.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based (free tier + paid plans)$q$, pricing_model),
  starting_price = COALESCE($q$Free (Personal plan)$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Axiom: Usage-Based Observability & Log Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Axiom is a managed observability platform for logs, traces, metrics, and events, with schema-less ingest and usage-based pricing.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Axiom is a fully managed observability platform headquartered in San Francisco, California, built for ingesting and querying machine-generated data such as logs, metrics, traces, and events at petabyte scale without customers managing their own infrastructure. Its core architecture uses schema-less ingest with over 95% compression on a managed event store, avoiding the indexing overhead of traditional systems in favor of a schema-on-read approach. Axiom offers its own piped query language called APL (Axiom Processing Language), designed to feel familiar to Splunk users, plus a dedicated Metrics Processing Language (MPL) for metrics queries. The platform is positioned as AI-native, with native support for the Model Context Protocol (MCP) so AI agents can query observability data directly. Axiom integrates with OpenTelemetry, Vector, Fluent Bit, and Kinesis Firehose for data ingestion, and offers a Splunk App that lets teams query Axiom data from within Splunk, easing migration. It also connects to common infrastructure sources including GitHub, Vercel, Cloudflare, Kubernetes, Lambda, PostgreSQL, Redis, and Kafka. Pricing is usage-based: a permanent free Personal plan includes 500 GB/month of data loading, 10 GB-hours/month of query compute, and 25 GB of storage with 30-day retention; the Axiom Cloud plan starts at a $25/month platform fee plus metered charges for data loading and query compute beyond an included allowance, with optional enterprise add-ons like SSO, RBAC, audit logs, and directory sync available for additional monthly fees. Axiom is used by engineering, DevOps, and SRE teams, including companies like Cal.com, Asana, Framer, and Convex.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '61ccc648-9278-4f3b-87f3-026966a4a47f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '61ccc648-9278-4f3b-87f3-026966a4a47f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Schema-less Ingest$q$, $q$High-compression, schema-on-read ingest that avoids traditional indexing overhead.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$APL Query Language$q$, $q$A piped query language for logs and events, designed to feel familiar to Splunk users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$MPL Metrics Query Language$q$, $q$A dedicated query language for metrics data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$AI-Native / MCP Server Support$q$, $q$Native Model Context Protocol support so AI agents can query observability data directly.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Splunk App$q$, $q$Lets teams query Axiom data from within Splunk to ease migration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Broad Integrations$q$, $q$Connects with OpenTelemetry, Vector, Fluent Bit, Kinesis Firehose, GitHub, Vercel, Cloudflare, Kubernetes, and more.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Generous permanent free tier for data loading, compute, and storage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Usage-based pricing with automatic volume discounts avoids rigid SKU tiers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Native AI agent (MCP) support for querying observability data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Splunk App eases migration without a full rip-and-replace$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Exact founding year and company size are not publicly confirmed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Enterprise features like SSO, RBAC, and audit logs are unbundled add-ons with extra monthly fees$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Usage-based billing requires active monitoring to avoid unexpected costs at scale$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$What is Axiom used for?$q$, $q$Axiom is used to ingest, store, and query logs, traces, metrics, and events for observability at scale, without managing your own infrastructure.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Does Axiom have a free plan?$q$, $q$Yes, Axiom offers a permanent free Personal plan with 500 GB/month of data loading, 10 GB-hours/month of query compute, and 25 GB of storage.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$How is Axiom priced?$q$, $q$Axiom uses usage-based pricing with automatic volume discounts; the Axiom Cloud plan starts at a $25/month platform fee plus metered usage beyond included allowances.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Does Axiom support AI agents?$q$, $q$Yes, Axiom is AI-native and includes native Model Context Protocol (MCP) server support so AI agents can query observability data directly.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Centralized Observability$q$, $q$Consolidating logs, traces, and metrics into a single managed platform.$q$, $q$DevOps and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Splunk Migration$q$, $q$Moving off self-managed Splunk infrastructure while keeping familiar query patterns.$q$, $q$Enterprises migrating from Splunk$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$AI Agent-Driven Data Querying$q$, $q$Letting AI agents query observability data directly via MCP.$q$, $q$AI/ML engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Personal$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["500 GB/month data loading","10 GB-hours/month query compute","25 GB storage","30-day retention","Full APL access","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$Axiom Cloud$q$, $q$$25/month platform fee + usage$q$, $q$monthly$q$, NULL, $q$["1 TB/month included data loading","100 GB-hours/month included query compute","100 GB included storage","Configurable retention","Self-serve enterprise add-ons available"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = '61ccc648-9278-4f3b-87f3-026966a4a47f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Axiom is a fully managed observability platform headquartered in San Francisco, California, designed for ingesting and querying logs, metrics, traces, and events at petabyte scale without customers managing their own infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Axiom uses schema-less ingest with over 95% compression and a schema-on-read architecture, avoiding traditional indexing overhead. It offers APL (Axiom Processing Language) for logs and events and MPL (Metrics Processing Language) for metrics queries.$q$, $q$The platform is AI-native, with native Model Context Protocol (MCP) server support so AI agents can query observability data directly, and it provides a Splunk App for querying Axiom data from within Splunk.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Axiom offers a permanent free Personal plan (500 GB/month data loading, 10 GB-hours/month query compute, 25 GB storage, 30-day retention) and an Axiom Cloud plan starting at a $25/month platform fee plus usage-based charges beyond included allowances. Enterprise add-ons like SSO, RBAC, audit logs, and directory sync are available for additional monthly fees.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Axiom integrates with OpenTelemetry, Vector, Fluent Bit, and Kinesis Firehose for ingestion, and connects to sources including GitHub, Vercel, Cloudflare, Kubernetes, Lambda, PostgreSQL, Redis, and Kafka.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('61ccc648-9278-4f3b-87f3-026966a4a47f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Azimutt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Azimutt is a database exploration, documentation, and design tool that generates interactive entity-relationship diagrams and analyzes database schemas.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Azimutt: Database Explorer & ERD Design Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Azimutt visualizes, documents, and analyzes databases with interactive ERDs, schema linting, and AI-assisted SQL exploration.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Azimutt is a database exploration, documentation, and design tool co-founded by Loic Knuchel and made and hosted in the EU. It helps developers, database administrators, architects, and data analysts understand and work with complex databases through interactive entity-relationship diagrams (ERDs) that scale to large schemas, with customizable display options. Azimutt includes AML, a minimal domain-specific language for quickly designing or sketching database schemas, along with database linting to flag structural inconsistencies, path-finding between tables, and data exploration features that let users follow relations and generate SQL with AI assistance. It supports documentation directly on the schema, including table and column notes and saved layouts, and allows sharing or embedding diagrams. Azimutt connects to a wide range of databases and platforms, including PostgreSQL, MySQL, SQL Server, Oracle, and MongoDB, as well as cloud database services such as AWS RDS/Aurora, Azure SQL/Cosmos DB, Google Cloud SQL, BigQuery, and Snowflake, and offers a VS Code extension, a Chrome extension, a Heroku add-on, and a CLI/npm package. Azimutt runs on a freemium model: a Free plan allows unlimited tables and basic schema/data exploration; the Solo plan (€7/month, billed annually) adds database design and schema export; the Team plan (€35/user/month, billed annually) adds collaboration, documentation, and AI features; and a custom Enterprise plan adds unlimited usage, SSO, on-premise support, and dedicated consulting. It is aimed at engineering teams and individual developers who need to visualize, document, and safely evolve complex or legacy database schemas.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4b8c7210-2173-4e7a-95b0-7458564b09fd' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Interactive ERDs at Scale$q$, $q$Entity-relationship diagrams that scale to large, complex database schemas.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$AML Schema Design Language$q$, $q$A minimal DSL for quickly designing or sketching database schemas.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Database Linting$q$, $q$Analysis rules that identify structural inconsistencies in a schema.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$AI-Assisted SQL Exploration$q$, $q$AI-generated SQL to help explore and follow data relationships.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Path Finding Between Tables$q$, $q$Finds relationship paths between tables in a schema.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Broad Database & Cloud Support$q$, $q$Connects to PostgreSQL, MySQL, SQL Server, Oracle, MongoDB, and major cloud database platforms.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Generous free plan with unlimited tables$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Supports a wide range of relational and cloud databases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$AI-assisted exploration speeds up understanding unfamiliar schemas$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Available as VS Code and Chrome extensions plus a CLI for developer workflows$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Founding year, company size, and precise headquarters are not publicly disclosed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Collaboration features are gated behind the paid Team tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Per-user Team pricing can add up for larger teams$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Is Azimutt free to use?$q$, $q$Yes, Azimutt has a Free plan with unlimited tables and basic schema and data exploration; paid Solo, Team, and Enterprise plans add more features.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$What databases does Azimutt support?$q$, $q$Azimutt supports PostgreSQL, MySQL, SQL Server, Oracle, MongoDB, and cloud database platforms including AWS RDS/Aurora, Azure SQL/Cosmos DB, Google Cloud SQL, BigQuery, and Snowflake.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Does Azimutt use AI?$q$, $q$Yes, Azimutt offers AI-assisted SQL generation and exploration, available on the Team plan and above.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Can Azimutt be embedded or shared?$q$, $q$Yes, Azimutt diagrams support sharing and embedding functionality.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Understanding Legacy Databases$q$, $q$Visualizing and documenting complex or legacy database schemas.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Database Schema Design$q$, $q$Designing new database schemas using AML and interactive diagrams.$q$, $q$Developers and architects$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Onboarding to Unfamiliar Schemas$q$, $q$Helping new engineers quickly understand an existing database structure.$q$, $q$Growing engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Free$q$, $q$€0$q$, $q$N/A$q$, NULL, $q$["Unlimited tables","Schema exploration","Data exploration","Database analysis (preview)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Solo$q$, $q$€7/month$q$, $q$billed annually$q$, NULL, $q$["All Free features","Long-term usage","Database design","Schema export","Custom colors"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Team$q$, $q$€35/user/month$q$, $q$billed annually$q$, NULL, $q$["All Solo features","Collaboration","Documentation","AI capabilities","Database analysis (snapshot)","Project export"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$Enterprise$q$, $q$Custom$q$, $q$Contact sales$q$, NULL, $q$["All Team features","Unlimited usage","User management","Custom integrations","SSO","On-premise support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '4b8c7210-2173-4e7a-95b0-7458564b09fd';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Azimutt is a database exploration, documentation, and design tool co-founded by Loic Knuchel, made and hosted in the EU. It helps developers, DBAs, and architects understand complex databases through interactive entity-relationship diagrams that scale to large schemas.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Azimutt includes AML, a minimal DSL for quickly designing database schemas, database linting to flag structural inconsistencies, path-finding between tables, and AI-assisted SQL exploration.$q$, $q$It supports documentation directly on the schema with table and column notes and saved layouts, plus sharing and embedding of diagrams.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$pricing-overview$q$, $q$Pricing Overview$q$, 2, ARRAY[$q$Azimutt is freemium: the Free plan allows unlimited tables with basic exploration; Solo (€7/month billed annually) adds database design and export; Team (€35/user/month billed annually) adds collaboration, documentation, and AI features; Enterprise is custom-priced with SSO and on-premise support.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Azimutt connects to PostgreSQL, MySQL, SQL Server, Oracle, MongoDB, and cloud platforms including AWS RDS/Aurora, Azure SQL/Cosmos DB, Google Cloud SQL, BigQuery, and Snowflake, and is available as a VS Code extension, Chrome extension, Heroku add-on, and CLI/npm package.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4b8c7210-2173-4e7a-95b0-7458564b09fd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


-- Enrichment batch: Captivate, Buzzsprout, Podbean, Libsyn, Simplecast, RedCircle, RSS.com, Castos, Spreaker, Megaphone, Omny Studio, Blubrry, Fusebox, Seriously Simple Podcasting, Supercast
-- Publishes 15 bulk-imported tool(s) with full editorial content.

-- ── Captivate ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Captivate is a podcast hosting platform offering automatic distribution, IAB-certified analytics, monetization and AI show notes.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$€17/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Captivate podcast hosting: distribution, IAB-certified analytics, monetization tools and a 30-day free trial. Compare plans and pricing.$q$,
  og_description = $q$Captivate podcast hosting: distribution, IAB-certified analytics, monetization tools and a 30-day free trial. Compare plans and pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Automatic Distribution$q$, $q$Distributes episodes to Apple Podcasts, Spotify, Amazon Music, YouTube and other podcast apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$IAB-Certified Analytics$q$, $q$Included on every plan, with performance comparison and listener retention metrics.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Monetization Tools$q$, $q$Membership subscriptions, tips, exclusive content and early access features for supporters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Captivate Assistant$q$, $q$An AI tool that generates transcripts, titles, show notes and chapters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Website Builder$q$, $q$A built-in podcast website is included free on every plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Private Podcasting$q$, $q$Dynamic ad insertion and private podcast feeds are included free on all plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Analytics Migration$q$, $q$Imports a show's complete download history from a previous host.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$IAB-certified analytics included on every plan, not gated to higher tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Built-in AI assistant handles transcripts, titles, show notes and chapters$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$30-day free trial gives full platform access with no feature restrictions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Dynamic ad insertion and private podcasting included free on all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$25% discount for students, educational institutions, charities and nonprofits$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$No permanent free plan; the site states it does not offer one$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Pricing is shown in euros, which may complicate budgeting for non-EU customers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Download limits are tiered by plan, starting at 30,000/month$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Usage beyond 300,000 downloads/month requires contacting sales for custom pricing$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Does Captivate offer a free plan?$q$, $q$No. Captivate states it does not have a permanently free tier, but every plan includes a 30-day free trial with full access.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$What is included in every Captivate plan?$q$, $q$All plans include dynamic ad insertion, distribution to major platforms, IAB-certified analytics, private podcasting, a website builder and promotional tools.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Does Captivate have AI tools?$q$, $q$Yes, the Captivate Assistant generates transcripts, titles, show notes and chapters.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Is there a discount for nonprofits or students?$q$, $q$Yes, students, educational institutions, registered charities and nonprofits receive 25% off all plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$What happens if I exceed my plan's download limit?$q$, $q$Customers exceeding 300,000 downloads/month on the Business plan need to contact Captivate's sales team for custom pricing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Independent podcasters$q$, $q$Get analytics and monetization tools from day one.$q$, $q$Solo creators and entrepreneurs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Podcast networks and agencies$q$, $q$Manage multiple shows with team access.$q$, $q$Agencies and networks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Podcasters switching hosts$q$, $q$Migrate complete download history from a previous host.$q$, $q$Creators changing hosting providers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Personal$q$, $q$€17/month$q$, $q$annual$q$, $q$["Up to 30,000 downloads/month","Unlimited podcasts","Unlimited uploads/storage","Extensive distribution list"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Professional$q$, $q$€44/month$q$, $q$annual$q$, $q$["Up to 150,000 downloads/month","Unlimited podcasts","Unlimited uploads/storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$Business$q$, $q$€90/month$q$, $q$annual$q$, $q$["Up to 300,000 downloads/month","Unlimited podcasts","Unlimited uploads/storage"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$overview$q$, $q$What is Captivate?$q$, 2, ARRAY[$q$Captivate is a podcast hosting and management platform that lets creators publish, distribute, grow and monetize podcasts. It automatically distributes episodes to Apple Podcasts, Spotify, Amazon Music, YouTube and other podcast apps.$q$, $q$Every plan includes IAB-certified analytics, a built-in website, dynamic ad insertion, private podcasting and the Captivate Assistant, an AI tool that generates transcripts, titles, show notes and chapters.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', $q$who-its-for$q$, $q$Who Captivate is for$q$, 2, ARRAY[$q$Captivate is built for entrepreneurs, content creators, YouTubers, podcast networks and agencies who want growth and monetization tools alongside hosting, rather than a bare-bones free host.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5d6ffe1c-7b1f-4bcf-ac7d-d949b13cba63', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Buzzsprout ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Buzzsprout, founded in 2009, is podcast hosting with a free tier, AI-generated show notes and distribution to major podcast apps.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month (billed annually)$q$,
  founded_year = 2009,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Buzzsprout podcast hosting: free 2-hour plan, AI-powered CoHost show notes, Magic Mastering audio, and distribution to Apple Podcasts and Spotify.$q$,
  og_description = $q$Buzzsprout podcast hosting: free 2-hour plan, AI-powered CoHost show notes, Magic Mastering audio, and distribution to Apple Podcasts and Spotify.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '087b8581-02ae-4bfb-bac4-4d3ce7f324de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '087b8581-02ae-4bfb-bac4-4d3ce7f324de' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Audio + Video Hosting$q$, $q$Publishes audio and video episodes to major podcast directories.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$CoHost AI$q$, $q$Generates show notes, transcripts, titles and chapters from an episode.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Magic Mastering$q$, $q$An AI-powered add-on that enhances episode audio quality.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$IAB-Certified Analytics$q$, $q$Podcast statistics dashboard with filtering options.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Website Builder$q$, $q$SEO-optimized podcast websites with custom domain support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Mobile App$q$, $q$iOS and Android apps for managing a show on the go.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Fan Mail$q$, $q$A tool for collecting listener feedback directly from episodes.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Free plan available with 2 hours of uploads per month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Founded in 2009, with over 115,000 active podcasters on the platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$CoHost AI and Magic Mastering add-ons assist with content creation and audio quality$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$iOS and Android apps for on-the-go show management$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$3,600+ 5-star reviews cited by the company$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Free plan only retains episodes for 90 days and excludes video distribution$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Video publishing requires the higher-priced Audio + Video plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$CoHost AI and Magic Mastering are paid add-ons, not included by default$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$The Archive plan still costs $5/month just to keep a podcast available without publishing$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Does Buzzsprout have a free plan?$q$, $q$Yes, it offers 2 hours of free uploads per month with episodes hosted for 90 days, though it excludes paid add-ons and video distribution.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$When was Buzzsprout founded?$q$, $q$2009.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Does Buzzsprout support video podcasts?$q$, $q$Yes, through the Audio + Video plan, which supports 1080p video distribution to Apple Podcasts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$What is CoHost AI?$q$, $q$An AI feature that generates show notes, transcripts, titles and chapters for episodes.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Is there a mobile app?$q$, $q$Yes, Buzzsprout offers iOS and Android apps for managing podcasts.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$New podcasters$q$, $q$Test podcasting on the free plan before committing to a paid tier.$q$, $q$Beginner podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Video podcasters$q$, $q$Publish both audio and video episodes to directories like Apple Podcasts.$q$, $q$Audio + video creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Multi-show creators$q$, $q$Run several podcasts under one account.$q$, $q$Podcast networks and prolific creators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["2 hours of uploads/month","90-day episode hosting","Directory listing"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Audio Podcast$q$, $q$$15/month$q$, $q$annual$q$, $q$["Up to 72 hours/year uploads","1 podcast, unlimited episodes","Premium features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Audio + Video$q$, $q$$25/month$q$, $q$annual$q$, $q$["Video publishing to Apple Podcasts","1080p video resolution"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Multi-Podcast$q$, $q$$30/month$q$, $q$annual$q$, $q$["Up to 180 hours/year","5 audio or 10 audio+video podcasts"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$Archive$q$, $q$$5/month$q$, $q$monthly$q$, $q$["Keeps a podcast available without publishing new content"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$overview$q$, $q$What is Buzzsprout?$q$, 2, ARRAY[$q$Buzzsprout, founded in 2009, is a podcast hosting and distribution platform that helps creators publish audio and video episodes to Apple Podcasts, Spotify, YouTube and other directories.$q$, $q$The platform offers a free plan with 2 hours of monthly uploads, plus paid tiers with AI tools like CoHost for show notes and transcripts, and Magic Mastering for audio enhancement.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', $q$who-its-for$q$, $q$Who Buzzsprout is for$q$, 2, ARRAY[$q$Buzzsprout suits podcasters of all experience levels, from beginners starting on the free plan to established shows publishing audio and video across multiple podcasts.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('087b8581-02ae-4bfb-bac4-4d3ce7f324de', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Podbean ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Podbean is a podcast hosting and monetization platform with a free tier, AI audio tools and IAB-certified analytics.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Podbean podcast hosting: free plan, AI-powered audio optimization and content generation, Ads Marketplace and custom podcast websites.$q$,
  og_description = $q$Podbean podcast hosting: free plan, AI-powered audio optimization and content generation, Ads Marketplace and custom podcast websites.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1cfc533c-df77-4130-b1c1-cf54522f45ef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1cfc533c-df77-4130-b1c1-cf54522f45ef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Podcast Hosting & Distribution$q$, $q$Publishes to Apple Podcasts, Spotify, Amazon Music and other directories.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$AI Audio Optimization$q$, $q$Noise reduction and filler-word removal powered by AI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$AI Content Generation$q$, $q$Generates titles, show notes, transcripts and chapter markers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Monetization$q$, $q$Ads Marketplace and dynamic ad insertion for revenue.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Custom Website Templates$q$, $q$Customizable podcast website with templates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$IAB-Certified Analytics$q$, $q$Analytics dashboard for tracking audience growth.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Apple Podcasts Subscriptions$q$, $q$Native integration for paid subscriber content.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Free account available to start podcasting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$AI credits included on every paid plan for content generation and audio cleanup$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Over 600,000 active podcasters cited, indicating a large, established user base$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Network and Business plans support team collaboration and SSO for larger organizations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$iOS and Android apps for recording and management$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$AI features are credit-limited per plan (e.g. 600 credits on the entry paid tier)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Network-level stats and SSO require the most expensive plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Monthly pricing is notably higher than annual billing across all paid tiers$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Founding year and headquarters are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Does Podbean have a free plan?$q$, $q$Yes, Podbean offers a free account with basic hosting features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$What are Podbean's AI credits used for?$q$, $q$They power AI-based audio optimization and AI content generation like titles, show notes and transcripts.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Can I run a private podcast on Podbean?$q$, $q$Yes, the Business plan supports private podcasts with up to 100 private members and SSO login.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Does Podbean support video podcasts?$q$, $q$Yes, the Unlimited Plus plan and above support audio and video uploads.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Is there a mobile app?$q$, $q$Yes, Podbean is available on web, iOS and Android.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Hobbyist podcasters$q$, $q$Start podcasting for free with basic hosting.$q$, $q$Beginner podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Private business podcasts$q$, $q$Run internal or member-only shows with SSO and team controls.$q$, $q$Companies and organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Podcast networks$q$, $q$Manage multiple public shows with team members.$q$, $q$Networks and agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Unlimited Audio$q$, $q$$12/month$q$, $q$annual$q$, $q$["1 audio podcast","1GB monthly uploads, unlimited storage","600 AI credits","Advanced stats"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Unlimited Plus$q$, $q$$29/month$q$, $q$annual$q$, $q$["2 podcasts","10GB monthly uploads","2,400 AI credits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Network$q$, $q$$79/month$q$, $q$annual$q$, $q$["Unlimited podcasts","40GB uploads, 3TB bandwidth","6,000 AI credits","50 team members"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$Business$q$, $q$$99/month$q$, $q$annual$q$, $q$["Unlimited private + 2 public podcasts","6,000 AI credits","Unlimited team members","SSO, SOC2"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$overview$q$, $q$What is Podbean?$q$, 2, ARRAY[$q$Podbean is a podcast hosting platform that lets creators publish, promote and monetize podcasts, with distribution to Apple Podcasts, Spotify, Amazon Music and other directories.$q$, $q$It combines a free tier with paid plans that add AI-powered audio optimization, AI content generation, an Ads Marketplace, and business features like SSO and private podcasting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', $q$who-its-for$q$, $q$Who Podbean is for$q$, 2, ARRAY[$q$Podbean serves podcasters of all experience levels and genres, as well as businesses seeking private podcasting with SSO and enterprise-grade security controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1cfc533c-df77-4130-b1c1-cf54522f45ef', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Libsyn ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Libsyn is a long-running podcast hosting platform with audio and video distribution, Pro Analytics and a 30-day free trial.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$12/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Libsyn podcast hosting: launch, host, distribute and monetize your show with Pro Analytics, multi-user access and a 30-day free trial.$q$,
  og_description = $q$Libsyn podcast hosting: launch, host, distribute and monetize your show with Pro Analytics, multi-user access and a 30-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ceb65439-a59e-44c1-9f4f-22cf5bc366f7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ceb65439-a59e-44c1-9f4f-22cf5bc366f7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Audio and Video Hosting$q$, $q$Distribution to Spotify, YouTube and Apple Podcasts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Pro Analytics$q$, $q$IAB-certified download data with geo-trend information.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Multi-User Management$q$, $q$Supports up to five team members per account.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Monetization$q$, $q$Automatic ads, Podroll cross-promotion, and Apple Podcasts subscriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Custom Podcast Player$q$, $q$Branded player and website for each show.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Bulk Episode Editing$q$, $q$Edit multiple episodes at once.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Video Uploads$q$, $q$Up to 100GB/month of video uploads included across all plans.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$30-day free trial on every plan before billing starts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Video uploads (up to 100GB/month) included even on lower-tier plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Multi-user management supports team collaboration for up to five users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Pro Analytics provides IAB-certified download data with geographic trends$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Custom Professional and Enterprise plans available for higher-volume creators$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$No permanent free plan, only a 30-day trial before paid billing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Audio upload hours are capped per plan (e.g. 3 hours/month on Basic)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Dynamic ad insertion and API access require custom Professional/Enterprise pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Founding year, headquarters and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Does Libsyn offer a free trial?$q$, $q$Yes, every plan includes a 30-day free trial before billing begins, with no promo code required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$What audio upload limits does Libsyn have?$q$, $q$The Basic plan allows 3 hours/month, Advanced allows 10 hours/month, and Max allows 55 hours/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Can I collaborate with a team on Libsyn?$q$, $q$Yes, plans support multi-user access for up to five team members.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Does Libsyn support video podcasts?$q$, $q$Yes, all plans include up to 100GB/month of video uploads with distribution to YouTube and Spotify.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Can I cancel a Libsyn trial anytime?$q$, $q$Yes, the site states cancellation is available anytime.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Teams with multiple hosts$q$, $q$Collaborate with up to five team members on one account.$q$, $q$Co-hosted or team-run shows$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Audio and video podcasters$q$, $q$Distribute both audio and video episodes from one platform.$q$, $q$Audio + video creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$High-volume creators$q$, $q$Access dynamic ad insertion and API access on custom plans.$q$, $q$Professional and Enterprise customers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Basic$q$, $q$$12/month$q$, $q$monthly$q$, $q$["3hr/month audio uploads","Up to 100GB/month video","Basic IAB analytics","YouTube distribution"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Advanced$q$, $q$$25/month$q$, $q$monthly$q$, $q$["10hr/month audio uploads","Advanced IAB analytics","YouTube+Spotify video distribution","Social calendar tool"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Max$q$, $q$$150/month$q$, $q$monthly$q$, $q$["55hr/month audio uploads","Analytics for high-volume creators","YouTube+Spotify video distribution"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$Professional/Enterprise$q$, $q$Custom pricing$q$, NULL, $q$["Dynamic ad insertion","API access","Unlimited storage","Advanced analytics"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$overview$q$, $q$What is Libsyn?$q$, 2, ARRAY[$q$Libsyn is a podcast hosting platform for launching, hosting, distributing and monetizing podcasts, with audio and video distribution to Spotify, YouTube and Apple Podcasts.$q$, $q$Every plan includes a 30-day free trial, Pro Analytics with IAB-certified downloads and geo-trend data, and multi-user management for teams of up to five.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', $q$who-its-for$q$, $q$Who Libsyn is for$q$, 2, ARRAY[$q$Libsyn is built for ambitious, growth-focused creators who want detailed analytics, team collaboration, and monetization tools alongside standard podcast hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ceb65439-a59e-44c1-9f4f-22cf5bc366f7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Simplecast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Simplecast is an end-to-end podcast hosting platform, now operating under AdsWizz, with a 14-day free trial.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$13.50/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Simplecast podcast hosting: one-click publishing, Audience by Simplecast analytics, AdsWizz ad monetization, and a 14-day free trial.$q$,
  og_description = $q$Simplecast podcast hosting: one-click publishing, Audience by Simplecast analytics, AdsWizz ad monetization, and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'be61a68f-a190-43dc-9648-504807d5677a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'be61a68f-a190-43dc-9648-504807d5677a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$One-Click Publishing$q$, $q$Distributes episodes to Apple Podcasts, Spotify, Pandora and more.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Audience by Simplecast$q$, $q$An IAB-certified analytics platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Ad Monetization$q$, $q$Ad inventory controls and access to the AdsWizz Marketplace.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Show Migration Tool$q$, $q$Imports an existing show from another host.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Multi-Show Management$q$, $q$Manage multiple shows from a single account.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$API Integration$q$, $q$Available on the Enterprise plan for custom workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Dynamic Ad Insertion$q$, $q$Available on the Professional and Enterprise plans.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Operating for over 10 years, now part of AdsWizz$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Basic and Essential plans include unlimited storage and uploads$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Enterprise plan offers white-labeled RSS feeds and a dedicated success manager$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Access to the AdsWizz ad marketplace for monetization$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$No permanent free plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Professional and Enterprise pricing is custom/quote-only, not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Advanced analytics like location and unique-listener reports require the Essential plan or higher$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Company headquarters and founding year are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Does Simplecast offer a free trial?$q$, $q$Yes, a 14-day commitment-free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Who operates Simplecast?$q$, $q$The site states Simplecast now operates "By AdsWizz."$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$What's included in the Basic plan?$q$, $q$2 team seats, unlimited storage and uploads, distribution to all platforms, basic analytics, and 20,000 downloads included per month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Does Simplecast support dynamic ad insertion?$q$, $q$Yes, on the Professional and Enterprise plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Is API access available?$q$, $q$Yes, on the Enterprise plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Indie podcasters$q$, $q$Get straightforward hosting and basic analytics.$q$, $q$Independent creators and small shows$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Growing networks$q$, $q$Access advanced ad monetization through the AdsWizz Marketplace.$q$, $q$Podcast networks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Enterprises$q$, $q$Use API access and white-labeled RSS feeds.$q$, $q$Large publishers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Basic$q$, $q$$13.50/month$q$, $q$annual$q$, $q$["2 team seats","Unlimited storage/uploads","20K downloads/month included","Basic analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Essential$q$, $q$$31.50/month$q$, $q$annual$q$, $q$["4 team seats","Location/unique listener analytics","50K downloads/month included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Professional$q$, $q$Custom pricing$q$, NULL, $q$["Dynamic ad insertion","Campaign management","Secondary feeds"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$Enterprise$q$, $q$Custom pricing$q$, NULL, $q$["API integration","White-labeled RSS feeds","Dedicated success manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$overview$q$, $q$What is Simplecast?$q$, 2, ARRAY[$q$Simplecast is a podcast hosting platform for publishing, distribution, analytics and monetization, offering one-click publishing to Apple Podcasts, Spotify, Pandora and other platforms.$q$, $q$The platform, which now operates under AdsWizz, provides IAB-certified analytics through Audience by Simplecast and ad monetization via the AdsWizz Marketplace.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', $q$who-its-for$q$, $q$Who Simplecast is for$q$, 2, ARRAY[$q$Simplecast serves both growing podcast networks and indie creators, with entry-level plans for smaller shows and custom Professional/Enterprise plans for larger publishers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('be61a68f-a190-43dc-9648-504807d5677a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── RedCircle ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$RedCircle is a podcast hosting and monetization platform with a permanently free Core plan and a cross-promotion marketplace.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19.99/month (Growth plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RedCircle podcast hosting: free unlimited Core plan, cross-promotions marketplace, dynamic ad insertion, and one-click video and transcripts.$q$,
  og_description = $q$RedCircle podcast hosting: free unlimited Core plan, cross-promotions marketplace, dynamic ad insertion, and one-click video and transcripts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fc9b345c-46db-4d94-b160-d1e40a0e6d6b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fc9b345c-46db-4d94-b160-d1e40a0e6d6b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Free Core Hosting$q$, $q$One podcast with unlimited storage, bandwidth, episodes and downloads.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Distribution$q$, $q$Publishes to Spotify, Apple Podcasts, Amazon Music, YouTube and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Cross-Promotions Marketplace$q$, $q$Pairs podcasts for mutual promotion, available on Growth plan and above.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$RedCircle Ad Platform (RAP)$q$, $q$Programmatic and host-read ads for shows over 500 weekly downloads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Video & Transcript Generation$q$, $q$One-click video and transcript creation from episodes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Dynamic Insertion$q$, $q$Unlimited on the Growth plan, customizable on Pro.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Donations & Exclusive Content$q$, $q$Accepts listener donations and offers subscriber-only content.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Core plan is permanently free with unlimited storage, bandwidth and downloads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Cross-promotions marketplace helps shows grow through partner promotion$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Every paid plan includes a 7-day free trial$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Ad monetization available on the free tier once a show hits 500 weekly downloads$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Team seats available on Pro and Enterprise plans for collaboration$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Free Core plan is limited to a single podcast$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Advanced analytics, video generation and higher transcript limits require paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Enterprise-level features like a dedicated account manager require the $119.99/month plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Founding year, headquarters and company size are not disclosed publicly$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Is RedCircle free to use?$q$, $q$Yes, the Core plan is free and includes one podcast with unlimited storage, bandwidth, episodes and downloads.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$How does RedCircle's ad program work?$q$, $q$Shows with at least 500 weekly downloads can join the RedCircle Ad Platform for programmatic and host-read ads.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Does RedCircle offer a free trial on paid plans?$q$, $q$Yes, each paid plan includes a 7-day free trial.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$What is the cross-promotions marketplace?$q$, $q$A feature on the Growth plan and above that pairs podcasts together to promote each other's shows.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$How many episode transcripts are included?$q$, $q$Growth includes 5/month, Pro includes 50/month, and Enterprise includes 500/month.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Free unlimited hosting$q$, $q$Start a podcast without any cost.$q$, $q$Beginner and hobbyist podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Growth through cross-promotion$q$, $q$Pair with other shows in the cross-promotions marketplace.$q$, $q$Growth-focused creators on the Growth plan$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Podcast teams$q$, $q$Manage multiple podcasts with collaborator seats.$q$, $q$Podcast teams and agencies on Pro/Enterprise$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Core$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1 podcast","Unlimited storage/bandwidth/episodes/downloads","Standard analytics","RAP ad program eligibility"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Growth$q$, $q$$19.99/month$q$, $q$monthly$q$, $q$["Multiple podcasts","Video generation","5 transcripts/month","Cross-promotions marketplace","Unlimited dynamic insertion"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Pro$q$, $q$$34.99/month$q$, $q$monthly$q$, $q$["Premium analytics","YouTube distribution","50 transcripts/month","5 team seats"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$Enterprise$q$, $q$$119.99/month$q$, $q$monthly$q$, $q$["Dedicated account manager","500 transcripts/month","Comprehensive analytics"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$overview$q$, $q$What is RedCircle?$q$, 2, ARRAY[$q$RedCircle is a podcast hosting and monetization platform offering hosting, distribution, cross-promotions and host-read ad campaigns in one place.$q$, $q$Its Core plan is permanently free with unlimited storage, bandwidth and downloads for one podcast, while paid Growth, Pro and Enterprise plans add multi-podcast support, video generation and more transcripts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', $q$who-its-for$q$, $q$Who RedCircle is for$q$, 2, ARRAY[$q$RedCircle suits new podcasters who want free, unlimited hosting, as well as growing shows that want to expand their audience through cross-promotion and ad monetization.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fc9b345c-46db-4d94-b160-d1e40a0e6d6b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── RSS.com ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$RSS.com offers free, unlimited podcast hosting plus paid tiers with dynamic ad insertion, AI transcripts and audio-to-video conversion.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$11.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RSS.com podcast hosting: free unlimited episodes and storage, automatic distribution, dynamic ad insertion, and AI-generated transcripts.$q$,
  og_description = $q$RSS.com podcast hosting: free unlimited episodes and storage, automatic distribution, dynamic ad insertion, and AI-generated transcripts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '486dac3f-e396-4ba6-9c6e-20a5f563c673';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '486dac3f-e396-4ba6-9c6e-20a5f563c673' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Unlimited Free Hosting$q$, $q$Unlimited episodes and audio storage on the free plan.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Automatic Distribution$q$, $q$Publishes to Spotify, Apple Podcasts, YouTube and Amazon Music.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Real-Time Analytics$q$, $q$Analytics dashboard included on all plans.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Monetization$q$, $q$Programmatic ads, subscriptions, donations, an affiliate program and crypto payments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Dynamic Ad Insertion$q$, $q$Available from 10 downloads on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$AI-Generated Transcripts$q$, $q$Available on paid plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Audio-to-Video Conversion$q$, $q$Turns audio episodes into video for platforms like YouTube.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Free plan includes unlimited episodes and unlimited audio storage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Dynamic ad insertion, subscriptions and donations available for monetization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Multiple payment options for monetization, including crypto payments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Site states certification by Podcast Standards and IAB Tech Lab$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Site states existing podcasters switching hosts can get 6 months free$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$AI transcripts, unbranded player and Apple Podcasts Subscriptions require a paid plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Team member invitations are not available on the free plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$API access is limited to the top Podcast Networks plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Founding year, headquarters and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Is RSS.com really free?$q$, $q$Yes, the Local and Niche plan is free with unlimited episodes, unlimited audio, and basic analytics.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Does RSS.com support monetization?$q$, $q$Yes, including dynamic ad insertion, Apple Podcasts Subscriptions, donations, and an affiliate program on paid plans.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Does RSS.com offer AI features?$q$, $q$Yes, AI-generated transcripts are included on paid plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Can I run multiple podcasts on RSS.com?$q$, $q$Yes, the Podcast Networks plan supports unlimited podcasts and unlimited team seats.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Is there an API?$q$, $q$Yes, API access is included on the Podcast Networks plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Free niche hosting$q$, $q$Launch a podcast with unlimited free hosting.$q$, $q$Beginner and niche podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Monetization-focused shows$q$, $q$Add ads, subscriptions and AI transcripts.$q$, $q$Creators on the All in One Podcasting plan$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Podcast networks$q$, $q$Manage multiple shows and team members with API access.$q$, $q$Networks on the Podcast Networks plan$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Local and Niche$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited episodes","Unlimited audio","Public RSS feed","Basic analytics","Automatic distribution"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$All in One Podcasting$q$, $q$$11.99/month$q$, $q$monthly$q$, $q$["Dynamic ad insertion","Apple Podcasts Subscriptions","Audio-to-video conversion","AI transcripts","Advanced analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$Podcast Networks$q$, $q$$18.75/month$q$, $q$monthly$q$, $q$["Unlimited podcasts","Unlimited team seats","API access","Automatic transcripts","Unbranded YouTube videos"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$overview$q$, $q$What is RSS.com?$q$, 2, ARRAY[$q$RSS.com is a podcast hosting platform offering free, unlimited episode and storage hosting with automatic distribution to Spotify, Apple Podcasts, YouTube and Amazon Music.$q$, $q$Paid plans add dynamic ad insertion, Apple Podcasts Subscriptions, AI-generated transcripts and audio-to-video conversion, along with monetization options like donations and an affiliate program.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', $q$who-its-for$q$, $q$Who RSS.com is for$q$, 2, ARRAY[$q$RSS.com targets podcasters of all experience levels, from hobbyists wanting free unlimited hosting to networks needing multiple podcasts, team seats and API access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('486dac3f-e396-4ba6-9c6e-20a5f563c673', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Castos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Castos is a podcast hosting platform with unlimited episodes, an AI show-notes assistant, WordPress integration and a 14-day trial.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Castos podcast hosting: unlimited episodes and shows, AI Assistant for show notes, WordPress integration, and a 14-day free trial.$q$,
  og_description = $q$Castos podcast hosting: unlimited episodes and shows, AI Assistant for show notes, WordPress integration, and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1be06e6f-80c4-4800-be23-0b5ae2f639dd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1be06e6f-80c4-4800-be23-0b5ae2f639dd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Unlimited Hosting$q$, $q$Unlimited episodes, shows and downloads with no overage fees.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$1-Click Distribution$q$, $q$Publishes to Apple Podcasts, Spotify, YouTube and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Castos AI Assistant$q$, $q$Generates show notes, titles, social posts and chapter markers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$WordPress Integration$q$, $q$Connects via the Seriously Simple Podcasting plugin.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Hybrid Podcasting$q$, $q$Combines public and private content in one show.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Automated YouTube Republishing$q$, $q$Republishes episodes to YouTube automatically.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Private Podcasting App$q$, $q$iOS and Android app for private-podcast subscribers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Unlimited episodes, shows and downloads with no overage fees on every paid plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$14-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Native WordPress plugin integration for podcast websites$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Transcripts available in 19 languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Growth plan and above include a 1:1 onboarding call$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$No permanent free plan; access requires starting a 14-day trial on a paid tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Transcript volume is capped per plan, from 10/month on Essentials up to 100/month on Pro$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Extra private subscribers cost $50/month per 500 beyond plan limits$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Founding year, headquarters and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Does Castos have a free plan?$q$, $q$No, but it offers a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Does Castos integrate with WordPress?$q$, $q$Yes, via the Seriously Simple Podcasting plugin.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$What does the Castos AI Assistant do?$q$, $q$It generates show notes, titles, social posts and chapter markers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Can I run a private podcast?$q$, $q$Yes, Castos supports hybrid public and private podcasting with an iOS/Android app for subscribers.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$How many languages are supported for transcripts?$q$, $q$19 languages.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$WordPress-based creators$q$, $q$Publish podcasts through an existing WordPress site.$q$, $q$WordPress site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Private/premium podcasts$q$, $q$Offer subscriber-only content alongside a public feed.$q$, $q$Private and premium podcasters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Growing shows$q$, $q$Get onboarding support and automated video republishing.$q$, $q$Creators on the Growth plan$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Essentials$q$, $q$$19/month$q$, $q$monthly$q$, $q$["Unlimited podcasts/downloads/episodes","Automatic distribution","10 transcripts/month","Up to 100 private subscribers"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Growth$q$, $q$$49/month$q$, $q$monthly$q$, $q$["1:1 onboarding call","Mobile app","YouTube republishing","25 transcripts/month","Up to 250 private subscribers"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Pro$q$, $q$$99/month$q$, $q$monthly$q$, $q$["Video file hosting","100 transcripts/month","Up to 500 private subscribers","100% uptime SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$Castos Premium$q$, $q$From $499/month$q$, $q$monthly$q$, $q$["Custom contracts","SSO","Unlimited transcripts","Dedicated account manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$overview$q$, $q$What is Castos?$q$, 2, ARRAY[$q$Castos is a podcast hosting platform offering unlimited episodes, shows and downloads with 1-click distribution to Apple Podcasts, Spotify and YouTube.$q$, $q$The platform includes a Castos AI Assistant for generating show notes, titles, social posts and chapter markers, plus native WordPress integration via the Seriously Simple Podcasting plugin.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', $q$who-its-for$q$, $q$Who Castos is for$q$, 2, ARRAY[$q$Castos suits podcasters who already publish through WordPress, shows that want a hybrid mix of public and private content, and growing creators who want onboarding support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be06e6f-80c4-4800-be23-0b5ae2f639dd', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Spreaker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Spreaker, an iHeartMedia company, is a podcast hosting platform with a permanently free plan and ad/subscription monetization.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€20/month (Broadcaster plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Spreaker podcast hosting: free Free Speech plan, ad and subscription monetization, and Spreaker Create recording tools, owned by iHeartMedia.$q$,
  og_description = $q$Spreaker podcast hosting: free Free Speech plan, ad and subscription monetization, and Spreaker Create recording tools, owned by iHeartMedia.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '41ee4232-5722-4e22-a602-9fdc2ae29ca2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '41ee4232-5722-4e22-a602-9fdc2ae29ca2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Podcast Hosting & Publishing$q$, $q$Unlimited episodes with automatic distribution to major platforms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Spreaker Create$q$, $q$A web-based recording and editing tool.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Prime Network$q$, $q$Featured placement for content within Spreaker's network.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Supporters Club$q$, $q$Listener subscription and support monetization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Customizable RSS Feeds$q$, $q$Available from the free plan up.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Ad Monetization$q$, $q$Available on all plans, with subscription monetization on paid tiers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Advanced Statistics$q$, $q$Extended stats history on paid plans, up to 24 months.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Free Free Speech plan requires no credit card and includes ad monetization$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Backed by iHeartMedia, a major media company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Supporters Club fee drops from 20% on the free plan to 0% on Broadcaster and above$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Unlimited episodes included on every plan, including free$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Podcasts app provides an additional discovery channel for listeners$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Free plan is limited to 1 podcast and 6 months of statistics history$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Supporters Club takes a 20% fee on the free plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Ad campaign manager for direct ad sales requires the top Publisher plan at €250/month$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Founding year, headquarters and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Is Spreaker free?$q$, $q$Yes, the Free Speech plan is always free and requires no credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Who owns Spreaker?$q$, $q$Spreaker is "an iHeartMedia Company" per its site footer.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Does Spreaker charge fees on listener support?$q$, $q$Yes, Supporters Club takes a 20% fee on the free plan, dropping to 0% on Broadcaster and above.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Can I sell ads directly through Spreaker?$q$, $q$Yes, the Publisher plan includes an ad campaign manager for direct ad sales.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$How many podcasts can I host?$q$, $q$The free plan allows 1 podcast; Broadcaster and above allow unlimited podcasts.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Free, ad-monetized shows$q$, $q$Start a podcast at no cost with built-in ad monetization.$q$, $q$Beginner podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$0%-fee listener support$q$, $q$Keep 100% of Supporters Club revenue.$q$, $q$Creators on the Broadcaster plan$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Direct ad sales$q$, $q$Sell ads directly to advertisers via a campaign manager.$q$, $q$Publishers and agencies on the Publisher plan$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Free Speech$q$, $q$€0/month$q$, $q$monthly$q$, $q$["1 podcast","6 months of stats","Ad monetization","Unlimited episodes","Supporters Club (20% fee)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Broadcaster$q$, $q$€20/month$q$, $q$monthly$q$, $q$["Unlimited podcasts","12 months of stats","Ad + subscription monetization","Supporters Club (0% fee)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Anchorman$q$, $q$€50/month$q$, $q$monthly$q$, $q$["Unlimited collaborators","Full statistics","Customizable player colors"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$Publisher$q$, $q$€250/month$q$, $q$monthly$q$, $q$["Ad campaign manager for direct ad sales","Priority support","24 months of stats"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$overview$q$, $q$What is Spreaker?$q$, 2, ARRAY[$q$Spreaker is a podcast hosting and distribution platform, operated as "an iHeartMedia Company," that lets creators record, edit, publish and monetize podcasts.$q$, $q$It includes a permanently free Free Speech plan with ad monetization, plus paid tiers that add subscription monetization, unlimited podcasts, and a direct ad-sales campaign manager.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', $q$who-its-for$q$, $q$Who Spreaker is for$q$, 2, ARRAY[$q$Spreaker suits podcasters of all levels, from hobbyists using the free plan to publishers running ad campaigns and selling ads directly through the Publisher plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41ee4232-5722-4e22-a602-9fdc2ae29ca2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Megaphone ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Megaphone is Spotify's enterprise podcast platform for publishing, dynamic ad insertion, and access to the Spotify Audience Network.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Megaphone by Spotify: enterprise podcast publishing, dynamic ad insertion, and access to the Spotify Audience Network ad marketplace.$q$,
  og_description = $q$Megaphone by Spotify: enterprise podcast publishing, dynamic ad insertion, and access to the Spotify Audience Network ad marketplace.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3cef1a8-8aa7-4787-8139-49799a6367d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3cef1a8-8aa7-4787-8139-49799a6367d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Publishing$q$, $q$Distribution to virtually any podcast app.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Dynamic Ad Insertion$q$, $q$Real-time ad stitching across episodes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Spotify Audience Network$q$, $q$Access to Spotify's advertising marketplace.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Growth Analytics$q$, $q$Analytics and promotional tools for audience growth.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Enterprise Support$q$, $q$24/7 support available for priority issues.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Standard Support$q$, $q$Live in-app and email support Monday-Friday, 4am-9pm ET.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Backed by Spotify, giving priority access to Spotify's ad tools and roadmap$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Access to the Spotify Audience Network advertising marketplace$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Used by major publishers including Vox Media, ESPN, Sony Music, The Wall Street Journal and Paramount$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$24/7 enterprise support available for priority issues$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Real-time dynamic ad insertion for monetization$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Pricing is not published; customers must contact sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Positioned for enterprise podcasters and networks rather than individual creators$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$No self-serve free trial or free plan mentioned on the site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Founding year, headquarters and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Who owns Megaphone?$q$, $q$Megaphone operates as a Spotify subsidiary/partner platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Is Megaphone pricing public?$q$, $q$No, pricing is not disclosed on the site; prospective customers are directed to a pricing section to get in touch.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$What is the Spotify Audience Network?$q$, $q$An advertising marketplace that Megaphone customers can access for monetization.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Who uses Megaphone?$q$, $q$The site lists examples including Vox Media, ESPN, Sony Music, The Wall Street Journal, Paramount and LinkedIn's Podcast Network.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$What support does Megaphone offer?$q$, $q$Live in-app and email support Monday-Friday 4am-9pm ET, plus 24/7 support for enterprise priority issues.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Large media publishers$q$, $q$Run enterprise-grade ad monetization across shows.$q$, $q$Enterprise publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Podcast networks$q$, $q$Access the Spotify Audience Network for ad revenue.$q$, $q$Podcast networks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$Ad-supported podcast businesses$q$, $q$Use real-time dynamic ad insertion at scale.$q$, $q$Organizations monetizing through advertising$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$overview$q$, $q$What is Megaphone?$q$, 2, ARRAY[$q$Megaphone is an enterprise podcast platform, operated by Spotify, that enables podcasters to publish, monetize and grow their audience across virtually any podcast app.$q$, $q$Its monetization tools include real-time dynamic ad insertion and access to the Spotify Audience Network, an advertising marketplace. Pricing is not published and requires contacting sales.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', $q$who-its-for$q$, $q$Who Megaphone is for$q$, 2, ARRAY[$q$Megaphone is built for enterprise podcasters and networks; the site cites publishers such as Vox Media, ESPN, Sony Music, The Wall Street Journal and Paramount as examples.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3cef1a8-8aa7-4787-8139-49799a6367d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Omny Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Enterprise podcast hosting platform from Triton Digital with AI transcription, dynamic ad insertion, and analytics for radio and podcast networks.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$German$q$, $q$Italian$q$]::text[],
  seo_meta_description = $q$Omny Studio: enterprise podcast hosting with AI transcription, dynamic ad insertion, and analytics for radio and podcast networks.$q$,
  og_description = $q$Omny Studio: enterprise podcast hosting with AI transcription, dynamic ad insertion, and analytics for radio and podcast networks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '60043245-a189-4894-95be-8b1ffc4e271a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '60043245-a189-4894-95be-8b1ffc4e271a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Apple Podcasts-compliant RSS hosting$q$, $q$Hosts and distributes multi-podcast RSS feeds that comply with Apple Podcasts requirements, with support for managing multiple shows in one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$AI-assisted transcription and show notes$q$, $q$Generates machine or human-verified transcriptions, automatic chapter markers and ad-break identification, and AI-drafted title suggestions and episode summaries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Dynamic ad insertion via TAP$q$, $q$Inserts real-time audio ads through the Triton Ad Platform (TAP) with CPM optimization and live host-read ad capabilities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Embeddable web players$q$, $q$Customizable web players with adjustable colors, share buttons, and mobile-responsive design that auto-translate to a listener's browser language.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Apple Podcasts Subscriptions support$q$, $q$Supports ad-free, members-only, and bonus content tiers for monetizing audiences through Apple Podcasts Subscriptions.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Enterprise access controls$q$, $q$Includes role-based permissions, two-factor authentication, single sign-on (SSO), and an audit trail for enterprise account management.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Analytics dashboard$q$, $q$Provides download and follower analytics with a real-time audience consumption dashboard.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Broadcast capture$q$, $q$Automatically captures and stores talk breaks from radio broadcasts in the cloud for reuse as podcast content.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$AI-generated transcripts, chapter markers, and show notes reduce manual production work$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Enterprise security features including SSO, 2FA, and audit trails$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Real-time ad insertion and CPM optimization through the Triton Ad Platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Web players support automatic translation across six languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Used by established radio and podcast networks such as Southern Cross Austereo and Mamamia$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$No public pricing; plans require contacting sales as part of Triton Digital's enterprise offering$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Geared toward large podcast/radio networks rather than solo or small-team creators$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$No free trial or free plan details published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Is Omny Studio still an independent product?$q$, $q$Omny Studio is marketed as an enterprise podcasting solution under Triton Digital, with its marketing pages hosted on tritondigital.com.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Does Omny Studio offer AI transcription?$q$, $q$Yes, it offers machine-generated or human-verified transcriptions along with automatic chapter markers and ad-break detection.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Can Omny Studio monetize podcasts with ads?$q$, $q$Yes, it supports real-time dynamic ad insertion through the Triton Ad Platform (TAP), including live host-read ads.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$What languages does Omny Studio support?$q$, $q$The platform and its embed players support English, French, Spanish, Portuguese, German, and Italian.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Is pricing publicly listed?$q$, $q$No, Omny Studio does not publish pricing; it operates on an enterprise, contact-for-quote model.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Radio network podcast distribution$q$, $q$Radio networks convert broadcast talk breaks into podcast episodes using broadcast capture and distribute them across podcast platforms.$q$, $q$Radio and broadcast networks$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Enterprise podcast network management$q$, $q$Podcast networks manage multiple shows, permissions, and compliance needs using role-based access, SSO, and audit trails.$q$, $q$Enterprise podcast networks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$Ad-supported podcast monetization$q$, $q$Publishers insert dynamic, real-time ads into episodes and optimize CPM through the Triton Ad Platform integration.$q$, $q$Ad-supported podcast publishers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$overview$q$, $q$What is Omny Studio?$q$, 2, ARRAY[$q$Omny Studio is an enterprise podcasting platform, offered under Triton Digital, that provides hosting, AI-assisted transcription, dynamic ad insertion, and analytics for managing multiple podcast and radio shows in one system.$q$, $q$It targets podcast and radio networks that need enterprise features such as role-based permissions, single sign-on, audit trails, and real-time ad monetization through the Triton Ad Platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', $q$who-its-for$q$, $q$Who Omny Studio is for$q$, 2, ARRAY[$q$Omny Studio is built for radio broadcasters and podcast networks managing many shows at once, rather than individual creators, given its enterprise security controls and contact-for-pricing model.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('60043245-a189-4894-95be-8b1ffc4e271a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Blubrry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Podcast hosting, distribution, and monetization platform that also offers a free WordPress site and the PowerPress publishing plugin.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2005,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Blubrry offers podcast hosting, distribution, analytics, and monetization, plus a free WordPress site and the PowerPress plugin.$q$,
  og_description = $q$Blubrry offers podcast hosting, distribution, analytics, and monetization, plus a free WordPress site and the PowerPress plugin.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Multi-platform distribution$q$, $q$Distributes episodes to major listening platforms including Apple Podcasts, Spotify, Amazon Music, iHeart, Pandora, and YouTube.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Analytics and audience insights$q$, $q$Provides podcast statistics broken down by geography, apps, and devices, with a free statistics option available.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Dynamic ad insertion$q$, $q$Supports pre-roll, mid-roll, and post-roll ad campaign control for monetizing episodes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Premium content monetization$q$, $q$Lets creators offer bonus episodes, early access, and ad-free episodes to paying listeners.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$PowerPress WordPress plugin$q$, $q$A WordPress podcast publishing plugin described by Blubrry as the No. 1 WordPress podcast publishing plugin, bundled with a free WordPress website.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Vid2Pod$q$, $q$Converts YouTube playlists into audio podcasts for redistribution.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Podcast AI Assistant$q$, $q$An AI tool for podcast planning, production, social captions, email content, and media clips.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Over 20 years of operation in podcast hosting (founded 2005)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Includes a free WordPress website with hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Free podcast statistics option available$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$PowerPress is a widely used, dedicated WordPress podcasting plugin$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Vid2Pod can repurpose existing YouTube content into a podcast feed$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Support available 7 days a week$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Detailed pricing plans and exact costs are not published in an easily accessible, itemized format$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$No documented multi-language interface support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$No specific free-trial terms stated for paid hosting tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Does Blubrry offer a free plan?$q$, $q$Blubrry offers free podcast statistics and a free WordPress website; broader hosting plans require visiting its pricing pages for details.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$What is PowerPress?$q$, $q$PowerPress is Blubrry's WordPress podcast publishing plugin, described as the No. 1 WordPress podcast publishing plugin.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Can Blubrry convert YouTube content into a podcast?$q$, $q$Yes, its Vid2Pod service transforms YouTube playlists into audio podcasts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$How long has Blubrry been operating?$q$, $q$Blubrry was founded in 2005 and has operated for over 20 years.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Does Blubrry support podcast monetization?$q$, $q$Yes, through dynamic ad insertion and premium content features like bonus episodes and ad-free access.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$WordPress-based podcasting$q$, $q$Podcasters publish and manage episodes directly from WordPress using the PowerPress plugin and free bundled website.$q$, $q$WordPress site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Repurposing YouTube content$q$, $q$Creators with existing YouTube content use Vid2Pod to convert playlists into a distributable audio podcast feed.$q$, $q$YouTube creators expanding to audio$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$Premium subscriber content$q$, $q$Networks and advanced creators offer bonus or ad-free episodes to paying subscribers.$q$, $q$Networks and advanced creators$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$overview$q$, $q$What is Blubrry?$q$, 2, ARRAY[$q$Blubrry is a podcast hosting platform, founded in 2005, that provides hosting, distribution to major listening apps, analytics, and monetization tools including dynamic ad insertion and premium content.$q$, $q$It also offers the PowerPress WordPress plugin and a free bundled WordPress website, along with Vid2Pod for turning YouTube playlists into podcasts and an AI assistant for planning and production tasks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', $q$who-its-for$q$, $q$Who Blubrry is for$q$, 2, ARRAY[$q$Blubrry serves individual creators starting a podcast as well as networks, businesses, and advanced creators who want WordPress-native publishing and monetization options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e9b75f81-ed9a-4a4b-93e5-70d03b1fd25e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Fusebox ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Podcast hosting platform with customizable web players, transcripts, and analytics, with Starter and Pro plans from $9/month.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$9/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fusebox offers podcast hosting with customizable web players, transcripts, and analytics, starting at $9/month with a 14-day free trial.$q$,
  og_description = $q$Fusebox offers podcast hosting with customizable web players, transcripts, and analytics, starting at $9/month with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cb094cdf-883e-4e90-b7ee-22547256735e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cb094cdf-883e-4e90-b7ee-22547256735e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Unlimited episode hosting$q$, $q$Starter and Pro plans both include podcast hosting with unlimited episode uploads.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Multiple player types$q$, $q$Offers Track, Archive, Sticky, and Full-Page player styles for embedding podcasts on websites, courses, and membership sites.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Episode transcripts$q$, $q$Includes a transcripts plugin for generating episode transcripts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Listening analytics$q$, $q$Provides essential analytics on episode listens.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Custom brand colors$q$, $q$Lets creators match the Single Track Player's colors to their brand.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$API access$q$, $q$Both Starter and Pro plans include API access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Email capture$q$, $q$Podcast players support email capture fields to collect listener contact information.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Migration support$q$, $q$Advertises 'pain-free migration' for creators moving from another podcast host.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Affordable entry pricing starting at $9/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$14-day free trial available on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$API access included even on the Starter plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Multiple embeddable player styles for websites, courses, and membership communities$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$33% savings offered for annual billing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$No free-forever plan; access requires a paid subscription after the trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$No AI features documented on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Enterprise/custom pricing requires contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Company headquarters and founding year are not published$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Does Fusebox offer a free trial?$q$, $q$Yes, Fusebox offers a 14-day free trial for its paid plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$What does the Starter plan cost?$q$, $q$The Starter plan costs $9/month, with a discount available for annual billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$What does the Pro plan cost?$q$, $q$The Pro plan costs $19/month, with a discount available for annual billing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Does Fusebox provide transcripts?$q$, $q$Yes, both Starter and Pro plans include a transcripts plugin for episode transcripts.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Is API access included?$q$, $q$Yes, API access is included in both the Starter and Pro plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Embedding podcasts in online courses$q$, $q$Educators embed customizable podcast players directly into course platforms to deliver audio lessons.$q$, $q$Educational podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Podcast hosting for membership sites$q$, $q$Creators embed podcast players into membership communities to distribute exclusive audio content.$q$, $q$Membership community creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Growing an established podcast$q$, $q$Podcasters with an existing audience use the Pro plan's growth-oriented features to scale distribution.$q$, $q$Established podcasters$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Starter$q$, $q$$9/month$q$, $q$monthly$q$, $q$["Unlimited episode hosting","Multiple web player options","Transcripts plugin","Email support","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Pro$q$, $q$$19/month$q$, $q$monthly$q$, $q$["Unlimited episode hosting","Multiple web player options","Brand color-matching","Transcripts plugin","Email support","API access","Growth-oriented tools"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$Enterprise$q$, NULL, NULL, $q$["Custom pricing","Contact sales for details"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$overview$q$, $q$What is Fusebox?$q$, 2, ARRAY[$q$Fusebox is a podcast hosting platform that provides customizable web players, episode transcripts, and listening analytics, letting creators embed podcasts on websites, online courses, and membership communities.$q$, $q$Plans start at $9/month for the Starter tier and $19/month for the Pro tier, both including unlimited episode uploads and API access, with a 14-day free trial and a custom Enterprise option for larger needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', $q$who-its-for$q$, $q$Who Fusebox is for$q$, 2, ARRAY[$q$Fusebox suits podcasters who want to embed audio directly into their own websites, courses, or membership platforms, from those just launching a show to those with an established audience looking to grow.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb094cdf-883e-4e90-b7ee-22547256735e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Seriously Simple Podcasting ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free WordPress plugin by Castos for creating, managing, and publishing podcasts directly from the WordPress dashboard.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Seriously Simple Podcasting is a free WordPress plugin by Castos for creating and managing podcasts from the WordPress dashboard.$q$,
  og_description = $q$Seriously Simple Podcasting is a free WordPress plugin by Castos for creating and managing podcasts from the WordPress dashboard.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '88430172-33f0-425e-bfc6-d920de02220c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '88430172-33f0-425e-bfc6-d920de02220c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$One-click podcast import$q$, $q$Migrates an existing podcast into WordPress with a one-click import process.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Multiple podcast management$q$, $q$Manages more than one podcast from a single WordPress installation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Dedicated player and shortcodes$q$, $q$Provides an enhanced player experience with dedicated players and shortcodes for embedding episodes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Spotify embed block$q$, $q$Embeds Spotify podcast players directly through a WordPress editor block.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Per-episode analytics$q$, $q$Breaks down listening analytics by individual episode.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$SEO optimization$q$, $q$Centralizes podcast content management in WordPress to support SEO optimization.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Free add-ons$q$, $q$Includes free add-ons such as Genesis theme support, embedded transcripts, and media player customization.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Open source$q$, $q$SSP is open source, with a beta program and GitHub contribution opportunities.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Completely free WordPress plugin$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$30,000+ active installations with 200+ five-star reviews on WordPress.org$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Open source with public GitHub contribution$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Manages multiple podcasts from one WordPress site$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Optional paid hosting available through Castos for scaling distribution$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Requires an existing WordPress site; not a standalone hosting service$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Larger-scale hosting and distribution require a separate paid Castos subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Limited to the WordPress ecosystem$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Is Seriously Simple Podcasting free?$q$, $q$Yes, it is a free WordPress plugin; optional paid hosting is available separately through Castos.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Can I manage multiple podcasts?$q$, $q$Yes, the plugin supports managing multiple podcasts from a single WordPress site.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Is the plugin open source?$q$, $q$Yes, Seriously Simple Podcasting is open source and accepts contributions on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$How popular is the plugin?$q$, $q$It has over 30,000 active installations and more than 200 five-star reviews on WordPress.org.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Does it support Spotify embeds?$q$, $q$Yes, it includes a WordPress editor block for embedding Spotify podcast players.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Adding podcasting to a WordPress site$q$, $q$Site owners add podcast creation and publishing tools directly into their existing WordPress dashboard.$q$, $q$WordPress site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$Migrating an existing podcast$q$, $q$Podcasters use the one-click import to move an existing show into WordPress.$q$, $q$Podcasters switching platforms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$overview$q$, $q$What is Seriously Simple Podcasting?$q$, 2, ARRAY[$q$Seriously Simple Podcasting (SSP) is a free, open-source WordPress plugin by Castos that lets users create, manage, and publish podcasts directly from the WordPress dashboard, including one-click imports for migrating existing shows.$q$, $q$It includes a dedicated player, shortcodes, a Spotify embed block, per-episode analytics, and free add-ons such as embedded transcripts, with optional paid hosting available through Castos for larger-scale distribution.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', $q$who-its-for$q$, $q$Who Seriously Simple Podcasting is for$q$, 2, ARRAY[$q$It is aimed at WordPress site owners and bloggers who want to run a podcast within their existing WordPress site rather than adopting a separate hosting platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('88430172-33f0-425e-bfc6-d920de02220c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Supercast ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Podcast subscription platform charging a flat $0.59 per-subscriber monthly fee, used by shows like Huberman Lab and This American Life.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$0.59/month per subscriber$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Supercast lets podcasters monetize with paid subscriptions for a flat $0.59 per subscriber, instead of 10-30% competitor cuts.$q$,
  og_description = $q$Supercast lets podcasters monetize with paid subscriptions for a flat $0.59 per subscriber, instead of 10-30% competitor cuts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '438b1e2a-2db1-4fa1-aace-e651c95f62cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$10-second subscriber signup$q$, $q$Lets listeners subscribe to premium content in roughly 10 seconds.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$2-tap podcast app integration$q$, $q$Adds premium subscriptions to all major podcast players with a 2-tap integration flow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Native video support$q$, $q$Supports native video as well as YouTube and Vimeo content for subscribers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$White-label embeds and API$q$, $q$Offers white-labeling through embeds or direct API integration into a creator's own site or membership system.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Creator-owned subscriber data$q$, $q$Creators retain ownership of their subscriber lists, emails, and payment relationships.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Multiple subscription types$q$, $q$Supports monthly, annual, and lifetime subscription plans, plus free trials and promotions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Analytics and reporting$q$, $q$Provides content analytics and reporting dashboards for tracking subscriber engagement.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Built-in AMA and email tools$q$, $q$Includes an AMA (ask-me-anything) platform and built-in email capabilities for engaging subscribers.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Flat $0.59-per-subscriber monthly fee instead of the 10-30% cuts charged by some competitors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Creators retain ownership of subscriber data, emails, and payments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Used by major shows including Huberman Lab, WTF with Marc Maron, and This American Life$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Fast 2-tap subscription flow across all major podcast apps$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Partnership with Acast for broader distribution$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$No free plan; the per-subscriber fee applies to every paying listener$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$One-time payments carry an additional 15% fee (up to $1.50) plus Stripe processing fees$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Multi-show and website/membership-system integration require the custom-priced plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Stripe's own processing fees (2.9% + $0.30, plus a 0.7% recurring billing fee) apply on top of Supercast's fee$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$How much does Supercast charge?$q$, $q$Supercast charges a flat $0.59 per month per subscriber on its All-in plan, plus Stripe processing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Do creators own their subscriber data?$q$, $q$Yes, creators retain ownership of their subscribers, emails, and payment relationships.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Does Supercast support video podcasts?$q$, $q$Yes, it supports native video as well as YouTube and Vimeo content.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Is there a plan for multiple shows?$q$, $q$Multi-show support and bundle subscriptions are available on Supercast's custom-priced plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$What happens with one-time payments?$q$, $q$One-time payments incur a 15% fee up to a maximum of $1.50 per payment, plus Stripe processing fees.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Launching premium podcast content$q$, $q$Independent podcasters offer bonus episodes or ad-free listening to subscribers via a dedicated premium space.$q$, $q$Independent podcasters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Monetizing a large existing audience$q$, $q$Established shows convert loyal listeners into paying subscribers using low, flat per-subscriber fees.$q$, $q$Large media and network podcasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Multi-show subscription bundles$q$, $q$Podcast networks bundle subscriptions across multiple shows using the custom plan.$q$, $q$Podcast networks$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$All-in$q$, $q$$0.59/month per subscriber$q$, $q$monthly$q$, $q$["Premium content hosting","Dedicated subscriber landing page","Personal Stripe account integration","2-tap subscription for listeners","Auto-sync public episodes","AMA platform","Built-in email tools","YouTube video feed support","Multiple subscription types","Analytics and reporting"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$Custom$q$, NULL, NULL, $q$["Multi-show support","Multi-show bundle subscriptions","Integration with your website or membership system"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$overview$q$, $q$What is Supercast?$q$, 2, ARRAY[$q$Supercast is a podcast subscription platform that lets creators sell premium or bonus content to listeners for a flat $0.59 per-subscriber monthly fee, rather than the percentage-based cuts charged by some competitors.$q$, $q$It offers a fast 2-tap subscription flow across all major podcast apps, native video support, white-label embeds and API access, and lets creators retain ownership of their subscriber data, emails, and payments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', $q$who-its-for$q$, $q$Who Supercast is for$q$, 2, ARRAY[$q$Supercast is used by independent podcasters and large media shows alike, including Huberman Lab, WTF with Marc Maron, and This American Life, to monetize their audience through paid subscriptions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('438b1e2a-2db1-4fa1-aace-e651c95f62cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


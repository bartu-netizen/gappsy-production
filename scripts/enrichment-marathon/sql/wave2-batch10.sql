-- Enrichment marathon batch: Anyword, Apache Druid, Apache OFBiz, Apaxy, Apicbase, Apollo.io, Apostrophe, Appcues

-- ── Anyword ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Anyword is an AI copywriting platform that generates marketing content and predicts how well it will perform using data-driven scoring, brand voice controls, and analytics.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$39/month$q$, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$New York, NY, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Anyword: AI Copywriting & Performance Prediction$q$, seo_title),
  seo_meta_description = COALESCE($q$Anyword is an AI content platform that generates marketing copy and predicts performance across ads, email, and web. Plans start at $39/month.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Anyword is an AI-powered marketing content platform operated by Anyword (legally Keywee Inc., d.b.a. Anyword), a company founded in 2013 and headquartered in New York, NY, with an additional office in Tel Aviv. The platform generates marketing copy for ads, email, web pages, blogs, and social media, and layers on a performance-prediction system that scores content variations before they are published, using proprietary data trained against historical A/B-test results. Core features include a Data-Driven Editor that generates multiple scored copy variations, Brand Voice management for centralizing tone and messaging guidelines across a team, Content Intelligence for benchmarking published content against industry data, a Chrome extension for scoring copy written in other tools, a Blog Wizard with a plagiarism checker, and a library of 100+ marketing templates. Higher-tier plans add API access, custom-trained AI models, and enterprise security features such as SSO. Anyword is sold on a subscription basis with a 7-day free trial and no permanent free plan; paid plans range from a Starter tier for solo marketers and freelancers up to custom-priced Business and Enterprise tiers for larger marketing teams and organizations with compliance needs. It is best suited for marketing teams, content marketers, and growth/demand-gen professionals who want AI-generated copy paired with data on which variations are likely to perform best, rather than a purely open-ended AI writing tool.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Performance Prediction$q$, $q$Scores AI-generated content variations to indicate which are likely to perform better, based on proprietary historical data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Data-Driven Editor$q$, $q$Generates multiple copy variations for ads, email, and web content alongside predictive performance scores.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Brand Voice$q$, $q$Centralizes brand tone, messaging guidelines, and audience personas so generated copy stays consistent across a team.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Content Intelligence$q$, $q$Compares published content performance against industry-specific benchmark data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Chrome Extension$q$, $q$Applies Anyword's performance scoring to content written in other tools directly in the browser.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Blog Wizard$q$, $q$Generates long-form blog content with a built-in plagiarism checker.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Marketing Templates$q$, $q$Provides 100+ templates covering ad copy, email, product descriptions, and social media posts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$API Access$q$, $q$Available on Business and Enterprise plans for integrating Anyword's generation and scoring into other applications.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Performance-prediction scoring differentiates it from generic AI copywriting tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Unlimited copy generation included on all paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Wide library of templates covering multiple marketing channels$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$API and custom AI model options available for larger teams$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$No permanent free plan, only a 7-day free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Custom AI models, full API access, and SSO are limited to higher-cost Business/Enterprise tiers with custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Performance predictions rely on Anyword's underlying training data, which may be less precise for niche or unusual content categories$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Does Anyword have a free plan?$q$, $q$No, Anyword does not offer a permanent free plan, but it does offer a 7-day free trial of its paid plans.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$What does Anyword's performance prediction do?$q$, $q$It scores generated copy variations to indicate which are more likely to perform well, based on Anyword's proprietary historical performance data.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$What content types can Anyword generate?$q$, $q$Anyword generates copy for ads, email, landing pages, blog posts, product descriptions, and social media, among other formats.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Does Anyword offer an API?$q$, $q$Yes, full API access is included on the Business and Enterprise plans.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$How much does Anyword cost?$q$, $q$The Starter plan starts at $39/month billed annually ($49/month monthly), the Data-Driven plan starts at $79/month billed annually ($99/month monthly), and Business/Enterprise plans use custom pricing.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Solo marketer content generation$q$, $q$Freelancers and solo marketers use the Starter plan to generate and score marketing copy without a team workflow.$q$, $q$Freelancers and solo marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Team-based brand voice management$q$, $q$Marketing teams use Brand Voice and multi-seat plans to keep copy consistent across campaigns and channels.$q$, $q$Marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Enterprise content compliance and scale$q$, $q$Larger organizations use custom AI models, SSO, and full API access to integrate content generation into existing workflows at scale.$q$, $q$Enterprise marketing and compliance teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Starter$q$, $q$$49/month ($39/month billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["50 performance predictions (100 annually)","1 seat","Unlimited copy generation","1 brand voice","Blog Wizard with plagiarism checker","Chrome extension","100+ templates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Data-Driven$q$, $q$$99/month ($79/month billed annually)$q$, $q$Monthly or annual$q$, NULL, $q$["Everything in Starter","100 performance predictions (175 annually)","3 seats","Real-time predictions for manual edits","5 workspaces"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Business$q$, $q$Custom pricing$q$, $q$Custom$q$, NULL, $q$["Everything in Data-Driven","250 performance predictions","5,000 performance data rows","Custom-built AI models","Cross-channel content intelligence","Automated website A/B testing","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$Enterprise$q$, $q$Custom pricing$q$, $q$Custom$q$, NULL, $q$["Everything in Business","500+ performance predictions","10,000+ performance data rows","Private LLM","Enterprise-grade security & SSO","Full API access","Dedicated customer success manager"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'a8d65a51-2247-4b35-9d96-8e7e59545b78';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Anyword is an AI content platform focused on generating marketing copy and predicting how well that copy will perform before it goes live. Rather than functioning as a general-purpose AI writer, it pairs content generation with a scoring system trained on historical performance data, aiming to help marketers choose the strongest version of an ad, email, or landing page.$q$, $q$The company, legally Keywee Inc. doing business as Anyword, was founded in 2013 and is headquartered in New York, NY, with an additional office in Tel Aviv.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Anyword's Data-Driven Editor generates multiple copy variations along with predictive performance scores, while Brand Voice tools let teams centralize tone, messaging guidelines, and audience personas so generated content stays on-brand. Content Intelligence compares published content against industry benchmark data, and a Chrome extension extends scoring to copy written outside the platform. A Blog Wizard with a built-in plagiarism checker supports longer-form content, and the platform ships with 100+ templates covering ad copy, email, product descriptions, and social posts.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Anyword is sold as a subscription with a 7-day free trial and no permanent free tier. The Starter plan begins at $39/month billed annually ($49/month billed monthly) for solo marketers and freelancers, and the Data-Driven plan for marketing teams starts at $79/month billed annually ($99/month billed monthly). Business and Enterprise plans add custom AI models, higher usage limits, API access, and enterprise security features, and are priced on request.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a8d65a51-2247-4b35-9d96-8e7e59545b78', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Apache Druid ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apache Druid is a free, open-source, real-time analytics database built for sub-second OLAP queries on streaming and batch data at large scale.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apache Druid: Open-Source Real-Time Analytics Database$q$, seo_title),
  seo_meta_description = COALESCE($q$Apache Druid is a free, open-source database built for sub-second analytics queries on streaming and batch data at massive scale.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apache Druid is an open-source, real-time analytics database designed to deliver sub-second query performance on both streaming and batch data at large scale. It was originally created in 2011 by Eric Tschetter, Fangjin Yang, Gian Merlino, and Vadim Ogievetsky at Metamarkets to power that company's advertising analytics product, was open-sourced in 2012, and became an Apache Software Foundation top-level project in 2015. Druid is released under the Apache License 2.0 and is developed by an open-source community rather than a single company, though commercial vendors such as Imply offer managed and supported versions. Technically, Druid uses a columnar, time-indexed, and compressed storage format, ingests data natively from streaming sources such as Apache Kafka and Amazon Kinesis as well as batch sources, and supports standard SQL for querying alongside its native query language. Its architecture separates ingestion, storage, and query-serving components so that clusters can scale elastically, and it is built to sustain high query concurrency with built-in replication for fault tolerance. Druid is aimed at data engineers, analysts, and organizations building interactive analytics dashboards, clickstream and event analytics, and operational monitoring systems that require fast queries over high-volume, high-cardinality data. Because it is fully open source, there is no subscription cost to self-host Druid, though operating a production cluster requires infrastructure and operational expertise, or use of a managed offering from a third-party vendor.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Sub-second OLAP queries$q$, $q$Executes analytical queries with sub-second latency even at large data scale and under high load.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Real-time streaming ingestion$q$, $q$Natively ingests data from Apache Kafka and Amazon Kinesis alongside traditional batch ingestion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Columnar storage$q$, $q$Automatically stores data in a columnar, time-indexed, compressed format optimized for analytics.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$SQL support$q$, $q$Supports standard SQL queries in addition to Druid's native query language.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Elastic, scalable architecture$q$, $q$Loosely coupled ingestion, storage, and query components allow clusters to scale horizontally.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$High query concurrency$q$, $q$Designed to serve from hundreds to hundreds of thousands of queries per second.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Built-in replication$q$, $q$Replicates data across nodes for fault tolerance and continuous availability.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Free and open source under the Apache License 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Sub-second query performance at large data scale$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Native support for both streaming and batch ingestion$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$SQL support lowers the learning curve for analysts$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Operationally complex to self-host, requiring management of multiple node types in a cluster$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Steeper learning curve than simpler, single-node analytics databases$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Not designed for transactional workloads or single-row lookups$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Is Apache Druid free to use?$q$, $q$Yes, Druid is fully open source under the Apache License 2.0 and free to self-host. Commercial managed offerings are available from third-party vendors such as Imply.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$What is Apache Druid used for?$q$, $q$Druid is used to power real-time analytics dashboards, clickstream and event analytics, and operational monitoring systems that need sub-second queries over large volumes of data.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Does Apache Druid support SQL?$q$, $q$Yes, Druid supports standard SQL queries in addition to its native JSON-based query language.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Who maintains Apache Druid?$q$, $q$Druid is maintained as an Apache Software Foundation project by an open-source community. It was originally created in 2011 at Metamarkets before being open-sourced and later donated to the Apache Software Foundation.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Can Druid ingest streaming data in real time?$q$, $q$Yes, Druid natively integrates with streaming sources such as Apache Kafka and Amazon Kinesis for real-time ingestion.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Real-time analytics dashboards$q$, $q$Teams use Druid to power interactive, low-latency dashboards over large, frequently updated datasets.$q$, $q$Data engineers and analysts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Clickstream and event analytics$q$, $q$Companies use Druid to analyze high-volume clickstream and user event data at scale.$q$, $q$Product and analytics teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Operational and network monitoring$q$, $q$Organizations use Druid to query infrastructure and network telemetry data with sub-second response times.$q$, $q$DevOps and site reliability teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full source code","Self-hosted deployment","Apache License 2.0","Community support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'c2c6ffd7-cc01-4a25-88e6-38147cdc4215';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache Druid is an open-source, real-time analytics database purpose-built for sub-second queries over streaming and batch data at scale. It was originally developed in 2011 by Eric Tschetter, Fangjin Yang, Gian Merlino, and Vadim Ogievetsky at the advertising analytics startup Metamarkets, released as open source in 2012, and became an Apache Software Foundation project in 2015 under the Apache License 2.0.$q$, $q$As an Apache project, Druid is maintained by an open-source community rather than a single vendor, though commercial companies such as Imply provide managed hosting and support built on top of it.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Druid stores data in a columnar, time-indexed, and compressed format optimized for analytical queries, and natively ingests streaming data from sources such as Apache Kafka and Amazon Kinesis alongside batch data. It supports standard SQL for querying in addition to its native JSON-based query language, and is designed to sustain high query concurrency, from hundreds to hundreds of thousands of queries per second, with sub-second latency.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$architecture$q$, $q$Architecture$q$, 2, ARRAY[$q$Druid's architecture separates ingestion, storage, and query-serving into loosely coupled components, which allows clusters to scale elastically as data volume and query load grow. Built-in data replication across nodes provides fault tolerance and continuous availability for production workloads.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', $q$use-cases$q$, $q$Common Use Cases$q$, 2, ARRAY[$q$Organizations use Druid to power interactive analytics dashboards, clickstream and event analytics, and operational or network monitoring systems where fast queries over high-volume, high-cardinality data are required. It is not designed as a general-purpose transactional database or for single-row lookups.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c2c6ffd7-cc01-4a25-88e6-38147cdc4215', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Apache OFBiz ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apache OFBiz is a free, open-source Java framework offering ERP, e-commerce, CRM, and supply-chain applications maintained by the Apache Software Foundation.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2001, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apache OFBiz: Free Open-Source ERP & E-Commerce Suite$q$, seo_title),
  seo_meta_description = COALESCE($q$Apache OFBiz is a free, open-source Java framework for ERP, e-commerce, CRM, and manufacturing, maintained by the Apache Software Foundation.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apache OFBiz (Open For Business) is a free, open-source enterprise business framework maintained as a top-level project of the Apache Software Foundation. Originally created by David E. Jones and Andrew Zeneski in 2001, it became an official Apache top-level project in December 2006. Built in Java, OFBiz provides a common data model and a suite of pre-integrated business applications spanning accounting, order management, customer relationship management (CRM), e-commerce, warehouse and inventory management, manufacturing, and supply-chain fulfillment. Because it is a framework rather than a single fixed application, developers and system integrators use it as a foundation to build customized ERP, e-commerce, or manufacturing systems without vendor lock-in. The software is distributed under the Apache License 2.0, meaning it can be downloaded, modified, and deployed at no cost, with no licensing fees. Development and support come from an open-source community of committers and contributors coordinated through a Project Management Committee (PMC), with mailing lists, issue trackers, and documentation as the primary support channels rather than a commercial vendor. Apache OFBiz is best suited for organizations with in-house technical or development resources who need a highly customizable, self-hosted business management platform and want to avoid recurring SaaS ERP subscription costs. It is not a hosted or managed SaaS product; deployment, hosting, and maintenance are the responsibility of the adopting organization or its integration partners.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3e08b2a0-8365-4535-9e4d-361aee66a19f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$ERP & Accounting$q$, $q$Built-in modules for general accounting, billing, and financial management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$E-Commerce$q$, $q$Product catalog, storefront, and order management capabilities for online selling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$CRM$q$, $q$Customer relationship management tools integrated with the order and sales workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Warehouse & Manufacturing$q$, $q$Inventory, warehousing, and manufacturing/MRP modules for supply-chain operations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Extensible Java Framework$q$, $q$A shared data model and framework that developers can extend or customize for industry-specific needs.$q$, 4);

DELETE FROM tool_pros WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Completely free and open source under the Apache License 2.0, with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Broad functional coverage spanning ERP, e-commerce, CRM, and manufacturing in one framework$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Highly customizable and extensible for developers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Backed by a long-running Apache Software Foundation project with over two decades of history$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Requires significant technical/Java development expertise to deploy and customize$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$No official vendor support; reliant on community mailing lists and documentation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Not a hosted SaaS product — organizations must self-host and maintain infrastructure$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Steep learning curve compared to modern SaaS ERP alternatives$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Is Apache OFBiz free to use?$q$, $q$Yes. Apache OFBiz is fully open source and distributed under the Apache License 2.0, with no licensing fees or upfront costs.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Who maintains Apache OFBiz?$q$, $q$It is maintained as a top-level project of the Apache Software Foundation by a community-driven Project Management Committee of contributors.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$What can Apache OFBiz be used for?$q$, $q$It provides business applications for accounting, order management, CRM, e-commerce, warehousing, inventory, and manufacturing.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Does Apache OFBiz offer paid support?$q$, $q$The core project is community-supported (mailing lists, issue trackers, documentation); commercial support is available separately through third-party integrators rather than the Apache Software Foundation itself.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Custom ERP deployment$q$, $q$Building a tailored enterprise resource planning system on top of OFBiz's data model and modules.$q$, $q$Enterprises and system integrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$E-commerce backend$q$, $q$Using OFBiz's catalog, order, and fulfillment modules to power an online store.$q$, $q$Mid-size and large retailers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Manufacturing & supply chain management$q$, $q$Leveraging OFBiz's manufacturing and warehouse modules to manage production and inventory.$q$, $q$Manufacturing companies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full source code access","All core ERP, CRM, e-commerce, and manufacturing modules","Community support via mailing lists and issue tracker"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '3e08b2a0-8365-4535-9e4d-361aee66a19f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apache OFBiz is an open-source suite of business applications built on a Java framework, designed to be flexible enough for use across many industries. It is developed and maintained by the Apache Software Foundation as a top-level project, with its roots dating back to 2001.$q$, $q$Rather than being a single monolithic application, OFBiz provides a shared data model and framework on top of which accounting, e-commerce, CRM, manufacturing, and warehouse management modules are built, making it a common choice for organizations that need a customizable, self-hosted ERP backbone.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core modules cover accounting, order management, CRM, product and catalog management, promotions and pricing, warehousing and inventory, manufacturing, and contract and billing management.$q$, $q$As a framework, OFBiz is designed for deep customization and extension by developers, and it is distributed entirely free of charge under the Apache License 2.0.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$OFBiz suits organizations and integrators with technical development resources who want a self-hosted, fully customizable ERP/e-commerce framework and prefer to avoid ongoing SaaS licensing fees.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3e08b2a0-8365-4535-9e4d-361aee66a19f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Apaxy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apaxy is a free, open-source CSS theme that restyles Apache's default mod_autoindex directory listings into a cleaner, customizable browsing experience.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apaxy: Free Theme for Apache Directory Listings$q$, seo_title),
  seo_meta_description = COALESCE($q$Apaxy is a free, open-source CSS theme that gives Apache's default directory listings a cleaner, customizable look.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apaxy is a free, open-source theme that restyles the default directory listing produced by Apache HTTP Server's mod_autoindex module. It is maintained on GitHub under the account "oupala" and distributed under the GPL-3.0 license. Rather than being a full application, Apaxy is a set of CSS (and optional JavaScript/jQuery) files that site administrators drop onto their Apache server to visually transform the plain, table-based file listing that Apache generates by default into a more polished, modern-looking browsing interface. It supports customization such as adding welcome messages, download instructions, copyright notices, and custom MIME-type icons via .htaccess configuration, and it includes an optional gallery view built on lightgallery.js for browsing image directories. Because it only overrides visual presentation, Apaxy cannot change the underlying HTML table structure that Apache's mod_autoindex generates. It requires Apache HTTP Server version 2.4 or later and does not require any server-side application, database, or account — it is simply installed by copying theme files into the served directory. Apaxy is aimed at developers, sysadmins, and hobbyists who run Apache-based file or directory listings (e.g., for software downloads, personal file shares, or open directories) and want a nicer-looking, no-cost alternative to Apache's bare default index page. The project has accumulated roughly 1,900 stars on GitHub, indicating steady niche popularity among self-hosters.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Custom CSS Theme$q$, $q$Restyles Apache's default directory listing with a cleaner, modern visual design.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Custom Icons & Messages$q$, $q$Supports custom MIME-type icons, welcome messages, and notices via .htaccess configuration.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Gallery View$q$, $q$Optional image gallery display built on lightgallery.js for browsing directories of images.$q$, 2);

DELETE FROM tool_pros WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Free and open source (GPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Simple to install — just theme files copied onto an existing Apache server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$No database, backend, or account required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Actively maintained on GitHub with an established user base$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Only changes visual styling — cannot alter the underlying listing table structure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Requires Apache HTTP Server 2.4+ with mod_autoindex enabled$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Limited to directory-listing use cases, not a general web app$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Is Apaxy free to use?$q$, $q$Yes, Apaxy is free and open source, distributed under the GPL-3.0 license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$What does Apaxy require to run?$q$, $q$It requires Apache HTTP Server version 2.4 or later with mod_autoindex enabled.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Can Apaxy change the structure of the directory listing?$q$, $q$No. Apaxy only controls visual styling via CSS and JavaScript; it cannot alter the underlying table structure that Apache's mod_autoindex generates.$q$, 2, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Styling open file directories$q$, $q$Giving a polished look to public Apache directory listings such as software download pages.$q$, $q$Sysadmins and developers self-hosting file listings$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Personal file shares$q$, $q$Making a personal or small-team Apache-served file share more presentable.$q$, $q$Hobbyists and self-hosters$q$, 1);

DELETE FROM tool_pricing_plans WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$Open Source$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full theme source files","Customizable CSS, icons, and messages","Community support via GitHub"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '1e21a118-a6e5-4ac0-876d-d6b91e27da98';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apaxy is a simple, open-source theme that replaces Apache's default mod_autoindex directory listing page with a more visually appealing, customizable layout using CSS and optional JavaScript.$q$, $q$It is not a standalone application — it's a set of static theme files installed on an existing Apache HTTP Server (2.4+) to restyle how directory browsing appears to visitors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Apaxy supports CSS-based visual customization, optional JavaScript/jQuery enhancements, custom welcome messages or notices, custom MIME-type icons, and an image gallery view — while leaving the underlying table structure generated by Apache unchanged.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e21a118-a6e5-4ac0-876d-d6b91e27da98', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Apicbase ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apicbase is a cloud-based back-of-house management platform that helps multi-site restaurants, hotels, and catering groups manage recipes, inventory, purchasing, and food costs from one system.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (custom quote)$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE($q$~50 employees$q$, company_size),
  headquarters = COALESCE($q$Antwerp, Belgium$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$Dutch$q$, $q$French$q$, $q$German$q$]::text[],
  seo_title = COALESCE($q$Apicbase: Back-of-House Management for Restaurants$q$, seo_title),
  seo_meta_description = COALESCE($q$Apicbase is a cloud platform for multi-site restaurants and hospitality groups to manage recipes, inventory, purchasing, and food costs in one system.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apicbase is a cloud-based back-of-house operations platform built for multi-site food and beverage businesses, including restaurant groups, hotels, catering companies, and dark kitchens. Headquartered in Antwerp, Belgium, with a distributed remote team, the company positions its product as an operating system that centralizes recipe management, menu engineering, purchasing, inventory, and cost control in place of spreadsheets and disconnected tools. Core capabilities include standardized recipe management with AI-assisted dietary and allergen data completion, sales-data-driven menu engineering, cross-location inventory tracking with barcode scanning, automated purchasing and invoice matching, HACCP compliance and traceability reporting, group-wide analytics and demand forecasting, and sustainability tracking for food waste and carbon footprint. Apicbase offers native iOS and Android mobile apps for stock scanning, order receiving, and waste logging in the kitchen. The platform is sold through three tiers — Growth, Professional, and Enterprise — with pricing determined by number of outlets and delivered via custom quote after a demo request; annual billing is standard, with a 15% surcharge for monthly billing. It reports serving thousands of restaurant and hospitality sites globally, with named customers including large multi-site restaurant and hospitality groups. Apicbase is best suited for multi-location food businesses (its Growth plan requires a minimum of five outlets) seeking standardization, compliance, and cost visibility across locations, rather than single independent restaurants.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Recipe Management$q$, $q$Standardizes recipes across locations with AI-assisted dietary data completion and allergen compliance tracking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Menu Engineering$q$, $q$Uses sales data and forecasting to help build and refine profitable menus.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Inventory Management$q$, $q$Tracks stock across kitchens and outlets with barcode scanning, supported by the Apicbase mobile app.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Purchasing & Receiving$q$, $q$Automates order suggestions, invoice matching, and spend control across suppliers and locations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$HACCP & Compliance$q$, $q$Manages allergen communication, traceability, and audit-ready compliance reporting.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Analytics & Demand Forecasting$q$, $q$Provides group-wide reporting and demand forecasting for multi-site operations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Sustainability Tracking$q$, $q$Monitors food waste and carbon footprint as part of operational reporting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Mobile App (iOS & Android)$q$, $q$Lets kitchen staff scan stock, receive orders, and log waste events from a mobile device, online or offline.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Centralizes recipes, purchasing, inventory, and cost data across multiple sites in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Strong compliance and allergen management tooling for HACCP requirements$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Native iOS and Android apps support stock scanning and waste logging directly in the kitchen$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Tiered plans (Growth, Professional, Enterprise) scale with the number of outlets$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Pricing is not published and requires a demo and custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Growth plan requires a minimum of five outlets, making it less suited to single independent restaurants$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Monthly billing carries a 15% surcharge over annual billing$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$What is Apicbase used for?$q$, $q$Apicbase is a back-of-house management platform used by multi-site restaurants, hotels, and catering businesses to manage recipes, inventory, purchasing, food costs, and compliance from one system.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$How much does Apicbase cost?$q$, $q$Apicbase does not publish fixed pricing. It offers Growth, Professional, and Enterprise tiers priced by number of outlets, provided via custom quote after a demo request, with annual billing standard and a 15% surcharge for monthly billing.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Is Apicbase suitable for a single independent restaurant?$q$, $q$Apicbase is built primarily for multi-site operations — its Growth plan requires a minimum of five outlets — making it best suited for restaurant groups, hotel chains, and catering businesses rather than single-location restaurants.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Does Apicbase have a mobile app?$q$, $q$Yes, Apicbase offers native iOS and Android apps that let staff scan stock, receive orders, and log waste directly from the kitchen, both online and offline.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Where is Apicbase headquartered?$q$, $q$Apicbase is headquartered in Antwerp, Belgium, and operates with a remote-friendly team.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Standardizing recipes across a restaurant chain$q$, $q$Multi-site restaurant groups use Apicbase to keep recipes, costing, and allergen data consistent across every location.$q$, $q$Restaurant chains and franchises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Managing F&B operations across hotel outlets$q$, $q$Hotel groups use Apicbase to coordinate inventory, purchasing, and menu costing across multiple food and beverage outlets.$q$, $q$Hospitality and hotel groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$Compliance and inventory control for catering businesses$q$, $q$Catering companies use Apicbase's HACCP and traceability tools alongside inventory tracking to manage compliance at scale.$q$, $q$Catering and event food service businesses$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'f1735b50-6d47-4686-933f-7e0edb8f7d21';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apicbase is a back-of-house management platform built for multi-site food and beverage businesses such as restaurant chains, hotel groups, and catering companies. It replaces spreadsheets and disconnected point solutions with a single system covering recipes, purchasing, inventory, and cost tracking.$q$, $q$The company is headquartered in Antwerp, Belgium, and operates with a remote-friendly team. Apicbase markets itself toward operations, finance, and IT leaders at organizations running multiple kitchens or outlets that need standardized processes across locations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Apicbase's feature set spans recipe standardization with AI-assisted allergen and dietary data, menu engineering informed by sales data, cross-location inventory tracking with barcode scanning, automated purchasing and invoice matching, HACCP compliance and traceability reporting, and group-wide analytics with demand forecasting.$q$, $q$The platform also includes sustainability tracking for food waste and carbon footprint, plus native iOS and Android mobile apps that let kitchen staff scan stock, receive orders, and log waste directly from a device.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Apicbase does not publish per-location pricing. It offers three tiers — Growth (minimum five outlets), Professional, and Enterprise — with quotes provided after a demo request. Billing is annual by default, with a 15% surcharge available for monthly billing, and per-location pricing decreases as the number of outlets increases.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Apicbase targets multi-site restaurant groups, hotel food and beverage operations, and catering businesses that need to standardize recipes, control food costs, and maintain compliance across locations. It is not designed as a lightweight tool for single independent restaurants.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f1735b50-6d47-4686-933f-7e0edb8f7d21', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Apollo.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Apollo.io is an AI-powered sales intelligence and engagement platform offering a 210M+ contact database, outbound automation, data enrichment, and deal management in one tool.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$1,000+ employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, USA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Apollo.io: AI Sales Intelligence & Engagement Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Apollo.io combines a 210M+ contact database, outbound automation, data enrichment, and deal tools in one AI sales platform, with a free plan and paid tiers.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Apollo.io is a unified AI-powered sales platform founded in 2015 and headquartered in San Francisco, California. It combines a B2B contact and company database (reported at over 210 million contacts and 30 million companies) with outbound automation, inbound lead management, data enrichment, and deal execution tools, aiming to replace multiple standalone prospecting, email, and CRM-adjacent tools with a single product. Key capabilities include multichannel outbound sequences with AI assistance, real-time website visitor identification and form enrichment, contact and company data cleansing, a Chrome extension for prospecting on LinkedIn and other sites, AI call summaries and conversation analytics, pipeline boards, and workflow automation. Apollo reports over 600,000 companies using the platform and holds security certifications including SOC 2, ISO/IEC 27001, GDPR, and PCI DSS compliance. Pricing follows a freemium model: a free-forever Starter plan gives access to the database with limited monthly credits, while paid tiers — Basic, Professional, and Organization — are billed per user, cheaper on annual billing than monthly, and unlock higher data credit limits, CRM integrations, an international dialer, custom reporting, and API access on the top tier. Apollo.io is aimed at sales development representatives, account executives, sales leaders, revenue operations teams, and founders at growing companies who need prospecting, outreach, and pipeline tools in one platform rather than stitching together separate point solutions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '18089863-a0de-4693-8d26-13ead8c01a88';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '18089863-a0de-4693-8d26-13ead8c01a88' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$B2B Contact Database$q$, $q$Provides access to a database reported at 210M+ contacts and 30M+ companies with verified emails and phone numbers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Outbound Automation$q$, $q$Runs AI-assisted, multichannel outreach sequences with built-in email deliverability safeguards.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Inbound Lead Management$q$, $q$Identifies anonymous website visitors and enriches inbound form submissions in real time for automated routing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Data Enrichment$q$, $q$Cleanses and keeps contact and company records current across connected systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Deal Execution Tools$q$, $q$Offers pre-meeting insights, AI call summaries, pipeline boards, and conversation analytics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Workflow Automation$q$, $q$Prioritizes tasks and manages multi-touch campaign sequences automatically.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Chrome Extension$q$, $q$Surfaces contact and company details directly on LinkedIn and other websites during prospecting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$API Access$q$, $q$Available on the Organization plan for teams automating prospecting and data workflows at scale.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Free-forever plan gives access to the core contact database without a paid subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Combines database, outreach automation, enrichment, and deal tools in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Holds recognized security certifications including SOC 2 and ISO/IEC 27001$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Chrome extension integrates prospecting into LinkedIn, Gmail, and CRM workflows$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Higher-tier features like the international dialer and API access require the Organization plan, which has a 3-user minimum$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Monthly billing costs meaningfully more per user than annual billing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Data, mobile, and export credits are capped by plan, and add-ons or overages can raise total cost$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Does Apollo.io have a free plan?$q$, $q$Yes, Apollo offers a free-forever Starter plan with access to its contact database and a limited number of monthly data, mobile, and export credits.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$How much does Apollo.io cost?$q$, $q$Paid plans are Basic, Professional, and Organization, billed per user. Annual billing is cheaper per user than monthly billing, and the Organization plan requires a minimum of three users.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Who is Apollo.io built for?$q$, $q$Apollo.io is designed for sales development representatives, account executives, sales leaders, revenue operations teams, and founders who need prospecting, outreach, enrichment, and deal tracking in one platform.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Does Apollo.io offer an API?$q$, $q$API access is available on Apollo's Organization plan, enabling teams to automate prospecting and data workflows beyond manual use.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Where is Apollo.io headquartered?$q$, $q$Apollo.io is headquartered in San Francisco, California, and was founded in 2015.$q$, 4, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Prospecting and building outbound lists$q$, $q$Sales teams search Apollo's contact database and build targeted lists for outbound campaigns.$q$, $q$SDRs and sales development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Running multichannel outreach sequences$q$, $q$Account executives and SDRs automate email and multichannel outreach with AI-assisted sequencing and deliverability safeguards.$q$, $q$Sales development representatives and account executives$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Enriching inbound leads and routing them automatically$q$, $q$Revenue operations teams use Apollo to enrich form submissions and identify anonymous website visitors for automated lead routing.$q$, $q$Revenue operations and marketing teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Managing pipeline and deal execution$q$, $q$Sales leaders use pipeline boards, AI call summaries, and conversation analytics to track and advance deals.$q$, $q$Sales leaders and account executives$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Free$q$, $q$$0$q$, $q$N/A$q$, NULL, $q$["Access to the B2B contact database","Limited monthly mobile, export, and email credits","Up to 2 active sequences","No CRM integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Basic$q$, $q$$49/user/month (annual) or $59/user/month (monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["Increased data and export credits","CRM integrations","Core outbound sequencing features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Professional$q$, $q$$79/user/month (annual) or $99/user/month (monthly)$q$, $q$Monthly or annual$q$, NULL, $q$["Higher data, mobile, and export credit limits","Advanced sequencing and analytics","Deal management tools"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$Organization$q$, $q$$119/user/month (annual) or $149/user/month (monthly)$q$, $q$Monthly or annual, minimum 3 users$q$, NULL, $q$["International dialer","Custom reports","Advanced security controls and permissions","API access","Highest data, mobile, and export credit limits"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '18089863-a0de-4693-8d26-13ead8c01a88';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Apollo.io is a sales intelligence and engagement platform founded in 2015 and headquartered in San Francisco, California. It positions itself as a unified alternative to stitching together separate prospecting databases, outreach tools, and enrichment services.$q$, $q$The platform is built around a large B2B contact and company database combined with automation for outbound and inbound sales workflows, deal execution support, and reporting, used by over 600,000 companies according to Apollo.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Apollo's B2B database provides verified emails and phone numbers across 210M+ contacts and 30M+ companies with searchable filters. Outbound automation supports AI-assisted multichannel sequences with email deliverability safeguards, while inbound tools include real-time form enrichment and anonymous website visitor identification.$q$, $q$Additional capabilities include data enrichment and record cleansing, AI-generated call summaries and conversation analytics, pipeline boards for deal management, task prioritization and workflow automation, and a Chrome extension for finding contact details directly on LinkedIn and other web pages.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Apollo.io offers a free-forever Starter plan with access to its contact database and limited monthly credits. Paid plans — Basic, Professional, and Organization — are billed per user and are less expensive when billed annually than monthly; the Organization tier requires a minimum of three users and adds features such as an international dialer, custom reports, advanced security controls, and API access.$q$, $q$Trial periods on paid plans include a set number of credits and most features of the selected plan, and larger organizations with custom integration or security needs can request enterprise pricing.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Apollo.io is used by sales development representatives, account executives, sales leaders, revenue operations teams, marketers, and founders who need prospecting, outreach automation, enrichment, and deal tracking in a single platform rather than multiple separate tools.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('18089863-a0de-4693-8d26-13ead8c01a88', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Apostrophe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$ApostropheCMS is an open source, Node.js-based content management system with in-context visual editing, offering a free Community Edition plus paid Pro, Assembly, and Enterprise tiers.$q$, short_description),
  pricing_model = COALESCE($q$Freemium (open source core + paid Pro/Assembly/Enterprise tiers)$q$, pricing_model),
  starting_price = COALESCE($q$Free (Community Edition); Pro from $199/month$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE($q$Small team (~10-20 employees)$q$, company_size),
  headquarters = COALESCE($q$Philadelphia, Pennsylvania, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ApostropheCMS: Open Source Node.js CMS$q$, seo_title),
  seo_meta_description = COALESCE($q$ApostropheCMS is an open source Node.js content management system with visual in-context editing. Free Community Edition plus paid Pro and Enterprise plans.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ApostropheCMS (Apostrophe) is an open source content management system built on Node.js, MongoDB, and Vue.js, developed by Apostrophe Technologies, which spun out of the Philadelphia web agency P'unk Ave in 2019 (the ApostropheCMS project itself dates to 2010). It is designed for developers and content editors alike, combining a modular, extensible architecture with in-context visual editing so non-technical users can edit pages directly on the live site. Apostrophe can run as a traditional CMS or in headless mode, and integrates with front-end frameworks such as Astro, Gatsby, and Nuxt. The core Community Edition is free and open source under a permissive license, self-hostable, and includes unlimited users, content types, localization, custom forms, and basic SEO tools. Paid tiers add capabilities: Apostrophe Pro ($199/month for 5 editors) adds advanced permissions, document versioning, template builders, and AI-powered translation and SEO tools; Apostrophe Assembly (from $499/month for 5 sites) adds multitenant, white-label management for agencies and enterprises running many sites from one codebase. Apostrophe also sells managed hosting plans starting at $39/month and custom Enterprise agreements. It is best suited for digital agencies building client websites, software companies embedding a CMS into their products, and enterprises managing multiple brands or sites, particularly teams comfortable with a JavaScript/Node.js stack.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bea71619-57c8-4b82-a974-34977a4a07b2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bea71619-57c8-4b82-a974-34977a4a07b2' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$In-context visual editing$q$, $q$Content editors can edit page content directly on the live rendered page rather than through a separate admin form.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Headless / API-first mode$q$, $q$Apostrophe can serve content via API for omnichannel or decoupled front-end delivery.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Framework integrations$q$, $q$Official support for using Apostrophe as a headless backend with Astro, Gatsby, and Nuxt front ends.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Modular, extensible architecture$q$, $q$Built on Node.js and Vue.js with a module system for customizing and extending core functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Multisite management (Assembly)$q$, $q$Apostrophe Assembly provides a multitenant, white-label dashboard for running many sites from one codebase.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$AI-powered SEO and translation (Pro)$q$, $q$Paid Pro tier adds AI-assisted translation and AI-powered SEO tooling on top of the free core.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Open source and self-hostable$q$, $q$The Community Edition is free, open source, and can be self-hosted on any Node.js-compatible infrastructure.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Managed hosting$q$, $q$Apostrophe offers its own managed hosting plans starting at $39/month as an alternative to self-hosting.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Free, open source Community Edition with no user or content-type limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Developer-friendly, modular Node.js architecture with headless support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$In-context visual editing usable by non-technical content teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Managed hosting and enterprise support available directly from the vendor$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Requires JavaScript/Node.js development skills to build and customize sites, unlike no-code site builders$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Advanced features (AI tooling, versioning, multisite management) are gated behind paid Pro/Assembly tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Smaller plugin/theme ecosystem than dominant CMS platforms like WordPress$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Is ApostropheCMS free to use?$q$, $q$Yes. The Community Edition is free and open source, with unlimited users and content types, and can be self-hosted.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$What does Apostrophe Pro add over the free Community Edition?$q$, $q$Apostrophe Pro ($199/month for 5 editors) adds advanced permissions, document versioning, template builders, and AI-powered translation and SEO tools.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Can ApostropheCMS be used as a headless CMS?$q$, $q$Yes, Apostrophe supports headless/API-driven delivery and has official integrations for Astro, Gatsby, and Nuxt front ends.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Does Apostrophe offer hosting?$q$, $q$Yes. Apostrophe sells managed hosting starting at $39/month, in addition to self-hosting the open source Community Edition.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Agency website builds$q$, $q$Digital agencies use Apostrophe's visual editing and modular architecture to build and hand off client websites.$q$, $q$Digital agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Embedded CMS for SaaS products$q$, $q$Software companies integrate Apostrophe as a headless CMS to power content within their own products.$q$, $q$Software companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Multi-brand enterprise sites$q$, $q$Enterprises use Apostrophe Assembly to manage multiple brand or departmental websites from a single codebase and dashboard.$q$, $q$Enterprise organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Community Edition$q$, $q$Free$q$, $q$N/A (open source)$q$, NULL, $q$["Visual editing","Unlimited users and content types","Headless/standalone deployment","Localization","Custom forms","Basic SEO tools"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Apostrophe Pro$q$, $q$$199/month (5 editors included; $19/mo per additional editor)$q$, $q$Monthly$q$, NULL, $q$["Advanced permissions","Document versioning","Template builders","AI translations","AI-powered SEO","All Community Edition features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Apostrophe Assembly$q$, $q$From $499/month (5 sites included; $99/mo per additional site)$q$, $q$Monthly$q$, NULL, $q$["Multitenant dashboard","White-label capabilities","Single codebase for multiple sites","Cross-site template sharing","All Pro features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Managed Hosting$q$, $q$From $39/month$q$, $q$Monthly$q$, NULL, $q$["Single-server environments for dev/test/light production","Performance environments from $89/app server","Custom Enterprise hosting"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$Enterprise$q$, $q$Custom$q$, $q$Custom$q$, NULL, $q$["Dedicated success team","Custom SLAs","Private cloud instances","Implementation support"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = 'bea71619-57c8-4b82-a974-34977a4a07b2';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ApostropheCMS is an open source content management system built on Node.js, MongoDB, and Vue.js. It pairs a developer-friendly, modular architecture with in-context visual editing, letting content teams edit pages directly on the live site while developers retain full control over templates and code.$q$, $q$The project originated at the Philadelphia agency P'unk Ave and was spun out into its own company, Apostrophe Technologies, in 2019. The core CMS remains free and open source, with commercial Pro, Assembly, and hosting products layered on top for teams that need advanced features or managed infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Apostrophe supports both traditional page-based websites and headless/API-driven delivery, with official integrations for frameworks like Astro, Gatsby, and Nuxt. Content editors get in-context, WYSIWYG-style editing without needing to touch code.$q$, $q$Paid tiers extend the free core with advanced permissions, document version history, reusable template builders, AI-assisted translation and SEO tooling, and — for agencies managing many client sites — a multitenant, white-label dashboard called Apostrophe Assembly.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$ApostropheCMS is aimed at full-stack JavaScript developers, digital agencies building and maintaining client websites, software companies embedding CMS functionality into their own products, and enterprises that need to manage multiple brands or departmental sites from a single platform.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bea71619-57c8-4b82-a974-34977a4a07b2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Appcues ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Appcues is a no-code platform for building in-app product tours, walkthroughs, surveys, and onboarding flows that help product teams drive user activation and engagement.$q$, short_description),
  pricing_model = COALESCE($q$Subscription (tiered by monthly active users), custom quote$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2013, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Boston, Massachusetts, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Appcues: No-Code User Onboarding Platform$q$, seo_title),
  seo_meta_description = COALESCE($q$Appcues lets product and growth teams build in-app onboarding flows, tooltips, and surveys without code to improve user activation and engagement.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Appcues is a no-code product adoption and user onboarding platform founded in 2013 and headquartered in Boston, Massachusetts. It lets product managers, customer success teams, and growth teams build and launch in-app experiences — walkthroughs, tooltips, checklists, modals, surveys, and NPS prompts — without writing code, in order to guide users through onboarding and drive feature adoption. The platform includes user segmentation and targeting so experiences can be shown to specific cohorts based on behavior or attributes, analytics and reporting to measure the impact of flows on activation and engagement, integrations with common business and data tools, and AI-assisted features for building and drafting in-app content. Appcues publicly lists three pricing tiers on its website — Start, Grow, and Enterprise — differentiated primarily by monthly active user (MAU) volume, number of published experiences, and length of reporting history, with every tier including the full feature set (experience building, targeting, analytics, and integrations) rather than gating features by plan. Exact dollar pricing is not published on Appcues' own site and requires contacting sales, though third-party sources report the Start tier beginning in the low hundreds of dollars per month when billed annually. Appcues also runs a "Spark" program aimed at small teams (under 25 people) building their first in-app experience. It is best suited for SaaS and software companies that want to improve trial-to-paid conversion, feature adoption, and customer retention without engineering resources for every onboarding change.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06c62a86-d703-4a91-808a-a0aece77e321';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06c62a86-d703-4a91-808a-a0aece77e321' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$No-code experience builder$q$, $q$Visual editor for creating product tours, tooltips, modals, and checklists without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$In-app surveys and NPS$q$, $q$Collect user feedback and satisfaction scores directly within the product.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$User segmentation and targeting$q$, $q$Target in-app experiences to specific user cohorts based on behavior or attributes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Analytics and reporting$q$, $q$Track how in-app experiences affect activation, feature adoption, and engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$AI-assisted building$q$, $q$Prompt-driven tools to help teams draft and launch in-app experiences faster.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Tech stack integrations$q$, $q$Connects with common product analytics, CRM, and data tools used by product and growth teams.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$No coding required to build and publish in-app experiences$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Every pricing tier includes the full feature set rather than gating features behind higher plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Built-in analytics to measure the impact of onboarding and engagement flows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Established vendor with over a decade in the product adoption space$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Pricing is not published and requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Costs scale with monthly active users, which can raise the price significantly for high-traffic products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$No published free plan; smaller teams must go through the Spark program or sales$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Does Appcues require developers to use?$q$, $q$No. Appcues is built as a no-code platform so product, growth, and customer success teams can build in-app experiences without engineering help.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$How is Appcues priced?$q$, $q$Appcues offers Start, Grow, and Enterprise tiers priced primarily by monthly active users (MAUs), published experiences, and reporting history. Exact dollar pricing is not published and requires a sales quote.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Does every Appcues plan include the same features?$q$, $q$Appcues states that every plan includes its full feature set — experience building, targeting, analytics, and integrations — with plans differing mainly by MAU volume and reporting history.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Is there an option for very small teams?$q$, $q$Appcues runs a Spark program aimed at teams under 25 people building their first in-app experience.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$User onboarding$q$, $q$Guide new users through key setup steps and core features with in-app walkthroughs and checklists.$q$, $q$SaaS product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$Feature adoption campaigns$q$, $q$Announce and drive adoption of new features to existing users via targeted in-app messages.$q$, $q$Product marketing and growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$In-app feedback collection$q$, $q$Run surveys and NPS prompts inside the product to gather user feedback at key moments.$q$, $q$Customer success teams$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '06c62a86-d703-4a91-808a-a0aece77e321';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Appcues is a no-code platform for creating in-app user experiences — product tours, tooltips, checklists, modals, and surveys — aimed at improving user onboarding, feature adoption, and engagement without requiring engineering effort for every change.$q$, $q$Founded in 2013 and based in Boston, Massachusetts, Appcues serves product, growth, and customer success teams, primarily at SaaS and software companies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform provides a visual, no-code builder for in-app messages and guided flows, along with user segmentation to target specific cohorts, analytics to measure the impact of experiences on activation and retention, and integrations with common product analytics, CRM, and data tools.$q$, $q$Appcues has added AI-assisted capabilities to help teams draft and launch experiences faster using prompt-driven building.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', $q$pricing-and-fit$q$, $q$Pricing and Fit$q$, 2, ARRAY[$q$Appcues prices its Start, Grow, and Enterprise tiers primarily by monthly active user (MAU) volume rather than by feature access — every plan includes the full feature set. Exact prices are not published; prospective customers must contact sales for a quote, though the platform also runs a Spark program for small teams building their first in-app experience.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c62a86-d703-4a91-808a-a0aece77e321', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;


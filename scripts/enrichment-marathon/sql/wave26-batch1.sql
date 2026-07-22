-- Enrichment marathon batch: Snyk, SOCi, Social Blade, SocialBee, Socialhome, SocialPilot, Socket, Soda PDF

-- ── Snyk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Snyk is a developer-first security platform that finds and fixes vulnerabilities in open source dependencies, container images, infrastructure as code, and application code, including AI-generated code.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$1001-5000 employees$q$, company_size),
  headquarters = COALESCE($q$Boston, Massachusetts, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Snyk Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Snyk is a developer-first security platform for open source, container, IaC, and code scanning. See pricing plans, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Snyk is a developer-first application security platform founded in 2015 and headquartered in Boston, Massachusetts, with additional offices in Tel Aviv, London, Ottawa, and Zurich. It helps development and security teams find and automatically fix vulnerabilities across open source dependencies (Snyk Open Source), custom application code (Snyk Code, a SAST tool), container images (Snyk Container), and infrastructure as code (Snyk IaC), and it has expanded into securing AI-generated code and governing AI coding agents. Snyk integrates directly into developer workflows such as IDEs, CI/CD pipelines, and version control (GitHub, GitLab, Bitbucket), prioritizing fixes by exploitability and business risk rather than raw vulnerability counts. Snyk uses a freemium, per-contributing-developer pricing model: a Free plan covers individual developers and small teams with limited monthly tests across products, a Team plan starts at 25 US dollars per contributing developer per month, an Ignite mid-market tier is priced around 1,260 US dollars per developer per year, and Enterprise pricing is custom. Customers include companies such as Spotify, Twilio, and Snowflake. Snyk is best suited for engineering and AppSec teams that want vulnerability management built into the software development lifecycle rather than a separate, bolted-on security scanner.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Open source dependency scanning$q$, $q$Scans package manifests and lockfiles across ecosystems like npm, PyPI, Maven, and RubyGems to flag known vulnerabilities and license issues.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Static application security testing$q$, $q$Snyk Code analyzes proprietary application source code for security flaws directly in the IDE and pull requests.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Container image scanning$q$, $q$Scans Docker and other container images for OS and application-layer vulnerabilities, including base image recommendations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Infrastructure as code scanning$q$, $q$Checks Terraform, Kubernetes, and CloudFormation configuration files for misconfigurations before deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Automated fix pull requests$q$, $q$Automatically opens pull requests that upgrade or patch vulnerable dependencies to a safe version.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Risk-based prioritization$q$, $q$Ranks vulnerabilities by exploit maturity and reachability so teams fix what matters most first.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$CI/CD and developer tool integrations$q$, $q$Connects with GitHub, GitLab, Bitbucket, Jenkins, Jira, and popular IDEs for in-workflow scanning.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$AI code and agent governance$q$, $q$Validates AI-generated code and applies security policy to AI coding agents such as those in Cursor and Claude Code.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Deep integration into developer workflows (IDE, PR, CI/CD) rather than a separate scanning portal$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Generous free tier for individual developers and small projects$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Strong risk-based prioritization reduces false-positive fatigue$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Covers open source, code, container, and IaC in one connected platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Actively expanding coverage into AI-generated code security$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Per-contributing-developer pricing can get expensive as teams scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Team plan caps at 10 licenses, pushing growing teams toward custom Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Some advanced features require higher tiers or custom contracts$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Scan noise can still require tuning for large, legacy codebases$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Enterprise pricing is not published, making budgeting harder for mid-size buyers$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$What is Snyk used for$q$, $q$Snyk is used by development and security teams to find and fix vulnerabilities in open source dependencies, custom application code, container images, and infrastructure as code before they reach production.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Is Snyk free to use$q$, $q$Yes, Snyk offers a Free plan for individual developers and small teams with a limited number of projects and monthly tests per product.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$How much does Snyk cost$q$, $q$Paid plans start at 25 US dollars per contributing developer per month on the Team tier, with a mid-market Ignite tier and custom-quoted Enterprise pricing for larger organizations.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$What does contributing developer mean in Snyk pricing$q$, $q$A contributing developer is anyone who has committed code to a private repository monitored by Snyk within the trailing 90 days, which is the unit Snyk uses to price paid plans.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Does Snyk support container and infrastructure as code scanning$q$, $q$Yes, Snyk Container scans Docker and other container images and Snyk IaC scans Terraform, Kubernetes, and CloudFormation files for misconfigurations.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Who founded Snyk and when$q$, $q$Snyk was founded in 2015 and is headquartered in Boston, Massachusetts, with additional offices in Tel Aviv, London, Ottawa, and Zurich.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Does Snyk work with GitHub and GitLab$q$, $q$Yes, Snyk integrates with GitHub, GitLab, Bitbucket, Azure DevOps, and major CI/CD pipelines to scan code automatically on commits and pull requests.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Can Snyk automatically fix vulnerabilities$q$, $q$Snyk can open automated pull requests that upgrade or patch vulnerable open source dependencies to a secure version.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Shift-left application security$q$, $q$Engineering teams embed Snyk into IDEs and pull requests so vulnerabilities are caught and fixed before code merges.$q$, $q$Software development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Open source license and vulnerability compliance$q$, $q$Security and compliance teams use Snyk to track vulnerable and non-compliant open source packages across many repositories.$q$, $q$AppSec and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Container and cloud infrastructure hardening$q$, $q$Platform and DevOps teams scan container images and IaC templates before deployment to reduce misconfiguration risk.$q$, $q$DevOps and platform engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Free$q$, $q$$0$q$, $q$per contributing developer per month$q$, NULL, $q$["Up to 5 projects","Limited monthly tests per product","Access to Open Source, Code, Container, and IaC scanning","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Team$q$, $q$$25$q$, $q$per contributing developer per month$q$, NULL, $q$["Up to 100 projects","Higher test limits","Jira integration","Collaboration and reporting features","5-developer minimum, 10-license cap"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Ignite$q$, $q$$1,260$q$, $q$per contributing developer per year$q$, NULL, $q$["Designed for organizations under 50 developers","Unlimited projects","Bundles SCA, SAST, IaC, and Container","Includes 10 DAST targets"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Enterprise$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["Unlimited projects","Single sign-on and role-based access control","Custom security policies","Advanced reporting and priority support"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$overview$q$, $q$What Is Snyk$q$, 2, ARRAY[$q$Snyk (pronounced 'sneak') is a developer-first security platform founded in 2015 and headquartered in Boston, Massachusetts. It focuses on finding and fixing security issues where code is actually written, rather than scanning finished applications after the fact.$q$, $q$The platform covers four core areas: open source dependency scanning (software composition analysis), static application security testing of custom code, container image scanning, and infrastructure as code scanning. More recently, Snyk has extended into validating AI-generated code and governing AI coding agents as more production code is written by AI tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Snyk plugs into IDEs, pull requests, and CI/CD pipelines so vulnerabilities surface before code merges, and it automatically suggests or opens fix pull requests for known issues in open source packages.$q$, $q$Its risk-based prioritization engine scores issues by real-world exploitability and reachability rather than raw CVSS score, which reduces alert fatigue for engineering teams. Enterprise features include single sign-on, role-based access control, custom policies, and unified reporting across the Open Source, Code, Container, and IaC products.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Snyk prices per 'contributing developer' — anyone who has committed code to a monitored private repository in the trailing 90 days — rather than per seat. The Free plan is 0 US dollars and covers a limited number of projects and monthly tests.$q$, $q$Paid tiers start with Team at 25 US dollars per contributing developer per month (billed with a 5-developer minimum), followed by an Ignite package aimed at sub-50-developer companies at roughly 1,260 US dollars per developer per year, and a custom-quoted Enterprise plan for large organizations that need SSO, advanced governance, and unlimited projects.$q$]::text[], 2);


-- ── SOCi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SOCi is an AI-powered marketing platform for multi-location and franchise brands, automating local search, social media, reputation management, and paid advertising across hundreds or thousands of locations.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE(NULL, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE($q$501-1000 employees$q$, company_size),
  headquarters = COALESCE($q$San Diego, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SOCi Review 2026: Multi-Location Marketing Platform Guide$q$, seo_title),
  seo_meta_description = COALESCE($q$SOCi automates local search, social, reviews, and ads for multi-location brands. See pricing, features, pros, cons, and FAQs before you buy.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SOCi is a marketing management platform built for multi-location and franchise businesses such as restaurants, retail chains, financial services, healthcare groups, and property management companies. Founded in 2012 by Afif Khoury, Alo Sarv, and Tony Rindsberg, and headquartered in San Diego, California, SOCi centralizes marketing execution across hundreds or thousands of individual local business locations from a single dashboard. Its platform, marketed as an 'agentic workforce' powered by proprietary Genius AI, automates local search listing optimization, social media content scheduling and engagement, review generation and response, hyper-localized paid advertising, chatbot-driven customer engagement, and lead-generation surveys. SOCi reports powering marketing work across 500-plus enterprise brands and hundreds of thousands of local business locations. The company does not publish self-serve pricing; SOCi sells through a sales-quote model typically priced for mid-market and enterprise multi-location brands, with reported average annual contract values in the tens of thousands of dollars. SOCi is best suited for marketing operations, franchise, and multi-location brand teams that need to keep local listings, social presence, and review responses consistent and on-brand at scale, rather than small single-location businesses, which would likely find simpler social scheduling tools more cost effective.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Local search optimization$q$, $q$Manages and optimizes business listings across search engines and directories for every location from one dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Multi-location social media management$q$, $q$Builds content calendars and publishes and monitors engagement across social profiles for hundreds of locations at once.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Review management and AI responses$q$, $q$Monitors reviews across platforms and generates brand-appropriate AI responses to reduce manual reply workload.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Localized paid advertising$q$, $q$Creates and deploys hyper-localized ad campaigns tailored to each business location.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$AI chatbot engagement$q$, $q$Powers on-site and messaging chatbots for continuous customer interaction across locations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Lead generation surveys and forms$q$, $q$Deploys customer surveys and forms to capture insights and generate leads at the local level.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Centralized brand governance$q$, $q$Lets corporate teams control approved content and campaigns while allowing local-level customization.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Reporting and analytics dashboards$q$, $q$Provides performance reporting across locations to track visibility, engagement, and review trends.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Purpose-built for the operational complexity of multi-location and franchise marketing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Combines local search, social, reviews, and ads in one platform instead of several point tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$AI automation can materially reduce manual review-response and content workload$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Strong fit for regulated or brand-sensitive industries needing centralized approval workflows$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Established vendor with a large base of enterprise multi-location customers$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$No published self-serve pricing, requiring a sales conversation to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Enterprise-oriented pricing makes it less accessible to small or single-location businesses$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Feature depth can mean a steeper learning curve for new admins$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Best value depends on having many locations to spread cost across$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Some advanced AI agent features may require add-on modules$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$What is SOCi used for$q$, $q$SOCi is used by multi-location and franchise brands to manage local search listings, social media, review responses, paid advertising, and customer engagement across many locations from one platform.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Who is SOCi built for$q$, $q$SOCi targets multi-location enterprises and franchises in industries like restaurants, retail, financial services, healthcare, and property management.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$How much does SOCi cost$q$, $q$SOCi does not publish pricing publicly; it is sold via custom quote, with third-party research citing average annual spend around 23,000 US dollars.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$When was SOCi founded$q$, $q$SOCi was founded in 2012 by Afif Khoury, Alo Sarv, and Tony Rindsberg, and is headquartered in San Diego, California.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Does SOCi use AI$q$, $q$Yes, SOCi's Genius AI powers automated review responses, content generation, chatbots, and other 'agentic' marketing workflows across locations.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Is SOCi good for a single-location small business$q$, $q$SOCi is designed and priced for multi-location and franchise brands, so single-location businesses typically find simpler, lower-cost social or reputation tools more cost effective.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Does SOCi handle review management$q$, $q$Yes, SOCi monitors reviews across platforms and can generate AI-drafted, brand-appropriate responses at scale.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Is SOCi a publicly traded company$q$, $q$No, as of the most recent available information SOCi is privately held and has not completed an IPO.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Franchise brand social and review consistency$q$, $q$Corporate marketing teams push approved content and manage reviews consistently across every franchise location.$q$, $q$Franchise and multi-location marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Local search visibility at scale$q$, $q$Retail and restaurant chains optimize and monitor local listings for hundreds of storefronts simultaneously.$q$, $q$Retail and restaurant chain marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Localized paid advertising campaigns$q$, $q$Multi-location brands launch hyper-localized ad campaigns for each business location without manual setup per location.$q$, $q$Enterprise marketing operations teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Custom Enterprise Quote$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["Modules selected based on locations and needs","Local search, social, reviews, ads, and engagement tools","Dedicated onboarding and account management","Reporting across all managed locations"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$overview$q$, $q$What Is SOCi$q$, 2, ARRAY[$q$SOCi is a marketing platform purpose-built for multi-location and franchise brands that need to manage local search, social media, reviews, and advertising consistently across many individual locations.$q$, $q$Founded in 2012 and headquartered in San Diego, California, SOCi positions itself as an AI-powered digital workforce, using its proprietary Genius AI to automate marketing tasks that would otherwise require large teams of local marketers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SOCi covers local search listing optimization, social media content calendars and publishing, review monitoring and AI-generated responses, localized paid advertising, chatbot-based customer engagement, and survey-driven lead generation, all managed from centralized dashboards with location-level customization.$q$, $q$The platform is designed for brand consistency at scale, letting corporate marketing teams push approved content and campaigns down to individual locations while preserving local relevance and compliance.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SOCi does not publish self-serve pricing on its website; prospective customers request a custom quote based on the number of locations, modules selected, and contract term.$q$, $q$Third-party buyer research puts average annual SOCi software spend around 23,000 US dollars, with larger enterprise deployments running considerably higher, reflecting its positioning toward mid-market and enterprise multi-location brands rather than single-location small businesses.$q$]::text[], 2);


-- ── Social Blade ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Social Blade is a social media analytics website that tracks statistics, growth, and estimated earnings for YouTube, Instagram, TikTok, Twitch, and Facebook accounts.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$$3.99/month$q$, starting_price),
  founded_year = COALESCE(2008, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Raleigh, North Carolina, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Social Blade Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Social Blade tracks YouTube, Instagram, TikTok, and Twitch stats and growth. See pricing plans, features, pros, cons, and frequently asked questions.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Social Blade is a social media analytics website launched in 2008 as a hobby project by Jason Urgo and now headquartered in Raleigh, North Carolina. It tracks statistics and estimated growth for creators and channels across YouTube, Instagram, TikTok, Twitch, and Facebook, covering tens of millions of tracked accounts (Social Blade cites over 70 million YouTube channels and millions of profiles on other platforms). The site shows subscriber and follower counts, historical growth charts, ranking lists by platform and category, and estimated earnings based on views and engagement, plus future growth projections. Social Blade operates on a freemium model: anyone can look up public channel statistics for free with ads and limited historical data, while paid membership tiers remove ads and unlock deeper historical data and extra features. Published membership tiers are Bronze at 3.99 US dollars per month, Silver at 9.99 US dollars per month, Gold at 39.99 US dollars per month, and Platinum at 99.99 US dollars per month, with discounted annual billing and a 30-day free trial. Social Blade is used by content creators, YouTubers, social media managers, marketers, and brands to benchmark channel growth, research influencers, and estimate creator earnings for sponsorship or partnership decisions.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '20893471-10cd-4caf-9754-dcf19b7c21a8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '20893471-10cd-4caf-9754-dcf19b7c21a8' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Multi-platform channel tracking$q$, $q$Tracks statistics for YouTube, Instagram, TikTok, Twitch, and Facebook accounts in one place.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Historical growth charts$q$, $q$Displays daily and weekly subscriber, follower, and view growth trends over time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Estimated earnings calculator$q$, $q$Estimates potential advertising earnings for creators based on views and engagement.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Top lists and rankings$q$, $q$Ranks channels and accounts by country, category, and platform for discovery and benchmarking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Future growth projections$q$, $q$Predicts future subscriber and follower counts based on historical growth patterns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Channel comparison tools$q$, $q$Allows side-by-side comparison of multiple channels or accounts.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Report cards and grades$q$, $q$Summarizes an account's performance into an easy-to-read grade relative to similar accounts.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Developer API access$q$, $q$Offers an API for programmatic access to social statistics data.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Free tier gives useful basic statistics for any public account without signing up$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Covers all major social and video platforms in a single tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Long track record and large tracked-account database since 2008$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Affordable entry-level paid tier at under 4 US dollars per month$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Useful for both creators tracking their own growth and brands vetting influencers$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Free tier is ad-supported and limited to short historical data windows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Earnings estimates are approximations, not verified creator income$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Higher tiers (Gold, Platinum) can be expensive relative to feature gains$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Data accuracy depends on public platform APIs, which can lag or change$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Not a content scheduling or management tool, purely analytics and tracking$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$What is Social Blade used for$q$, $q$Social Blade is used to track social media account statistics, growth trends, and estimated earnings across YouTube, Instagram, TikTok, Twitch, and Facebook.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Is Social Blade free$q$, $q$Yes, basic statistics for public accounts are free to view, though ad-supported and limited in historical data compared to paid membership.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$How much does Social Blade cost$q$, $q$Paid membership tiers are Bronze at 3.99 US dollars per month, Silver at 9.99 US dollars per month, Gold at 39.99 US dollars per month, and Platinum at 99.99 US dollars per month.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$How accurate are Social Blade earnings estimates$q$, $q$Earnings estimates are approximations based on typical view and engagement rates, not confirmed figures from the platforms or creators themselves.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$When was Social Blade founded$q$, $q$Social Blade started in 2008 as a hobby project focused on YouTube statistics before expanding to other platforms.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Which platforms does Social Blade support$q$, $q$Social Blade supports YouTube, Instagram, TikTok, Twitch, and Facebook.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Does Social Blade have an API$q$, $q$Yes, Social Blade offers a developer API for programmatic access to social media statistics.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Is Social Blade only for YouTube$q$, $q$No, while Social Blade started with YouTube, it now also tracks Instagram, TikTok, Twitch, and Facebook accounts.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Creator growth tracking$q$, $q$Content creators monitor their own subscriber and view growth trends over time to gauge channel health.$q$, $q$YouTubers and social media creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Influencer vetting for brand partnerships$q$, $q$Brands and agencies research creator growth history and estimated earnings before sponsorship deals.$q$, $q$Marketing agencies and brand partnership managers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Competitive channel benchmarking$q$, $q$Channel owners compare their statistics against competitors or similar accounts in their category.$q$, $q$Social media managers and marketers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Free$q$, $q$$0$q$, $q$n/a$q$, NULL, $q$["Basic public channel statistics","Ad-supported viewing","Limited recent historical data","Basic growth predictions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Bronze$q$, $q$$3.99$q$, $q$per month$q$, NULL, $q$["Ad-free browsing","Extended historical data","Weekly and daily charts","Bigger top lists"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Silver$q$, $q$$9.99$q$, $q$per month$q$, NULL, $q$["All Bronze features","Deeper historical data access","Additional report card detail"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Gold$q$, $q$$39.99$q$, $q$per month$q$, NULL, $q$["All Silver features","Advanced data access","Priority features for power users"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$Platinum$q$, $q$$99.99$q$, $q$per month$q$, NULL, $q$["All Gold features","Maximum data access and limits","Top-tier membership benefits"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '20893471-10cd-4caf-9754-dcf19b7c21a8';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$overview$q$, $q$What Is Social Blade$q$, 2, ARRAY[$q$Social Blade is a website that tracks and displays statistics for social media accounts, originally launched in 2008 as a hobby project focused on YouTube before expanding to other platforms.$q$, $q$Today it covers YouTube, Instagram, TikTok, Twitch, and Facebook, letting anyone look up subscriber counts, follower growth, video views, and estimated earnings for public accounts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Social Blade generates daily and weekly growth charts, ranking lists (top channels by country, category, and platform), and 'grades' that summarize an account's performance relative to peers.$q$, $q$It also estimates potential ad revenue from views and engagement and provides future growth projections, which creators, brands, and talent managers commonly use to evaluate influencer partnerships.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20893471-10cd-4caf-9754-dcf19b7c21a8', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Basic channel statistics are free to view, supported by ads and limited to roughly two weeks of recent historical data on some metrics.$q$, $q$Paid membership removes ads and unlocks years of historical data, weekly and daily detailed charts, and expanded top lists, across four tiers: Bronze at 3.99 US dollars per month, Silver at 9.99 US dollars per month, Gold at 39.99 US dollars per month, and Platinum at 99.99 US dollars per month, with a 30-day free trial and discounted annual billing available.$q$]::text[], 2);


-- ── SocialBee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SocialBee is a social media management platform that helps individuals, small businesses, and agencies plan, create, schedule, and analyze content across multiple social profiles with built-in AI assistance.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$29/month$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Cluj-Napoca, Romania$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SocialBee Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$SocialBee is a social media scheduling and management platform with AI content tools. Compare pricing plans, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SocialBee is a social media management and scheduling platform founded in 2016 and headquartered in Cluj-Napoca, Romania. It is built for solopreneurs, small businesses, marketing teams, and agencies that need to plan, create, schedule, and analyze content across profiles on platforms such as Facebook, Instagram, X, LinkedIn, Pinterest, TikTok, YouTube, and Google Business Profile. Distinctive features include content categories that let users organize and evergreen-recycle posts on a set schedule, an AI content assistant for writing and repurposing posts, a visual content calendar, bulk editing and CSV uploads, post approval workflows, and analytics with exportable reporting. SocialBee runs a tiered subscription model with no permanent free plan but a 14-day free trial. Standard plans for individuals and small teams are Bootstrap at 29 US dollars per month, Accelerate at 49 US dollars per month, and Pro at 99 US dollars per month, each with annual-billing discounts of about 16 to 17 percent. Separate agency-tier plans (Pro50, Pro100, Pro150) scale from 179 to 449 US dollars per month for managing 50 to 150 social profiles across multiple client workspaces. SocialBee is a strong fit for teams that want content categorization and recycling alongside standard scheduling, and less suited to enterprises needing deep social listening or advanced paid-social integration.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '57763ac9-8244-4ff8-8a06-376f30693d6f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '57763ac9-8244-4ff8-8a06-376f30693d6f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Content categories and recycling$q$, $q$Organizes posts into categories with a recurring schedule that automatically reposts evergreen content over time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$AI content assistant$q$, $q$Generates and repurposes post copy using built-in AI writing tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Visual content calendar$q$, $q$Provides a drag-and-drop calendar view for planning and rearranging scheduled posts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Bulk scheduling and CSV upload$q$, $q$Lets users import and schedule large batches of posts at once via spreadsheet upload.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Post approval workflows$q$, $q$Allows team members or clients to review and approve content before it publishes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Multi-platform publishing$q$, $q$Publishes to Facebook, Instagram, X, LinkedIn, Pinterest, TikTok, YouTube, and Google Business Profile.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Analytics and reporting$q$, $q$Tracks post and profile performance with historical analytics and export options.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Multiple workspaces for agencies$q$, $q$Supports separate client workspaces for agencies managing several brands.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Content categories and recycling make evergreen content reuse simple$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Built-in AI assistant speeds up content creation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Clear plan structure for both individuals and agencies managing multiple clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$14-day free trial with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Supports a wide range of major social platforms including TikTok and Google Business Profile$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$No permanent free plan, only a time-limited trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Lowest tier caps at 5 social profiles, which may be limiting for growing brands$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Extra users and workspaces cost additional add-on fees$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Advanced analytics and internal notes are reserved for higher-priced plans$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Agency plans can become costly for larger client rosters$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$What is SocialBee used for$q$, $q$SocialBee is used to plan, schedule, publish, and analyze social media content across multiple platforms and profiles from one dashboard.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Does SocialBee have a free plan$q$, $q$No, SocialBee does not offer a permanent free plan, but it provides a 14-day free trial with no credit card required.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$How much does SocialBee cost$q$, $q$Standard plans start at 29 US dollars per month for the Bootstrap plan, ranging up to 99 US dollars per month for Pro, with agency plans from 179 to 449 US dollars per month.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$What makes SocialBee different from other schedulers$q$, $q$SocialBee's content categories feature lets users group and automatically recycle evergreen posts on a recurring schedule, which is less common in competing tools.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Which social platforms does SocialBee support$q$, $q$SocialBee supports Facebook, Instagram, X, LinkedIn, Pinterest, TikTok, YouTube, and Google Business Profile.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Is SocialBee good for agencies$q$, $q$Yes, SocialBee offers dedicated agency plans (Pro50, Pro100, Pro150) with multiple client workspaces and higher profile limits.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Where is SocialBee headquartered$q$, $q$SocialBee is headquartered in Cluj-Napoca, Romania, and was founded in 2016.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Does SocialBee include AI content tools$q$, $q$Yes, SocialBee includes an AI content assistant to help generate and repurpose post copy.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Evergreen content recycling$q$, $q$Small businesses set up content categories that automatically repost tips, promotions, and curated links on a rotating schedule.$q$, $q$Solopreneurs and small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Agency multi-client social management$q$, $q$Agencies manage scheduling, approvals, and reporting for multiple client brands from separate workspaces.$q$, $q$Social media marketing agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Team content approval workflows$q$, $q$Marketing teams draft posts and route them through an approval process before publishing to brand accounts.$q$, $q$In-house marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Bootstrap$q$, $q$$29/month ($24.20/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["Up to 5 social profiles","1 user, 1 workspace","10 content categories and sources","Unlimited AI generation","3 months of historical analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Accelerate$q$, $q$$49/month ($40.80/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["Up to 10 social profiles","50 content categories, 30 sources","2 years historical analytics","Advanced analytics and hashtag organizer","Bulk editor and CSV uploads"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Pro$q$, $q$$99/month ($82.50/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["Up to 25 social profiles","3 users, 5 workspaces","Unlimited categories and sources","2 years analytics with export","Internal notes and post approval"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$Pro50 / Pro100 / Pro150 (Agency)$q$, $q$$179-$449/month$q$, $q$monthly or yearly$q$, NULL, $q$["50-150 social profiles","5 users per workspace","10-30 client workspaces","All Pro plan features"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '57763ac9-8244-4ff8-8a06-376f30693d6f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$overview$q$, $q$What Is SocialBee$q$, 2, ARRAY[$q$SocialBee is a social media management platform founded in 2016 and headquartered in Cluj-Napoca, Romania, designed to help individuals, small businesses, and agencies plan and publish content across multiple social networks.$q$, $q$It supports scheduling and analytics for Facebook, Instagram, X, LinkedIn, Pinterest, TikTok, YouTube, and Google Business Profile, with a particular emphasis on organizing content into reusable categories.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$A signature SocialBee feature is content categories, which let users group posts by type (for example promotions, tips, or curated content) and set a recurring posting schedule that automatically recycles evergreen content over time.$q$, $q$The platform also includes an AI content assistant for drafting and repurposing posts, a visual calendar and bulk editor, CSV import for bulk scheduling, post approval workflows for teams, and analytics with historical data export.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57763ac9-8244-4ff8-8a06-376f30693d6f', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SocialBee's standard plans are Bootstrap at 29 US dollars per month for up to 5 social profiles, Accelerate at 49 US dollars per month for up to 10 profiles with advanced analytics, and Pro at 99 US dollars per month for up to 25 profiles with multiple users and workspaces.$q$, $q$Agency-focused plans (Pro50, Pro100, Pro150) range from about 179 to 449 US dollars per month for managing 50 to 150 profiles across multiple client workspaces. All plans include a 14-day free trial with no credit card required and annual billing discounts of roughly 16 to 17 percent.$q$]::text[], 2);


-- ── Socialhome ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Socialhome is a free, open-source, self-hostable federated personal profile and social networking platform that connects to other servers using the ActivityPub and Diaspora protocols.$q$, short_description),
  pricing_model = COALESCE($q$open-source$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Socialhome Review 2026: Federated Social Network Software$q$, seo_title),
  seo_meta_description = COALESCE($q$Socialhome is an open-source federated social profile and network you can self-host. Learn its features, protocols, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Socialhome is a free, open-source federated social networking application created by developer Jason Robinson. Its first version dates to 2014, and it was restarted in 2016 with a focus on federation, connecting to the wider decentralized social web (often called the Fediverse) using the ActivityPub and Diaspora protocols. Unlike commercial social platforms, Socialhome is not run by a single company; it is community-developed software distributed under the AGPLv3 open-source license, with source code hosted on GitHub and Codeberg, and an official public instance available at socialhome.network. Each Socialhome installation functions as a personal profile and home page combined with social networking features such as content streams, replies, and reshares, and profiles can interact with users on other federated platforms like Mastodon, Friendica, and Diaspora through protocol-level federation. Because it is open source and self-hostable, Socialhome has no company headquarters, employee count, or subscription pricing; anyone can run their own instance for free on their own server, and the only 'cost' is server hosting and technical setup. Socialhome is best suited for privacy-conscious individuals, Fediverse enthusiasts, and technically capable users or communities who want a self-hosted, ad-free alternative to centralized social networks, rather than mainstream consumers or businesses seeking marketing or scheduling tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a76489e-3b83-431e-b735-25922ce9a2b5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a76489e-3b83-431e-b735-25922ce9a2b5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Federated profile and content stream$q$, $q$Combines a personal home page with a social content stream that federates with other servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$ActivityPub and Diaspora protocol support$q$, $q$Interoperates with other Fediverse platforms like Mastodon, Friendica, and Diaspora through open federation protocols.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Self-hostable open-source software$q$, $q$Can be installed and run on a user's own server, giving full control over data and moderation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Content visibility controls$q$, $q$Lets users control the audience for individual posts, from public to limited followers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Rich media posting$q$, $q$Supports images and formatted content within posts and profile pages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Reshares and replies$q$, $q$Supports resharing and replying to federated content, similar to other social networking platforms.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$AGPLv3 open-source license$q$, $q$Source code is fully open and auditable, licensed under the GNU Affero General Public License v3.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Community-driven development$q$, $q$Developed and maintained by volunteer contributors via GitHub and Codeberg rather than a company.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Completely free and open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Federates with the broader Fediverse via ActivityPub and Diaspora protocols$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Full data control and privacy when self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$No advertising or algorithmic feed manipulation typical of commercial platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Transparent, auditable codebase maintained by the community$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Requires technical skill and server hosting to self-host an instance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$No official company support, customer service, or SLAs$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Smaller user base and network effect compared to mainstream social platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Not designed for business marketing, scheduling, or analytics use cases$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Development pace and updates depend on volunteer contributor availability$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$What is Socialhome$q$, $q$Socialhome is a free, open-source federated personal profile and social networking application that can be self-hosted and connects to the wider Fediverse via ActivityPub and Diaspora protocols.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Is Socialhome free to use$q$, $q$Yes, Socialhome is free open-source software; the only cost is server hosting if you choose to self-host your own instance.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Who created Socialhome$q$, $q$Socialhome was created by developer Jason Robinson, with its first version dating to 2014 and a federation-focused rebuild in 2016.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Can Socialhome interact with Mastodon$q$, $q$Yes, because Socialhome supports the ActivityPub protocol, it can federate and interact with Mastodon and other ActivityPub-based platforms.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Do I need to self-host Socialhome$q$, $q$You can join an existing community-run instance like the official socialhome.network, or self-host your own instance if you have server access and technical skills.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$What license is Socialhome released under$q$, $q$Socialhome is released under the AGPLv3 open-source license.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Is Socialhome a company or a product by a company$q$, $q$No, Socialhome is community-developed open-source software with no single company, headquarters, or commercial pricing behind it.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Is Socialhome good for businesses$q$, $q$Socialhome is designed for individual federated social profiles rather than business marketing or scheduling, so businesses typically need dedicated social media management tools instead.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Self-hosted personal social presence$q$, $q$Individuals run their own Socialhome instance to control their data and avoid centralized, ad-driven social platforms.$q$, $q$Privacy-conscious individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Fediverse participation$q$, $q$Users interact with people on Mastodon, Friendica, and Diaspora through federated protocols from a single Socialhome profile.$q$, $q$Fediverse and decentralized web enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Community-run social instances$q$, $q$Technical communities or collectives host a shared Socialhome instance for their members.$q$, $q$Open-source and tech communities$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full source code access under AGPLv3","Self-host on your own server","No subscription or license fees","Community support via GitHub and Codeberg"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '3a76489e-3b83-431e-b735-25922ce9a2b5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$overview$q$, $q$What Is Socialhome$q$, 2, ARRAY[$q$Socialhome is an open-source, self-hostable social networking application that functions as a federated personal profile and home page. It is not a commercial SaaS product but community software that anyone can install on their own server.$q$, $q$Created by developer Jason Robinson, the project's first version dates to 2014 and it was rebuilt in 2016 with a focus on federation using the ActivityPub and Diaspora protocols, letting Socialhome profiles interact with users on other Fediverse platforms such as Mastodon, Friendica, and Diaspora.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Each Socialhome profile combines a customizable personal home page with a social content stream, supporting posts, replies, reshares, and rich media, all visible to followers across federated networks.$q$, $q$Because the source code is open (licensed under AGPLv3) and hosted on GitHub and Codeberg, technical users can self-host their own instance, audit the code, or contribute improvements, giving them full control and no dependence on a corporate platform.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Socialhome itself is free open-source software with no license fee. Running an instance requires server hosting, which the user or community running the instance must pay for separately, similar to other self-hosted open-source platforms.$q$, $q$There is no vendor subscription, tiered plan, or company selling Socialhome as a hosted product; the official socialhome.network instance and any community-run instances set their own access policies independently.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a76489e-3b83-431e-b735-25922ce9a2b5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── SocialPilot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$SocialPilot is a social media management and scheduling platform for small businesses, growing teams, and agencies, offering bulk scheduling, analytics, a social inbox, and white-label reporting.$q$, short_description),
  pricing_model = COALESCE($q$subscription$q$, pricing_model),
  starting_price = COALESCE($q$$30/month$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$Ahmedabad, India$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$SocialPilot Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$SocialPilot is a social media scheduling and management tool built for agencies and small teams. Compare pricing, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$SocialPilot is a social media management platform founded in 2014 by Jimit Bagadiya and Tejas Mehta, with operations based in Ahmedabad, India, and a US registered office in Delaware. It serves individual professionals, small businesses, growing marketing teams, and agencies, reportedly supporting over 13,500 customers. Core capabilities include bulk post scheduling across networks like Facebook, Instagram, X, LinkedIn, Pinterest, Google Business Profile, and TikTok, a unified social inbox for managing comments and messages, analytics and white-label client reports, team collaboration with approval workflows, and AI-assisted content creation credits. SocialPilot uses a tiered subscription model with five plans: Essentials at 30 US dollars per month for solo users, Standard at 50 US dollars per month, Premium at 100 US dollars per month for growing agencies, Ultimate at 200 US dollars per month for established agencies, and a custom-quoted Enterprise tier with SSO and API access. Annual billing saves roughly 15 percent, and all paid plans include a 14-day free trial with no credit card required. SocialPilot was acquired by Group One in 2025. It is best suited for agencies and small-to-mid-size marketing teams that want white-label reporting and client management features at a lower price point than many larger competitors.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b0973005-06cc-44c0-81b7-f55d44c44d48' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Bulk post scheduling$q$, $q$Schedules large batches of posts across multiple social accounts and networks at once.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Unified social inbox$q$, $q$Manages comments, messages, and mentions from multiple platforms in a single inbox.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$White-label client reports$q$, $q$Generates branded analytics reports for agencies to share with clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Team collaboration and approvals$q$, $q$Supports multi-user workflows with content approval before publishing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$AI content assistance$q$, $q$Provides AI-generated post copy and content ideas using plan-based credit limits.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Content library and curation$q$, $q$Stores reusable content assets and curated content sources for scheduling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Analytics dashboards$q$, $q$Tracks performance metrics across connected social profiles and campaigns.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Browser extension for content discovery$q$, $q$Lets users capture and schedule content directly from the web via a browser extension.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Competitively priced compared to many larger social media management platforms$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Strong agency features like white-label reporting and client approval workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Broad platform support including Google Business Profile and TikTok$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$14-day free trial with no credit card required across all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Unified social inbox consolidates engagement across networks$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Lower tiers limit the number of connected social accounts and users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$AI credits are capped by plan and can run out on lower tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Enterprise features like SSO require custom-quoted pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Interface and analytics depth may feel less advanced than premium enterprise tools$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Recent acquisition by Group One introduces some uncertainty around product roadmap$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$What is SocialPilot used for$q$, $q$SocialPilot is used to schedule, publish, and analyze social media content across multiple platforms, with tools built for agencies managing several client accounts.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$How much does SocialPilot cost$q$, $q$SocialPilot plans range from 30 US dollars per month for Essentials up to 200 US dollars per month for Ultimate, with a custom-quoted Enterprise tier for larger operations.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Does SocialPilot have a free trial$q$, $q$Yes, all SocialPilot paid plans include a 14-day free trial with no credit card required.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Is SocialPilot good for agencies$q$, $q$Yes, SocialPilot includes white-label client reporting, approval workflows, and multi-account management aimed at agencies.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$When was SocialPilot founded$q$, $q$SocialPilot was founded in 2014 by Jimit Bagadiya and Tejas Mehta.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Which social networks does SocialPilot support$q$, $q$SocialPilot supports Facebook, Instagram, X, LinkedIn, Pinterest, Google Business Profile, TikTok, and other major networks.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Was SocialPilot acquired$q$, $q$Yes, SocialPilot was acquired by Group One in 2025.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Does SocialPilot offer a social inbox$q$, $q$Yes, the Standard plan and above include a unified social inbox for managing comments and messages across platforms.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Agency client social management$q$, $q$Agencies schedule content, generate white-label reports, and route approvals for multiple client brands.$q$, $q$Social media marketing agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Small business social scheduling$q$, $q$Solo marketers and small businesses schedule and publish content across their core social profiles.$q$, $q$Small business owners and solo marketers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Team engagement management$q$, $q$Marketing teams monitor and respond to comments and messages across platforms from a unified inbox.$q$, $q$In-house marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Essentials$q$, $q$$30/month ($25.50/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["7 social media accounts","1 user","500 AI credits","Content library and basic scheduling"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Standard$q$, $q$$50/month ($42.50/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["15 accounts, 3 users","1,000 AI credits","Social inbox","Team collaboration and analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Premium$q$, $q$$100/month ($85/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["25 accounts, 6 users","5,000 AI credits","Bulk scheduling","White-label reports and client approval"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Ultimate$q$, $q$$200/month ($170/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["50 accounts, unlimited users","Unlimited AI credits","Advanced white label","Dedicated account manager"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$Enterprise$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["Unlimited accounts and users","Single sign-on","API access","Dedicated account management"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = 'b0973005-06cc-44c0-81b7-f55d44c44d48';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$overview$q$, $q$What Is SocialPilot$q$, 2, ARRAY[$q$SocialPilot is a social media management platform founded in 2014 by Jimit Bagadiya and Tejas Mehta, built primarily for small businesses, growing marketing teams, and agencies managing multiple client accounts.$q$, $q$The company operates out of Ahmedabad, India, with a US registered office in Delaware, and reports serving over 13,500 customers worldwide. SocialPilot was acquired by Group One in 2025.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$SocialPilot supports bulk scheduling and publishing across major networks including Facebook, Instagram, X, LinkedIn, Pinterest, Google Business Profile, and TikTok, along with a unified social inbox to manage comments and messages from one place.$q$, $q$Agency-focused features include white-label client reports, client approval workflows, team collaboration with role-based permissions, and AI content generation credits that scale with plan tier.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b0973005-06cc-44c0-81b7-f55d44c44d48', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$SocialPilot offers five tiers: Essentials at 30 US dollars per month for one user and 7 social accounts, Standard at 50 US dollars per month adding the social inbox and team collaboration, Premium at 100 US dollars per month for growing agencies with white-label reports, and Ultimate at 200 US dollars per month with unlimited users and advanced white labeling.$q$, $q$A custom-quoted Enterprise plan adds single sign-on and API access for large-scale operations. Annual billing saves about 15 percent compared to monthly pricing, and every plan includes a 14-day free trial with no credit card required.$q$]::text[], 2);


-- ── Socket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Socket is a developer-first software supply chain security platform that detects malicious, vulnerable, and risky open source packages across ecosystems like npm, PyPI, and Go before they reach production.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2020, founded_year),
  company_size = COALESCE($q$51-200 employees$q$, company_size),
  headquarters = COALESCE($q$San Francisco, California, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Socket Review 2026: Supply Chain Security Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$Socket detects malware and risky open source packages across npm, PyPI, and Go. Compare Socket pricing, features, pros, cons, and FAQs.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Socket is a software supply chain security platform founded in 2020 by CEO Feross Aboukhadijeh and headquartered in San Francisco, California. It is not related to the Socket.IO websocket library; instead, Socket protects software supply chains by statically analyzing open source packages across ecosystems including npm, PyPI, Go, Maven, Cargo, NuGet, and RubyGems to detect malware, typosquatted package names, suspicious install scripts, obfuscated code, and other supply-chain attack indicators, often flagging malicious packages within minutes of publication. Socket integrates via a GitHub App that comments directly on pull requests, a CLI, an MCP server, IDE extensions, and a firewall-style package-installer proxy, plus integrations with GitLab, Bitbucket, Azure DevOps, Jira, Slack, and Microsoft Teams. The company has raised roughly 125 million US dollars in venture funding across multiple rounds, including a 60 million US dollar Series C in 2026, and employs around 100 people. Socket uses a freemium pricing model: a Free tier covers basic scanning, a Team tier costs 25 US dollars per seat per month (or 20 US dollars per seat per month billed annually) and adds reachability analysis and Slack alerts, a Business tier costs 50 US dollars per seat per month and adds SBOM generation and SSO, and Enterprise pricing is custom. Socket is best suited for engineering and security teams that want proactive, real-time protection against malicious open source dependencies rather than just known-CVE vulnerability scanning.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Malware and typosquat detection$q$, $q$Flags malicious and typosquatted open source packages, often within minutes of publication.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Static package behavior analysis$q$, $q$Analyzes packages for install scripts, obfuscated code, and use of sensitive system APIs before install.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$GitHub pull request integration$q$, $q$Posts security findings directly as comments on pull requests via a GitHub App.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Reachability analysis$q$, $q$Determines whether vulnerable code paths are actually reachable in your application to reduce false positives.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$SBOM generation and export$q$, $q$Generates software bill of materials in CycloneDX, SPDX, and OpenVEX formats for compliance audits.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Package installer firewall$q$, $q$Blocks risky packages at install time through a proxy that sits in front of package managers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Multi-ecosystem coverage$q$, $q$Supports npm, PyPI, Go, Maven, Cargo, NuGet, RubyGems, and other open source ecosystems.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$CLI and MCP server access$q$, $q$Offers a command-line interface and an MCP server for integrating scans into custom developer and AI-agent workflows.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Detects malicious and typosquatted packages faster than traditional CVE-based scanners$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Strong native GitHub pull request integration for in-workflow review$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Free tier available for basic scanning needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Broad ecosystem coverage beyond just JavaScript and npm$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Well-funded, backed by 125 million US dollars in venture funding as of 2026$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Per-seat pricing can add up for larger engineering organizations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Advanced features like SBOM export and SSO require the higher Business tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Newer company (founded 2020) with a shorter track record than legacy AppSec vendors$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Best value requires integrating deeply into CI/CD and PR workflows, which takes setup time$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Enterprise pricing is not published and requires a custom quote$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$What is Socket used for$q$, $q$Socket is used to detect malicious, typosquatted, and risky open source packages across ecosystems like npm, PyPI, and Go before they reach production.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Is Socket the same as Socket.IO$q$, $q$No, Socket (socket.dev) is a supply chain security company unrelated to Socket.IO, which is a real-time websocket communication library.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$How much does Socket cost$q$, $q$Socket offers a free tier, with paid plans starting at 25 US dollars per seat per month for Team and 50 US dollars per seat per month for Business; Enterprise pricing is custom.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Who founded Socket$q$, $q$Socket was founded in 2020 by Feross Aboukhadijeh, who serves as CEO, and is headquartered in San Francisco, California.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Does Socket integrate with GitHub$q$, $q$Yes, Socket has a GitHub App that scans repositories and posts security findings as pull request comments.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$What package ecosystems does Socket support$q$, $q$Socket supports npm, PyPI, Go, Maven, Cargo, NuGet, RubyGems, and other open source package ecosystems.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Does Socket generate SBOMs$q$, $q$Yes, Socket's Business tier and above can generate software bills of materials in CycloneDX, SPDX, and OpenVEX formats.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$How much funding has Socket raised$q$, $q$Socket has raised approximately 125 million US dollars across multiple funding rounds, including a 60 million US dollar Series C in 2026.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Blocking malicious npm packages$q$, $q$Engineering teams catch malicious or typosquatted packages before they are installed or merged into a codebase.$q$, $q$Software development and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Supply chain compliance and SBOM reporting$q$, $q$Security and compliance teams generate SBOMs and audit trails for regulatory or customer requirements.$q$, $q$AppSec and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$CI/CD pipeline protection$q$, $q$DevOps teams add Socket to CI/CD pipelines and GitHub pull requests to automatically flag risky dependency changes.$q$, $q$DevOps and security engineering teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Free$q$, $q$$0$q$, $q$per month$q$, NULL, $q$["Basic package scanning","Malware and risk alerts","GitHub App integration","Limited scan scope"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Team$q$, $q$$25/seat/month ($20/seat/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["Reachability analysis","Slack alerts","Reduced false positives","Pull request integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Business$q$, $q$$50/seat/month ($40/seat/month billed yearly)$q$, $q$monthly or yearly$q$, NULL, $q$["SBOM generation","SSO and SAML","Compliance-ready reporting","All Team features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Enterprise$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["Custom governance and policies","Dedicated support","Expanded integrations","Volume-based pricing"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$overview$q$, $q$What Is Socket$q$, 2, ARRAY[$q$Socket is a supply chain security platform founded in 2020 by Feross Aboukhadijeh and headquartered in San Francisco, California. It focuses specifically on protecting applications from malicious and risky open source dependencies rather than only known vulnerabilities.$q$, $q$Note: Socket (socket.dev) is unrelated to Socket.IO, the real-time websocket communication library; Socket the security company analyzes packages across ecosystems like npm, PyPI, Go, Maven, Cargo, NuGet, and RubyGems for supply-chain risk.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Socket statically analyzes open source packages and their dependencies to detect malware, typosquatting, obfuscated code, unexpected install scripts, and use of sensitive APIs like network, filesystem, and shell access, often catching threats within minutes of a package being published.$q$, $q$It integrates directly into developer workflows through a GitHub App that posts security findings as pull request comments, a command-line interface, an MCP server, IDE extensions, and a firewall-style package-installer proxy, alongside SBOM export in CycloneDX, SPDX, and OpenVEX formats.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Socket offers a free tier for basic package scanning and monitoring. Paid tiers scale by seat: Team costs 25 US dollars per seat per month (about 20 US dollars per seat per month billed annually) and adds reachability analysis and Slack alerting, while Business costs 50 US dollars per seat per month and adds SBOM generation and single sign-on for enterprise rollouts.$q$, $q$Enterprise pricing is custom and typically negotiated for large organizations needing advanced governance, dedicated support, and expanded integrations.$q$]::text[], 2);


-- ── Soda PDF ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Soda PDF is a PDF editing, conversion, and e-signature software suite for Windows and web, offering tools to create, edit, merge, secure, and sign PDF documents.$q$, short_description),
  pricing_model = COALESCE($q$freemium$q$, pricing_model),
  starting_price = COALESCE($q$$12/month$q$, starting_price),
  founded_year = COALESCE(2010, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Montreal, Quebec, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$]::text[],
  seo_title = COALESCE($q$Soda PDF Review 2026: Pricing, Features and Alternatives$q$, seo_title),
  seo_meta_description = COALESCE($q$Soda PDF offers PDF editing, conversion, OCR, and e-signature tools. Compare Soda PDF pricing plans, features, pros, cons, and frequently asked questions.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Soda PDF is a PDF editing and document management software suite developed by LULU Software, founded in 2010 and headquartered in Montreal, Quebec, Canada. It offers desktop applications for Windows plus browser-based and mobile access, letting users create, edit, convert, merge, split, compress, secure, and electronically sign PDF documents, along with optical character recognition (OCR) for scanned files and AI-assisted tools for summarizing or translating document content. Soda PDF provides limited free online tools alongside paid subscription tiers: Pro (aimed at individual professional use, roughly 12 US dollars per month or 48 US dollars per year), Team (3 to 19 licenses with a per-license discount), and Business (roughly 20 US dollars per month or 198 US dollars per year, adding multi-platform deployment support for Windows, Mac, Linux, Citrix, and SCCM, larger cloud storage allowances, and phone support). Common use cases include converting PDFs to and from Word, Excel, and image formats, filling and creating fillable forms, redacting sensitive information, and collecting e-signatures. Soda PDF is best suited for individuals, small teams, and businesses that need a full-featured, moderately priced PDF editor as an alternative to Adobe Acrobat, particularly organizations already comfortable with Windows desktop software.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d012baf-f581-41bc-84f4-cdf167ff2fba' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$PDF editing$q$, $q$Edit text, images, and page layout directly within existing PDF documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Format conversion$q$, $q$Converts PDFs to and from Word, Excel, PowerPoint, and common image formats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Optical character recognition (OCR)$q$, $q$Extracts editable, searchable text from scanned documents and image-based PDFs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$E-signature collection$q$, $q$Lets users sign documents electronically and collect signatures from others.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Fillable form creation$q$, $q$Builds interactive PDF forms with fillable fields for data collection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Document security and redaction$q$, $q$Applies password protection, encryption, and redaction to sensitive documents.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Batch processing$q$, $q$Processes multiple PDF files at once for tasks like conversion or compression.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$AI-assisted document tools$q$, $q$Uses AI to summarize or translate document content within the app.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Full-featured PDF editor at a lower price than many premium competitors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Available as both Windows desktop software and a browser-based web app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Includes OCR and e-signature tools without needing separate add-ons$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Team and Business tiers support multi-license deployment for organizations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Free online tools available for quick, occasional PDF tasks$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Full functionality requires a paid subscription or license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Primarily Windows-centric, with more limited native Mac and Linux support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Free tools are limited compared to paid plan capabilities$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Some users report a steeper learning curve for advanced editing features$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Cloud storage allowances are capped by plan tier$q$, 4);

DELETE FROM tool_faqs WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$What is Soda PDF used for$q$, $q$Soda PDF is used to create, edit, convert, merge, secure, and electronically sign PDF documents on Windows desktop or through a web browser.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Is Soda PDF free$q$, $q$Soda PDF offers limited free online tools for basic tasks, but full editing and advanced features require a paid Pro, Team, or Business subscription.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$How much does Soda PDF cost$q$, $q$Reported pricing starts around 12 US dollars per month for individual plans, with Business plans around 20 US dollars per month, though current pricing should be confirmed on the official Soda PDF website.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Who makes Soda PDF$q$, $q$Soda PDF is developed by LULU Software, founded in 2010 and headquartered in Montreal, Quebec, Canada.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Does Soda PDF support e-signatures$q$, $q$Yes, Soda PDF includes built-in e-signature collection as part of its paid plans.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Does Soda PDF work on Mac$q$, $q$Soda PDF Business supports deployment across Windows, Mac, and Linux, while lower tiers are primarily focused on Windows and web access.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Is Soda PDF a good Adobe Acrobat alternative$q$, $q$Yes, Soda PDF is commonly positioned as a lower-cost alternative to Adobe Acrobat, offering similar core editing, conversion, and signing features.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Does Soda PDF include OCR$q$, $q$Yes, Soda PDF includes optical character recognition for extracting editable text from scanned documents and image-based PDFs.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Everyday PDF editing and conversion$q$, $q$Professionals edit text, convert files to and from Word or Excel, and merge documents for daily office work.$q$, $q$Office professionals and administrative staff$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Digitizing scanned paperwork$q$, $q$Organizations use OCR to convert scanned paper documents into searchable, editable digital PDFs.$q$, $q$Legal, accounting, and administrative teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Business-wide PDF tool deployment$q$, $q$IT teams deploy Soda PDF Business across Windows, Mac, and Linux machines company-wide with centralized license management.$q$, $q$IT administrators and business teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Pro$q$, $q$$12/month ($48/year)$q$, $q$monthly or yearly$q$, NULL, $q$["Full PDF editing and conversion","AI tools access","5 GB cloud storage","E-sign and OCR","1,200 pages/year translation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Team$q$, $q$Discounted per-license rate$q$, $q$monthly or yearly$q$, NULL, $q$["3 to 19 licenses","All Pro features","10 percent discount per license"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$Business$q$, $q$$20/month ($198/year)$q$, $q$monthly or yearly$q$, NULL, $q$["All Pro features","Multi-platform deployment (Windows, Mac, Linux, Citrix, SCCM)","10 GB cloud storage","Phone support"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '7d012baf-f581-41bc-84f4-cdf167ff2fba';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$overview$q$, $q$What Is Soda PDF$q$, 2, ARRAY[$q$Soda PDF is a PDF creation, editing, and document management software suite developed by LULU Software, founded in 2010 and headquartered in Montreal, Quebec, Canada.$q$, $q$It is available as a Windows desktop application and through a browser-based web app, giving users tools to create, edit, convert, merge, split, compress, secure, and electronically sign PDF files without needing Adobe Acrobat.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Core capabilities include full PDF editing (text, images, and pages), format conversion to and from Word, Excel, PowerPoint, and image formats, optical character recognition for scanned documents, fillable form creation, redaction, and password protection or encryption.$q$, $q$Soda PDF also includes AI-assisted tools for tasks like summarizing or translating document content, built-in e-signature collection, batch processing for handling multiple files at once, and cloud storage for accessing documents across devices.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d012baf-f581-41bc-84f4-cdf167ff2fba', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Soda PDF offers limited free online tools for basic tasks like converting or merging PDFs, alongside paid subscription tiers for full functionality. The Pro plan is aimed at individual professional users, the Team plan covers 3 to 19 licenses with a per-license discount, and the Business plan adds multi-platform deployment, larger cloud storage, and phone support for organizations.$q$, $q$Reported pricing places the Pro-equivalent Standard tier around 12 US dollars per month (48 US dollars billed yearly) and the Business tier around 20 US dollars per month (198 US dollars billed yearly), though current exact pricing should be confirmed on the Soda PDF website since promotions and tiers can change.$q$]::text[], 2);



-- Enrichment batch: Sauce Labs, TestingBot, Uptime Kuma, StatusCake, HetrixTools, Oh Dear, Hyperping, Cronitor, SigNoz, Prometheus, VictoriaMetrics, Netdata, Zabbix, Icinga, Nagios XI, Groundcover, Coralogix, Logz.io, Mezmo, Honeycomb, Airbrake, GlitchTip, Errbit, OpenObserve, Uptrace, HyperDX, CrowdSec, Wazuh, Security Onion, Falco, Trivy, Grype, Syft, Clair, OpenVAS, Greenbone, Nuclei, Burp Suite, OWASP ZAP, Mend.io, SonarQube, Checkmarx, Veracode, Gitleaks, TruffleHog, Akeyless, HashiCorp Vault, 1Password Secrets Automation, Passbolt, Psono, Padloc, KeeWeb, Vaultwarden, Authentik, Zitadel, FusionAuth, Keycloak, SuperTokens, Ory, Cerbos, Permit.io, OpenFGA, SpiceDB, WorkOS, Stytch, Descope, Kinde, Clerk, Logto, Hanko, Corbado, Frontegg, SlashID, Scalekit, PropelAuth, Casdoor, OpenSign
-- Publishes 77 bulk-imported tool(s) with full editorial content.

-- ── Sauce Labs ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud platform for automated and manual web and mobile app testing across thousands of real and virtual devices and browsers.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sauce Labs is a cloud test platform for web and mobile apps, offering real/virtual device testing, visual testing, and error reporting.$q$,
  og_description = $q$Sauce Labs is a cloud test platform for web and mobile apps, offering real/virtual device testing, visual testing, and error reporting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$AI-driven test authoring$q$, $q$Generates and updates automated tests across web and mobile platforms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Real device cloud$q$, $q$Access to 9,000+ real iOS and Android devices for mobile app testing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Virtual device cloud$q$, $q$2,500+ emulator, simulator, and browser/OS combinations for cross-browser and cross-device testing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Visual testing$q$, $q$UI regression detection with monthly snapshot allowances by plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Error reporting$q$, $q$Crash detection and analysis for mobile and web applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Mobile app distribution$q$, $q$Beta testing and app distribution with configurable app and tester limits.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Framework support$q$, $q$Works with Selenium, Appium, Cypress, and Playwright.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Very large real and virtual device/browser inventory (9,000+ real devices, 2,500+ virtual combinations)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Supports major automation frameworks (Selenium, Appium, Cypress, Playwright)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Includes visual testing, error reporting, and app distribution alongside core test execution$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Free trial available on all paid plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Used by large enterprises including Bank of America, Microsoft, and Walmart$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Entry-level plans are limited to a single parallel test$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Sauce Error Reporting and Sauce Visual are priced separately from core test plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Enterprise-grade features (SSO, private device cloud, professional services) require custom/Enterprise pricing$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Full pricing detail for add-on products is not published and requires contacting sales$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Does Sauce Labs offer a free trial?$q$, $q$Yes, a free trial is available for sign-up across the Live Testing, Virtual Device Cloud, and Real Device Cloud plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$What automation frameworks does Sauce Labs support?$q$, $q$Sauce Labs supports Selenium, Appium, Cypress, and Playwright.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$How many parallel tests do the base plans include?$q$, $q$The Live Testing, Virtual Device Cloud, and Real Device Cloud plans each include 1 parallel test by default; higher concurrency requires upgrading.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Does Sauce Labs test on real devices?$q$, $q$Yes, the Real Device Cloud plan provides access to thousands of real Android and iOS devices.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Is there an Enterprise plan?$q$, $q$Yes, Enterprise pricing is custom and includes SSO, unified analytics, a private device cloud, and premium support.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Cross-browser web testing$q$, $q$Run automated and manual tests across thousands of desktop browser and OS combinations.$q$, $q$QA and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Mobile app testing on real devices$q$, $q$Validate iOS and Android apps on physical devices before release.$q$, $q$Mobile app development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Visual regression testing$q$, $q$Detect unintended UI changes across releases using automated screenshot comparison.$q$, $q$Front-end and QA teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Enterprise-scale test operations$q$, $q$Centralize test execution, analytics, and device access for large engineering organizations.$q$, $q$Enterprise QA and DevOps teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Live Testing$q$, $q$$39/month (annual) or $49/month (monthly)$q$, $q$monthly$q$, $q$["Unlimited users","Unlimited testing minutes","Manual cross-browser and mobile testing","1 parallel test"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Virtual Device Cloud$q$, $q$$149/month (annual) or $199/month (monthly)$q$, $q$monthly$q$, $q$["Unlimited users and automated minutes","Desktop browsers, mobile emulators and simulators","500 monthly visual testing snapshots","Debugging tools"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Real Device Cloud$q$, $q$$199/month (annual) or $249/month (monthly)$q$, $q$monthly$q$, $q$["Unlimited users and automated minutes","Thousands of real Android and iOS devices","Debugging and video capabilities"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["SSO","Unified analytics","Private device cloud","Premium support","Professional services"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$overview$q$, $q$What is Sauce Labs?$q$, 2, ARRAY[$q$Sauce Labs is a cloud-based testing platform that lets teams run automated and manual tests for web and mobile applications across thousands of real devices, virtual devices, and browser combinations.$q$, $q$The platform includes visual testing, error reporting, and mobile app distribution, and supports popular automation frameworks including Selenium, Appium, Cypress, and Playwright.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', $q$who-its-for$q$, $q$Who Sauce Labs is for$q$, 2, ARRAY[$q$Sauce Labs is built for QA, engineering, and DevOps teams that need to validate web and mobile applications at scale, from individual developers running manual live tests to large enterprises running high-volume automated test suites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22cbd95e-44d9-4cb9-9ec7-b6142dc3fe45', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── TestingBot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud platform for automated, manual, and visual testing across 6,100+ real browsers and devices, with codeless AI testing.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$€20/month$q$,
  founded_year = 2011,
  company_size = NULL,
  headquarters = $q$Moerbeke-Waas, Belgium$q$,
  languages = '{}',
  seo_meta_description = $q$TestingBot offers cloud cross-browser and mobile testing on 6,100+ real devices, with automated, visual, and AI-driven test options.$q$,
  og_description = $q$TestingBot offers cloud cross-browser and mobile testing on 6,100+ real devices, with automated, visual, and AI-driven test options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b712ecf-94b6-4e1e-a274-928b0f776caa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Real browser and device cloud$q$, $q$Access to 6,100+ real browsers and physical iOS/Android devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Live/manual testing$q$, $q$Interactive manual testing sessions on real devices and browsers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated testing$q$, $q$Parallel automated test execution with configurable monthly minutes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Visual regression testing$q$, $q$Screenshot comparison to catch unintended UI changes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$AI-driven and MCP-based testing$q$, $q$Codeless test creation via natural language, with REST API access through Model Context Protocol servers for tools like Claude and Cursor.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Accessibility testing$q$, $q$WCAG 2.1 compliance checks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Broad framework support$q$, $q$Supports Selenium, Playwright, Cypress, Puppeteer, Appium, Espresso, XCUITest, and Maestro.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Founded in 2011 with over a decade of operating history$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$180,000+ active users and 1+ billion tests executed$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$EU-hosted infrastructure with GDPR compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$14-day free plan with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Supports a wide range of automation frameworks and languages$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Pricing is in EUR, which may add currency conversion considerations for non-EU customers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Higher parallel test counts require the Automated Pro or Enterprise tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Enterprise plan requires contacting sales for pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Does TestingBot offer a free trial?$q$, $q$Yes, TestingBot offers a 14-day free plan with access to all 6,100+ browsers and devices, no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Where is TestingBot based?$q$, $q$TestingBot is headquartered in Moerbeke-Waas, Belgium, and hosts its infrastructure in the EU.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$What automation frameworks does TestingBot support?$q$, $q$TestingBot supports Selenium, Playwright, Cypress, Puppeteer, Appium, Espresso, XCUITest, and Maestro.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Does TestingBot support AI-driven testing?$q$, $q$Yes, TestingBot offers codeless AI testing via natural language prompts and REST API access through MCP servers for AI assistants like Claude and Cursor.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Is pay-as-you-go pricing available?$q$, $q$Yes, one-time minute packages are available starting at €60 for 1,000 minutes, and credits never expire.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Cross-browser compatibility testing$q$, $q$Test web applications across thousands of real browser and OS combinations.$q$, $q$QA engineers and web developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Mobile app testing$q$, $q$Test iOS and Android apps on real physical devices.$q$, $q$Mobile development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$AI-assisted test creation$q$, $q$Generate and run tests using natural language via MCP integration with AI coding assistants.$q$, $q$Developers using AI coding tools$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Accessibility compliance checks$q$, $q$Verify WCAG 2.1 compliance for web applications.$q$, $q$Accessibility and QA teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Live$q$, $q$€20/month (annual) or €30/month (monthly)$q$, $q$monthly$q$, $q$["Unlimited live testing","Unlimited visual testing","Real iOS and Android devices","24/7 support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated$q$, $q$€50/month (annual) or €70/month (monthly)$q$, $q$monthly$q$, $q$["1-24 parallel tests","1,000-20,000 monthly minutes","Unlimited live and visual testing","Real device access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated Pro$q$, $q$€90/month (annual) or €120/month (monthly)$q$, $q$monthly$q$, $q$["1-24 unlimited parallel tests","Unlimited live, visual, and automated testing","Real device access","24/7 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["10+ parallel tests","Unlimited testing","Single sign-on","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$overview$q$, $q$What is TestingBot?$q$, 2, ARRAY[$q$TestingBot is a cloud-based testing platform, founded in 2011 and based in Moerbeke-Waas, Belgium, that lets teams run automated, manual, and visual tests across more than 6,100 real browsers and devices.$q$, $q$It supports major automation frameworks including Selenium, Playwright, Cypress, Puppeteer, and Appium, and offers codeless AI-driven test creation through Model Context Protocol integrations with AI assistants.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$who-its-for$q$, $q$Who TestingBot is for$q$, 2, ARRAY[$q$TestingBot suits QA teams and developers who need EU-hosted cross-browser and mobile device testing, from small teams starting with the free plan to larger teams running high-volume parallel automated tests.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Uptime Kuma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, self-hosted uptime monitoring tool with status pages and 90+ notification integrations.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Uptime Kuma is a free, open-source self-hosted monitoring tool for HTTP(s), TCP, DNS, and Docker with 90+ notification integrations.$q$,
  og_description = $q$Uptime Kuma is a free, open-source self-hosted monitoring tool for HTTP(s), TCP, DNS, and Docker with 90+ notification integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a5a7e0d-829a-4fbf-b817-7512ee40ab96' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Multi-protocol monitoring$q$, $q$Monitors HTTP(s), TCP, WebSocket, ping, DNS, Docker containers, and gaming servers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$20-second monitoring intervals$q$, $q$Frequent checks to detect outages quickly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Status pages$q$, $q$Multiple public status pages with custom domain mapping.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$90+ notification integrations$q$, $q$Alerts via Telegram, Discord, Slack, email (SMTP), Pushover, Gotify, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Certificate and ping tracking$q$, $q$Tracks TLS certificate expiry and displays ping charts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Self-hosted deployment$q$, $q$Runs via Docker Compose, Docker CLI, or a non-Docker install on Linux or Windows 10+.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Fully free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Self-hosted, giving full control over data and infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Supports 90+ notification services$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Actively developed with 89.2k+ GitHub stars and 130+ releases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Monitors a wide range of protocols including Docker containers and game servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Requires self-hosting and maintenance; no managed cloud version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Requires Node.js 20.4+ or Docker for installation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$No official mobile app; deployment/monitoring config is web UI based$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$No AI-based features$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Is Uptime Kuma free?$q$, $q$Yes, Uptime Kuma is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Do I need to host Uptime Kuma myself?$q$, $q$Yes, Uptime Kuma is a self-hosted tool, deployable via Docker Compose, Docker CLI, or a non-Docker install on Linux or Windows 10+.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$What protocols can Uptime Kuma monitor?$q$, $q$It can monitor HTTP(s), TCP, WebSocket, ping, DNS, Docker containers, and gaming servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$How many notification services does it support?$q$, $q$Uptime Kuma supports 90+ notification services including Telegram, Discord, Slack, email, Pushover, and Gotify.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Self-hosted uptime monitoring$q$, $q$Monitor websites, servers, and services without relying on a third-party SaaS.$q$, $q$Self-hosters and homelab users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Docker container monitoring$q$, $q$Track the health of Docker containers alongside other infrastructure.$q$, $q$DevOps engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$Public status pages$q$, $q$Communicate service status to users via a custom-domain status page.$q$, $q$Small teams and open-source projects$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$overview$q$, $q$What is Uptime Kuma?$q$, 2, ARRAY[$q$Uptime Kuma is a free, open-source, self-hosted monitoring tool that checks the availability of websites, servers, and services over HTTP(s), TCP, WebSocket, ping, DNS, Docker, and gaming server protocols.$q$, $q$It is released under the MIT license and can be deployed via Docker Compose, Docker CLI, or a direct install on Linux or Windows 10+, with alerts routed through 90+ notification integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', $q$who-its-for$q$, $q$Who Uptime Kuma is for$q$, 2, ARRAY[$q$Uptime Kuma is aimed at developers, sysadmins, and self-hosting enthusiasts who want a free, self-managed alternative to commercial uptime monitoring services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a5a7e0d-829a-4fbf-b817-7512ee40ab96', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── StatusCake ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$External monitoring for websites, APIs, SSL, domains, page speed, and servers, serving over 220,000 customers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€16.66/month$q$,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$StatusCake monitors uptime, SSL, domains, page speed, and servers with a free plan and paid tiers from €16.66/month.$q$,
  og_description = $q$StatusCake monitors uptime, SSL, domains, page speed, and servers with a free plan and paid tiers from €16.66/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c4af54de-4e6f-4013-b444-8a17c0797dd0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Uptime monitoring$q$, $q$Checks every 30 seconds from 30+ countries on higher-tier plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Page speed monitoring$q$, $q$Identifies performance bottlenecks and Core Web Vitals compliance.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$SSL certificate monitoring$q$, $q$Alerts before certificates expire to prevent service disruption.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Domain monitoring$q$, $q$Tracks domain expiry and DNS changes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Server monitoring$q$, $q$Tracks CPU, RAM, and disk usage with alerts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Status pages$q$, $q$Customer-facing status pages for incident communication.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Google SSO$q$, $q$Available across all customer tiers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Free plan available with no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Serves over 220,000 customers including Accenture, Audi, Mastercard, and Netflix$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Covers uptime, SSL, domain, page speed, and server monitoring in one product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$7-day free trial available on paid plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Multi-year billing discounts of up to 40%$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Free plan is limited to 10 uptime monitors and 5-minute check intervals$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$30-second check intervals require the Business plan or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Enterprise plan requires custom pricing and sales contact$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Headquarters and company size not publicly disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Does StatusCake have a free plan?$q$, $q$Yes, StatusCake offers a free plan with 10 uptime monitors, 5-minute test intervals, and one each of page speed, domain, and SSL monitors.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$When was StatusCake founded?$q$, $q$StatusCake was founded in 2012.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$How many customers does StatusCake serve?$q$, $q$StatusCake states it serves more than 220,000 customers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Is there a free trial for paid plans?$q$, $q$Yes, a 7-day free trial is available on the Superior and Business plans.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$What currencies does StatusCake accept?$q$, $q$StatusCake accepts USD, GBP, EUR, AUD, NZD, SGD, and CAD.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Website uptime monitoring$q$, $q$Detect outages quickly with frequent checks from multiple global locations.$q$, $q$Website owners and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$SSL and domain expiry tracking$q$, $q$Avoid outages caused by expired certificates or domains.$q$, $q$IT and infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Page speed and Core Web Vitals monitoring$q$, $q$Track site performance for SEO and user experience.$q$, $q$Web performance and SEO teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Server health monitoring$q$, $q$Track CPU, RAM, and disk usage on servers.$q$, $q$System administrators$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Free$q$, $q$€0/month$q$, $q$monthly$q$, $q$["10 uptime monitors","5-minute test intervals","1 page speed monitor","1 domain monitor","1 SSL monitor"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Superior$q$, $q$€16.66/month (annual) or €19.99/month (monthly)$q$, $q$monthly$q$, $q$["100 uptime monitors","1-minute intervals","15 page speed monitors","50 domain monitors","50 SSL monitors","3 server monitors"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Business$q$, $q$€58.33/month (annual) or €69.99/month (monthly)$q$, $q$monthly$q$, $q$["300 uptime monitors","30-second intervals","30 page speed monitors","120 domain monitors","100 SSL monitors","10 server monitors","team tools"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited monitors","Constant check rates","Dedicated locations","Service-level agreements"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$overview$q$, $q$What is StatusCake?$q$, 2, ARRAY[$q$StatusCake, founded in 2012, is an external monitoring service that tracks website uptime, API availability, SSL certificate validity, domain expiry, page speed, and server health.$q$, $q$It offers a free plan alongside paid Superior, Business, and Enterprise tiers, and is used by over 220,000 customers including Accenture, Audi, Mastercard, and Netflix.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', $q$who-its-for$q$, $q$Who StatusCake is for$q$, 2, ARRAY[$q$StatusCake fits small businesses starting on its free plan through to enterprises needing constant check rates, dedicated monitoring locations, and SLAs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c4af54de-4e6f-4013-b444-8a17c0797dd0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── HetrixTools ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Uptime, server, and blacklist monitoring platform with a free-forever tier for hosting providers and site owners.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HetrixTools offers free uptime, server, and IP blacklist monitoring, with 15 uptime and 32 blacklist monitors free forever.$q$,
  og_description = $q$HetrixTools offers free uptime, server, and IP blacklist monitoring, with 15 uptime and 32 blacklist monitors free forever.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5c7aa89c-3f60-4564-b444-ec64000a8454';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5c7aa89c-3f60-4564-b444-ec64000a8454' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Global uptime monitoring$q$, $q$Checks websites and servers from up to 12 locations worldwide.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Server metrics monitoring$q$, $q$Tracks server health via an agent for Linux, Windows, macOS, and shared hosting.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Blacklist monitoring$q$, $q$Tracks IP and domain reputation across major blacklists, including Microsoft SNDS.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$SSL and domain expiration tracking$q$, $q$Alerts before SSL certificates or domains expire.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Nameserver change monitoring$q$, $q$Detects unexpected DNS/nameserver changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Public status pages$q$, $q$Customizable, white-labeled status pages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Wide notification integrations$q$, $q$Alerts via email, SMS, phone calls, Telegram, Slack, Discord, Microsoft Teams, PagerDuty, Opsgenie, Zenduty, and webhooks.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Free-forever tier with 15 uptime monitors and 32 blacklist monitors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Combines uptime, server, and blacklist/reputation monitoring in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Server agent supports Linux, Windows, macOS, and shared hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Wide range of notification integrations including PagerDuty and Opsgenie$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Operating since 2015$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Detailed paid plan pricing is not publicly documented on the marketing site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Headquarters and company size are not publicly disclosed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$No AI-based features mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Does HetrixTools have a free plan?$q$, $q$Yes, HetrixTools offers 15 uptime monitors and 32 blacklist monitors free forever.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$When was HetrixTools founded?$q$, $q$HetrixTools was founded in May 2015.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$What operating systems does the server agent support?$q$, $q$The server monitoring agent supports Linux, Windows, macOS, and shared hosting environments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Can HetrixTools monitor IP blacklist status?$q$, $q$Yes, it monitors network/IP reputation across major blacklists, including Microsoft SNDS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Hosting provider infrastructure monitoring$q$, $q$Monitor uptime and server health across client infrastructure.$q$, $q$Hosting providers and datacenter operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Email deliverability protection$q$, $q$Track IP and domain blacklist status to protect email deliverability.$q$, $q$Email service providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Website and server uptime tracking$q$, $q$Monitor websites and servers from multiple global locations.$q$, $q$System administrators and website owners$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["15 uptime monitors","32 blacklist monitors","Free forever"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$overview$q$, $q$What is HetrixTools?$q$, 2, ARRAY[$q$HetrixTools, founded in May 2015, is a monitoring platform that tracks website and server uptime, server health metrics, and IP/domain blacklist reputation from up to 12 global locations.$q$, $q$It offers a free-forever tier with 15 uptime monitors and 32 blacklist monitors, alongside paid tiers for higher monitoring volume.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', $q$who-its-for$q$, $q$Who HetrixTools is for$q$, 2, ARRAY[$q$HetrixTools is geared toward hosting providers, datacenter operators, and system administrators who need combined uptime, server, and blacklist reputation monitoring.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5c7aa89c-3f60-4564-b444-ec64000a8454', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Oh Dear ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Website health monitoring covering uptime, SSL, DNS, broken links, cron jobs, and performance, with every feature on every plan.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$€13/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Oh Dear monitors uptime, SSL, DNS, broken links, and cron jobs, with all features included on every plan from €13/month.$q$,
  og_description = $q$Oh Dear monitors uptime, SSL, DNS, broken links, and cron jobs, with all features included on every plan from €13/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7f675195-8d9d-4857-a42d-0da0b4ca4707';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7f675195-8d9d-4857-a42d-0da0b4ca4707' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Uptime monitoring$q$, $q$Checks from multiple global locations as often as every minute.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$SSL certificate monitoring$q$, $q$Alerts before SSL certificates expire.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Broken link and mixed content scanning$q$, $q$Detects broken links and mixed content issues on a site.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$DNS and domain monitoring$q$, $q$Tracks DNS records and domain expiration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Cron job monitoring$q$, $q$Detects failed or missed scheduled tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Performance and Lighthouse monitoring$q$, $q$Tracks site performance using Lighthouse scoring.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Branded client status pages$q$, $q$Client-facing status pages with automated monthly reporting.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$AI-powered checks$q$, $q$Includes AI-based checks among its monitoring capabilities.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Every feature is included on every plan; pricing only scales with site/server capacity$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Has completed over 67 billion checks and sent 38 million alerts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$EU-hosted with GDPR-friendly terms and a DPA available$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$10-day free trial with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$30-day money-back guarantee$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Built-in monthly client reporting suited to agencies$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$No permanent free tier; requires a paid subscription after the trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Pricing scales by number of sites/servers monitored, which can add up for large portfolios$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Founding year and headquarters are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Does Oh Dear have a free trial?$q$, $q$Yes, Oh Dear offers a 10-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Are all features available on every plan?$q$, $q$Yes, Oh Dear includes every feature on every plan; only the number of monitored sites/servers changes between tiers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$What does the Mini plan include?$q$, $q$The Mini plan costs €13/month (annual billing) and covers up to 5 sites, with all monitoring features included.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Does Oh Dear monitor cron jobs?$q$, $q$Yes, Oh Dear monitors scheduled/cron jobs and alerts on failures or missed runs.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Is there a money-back guarantee?$q$, $q$Yes, Oh Dear offers a 30-day money-back guarantee and lets customers cancel anytime.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Agency client site monitoring$q$, $q$Monitor and report on multiple client websites from a single dashboard with branded status pages.$q$, $q$Web agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Application health monitoring$q$, $q$Track uptime, SSL, DNS, and cron jobs for production applications.$q$, $q$Developers and DevOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Performance tracking$q$, $q$Monitor site performance and Lighthouse scores over time.$q$, $q$Web performance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Mini$q$, $q$€13/month$q$, $q$monthly$q$, $q$["Up to 5 sites","All monitoring features included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Standard$q$, $q$€22/month$q$, $q$monthly$q$, $q$["Up to 10 sites","All monitoring features included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Plus$q$, $q$€45/month$q$, $q$monthly$q$, $q$["Up to 25 sites","All monitoring features included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Pro$q$, $q$€73/month$q$, $q$monthly$q$, $q$["Up to 50 sites","All monitoring features included"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Enterprise$q$, $q$€128/month$q$, $q$monthly$q$, $q$["Up to 100 sites","All monitoring features included"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$Premium$q$, $q$€201/month$q$, $q$monthly$q$, $q$["Up to 200 sites","All monitoring features included"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$overview$q$, $q$What is Oh Dear?$q$, 2, ARRAY[$q$Oh Dear is a website health monitoring service that checks uptime, SSL certificates, DNS records, broken links, cron jobs, and performance, and has run more than 67 billion checks to date.$q$, $q$Every plan includes the full feature set; pricing scales only with the number of sites or servers monitored, from €13/month for up to 5 sites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', $q$who-its-for$q$, $q$Who Oh Dear is for$q$, 2, ARRAY[$q$Oh Dear is designed for agencies and developers managing multiple client or production websites who need centralized monitoring, branded status pages, and automated client reporting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7f675195-8d9d-4857-a42d-0da0b4ca4707', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Hyperping ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Uptime monitoring platform with built-in status pages and on-call escalation, including a free forever plan.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hyperping combines global uptime monitoring, branded status pages, and on-call escalation, with a free plan and paid tiers from $29/mo.$q$,
  og_description = $q$Hyperping combines global uptime monitoring, branded status pages, and on-call escalation, with a free plan and paid tiers from $29/mo.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6d916b89-9e14-4c8b-b458-9c5fbc97233a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Multi-region uptime monitoring$q$, $q$Monitors endpoints from global locations with configurable check intervals.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Branded status pages$q$, $q$Custom-domain status pages for customer communication.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$On-call escalation$q$, $q$Escalation policies and alert routing for incident response.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Server agents$q$, $q$Agents for monitoring server-level metrics, with limits varying by plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Browser checks$q$, $q$Playwright-based synthetic browser checks on paid plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Alert integrations$q$, $q$Notifications via Slack, Microsoft Teams, PagerDuty, email, SMS, phone calls, and webhooks.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Free plan available with 20 monitors and no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$14-day free trial on paid plans, no card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Combines monitoring, status pages, and on-call in a single product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Annual billing includes 2 months free$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Business plan supports SAML SSO and audit logs$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Free plan is limited to 5-minute check intervals and 1 basic status page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$30-second and 20-second check intervals require paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Additional seats on the Business plan cost $12/month each beyond the included 15$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Founding year, headquarters, and company size are not published on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Does Hyperping have a free plan?$q$, $q$Yes, the Free plan includes 20 monitors, 5-minute check intervals, 1 basic status page, and 1 server agent.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Is there a free trial for paid plans?$q$, $q$Yes, Hyperping offers a 14-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$What is the cheapest paid plan?$q$, $q$The Essentials plan starts at $29/month and includes 50 monitors with 30-second checks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Does Hyperping support on-call escalation?$q$, $q$Yes, on-call and escalation policies are included starting with the Essentials plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Does Hyperping integrate with incident tools?$q$, $q$Yes, it integrates with Slack, Microsoft Teams, PagerDuty, email, SMS, and webhooks.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Service uptime monitoring$q$, $q$Detect outages across web services from multiple global locations.$q$, $q$Engineering and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Customer-facing status communication$q$, $q$Publish incidents and uptime history on a branded status page.$q$, $q$SaaS companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$On-call incident response$q$, $q$Route alerts through escalation policies to on-call engineers.$q$, $q$DevOps and SRE teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["20 monitors","5-minute check interval","1 basic status page","1 server agent","1 seat"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Essentials$q$, $q$$29/month$q$, $q$monthly$q$, $q$["50 monitors","30-second checks","Custom domain status page","On-call and escalation policies","5 server agents","3 browser checks","2 seats"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Pro$q$, $q$$89/month$q$, $q$monthly$q$, $q$["100 monitors","20 server agents","10 browser checks","3 status pages","Phone call alerts","5 seats"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Business$q$, $q$$299/month$q$, $q$monthly$q$, $q$["1,000 monitors","20-second checks","100 server agents","25 browser checks","10 status pages","SAML SSO","audit logs","15 seats"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom limits","Dedicated support","White-glove migration","Service-level agreements"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$overview$q$, $q$What is Hyperping?$q$, 2, ARRAY[$q$Hyperping is an uptime monitoring platform that combines global monitoring checks with built-in branded status pages and on-call escalation.$q$, $q$It offers a free plan with 20 monitors, and paid plans from $29/month that add faster check intervals, custom-domain status pages, server agents, and browser checks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', $q$who-its-for$q$, $q$Who Hyperping is for$q$, 2, ARRAY[$q$Hyperping targets engineering and DevOps teams that want monitoring, status pages, and on-call alerting in one tool rather than stitching together separate services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d916b89-9e14-4c8b-b458-9c5fbc97233a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Cronitor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Monitoring platform for cron jobs, background tasks, uptime, and heartbeats, with a free tier and usage-based paid plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2/monitor/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cronitor monitors cron jobs, uptime, and heartbeats with alerts on failure, offering a free Hacker plan and usage-based pricing.$q$,
  og_description = $q$Cronitor monitors cron jobs, uptime, and heartbeats with alerts on failure, offering a free Hacker plan and usage-based pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '76ba7a30-adea-4140-9ee6-3e5cd63011ed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Job monitoring$q$, $q$Captures status, metrics, and output from cron jobs with automatic failure alerts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Uptime checks$q$, $q$Monitors websites and APIs from 12+ global locations with intervals as fast as 30 seconds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Heartbeat monitoring$q$, $q$Collects pulse data from user activity, system events, and edge devices.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Status pages$q$, $q$Public or internal status pages to communicate reliability.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Analytics$q$, $q$Real-user monitoring combining traffic, error, and performance data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Alert integrations$q$, $q$10+ alert channels including Slack, email, PagerDuty, and Opsgenie on paid plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Free Hacker plan available with 5 monitors, no credit card required to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Usage-based Business pricing scales with the number of monitors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$14-day free trial on the Business plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Combines cron job monitoring, uptime checks, and heartbeats in one product$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Enterprise plan offers a dedicated engineer and priority support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Free plan is limited to 5 monitors, 5-minute check frequency, and no SMS alerts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$SMS alerts and premium integrations require the paid Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Additional users and SAML SSO carry per-user add-on costs$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Enterprise plan starts at $6,000/year and requires custom pricing$q$, 3);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Founding year, headquarters, and company size are not published on the site$q$, 4);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Does Cronitor have a free plan?$q$, $q$Yes, the Hacker plan is free and includes 5 monitors with email and Slack alerts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$How is the Business plan priced?$q$, $q$The Business plan is usage-based at $2/month per monitor, with additional users at $5/month each.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Is there a free trial?$q$, $q$Yes, Cronitor offers a 14-day free trial of the Business plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$What does Cronitor monitor?$q$, $q$Cronitor monitors cron jobs and background tasks, website/API uptime, and heartbeats from user activity or system events.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$What does the Enterprise plan include?$q$, $q$Enterprise pricing starts at $6,000/year and includes a dedicated engineer, priority support, and custom features.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Cron job monitoring$q$, $q$Get alerted automatically when scheduled jobs fail or don't run.$q$, $q$Backend developers and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$API and website uptime monitoring$q$, $q$Monitor uptime and performance from multiple global locations.$q$, $q$Engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Heartbeat monitoring for background processes$q$, $q$Track pulse signals from system events or edge devices to catch silent failures.$q$, $q$Infrastructure and platform teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Hacker$q$, $q$$0/month$q$, $q$monthly$q$, $q$["5 monitors","5-minute check frequency","Email and Slack alerts","1 basic status page","1 dashboard user"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Business$q$, $q$$2/monitor/month$q$, $q$monthly$q$, $q$["30-second check frequency","Unlimited API requests","10 alert integrations","12-month data retention","SMS alerts","Premium integrations (PagerDuty, Opsgenie, Splunk)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$Enterprise$q$, $q$Starting at $6,000/year$q$, $q$annual$q$, $q$["5-second check frequency","Dedicated engineer","Priority support","Custom features and integrations","Unlimited status pages"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$overview$q$, $q$What is Cronitor?$q$, 2, ARRAY[$q$Cronitor is a monitoring platform that tracks the status and reliability of cron jobs, background tasks, websites, APIs, and infrastructure through job monitoring, uptime checks, and heartbeat tracking.$q$, $q$It offers a free Hacker plan with 5 monitors, a usage-based Business plan starting at $2 per monitor per month, and a custom Enterprise plan starting at $6,000/year.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', $q$who-its-for$q$, $q$Who Cronitor is for$q$, 2, ARRAY[$q$Cronitor is aimed at developers and operations teams who need visibility into backend systems, scheduled jobs, and web services to catch silent failures before they cause outages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76ba7a30-adea-4140-9ee6-3e5cd63011ed', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── SigNoz ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source observability platform unifying logs, metrics, traces, and LLM observability, with a free self-hosted edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SigNoz is an open-source observability platform for logs, metrics, and traces, with a free self-hosted edition and cloud from $49/mo.$q$,
  og_description = $q$SigNoz is an open-source observability platform for logs, metrics, and traces, with a free self-hosted edition and cloud from $49/mo.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b10ec612-7e8a-4fe8-9681-2323a96d8b5c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Distributed tracing$q$, $q$Tracks requests across services to identify performance bottlenecks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Application performance monitoring$q$, $q$Monitors and helps troubleshoot application behavior.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Log management$q$, $q$Ingests and analyzes logs at scale.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Metrics and dashboards$q$, $q$Infrastructure monitoring with customizable dashboards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$LLM/AI observability$q$, $q$Tracks LLM calls, analyzes performance, and monitors usage.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Agent-native observability$q$, $q$Integrates with coding agents like Claude Code and Cursor via OpenTelemetry and MCP.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Alerts$q$, $q$Actionable notifications delivered to preferred channels.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Free, self-hosted Community Edition with full access to core observability features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Open source with 25,000+ GitHub stars and 140+ contributors$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$OpenTelemetry-native, avoiding vendor lock-in on instrumentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Usage-based cloud pricing with no per-user or per-host fees$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Cloud plan is SOC 2 Type II and HIPAA compliant with US, EU, and India regions$q$, 4);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Discounted Startup Program for early-stage companies$q$, 5);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Self-hosting the Community Edition requires managing your own infrastructure and support is community-only (Slack)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Cloud pricing is usage-based, so costs can vary with data volume$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Enterprise plan requires custom pricing starting at $4,000/month$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Founding year, headquarters, and company size are not published on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Is SigNoz free?$q$, $q$Yes, the self-hosted Community Edition is free and open source, with full access to core observability features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$How is SigNoz Cloud priced?$q$, $q$SigNoz Teams (Cloud) starts at $49/month usage-based credit, with traces and logs billed at $0.30/GB and metrics at $0.10 per million samples.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Does SigNoz support LLM observability?$q$, $q$Yes, SigNoz can track LLM calls, analyze performance, and monitor usage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Is there a discount for startups?$q$, $q$Yes, eligible startups under 3 years old, with fewer than 30 employees and under $6M raised, can get the Startup Program at $19/month.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Is SigNoz open source?$q$, $q$Yes, SigNoz is open source with 25,000+ GitHub stars and 140+ contributors.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Unified observability for microservices$q$, $q$Consolidate logs, metrics, and traces in a single dashboard instead of multiple tools.$q$, $q$Platform and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Self-hosted observability$q$, $q$Run a fully self-managed observability stack for cost or compliance reasons.$q$, $q$Startups and security-conscious teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$LLM application monitoring$q$, $q$Track LLM call performance and usage within an application.$q$, $q$AI application developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Self-managed installation","Full access to core observability features","Community support via Slack"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Teams (Cloud)$q$, $q$$49/month$q$, $q$monthly$q$, $q$["$49 monthly usage credit","Traces/logs at $0.30/GB","Metrics at $0.10 per million samples","Unlimited dashboards and alerts","AI teammate (Noz) and MCP Server","SOC 2 Type II and HIPAA compliant"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Startup Program$q$, $q$$19/month$q$, $q$monthly$q$, $q$["50% discount for eligible early-stage companies"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$Enterprise$q$, $q$Starting at $4,000/month$q$, NULL, $q$["Dedicated cloud environment or bring-your-own-cloud","Self-hosted with support","Volume discounts","Guided migration support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$overview$q$, $q$What is SigNoz?$q$, 2, ARRAY[$q$SigNoz is an open-source observability platform that consolidates logs, metrics, traces, dashboards, alerts, and error tracking in a single interface, positioned as an alternative to proprietary tools like Datadog and New Relic.$q$, $q$It offers a free, self-hosted Community Edition and a usage-based Teams cloud plan starting at $49/month, plus custom Enterprise plans starting at $4,000/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', $q$who-its-for$q$, $q$Who SigNoz is for$q$, 2, ARRAY[$q$SigNoz serves platform teams, developers, and DevOps engineers at organizations ranging from early-stage startups to public enterprises who need unified, OpenTelemetry-based observability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b10ec612-7e8a-4fe8-9681-2323a96d8b5c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Prometheus ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source monitoring system with a dimensional data model and PromQL query language, a CNCF graduated project.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Prometheus is a free, open-source monitoring system with PromQL querying and alerting, and a graduated CNCF project.$q$,
  og_description = $q$Prometheus is a free, open-source monitoring system with PromQL querying and alerting, and a graduated CNCF project.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '898eb43f-2596-446a-a7b5-ae0add35bd12';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '898eb43f-2596-446a-a7b5-ae0add35bd12' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Dimensional data model$q$, $q$Flexible time series identification using labeled metrics.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$PromQL$q$, $q$A powerful query language for analyzing and transforming metrics data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Rule-based alerting$q$, $q$Alerting handled through the separate Alertmanager component.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Independent server operation$q$, $q$Each Prometheus server operates independently with local on-disk storage.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Instrumentation libraries$q$, $q$Client libraries available across major programming languages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Broad integration ecosystem$q$, $q$Hundreds of official and community-contributed integrations for extracting metrics from existing systems.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Completely free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$A Cloud Native Computing Foundation graduated project, hosted by the Linux Foundation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Native, first-class integration with Kubernetes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Large ecosystem of hundreds of official and community integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Powerful, purpose-built query language (PromQL)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$No managed/hosted offering from the project itself; requires self-operation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$No built-in long-term storage; relies on local storage or external remote-write integrations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$No AI-based features$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Founding year and organizational headquarters are not clearly stated on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Is Prometheus free?$q$, $q$Yes, Prometheus is free and open source, licensed under Apache 2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$What license does Prometheus use?$q$, $q$Prometheus is released under the Apache 2.0 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Is Prometheus a CNCF project?$q$, $q$Yes, Prometheus is a graduated project of the Cloud Native Computing Foundation, part of the Linux Foundation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$What query language does Prometheus use?$q$, $q$Prometheus uses PromQL for querying and transforming time series data.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Does Prometheus handle alerting itself?$q$, $q$Alert rules are defined in Prometheus, but actual alert routing and management is handled by the separate Alertmanager component.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Kubernetes and cloud-native monitoring$q$, $q$Collect and query metrics from containerized and cloud-native infrastructure.$q$, $q$DevOps and platform engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Custom application metrics$q$, $q$Instrument applications using client libraries and query the resulting metrics with PromQL.$q$, $q$Software engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$Infrastructure alerting$q$, $q$Define alerting rules on collected metrics and route notifications via Alertmanager.$q$, $q$Site reliability engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$overview$q$, $q$What is Prometheus?$q$, 2, ARRAY[$q$Prometheus is a free, open-source monitoring and alerting system built around a dimensional data model, the PromQL query language, and independent servers with local storage.$q$, $q$It is a graduated project of the Cloud Native Computing Foundation, hosted by the Linux Foundation, and is released under the Apache 2.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', $q$who-its-for$q$, $q$Who Prometheus is for$q$, 2, ARRAY[$q$Prometheus is used by cloud-native organizations, Kubernetes users, and DevOps teams that need to instrument, collect, and query metrics for alerting and dashboarding.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('898eb43f-2596-446a-a7b5-ae0add35bd12', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── VictoriaMetrics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, high-performance time series database for storing and querying metrics, logs, and traces at scale.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$VictoriaMetrics: open-source time series database, Prometheus-compatible, for monitoring at scale. Free self-hosted core, Enterprise and Cloud available.$q$,
  og_description = $q$VictoriaMetrics: open-source time series database, Prometheus-compatible, for monitoring at scale. Free self-hosted core, Enterprise and Cloud available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a800ff94-205d-4d00-9df5-8de02f912d82';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a800ff94-205d-4d00-9df5-8de02f912d82' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Prometheus compatibility$q$, $q$Works as a drop-in replacement for Prometheus, supporting existing PromQL-based dashboards and alerting rules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$VictoriaLogs and VictoriaTraces$q$, $q$Extends the core metrics database with companion products for log storage and distributed tracing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$High-performance querying$q$, $q$Optimized storage and query engine designed to process millions of metrics per second efficiently.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Elastic scalability$q$, $q$Deployable from a single Raspberry Pi to thousand-core distributed clusters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Kubernetes operator$q$, $q$An official Kubernetes operator is available for deploying and managing VictoriaMetrics in cluster environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$OpenTelemetry support$q$, $q$Accepts telemetry data via native OpenTelemetry integration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Enterprise anomaly detection$q$, $q$The Enterprise edition adds AI/machine-learning based anomaly detection on top of the core database.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Fully open source with no licensing fees for the core database$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Drop-in Prometheus compatibility eases migration for existing PromQL users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Scales from tiny single-node setups to large distributed clusters$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Used by large organizations including CERN, Adidas, Spotify, and Grammarly$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Active open-source project with 17K+ GitHub stars and over 1 billion Docker pulls$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Enterprise and Cloud pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Advanced features like anomaly detection are limited to the paid Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Running the open-source version at scale requires in-house operational expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Is VictoriaMetrics open source?$q$, $q$Yes, the core VictoriaMetrics time series database is open source, with optional paid Enterprise and Cloud offerings.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Is VictoriaMetrics compatible with Prometheus?$q$, $q$Yes, it is designed as a drop-in replacement for Prometheus and supports PromQL.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Does VictoriaMetrics offer a managed cloud option?$q$, $q$Yes, VictoriaMetrics Cloud is offered as a fully managed SaaS deployment, though pricing is not published and requires contacting the company.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$What else does VictoriaMetrics offer besides metrics?$q$, $q$The VictoriaMetrics ecosystem also includes VictoriaLogs for log storage and VictoriaTraces for distributed tracing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Large-scale Kubernetes monitoring$q$, $q$Teams running large or multi-cluster Kubernetes environments use VictoriaMetrics to collect and query metrics at high volume.$q$, $q$Platform and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Prometheus replacement$q$, $q$Organizations replace self-managed Prometheus deployments with VictoriaMetrics for improved performance and lower storage costs.$q$, $q$DevOps engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Research infrastructure monitoring$q$, $q$Research institutions with high metric volumes use VictoriaMetrics to monitor scientific computing infrastructure.$q$, $q$Research and academic institutions$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted time series database","Prometheus-compatible querying","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Enterprise$q$, $q$Custom / contact sales$q$, NULL, $q$["Enterprise support from core engineering team","Anomaly detection","Automated backup management","SLA for CVE fixes"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$Cloud$q$, $q$Custom / contact sales$q$, NULL, $q$["Fully managed SaaS deployment"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$overview$q$, $q$What is VictoriaMetrics?$q$, 2, ARRAY[$q$VictoriaMetrics is an open-source time series database and monitoring solution built for collecting, storing, and querying metrics at scale. It is designed as a drop-in replacement for Prometheus, meaning teams can keep using PromQL and existing dashboards while benefiting from its storage and query performance.$q$, $q$Beyond metrics, the VictoriaMetrics ecosystem includes VictoriaLogs and VictoriaTraces, extending the same underlying architecture to logs and distributed traces. The open-source core can be deployed anywhere from a Raspberry Pi to large multi-core clusters, with Enterprise and Cloud options available for organizations that need commercial support or a fully managed deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', $q$who-its-for$q$, $q$Who VictoriaMetrics is for$q$, 2, ARRAY[$q$VictoriaMetrics is aimed at engineering and operations teams that already work with Prometheus-style metrics and need a more efficient, scalable backend. It is used by research institutions and technology companies with large-scale infrastructure monitoring needs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a800ff94-205d-4d00-9df5-8de02f912d82', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Netdata ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Real-time, per-second infrastructure monitoring platform with AI-powered anomaly detection and 800+ zero-configuration integrations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$4.50/node/month$q$,
  founded_year = 2016,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Netdata: real-time per-second monitoring with AI anomaly detection. Free Community tier, plus Homelab and per-node Business/Enterprise plans.$q$,
  og_description = $q$Netdata: real-time per-second monitoring with AI anomaly detection. Free Community tier, plus Homelab and per-node Business/Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b6486af7-2d48-49bb-8a54-b53aaf072df4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$AI-powered troubleshooting$q$, $q$Machine learning anomaly detection, automated root cause analysis, and blast radius identification help pinpoint issues faster.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$800+ integrations$q$, $q$Auto-discovery and zero-configuration monitoring across infrastructure, applications, networks, and logs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Edge-native architecture$q$, $q$Distributed monitoring keeps raw data on-premises and streams only metadata to the cloud.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Lightweight agent$q$, $q$The monitoring agent is designed to run on roughly 5% CPU and 150MB RAM per node.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Network monitoring$q$, $q$Includes topology mapping, NetFlow analysis, and SNMP device monitoring.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$OpenTelemetry integration$q$, $q$Supports metrics, logs, alerts, and OpenTelemetry data alongside native collectors.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Free Community tier available with no cost for up to 5 connected nodes$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Lightweight agent with a small CPU and memory footprint$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Per-node pricing with no usage-based or surprise billing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$SOC 2 Type 2 certified$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Large open-source community with 76,000+ GitHub stars and 615+ contributors$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Free Community tier is capped at 5 active nodes and limited to non-commercial use$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Business plan is billed per node, which can add up for large fleets$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Enterprise On-Premise requires a minimum of 200 node licenses and custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Is Netdata free?$q$, $q$Yes, the Community edition is free for up to 5 active connected nodes for non-commercial use.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$How much does Netdata Business cost?$q$, $q$The Business plan is priced at $4.50 per node per month, with a discount for annual billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Does Netdata offer a free trial?$q$, $q$Yes, a 14-day free trial with unlimited nodes is available for the Business plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$When was Netdata founded?$q$, $q$Netdata was founded in 2016.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Real-time server monitoring$q$, $q$DevOps and SRE teams use Netdata's per-second metrics to spot and diagnose issues as they happen.$q$, $q$DevOps engineers and SREs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Homelab monitoring$q$, $q$Individuals running home labs can monitor unlimited nodes affordably under the Homelab plan.$q$, $q$Homelab users and hobbyists$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Air-gapped enterprise monitoring$q$, $q$Organizations with strict data control requirements can deploy Netdata Enterprise On-Premise in air-gapped facilities.$q$, $q$Enterprise IT and security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Community$q$, $q$Free$q$, NULL, $q$["Up to 5 active connected nodes","1 active custom dashboard per room","Secure remote dashboard access","Centralized alert visualization"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Homelab$q$, $q$$90/year$q$, $q$annual$q$, $q$["Unlimited nodes for non-commercial use"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Business$q$, $q$$4.50/node/month$q$, $q$monthly$q$, $q$["Unlimited metrics and logs","Unlimited custom dashboards and retention","Netdata AI for investigation","RBAC, SSO, and SCIM support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$Enterprise On-Premise$q$, $q$Custom / contact sales (minimum 200 node licenses)$q$, NULL, $q$["All Business features","Fully on-premises, air-gapped deployment","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$overview$q$, $q$What is Netdata?$q$, 2, ARRAY[$q$Netdata is an open-source, edge-native infrastructure monitoring platform that collects real-time, per-second metrics without sampling or aggregation. Its lightweight agent runs directly on monitored systems, keeping raw data local while streaming only metadata to the cloud dashboard.$q$, $q$The platform pairs its collection layer with AI-powered troubleshooting features, including anomaly detection and automated root cause analysis, along with more than 800 integrations that auto-discover infrastructure, applications, and network devices with minimal configuration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', $q$who-its-for$q$, $q$Who Netdata is for$q$, 2, ARRAY[$q$Netdata serves DevOps engineers, SREs, platform engineers, system administrators, DBAs, and network engineers monitoring infrastructure of any size, from individual homelabs to enterprise environments requiring air-gapped, on-premises deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b6486af7-2d48-49bb-8a54-b53aaf072df4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Zabbix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source enterprise observability platform for unified monitoring of networks, servers, cloud, applications, and IoT/OT devices.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2001,
  company_size = NULL,
  headquarters = $q$Latvia$q$,
  languages = '{}',
  seo_meta_description = $q$Zabbix: 100% open-source enterprise observability platform for hybrid IT and OT infrastructure, with Zabbix Cloud and paid support subscriptions.$q$,
  og_description = $q$Zabbix: 100% open-source enterprise observability platform for hybrid IT and OT infrastructure, with Zabbix Cloud and paid support subscriptions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '59226ced-c95a-4575-8fdf-25651ad806d1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '59226ced-c95a-4575-8fdf-25651ad806d1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Unified real-time monitoring$q$, $q$Tracks cloud services, networks, IoT/OT devices, and applications through a single interface with real-time alerting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Log monitoring and analysis$q$, $q$Built-in capabilities for collecting and analyzing log data alongside metrics.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$300+ templates and integrations$q$, $q$Pre-built templates and integrations with third-party systems speed up onboarding of new monitoring targets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Automated discovery and visualization$q$, $q$Automatically discovers infrastructure and visualizes data across the monitored environment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Flexible deployment$q$, $q$Supports on-premise deployment, Zabbix Cloud hosting, and public cloud environments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$100% open source with no licensing fees for the core platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Used across 300,000+ deployments in 190+ countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Customer base includes large organizations such as ESA, NATO, Orange, and Dell$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Fixed, predictable support pricing with no per-device charges$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Fast average support response time of 12 minutes, available 24/7$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Zabbix Cloud and support subscription pricing are not published and require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Self-hosted deployment requires in-house infrastructure expertise to install and maintain$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Enterprise-grade support is a separate paid subscription from the free core software$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Is Zabbix free?$q$, $q$Yes, the core Zabbix software is 100% open source with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Does Zabbix offer a hosted/cloud option?$q$, $q$Yes, Zabbix Cloud is a subscription-based managed SaaS option with a free trial available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Where is Zabbix based?$q$, $q$Zabbix is headquartered in Latvia, with additional offices in the USA, Japan, Brazil, Mexico, and France.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$When was Zabbix founded?$q$, $q$Zabbix has been in operation since 2001.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Hybrid infrastructure monitoring$q$, $q$Enterprises with complex, multi-layered IT and OT infrastructure use Zabbix for unified monitoring across environments.$q$, $q$Enterprise IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Managed service provider monitoring$q$, $q$MSPs use Zabbix to monitor infrastructure across multiple client environments from one platform.$q$, $q$Managed Service Providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Regulated industry compliance$q$, $q$Organizations in banking, energy, healthcare, and government use Zabbix to meet monitoring and compliance requirements.$q$, $q$Regulated industry IT teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Zabbix (Open Source)$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment","Full monitoring feature set","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Zabbix Cloud$q$, $q$Custom / contact sales$q$, NULL, $q$["Managed SaaS hosting","Free trial available"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$Technical Support$q$, $q$Custom / contact sales$q$, NULL, $q$["24/7 support option","Fixed pricing with no per-device charges"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$overview$q$, $q$What is Zabbix?$q$, 2, ARRAY[$q$Zabbix is an open-source enterprise observability platform that unifies monitoring across IT and OT infrastructure, from cloud services and networks to IoT devices and applications, through a single interface.$q$, $q$The core software is 100% open source and free to self-host, while Zabbix also offers a managed Zabbix Cloud SaaS option and fixed-price technical support subscriptions for organizations that need vendor-backed assistance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', $q$who-its-for$q$, $q$Who Zabbix is for$q$, 2, ARRAY[$q$Zabbix is built for enterprise organizations, managed service providers, and regulated industries such as banking, energy, healthcare, and government that need scalable monitoring across complex, hybrid infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59226ced-c95a-4575-8fdf-25651ad806d1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Icinga ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source infrastructure monitoring platform for hybrid IT environments, with a forever-free core and paid enterprise subscriptions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$3,500/year (Repository Subscription, region-dependent)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Icinga: open-source infrastructure monitoring with a forever-free edition, plus regional Repository, Module, and Support subscriptions.$q$,
  og_description = $q$Icinga: open-source infrastructure monitoring with a forever-free edition, plus regional Repository, Module, and Support subscriptions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '263f6e12-dfc9-4797-a1fe-95f4616f1475';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '263f6e12-dfc9-4797-a1fe-95f4616f1475' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Forever-free core edition$q$, $q$Unlimited hosts and services monitoring with no subscription required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Infrastructure and cloud monitoring$q$, $q$Covers servers, networks, Kubernetes, databases, applications, Windows, and VMware across on-prem, cloud, and hybrid environments.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Integrations$q$, $q$Connects with Grafana, Prometheus, InfluxDB, and Elasticsearch.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Automation support$q$, $q$Configurable via API, Git workflows, Ansible, Puppet, and Terraform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Enterprise modules$q$, $q$Paid Module Subscription unlocks additional capabilities such as Dependency Views.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Repository access$q$, $q$Paid Repository Subscription provides installation packages for enterprise Linux distributions like RHEL, SLES, and Amazon Linux.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Core software is free forever with unlimited hosts and services$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Modular subscription model lets teams pay only for the add-ons they need$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$60-day free trial available for the Repository Subscription$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Strong automation support via API, Ansible, Puppet, and Terraform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Vendor-neutral, open-source foundation with an active community$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Regional pricing varies significantly (e.g., Europe/North America/Australia vs. South America/Asia/Africa)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Enterprise modules and support are billed separately from the free core software$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Support Subscription starts at a relatively high annual cost (from $15,000/year in North America)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Is Icinga free?$q$, $q$Yes, the core Icinga edition is free forever with unlimited hosts and services monitoring.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$What do the paid subscriptions include?$q$, $q$Icinga offers a Repository Subscription (enterprise Linux packages), a Module Subscription (enterprise modules like Dependency Views), and a Support Subscription (8x5 or 24/7 support).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Is there a free trial for paid subscriptions?$q$, $q$Yes, a 60-day free trial is available for the Repository Subscription.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Does subscription pricing vary by region?$q$, $q$Yes, Icinga's Repository, Module, and Support subscriptions are priced differently by region (Europe, North America, South America, Asia, Australia, Africa).$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Hybrid infrastructure monitoring$q$, $q$Enterprises monitor on-premises, cloud, container, and Kubernetes environments through one open-source platform.$q$, $q$Enterprise IT and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Automated monitoring pipelines$q$, $q$Teams integrate Icinga into CI/CD and infrastructure-as-code workflows using its API, Ansible, Puppet, and Terraform support.$q$, $q$DevOps and automation engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Cost-conscious enterprise monitoring$q$, $q$Organizations that want a free core platform with optional paid support choose Icinga's modular subscription model.$q$, $q$Budget-conscious IT teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Icinga (Forever Free)$q$, $q$Free$q$, NULL, $q$["Unlimited hosts and services","Custom checks and plugins","Integrations with Grafana, Prometheus, InfluxDB, Elasticsearch"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Repository Subscription$q$, $q$From $3,500/year (region-dependent)$q$, $q$annual$q$, $q$["Enterprise Linux distribution packages (RHEL, SLES, Amazon Linux)","60-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Module Subscription$q$, $q$From $1,400/year (region-dependent)$q$, $q$annual$q$, $q$["Access to enterprise modules such as Dependency Views"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$Support Subscription$q$, $q$From $15,000/year (North America)$q$, $q$annual$q$, $q$["8x5 or 24/7 support","Coverage for 2, 5, or 10 Icinga servers"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$overview$q$, $q$What is Icinga?$q$, 2, ARRAY[$q$Icinga is an open-source monitoring platform built for complex, hybrid IT infrastructure. Its core edition is free forever, covering unlimited hosts and services, custom checks and plugins, and integrations with tools like Grafana, Prometheus, InfluxDB, and Elasticsearch.$q$, $q$Beyond the free core, Icinga offers modular paid subscriptions covering enterprise Linux repository packages, additional enterprise modules, and vendor support, each priced separately and by region.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', $q$who-its-for$q$, $q$Who Icinga is for$q$, 2, ARRAY[$q$Icinga is used by enterprises needing scalable, vendor-neutral monitoring across on-premises, cloud, and container environments, including organizations such as Adobe, Audi, Puppet, Telekom, Vodafone, and Siemens.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('263f6e12-dfc9-4797-a1fe-95f4616f1475', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Nagios XI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Enterprise infrastructure monitoring platform with perpetual licensing, event-driven remediation, and full on-premises deployment.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2,595 (Standard, 100-node perpetual license)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nagios XI: on-premises infrastructure monitoring with perpetual licensing, a free tier for small deployments, and Standard/Enterprise node-based pricing.$q$,
  og_description = $q$Nagios XI: on-premises infrastructure monitoring with perpetual licensing, a free tier for small deployments, and Standard/Enterprise node-based pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd7fda584-6240-4d2f-8353-32a67b19e197';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd7fda584-6240-4d2f-8353-32a67b19e197' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Customizable dashboards$q$, $q$Personalized tactical dashboards with graphs, gauges, maps, and direct device access via RDP, VNC, or SSH.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Event-driven remediation$q$, $q$Automatically executes scripts upon problem detection, with configurable escalation policies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$On-premises deployment$q$, $q$Runs entirely on-premises with no cloud dependency, supporting LDAP, Active Directory, SSO, and 2FA.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Capacity planning and SLA reporting$q$, $q$Enterprise tier adds performance visualization, availability tracking, and SLA reports.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Broad platform support$q$, $q$Monitors Windows, Linux, VMware, Hyper-V, AWS, Azure, Google Cloud, and databases including MySQL, PostgreSQL, MongoDB, and MSSQL.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Multi-channel notifications$q$, $q$Alerts can be routed via email, SMS, Slack, Teams, or Discord.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Free tier available for small deployments (up to 7 nodes or 100 services)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Perpetual licensing model avoids ongoing subscription fees for the core license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Full on-premises deployment gives organizations complete data control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Includes 70+ configuration wizards to speed up setup$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Scales to handle 15,000-20,000+ checks per 5-minute interval$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$License cost scales quickly with node count, reaching $17,090+ for 1000-node Enterprise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Ongoing maintenance and support plans are sold separately from the perpetual license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$The monitoring server itself is Linux-based, requiring a supported Linux distribution to host it$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Is there a free version of Nagios XI?$q$, $q$Yes, a free tier is available for up to 7 nodes or 100 services, though it does not include support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Is Nagios XI a subscription or a one-time purchase?$q$, $q$Nagios XI uses perpetual licensing based on node count, with optional annual maintenance and support plans sold separately.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$What's the difference between Standard and Enterprise?$q$, $q$Enterprise adds SLA reports, Business Process Intelligence, capacity planning, scheduled reports, bulk modification tools, and audit logs on top of Standard features.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$What operating systems can host Nagios XI?$q$, $q$Nagios XI is Linux-based, supporting distributions such as CentOS, RHEL, Ubuntu, and Debian.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Small deployment monitoring$q$, $q$Small teams monitor up to 7 nodes for free before needing a paid license.$q$, $q$Small IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Enterprise capacity planning$q$, $q$Larger organizations use the Enterprise tier for SLA reporting and capacity planning across hundreds of nodes.$q$, $q$Enterprise infrastructure teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Multi-site MSP monitoring$q$, $q$MSPs managing multiple data centers use the Sitewide plan with Nagios Fusion for multi-site connectivity.$q$, $q$Managed Service Providers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Free$q$, $q$Free$q$, NULL, $q$["Up to 7 nodes or 100 services","Most Standard features","No included support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Standard$q$, $q$$2,595 - $14,995+ (100 to 1000+ nodes)$q$, NULL, $q$["Infrastructure monitoring and graphing","Open API","Enhanced alerting and reporting","70+ configuration wizards"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Enterprise$q$, $q$$4,690 - $17,090+ (100 to 1000+ nodes)$q$, NULL, $q$["All Standard features","SLA reports and capacity planning","Business Process Intelligence","Bulk modification tools and audit logs"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$Sitewide$q$, $q$Custom / contact sales$q$, NULL, $q$["All Enterprise features","Multi-site connectivity with Nagios Fusion","Discount for large deployments"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$overview$q$, $q$What is Nagios XI?$q$, 2, ARRAY[$q$Nagios XI is an enterprise-grade network monitoring and alerting platform providing real-time visibility into servers, networks, cloud environments, and IoT devices. It runs entirely on-premises and uses perpetual, node-based licensing rather than a recurring SaaS subscription.$q$, $q$The platform supports event-driven remediation, capacity planning, SLA reporting, and multi-channel notifications, with plans ranging from a free tier for small deployments up to Enterprise and Sitewide licenses for large, multi-data-center environments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', $q$who-its-for$q$, $q$Who Nagios XI is for$q$, 2, ARRAY[$q$Nagios XI suits organizations of all sizes that want full on-premises control over their monitoring infrastructure, from small teams monitoring under 100 nodes for free to large enterprises managing hundreds or thousands of nodes across multiple data centers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7fda584-6240-4d2f-8353-32a67b19e197', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Groundcover ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-native observability platform using eBPF for zero-instrumentation data collection, deployed inside the customer's own cloud (BYOC).$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$30/host/month (Pro plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Tel Aviv, Israel$q$,
  languages = '{}',
  seo_meta_description = $q$groundcover: eBPF-based observability platform with BYOC deployment. Free forever tier, plus per-host Pro, Enterprise, and On Premise plans.$q$,
  og_description = $q$groundcover: eBPF-based observability platform with BYOC deployment. Free forever tier, plus per-host Pro, Enterprise, and On Premise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '66cb9934-6740-4aa9-bd5c-6b81c6f665af' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Zero-instrumentation data collection$q$, $q$Uses eBPF sensors to gather telemetry across infrastructure, applications, and AI workloads without code changes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$BYOC architecture$q$, $q$Deploys entirely within the customer's own cloud VPC for data privacy and control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Unified observability$q$, $q$Combines logs, traces, metrics, events, and real user monitoring in one platform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$AI observability$q$, $q$Dedicated monitoring for LLM calls and agent pipelines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Agent Mode$q$, $q$An AI agent that investigates issues and can execute remediation tasks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Migration tools$q$, $q$Automated tools to transition dashboards and monitors from legacy observability platforms.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Free forever tier with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$BYOC deployment keeps all telemetry data inside the customer's own cloud account$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Per-host pricing model avoids ingestion-based cost surprises$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$eBPF-based collection requires no manual code instrumentation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$On Premise option available for fully self-hosted data plane and UI$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Free plan is limited to 12-hour data retention$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Enterprise and On Premise tiers cost more per host ($35-$50/host/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Pricing is based on Kubernetes node counts, which requires a Kubernetes-based environment$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Does groundcover have a free plan?$q$, $q$Yes, a free forever tier is available with 12-hour data retention and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$How is groundcover priced?$q$, $q$Pricing is based on the monthly average number of Kubernetes nodes monitored, starting at $30/host/month for the Pro plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$What is BYOC?$q$, $q$BYOC (Bring Your Own Cloud) means groundcover deploys entirely within the customer's own cloud environment rather than as a third-party SaaS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Where is groundcover based?$q$, $q$groundcover is headquartered in Tel Aviv, Israel, with an additional presence in California.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Kubernetes observability without sampling$q$, $q$Cloud-native teams use groundcover's eBPF sensors to get full-fidelity telemetry from Kubernetes workloads.$q$, $q$Platform and DevOps engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Data residency and privacy$q$, $q$Organizations with strict data control requirements use the BYOC model to keep telemetry inside their own cloud account.$q$, $q$Security- and compliance-focused teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$AI workload monitoring$q$, $q$Teams running LLM and agent pipelines use groundcover's AI observability features to monitor those workloads alongside infrastructure.$q$, $q$AI/ML engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Free$q$, $q$$0$q$, NULL, $q$["12-hour data retention","Slack community support","BYOC deployment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Pro$q$, $q$$30/host/month$q$, $q$monthly$q$, $q$["All integrations and data sources","SSO support","Standard retention and support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$Enterprise$q$, $q$$35/host/month$q$, $q$monthly$q$, $q$["RBAC support","Unlimited data retention","Premium support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$On Premise$q$, $q$$50/host/month$q$, $q$monthly$q$, $q$["Self-hosted data plane and UI","Isolated authentication","Fully on-premises deployment"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$overview$q$, $q$What is groundcover?$q$, 2, ARRAY[$q$groundcover is a cloud-native observability platform that uses eBPF sensors to collect telemetry data without requiring manual code instrumentation. Instead of operating as a typical third-party SaaS, groundcover deploys its data plane inside the customer's own cloud environment (BYOC), keeping observability data under the customer's control.$q$, $q$The platform unifies logs, traces, metrics, events, and real user monitoring, and includes AI observability features for monitoring LLM calls and agent pipelines alongside traditional infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', $q$who-its-for$q$, $q$Who groundcover is for$q$, 2, ARRAY[$q$groundcover is built for engineering teams running cloud-native, Kubernetes-based infrastructure who want full-fidelity telemetry, predictable per-host pricing, and control over where their observability data lives.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('66cb9934-6740-4aa9-bd5c-6b81c6f665af', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Coralogix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-native observability platform with index-free querying, infinite retention in customer-owned storage, and unit-based pricing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$0.42/GB (Logs ingestion)$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Coralogix: AI-native observability platform with infinite retention and unit-based pricing for logs, traces, metrics, and AI workloads.$q$,
  og_description = $q$Coralogix: AI-native observability platform with infinite retention and unit-based pricing for logs, traces, metrics, and AI workloads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '87d8b957-ca86-43e1-bf19-a249b1bd836a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '87d8b957-ca86-43e1-bf19-a249b1bd836a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Index-free querying$q$, $q$Remote querying across all data types using a unified syntax, without needing to pre-index data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Infinite retention$q$, $q$Stores data in the customer's own cloud environment (S3) for long-term, high-cardinality retention.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$DataPrime engine$q$, $q$A query engine for cross-signal correlation and unified data exploration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$AI interfaces$q$, $q$Includes Olly, a conversational AI interface, Model Context Protocol (MCP) support, and a programmable CLI.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$AI observability modules$q$, $q$Dedicated Discovery, Guardrails, cost tracking, and session explorer modules for monitoring AI systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Cost Optimizer$q$, $q$Reduces costs by intelligently tiering data while preserving visibility.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Security capabilities$q$, $q$Includes SIEM and managed detection and response (MDR) functionality.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Unit-based pricing means paying only for the data volume actually used, rather than fixed tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Infinite retention with data stored in the customer's own S3 bucket$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$14-day free trial with full feature access and no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Compliance certifications including SOC 2, PCI DSS, ISO 27001, GDPR, and HIPAA$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Named a Gartner Magic Quadrant Leader for Observability Platforms in 2026$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Consumption-based pricing can be harder to predict than flat-rate plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Logs, traces, metrics, and AI usage are billed separately by unit type$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Achieving the full retention cost benefit requires managing a customer-owned S3 bucket$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$How is Coralogix priced?$q$, $q$Coralogix uses unit-based pricing: $0.42/GB for logs, $0.16/GB for traces, $0.05/GB for metrics, and $1.50 per 1M tokens for AI usage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Is there a free trial?$q$, $q$Yes, Coralogix offers a 14-day free trial with full feature access and 8 units of quota, no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$What compliance certifications does Coralogix have?$q$, $q$Coralogix is SOC 2, PCI DSS, ISO 27001, GDPR, and HIPAA compliant.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$When was Coralogix founded?$q$, $q$Coralogix was founded in 2014.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Long-term log retention$q$, $q$Organizations needing infinite log and trace retention without escalating storage costs use Coralogix's customer-owned S3 storage model.$q$, $q$Enterprises with compliance retention requirements$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Regulated industry observability$q$, $q$Fintech and healthcare organizations use Coralogix's compliance certifications to meet regulatory requirements.$q$, $q$Regulated industry engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$AI system monitoring$q$, $q$Teams building AI-driven applications use Coralogix's AI observability modules to monitor discovery, guardrails, and cost.$q$, $q$AI/ML engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Logs$q$, $q$$0.42/GB$q$, NULL, $q$["Index-free querying","Infinite retention in customer S3"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Traces$q$, $q$$0.16/GB$q$, NULL, $q$["Distributed tracing","Cross-signal correlation via DataPrime"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$Metrics$q$, $q$$0.05/GB$q$, NULL, $q$["1GB equals 1,000 time series"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$AI$q$, $q$$1.50 per 1M tokens$q$, NULL, $q$["AI observability modules","Olly conversational AI"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$overview$q$, $q$What is Coralogix?$q$, 2, ARRAY[$q$Coralogix is an observability platform built for AI-driven infrastructure, offering index-free querying across logs, traces, and metrics, and infinite data retention by storing telemetry in the customer's own cloud environment.$q$, $q$Founded in 2014, the platform has grown to serve over 4,000 enterprise teams and includes AI-native features such as Olly (a conversational AI interface), MCP support, and dedicated AI observability modules for monitoring AI systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', $q$who-its-for$q$, $q$Who Coralogix is for$q$, 2, ARRAY[$q$Coralogix targets enterprise engineering teams across fintech, healthcare, gaming, video streaming, ecommerce, and cybersecurity that need compliance-certified observability with long-term data retention and predictable, consumption-based pricing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('87d8b957-ca86-43e1-bf19-a249b1bd836a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Logz.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based observability platform unifying log management, infrastructure monitoring, and distributed tracing with an AI agent for root cause analysis.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$0.92/GB per day (Log Management)$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Logz.io: unified log management, infrastructure monitoring, and tracing platform with an AI agent for root cause analysis. 14-day free trial.$q$,
  og_description = $q$Logz.io: unified log management, infrastructure monitoring, and tracing platform with an AI agent for root cause analysis. 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd04addb1-ddc7-4e30-8c90-08ba9991c9a0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$OrionIQ AI agent$q$, $q$A workflow-aware AI agent that automates root cause analysis and answers questions in natural language.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Open 360 platform$q$, $q$A unified dashboard combining logs, metrics, and traces with real-time insights.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Log management$q$, $q$Positioned as a managed alternative to self-hosting the ELK Stack.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Infrastructure monitoring$q$, $q$Positioned as a managed alternative to self-hosting Prometheus.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Distributed tracing$q$, $q$Tracks requests across distributed services.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$300+ integrations$q$, $q$Supports AWS, Azure, Google Cloud, Kubernetes, Docker, MongoDB, PostgreSQL, and other common infrastructure tools.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Cost management tools$q$, $q$Data optimization features aimed at reducing telemetry costs.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Unifies logs, metrics, and traces in a single Open 360 dashboard$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$OrionIQ AI agent automates root cause analysis and natural language querying$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$300+ built-in integrations across major cloud and infrastructure tools$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Recognized by AWS across multiple competencies, including Generative AI Software$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Consumption-based pricing means costs scale directly with data volume$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Monthly billing costs 1.2x the equivalent annual rate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Overage beyond committed volume is charged at 1.4x the standard subscription rate$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Detailed plan tiers are not published and require a demo or quote$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Does Logz.io offer a free trial?$q$, $q$Yes, Logz.io offers a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$How is Logz.io priced?$q$, $q$Pricing is consumption-based: $0.92/GB per day for Log Management, $0.40 per 1,000 time-series metrics per day for Infrastructure Monitoring, and $0.16 per 1M spans per day for Distributed Tracing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$What does OrionIQ do?$q$, $q$OrionIQ is Logz.io's AI agent that automates root cause analysis and lets users query data in natural language.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$When was Logz.io founded?$q$, $q$Logz.io was founded in 2015, originally as Logshero Ltd.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Replacing self-managed ELK/Prometheus$q$, $q$Teams running the ELK Stack or Prometheus themselves migrate to Logz.io for a managed alternative.$q$, $q$DevOps and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Unified observability$q$, $q$Organizations wanting logs, metrics, and traces in one dashboard use the Open 360 platform.$q$, $q$Engineering organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$AI-assisted incident response$q$, $q$Teams use OrionIQ to speed up root cause analysis during incidents.$q$, $q$Incident response and on-call engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Log Management$q$, $q$$0.92/GB per day$q$, NULL, $q$["3, 7, 14, or 30-day retention options","Hot/Warm/Cold tiered retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Infrastructure Monitoring$q$, $q$$0.40 per 1,000 time-series metrics per day$q$, NULL, $q$["18-month fixed retention","6 data points per minute per time series"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Distributed Tracing$q$, $q$$0.16 per 1M spans per day$q$, NULL, $q$["10-day fixed retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$Agentic Observability$q$, $q$$10 per 1M tokens$q$, NULL, $q$["AI agent workflows and invocations"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$overview$q$, $q$What is Logz.io?$q$, 2, ARRAY[$q$Logz.io is a cloud-based observability platform, founded in 2015, that unifies log management, infrastructure monitoring, and distributed tracing into a single interface called Open 360. It positions itself as a managed alternative to self-hosting tools like the ELK Stack and Prometheus.$q$, $q$The platform includes OrionIQ, a workflow-aware AI agent that automates root cause analysis and lets teams query their observability data using natural language.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', $q$who-its-for$q$, $q$Who Logz.io is for$q$, 2, ARRAY[$q$Logz.io is aimed at DevOps teams, SREs, and engineering organizations that want to streamline incident response and reduce the operational overhead of running open-source observability tools themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d04addb1-ddc7-4e30-8c90-08ba9991c9a0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Mezmo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Telemetry pipeline platform that ingests, transforms, and routes logs, metrics, and traces, paired with an AI agent for root cause analysis.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mezmo: telemetry pipeline platform for real-time log, metric, and trace processing, with an included AI agent for root cause analysis.$q$,
  og_description = $q$Mezmo: telemetry pipeline platform for real-time log, metric, and trace processing, with an included AI agent for root cause analysis.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '42e3325b-1211-486f-91fc-f675f017f411';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '42e3325b-1211-486f-91fc-f675f017f411' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Active Telemetry pipeline$q$, $q$Processes logs, metrics, and traces in real time before they reach downstream observability tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Live tail and replay$q$, $q$Enables real-time streaming and replay of telemetry data for incident investigation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Tail-based sampling$q$, $q$Captures critical errors while reducing the volume of routine telemetry data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Data profiling$q$, $q$Identifies high-volume, low-value data streams for optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Pipeline-as-code$q$, $q$Supports defining telemetry pipelines as code for CI/CD integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Cardinality management$q$, $q$Aggregates and manages metric cardinality to help control observability costs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Agentic root cause analysis (AURA)$q$, $q$An open-source agentic harness where AI agents investigate infrastructure incidents with human-in-the-loop review before risky actions are taken.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Telemetry pipeline filters and transforms data before it reaches costly downstream observability tools, which one customer used to cut Datadog costs by 52%$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$AI root cause analysis agent is included in the platform license with no separate metered query charges$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Pipeline-as-code support integrates with CI/CD workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Human-in-the-loop review keeps risky automated actions reviewable before they touch production$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$The AURA agentic component is open source$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Specific pricing tiers and a starting price are not published on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Configuring pipeline routing and transformation rules requires understanding telemetry pipeline concepts$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Free access is limited to a trial rather than an ongoing free tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$What is Mezmo's Active Telemetry pipeline?$q$, $q$It is a real-time engine that ingests, transforms, and routes logs, metrics, and traces before they reach observability tools or storage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Does Mezmo charge extra for AI features?$q$, $q$No, according to Mezmo the AI root cause analysis agent is included in the platform license with no metered query charges.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Is there a free trial?$q$, $q$Yes, a free trial is available directly on Mezmo's website.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$What is AURA?$q$, $q$AURA is Mezmo's open-source agentic harness that lets AI agents investigate and help resolve production infrastructure incidents with human oversight.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Observability cost reduction$q$, $q$Teams use Mezmo's telemetry pipeline to filter and transform data before it reaches costly downstream tools like Datadog.$q$, $q$SRE and platform teams managing observability spend$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$AI-assisted incident investigation$q$, $q$SRE teams use Mezmo's agentic capabilities to get AI-driven investigation of incidents while retaining human review of risky actions.$q$, $q$SREs and on-call engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$Pipeline automation$q$, $q$Engineering teams define and deploy telemetry pipeline configurations as code within CI/CD workflows.$q$, $q$Platform and automation engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$overview$q$, $q$What is Mezmo?$q$, 2, ARRAY[$q$Mezmo is a telemetry pipeline platform built around what the company calls an Active Telemetry approach: processing logs, metrics, and traces in real time before they reach observability tools, rather than shipping raw data downstream and paying to store and query all of it.$q$, $q$The platform includes AURA, an open-source agentic harness that lets AI agents investigate production infrastructure incidents using real telemetry, runbooks, and incident history, with human-in-the-loop review required before any risky remediation actions are taken.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', $q$who-its-for$q$, $q$Who Mezmo is for$q$, 2, ARRAY[$q$Mezmo is aimed at site reliability engineers, platform engineers, and developers at organizations looking to control observability costs and speed up incident response using AI-assisted, but human-supervised, investigation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('42e3325b-1211-486f-91fc-f675f017f411', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Honeycomb ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Observability platform for distributed tracing, log analytics, and AI/LLM workflow debugging, with a free tier for individual projects.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$150/month (Pro plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Honeycomb: observability platform for distributed tracing and AI workflow debugging. Free tier up to 20M events/month, Pro from $150/month.$q$,
  og_description = $q$Honeycomb: observability platform for distributed tracing and AI workflow debugging. Free tier up to 20M events/month, Pro from $150/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5fe9efca-ce0e-4fb2-974d-c293416b1200';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5fe9efca-ce0e-4fb2-974d-c293416b1200' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Distributed tracing$q$, $q$Tracks requests across microservices to understand system behavior in production.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$BubbleUp$q$, $q$Automated root cause analysis that surfaces the dimensions most correlated with an anomaly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Honeycomb Intelligence$q$, $q$AI-powered investigation tools including Canvas, an AI copilot, plus Model Context Protocol (MCP) integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Agent Timeline and LLM Observability$q$, $q$Purpose-built views for debugging AI agent and LLM-powered workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Service Map$q$, $q$Visualizes system architecture and service dependencies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$SLO tracking$q$, $q$Defines and monitors service level objectives.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$60+ integrations$q$, $q$Connects with CI/CD, incident management, and other development tools.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Free tier available with up to 20M events and 100M metrics data points per month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Query results returned in under 90 seconds, with sub-10-second queries using AI agents$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$OpenTelemetry-native platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Used by well-known engineering teams including Slack, Intercom, Dropbox, Booking.com, and Duolingo$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Company has published the book "Observability Engineering"$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Pro plan pricing starts at $150/month once free-tier limits are exceeded$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Advanced features like SSO, Agent Timeline, and SLOs require the paid Pro tier or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Enterprise pricing is custom and requires a quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Does Honeycomb have a free plan?$q$, $q$Yes, a free plan supports up to 20M events and 100M metrics data points per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$What's included in the free tier?$q$, $q$The free tier includes 2 triggers, distributed tracing, BubbleUp, OpenTelemetry support, the Canvas AI copilot, and Honeycomb MCP.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$What is BubbleUp?$q$, $q$BubbleUp is Honeycomb's automated root cause analysis feature that highlights the dimensions most correlated with an anomaly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Does Honeycomb support OpenTelemetry?$q$, $q$Yes, Honeycomb is built as an OpenTelemetry-native platform.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Individual and small project monitoring$q$, $q$Developers use the free tier to add observability to individual projects or small applications.$q$, $q$Individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Production tracing at scale$q$, $q$Teams running production applications use the Pro plan for higher event volumes, SLOs, and SSO.$q$, $q$Engineering teams with production applications$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$AI agent debugging$q$, $q$Teams building AI-powered applications use Agent Timeline and LLM Observability to debug agent workflows.$q$, $q$AI/ML engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 20M events/month","Up to 100M metrics data points/month","2 triggers","Distributed tracing, BubbleUp, Canvas AI Copilot, Honeycomb MCP"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Pro$q$, $q$$150/month$q$, $q$monthly$q$, $q$["Up to 750M events/month","Up to 3.75B metrics data points/month","100 triggers, 2 SLOs","SSO and Agent Timeline"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$Enterprise$q$, $q$Custom / contact sales$q$, NULL, $q$["300+ triggers, 100+ SLOs","Service Map","Enterprise support","Query Data API and AWS PrivateLink"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$overview$q$, $q$What is Honeycomb?$q$, 2, ARRAY[$q$Honeycomb is an observability platform that helps engineering teams monitor and debug software systems in production, built around distributed tracing, log analytics, and time series metrics on an OpenTelemetry-native foundation.$q$, $q$The platform has expanded to include AI-focused capabilities such as Agent Timeline and LLM Observability for debugging AI agent workflows, along with Honeycomb Intelligence tools like the Canvas AI copilot and Model Context Protocol (MCP) integration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', $q$who-its-for$q$, $q$Who Honeycomb is for$q$, 2, ARRAY[$q$Honeycomb serves individual developers testing projects on its free tier, as well as engineering teams at companies like Slack, Intercom, Dropbox, and Duolingo running production distributed systems and, increasingly, AI/LLM-powered applications.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fe9efca-ce0e-4fb2-974d-c293416b1200', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Airbrake ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Airbrake is an error and performance monitoring platform that detects, groups, and pinpoints application errors in real time.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Austin, Texas, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Airbrake error monitoring: real-time error tracking, performance insights, and deployment tracking for web, mobile, and desktop apps.$q$,
  og_description = $q$Airbrake error monitoring: real-time error tracking, performance insights, and deployment tracking for web, mobile, and desktop apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fb0cca2e-8d1d-40a3-9f8a-327f674804be' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Real-Time Error Monitoring$q$, $q$Catches application errors with line-of-code precision and groups them intelligently so teams can prioritize fixes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Performance Monitoring$q$, $q$Lightweight APM tracks HTTP request response times and user satisfaction alongside error data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Deployment Tracking$q$, $q$Correlates errors with deployments to help teams identify which release introduced a problem.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Multi-Language SDKs$q$, $q$Official libraries cover JavaScript, Python, Ruby, Java, Go, PHP, .NET, and other languages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Single Sign-On$q$, $q$Supports SSO for centralized team access to Airbrake accounts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Usage Caps$q$, $q$Teams can set spending limits to control costs and avoid unexpected overage charges.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$SDKs available for many popular languages and frameworks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Error and performance monitoring can be scaled independently by usage tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Usage caps help prevent unexpected overage charges$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Backed by LogicMonitor for stable ownership and infrastructure$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$4.7-star rating on G2 based on user reviews$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Error monitoring and performance monitoring are billed as separate line items$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Entry-level Dev plan is limited to a single user$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Full pricing depends on a tiered error-volume structure that requires reading the fine print$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Does Airbrake offer a free trial?$q$, $q$Yes, Airbrake offers a free trial with access to all features, including unlimited errors and unlimited performance monitoring events.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$How much does Airbrake cost?$q$, $q$Paid plans start at $19/month (Dev + Errors) billed monthly, or $17/month billed annually, with higher tiers at $38/month and $76/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Can I use Airbrake for both errors and performance?$q$, $q$Yes, but error monitoring and performance monitoring are billed as separate add-ons.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$What languages does Airbrake support?$q$, $q$Airbrake provides SDKs for JavaScript, Python, Ruby, Java, Go, PHP, .NET, and other languages.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Who owns Airbrake?$q$, $q$Airbrake is owned by LogicMonitor.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Web application error tracking$q$, $q$Development teams use Airbrake to catch and triage runtime errors across web apps before they affect end users.$q$, $q$Web development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Mobile and desktop error monitoring$q$, $q$Airbrake's SDKs let mobile and desktop app teams track crashes and exceptions in production.$q$, $q$Mobile and desktop developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Release quality tracking$q$, $q$DevOps teams correlate new deployments with error spikes to quickly identify and roll back problematic releases.$q$, $q$DevOps engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Dev + Errors$q$, $q$$19/month (monthly) or $17/month (annual)$q$, $q$monthly$q$, $q$["1 user, 1 team, unlimited projects","Account dashboard and advanced search","Unlimited integrations","Deploy tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Basic + Errors$q$, $q$$38/month (monthly) or $34/month (annual)$q$, $q$monthly$q$, $q$["Unlimited users, 3 teams, unlimited projects","All Dev plan features"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$Pro + Errors$q$, $q$$76/month (monthly) or $68/month (annual)$q$, $q$monthly$q$, $q$["Unlimited users, teams, and projects","Audit logs","Spike forgiveness"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$overview$q$, $q$What is Airbrake?$q$, 2, ARRAY[$q$Airbrake is an error monitoring and performance insights platform that catches application errors, groups them intelligently, and pinpoints the exact line of code responsible so developers can fix problems before customers are affected.$q$, $q$The platform also includes lightweight application performance monitoring and deployment tracking, letting teams correlate error spikes with specific releases. Airbrake is owned by LogicMonitor and reports being trusted by more than 1,600 organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', $q$who-its-for$q$, $q$Who Airbrake is for$q$, 2, ARRAY[$q$Airbrake is built for developers and DevOps teams building web, mobile, and desktop applications who need real-time error detection with SDKs for languages including JavaScript, Python, Ruby, Java, Go, PHP, and .NET.$q$, $q$It suits teams that want error tracking and performance monitoring in one account, with usage caps to keep costs predictable as error volume grows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb0cca2e-8d1d-40a3-9f8a-327f674804be', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── GlitchTip ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GlitchTip is an open-source, Sentry-compatible error and performance monitoring platform available as SaaS or self-hosted.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GlitchTip: open-source error tracking and performance monitoring, self-hosted or hosted, compatible with Sentry SDKs.$q$,
  og_description = $q$GlitchTip: open-source error tracking and performance monitoring, self-hosted or hosted, compatible with Sentry SDKs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '640ab266-6f1b-43d9-85ea-0a53ef4f7d1b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Error Tracking$q$, $q$Captures exceptions, log messages, and CSP violations in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Performance Monitoring$q$, $q$Flags slow web requests, database calls, and transactions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Uptime Monitoring$q$, $q$Pings sites and sends alerts via email or webhook when they become unresponsive.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Log Search$q$, $q$Search and filter application logs alongside error and performance data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Sentry SDK Compatibility$q$, $q$Works with Sentry's open-source SDKs, easing migration for existing Sentry users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Self-Hosting Option$q$, $q$Fully open-source codebase that can be deployed and run on your own server.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Open source with a self-hosted option for full data control$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Free hosted tier covers up to 1,000 events per month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Compatible with existing Sentry SDKs, easing migration$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Discounted pricing available for non-profits and open-source projects$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$EU hosting option in Germany for data sovereignty$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Higher-volume plans (Medium, Large) get costly at scale, up to $250/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Priority support and BAA availability are limited to higher tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Self-hosting requires managing your own infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Is GlitchTip free?$q$, $q$Yes, GlitchTip offers a free hosted tier for up to 1,000 events per month, and the software itself is fully open source for self-hosting at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Is GlitchTip compatible with Sentry?$q$, $q$Yes, GlitchTip works with Sentry's open-source SDKs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Does GlitchTip offer non-profit discounts?$q$, $q$Yes, non-profit and open-source project discounts start at $5/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Can I self-host GlitchTip?$q$, $q$Yes, GlitchTip can be deployed on your own server as a self-hosted instance.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Where is GlitchTip's EU hosting located?$q$, $q$GlitchTip offers EU hosting in Germany for organizations with data sovereignty requirements.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Error tracking for small teams$q$, $q$Small teams use GlitchTip's free or Small plan to monitor errors without committing to expensive SaaS tools.$q$, $q$Small development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Self-hosted monitoring for compliance$q$, $q$Organizations with data residency or HIPAA requirements self-host GlitchTip or use its BAA-available Large plan.$q$, $q$Compliance-focused organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Sentry migration$q$, $q$Teams already using Sentry SDKs can switch to GlitchTip without changing their instrumentation code.$q$, $q$Teams migrating from Sentry$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Up to 1,000 events/month","Unlimited projects","Unlimited team members"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Small$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Up to 100,000 events/month","Support access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Medium$q$, $q$$50/month$q$, $q$monthly$q$, $q$["Up to 500,000 events/month","Priority email and live chat support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$Large$q$, $q$$250/month$q$, $q$monthly$q$, $q$["Up to 3 million events/month","Development support","BAA available"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$overview$q$, $q$What is GlitchTip?$q$, 2, ARRAY[$q$GlitchTip is an open-source error tracking platform that collects exceptions, log messages, and CSP violations in real time, organizes them, and alerts teams when and where they need to know.$q$, $q$Beyond error tracking, GlitchTip includes performance monitoring, uptime monitoring, and log search, and is compatible with Sentry's open-source SDKs. It was created by Burke Software and Consulting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', $q$who-its-for$q$, $q$Who GlitchTip is for$q$, 2, ARRAY[$q$GlitchTip suits individual developers, small teams, and growing organizations that want error tracking without the cost of larger commercial SaaS platforms.$q$, $q$Its self-hosted, open-source option also appeals to teams with data residency or compliance requirements, including EU hosting and BAA availability on higher tiers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('640ab266-6f1b-43d9-85ea-0a53ef4f7d1b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Errbit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Errbit is a free, open-source, self-hosted error catcher that is API-compatible with Airbrake.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Errbit: open-source, self-hosted error tracking tool that's API-compatible with Airbrake, built in Ruby.$q$,
  og_description = $q$Errbit: open-source, self-hosted error tracking tool that's API-compatible with Airbrake, built in Ruby.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3338502d-27fe-428c-9b82-985f4f0a73b4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3338502d-27fe-428c-9b82-985f4f0a73b4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Self-Hosted Deployment$q$, $q$Runs on your own infrastructure, giving full control over error data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Airbrake API Compliance$q$, $q$Existing Airbrake clients can point their airbrake gem or SDK at an Errbit instance with no code changes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Open Source (MIT)$q$, $q$Free to use, modify, and deploy under the MIT license.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Docker Support$q$, $q$Available as a Docker image for simplified deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Ruby/MongoDB Stack$q$, $q$Built on Ruby and MongoDB as the underlying data store.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Drop-in replacement for Airbrake via API compatibility$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Full control over error data since it's self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Active community with thousands of GitHub stars and ongoing releases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Available as a Docker image for easier deployment$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Requires self-hosting and infrastructure maintenance with no managed cloud option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Requires specific Ruby and MongoDB versions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$No official vendor support or SLA$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Lacks the performance monitoring/APM features of paid alternatives like Airbrake$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Is Errbit free?$q$, $q$Yes, Errbit is free, open-source software licensed under MIT.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Can I migrate from Airbrake to Errbit?$q$, $q$Yes, Errbit is Airbrake API compliant, so you can redirect your existing Airbrake gem or SDK to your Errbit instance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$How is Errbit deployed?$q$, $q$Errbit can be deployed from source or as a Docker image, and requires Ruby and MongoDB.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Is Errbit actively maintained?$q$, $q$Yes, Errbit has an active commit history and regular releases on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Self-hosted error tracking$q$, $q$Teams that need full control over their error data self-host Errbit instead of using a SaaS error tracker.$q$, $q$DevOps and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$Airbrake migration$q$, $q$Organizations already using Airbrake SDKs can switch to Errbit without changing their instrumentation code.$q$, $q$Teams migrating off Airbrake$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$overview$q$, $q$What is Errbit?$q$, 2, ARRAY[$q$Errbit is an open source, self-hosted error catcher that collects and aggregates errors from applications. It is Airbrake API compliant, meaning teams can redirect their existing Airbrake integration to an Errbit instance without changing code.$q$, $q$The project is MIT-licensed, built on Ruby and MongoDB, and distributed both as source code on GitHub and as a Docker image for simplified deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', $q$who-its-for$q$, $q$Who Errbit is for$q$, 2, ARRAY[$q$Errbit is for engineering teams that want an Airbrake-compatible error tracker but need to keep error data on their own infrastructure rather than a third-party SaaS service.$q$, $q$It fits teams comfortable running and maintaining a self-hosted Ruby and MongoDB application in exchange for a free, fully open-source error tracking tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3338502d-27fe-428c-9b82-985f4f0a73b4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── OpenObserve ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenObserve is an open-source observability platform unifying logs, metrics, traces, and RUM with low-cost object storage.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0.50/GB ingested (Professional cloud plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Menlo Park, California, United States$q$,
  languages = '{}',
  seo_meta_description = $q$OpenObserve: open-source observability platform for logs, metrics, traces, and RUM with low-cost storage and SQL/PromQL queries.$q$,
  og_description = $q$OpenObserve: open-source observability platform for logs, metrics, traces, and RUM with low-cost storage and SQL/PromQL queries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '22369d03-3beb-4c3b-bad9-983dd3069db4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '22369d03-3beb-4c3b-bad9-983dd3069db4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Unified Observability$q$, $q$Combines logs, metrics, traces, dashboards, alerts, and real user monitoring in one platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Low-Cost Object Storage$q$, $q$Uses Apache Parquet columnar compression on object storage to cut storage costs versus systems like Elasticsearch.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$SQL and PromQL Queries$q$, $q$Query telemetry data using familiar SQL and PromQL syntax.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$OpenTelemetry Native$q$, $q$Ingests data via OpenTelemetry with no proprietary vendor lock-in.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Single Binary Deployment$q$, $q$Runs as a single binary or via Helm chart on Kubernetes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$AI Assistant and SRE Agent$q$, $q$Natural-language queries and automated root-cause analysis available on Cloud/Enterprise plans.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Free, fully open-source OSS edition with no usage limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Self-hosted Enterprise tier is free up to 50 GB/day ingestion$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Lower storage costs than Elasticsearch via columnar compression$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$14-day free trial on Cloud plans with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$SOC 2 Type II and ISO 27001 certified on the Cloud offering$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Cloud pricing is usage-based per GB, which can be harder to predict at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Advanced AI and enterprise capabilities require a paid or Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Self-hosted Enterprise features beyond 50 GB/day require contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Is OpenObserve free?$q$, $q$Yes, the self-hosted OSS edition is free with unlimited usage, and Cloud plans include a 14-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$What data types does OpenObserve support?$q$, $q$Logs, metrics, traces, RUM, and session replay in one unified platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$How is OpenObserve priced in the cloud?$q$, $q$Cloud plans charge $0.50/GB for ingestion and $0.01/GB for queries, with a 30% discount for annual commitment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Can I self-host OpenObserve for free at scale?$q$, $q$Self-hosted Enterprise is free up to 50 GB/day of ingestion; above that requires contacting sales.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Is OpenObserve open source?$q$, $q$Yes, it's licensed under AGPL-3.0 with more than 20,000 GitHub stars.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Unified log and metrics platform$q$, $q$Teams replace separate logging, metrics, and tracing tools with OpenObserve's single unified platform.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Cost-sensitive observability at scale$q$, $q$Organizations ingesting large volumes of telemetry use OpenObserve's object-storage architecture to reduce storage costs versus Elasticsearch.$q$, $q$Large-scale engineering organizations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Self-hosted compliance deployments$q$, $q$Teams with data residency needs run OpenObserve self-hosted rather than sending data to a third-party cloud.$q$, $q$Compliance-focused enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Open Source Edition$q$, $q$Free$q$, NULL, $q$["Self-hosted","Unlimited usage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Self-Hosted Enterprise$q$, $q$Free up to 50 GB/day$q$, NULL, $q$["SSO","RBAC","Federated search","Audit trail","Sensitive data redaction"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Professional (Cloud)$q$, $q$$0.50/GB ingestion + $0.01/GB query$q$, NULL, $q$["Logs, metrics, traces, RUM, session replay","Error tracking","14-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Additional retention","Pipelines","AI-powered observability","Incident management","SSO, RBAC","Premium support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$overview$q$, $q$What is OpenObserve?$q$, 2, ARRAY[$q$OpenObserve is an open-source observability platform that unifies logs, metrics, traces, and real user monitoring in one deployment. It stores data on low-cost object storage using Apache Parquet columnar compression and supports SQL and PromQL for queries.$q$, $q$It is built for OpenTelemetry-native ingestion and can be deployed as a single binary or via a Helm chart on Kubernetes, with both a free open-source edition and paid Cloud and Enterprise tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', $q$who-its-for$q$, $q$Who OpenObserve is for$q$, 2, ARRAY[$q$OpenObserve is aimed at DevOps and platform engineering teams that want full-stack observability without running and paying for multiple separate tools.$q$, $q$Its low-cost storage architecture makes it a fit for teams managing large telemetry volumes who want to control storage spend compared to systems like Elasticsearch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('22369d03-3beb-4c3b-bad9-983dd3069db4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Uptrace ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Uptrace is an OpenTelemetry-based observability platform unifying traces, metrics, and logs on a ClickHouse backend.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0.075/GB (traces & logs, Cloud)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Uptrace: open-source OpenTelemetry observability platform for traces, metrics, and logs on ClickHouse, self-hosted or cloud.$q$,
  og_description = $q$Uptrace: open-source OpenTelemetry observability platform for traces, metrics, and logs on ClickHouse, self-hosted or cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e7a0b53e-f0d9-4f9d-ac95-70d431887088';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e7a0b53e-f0d9-4f9d-ac95-70d431887088' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Service Graph & APM$q$, $q$Visualizes service dependencies and RED metrics (request rate, error rate, duration).$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Zero-Code Instrumentation$q$, $q$Auto-instruments applications across 11+ programming languages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$OTel Arrow Compression$q$, $q$Uses the OTel Arrow protocol, claimed to deliver 15-30x compression over raw telemetry data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$SSO Support$q$, $q$SAML/OIDC single sign-on for enterprise identity providers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Flexible Deployment$q$, $q$Available as Cloud, self-hosted, Kubernetes, Ansible, or Docker deployments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$AI Assistant Integration$q$, $q$Query telemetry data via MCP-compatible AI assistants such as Claude Code, Cursor, and GitHub Copilot.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Free, unlimited self-hosted Community Edition available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Cloud free tier includes 50 GB storage and 5,000 timeseries per month with no card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Transparent per-GB pricing with no seat or host-count charges$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Auto-instrumentation across 11+ languages$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$99.9% uptime SLA on the Cloud offering$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Cold storage and extended data retention incur additional per-GB charges$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Licensed on-premises/enterprise tier requires custom pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Smaller community/ecosystem than larger established observability vendors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Is Uptrace free?$q$, $q$The self-hosted Community Edition is free and unlimited; the Cloud plan includes a free tier of 50 GB storage and 5,000 timeseries per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$How is Uptrace Cloud priced?$q$, $q$Pay-per-GB for traces and logs starting at $0.075/GB, and per-datapoint for metrics starting at $0.025 per 1 million datapoints, with volume discounts.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Does Uptrace support OpenTelemetry?$q$, $q$Yes, Uptrace is built around OpenTelemetry data and also accepts Prometheus, Vector, FluentBit, and CloudWatch data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Can I self-host Uptrace?$q$, $q$Yes, the Community Edition is open source and free to self-host; a licensed on-premises option is also available.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Does Uptrace integrate with AI coding assistants?$q$, $q$Yes, via MCP it can be queried from AI assistants such as Claude Code, Cursor, and GitHub Copilot.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Distributed tracing for microservices$q$, $q$Engineering teams use Uptrace's service graph and APM to trace requests and monitor RED metrics across distributed systems.$q$, $q$SREs and backend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Cost-conscious observability$q$, $q$Teams switching from per-seat observability vendors adopt Uptrace's per-GB pricing to reduce costs.$q$, $q$Cost-sensitive engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Self-hosted telemetry$q$, $q$Organizations that must keep telemetry data in-house run the free Community Edition on their own infrastructure.$q$, $q$Security- and compliance-conscious teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Free (Cloud)$q$, $q$$0/month$q$, $q$monthly$q$, $q$["50 GB traces/logs/metrics per month","5,000 timeseries","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Cloud Pay-as-you-go$q$, $q$From $0.075/GB (traces & logs)$q$, $q$monthly$q$, $q$["Volume discounts","Unlimited users, services, and hosts","Configurable retention (1-12 months)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Community Edition (self-hosted)$q$, $q$Free$q$, NULL, $q$["Unlimited usage","Open source on GitHub"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$Licensed On-Premises$q$, $q$Custom$q$, NULL, $q$["Dedicated support","SOC 2 certification available"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$overview$q$, $q$What is Uptrace?$q$, 2, ARRAY[$q$Uptrace is an observability platform that unifies application tracing, metrics, and logs in a single interface, processing telemetry using OpenTelemetry standards on a ClickHouse-based backend.$q$, $q$It offers a service graph, zero-code auto-instrumentation across 11+ languages, and flexible deployment as a managed Cloud service, self-hosted Community Edition, or licensed on-premises install.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', $q$who-its-for$q$, $q$Who Uptrace is for$q$, 2, ARRAY[$q$Uptrace is built for engineering teams, SREs, and DevOps professionals managing distributed systems who want OpenTelemetry-based observability without vendor lock-in.$q$, $q$Its transparent per-GB pricing and free self-hosted Community Edition also appeal to teams looking to control observability costs compared to seat- or host-based vendors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e7a0b53e-f0d9-4f9d-ac95-70d431887088', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── HyperDX ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HyperDX is an open-source observability platform unifying session replay, logs, traces, metrics, and errors, powered by ClickHouse.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, California, United States$q$,
  languages = '{}',
  seo_meta_description = $q$HyperDX: open-source observability platform for logs, traces, metrics, session replay, and errors, built on ClickHouse.$q$,
  og_description = $q$HyperDX: open-source observability platform for logs, traces, metrics, session replay, and errors, built on ClickHouse.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd0fed099-679d-4702-a509-fbb8a5115476';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd0fed099-679d-4702-a509-fbb8a5115476' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$End-to-End Tracing$q$, $q$Automatically correlates requests from browsers or mobile apps through backend services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$ClickHouse-Powered Search$q$, $q$Searches terabytes of events in seconds.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Correlated Session Replay$q$, $q$Links user session recordings with backend logs and traces.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Automatic Pattern Clustering$q$, $q$Condenses billions of log events into recognizable patterns.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Chart Builder$q$, $q$Visualizes logs, metrics, and traces without writing complex queries.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$OpenTelemetry Support$q$, $q$Vendor-agnostic instrumentation for logs, metrics, and traces.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Alert Integration$q$, $q$Sends notifications via Slack, email, or PagerDuty.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Open source with an active GitHub community$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Free tier available with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$No per-seat or per-host charges; pricing is based on storage volume only$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Backed by Y Combinator and later acquired by ClickHouse, adding stability and resources$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$SOC 2 Type II certified$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Free tier is limited to 3 GB/month and 3-day data retention$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Higher usage incurs per-GB overage charges ($0.40/GB)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Enterprise features like SAML SSO require a custom-priced plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Is HyperDX free?$q$, $q$Yes, HyperDX has a free tier (3 GB/month, 3-day retention, up to 1 user) with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$How much does HyperDX cost?$q$, $q$The Starter plan is $20/month for 50 GB of storage and 30-day retention with unlimited users; Enterprise is custom priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Is HyperDX open source?$q$, $q$Yes, HyperDX is open source and available on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Who owns HyperDX?$q$, $q$HyperDX was built by DeploySentinel, Inc., a Y Combinator-backed startup, and was later acquired by ClickHouse.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$What platforms does HyperDX support?$q$, $q$It supports Node.js, Python, Java, Golang, Elixir, React Native, and browser JavaScript, deployable on Kubernetes, AWS EC2, Vercel, Fly.io, Heroku, and Cloudflare.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$End-to-end request debugging$q$, $q$Engineering teams trace requests from the browser through backend services to debug production issues faster.$q$, $q$Full-stack engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Session replay with backend context$q$, $q$Support and engineering teams replay user sessions alongside correlated logs and traces to diagnose bug reports.$q$, $q$Product engineering and support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Cost-effective observability at scale$q$, $q$Teams moving off per-seat tools use HyperDX's volume-based pricing to reduce observability costs.$q$, $q$Engineering teams cost-optimizing observability$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["3 GB/month storage","3-day retention","Up to 1 user","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Starter$q$, $q$$20/month$q$, $q$monthly$q$, $q$["50 GB/month storage included","30-day retention","Unlimited users","$0.40/GB overage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom storage and retention","SAML SSO","Volume discounts"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$overview$q$, $q$What is HyperDX?$q$, 2, ARRAY[$q$HyperDX is an open-source observability platform that unifies session replay, logs, traces, metrics, and errors in one interface, letting teams trace requests end-to-end from a user's browser through backend servers automatically.$q$, $q$It is powered by ClickHouse for fast search across large event volumes and was built by Y Combinator-backed DeploySentinel, Inc. before being acquired by ClickHouse.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', $q$who-its-for$q$, $q$Who HyperDX is for$q$, 2, ARRAY[$q$HyperDX is for engineering teams that need affordable production debugging and monitoring without enterprise per-seat pricing.$q$, $q$Its free tier and volume-based pricing suit smaller teams, while unlimited users on the Starter plan and custom Enterprise options support larger organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d0fed099-679d-4702-a509-fbb8a5115476', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── CrowdSec ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CrowdSec is a crowd-sourced, open-source threat intelligence platform that blocks malicious IPs using shared attack data.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CrowdSec: open-source, crowd-sourced threat intelligence platform that blocks malicious IPs using shared attack data from a global network.$q$,
  og_description = $q$CrowdSec: open-source, crowd-sourced threat intelligence platform that blocks malicious IPs using shared attack data from a global network.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '521d7edd-be93-4cc5-b678-97bf55389e62';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '521d7edd-be93-4cc5-b678-97bf55389e62' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Community Blocklist$q$, $q$Crowd-sourced IP reputation data shared across a network of more than 70,000 users in 190+ countries.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Preemptive Blocking$q$, $q$Aims to block mass exploitation attempts before they reach protected servers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Real-Time Signal Sharing$q$, $q$Aggregates around 15 million daily signals with roughly 50% daily IP rotation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Plug-and-Play Integrations$q$, $q$Connects with common firewalls and CDNs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Premium Blocklists$q$, $q$Curated blocklists by industry, tech stack, or country available on the Platinum tier.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$IP Reputation API$q$, $q$On-demand IP reputation lookups with contextual threat data and MITRE classifications.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Free, open-source Community Plan with core behavioral detection$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Large crowd-sourced network of 70,000+ users across 190+ countries feeding threat data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Claims up to 95% reduction in mass exploitation attempts reaching protected systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Plug-and-play integration with existing firewalls and CDNs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Multiple pricing tiers let teams pay only for the threat intelligence depth they need$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Advanced blocklists and CTI features require paid tiers priced from $1,900+/month for Platinum Blocklists$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Full Console Premium pricing is not publicly listed and requires inquiry$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Premium support and emergency bug fixes are separately priced add-ons$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Is CrowdSec free?$q$, $q$Yes, the Community Plan is free and includes behavioral detection and automated response using the open-source Security Engine.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$How much does CrowdSec's paid tier cost?$q$, $q$Pricing varies by product; the IP Reputation API starts at $49/month for 5,000 queries, while Platinum Blocklists start around $1,900/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Is CrowdSec open source?$q$, $q$Yes, the CrowdSec Security Engine is open-source software available on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$How large is CrowdSec's threat data network?$q$, $q$More than 70,000 active users across 190+ countries share roughly 15 million signals daily.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Can I cancel a CrowdSec paid plan anytime?$q$, $q$Yes, plans can be canceled at any time, effective at the end of the billing month.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Preemptive IP blocking for servers$q$, $q$Organizations deploy CrowdSec's Security Engine to block known malicious IPs before attacks reach their infrastructure.$q$, $q$Security and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Reducing alert fatigue$q$, $q$Security operations teams use CrowdSec's curated blocklists to cut down on the volume of low-value security alerts.$q$, $q$SOC analysts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Enterprise threat intelligence$q$, $q$Larger organizations subscribe to Platinum Blocklists or the IP Reputation API for deeper, industry-specific threat context.$q$, $q$Enterprise security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Community$q$, $q$Free$q$, $q$monthly$q$, $q$["Behavioral detection","Automated security response","Open-source Security Engine"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Console Premium$q$, $q$Contact for pricing$q$, $q$monthly$q$, $q$["Premium Community Blocklist","Alert surge notifications","Advanced stack management","Extended alert retention","SaaS API access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$Platinum Blocklists$q$, $q$From $1,900/month$q$, $q$monthly$q$, $q$["Curated blocklists by industry, tech stack, or country","High background-noise blocklist","AI crawlers blocklist"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$IP Reputation API$q$, $q$From $49/month$q$, $q$monthly$q$, $q$["5,000 queries","32 criteria of context","MITRE classifications","Hourly updates"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$overview$q$, $q$What is CrowdSec?$q$, 2, ARRAY[$q$CrowdSec is a threat intelligence platform that uses crowd-sourced, AI-driven data and blocklists to help organizations preemptively block malicious IP addresses before attacks reach their servers.$q$, $q$Its open-source Security Engine detects and shares attack signals across a global network of users, and paid tiers add premium blocklists, an IP Reputation API, and enterprise console features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', $q$who-its-for$q$, $q$Who CrowdSec is for$q$, 2, ARRAY[$q$CrowdSec is for security operations teams and organizations that want to reduce alert fatigue and block distributed, mass-exploitation attacks using shared threat intelligence.$q$, $q$Its free Community Plan suits individuals and small teams, while Platinum Blocklists and the IP Reputation API target enterprises needing deeper, industry-specific threat context.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('521d7edd-be93-4cc5-b678-97bf55389e62', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Wazuh ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Wazuh is a free, open-source XDR and SIEM platform for endpoint security, threat detection, and compliance monitoring.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Wazuh: free, open-source XDR and SIEM platform for endpoint security, threat detection, and cloud workload protection.$q$,
  og_description = $q$Wazuh: free, open-source XDR and SIEM platform for endpoint security, threat detection, and cloud workload protection.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e60f5b02-2824-43ca-a32f-0fbe7c20da50' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Endpoint Security$q$, $q$Configuration assessment, malware detection, and file integrity monitoring.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Threat Intelligence$q$, $q$Threat hunting, log data analysis, and vulnerability detection.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Active XDR$q$, $q$Real-time correlation with granular, on-device active responses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Cloud Security$q$, $q$Container security and cloud workload posture management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$SIEM Capabilities$q$, $q$Centralized monitoring, alerting, and regulatory compliance support.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Open Source$q$, $q$Fully open source with ongoing community contributions on GitHub.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Completely free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Large-scale adoption: 15+ million protected endpoints and 100,000+ enterprise users reported$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Combines SIEM and XDR capabilities in a single platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Works across public cloud, private cloud, and on-premises environments$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Optional managed Wazuh Cloud and professional support/training available$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Self-managed deployments require in-house expertise to configure and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Wazuh Cloud and professional services pricing is not publicly listed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Support relies partly on community channels unless a paid support contract is purchased$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Is Wazuh free?$q$, $q$Yes, Wazuh is free and open source with no license costs; paid Wazuh Cloud and support services are optional.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$What is Wazuh used for?$q$, $q$Wazuh provides SIEM and XDR capabilities including endpoint security, threat detection, vulnerability detection, and compliance monitoring.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Does Wazuh support cloud environments?$q$, $q$Yes, it monitors public cloud, private cloud, and on-premises workloads, including container security.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$How many organizations use Wazuh?$q$, $q$Wazuh reports 15+ million protected endpoints and 100,000+ enterprise users.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Does Wazuh integrate with other security tools?$q$, $q$Yes, including VirusTotal, TheHive, PagerDuty, and other third-party APIs.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Unified SIEM and XDR$q$, $q$Security teams use Wazuh to centralize log analysis, threat detection, and incident response across endpoints and cloud workloads.$q$, $q$Security operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Regulatory compliance monitoring$q$, $q$Organizations use Wazuh's IT hygiene and compliance modules to support regulatory requirements without commercial SIEM licensing costs.$q$, $q$Compliance and IT security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Cloud workload protection$q$, $q$DevSecOps teams deploy Wazuh's cloud security modules for container security and posture management.$q$, $q$DevSecOps and cloud security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$Community (self-hosted)$q$, $q$Free$q$, NULL, $q$["Full SIEM/XDR feature set","Open source"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$overview$q$, $q$What is Wazuh?$q$, 2, ARRAY[$q$Wazuh is a unified security platform providing Extended Detection and Response (XDR) and Security Information and Event Management (SIEM) capabilities. It monitors, detects, and alerts on security events across endpoints and cloud workloads.$q$, $q$The platform is free and fully open source, with paid options limited to managed Wazuh Cloud hosting, professional support, consulting, and training.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', $q$who-its-for$q$, $q$Who Wazuh is for$q$, 2, ARRAY[$q$Wazuh is for organizations of any size that want scalable security monitoring without vendor lock-in or commercial SIEM licensing costs, from startups to large enterprises.$q$, $q$It fits teams needing endpoint security, threat hunting, vulnerability detection, and cloud workload protection in one open-source platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e60f5b02-2824-43ca-a32f-0fbe7c20da50', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Security Onion ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Security Onion is a free, open-source platform for threat hunting, network security monitoring, and log management.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2008,
  company_size = $q$30+ employees$q$,
  headquarters = $q$United States$q$,
  languages = '{}',
  seo_meta_description = $q$Security Onion: free, open-source platform for threat hunting, network security monitoring, and log management using Suricata, Zeek, and Elastic.$q$,
  og_description = $q$Security Onion: free, open-source platform for threat hunting, network security monitoring, and log management using Suricata, Zeek, and Elastic.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1e225ae3-f536-4753-a9dd-77c8187545ca';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1e225ae3-f536-4753-a9dd-77c8187545ca' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Network Security Monitoring$q$, $q$Built on Suricata, Zeek, and the Elastic Stack for full network visibility.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Threat Hunting$q$, $q$Tools for investigating and pivoting through security alerts and logs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Log Management$q$, $q$Centralized collection and analysis of security logs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Onion AI$q$, $q$AI-assisted alert analysis and detection tuning, with local model support available in the Pro version.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Community Detection Rules$q$, $q$Continuously updated open-source detection rulesets.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Free and open source with no licensing cost for the core platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Combines established tools (Suricata, Zeek, Elastic Stack) into one integrated platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Long track record: created in 2008, with over 2 million downloads by 2021$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Used across government, defense, Fortune 500, and academic sectors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Optional Pro tier adds AI-driven detection tuning and local model support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Security Onion Pro pricing is not publicly disclosed$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Requires in-house expertise to deploy and tune for network security monitoring$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Onion AI Assistant and local model support require the paid Pro tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Is Security Onion free?$q$, $q$Yes, Security Onion is a free, open-source platform; a paid Pro tier with additional AI-driven features launched in 2024.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$What tools does Security Onion integrate?$q$, $q$It integrates Suricata, Zeek, and the Elastic Stack for network security monitoring and log management.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Who created Security Onion?$q$, $q$Doug Burks founded Security Onion in 2008; Security Onion Solutions, LLC was established in 2014.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$What is Onion AI?$q$, $q$Onion AI is an AI-assisted feature for alert analysis and detection tuning, with local model support available in the Pro version.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Who uses Security Onion?$q$, $q$It's used by federal, state, and municipal governments, the Department of Defense, Fortune 500 companies, universities, and financial institutions.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Network security monitoring$q$, $q$Security teams deploy Security Onion to monitor network traffic using Suricata and Zeek for intrusion detection.$q$, $q$Network security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Threat hunting$q$, $q$Analysts use Security Onion's integrated tools to hunt for and investigate security threats across logs and network data.$q$, $q$Threat hunters and SOC analysts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Government and defense security monitoring$q$, $q$Federal, state, and defense organizations use Security Onion for compliant, cost-effective network monitoring.$q$, $q$Government and defense agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Security Onion (Community)$q$, $q$Free$q$, NULL, $q$["Threat hunting","Network security monitoring","Log management","Community detection rules"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$Security Onion Pro$q$, $q$Custom$q$, NULL, $q$["Onion AI Assistant","Local model support","Enhanced AI-driven capabilities"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$overview$q$, $q$What is Security Onion?$q$, 2, ARRAY[$q$Security Onion is a free and open platform for threat hunting, network security monitoring, and log management, integrating established open-source tools including Suricata, Zeek, and the Elastic Stack.$q$, $q$Doug Burks founded Security Onion in 2008, and Security Onion Solutions, LLC was established in 2014. Security Onion 2 launched in 2020, and the project passed 2 million downloads by 2021, with the Onion AI Assistant introduced in 2025.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', $q$who-its-for$q$, $q$Who Security Onion is for$q$, 2, ARRAY[$q$Security Onion serves federal, state, and municipal governments, the Department of Defense, Fortune 500 enterprises, universities, financial institutions, utilities, and manufacturing organizations.$q$, $q$It fits teams that need free, open-source network security monitoring and threat hunting, with an optional paid Pro tier for organizations wanting AI-driven detection tuning.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1e225ae3-f536-4753-a9dd-77c8187545ca', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Falco ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Falco is a CNCF-graduated, open-source runtime security tool that detects abnormal behavior across hosts, containers, Kubernetes, and cloud services.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Falco is a free, open-source CNCF runtime security tool that detects threats across Kubernetes, containers, hosts, and cloud using eBPF and custom rules.$q$,
  og_description = $q$Falco is a free, open-source CNCF runtime security tool that detects threats across Kubernetes, containers, hosts, and cloud using eBPF and custom rules.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '07f5df46-0b11-4627-b5f3-78e1a12e546e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '07f5df46-0b11-4627-b5f3-78e1a12e546e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$eBPF-based runtime monitoring$q$, $q$Uses eBPF to observe Linux kernel events with low overhead across hosts and containers.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Custom detection rules$q$, $q$Ships with pre-configured rules that can be customized to match organization-specific threats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Kubernetes-native deployment$q$, $q$Deploys via an official Helm chart across GKE, EKS, AKS, and other Kubernetes distributions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Streaming JSON alerts$q$, $q$Generates real-time alerts in JSON format for automated response pipelines.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$50+ integrations$q$, $q$Forwards alerts to SIEM and data lake systems for centralized security operations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Multi-architecture support$q$, $q$Runs on both x64 and ARM CPU architectures.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Free and fully open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$CNCF graduated project backed by an active community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Low-overhead eBPF-based monitoring suited to cloud-native workloads$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Wide integration ecosystem for forwarding alerts to existing security tooling$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Used in production by companies such as Shopify and GitLab$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Requires familiarity with Linux kernel concepts and rule syntax to customize effectively$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$No official managed or hosted offering from the Falco project itself, requiring self-hosting$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Rule tuning is needed to reduce noisy alerts in complex environments$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Is Falco free to use?$q$, $q$Yes, Falco is fully open source with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$What does Falco monitor?$q$, $q$Falco monitors hosts, containers, Kubernetes, and cloud services for abnormal behavior using eBPF and custom rules.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Does Falco run on Kubernetes?$q$, $q$Yes, Falco can be deployed to Kubernetes clusters such as GKE, EKS, and AKS using its official Helm chart.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Who maintains Falco?$q$, $q$Falco is a CNCF graduated project under The Linux Foundation, originally created by Sysdig.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$What alert format does Falco use?$q$, $q$Falco streams real-time alerts in JSON format that can be forwarded to over 50 supported integrations.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Kubernetes runtime threat detection$q$, $q$Security teams deploy Falco across Kubernetes clusters to detect abnormal container and pod behavior in real time.$q$, $q$Platform and security engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Compliance monitoring$q$, $q$Organizations use Falco's rule engine to flag activity relevant to regulatory compliance requirements.$q$, $q$Compliance and security operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Cloud workload protection$q$, $q$Falco monitors cloud service activity alongside hosts and containers to extend runtime visibility beyond Kubernetes.$q$, $q$Cloud security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$Open Source$q$, $q$Free$q$, NULL, $q$["eBPF-based runtime monitoring","Custom rules","Helm chart deployment","50+ integrations"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$overview$q$, $q$What is Falco?$q$, 2, ARRAY[$q$Falco is a cloud-native runtime security tool that detects abnormal behavior and security threats across hosts, containers, Kubernetes, and cloud environments. It applies custom rules to Linux kernel events captured via eBPF, along with data from plugins, to identify suspicious activity as it happens.$q$, $q$Falco is a CNCF graduated project under The Linux Foundation, originally created by Sysdig. It is fully open source, runs on x64 and ARM architectures, and can be deployed to Kubernetes clusters using an official Helm chart.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', $q$who-its-for$q$, $q$Who Falco is for$q$, 2, ARRAY[$q$Falco is built for organizations running cloud-native infrastructure who need real-time runtime security monitoring for Kubernetes, containers, and hosts, including teams with regulatory compliance monitoring requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('07f5df46-0b11-4627-b5f3-78e1a12e546e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Trivy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Trivy is Aqua Security's open-source, all-in-one scanner for vulnerabilities, misconfigurations, secrets, and SBOMs across code, images, and clusters.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Trivy is a free, open-source scanner from Aqua Security that finds vulnerabilities, misconfigurations, and secrets in code, images, and Kubernetes.$q$,
  og_description = $q$Trivy is a free, open-source scanner from Aqua Security that finds vulnerabilities, misconfigurations, and secrets in code, images, and Kubernetes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2d2c7247-cad0-4d55-bf16-9fd4c2b6499d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Vulnerability scanning$q$, $q$Detects known CVEs in OS packages and application dependencies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Misconfiguration detection$q$, $q$Scans Infrastructure as Code files for security misconfigurations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Secret scanning$q$, $q$Finds exposed secrets such as API keys and credentials in code and images.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$SBOM generation$q$, $q$Produces a Software Bill of Materials for container images and file systems.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$License checking$q$, $q$Identifies license risks in project dependencies.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Kubernetes scanning$q$, $q$Assesses running Kubernetes clusters for vulnerabilities and misconfigurations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Free and open source under the permissive Apache-2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Combines vulnerability, misconfiguration, secret, and SBOM scanning in a single tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Integrates with Docker, GitLab, Azure Container Registry, and Harbor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Actively maintained by Aqua Security with broad industry adoption$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Requires CI/CD or command-line setup rather than offering a hosted dashboard out of the box$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$No official enterprise support plan documented on the website$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$As a CLI-first tool, it is less accessible to non-technical users without additional tooling$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Is Trivy free?$q$, $q$Yes, Trivy is open source under the Apache-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$What can Trivy scan?$q$, $q$Trivy scans code repositories, binary artifacts, container images, and Kubernetes clusters for vulnerabilities and misconfigurations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Who develops Trivy?$q$, $q$Trivy is developed by Aqua Security Software Ltd.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Does Trivy generate SBOMs?$q$, $q$Yes, Trivy can generate a Software Bill of Materials for scanned artifacts.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$What language is Trivy written in?$q$, $q$Trivy is written in Go.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Container image scanning in CI/CD$q$, $q$Development teams integrate Trivy into pipelines such as GitLab CI to catch vulnerable images before deployment.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Kubernetes cluster security assessment$q$, $q$Security teams run Trivy against live clusters to identify vulnerabilities and misconfigurations.$q$, $q$Security operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Dependency and secret auditing$q$, $q$Engineering teams use Trivy to catch exposed secrets and vulnerable dependencies in source repositories.$q$, $q$Application security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Vulnerability scanning","Misconfiguration detection","Secret scanning","SBOM generation","License checking"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$overview$q$, $q$What is Trivy?$q$, 2, ARRAY[$q$Trivy is an all-in-one security scanner developed by Aqua Security that identifies vulnerabilities (CVEs) and misconfigurations across code repositories, binary artifacts, container images, and Kubernetes clusters.$q$, $q$Beyond vulnerability scanning, Trivy also detects exposed secrets, generates Software Bills of Materials, and checks dependency licenses. It is open source under the Apache-2.0 license and written in Go.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', $q$who-its-for$q$, $q$Who Trivy is for$q$, 2, ARRAY[$q$Trivy is for DevOps, platform, and security teams who need a single tool to scan code, container images, and Kubernetes clusters for vulnerabilities, misconfigurations, secrets, and license issues.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d2c7247-cad0-4d55-bf16-9fd4c2b6499d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Grype ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Grype is Anchore's open-source vulnerability scanner for container images, filesystems, and SBOMs across major OS and language package ecosystems.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Grype is a free, open-source vulnerability scanner from Anchore for container images, filesystems, and SBOMs, with EPSS and KEV-based prioritization.$q$,
  og_description = $q$Grype is a free, open-source vulnerability scanner from Anchore for container images, filesystems, and SBOMs, with EPSS and KEV-based prioritization.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b665ac9-1776-455f-ad7c-c82e3c8843e9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Broad OS ecosystem coverage$q$, $q$Scans packages from Alpine, Debian, Ubuntu, RHEL, Oracle Linux, and Amazon Linux.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Language package support$q$, $q$Detects vulnerabilities in Ruby, Java, JavaScript, Python, .NET, Go, PHP, and Rust dependencies.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Multiple image format support$q$, $q$Works with Docker, OCI, and Singularity image formats.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$SBOM input scanning$q$, $q$Scans pre-generated SBOM files directly, including those produced by Syft.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Risk-based prioritization$q$, $q$Uses EPSS scores, CISA KEV data, and risk scoring to help prioritize which vulnerabilities to fix first.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$OpenVEX support$q$, $q$Filters and enhances scan results using VEX (Vulnerability Exploitability eXchange) data.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Free and open source under Apache-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Broad ecosystem support across OS packages and multiple programming languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Vulnerability prioritization via EPSS and KEV reduces noise$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Multiple install methods, including curl, Homebrew, Docker, Chocolatey, and MacPorts$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Active GitHub community with 12.6k+ stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Command-line tool with no built-in graphical dashboard$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Some workflows require pairing with a separate SBOM tool like Syft$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$No official managed or hosted service documented$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Is Grype free?$q$, $q$Yes, Grype is open source under the Apache-2.0 license, sponsored by Anchore.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$What can Grype scan?$q$, $q$Grype scans container images, filesystems, and SBOM files for known vulnerabilities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Does Grype support SBOM files?$q$, $q$Yes, Grype can scan SBOM files directly, including CycloneDX and SPDX formats.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$How is Grype installed?$q$, $q$Grype can be installed via a curl script, Homebrew, Docker, Chocolatey, or MacPorts.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Does Grype prioritize vulnerabilities?$q$, $q$Yes, it uses EPSS scores, CISA's Known Exploited Vulnerabilities list, and risk scoring to help prioritize remediation.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Container image vulnerability scanning$q$, $q$Teams scan container images before deployment to catch known CVEs.$q$, $q$DevOps and security engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$SBOM-based vulnerability analysis$q$, $q$Security teams scan SBOM files generated by tools like Syft to assess dependency risk without rescanning images.$q$, $q$Application security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$CI/CD vulnerability gating$q$, $q$Engineering teams add Grype scans to pipelines to block builds with critical vulnerabilities.$q$, $q$Platform engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Container image scanning","Filesystem scanning","SBOM scanning","EPSS/KEV prioritization"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$overview$q$, $q$What is Grype?$q$, 2, ARRAY[$q$Grype is an open-source vulnerability scanner sponsored by Anchore that identifies security issues in container images, filesystems, and Software Bills of Materials. It covers major OS package ecosystems as well as language-specific packages across Ruby, Java, JavaScript, Python, .NET, Go, PHP, and Rust.$q$, $q$Grype is released under the Apache-2.0 license and can be installed via curl, Homebrew, Docker, Chocolatey, or MacPorts. It supports risk-based prioritization using EPSS and CISA's Known Exploited Vulnerabilities data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', $q$who-its-for$q$, $q$Who Grype is for$q$, 2, ARRAY[$q$Grype is for developers, DevOps engineers, and security teams who need to assess container images, filesystems, and SBOMs for known vulnerabilities as part of security reviews or CI/CD pipelines.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b665ac9-1776-455f-ad7c-c82e3c8843e9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Syft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Syft is Anchore's open-source CLI and Go library for generating Software Bills of Materials from container images and filesystems.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Syft is a free, open-source tool from Anchore that generates SBOMs from container images and filesystems in CycloneDX, SPDX, and Syft JSON formats.$q$,
  og_description = $q$Syft is a free, open-source tool from Anchore that generates SBOMs from container images and filesystems in CycloneDX, SPDX, and Syft JSON formats.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8c83d263-30f5-472f-9408-4e9883759bcd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8c83d263-30f5-472f-9408-4e9883759bcd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$SBOM generation$q$, $q$Creates SBOMs from container images, filesystems, and archives.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Broad ecosystem coverage$q$, $q$Supports Alpine, Debian, RPM, Go, Python, Java, JavaScript, Ruby, Rust, PHP, and .NET packages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Multiple output formats$q$, $q$Exports SBOMs in CycloneDX, SPDX, and Syft's own JSON format.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Signed attestations$q$, $q$Creates signed SBOM attestations using the in-toto specification.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Format conversion$q$, $q$Converts SBOMs between supported standards.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Multiple image format support$q$, $q$Works with OCI, Docker, and Singularity image formats.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Free and open source under Apache-2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Wide package ecosystem coverage across OS and language-specific dependencies$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Supports industry-standard SBOM formats, including CycloneDX and SPDX$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Designed to pair directly with Grype for vulnerability scanning$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Multiple install options, including Homebrew, Docker, Scoop, Chocolatey, and Nix$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Command-line tool without a built-in graphical interface$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Best used alongside a separate scanner such as Grype for vulnerability detection, adding a setup step$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$No official managed or hosted service documented$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Is Syft free?$q$, $q$Yes, Syft is open source under Apache-2.0, sponsored by Anchore.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$What formats does Syft output?$q$, $q$Syft can output SBOMs in CycloneDX, SPDX, and its own Syft JSON format.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Does Syft work with Grype?$q$, $q$Yes, Syft is designed to generate SBOMs that Grype can then scan for vulnerabilities.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Can Syft sign SBOMs?$q$, $q$Yes, Syft can create signed SBOM attestations using the in-toto specification.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$What is Syft written in?$q$, $q$Syft is written in Go.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Software supply chain inventory$q$, $q$Organizations generate SBOMs with Syft to document dependencies across container images and codebases.$q$, $q$Security and compliance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$SBOM generation for vulnerability scanning$q$, $q$Teams generate SBOMs with Syft and scan them with Grype to identify vulnerable dependencies.$q$, $q$DevOps and application security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$SBOM format conversion$q$, $q$Teams convert SBOMs between CycloneDX and SPDX formats using Syft to satisfy different downstream tooling requirements.$q$, $q$Compliance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$Open Source$q$, $q$Free$q$, NULL, $q$["SBOM generation","CycloneDX/SPDX export","Signed attestations","Format conversion"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$overview$q$, $q$What is Syft?$q$, 2, ARRAY[$q$Syft is an open-source CLI tool and Go library, sponsored by Anchore, that generates Software Bills of Materials from container images and filesystems. It supports dozens of package ecosystems, including Alpine, Debian, RPM, Go, Python, Java, JavaScript, Ruby, Rust, PHP, and .NET.$q$, $q$Syft outputs SBOMs in industry-standard formats such as CycloneDX and SPDX, as well as its own Syft JSON format, and can create signed SBOM attestations using the in-toto specification. It is released under the Apache-2.0 license and written in Go.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', $q$who-its-for$q$, $q$Who Syft is for$q$, 2, ARRAY[$q$Syft is for developers and security teams who need to catalog software dependencies in containerized applications and projects, typically as a precursor to vulnerability scanning with a tool such as Grype.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c83d263-30f5-472f-9408-4e9883759bcd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Clair ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Clair is an open-source application that statically analyzes container images and reports vulnerabilities affecting their contents.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Clair is a free, open-source tool that indexes container images and matches their contents against vulnerability data without executing the image.$q$,
  og_description = $q$Clair is a free, open-source tool that indexes container images and matches their contents against vulnerability data without executing the image.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'caec6253-7f1b-408d-968e-1099f0367648';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'caec6253-7f1b-408d-968e-1099f0367648' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Static image analysis$q$, $q$Parses image contents to report vulnerabilities without executing the container.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Manifest indexing$q$, $q$Indexes container image manifests as part of its analysis workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Vulnerability matching$q$, $q$Matches indexed image contents against continuously ingested vulnerability data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Notification service$q$, $q$Alerts users when new vulnerabilities are found affecting previously indexed images.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Broad distribution support$q$, $q$Analyzes images based on Ubuntu, Debian, RHEL, SUSE, Oracle, Alpine, Amazon Linux, VMware Photon, and Python packages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$ClairCore library$q$, $q$Built on the ClairCore library, which separates core scanning logic from the service layer.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Free and open source, distributed via GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Static analysis approach avoids running potentially untrusted container images$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Broad Linux distribution and package ecosystem support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Notification service keeps previously scanned images current as new vulnerabilities emerge$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Used as the vulnerability scanner behind the Quay container registry$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Requires self-hosting and operational setup, with no hosted SaaS documented on the project site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$No graphical UI is documented on the project's own site; typically consumed via API or an integrated registry like Quay$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Documentation on the project homepage is limited compared to some other scanners$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Is Clair free?$q$, $q$Yes, Clair is open source software available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$How does Clair analyze images?$q$, $q$Clair performs static analysis, parsing image contents rather than executing them, to identify vulnerabilities.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$What is ClairCore?$q$, $q$ClairCore is the underlying library that provides Clair's core scanning functionality; Clair itself is a service wrapper around it.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Does Clair notify users of new vulnerabilities?$q$, $q$Yes, Clair includes a notification service that alerts when new vulnerabilities affect already-indexed images.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$What container registry uses Clair?$q$, $q$Clair is used by the Quay container registry for vulnerability scanning.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Container registry vulnerability scanning$q$, $q$Registries such as Quay integrate Clair to automatically scan pushed images for known vulnerabilities.$q$, $q$Platform and registry operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Static image security analysis$q$, $q$Security teams run Clair to analyze container images without executing them.$q$, $q$Container security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Ongoing vulnerability monitoring$q$, $q$Teams rely on Clair's notification service to learn when newly disclosed vulnerabilities affect previously scanned images.$q$, $q$Security operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Static image analysis","Manifest indexing","Vulnerability matching","Notification service"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$overview$q$, $q$What is Clair?$q$, 2, ARRAY[$q$Clair is an open-source application for parsing container image contents and reporting vulnerabilities affecting them, using static analysis rather than executing the image. It works through a three-part workflow: indexing manifests, matching vulnerabilities, and sending notifications.$q$, $q$Clair v4 is built on the ClairCore library, which provides the core scanning engine, with Clair acting as a service wrapper around it. It supports images based on Ubuntu, Debian, RHEL, SUSE, Oracle, Alpine, Amazon Linux, VMware Photon, and Python.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', $q$who-its-for$q$, $q$Who Clair is for$q$, 2, ARRAY[$q$Clair is for container security teams and organizations running OCI-compliant container images who need automated, static vulnerability analysis, often integrated into a container registry such as Quay.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caec6253-7f1b-408d-968e-1099f0367648', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── OpenVAS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenVAS is Greenbone's open-source vulnerability scanner, offering authenticated and unauthenticated testing with a daily-updated detection feed.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2006,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenVAS is a free, open-source vulnerability scanner maintained by Greenbone since 2006, with authenticated testing and a daily-updated test feed.$q$,
  og_description = $q$OpenVAS is a free, open-source vulnerability scanner maintained by Greenbone since 2006, with authenticated testing and a daily-updated test feed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2d037963-f9fb-4d88-bcc4-228a333d83cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2d037963-f9fb-4d88-bcc4-228a333d83cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Authenticated and unauthenticated scanning$q$, $q$Tests systems with or without credentials across many protocol types.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Industrial and internet protocol testing$q$, $q$Supports a range of high-level and low-level internet and industrial protocols.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Internal scripting language$q$, $q$Includes a programming language for writing custom vulnerability tests.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Daily-updated feed$q$, $q$Pulls vulnerability detection tests from a regularly maintained feed updated daily.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Large-scale scanning support$q$, $q$Includes tuning options for running scans at scale.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Core of Greenbone Community Edition$q$, $q$Serves as the scanning engine bundled with other open-source Greenbone modules.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Fully open source with source code available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Daily-updated vulnerability test feed$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Supports both authenticated and unauthenticated scanning$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Extensible through its own internal scripting language$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Backed by Greenbone, which has maintained it since 2006$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Best used as part of the broader Greenbone Community Edition rather than standalone$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Enterprise features and support require Greenbone's commercial products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Requires self-hosting and infrastructure to run at scale$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Is OpenVAS free?$q$, $q$Yes, OpenVAS is open source and forms the core of the free Greenbone Community Edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Who maintains OpenVAS?$q$, $q$Greenbone has developed and maintained OpenVAS since 2006.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Does OpenVAS require authentication to scan?$q$, $q$OpenVAS supports both unauthenticated and authenticated testing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$How often is OpenVAS's vulnerability feed updated?$q$, $q$OpenVAS pulls detection tests from a feed that is updated daily.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Is there a commercial version of OpenVAS?$q$, $q$Yes, OpenVAS is integrated into Greenbone's commercial OPENVAS SCAN product family for enterprise use.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Network vulnerability scanning$q$, $q$Security teams run OpenVAS to identify vulnerabilities across networked systems using authenticated and unauthenticated tests.$q$, $q$Security operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Custom vulnerability test development$q$, $q$Advanced users write custom tests using OpenVAS's internal scripting language for specific environments.$q$, $q$Security researchers and engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Industrial protocol security testing$q$, $q$Organizations use OpenVAS to test industrial and internet protocols for weaknesses.$q$, $q$OT/ICS security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Authenticated and unauthenticated scanning","Daily-updated test feed","Internal scripting language"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$overview$q$, $q$What is OpenVAS?$q$, 2, ARRAY[$q$OpenVAS is an open-source vulnerability scanning platform that identifies security weaknesses in IT systems through authenticated and unauthenticated testing across a range of internet and industrial protocols. It has been developed and continuously advanced by Greenbone since 2006.$q$, $q$OpenVAS includes an internal scripting language for writing custom vulnerability tests and draws on a vulnerability detection feed that is updated daily. It forms the core scanning engine of the free Greenbone Community Edition and also underpins Greenbone's commercial OPENVAS SCAN product family.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', $q$who-its-for$q$, $q$Who OpenVAS is for$q$, 2, ARRAY[$q$OpenVAS is for security teams and organizations that need a free, self-hosted vulnerability scanner for networked systems, including those testing industrial and internet protocols.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2d037963-f9fb-4d88-bcc4-228a333d83cf', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Greenbone ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Greenbone is a German vulnerability management company offering the open-source OpenVAS scanner alongside a tiered family of commercial products.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Greenbone is a German vulnerability management vendor offering a free open-source scanner and paid OPENVAS product tiers for enterprise security.$q$,
  og_description = $q$Greenbone is a German vulnerability management vendor offering a free open-source scanner and paid OPENVAS product tiers for enterprise security.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Automated vulnerability scanning$q$, $q$Scans networks and IT infrastructure for security weaknesses.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Daily-updated test database$q$, $q$Maintains a vulnerability test database of 100,000+ tests, updated daily.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Multiple deployment options$q$, $q$Available as hardware appliances, virtual machines, or cloud-based deployments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Tiered product family$q$, $q$Offers OPENVAS FREE, BASIC, SCAN, SECURITY INTELLIGENCE, and AI product tiers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$GDPR-compliant operations$q$, $q$Operates in compliance with GDPR requirements.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$ISO-certified operations$q$, $q$Holds ISO 9001, ISO 27001, and ISO 14001 certifications.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Offers both a free open-source edition and paid enterprise products$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Large, daily-updated vulnerability test database with 100,000+ tests$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Multiple deployment options, including hardware, virtual machine, and cloud$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$ISO 9001, ISO 27001, and ISO 14001 certified$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Established vendor with 100,000+ installations across 150+ countries$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Enterprise pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Choosing between multiple product tiers (Basic, Scan, Security Intelligence, AI) may require guidance for new buyers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Advanced features are concentrated in paid tiers, with the free edition offering a base level of scanning$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Is Greenbone free to use?$q$, $q$Greenbone offers a free open-source edition (OPENVAS FREE) alongside paid commercial products.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Where is Greenbone based?$q$, $q$Greenbone is headquartered in Germany.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$What products does Greenbone offer?$q$, $q$Greenbone offers OPENVAS FREE, BASIC, SCAN, SECURITY INTELLIGENCE, and AI product tiers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$How is Greenbone priced?$q$, $q$Greenbone's paid products are subscription-based and scaled by scanning scope, such as the number of IPs or assets covered.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Is Greenbone GDPR-compliant?$q$, $q$Yes, Greenbone states its operations are GDPR-compliant.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Enterprise vulnerability management$q$, $q$Organizations use Greenbone's SCAN and SECURITY INTELLIGENCE products to centralize vulnerability management across environments.$q$, $q$Enterprise security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Small business vulnerability scanning$q$, $q$Smaller organizations use Greenbone's lower-tier or free products to scan for vulnerabilities on a limited budget.$q$, $q$Small and mid-sized businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$Government and regulated industry scanning$q$, $q$Government agencies use Greenbone's GDPR-compliant, ISO-certified products for compliance-driven vulnerability scanning.$q$, $q$Government and regulated industries$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$OPENVAS FREE$q$, $q$Free$q$, NULL, $q$["Open-source vulnerability scanning"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$OPENVAS BASIC$q$, $q$Contact for pricing$q$, NULL, $q$["Entry-level vulnerability scanner"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$OPENVAS SCAN$q$, $q$Contact for pricing$q$, NULL, $q$["Core scanning appliance (hardware/VM)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$OPENVAS SECURITY INTELLIGENCE$q$, $q$Contact for pricing$q$, NULL, $q$["Multi-environment centralization platform"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$overview$q$, $q$What is Greenbone?$q$, 2, ARRAY[$q$Greenbone is a Germany-headquartered vulnerability management company that develops the open-source OpenVAS scanner along with a family of commercial OPENVAS products, including BASIC, SCAN, SECURITY INTELLIGENCE, and AI tiers, plus a free OPENVAS FREE edition.$q$, $q$Greenbone maintains a vulnerability test database of over 100,000 tests updated daily, offers hardware, virtual machine, and cloud deployment options, and holds ISO 9001, ISO 27001, and ISO 14001 certifications. The company reports over 100,000 installations across more than 150 countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', $q$who-its-for$q$, $q$Who Greenbone is for$q$, 2, ARRAY[$q$Greenbone serves organizations of all sizes, from small businesses using its free or entry-level products to enterprises and government agencies requiring centralized, compliance-driven vulnerability management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('baf8d62c-e7cc-47b0-a3b3-4bebcddf4b87', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Nuclei ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nuclei is ProjectDiscovery's open-source, YAML-template-based vulnerability scanner for applications, infrastructure, and cloud platforms.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nuclei is a free, open-source vulnerability scanner from ProjectDiscovery using 6,500+ YAML templates, with optional paid cloud reporting features.$q$,
  og_description = $q$Nuclei is a free, open-source vulnerability scanner from ProjectDiscovery using 6,500+ YAML templates, with optional paid cloud reporting features.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$YAML-based templates$q$, $q$Uses a library of over 6,500 community-contributed templates to detect vulnerabilities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Flexible targeting$q$, $q$Scans URLs, IP ranges, ASN ranges, and file-based inputs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Parallel scanning$q$, $q$Runs scans in parallel to reduce time for large-scale assessments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Multi-protocol support$q$, $q$Supports TCP, DNS, HTTP, and file-based protocols.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Authentication support$q$, $q$Handles HTTP basic auth, JWT tokens, and other authentication mechanisms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$CI/CD integration$q$, $q$Integrates into CI/CD pipelines for automated security testing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Cloud reporting and ticketing$q$, $q$Optional cloud features add reporting, CI/CD integration, and ticketing system integrations such as Jira and Splunk.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Free and open source CLI tool with a large community template library$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Fast parallel scanning suited to large-scale assessments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Supports multiple protocols beyond HTTP, including DNS and TCP$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Optional cloud tier adds reporting and ticketing integrations with Jira and Splunk$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Actively maintained by ProjectDiscovery with frequent template contributions$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Advanced reporting and ticketing integrations require the paid cloud tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Effectiveness depends on the quality and coverage of community templates$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Command-line first tool that requires scripting knowledge to use effectively$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Is Nuclei free?$q$, $q$Yes, the core Nuclei CLI scanner is open source; ProjectDiscovery also offers optional paid cloud features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$What are Nuclei templates?$q$, $q$Templates are YAML files that define how Nuclei detects a specific vulnerability or misconfiguration.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Does Nuclei integrate with ticketing systems?$q$, $q$Yes, the cloud tier supports integrations with ticketing systems such as Jira and Splunk.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Who maintains Nuclei?$q$, $q$Nuclei is maintained by ProjectDiscovery.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Can Nuclei run in CI/CD pipelines?$q$, $q$Yes, Nuclei supports integration into CI/CD pipelines for automated scanning.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Bug bounty and penetration testing$q$, $q$Bug bounty hunters and pentesters use Nuclei to quickly scan targets against thousands of known vulnerability templates.$q$, $q$Bug bounty hunters and penetration testers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$CI/CD security automation$q$, $q$DevOps teams add Nuclei scans to CI/CD pipelines to catch vulnerabilities before deployment.$q$, $q$DevOps and security engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Large-scale asset scanning$q$, $q$Security teams use Nuclei's parallel scanning and flexible targeting to assess large numbers of URLs, IPs, or ASN ranges.$q$, $q$Security operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Open Source (CLI)$q$, $q$Free$q$, NULL, $q$["YAML-template scanning","Parallel scanning","CI/CD integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$Cloud$q$, $q$Contact for pricing$q$, NULL, $q$["Comprehensive reporting","CI/CD integration","Ticketing integrations (Jira, Splunk)"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$overview$q$, $q$What is Nuclei?$q$, 2, ARRAY[$q$Nuclei is a fast, customizable vulnerability scanner from ProjectDiscovery that uses simple YAML-based templates to identify exploitable vulnerabilities in applications, infrastructure, cloud platforms, and networks. It draws on a library of more than 6,500 community-contributed templates.$q$, $q$Nuclei can target URLs, IP ranges, ASN ranges, and files, and supports protocols including TCP, DNS, and HTTP. The core CLI scanner is open source, while ProjectDiscovery also offers optional cloud features covering reporting, CI/CD integration, and ticketing system integrations such as Jira and Splunk.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', $q$who-its-for$q$, $q$Who Nuclei is for$q$, 2, ARRAY[$q$Nuclei is for security engineers, red teams, DevOps teams, bug bounty hunters, and penetration testers who need to automate vulnerability detection across large numbers of targets.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('753fe4a9-11ba-48d6-b0b2-d0fabb12b2bb', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Burp Suite ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Burp Suite is PortSwigger's web application security testing platform, offered in free Community, paid Professional, and Enterprise DAST editions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Burp Suite is PortSwigger's web app security testing platform, with a free Community Edition and paid Professional and Enterprise DAST editions.$q$,
  og_description = $q$Burp Suite is PortSwigger's web app security testing platform, with a free Community Edition and paid Professional and Enterprise DAST editions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '753226c3-cede-4bbb-9fad-9d73dd9827e4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '753226c3-cede-4bbb-9fad-9d73dd9827e4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Manual testing toolkit$q$, $q$Provides tools for manual web penetration testing, included in the free Community Edition.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Web vulnerability scanner$q$, $q$Includes a dynamic application security testing (DAST) scanner in paid editions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Attack surface visibility$q$, $q$Helps testers analyze and visualize an application's attack surface.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$CI/CD integration$q$, $q$Integrates into CI/CD pipelines for early vulnerability detection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Automated scanning at scale$q$, $q$Enterprise edition supports automated scanning across many applications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Web Security Academy$q$, $q$PortSwigger offers free web security training content alongside Burp Suite.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Free Community Edition available for learning and manual testing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Professional edition is described by PortSwigger as a leading web penetration testing toolkit$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Enterprise edition supports automated, CI-integrated scanning at scale$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Backed by PortSwigger's free Web Security Academy training content$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Long-established tool widely used across penetration testing and bug bounty communities$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Full scanning capabilities require the paid Professional or Enterprise editions$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Pricing is not published on the main product page and requires further inquiry$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Community Edition lacks the automated scanner found in paid tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Is Burp Suite free?$q$, $q$The Community Edition is free with manual testing tools; the automated scanner requires the paid Professional or Enterprise editions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$What is Burp Suite Professional?$q$, $q$Burp Suite Professional is PortSwigger's paid edition aimed at hands-on security professionals and penetration testers, including an automated web vulnerability scanner.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$What is Burp Suite Enterprise (DAST)?$q$, $q$It is PortSwigger's enterprise-focused edition for automated scanning at scale, aimed at AppSec and vulnerability management teams.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Who makes Burp Suite?$q$, $q$Burp Suite is made by PortSwigger.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Does PortSwigger offer security training?$q$, $q$Yes, PortSwigger offers free training through its Web Security Academy.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Manual penetration testing$q$, $q$Security professionals use Burp Suite Professional's toolkit for hands-on web application penetration testing.$q$, $q$Penetration testers and security consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Enterprise application security scanning$q$, $q$AppSec teams use Burp Suite Enterprise (DAST) to run automated scans across many applications at scale.$q$, $q$AppSec and vulnerability management teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Security learning and bug bounty hunting$q$, $q$Beginners and bug bounty hunters use the free Community Edition alongside PortSwigger's Web Security Academy to learn web security testing.$q$, $q$Students and bug bounty hunters$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Manual testing tools","Learning-focused toolkit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Professional$q$, $q$Contact for pricing$q$, NULL, $q$["Automated web vulnerability scanner","Manual testing tools","CI/CD integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$Enterprise (DAST)$q$, $q$Contact for pricing$q$, NULL, $q$["Automated scanning at scale","Attack surface visibility","CI-driven scanning"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$overview$q$, $q$What is Burp Suite?$q$, 2, ARRAY[$q$Burp Suite is a web application security testing platform from PortSwigger, providing tools for identifying, testing, and exploiting web vulnerabilities across the development lifecycle. It is offered in three editions: the free Community Edition, the paid Professional edition, and the enterprise-focused DAST edition.$q$, $q$Professional is aimed at hands-on penetration testers and includes an automated web vulnerability scanner alongside manual testing tools, while the Enterprise (DAST) edition adds automated scanning at scale and CI/CD pipeline integration for AppSec and vulnerability management teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', $q$who-its-for$q$, $q$Who Burp Suite is for$q$, 2, ARRAY[$q$Burp Suite is for penetration testers, security professionals, DevSecOps and engineering teams, bug bounty hunters, and AppSec teams, spanning from beginners using the free Community Edition to enterprises running automated scans at scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('753226c3-cede-4bbb-9fad-9d73dd9827e4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── OWASP ZAP ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OWASP ZAP (Zed Attack Proxy) is a free, open-source web application security scanner backed by Checkmarx and maintained by the ZAP Dev Team.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OWASP ZAP is a free, open-source web application security scanner with an add-on marketplace, maintained by the independent ZAP Dev Team.$q$,
  og_description = $q$OWASP ZAP is a free, open-source web application security scanner with an add-on marketplace, maintained by the independent ZAP Dev Team.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '26fa7763-662c-4590-abb7-062fe17b309e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '26fa7763-662c-4590-abb7-062fe17b309e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Automated web app scanning$q$, $q$Scans web applications for security vulnerabilities.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Add-on marketplace$q$, $q$Extensible through a marketplace of community-contributed add-ons.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Automation support$q$, $q$Provides automation options for integrating security testing into workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Beginner-friendly resources$q$, $q$Includes quick-start guides aimed at users new to security testing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Independent open-source governance$q$, $q$Operates as an independent open-source project backed by Checkmarx.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Recognized as a GitHub Top 1000 project with an active community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Extensible via a marketplace of community add-ons$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Beginner-friendly documentation and quick-start guides$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Backed by Checkmarx while remaining an independent open-source project$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Homepage documentation is general; deeper technical detail requires visiting separate docs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$As with other scanners, effectiveness depends on proper configuration and tuning$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$No official paid support tier documented on the main site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Is OWASP ZAP free?$q$, $q$Yes, ZAP is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Who maintains ZAP?$q$, $q$ZAP is maintained by the ZAP Dev Team and is backed by Checkmarx, while remaining an independent open-source project.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Can ZAP be extended with add-ons?$q$, $q$Yes, ZAP has a marketplace of community-contributed add-ons.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Is ZAP suitable for beginners?$q$, $q$Yes, ZAP provides quick-start guides and introductory resources for users new to security testing.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Can ZAP be automated?$q$, $q$Yes, ZAP supports automation options for integrating security testing into workflows.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Web application vulnerability scanning$q$, $q$Security teams use ZAP to scan web applications for common vulnerabilities.$q$, $q$Security teams and penetration testers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Learning web security testing$q$, $q$Newcomers use ZAP's quick-start guides to learn hands-on web application security testing.$q$, $q$Students and security beginners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Automated security testing in pipelines$q$, $q$Teams automate ZAP scans as part of their development and testing workflows.$q$, $q$DevOps and AppSec teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Automated web app scanning","Add-on marketplace","Automation support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$overview$q$, $q$What is OWASP ZAP?$q$, 2, ARRAY[$q$OWASP ZAP (Zed Attack Proxy) is a free, open-source web application security scanner described as one of the most widely used tools of its kind. It is extensible through a marketplace of community-contributed add-ons and offers automation options for integrating security testing into workflows.$q$, $q$ZAP is maintained by the ZAP Dev Team and is backed by Checkmarx, while operating as an independent open-source project. It provides quick-start guides and introductory resources aimed at users new to security testing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', $q$who-its-for$q$, $q$Who OWASP ZAP is for$q$, 2, ARRAY[$q$OWASP ZAP is for security practitioners at all levels, from beginners using its quick-start guides to experienced testers extending it with community add-ons for web application security testing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('26fa7763-662c-4590-abb7-062fe17b309e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Mend.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mend.io is an application security platform offering SCA, SAST, and AI risk governance for enterprise development teams.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mend.io: enterprise application security combining SCA, SAST, dependency automation, and AI model/agent risk governance.$q$,
  og_description = $q$Mend.io: enterprise application security combining SCA, SAST, dependency automation, and AI model/agent risk governance.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8c102b52-3adb-4485-b65a-2b1065f9aa19';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8c102b52-3adb-4485-b65a-2b1065f9aa19' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Software Composition Analysis (SCA)$q$, $q$Scans open source dependencies for known vulnerabilities across the codebase.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$High-accuracy SAST$q$, $q$Static application security testing for proprietary code, including AI-generated code security checks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$AI-BOM and Shadow AI discovery$q$, $q$Surfaces every component in a codebase, including packages, AI models, agents, and system prompts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Automated AI red teaming$q$, $q$Tests AI models and agents for security risks through automated adversarial testing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$System prompt hardening$q$, $q$Applies in-app runtime guardrails to reduce prompt injection and related AI risks.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Mend Renovate (automated dependency updates)$q$, $q$Automates dependency updates at scale with Merge Confidence ratings and workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$DAST and API security (add-ons)$q$, $q$Optional dynamic application security testing and API security testing available as add-ons.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Combines traditional application security (SCA/SAST) with AI model and agent security testing in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Automated dependency updates (Mend Renovate) reduce manual patching effort$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Used by large enterprises including Microsoft, Google, Vodafone, Yahoo, and Siemens$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Publishes transparent per-developer pricing with no additional per-GB fees$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Full AppSec suite pricing runs up to $1000 per developer per year, which can be costly for large teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$DAST, API Security, and EOL support are separate add-ons billed at custom pricing rather than included by default$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$No free plan or free trial is listed; access requires scheduling a demo$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$What does Mend.io do?$q$, $q$Mend.io is an application security and AI security platform that scans code and dependencies for vulnerabilities and tests AI models and agents for security risks.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Does Mend.io offer a free trial?$q$, $q$The Mend.io website does not list a free trial or free plan; it offers a 'Schedule a Demo' option instead.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$How is Mend.io priced?$q$, $q$Mend.io publishes per-developer annual pricing: up to $1000/dev/year for Mend AppSec, up to $300/dev/year for Mend AI, and up to $250/dev/year for Mend Renovate Enterprise.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$What is Mend AI?$q$, $q$Mend AI is Mend.io's product for AI-BOM and Shadow AI discovery, system prompt hardening, automated red teaming, and in-app runtime guardrails.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Who uses Mend.io?$q$, $q$Mend.io lists enterprise customers including Microsoft, Google, Vodafone, Yahoo, and Siemens.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Open source dependency security$q$, $q$Scan and automatically update open source dependencies using SCA and Mend Renovate.$q$, $q$Enterprise application security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$AI application governance$q$, $q$Discover AI models, agents, and system prompts in use, then test and harden them against security risks.$q$, $q$Teams building or deploying AI-powered applications$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Static code security testing$q$, $q$Run SAST scans on proprietary code, including checks tailored to AI-generated code.$q$, $q$Development and security engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Mend AppSec$q$, $q$Up to $1000 per developer per year$q$, $q$annual$q$, $q$["High-accuracy SAST","Reachability-driven SCA","AI-generated code security","AI-powered fix suggestions","Automated dependency updates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Mend AI$q$, $q$Up to $300 per developer per year$q$, $q$annual$q$, $q$["AI-BOM and Shadow AI discovery","System prompt hardening","Automated red teaming","In-app runtime guardrails","Continuous governance"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$Mend Renovate Enterprise$q$, $q$Up to $250 per developer per year$q$, $q$annual$q$, $q$["Automated dependency management","Full-scale automation","Merge Confidence ratings and workflows","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$overview$q$, $q$What is Mend.io?$q$, 2, ARRAY[$q$Mend.io is an application security and AI security platform that scans proprietary code and open source dependencies for vulnerabilities while also testing AI models and agents for security risks.$q$, $q$The platform includes SCA, SAST, DAST, API security testing, and automated dependency management through Mend Renovate, alongside AI-BOM discovery, system prompt hardening, and automated AI red teaming.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', $q$who-its-for$q$, $q$Who Mend.io is for$q$, 2, ARRAY[$q$Mend.io is built for enterprise application security and development teams managing complex software supply chains, including organizations that build or deploy AI models and agents. Listed customers include Microsoft, Google, Vodafone, Yahoo, and Siemens.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8c102b52-3adb-4485-b65a-2b1065f9aa19', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SonarQube ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SonarQube is an automated code review platform for code quality, security, and AI-generated code assurance across 40+ languages.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$34/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SonarQube: automated code review for quality, security, and AI CodeFix across 40+ languages, with free and paid plans.$q$,
  og_description = $q$SonarQube: automated code review for quality, security, and AI CodeFix across 40+ languages, with free and paid plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6ee2d4f-e582-42ed-987a-7a8f22539693' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Automated code review$q$, $q$Integrates with development workflows to review code automatically on every change.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Security vulnerability detection$q$, $q$Detects complex vulnerabilities and security hotspots in code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Quality metrics tracking$q$, $q$Tracks maintainability, reliability, and technical debt over time.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$AI CodeFix$q$, $q$Provides context-aware, one-click fix suggestions for bugs and security issues using LLMs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$AI Code Assurance$q$, $q$Validates AI-generated code for security and quality before merging.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Secrets detection$q$, $q$Catches exposed code secrets during development.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Compliance reporting$q$, $q$Automates proof of code compliance for standards such as OWASP, CWE, and PCI DSS (Enterprise).$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$40+ language support$q$, $q$Covers languages including Java, Python, JavaScript, TypeScript, C#, C++, PHP, Go, Rust, and Kotlin, plus IaC formats like Terraform and Kubernetes.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Free tier and free IDE extension (SonarQube for IDE) available for individual use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Used by over 7 million developers and organizations including Mercedes-Benz, Adobe, Nvidia, eBay, Santander, and NASA$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Supports 40+ programming languages and infrastructure-as-code formats$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Native integrations with GitHub, Bitbucket, GitLab, Azure DevOps, Jira, and Slack$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Named a Leader in the Gartner Magic Quadrant$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Free tier is limited to private projects up to 50,000 lines of code$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Enterprise features (SSO, SCIM, unlimited users/projects, advanced compliance) require custom Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Advanced Security add-on (CVE detection, malicious package detection, SBOM) is billed separately at custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Does SonarQube have a free plan?$q$, $q$Yes, SonarQube offers a free tier for private projects up to 50,000 lines of code, plus a free SonarQube for IDE extension.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Is there a free trial for paid plans?$q$, $q$Yes, SonarQube offers a 14-day free trial for the Team plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$How much does the Team plan cost?$q$, $q$The Team plan starts at $34 per month and is recommended for teams of fewer than 50 developers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$What does the Enterprise plan add?$q$, $q$The Enterprise plan adds advanced security reports, audit logs, SSO/SCIM, unlimited users and projects, enterprise hierarchy and portfolios, and premium support, at custom pricing.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$How many languages does SonarQube support?$q$, $q$SonarQube supports 40+ programming languages, with the Enterprise plan adding languages such as ABAP, COBOL, and Apex.$q$, 4);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Does SonarQube help with AI-generated code?$q$, $q$Yes, through AI Code Assurance, which validates AI-generated code for security and quality, and AI CodeFix, which suggests one-click remediations.$q$, 5);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Automated code quality review$q$, $q$Continuously review code for maintainability, reliability, and technical debt as part of CI/CD.$q$, $q$Software development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Security vulnerability and secrets detection$q$, $q$Detect vulnerabilities, security hotspots, and exposed secrets before code reaches production.$q$, $q$Application security and DevSecOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$AI-generated code assurance$q$, $q$Validate and remediate AI-generated code using AI Code Assurance and AI CodeFix.$q$, $q$Teams using AI coding assistants$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Compliance reporting at scale$q$, $q$Automate proof of code compliance against standards like OWASP, CWE, and PCI DSS.$q$, $q$Enterprise compliance and audit teams$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Free$q$, $q$$0$q$, NULL, $q$["Private project up to 50k lines of code","Free SonarQube for IDE extension"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Team$q$, $q$$34/month$q$, $q$monthly$q$, $q$["30+ programming languages","Code quality standards enforcement","Bug and vulnerability detection","Secrets detection","AI-driven code fixes","Pull request analysis","Commercial support","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$Enterprise$q$, $q$Custom pricing$q$, $q$annual$q$, $q$["All Team features","Advanced security reports and audit logs","OWASP, CWE, PCI DSS, MISRA C++:2023 compliance","Unlimited users and projects","40+ languages including ABAP, COBOL, Apex","SSO, SCIM, CMK/BYOK, IP allowlist","Enterprise hierarchy and portfolios","GitHub Advanced Security integration","Enterprise SLA and premium support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$overview$q$, $q$What is SonarQube?$q$, 2, ARRAY[$q$SonarQube is an automated code review platform, available as SonarQube Cloud, SonarQube Server (self-managed), and a free SonarQube for IDE extension, that analyzes code for quality, reliability, and security issues.$q$, $q$It supports 40+ programming languages and infrastructure-as-code formats, offers AI Code Assurance to validate AI-generated code, and AI CodeFix to generate one-click remediation suggestions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', $q$who-its-for$q$, $q$Who SonarQube is for$q$, 2, ARRAY[$q$SonarQube serves individual developers through its free tier and IDE extension, as well as teams and enterprises needing compliance reporting, advanced security scanning, and SSO/SCIM support. It is used by over 7 million developers and organizations including Mercedes-Benz, Adobe, Nvidia, eBay, Santander, and NASA.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6ee2d4f-e582-42ed-987a-7a8f22539693', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Checkmarx ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Checkmarx One is an AI-powered application security platform offering SAST, DAST, SCA, and cloud-native security scanning for enterprise development teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Checkmarx One: AI-powered application security testing with SAST, DAST, SCA, secrets, IaC, and API security scanning for enterprises.$q$,
  og_description = $q$Checkmarx One: AI-powered application security testing with SAST, DAST, SCA, secrets, IaC, and API security scanning for enterprises.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '72d98dd7-ff9a-4d03-9e76-84a11ee4dcec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$NG SAST$q$, $q$Static application security testing that analyzes source code to find vulnerabilities during development.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$DAST$q$, $q$Dynamic application security testing that assesses running applications for exploitable vulnerabilities.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$SCA (Software Composition Analysis)$q$, $q$Scans open-source dependencies for known vulnerabilities and license risks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Container Security$q$, $q$Scans container images and configurations for security issues before deployment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Secrets Detection$q$, $q$Identifies hardcoded secrets and credentials in source code repositories.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$IaC Security$q$, $q$Scans infrastructure-as-code templates for misconfigurations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$API Security$q$, $q$Discovers and tests APIs for vulnerabilities across the software supply chain.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$AI-powered agents$q$, $q$Includes Developer Assist and Triage & Remediation Assist agents, plus a Checkmarx MCP Server, to help developers fix findings faster.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Broad scanning coverage spanning SAST, DAST, SCA, container, secrets, IaC, and API security in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$AI-powered remediation and triage agents aim to reduce manual fix time$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Recognized as a Leader in the 2026 Gartner Magic Quadrant for Software Supply Chain Security$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Holds SOC 2 Type II, ISO 27001 certification, and FedRAMP authorization$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Reports over 1,800 enterprise customers and 40%+ of the Fortune 500 as users$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Pricing is fully custom and not published; requires a sales conversation to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$No free trial is advertised on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Modular add-on structure (engines, AI agents, governance) can make total cost hard to estimate upfront$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$How is Checkmarx One priced?$q$, $q$Pricing is quote-based, calculated on developers, apps, and usage; a sales representative builds a custom proposal, typically provided within one business day.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Does Checkmarx offer a free trial?$q$, $q$The website does not advertise a free trial; pricing and access are handled through a custom sales quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$What scanning capabilities does Checkmarx One include?$q$, $q$The platform includes NG SAST, DAST, SCA, container security, secrets detection, IaC security, API security, repository health, and malicious package protection, offered as modular components.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Does Checkmarx use AI?$q$, $q$Yes, Checkmarx One includes AI-powered agents such as Developer Assist and Triage & Remediation Assist, plus a Checkmarx MCP Server.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Is Checkmarx suitable for large enterprises?$q$, $q$Checkmarx states it is used by over 1,800 enterprises and by more than 40% of the Fortune 500.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Secure the software development lifecycle$q$, $q$Teams scan source code, dependencies, containers, and infrastructure-as-code for vulnerabilities throughout development.$q$, $q$Application security and DevSecOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Reduce remediation time with AI agents$q$, $q$Developer Assist and Triage & Remediation Assist agents help developers triage and fix flagged vulnerabilities faster.$q$, $q$Software developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$Manage application security posture at scale$q$, $q$ASPM and AI-BOM capabilities give governance teams visibility into risk across many applications and AI components.$q$, $q$Security leaders and governance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$overview$q$, $q$What is Checkmarx?$q$, 2, ARRAY[$q$Checkmarx One is an AI-powered application security testing platform that combines static analysis (SAST), dynamic analysis (DAST), software composition analysis (SCA), container security, secrets detection, infrastructure-as-code security, and API security in a single platform.$q$, $q$The platform adds AI-powered agents, including Developer Assist and Triage & Remediation Assist, along with a Checkmarx MCP Server, to help teams triage and remediate findings. Checkmarx reports scanning over 800 billion lines of code monthly and serving over 1,800 enterprise customers, including more than 40% of the Fortune 500.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', $q$who-its-for$q$, $q$Who Checkmarx is for$q$, 2, ARRAY[$q$Checkmarx is built for enterprise application security and DevSecOps teams that need broad, unified vulnerability scanning across code, dependencies, containers, and cloud infrastructure, along with governance features like ASPM and AI-BOM for tracking AI usage in software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72d98dd7-ff9a-4d03-9e76-84a11ee4dcec', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Veracode ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Veracode is an application security platform offering SAST, DAST, SCA, container security, and AI-assisted flaw remediation for enterprises.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Veracode application security platform: SAST, DAST, SCA, container security, and AI-powered remediation for enterprise software teams.$q$,
  og_description = $q$Veracode application security platform: SAST, DAST, SCA, container security, and AI-powered remediation for enterprise software teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '96409439-bd37-456a-bd67-52a51e831b1e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '96409439-bd37-456a-bd67-52a51e831b1e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$SAST$q$, $q$Finds and helps fix security flaws as code is written.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$DAST$q$, $q$Finds and helps fix runtime vulnerabilities in running web applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$SCA (Software Composition Analysis)$q$, $q$Identifies vulnerabilities in open-source code dependencies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Container Security$q$, $q$Secures container technologies before they reach production.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Fix (AI remediation)$q$, $q$Uses AI to automate remediation of flagged vulnerabilities and save developer time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Package Firewall$q$, $q$Proactively secures development pipelines against risky packages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Risk Manager (ASPM)$q$, $q$Provides unified visibility and remediation tracking of application risk across the organization.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Penetration Testing as a Service (PTaaS)$q$, $q$Offers penetration testing alongside Security Labs and eLearning modules for developer training.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Combines SAST, DAST, SCA, container security, and PTaaS in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$AI-powered Fix feature aims to automate vulnerability remediation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Reports a low 1.1% false-positive rate$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$States it has scanned over 1.5M applications and 471T+ lines of code, with 148M+ flaws fixed$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Used by enterprises including Sitecore, Unisys, BMW, and Garmin, per the site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$No public pricing is disclosed; must contact sales or request a demo for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$No free trial information is provided on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Specific integrations and supported languages are not enumerated on the main pages reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$How much does Veracode cost?$q$, $q$Veracode does not publish pricing; interested organizations must contact sales or request a demo for a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Does Veracode offer a free trial?$q$, $q$No free trial availability is stated on the Veracode website.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$What testing types does Veracode support?$q$, $q$Veracode offers SAST, DAST, SCA, container security, penetration testing (PTaaS), and AI-powered remediation via its Fix feature.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Does Veracode use AI?$q$, $q$Yes, Veracode's Fix feature uses AI to automate remediation of security flaws to save developer time.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$What is Veracode's reported false-positive rate?$q$, $q$Veracode states a 1.1% false-positive rate on its website.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Find and fix flaws throughout the SDLC$q$, $q$Teams use SAST and DAST to catch vulnerabilities during coding and at runtime.$q$, $q$Application security and development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Secure open-source and container dependencies$q$, $q$SCA and Container Security scan third-party code and container images for known vulnerabilities.$q$, $q$DevSecOps teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Accelerate remediation with AI$q$, $q$The Fix feature uses AI to automate fixing flagged vulnerabilities, reducing manual developer effort.$q$, $q$Software developers$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$Track application risk across the organization$q$, $q$Risk Manager provides ASPM-style unified visibility into application security posture.$q$, $q$Security leaders$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$overview$q$, $q$What is Veracode?$q$, 2, ARRAY[$q$Veracode is an application security platform providing SAST, DAST, SCA, container security, and penetration testing (PTaaS), along with an AI-powered Fix feature for automating vulnerability remediation.$q$, $q$Veracode reports a 1.1% false-positive rate, having scanned over 1.5 million applications and 471 trillion lines of code, and having helped fix over 148 million software flaws. Its customers include enterprises such as Sitecore, Unisys, BMW, and Garmin.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', $q$who-its-for$q$, $q$Who Veracode is for$q$, 2, ARRAY[$q$Veracode is built for enterprise security and development teams that need to find and fix vulnerabilities across custom code, open-source dependencies, and containers, with AI-assisted remediation and centralized risk visibility.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96409439-bd37-456a-bd67-52a51e831b1e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Gitleaks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gitleaks is a free, open-source CLI tool that scans git repos, files, and directories for hardcoded secrets like API keys and passwords.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gitleaks: free open-source (MIT) CLI tool to detect secrets like API keys and passwords in git history, files, and CI/CD pipelines.$q$,
  og_description = $q$Gitleaks: free open-source (MIT) CLI tool to detect secrets like API keys and passwords in git history, files, and CI/CD pipelines.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0db8e4b7-3129-43e3-bd36-cff6d52f51bc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0db8e4b7-3129-43e3-bd36-cff6d52f51bc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Regex-based secret detection$q$, $q$Detects secrets such as passwords, API keys, and tokens using configurable regex rules.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Git history scanning$q$, $q$Scans full git history using `git log -p` to find secrets committed in the past.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Directory and stdin scanning$q$, $q$Can scan directories/files directly or process streamed data via stdin.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Pre-commit hook integration$q$, $q$Runs as a pre-commit hook to catch secrets before they are committed.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$GitHub Actions support$q$, $q$Integrates with CI pipelines via the companion gitleaks-action.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Multiple report formats$q$, $q$Outputs findings as JSON, CSV, JUnit, SARIF, or custom templates for CI/CD tooling.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Baseline comparisons$q$, $q$Supports baseline files so only new findings are reported on incremental scans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Configurable allowlists$q$, $q$TOML-based configuration supports global and rule-specific allowlists, plus a `.gitleaksignore` file.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Widely adopted, with 28.2k stars on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Multiple scan modes (git, directory, stdin) cover different workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$CI/CD-friendly report formats including SARIF and JUnit$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Pre-commit and GitHub Actions integrations available out of the box$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Project is described by its maintainers as 'feature complete,' with future releases limited to security patches$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$CLI-only — no built-in GUI or hosted dashboard$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$No official commercial support or SLA offering tied to the open-source project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Is Gitleaks free to use?$q$, $q$Yes. Gitleaks is open source under the MIT license with no paid tiers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$What can Gitleaks scan?$q$, $q$It can scan git repository history, local directories/files, and data piped in via stdin.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Does Gitleaks integrate with CI/CD pipelines?$q$, $q$Yes, via a pre-commit hook, the gitleaks-action for GitHub Actions, and report formats like SARIF and JUnit.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Is Gitleaks still actively developed?$q$, $q$The project's maintainers describe it as feature complete, with future releases limited to security patches.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Can detection rules be customized?$q$, $q$Yes, rules are configured via TOML files and support global or rule-specific allowlists.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Blocking secrets before they're committed$q$, $q$Run Gitleaks as a pre-commit hook to catch API keys and passwords before code is committed.$q$, $q$Individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$CI pipeline secret scanning$q$, $q$Add Gitleaks to a GitHub Actions workflow to scan pull requests and generate SARIF/JUnit reports.$q$, $q$DevOps and security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Auditing existing repository history$q$, $q$Run Gitleaks in git mode against `git log -p` to find secrets already committed in the past.$q$, $q$Security teams performing repo audits$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$Open Source (CLI)$q$, $q$Free$q$, NULL, $q$["MIT licensed","Git, directory, and stdin scanning","Pre-commit and GitHub Actions integration","JSON/CSV/JUnit/SARIF reporting"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$overview$q$, $q$What is Gitleaks?$q$, 2, ARRAY[$q$Gitleaks is an open-source, MIT-licensed command-line tool that detects secrets such as passwords, API keys, and tokens in git repositories, directories, files, and stdin input.$q$, $q$It is distributed via Homebrew, Docker (DockerHub and ghcr.io), direct binary downloads, or built from source, and its detection rules are configured through TOML files with support for allowlists and a `.gitleaksignore` file.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', $q$who-its-for$q$, $q$Who Gitleaks is for$q$, 2, ARRAY[$q$Gitleaks is used by developers and DevOps/security teams who need a free, scriptable way to catch hardcoded secrets in git history and codebases, whether locally via pre-commit hooks or in CI/CD pipelines via GitHub Actions.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0db8e4b7-3129-43e3-bd36-cff6d52f51bc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── TruffleHog ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$TruffleHog is a secret-scanning tool from Truffle Security Co. that finds and verifies exposed credentials across git repos, Docker images, and cloud storage.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TruffleHog scans code, Docker images, and cloud storage for secrets and verifies them live with 800+ detectors. Free open-source core plus Enterprise tier.$q$,
  og_description = $q$TruffleHog scans code, Docker images, and cloud storage for secrets and verifies them live with 800+ detectors. Free open-source core plus Enterprise tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c90a97bd-ed6e-4be5-a516-b67be914e3cd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Deep repository scanning$q$, $q$Scans git version history, Docker images, and comments to find exposed secrets, not just the latest commit.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Live credential verification$q$, $q$Programmatically verifies discovered secrets against the relevant service/API to eliminate false positives.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$800+ secret detectors$q$, $q$Ships with detectors for 800+ secret types out of the box.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Multi-branch scanning$q$, $q$Analyzes all branches in a repository, not just the primary branch.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Pre-commit and pre-receive hooks$q$, $q$Blocks secrets from being committed or pushed in the first place.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$TruffleHog Analyze$q$, $q$Automatically identifies the resources and permissions tied to a found API key or secret.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Custom regex support$q$, $q$Supports custom regex rules in addition to built-in detectors.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Remediation tracking$q$, $q$Tracks the status of found keys and sends alert reminders with rotation guidance.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Free, open-source core with 800+ built-in secret detectors$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Verifies secrets live against real services/APIs to cut down false positives$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Scans across full git history, multiple branches, and Docker images, not just the latest commit$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Pre-commit and pre-receive hook support to prevent leaks before they happen$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Enterprise tier adds SSO, RBAC, a management dashboard, and 20+ integrations for larger teams$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Enterprise pricing is not publicly listed and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Dashboard, continuous monitoring, SSO/RBAC, and most integrations are Enterprise-only, not in the open-source version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Add-ons like TruffleHog Analyze and Forager are sold separately from the core scanner$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Is TruffleHog free to use?$q$, $q$The open-source core is free, offering GitHub, S3, directory, GCS, and Docker scanning with 800+ detectors.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$What does TruffleHog scan?$q$, $q$It scans GitHub, S3, local directories, GCS, and Docker images/history for exposed secrets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Does TruffleHog verify the secrets it finds?$q$, $q$Yes, it uses programmatic verification against the relevant service or API to confirm a secret is live, reducing false positives.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$What does the Enterprise tier add?$q$, $q$Enterprise adds 20+ integrations (GitHub, Confluence, JIRA, Slack, etc.), on-premises/cloud deployment choice, continuous monitoring, a management dashboard, SSO, RBAC, and priority support.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Who makes TruffleHog?$q$, $q$TruffleHog is made by Truffle Security Co., founded in 2021.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Pre-deployment secret scanning$q$, $q$Scan git repositories and Docker images for exposed credentials before code ships.$q$, $q$Developers and security teams using the open-source scanner$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Preventing leaks at commit time$q$, $q$Use pre-commit and pre-receive hooks to stop secrets from ever being committed or pushed.$q$, $q$Individual developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Enterprise-wide secret governance$q$, $q$Continuously monitor secrets across an organization with SSO, RBAC, and a centralized dashboard.$q$, $q$Security and compliance teams on the Enterprise tier$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Open Source$q$, $q$Free$q$, NULL, $q$["GitHub, S3, directory, GCS, and Docker scanning","800+ secret detectors","GitHub Actions, pre-commit, and pre-receive hooks","Custom regex and secrets verification","Automatic updates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["All open-source capabilities","20+ integrations (GitHub, Confluence, JIRA, Slack, etc.)","On-premises and cloud deployment options","Continuous monitoring","Dashboard for secrets management","Alerting with analytics and reporting","Single sign-on (SAML 2.0 or OAuth 2.0)","Role-based access control","Deployment and onboarding support","Priority technical support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$overview$q$, $q$What is TruffleHog?$q$, 2, ARRAY[$q$TruffleHog is a secret-scanning tool made by Truffle Security Co., founded in 2021, that digs into code repositories, Docker images, and cloud storage to find exposed passwords, API keys, and other sensitive credentials.$q$, $q$Its open-source core includes 800+ secret detectors and live credential verification, while a separate Enterprise tier adds integrations, SSO/RBAC, continuous monitoring, and a management dashboard.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', $q$who-its-for$q$, $q$Who TruffleHog is for$q$, 2, ARRAY[$q$Developers and security teams use the free open-source scanner to catch leaked secrets in repos, branches, and Docker images, while organizations needing centralized governance, SSO, and monitoring can upgrade to the Enterprise tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90a97bd-ed6e-4be5-a516-b67be914e3cd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Akeyless ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Akeyless is a SaaS platform for secrets management, machine identity security, PKI, and multi-cloud key management.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Akeyless offers secrets management, PAM, certificate lifecycle, and multi-cloud KMS with a free plan and custom Enterprise pricing.$q$,
  og_description = $q$Akeyless offers secrets management, PAM, certificate lifecycle, and multi-cloud KMS with a free plan and custom Enterprise pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '06c710e0-366f-4471-a4c3-9ebfc7dfbc6a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Secrets Management$q$, $q$Centrally stores and dynamically delivers static, dynamic, and rotated secrets to applications and pipelines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Distributed Fragments Cryptography$q$, $q$Patented encryption technology that fragments cryptographic keys across regions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$SecretlessAI$q$, $q$Keeps secrets out of AI agent context while validating agent actions at runtime via Agentic Runtime Authority.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Certificate Lifecycle Management$q$, $q$Issues, rotates, and manages SSH and PKI certificates, with CA integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Multi-cloud Key Management (KMS)$q$, $q$Manages and performs encryption operations using keys across multiple cloud providers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Universal Secrets Connector$q$, $q$Provides centralized governance across multiple third-party vaults.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Privileged Access Management$q$, $q$Zero-trust, just-in-time access controls for privileged sessions.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Offers a Free plan covering multiple product modules, not just a single feature.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Combines secrets management, PAM, PKI, and KMS in one platform.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Holds compliance certifications including ISO 27001, PCI-DSS, FIPS 140-3, GDPR, and DORA.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Provides SDKs and integrations for CI/CD, Kubernetes, and identity providers.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Free plan quotas are restrictive (e.g., up to 5 clients, 500 static secrets, 3-day audit log retention).$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Enterprise plan pricing is not published and requires contacting sales for a custom quote.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Encryption/KMS free tier is capped at 1,000 transactions per day.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Does Akeyless offer a free plan?$q$, $q$Yes, Akeyless has a Free plan with limited quotas across modules, such as up to 5 clients, 500 static secrets, and 3-day audit log retention.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$What is SecretlessAI?$q$, $q$SecretlessAI is Akeyless's approach to keeping secrets out of AI agents' context while still validating and authorizing their actions at runtime.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Is Akeyless Enterprise pricing public?$q$, $q$No, the Enterprise plan offers customizable quotas and pricing that requires contacting Akeyless directly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$What compliance certifications does Akeyless hold?$q$, $q$Akeyless states it holds ISO 27001, GDPR, PCI-DSS, AICPA, CSA STAR Level One, FIPS 140-3, and DORA compliance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Secrets management for DevOps pipelines$q$, $q$Centrally store and dynamically deliver static, dynamic, and rotated secrets to applications and CI/CD tooling.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Securing AI agent access$q$, $q$Use SecretlessAI and Agentic Runtime Authority to keep credentials out of AI agents while validating their actions.$q$, $q$Teams deploying AI agents$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Certificate lifecycle automation$q$, $q$Automatically issue, rotate, and manage SSH and PKI certificates with CA integration.$q$, $q$Security and infrastructure teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 5 clients","500 static secrets","5 dynamic secrets","5 rotated secrets","3 targets","3-day audit log retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Customizable quotas","Supports advanced organizational requirements"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$overview$q$, $q$What is Akeyless?$q$, 2, ARRAY[$q$Akeyless is a SaaS platform for secrets management, machine identity security, certificate lifecycle management, and multi-cloud key management (KMS).$q$, $q$It uses patented Distributed Fragments Cryptography and offers a Free plan alongside a customizable Enterprise plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', $q$who-its-for$q$, $q$Who Akeyless is for$q$, 2, ARRAY[$q$Akeyless is built for DevOps, security, and platform engineering teams that need to manage secrets, certificates, encryption keys, and privileged access across multi-cloud environments, including organizations securing AI agent workflows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('06c710e0-366f-4471-a4c3-9ebfc7dfbc6a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── HashiCorp Vault ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HashiCorp Vault secures, stores, and tightly controls access to tokens, passwords, certificates, and encryption keys.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HashiCorp Vault manages secrets, certificates, and encryption keys with a free open-source Community edition and paid Enterprise/HCP options.$q$,
  og_description = $q$HashiCorp Vault manages secrets, certificates, and encryption keys with a free open-source Community edition and paid Enterprise/HCP options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bf2641e-776f-49ba-814c-30d9468c54c8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bf2641e-776f-49ba-814c-30d9468c54c8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Key/Value Secrets Engine$q$, $q$Stores and versions static secrets accessible via UI, CLI, or HTTP API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Database Secrets Engine$q$, $q$Dynamically generates short-lived database credentials on demand.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Transit Secrets Engine$q$, $q$Provides encryption as a service for data in transit without storing the data itself.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Transform Secrets Engine$q$, $q$An Enterprise-only engine that supports tokenization of sensitive data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Identity-based access control$q$, $q$Policy-driven authentication and authorization for humans, machines, and AI agents.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Certificate management$q$, $q$Generates, rotates, and revokes certificates on demand.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Vault Community edition is free and open source.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Covers multiple secrets engines (Key/Value, Database, Transit) for varied use cases.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$HCP Vault Dedicated offers a cloud-hosted, managed option with a free trial.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Backed by official certification programs (Vault Associate, Vault Operations Professional).$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Enterprise-only features, such as the Transform Secrets Engine, require a paid license.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Public pricing for Vault Enterprise and HCP Vault is not listed on the product or pricing pages.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Company founding year and headquarters are not published on the pages reviewed.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Is HashiCorp Vault free?$q$, $q$Yes, Vault Community edition is free and open source; Vault Enterprise requires a valid paid license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$What does Vault do?$q$, $q$Vault secures, stores, and tightly controls access to tokens, passwords, certificates, and encryption keys via a UI, CLI, or HTTP API.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Does HCP Vault offer a free trial?$q$, $q$Yes, HCP Vault Dedicated is referenced as offering a free trial option.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$What is the Transit Secrets Engine?$q$, $q$It provides encryption as a service, letting Vault encrypt and decrypt data in transit without Vault storing the underlying data.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Centralized secrets management$q$, $q$Store and programmatically access tokens, passwords, and API keys from a single platform.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Dynamic database credentials$q$, $q$Generate short-lived, on-demand database credentials using the Database Secrets Engine.$q$, $q$Backend engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Encryption as a service$q$, $q$Use the Transit Secrets Engine to encrypt and decrypt application data without directly managing keys.$q$, $q$Application developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Community$q$, $q$$0$q$, NULL, $q$["Open-source secrets management","Key/Value, Database, and Transit secrets engines"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Transform Secrets Engine","Requires a valid license"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$overview$q$, $q$What is HashiCorp Vault?$q$, 2, ARRAY[$q$HashiCorp Vault is a secrets management platform that secures, stores, and tightly controls access to tokens, passwords, certificates, and encryption keys via a UI, CLI, or HTTP API.$q$, $q$It is available as a free, open-source Community edition, with a paid Enterprise edition and HCP Vault cloud-hosted options for additional features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', $q$who-its-for$q$, $q$Who HashiCorp Vault is for$q$, 2, ARRAY[$q$Vault is built for DevOps, security, and platform teams that need identity-based secrets management, dynamic database credentials, and encryption as a service across humans, machines, and AI agents.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bf2641e-776f-49ba-814c-30d9468c54c8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── 1Password Secrets Automation ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A 1Password developer feature for automating secrets access in apps and cloud infrastructure via Service Accounts or self-hosted Connect servers.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$1Password Secrets Automation: automate secrets access for apps and infrastructure using Service Accounts or self-hosted Connect servers.$q$,
  og_description = $q$1Password Secrets Automation: automate secrets access for apps and infrastructure using Service Accounts or self-hosted Connect servers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae78ea6a-31f8-4642-9dd7-797047244d47' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Service Accounts$q$, $q$An authentication method for the 1Password CLI that isn't tied to an individual user, letting teams automate secrets management without deploying additional infrastructure.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Connect servers$q$, $q$A self-hosted alternative that caches data in your own infrastructure, giving more control, scalability, and reduced dependency on the 1Password API, plus REST API access not available with Service Accounts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$1Password CLI integration$q$, $q$Both Service Accounts and Connect servers work through the 1Password CLI for scripting and automation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$CI/CD pipeline integrations$q$, $q$Pre-built integrations sync secrets into pipelines such as GitHub Actions, CircleCI, and Jenkins, with the ability to build custom integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Kubernetes integration$q$, $q$Documented support for syncing secrets into Kubernetes environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Secret references$q$, $q$Developers can reference secrets stored in 1Password instead of hardcoding credentials in application code.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$IDE extensions$q$, $q$Extensions help developers work with APIs and databases while detecting exposed secrets before they're committed to a repository.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Included with a 1Password subscription rather than sold as a separate line item$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Service Accounts require no additional infrastructure to deploy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Connect servers give teams control over caching and reduce reliance on 1Password's API availability$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Pre-built CI/CD integrations for common tools like GitHub Actions, CircleCI, and Jenkins$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$CLI-based workflow supports automating tasks such as credential rotation$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Service Accounts use a rate-limited access model$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Connect servers must be self-hosted by the customer, adding operational overhead$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$REST API access is only available through Connect, not Service Accounts$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$No dedicated public pricing page separate from general 1Password subscription plans$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$What is 1Password Secrets Automation?$q$, $q$It is a set of tools for securely accessing 1Password items and vaults from a company's applications and cloud infrastructure, using either Service Accounts or Connect servers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$What is the difference between Service Accounts and Connect servers?$q$, $q$Service Accounts are a low-overhead, rate-limited authentication method for the 1Password CLI with no infrastructure to deploy, while Connect servers are self-hosted, cache data locally, and expose a REST API.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Does Secrets Automation cost extra?$q$, $q$According to 1Password's documentation, it is included with a 1Password subscription rather than billed separately.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Which CI/CD tools integrate with Secrets Automation?$q$, $q$1Password documents pre-built integrations for GitHub Actions, CircleCI, and Jenkins, along with support for building custom integrations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$CI/CD secret syncing$q$, $q$Automatically sync secrets into CI/CD pipelines instead of storing them as plaintext pipeline variables.$q$, $q$DevOps and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Infrastructure secret orchestration$q$, $q$Load secrets into server applications and cloud infrastructure using Connect servers or Service Accounts.$q$, $q$Backend and infrastructure engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Preventing hardcoded credentials$q$, $q$Replace hardcoded credentials in source code with secret references resolved via the CLI or SDKs.$q$, $q$Application developers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$overview$q$, $q$What is 1Password Secrets Automation?$q$, 2, ARRAY[$q$1Password Secrets Automation is a developer-focused capability within 1Password for securely accessing items and vaults from a company's applications and cloud infrastructure.$q$, $q$It offers two approaches: Service Accounts, a low-overhead authentication method for the 1Password CLI that requires no additional infrastructure, and Connect servers, a self-hosted option that caches data locally and exposes a REST API for more control and scalability.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$who-its-for$q$, $q$Who 1Password Secrets Automation is for$q$, 2, ARRAY[$q$It is aimed at developers and infrastructure teams who need to automate secrets access in CI/CD pipelines, Kubernetes, and cloud infrastructure without hardcoding credentials, and who are already using 1Password for credential management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Passbolt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open source credential and password manager for teams, offered as a free self-hosted Community Edition or paid Pro/Enterprise plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€4.50/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Luxembourg$q$,
  languages = '{}',
  seo_meta_description = $q$Passbolt: open source password and credential manager for teams, with a free Community Edition and paid Pro/Enterprise plans.$q$,
  og_description = $q$Passbolt: open source password and credential manager for teams, with a free Community Edition and paid Pro/Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8a88a88b-6d60-45fe-acbd-4156c50580ba';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8a88a88b-6d60-45fe-acbd-4156c50580ba' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$End-to-end encryption$q$, $q$Uses public-private key architecture to encrypt stored credentials end-to-end.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Granular credential sharing$q$, $q$Fine-grained permissions for sharing passwords and credentials, with folders and user/group management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Just-In-Time access$q$, $q$Supports Just-In-Time (JIT) access and principle-of-least-privilege enforcement for credential access.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Activity monitoring and audit trails$q$, $q$Real-time activity monitoring and logging (activity logging available on Pro/Enterprise editions).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Multifactor authentication$q$, $q$MFA enabled by default, along with brute-force and phishing protection.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Browser extensions and apps$q$, $q$Available as browser extensions, desktop applications, native mobile apps, and a web interface.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$API, CLI, and SDK access$q$, $q$API-centric architecture with CLI and SDK support for automated secret retrieval, rotation, and CI/CD integration.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$LDAP and SSO (Pro/Enterprise)$q$, $q$Pro and Enterprise editions add LDAP provisioning and SSO via Microsoft, Google, or OpenID.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$100% open source under the AGPLv3 license with a free, unlimited-user Community Edition$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Self-hosted deployment option, including support for air-gapped environments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$SOC 2 Type II certified and GDPR compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Used by over 50,000 organizations, including government agencies and enterprises$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Cloud hosting option available, based in Europe$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Pro Edition requires a minimum of 10 users and is limited to a single self-hosted instance$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Enterprise pricing is custom and requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$SSO and LDAP provisioning are not included in the free Community Edition$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Losing an active subscription removes access to updates and support$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Is Passbolt free to use?$q$, $q$Yes, the Community Edition is free with unlimited users under the AGPLv3 open source license, though it has community-level support only.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$What does the Pro Edition cost?$q$, $q$The Pro Edition costs €4.50 per user/month when billed annually, with a minimum of 10 users and volume discounts after 100 users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Can Passbolt be self-hosted?$q$, $q$Yes, Community and Pro editions support self-hosted, on-premises deployment, including air-gapped environments; a separate cloud-hosted option is also available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Does Passbolt offer a free trial?$q$, $q$Yes, a free trial is available for the Pro Edition according to Passbolt's pricing page.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Is Passbolt compliant with security standards?$q$, $q$Passbolt states it is SOC 2 Type II certified, GDPR compliant, and a FIDO Alliance member, with regular third-party security audits.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Team password management$q$, $q$Centralized, encrypted storage and sharing of team passwords with granular permissions and group management.$q$, $q$IT and security-conscious teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Self-hosted/air-gapped credential storage$q$, $q$Organizations with strict data residency or compliance needs can self-host Passbolt, including in air-gapped environments.$q$, $q$Government agencies, defense organizations, and regulated enterprises$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Automated secret retrieval in CI/CD$q$, $q$Use the API, CLI, and SDKs to retrieve and rotate secrets programmatically within CI/CD pipelines.$q$, $q$DevOps engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Unlimited users","Password management and sharing","Folders","User/group management","2FA","Browser extensions","API access","Role-based access control","Password expiry","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Pro Edition$q$, $q$€4.50/user/month$q$, $q$annual$q$, $q$["All Community features","Tags","LDAP provisioning","SSO (Microsoft/Google/OpenID)","Account recovery","Activity logging","VM appliance","Next business day support","Minimum 10 users, single self-hosted instance"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$Enterprise Edition$q$, $q$Custom$q$, NULL, $q$["All Pro features","High availability consulting","Disaster recovery planning","White glove migration","Custom development","4-hour SLA phone/email support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$overview$q$, $q$What is Passbolt?$q$, 2, ARRAY[$q$Passbolt is an open source credential platform built for security-conscious IT teams that is also simple enough for company-wide adoption, using end-to-end encryption based on public-private key architecture.$q$, $q$It is offered as a free, unlimited-user Community Edition, alongside paid Pro and Enterprise editions with additional features like SSO, LDAP provisioning, and dedicated support. It can be self-hosted, including in air-gapped environments, or used via a Europe-based cloud-hosted option.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', $q$who-its-for$q$, $q$Who Passbolt is for$q$, 2, ARRAY[$q$Passbolt is used by IT teams, government agencies, defense organizations, universities, and enterprises that need granular, auditable credential sharing, with over 50,000 organizations reported as users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8a88a88b-6d60-45fe-acbd-4156c50580ba', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Psono ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source password manager for teams with client-side encryption, free for up to 10 users.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Vorra, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Psono is an open-source, self-hosted password manager with client-side encryption, free for teams of up to 10 users.$q$,
  og_description = $q$Psono is an open-source, self-hosted password manager with client-side encryption, free for teams of up to 10 users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '86d1b99d-d37d-41bd-92c8-594e4d8c5d07' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Client-side encryption$q$, $q$Credentials are encrypted client-side before transport and storage, using multiple layers of encryption.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Self-hosted deployment$q$, $q$Deploy Psono on your own servers for full control over where credential data is stored.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$SaaS option$q$, $q$Psono is also available as a hosted SaaS edition for teams that don't want to manage their own infrastructure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Open-source codebase$q$, $q$The source code is publicly available, which the company says allows for independent security audits.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Encrypted credential sharing$q$, $q$Teams can securely share passwords and credentials with other members through encrypted sharing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Cross-platform apps$q$, $q$Apps are available for macOS, Windows, and Linux, plus mobile apps for iOS and Android, and browser extensions for Chrome, Firefox, and Edge.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Open-source code allows for independent security audits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Free plan includes all business features for up to 10 users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Self-hosted option gives full control over data residency$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Available across desktop, mobile, and browser platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Rated 4.7/5 on G2 and 4.5/5 on the Chrome Web Store$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Pricing for teams larger than 10 users is not published and requires contacting the company$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Self-hosting requires server management expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$No published details on enterprise SLA pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Is Psono free to use?$q$, $q$Yes. Psono offers all business features free for up to 10 users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Can Psono be self-hosted?$q$, $q$Yes. Psono can be deployed on-premise on your own servers, or used as a hosted SaaS edition.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Is Psono open source?$q$, $q$Yes. Psono's source code is publicly available, which the company says allows for independent security audits.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$What platforms does Psono support?$q$, $q$Psono has apps for macOS, Windows, and Linux, mobile apps for iOS and Android, and extensions for Chrome, Firefox, and Edge.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Team credential sharing$q$, $q$Teams can store and securely share business credentials with encrypted sharing between members.$q$, $q$Small to mid-size business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Self-hosted password management$q$, $q$Organizations that need to keep credential data on their own infrastructure can self-host Psono on-premise.$q$, $q$IT and security teams with compliance requirements$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 10 users","All business features included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$Business/Enterprise$q$, $q$Custom$q$, NULL, $q$["On-premise or SaaS deployment","Professional support and SLAs available on request"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$overview$q$, $q$What is Psono?$q$, 2, ARRAY[$q$Psono is an open-source password manager built for businesses and teams, encrypting credentials client-side before they are transmitted or stored.$q$, $q$It can be deployed on a company's own servers as a self-hosted, on-premise solution, or used as a hosted SaaS edition, giving organizations flexibility over where their data lives.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', $q$who-its-for$q$, $q$Who Psono is for$q$, 2, ARRAY[$q$Psono is aimed at teams and businesses that want a shared, encrypted vault for company credentials, with the option to self-host for full data control. Its free tier covers teams of up to 10 users with all business features included.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('86d1b99d-d37d-41bd-92c8-594e4d8c5d07', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Padloc ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, end-to-end encrypted password manager with notes, file storage, and a built-in authenticator.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$3.49/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Ansbach, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Padloc is an open-source, end-to-end encrypted password manager with a free plan and paid tiers from $3.49/month.$q$,
  og_description = $q$Padloc is an open-source, end-to-end encrypted password manager with a free plan and paid tiers from $3.49/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e2954a02-620d-4992-b4df-7f9f14891142';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e2954a02-620d-4992-b4df-7f9f14891142' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Unlimited vault items and devices$q$, $q$All tiers, including the free plan, allow unlimited vault items and unlimited connected devices.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Built-in authenticator$q$, $q$Padloc includes a built-in authenticator for generating one-time passwords, alongside password storage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Encrypted file storage$q$, $q$Store documents and files in the encrypted vault, with storage limits varying by plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Shared vaults$q$, $q$Family, Team, and Business plans support shared vaults for collaborative access to credentials.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Security reporting$q$, $q$Padloc includes security reporting capabilities to help flag weak or reused passwords.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Markdown notes$q$, $q$Store rich-text notes with markdown support alongside passwords and other vault items.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Audited by three different, independent groups of security experts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Open-source codebase with publicly available source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Free plan available, plus a 30-day free trial on paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Unlimited vault items and devices across all tiers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Works across Windows, macOS, iOS, Android, and major browsers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Individual plans (Premium, Team) are priced separately from Family and Business plans, which can be confusing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Enterprise pricing is custom quote-only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$File storage limits vary by tier and are not detailed in a single comparison$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Is there a free version of Padloc?$q$, $q$Yes, Padloc offers a free plan at $0/month with basic features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Does Padloc offer a free trial?$q$, $q$Yes, all paid plans include a 30-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Has Padloc been security audited?$q$, $q$Yes, Padloc states it has been audited by three different, independent groups of security experts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$What platforms does Padloc support?$q$, $q$Windows, macOS, iOS, Android, and major browsers via Chrome and Firefox extensions.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Personal password management$q$, $q$Individuals can use the Premium plan for unlimited encrypted password and file storage.$q$, $q$Individual users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Family password sharing$q$, $q$The Family plan lets households share vaults for passwords and sensitive documents.$q$, $q$Families and households$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Team credential management$q$, $q$Team and Business plans provide shared vaults for small businesses to manage company credentials.$q$, $q$Small business teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Basic password management features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Premium$q$, $q$$3.49/month$q$, $q$monthly$q$, $q$["Unlimited vault items and devices","Encrypted file storage"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Premium (annual)$q$, $q$$34.90/year$q$, $q$annual$q$, $q$["Same as monthly Premium plan"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Family$q$, $q$$5.95/month$q$, $q$monthly$q$, $q$["Shared vaults for households"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Family (annual)$q$, $q$$59.50/year$q$, $q$annual$q$, $q$["Same as monthly Family plan"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Team$q$, $q$$3.49/month$q$, $q$monthly$q$, $q$["Shared vaults for teams"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Team (annual)$q$, $q$$34.90/year$q$, $q$annual$q$, $q$["Same as monthly Team plan"]$q$::jsonb, 6);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Business$q$, $q$$6.99/month$q$, $q$monthly$q$, $q$["Shared vaults, security reporting"]$q$::jsonb, 7);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Business (annual)$q$, $q$$69.90/year$q$, $q$annual$q$, $q$["Same as monthly Business plan"]$q$::jsonb, 8);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom pricing upon request"]$q$::jsonb, 9);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$overview$q$, $q$What is Padloc?$q$, 2, ARRAY[$q$Padloc is an open-source, end-to-end encrypted platform for storing passwords, notes, documents, and other sensitive information.$q$, $q$It includes a built-in authenticator for one-time passwords, and the company says its code has been audited by three independent groups of security experts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', $q$who-its-for$q$, $q$Who Padloc is for$q$, 2, ARRAY[$q$Padloc serves individuals, families, and teams that want an open-source, audited password manager with a free tier and paid plans that add shared vaults, file storage, and security reporting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e2954a02-620d-4992-b4df-7f9f14891142', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── KeeWeb ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source, cross-platform password manager compatible with KeePass database files.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$KeeWeb is a free, open-source password manager compatible with KeePass, with desktop apps and cloud storage sync.$q$,
  og_description = $q$KeeWeb is a free, open-source password manager compatible with KeePass, with desktop apps and cloud storage sync.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'adba4fa4-52c9-43d9-aa36-5bf99f7c06f0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$KeePass compatibility$q$, $q$KeeWeb works with existing KeePass password database files.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Multi-file support$q$, $q$Open multiple password database files at once with unified search across all of them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Password generator$q$, $q$Generate new passwords with customizable parameters.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Protected fields$q$, $q$Sensitive fields are hidden by default and only revealed on demand.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Entry history with rollback$q$, $q$Previous versions of an entry are tracked and can be restored.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Regex search$q$, $q$Advanced search supports regular expressions for finding entries.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Cloud storage integrations$q$, $q$Sync database files with Dropbox, Google Drive, OneDrive, or a custom WebDAV server.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Completely free with no trials, demos, or limits, per the website$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Open source, with source code available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Compatible with existing KeePass password database files$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Syncs with Dropbox, Google Drive, OneDrive, or custom WebDAV servers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Available as a desktop app for macOS, Windows, and Linux, plus a browser-based web version$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$No dedicated official iOS or Android app mentioned on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$No built-in team sharing or collaboration features$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$No official paid support option$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Is KeeWeb free?$q$, $q$Yes, the website states the app is completely free, with no trials, demo versions, or limits.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Is KeeWeb compatible with KeePass?$q$, $q$Yes, KeeWeb is compatible with KeePass password database files.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$What cloud storage services does KeeWeb support?$q$, $q$Dropbox, Google Drive, OneDrive, and custom WebDAV servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$What platforms does KeeWeb support?$q$, $q$Desktop apps for macOS, Windows, and Linux, plus a web version that runs in modern browsers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Personal password management$q$, $q$Individuals already using KeePass can manage their existing password databases with KeeWeb's interface.$q$, $q$Individuals using KeePass files$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$Cross-device syncing$q$, $q$Sync a password database across devices using Dropbox, Google Drive, OneDrive, or WebDAV.$q$, $q$Users who want cloud-synced password access$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$overview$q$, $q$What is KeeWeb?$q$, 2, ARRAY[$q$KeeWeb is a free, cross-platform password manager compatible with KeePass database files.$q$, $q$It's available as a desktop app for macOS, Windows, and Linux, and as a web app that runs in modern browsers, with the source code available on GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', $q$who-its-for$q$, $q$Who KeeWeb is for$q$, 2, ARRAY[$q$KeeWeb is aimed at people who already use, or want to use, KeePass-format password databases and want a free client with cloud storage sync via Dropbox, Google Drive, OneDrive, or WebDAV.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('adba4fa4-52c9-43d9-aa36-5bf99f7c06f0', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Vaultwarden ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Rust server that implements the Bitwarden Client API for self-hosted password management.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vaultwarden is a free, open-source, self-hosted server compatible with official Bitwarden password manager clients.$q$,
  og_description = $q$Vaultwarden is a free, open-source, self-hosted server compatible with official Bitwarden password manager clients.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '72bf9a68-6a9a-4412-9612-8de0644c372e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '72bf9a68-6a9a-4412-9612-8de0644c372e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Bitwarden API compatibility$q$, $q$Implements the Bitwarden Client API in Rust, so official Bitwarden mobile, desktop, and browser clients can connect to it.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Personal vault management$q$, $q$Store and manage personal passwords and vault items.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Send$q$, $q$Share text or files securely with the built-in Send feature.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Organizations$q$, $q$Supports organizations with collections, password sharing, member roles, and groups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Multi-factor authentication$q$, $q$Supports Authenticator apps, Email, FIDO2 WebAuthn, YubiKey, and Duo for MFA.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Emergency access$q$, $q$Grant trusted contacts emergency access to a vault.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Admin backend$q$, $q$Includes an admin backend interface for managing the self-hosted instance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Free and open source under the AGPL-3.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Compatible with official Bitwarden client apps across mobile, desktop, and browser$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Written in Rust using the Rocket framework, described as lightweight for self-hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Supports strong MFA options including FIDO2 WebAuthn and YubiKey$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Active community project with 63.8k GitHub stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Unofficial project, not affiliated with or officially supported by Bitwarden Inc.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Requires self-hosting and container knowledge (Docker/Podman) to deploy$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Requires HTTPS with Web Crypto API support to function$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Is Vaultwarden the same as Bitwarden?$q$, $q$No, Vaultwarden is an unofficial, community-built alternative server implementation of the Bitwarden Client API, compatible with official Bitwarden clients.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Is Vaultwarden free?$q$, $q$Yes, it's free, open-source software licensed under AGPL-3.0.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Was Vaultwarden previously called something else?$q$, $q$Yes, it was formerly called Bitwarden_RS and was renamed in v1.21.0 to avoid trademark confusion.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$What clients work with Vaultwarden?$q$, $q$Official Bitwarden mobile, desktop, and browser clients.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Self-hosted password management$q$, $q$Individuals or organizations that want to run their own Bitwarden-compatible server instead of using Bitwarden's cloud service.$q$, $q$Self-hosting individuals and organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$Low-resource server deployments$q$, $q$The Rust-based server is described as lightweight, suiting deployment on small home servers or low-cost VPS instances.$q$, $q$Home lab and small server operators$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$overview$q$, $q$What is Vaultwarden?$q$, 2, ARRAY[$q$Vaultwarden is a free, open-source server, written in Rust, that implements the Bitwarden Client API so that official Bitwarden clients can connect to it.$q$, $q$It's a community project (formerly named Bitwarden_RS) rather than an official Bitwarden product, licensed under AGPL-3.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', $q$who-its-for$q$, $q$Who Vaultwarden is for$q$, 2, ARRAY[$q$Vaultwarden is aimed at people who want to self-host a password manager compatible with official Bitwarden apps, rather than relying on Bitwarden's hosted cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('72bf9a68-6a9a-4412-9612-8de0644c372e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── Authentik ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted, open-source identity provider supporting OAuth2/OIDC, SAML, LDAP, SCIM, and RADIUS.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Authentik is an open-source, self-hosted identity provider with a free tier and Enterprise plans from $5/user/month.$q$,
  og_description = $q$Authentik is an open-source, self-hosted identity provider with a free tier and Enterprise plans from $5/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '79882661-bae5-49ff-b255-e4b3a8eb0fb9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Multi-protocol support$q$, $q$Supports OAuth2/OIDC, SAML2, SCIM, LDAP, RADIUS, and Kerberos.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Customizable policies$q$, $q$Fully customizable policies let teams automate authentication and access workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$MFA and passkeys$q$, $q$Supports multi-factor authentication along with WebAuthn/passkeys.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Conditional access$q$, $q$Includes GeoIP-based and impossible-travel detection for conditional access decisions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Remote access proxy$q$, $q$Provides web-based RDP, VNC, and SSH access, plus a general application proxy.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise integrations$q$, $q$Integrates with 30+ services including Google Workspace, Microsoft Entra, Slack, GitHub Enterprise, Atlassian Cloud, AWS, Grafana, Stripe, and Salesforce.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Free, open-source core with self-hosted deployment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Supports a wide range of identity protocols (OIDC, SAML, LDAP, SCIM, RADIUS)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Reports over 1 million installations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Integrates with 30+ enterprise services$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Self-hosted architecture gives full control over identity infrastructure$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$No official cloud-hosted option; self-hosting is required for every tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise support tiers require paid subscriptions$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise Plus tier starts at $20,000 annually$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Is Authentik free to use?$q$, $q$Yes, the open-source edition is free and self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Does Authentik offer cloud hosting?$q$, $q$No, all tiers, including Enterprise, require self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$What protocols does Authentik support?$q$, $q$OIDC, OAuth2, SAML2, SCIM, LDAP, RADIUS, Kerberos, and proxy-based access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$How much does Authentik Enterprise cost?$q$, $q$$5 per internal user per month plus $0.02 per external user per month, billed annually.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Self-hosted SSO for internal apps$q$, $q$Organizations can run Authentik on Kubernetes, Docker Compose, or via Terraform to provide single sign-on to internal applications.$q$, $q$IT and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$B2B and B2C identity infrastructure$q$, $q$Authentik supports both workforce and customer-facing identity use cases behind one deployment.$q$, $q$Companies needing combined B2B/B2C identity$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted","OIDC, SAML, LDAP, SCIM, RADIUS, Kerberos, Proxy","Community Discord support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise$q$, $q$$5/user/month (internal) + $0.02/external user/month$q$, $q$annual$q$, $q$["Google Workspace and Microsoft Entra ID integrations","Enhanced audit logging","Client certificate authentication (mTLS)","Ticket-based support for subscriptions over $1k"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$Enterprise Plus$q$, $q$Starting at $20,000/year$q$, $q$annual$q$, $q$["Dedicated, customized support and SLAs","Volume discounts","Multi-instance deployment support","FIPS compliance for FedRAMP"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$overview$q$, $q$What is Authentik?$q$, 2, ARRAY[$q$Authentik is a self-hosted, open-source identity provider that lets organizations run their own authentication and identity infrastructure rather than relying on a third-party cloud service.$q$, $q$It supports a broad set of identity protocols, including OIDC, SAML2, SCIM, LDAP, and RADIUS, and adds enterprise integrations and support on its paid tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', $q$who-its-for$q$, $q$Who Authentik is for$q$, 2, ARRAY[$q$Authentik is aimed at organizations that want to self-host identity infrastructure for both workforce (B2B) and customer-facing (B2C) applications, with a free open-source edition and paid Enterprise tiers for additional integrations and support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79882661-bae5-49ff-b255-e4b3a8eb0fb9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Zitadel ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source identity infrastructure platform with hosted login, MFA, and multi-tenancy, free up to 100 daily active users.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$100/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, CA$q$,
  languages = '{}',
  seo_meta_description = $q$ZITADEL is an open-source identity platform for authentication and authorization, free up to 100 daily active users.$q$,
  og_description = $q$ZITADEL is an open-source identity platform for authentication and authorization, free up to 100 daily active users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69d914d3-8667-4dc1-83ca-010c75550ec9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69d914d3-8667-4dc1-83ca-010c75550ec9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Hosted login pages$q$, $q$Provides ready-made, hosted login pages for authentication.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$MFA and passwordless$q$, $q$Supports multi-factor authentication and passwordless login via passkeys.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Social logins$q$, $q$Supports social login through Google, Microsoft, and GitHub.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Role-based access control$q$, $q$Manage user permissions through role-based access control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Multi-tenancy$q$, $q$Extend applications to new organizations for multi-tenant use cases.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$gRPC and REST APIs$q$, $q$Modern gRPC and REST APIs support custom integrations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$ZITADEL Actions$q$, $q$Execute custom workflows after predefined authentication events.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Free tier includes unlimited users and organizations, up to 100 daily active users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Open source with an active GitHub community (4,000+ stars reported)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$ISO 27001 certified, SOC2 Type II certified, and OpenID certified$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Data residency options across the EU, US, Switzerland, and Australia$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Reports serving customers in 69 countries$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Free tier is capped at 100 daily active users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Pro plan caps out at 25,000 daily active users before requiring Enterprise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Enterprise pricing requires contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Is ZITADEL free?$q$, $q$Yes, ZITADEL has a free plan covering unlimited users and organizations up to 100 daily active users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$How much does ZITADEL Pro cost?$q$, $q$$100 per month, which includes up to 25,000 daily active users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Where can ZITADEL data be hosted?$q$, $q$ZITADEL offers data residency options in the EU, US, Switzerland, and Australia.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Is ZITADEL open source?$q$, $q$Yes, ZITADEL is available as open source on GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Startups needing free-tier authentication$q$, $q$The free plan supports unlimited users and organizations up to 100 daily active users, suiting early-stage products.$q$, $q$Startups and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Multi-tenant SaaS platforms$q$, $q$Organizations-based multi-tenancy lets SaaS companies manage separate customer tenants within one ZITADEL instance.$q$, $q$B2B SaaS companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited users and organizations","100 daily active users","3 identity providers","Data residency options"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Pro$q$, $q$$100/month$q$, $q$monthly$q$, $q$["25,000 daily active users","Custom domain","99.5% uptime guarantee","1-hour response SLO"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited daily active users","Technical account manager","99.99% uptime guarantee","Cloud or self-hosted infrastructure"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$overview$q$, $q$What is ZITADEL?$q$, 2, ARRAY[$q$ZITADEL is an identity infrastructure platform that provides authentication and authorization, describing itself as bridging open-source and enterprise identity solutions.$q$, $q$It offers a free tier for smaller projects, a $100/month Pro plan for growing usage, and custom Enterprise pricing for larger deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', $q$who-its-for$q$, $q$Who ZITADEL is for$q$, 2, ARRAY[$q$ZITADEL suits teams that want an open-source identity platform with a generous free tier, multi-tenant organization support, and compliance certifications like ISO 27001 and SOC2 Type II.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69d914d3-8667-4dc1-83ca-010c75550ec9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── FusionAuth ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Customer identity and access management platform with a free self-hosted Community Edition and cloud plans from $162/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$162/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$FusionAuth is a CIAM platform with a free Community Edition and cloud plans starting at $162/month, billed annually.$q$,
  og_description = $q$FusionAuth is a CIAM platform with a free Community Edition and cloud plans starting at $162/month, billed annually.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '53f62fac-4ecb-4373-8264-0094d3faebee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '53f62fac-4ecb-4373-8264-0094d3faebee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$MFA and passkeys$q$, $q$Supports multi-factor authentication and passkey-based passwordless login.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Magic links$q$, $q$Passwordless login via magic links sent to users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Single sign-on and social logins$q$, $q$Supports SSO across applications along with social login providers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Role-based access control$q$, $q$Manage permissions across applications with role-based access control.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Machine-to-machine authentication$q$, $q$Supports authentication for services and machine clients, not just human users.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Webhooks and API-first architecture$q$, $q$Built API-first, with webhooks for integrating authentication events into other systems.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$SDKs and quickstarts$q$, $q$Provides quickstarts and SDKs for languages and frameworks including .NET Core, Angular, Python, iOS, React, Java, Ruby, JavaScript, Vue, Flutter, Go, and PHP.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Free Community Edition with core authentication features that can be self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Flexible deployment: self-hosted, cloud, on-premises, hybrid, or air-gapped$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Broad SDK and quickstart support across many languages and frameworks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Usage-based cloud pricing intended to avoid surprise costs at scale, per the company$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Advanced features like breached password detection and application theming require paid plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Essentials and Enterprise cloud plans start at $2,970/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$24/7 phone and email support is only available on the Enterprise plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Is FusionAuth free?$q$, $q$Yes, the Community Edition is free to self-host with core authentication features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$What's the cheapest paid plan?$q$, $q$The Starter cloud plan is $162 per month, billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Can FusionAuth be self-hosted?$q$, $q$Yes, all plans support self-hosting via ZIP, DEB, RPM, Docker, or Kubernetes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Does FusionAuth offer enterprise support?$q$, $q$Yes, the Enterprise plan includes 24/7 phone and email support and a private Slack channel.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Self-hosted authentication for developers$q$, $q$Developers can run the free Community Edition on their own infrastructure with no user limit stated.$q$, $q$Developers and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Managed cloud CIAM for growing businesses$q$, $q$Starter, Essentials, and Enterprise cloud plans add hosting, advanced MFA, and dedicated support as usage grows.$q$, $q$Growing businesses needing managed CIAM$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Core authentication features","Self-hosted","Community forum and Slack support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Starter$q$, $q$$162/month$q$, $q$annual$q$, $q$["FusionAuth Cloud basic hosting","Advanced MFA options","Application theming","Breached password detection","Machine-to-machine authentication"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Essentials$q$, $q$Starting at $2,970/month$q$, $q$annual$q$, $q$["FusionAuth Cloud business hosting","Custom OAuth scopes","Business-day email support (24-48 hour response)","Architecture review guidance"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$Enterprise$q$, $q$Starting at $2,970/month$q$, $q$annual$q$, $q$["High-availability hosting","Advanced threat detection","SSO tenant management","24/7 phone and email support","Private Slack channel"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$overview$q$, $q$What is FusionAuth?$q$, 2, ARRAY[$q$FusionAuth is a customer identity and access management (CIAM) platform that handles authentication and user management for applications.$q$, $q$It offers a free, self-hosted Community Edition with core authentication features, plus paid FusionAuth Cloud plans that add hosting, advanced security, and support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', $q$who-its-for$q$, $q$Who FusionAuth is for$q$, 2, ARRAY[$q$FusionAuth suits development teams that want to self-host authentication for free, or businesses that want a managed cloud CIAM platform with usage-based pricing as they scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('53f62fac-4ecb-4373-8264-0094d3faebee', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Keycloak ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source identity and access management platform supporting OpenID Connect, OAuth 2.0, and SAML.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Keycloak is a free, open-source identity and access management platform supporting SSO, OIDC, OAuth 2.0, and SAML.$q$,
  og_description = $q$Keycloak is a free, open-source identity and access management platform supporting SSO, OIDC, OAuth 2.0, and SAML.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a1527d75-b687-4a16-9481-6bdc6bd5b3bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Single sign-on$q$, $q$Users authenticate with Keycloak rather than with each individual application.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Identity brokering and social login$q$, $q$Broker identities from external providers and support social login.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$User federation$q$, $q$Connects to existing LDAP or Active Directory directories for user federation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Admin console$q$, $q$Centralized admin console for managing realms, users, and clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Account management console$q$, $q$Self-service console lets users manage their own account details.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Fine-grained authorization$q$, $q$Authorization services go beyond simple role-based access control.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$A Cloud Native Computing Foundation (CNCF) incubating project$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Supports major identity protocols: OpenID Connect, OAuth 2.0, and SAML$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Federates with existing LDAP or Active Directory directories$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Provides fine-grained authorization beyond simple role-based access$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$No official managed cloud/hosted offering from the project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Self-hosting and configuration require operational expertise$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$No commercial vendor support included by default as a community project$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Is Keycloak free?$q$, $q$Yes, Keycloak is open-source software with no licensing cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$What protocols does Keycloak support?$q$, $q$OpenID Connect, OAuth 2.0, and SAML.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Can Keycloak connect to an existing directory?$q$, $q$Yes, it supports user federation with LDAP and Active Directory.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Who governs the Keycloak project?$q$, $q$Keycloak is a Cloud Native Computing Foundation incubation project.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Adding SSO to applications$q$, $q$Organizations can deploy Keycloak to add single sign-on across multiple applications with minimal per-app effort.$q$, $q$Development and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$Federating identity with LDAP/Active Directory$q$, $q$Enterprises with an existing directory can connect it to Keycloak for centralized identity management.$q$, $q$Enterprises with existing LDAP/AD directories$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$overview$q$, $q$What is Keycloak?$q$, 2, ARRAY[$q$Keycloak is an open-source identity and access management project that adds authentication and authorization to applications and services.$q$, $q$It's a Cloud Native Computing Foundation incubation project, distributed as server packages, containers, and a Kubernetes/OpenShift operator, with no licensing cost.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', $q$who-its-for$q$, $q$Who Keycloak is for$q$, 2, ARRAY[$q$Keycloak is aimed at development and platform teams that want a free, self-hosted identity provider supporting OpenID Connect, OAuth 2.0, and SAML, with the ability to federate with LDAP or Active Directory.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a1527d75-b687-4a16-9481-6bdc6bd5b3bb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SuperTokens ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source authentication platform, free under 5,000 monthly active users, with usage-based pricing for premium add-ons.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$100/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SuperTokens is an open-source authentication platform, free under 5,000 MAU, with usage-based pricing for premium add-ons.$q$,
  og_description = $q$SuperTokens is an open-source authentication platform, free under 5,000 MAU, with usage-based pricing for premium add-ons.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a5bd012-2f3f-4dff-ab18-daad2501a4b0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Email/password authentication$q$, $q$Standard email and password login flows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Passwordless login$q$, $q$Supports passwordless login and magic links.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Social login$q$, $q$Login via third-party social providers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Single sign-on$q$, $q$Supports SSO across applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Multi-tenancy$q$, $q$Supports multi-tenant and organization-based configurations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Account linking$q$, $q$Links multiple login methods to a single user account.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Attack protection suite$q$, $q$A suite of protections against common authentication attacks.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Session management$q$, $q$Session management with configurable custom policies.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Core features are free at any scale when self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Cloud managed service is free for under 5,000 monthly active users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$The company states it works with 25+ frameworks and languages, including React, Angular, Vue, Python, Go, Android, Flutter, and iOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$SOC2 compliance mentioned for the managed dashboard$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Recognized in the ROSS Index as a fastest-growing open-source startup in 2022$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Premium add-ons (MFA, account linking) are billed per monthly active user with a $100/month minimum$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Multi-tenancy, machine-to-machine auth, and the attack protection suite require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Additional dashboard users beyond the first three cost $20/user/month$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Is SuperTokens free?$q$, $q$Yes, core authentication features are free at any scale when self-hosted, and the managed cloud service is free under 5,000 monthly active users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$How is SuperTokens priced above the free tier?$q$, $q$Premium add-ons like multi-factor authentication and account linking are billed per monthly active user, with a $100/month minimum.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$What frameworks does SuperTokens support?$q$, $q$The company states it works with 25+ frameworks including React, Angular, Vue, Python, Go, Android, Flutter, and iOS.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Is SuperTokens open source?$q$, $q$Yes, it's an open-source authentication platform with a self-hosted option.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Developers building custom login flows$q$, $q$Teams that want an open-source, self-hostable authentication system they can customize.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Startups needing cost-effective authentication$q$, $q$The free cloud tier under 5,000 monthly active users suits early-stage products.$q$, $q$Startups and small products$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Cloud Core$q$, $q$Free (under 5,000 MAU)$q$, NULL, $q$["All authentication methods","User management dashboard","Session management","RBAC","SOC2 compliance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Self-Hosted$q$, $q$Free (unlimited MAU)$q$, NULL, $q$["All core features free at any scale","Pay only for premium add-ons if used"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$MFA add-on$q$, $q$$0.01/MAU (min $100/month)$q$, $q$monthly$q$, $q$["Multi-factor authentication"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$Account Linking add-on$q$, $q$$0.005/MAU (min $100/month)$q$, $q$monthly$q$, $q$["Account linking across login methods"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$overview$q$, $q$What is SuperTokens?$q$, 2, ARRAY[$q$SuperTokens is an open-source authentication platform that lets developers build and customize login systems, positioning itself as a lower-cost alternative to services like Auth0.$q$, $q$Core features are free at any scale when self-hosted, and the managed cloud service is free for up to 5,000 monthly active users, with premium add-ons billed per user beyond that.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', $q$who-its-for$q$, $q$Who SuperTokens is for$q$, 2, ARRAY[$q$SuperTokens is aimed at development teams that want an open-source, customizable authentication system, whether self-hosted for free or used via the managed cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a5bd012-2f3f-4dff-ab18-daad2501a4b0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Ory ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source identity and access management platform for customer, B2B, and machine identity, founded in 2019.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$770/year$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$Scottsdale, Arizona$q$,
  languages = '{}',
  seo_meta_description = $q$Ory is an open-source identity and access management platform with a free Developer tier and plans from $770/year.$q$,
  og_description = $q$Ory is an open-source identity and access management platform with a free Developer tier and plans from $770/year.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f21e8c47-9727-46e1-8769-b1874bae4d03';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f21e8c47-9727-46e1-8769-b1874bae4d03' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Customer identity (CIAM)$q$, $q$Handles login and signup for customer-facing applications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$B2B identity$q$, $q$Enterprise SSO, SAML, and SCIM support with granular permissions for B2B use cases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Machine-to-machine authentication$q$, $q$Supports identity and access management for services and automated agents, not just human users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Stateless horizontal scaling$q$, $q$Architecture designed for stateless horizontal scaling described by the company as supporting very large deployments.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Observability$q$, $q$Provides metrics and trace-level logging for production observability.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Multiple deployment models$q$, $q$Available as open-source self-hosted software, an Ory Enterprise License for private infrastructure, or the fully managed Ory Network.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Free Developer tier includes 2 development environments and community support$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Open source, with 48,000+ GitHub stars reported by the company$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Multiple deployment options: self-hosted, enterprise license, or fully managed$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Reports managing 3.3 billion identities across its network$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Data residency and multi-region deployment available on higher tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Growth plan starts at $9,350/year$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$B2B SSO on the Growth plan is limited to OIDC only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Enterprise and self-hosted Enterprise License pricing require contacting sales$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$When was Ory founded?$q$, $q$Ory was founded on June 21, 2019.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Is Ory free to use?$q$, $q$Yes, Ory offers a free Developer tier with 2 development environments and community support.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$How much does Ory's Production plan cost?$q$, $q$$770 per year.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Can Ory be self-hosted?$q$, $q$Yes, Ory offers an open-source self-hosted option as well as an Ory Enterprise License for on-premises or private cloud deployment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Startups needing a free identity tier$q$, $q$The free Developer tier gives smaller projects access to core identity features with community support.$q$, $q$Startups and individual developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Enterprises needing B2B SSO and multi-tenant identity$q$, $q$Growth and Enterprise plans add B2B SSO, multiple organizations, and higher uptime SLAs for larger companies.$q$, $q$Enterprises and B2B SaaS companies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Developer$q$, $q$Free$q$, NULL, $q$["2 development environments","24-hour analytics history","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Production$q$, $q$$770/year$q$, $q$annual$q$, $q$["1 production environment","3 staging environments","5 development environments","Permissions and M2M tokens"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Growth$q$, $q$$9,350/year$q$, $q$annual$q$, $q$["2 production environments","5 staging environments","20 development environments","B2B SSO (OIDC only)","Up to 3 organizations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Multi-region deployments","Data residency","99.99% uptime SLA","Concierge onboarding"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$Ory Enterprise License$q$, $q$Custom$q$, NULL, $q$["Self-hosted deployment with full control","Multi-region flexibility","Premium support with SLAs"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$overview$q$, $q$What is Ory?$q$, 2, ARRAY[$q$Ory is an identity and access management platform, founded in 2019, that covers customer identity (CIAM), B2B identity with enterprise SSO and SCIM, and identity for automated agents and services.$q$, $q$It's available as open-source self-hosted software, through an Ory Enterprise License for private infrastructure, or as the fully managed Ory Network, with a free Developer tier and paid plans starting at $770/year.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', $q$who-its-for$q$, $q$Who Ory is for$q$, 2, ARRAY[$q$Ory suits companies that need identity infrastructure spanning customer logins, B2B enterprise SSO, and machine/service authentication, with deployment options ranging from a free open-source self-hosted setup to a fully managed enterprise network.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f21e8c47-9727-46e1-8769-b1874bae4d03', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Cerbos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source and cloud authorization platform for fine-grained RBAC, ABAC, and ReBAC access control across apps, APIs, and AI agents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month$q$,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Cerbos: open-source authorization platform for fine-grained RBAC, ABAC, and ReBAC access control across applications, APIs, and AI agents.$q$,
  og_description = $q$Cerbos: open-source authorization platform for fine-grained RBAC, ABAC, and ReBAC access control across applications, APIs, and AI agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '62db09f8-596e-4759-92a2-df735f8464c1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '62db09f8-596e-4759-92a2-df735f8464c1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Multiple authorization models$q$, $q$Define policies using RBAC, ABAC, ReBAC, or PBAC models in a YAML-based policy language.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$AI agent guardrails$q$, $q$Govern and revoke AI agent access to tools and actions in seconds, with support for the Model Context Protocol (MCP).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Cerbos Hub$q$, $q$Centralized policy administration point for managing, testing, and deploying policies across environments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Cerbos Synapse$q$, $q$Enriches authorization decisions with context pulled from existing systems and data sources.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Sub-millisecond decision latency$q$, $q$Policy Decision Points (PDPs) are built for high-volume authorization checks with very low latency.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Audit-ready logging$q$, $q$Captures every authorization decision along with policy lineage for compliance and traceability.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Flexible deployment$q$, $q$Runs in Cerbos Hub (cloud), self-hosted, on-premise, or in air-gapped environments.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Broad SDK support$q$, $q$Client SDKs available for JavaScript, Python, Go, Rust, Java, .NET, PHP, and Ruby.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Free, open-source core with unlimited monthly active principals (MAPs)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Supports RBAC, ABAC, ReBAC, and PBAC in a single policy engine$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Can be deployed on-premise or air-gapped for regulated, high-security environments$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Broad SDK/language coverage across major backend stacks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Purpose-built AI agent authorization features, including MCP integration$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Production tier starts at $933/month, a steep jump from the $25/month Development tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Policy build counts and audit log retention are capped on lower-tier paid plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$SSO and self-hosted Cerbos Hub require moving to custom Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Is Cerbos free to use?$q$, $q$Yes. Cerbos has a free, open-source version with unlimited monthly active principals, plus a free $0/month Proof of Concept tier for evaluating Cerbos Hub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$What authorization models does Cerbos support?$q$, $q$Cerbos supports RBAC, ABAC, ReBAC, and PBAC policy models, defined in a YAML-based policy language.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Can Cerbos be self-hosted?$q$, $q$Yes. In addition to its managed Cerbos Hub cloud offering, Cerbos can run self-hosted, on-premise, or in air-gapped environments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Does Cerbos support AI agent authorization?$q$, $q$Yes. Cerbos provides AI agent guardrails for governing and revoking agent tool access, including integration with the Model Context Protocol (MCP).$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$How much does the Production plan cost?$q$, $q$The Production plan starts from $933/month and includes the first 5,000 monthly active principals plus one year of unified audit logs.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$AI agent and MCP server authorization$q$, $q$Govern which tools and actions AI agents can access, and revoke access quickly when behavior changes.$q$, $q$AI/ML engineering teams building agentic systems$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Multi-tenant SaaS access control$q$, $q$Enforce per-tenant permission boundaries with centralized policy management via Cerbos Hub.$q$, $q$SaaS platform engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Regulated industry compliance$q$, $q$Deploy self-hosted or air-gapped authorization to meet SOC 2, HIPAA, or FedRAMP requirements.$q$, $q$Security and compliance teams in finance, healthcare, and government$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Unlimited monthly active principals","YAML-based policy definition","Audit logs","CI/CD & IDE tooling","Community support","Run anywhere: on-premise or cloud"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Proof of Concept$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Up to 100 monthly active principals","1 workspace, 2 developers","2 Playgrounds","2 simultaneous PDPs","Up to 5 custom tenants","1 week of unified audit logs"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Development$q$, $q$From $25/month$q$, $q$monthly$q$, $q$["First 100 MAPs included","3-month free trial","3 workspaces, 5 developers","Up to 10 simultaneous PDPs","3 months of unified audit logs","Uptime SLA","Live chat support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Production$q$, $q$From $933/month$q$, $q$monthly$q$, $q$["First 5,000 MAPs included","Unlimited workspaces & developers","Unlimited PDPs and tenants","1 year of unified audit logs","Uptime SLA","Live chat support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["SSO support","Self-hosted Cerbos Hub","Custom audit log retention","Custom training support","Enterprise support SLA","Phone support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$overview$q$, $q$What is Cerbos?$q$, 2, ARRAY[$q$Cerbos is an authorization platform that lets teams define and enforce fine-grained, contextual access control across applications, APIs, AI agents, and workloads. It supports RBAC, ABAC, ReBAC, and PBAC policy models written in a YAML-based policy language, and evaluates decisions through Policy Decision Points (PDPs) built for sub-millisecond latency.$q$, $q$The platform has an open-source core with unlimited monthly active principals, alongside a managed offering (Cerbos Hub) for centralized policy administration, plus paid tiers for teams that need larger scale, audit log retention, or enterprise features like SSO and self-hosted Hub deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', $q$who-its-for$q$, $q$Who Cerbos is for$q$, 2, ARRAY[$q$Cerbos is aimed at engineering and security teams that need to move authorization logic out of application code, including teams building multi-tenant SaaS products, teams governing what AI agents and MCP tool calls are permitted to do, and organizations in regulated industries that require self-hosted or air-gapped deployment for compliance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db09f8-596e-4759-92a2-df735f8464c1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Permit.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Permit.io is a real-time authorization platform for RBAC, ABAC, and ReBAC access control across apps and AI agents, built on OPA and OPAL.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Permit.io: real-time authorization and access control platform for apps, APIs, and AI agents, built on open-source OPA and OPAL.$q$,
  og_description = $q$Permit.io: real-time authorization and access control platform for apps, APIs, and AI agents, built on open-source OPA and OPAL.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d826762-9d50-46fb-93f2-f3db167ecdd7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d826762-9d50-46fb-93f2-f3db167ecdd7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$MCP Gateway$q$, $q$Authenticates AI agents, gates tokens, collects consent, and governs tool access in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Multi-model policy engine$q$, $q$Supports RBAC, ABAC, and ReBAC with policy-as-code workflows.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Distributed Policy Decision Point (PDP)$q$, $q$Delivers sub-millisecond authorization decisions, deployable in-VPC or at the edge.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Elements$q$, $q$Embeddable UI components for building approval and access-request workflows into applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Audit logs and decision traces$q$, $q$Provides visibility across human-to-agent-to-tool-to-data authorization chains.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Guardian Agents$q$, $q$AI monitoring that watches for anomalous access behavior and recommends security policy changes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Built on OPA and OPAL$q$, $q$Uses the open-source Open Policy Agent and OPAL projects as its policy engine foundation, available managed or self-hosted.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Free Community plan with up to 1,000 monthly active users and unlimited authorization microservices$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Supports RBAC, ABAC, ReBAC, and PBAC in one policy engine$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Built on established open-source projects (OPA/OPAL) rather than a proprietary policy language$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Offers both managed cloud and self-hosted/on-premises deployment$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$SOC 2 Type II certified, with HIPAA/GDPR/CCPA compliance options at the Enterprise tier$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$SSO support requires an additional cost even on the paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Full compliance suite (HIPAA BAA, complete SOC 2 documentation) is limited to the custom Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Tenant and MAU limits on Community/Startup plans may require upgrading as usage grows$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Is Permit.io free to use?$q$, $q$Yes. The Community plan is free forever for up to 1,000 monthly active users, 20 tenants, and 3 environments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$What authorization models does Permit.io support?$q$, $q$RBAC, ABAC, ReBAC, and PBAC, managed through a UI and API alongside infrastructure-as-code workflows.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Can Permit.io be self-hosted?$q$, $q$Yes. Because it's built on the open-source OPA and OPAL projects, Permit.io supports both managed and self-hosted deployment, including on-premises for Enterprise customers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Does Permit.io have AI-specific features?$q$, $q$Yes. It offers an MCP Gateway for authenticating and governing AI agent tool access, plus Guardian Agents that monitor for anomalous behavior and recommend policy changes.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$How is Permit.io priced?$q$, $q$Plans scale by monthly active users and tenant count: Community is free, Startup starts from $5/month, Pro starts from $25/month, and Enterprise uses custom pricing.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$AI agent tool-access governance$q$, $q$Use the MCP Gateway to authenticate agents and control which tools and actions they can invoke in real time.$q$, $q$Teams building AI agents and LLM tool integrations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Multi-tenant SaaS permission management$q$, $q$Manage per-tenant RBAC/ABAC/ReBAC permissions as products scale from B2C to B2B.$q$, $q$Product engineering teams at growing SaaS companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Regulated enterprise access control$q$, $q$Deploy on-premises or multi-cloud with a full compliance suite for HIPAA, GDPR, CCPA, and SOC 2 requirements.$q$, $q$Enterprises in fintech, healthcare, and other regulated industries$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Community$q$, $q$Free$q$, NULL, $q$["UI and API access for RBAC, ABAC, ReBAC, PBAC, and IaC","Embeddable authorization interfaces","Unlimited authorization microservices","Up to 1,000 MAU","20 tenants max","3 environments","14-day log retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Startup$q$, $q$From $5/month$q$, $q$monthly$q$, $q$["Up to 25,000 MAU and 100 tenants","5 environments","Full GitOps CI/CD pipeline for automated deployments","Extended audit log retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Pro$q$, $q$From $25/month$q$, $q$monthly$q$, $q$["Up to 50,000 MAU and 20,000 tenants","50 environments","Dedicated Slack support","SOC 2 Type II compliance certification","SSO support (additional cost)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited MAU and tenants","Unlimited projects and environments","Dedicated customer success representative","Full compliance suite (HIPAA BAA, GDPR, CCPA, SOC 2)","Multi-cloud and on-premises deployment","Advanced uptime SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$overview$q$, $q$What is Permit.io?$q$, 2, ARRAY[$q$Permit.io is an authorization and permissions management platform built on the open-source Open Policy Agent (OPA) and OPAL projects. It provides real-time, fine-grained access control using RBAC, ABAC, ReBAC, and PBAC models, with a distributed Policy Decision Point architecture designed for sub-millisecond decisions in-VPC or at the edge.$q$, $q$Beyond traditional application authorization, Permit.io markets itself around AI agent security: an MCP Gateway authenticates agents and governs their tool access in real time, while 'Guardian Agents' monitor behavior for anomalies and recommend policy adjustments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', $q$who-its-for$q$, $q$Who Permit.io is for$q$, 2, ARRAY[$q$Permit.io targets engineering teams building B2C or B2B SaaS products that need scalable, policy-as-code authorization, as well as teams deploying AI agents that require real-time, action-level access governance. Its Enterprise tier, with a full HIPAA/GDPR/CCPA/SOC 2 compliance suite and on-premises deployment, is aimed at regulated organizations such as those in fintech and healthcare.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d826762-9d50-46fb-93f2-f3db167ecdd7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── OpenFGA ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, CNCF-incubating engine for fine-grained, relationship-based authorization inspired by Google Zanzibar.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2022,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$OpenFGA is a free, open-source, CNCF project for fine-grained, Zanzibar-style relationship-based access control (ReBAC).$q$,
  og_description = $q$OpenFGA is a free, open-source, CNCF project for fine-grained, Zanzibar-style relationship-based access control (ReBAC).$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '801862d9-7d0d-4545-aa0d-0e249ca2ab37' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Zanzibar-inspired ReBAC modeling$q$, $q$Uses an authorization modeling language, based on concepts from Google's Zanzibar paper, to define relationship-based access control between users and resources.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Millisecond authorization checks$q$, $q$Designed to answer authorization check calls in milliseconds, suitable for use in the request path of applications and APIs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Multi-model support (RBAC, ABAC, ReBAC)$q$, $q$Supports role-based, attribute-based, and relationship-based access control patterns within the same system.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Multi-language SDKs$q$, $q$Official SDKs are available for Node.js, Go, .NET, Python, and Java, alongside a CLI and direct HTTP API access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Self-hosted server via Docker$q$, $q$Runs as a standalone OpenFGA server that teams can deploy themselves, for example by pulling the official Docker image.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Relationship query API$q$, $q$Provides Check, Read, Expand, and ListObjects operations for querying and evaluating relationship tuples.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Community governance$q$, $q$Developed with a transparent RFC process and public roadmap, and maintained by contributors including engineers from Okta, Grafana Labs, and Gitpod.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Free and fully open source, with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$CNCF incubating project, providing vendor-neutral governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Adopted in production by organizations such as Auth0, Okta, Docker, and Grafana$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$SDKs for several popular languages reduce integration effort$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Flexible enough to model RBAC, ABAC, and ReBAC in one system$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Requires self-hosting and operating your own OpenFGA server; openfga.dev does not document a managed hosted offering$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Zanzibar-style relationship modeling has a learning curve for teams unfamiliar with the approach$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$As a community open-source project, formal commercial support is not part of the core openfga.dev offering$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$What is OpenFGA?$q$, $q$OpenFGA is an open-source authorization system that lets developers implement fine-grained, relationship-based access control using an authorization modeling language and API.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Is OpenFGA free to use?$q$, $q$Yes. OpenFGA is free and open source, and can be self-hosted (for example via Docker) with no licensing fees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Who maintains OpenFGA?$q$, $q$OpenFGA is a CNCF incubating project. It was originally created by Auth0/Okta and open sourced in 2022, and is now maintained by a broader community including engineers from Grafana Labs and Gitpod.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$What authorization models does OpenFGA support?$q$, $q$OpenFGA supports relationship-based access control (ReBAC) inspired by Google's Zanzibar paper, as well as role-based (RBAC) and attribute-based (ABAC) access control patterns.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$What SDKs does OpenFGA provide?$q$, $q$OpenFGA offers SDKs for Node.js, Go, .NET, Python, and Java, in addition to a CLI and a direct HTTP API.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Multi-tenant SaaS access control$q$, $q$Model per-tenant roles and resource-level permissions so users only see and act on data they're authorized for.$q$, $q$SaaS engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$B2B application permissions$q$, $q$Implement fine-grained permission checks for complex organizational structures, teams, and shared resources in business applications.$q$, $q$Platform and backend engineers building B2B software$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Replacing hardcoded authorization logic$q$, $q$Move authorization decisions out of application code and into a centralized, queryable relationship-based model.$q$, $q$Development teams migrating from ad hoc or hardcoded RBAC checks$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$Open Source (self-hosted)$q$, $q$Free$q$, NULL, $q$["Self-hosted OpenFGA server (e.g., via Docker)","Full relationship-query API access (Check, Read, Expand, ListObjects)","SDKs for Node.js, Go, .NET, Python, and Java","Community support and public roadmap"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$overview$q$, $q$What is OpenFGA?$q$, 2, ARRAY[$q$OpenFGA is an open-source authorization system for implementing fine-grained access control, using a modeling language and API inspired by Google's Zanzibar paper on relationship-based access control (ReBAC).$q$, $q$Originally created by Auth0/Okta and open sourced in 2022, OpenFGA is now a CNCF incubating project maintained by a community that includes engineers from Okta, Grafana Labs, and Gitpod, with adopters such as Auth0, Docker, and Grafana.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', $q$who-its-for$q$, $q$Who OpenFGA is for$q$, 2, ARRAY[$q$OpenFGA is aimed at developers and platform teams who need to move authorization logic out of application code, particularly for multi-tenant SaaS products and B2B applications with complex, relationship-driven permission requirements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('801862d9-7d0d-4545-aa0d-0e249ca2ab37', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SpiceDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SpiceDB is an open-source, Google Zanzibar-inspired database for building fine-grained, relationship-based application permissions.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2/hour$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SpiceDB is an open-source, Zanzibar-inspired permissions database from AuthZed for fine-grained, relationship-based authorization.$q$,
  og_description = $q$SpiceDB is an open-source, Zanzibar-inspired permissions database from AuthZed for fine-grained, relationship-based authorization.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ce745a19-20cd-4b81-bc11-a6593524a8d1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Expressive APIs$q$, $q$Exposes gRPC and HTTP/JSON APIs for defining and checking authorization logic from any application stack.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Distributed Graph Engine$q$, $q$A parallel, distributed architecture based on Google's Zanzibar paper for evaluating permission checks at scale.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Configurable Consistency$q$, $q$Per-request consistency settings designed to resist the 'New Enemy Problem' common in permission systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$SpiceDB Schema Language$q$, $q$A dedicated schema language for modeling permissions, with support for CI/CD integration and validation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Pluggable Storage$q$, $q$Supports in-memory storage plus production datastores including PostgreSQL, MySQL, CockroachDB, and Google Cloud Spanner.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Deep Observability$q$, $q$Built-in Prometheus metrics, pprof profiles, structured logging, and OpenTelemetry tracing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$zed CLI and SpiceDB Operator$q$, $q$A command-line tool for managing SpiceDB deployments plus a Kubernetes operator for cluster management.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Open source under the Apache-2.0 license with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Implements Google's proven Zanzibar model for large-scale, fine-grained authorization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Supports multiple production-grade storage backends (Postgres, CockroachDB, MySQL, Spanner)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Used in production by companies including Reddit and Netflix$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Includes built-in observability tooling (Prometheus, OpenTelemetry, pprof)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Zanzibar-style relationship-based access control has a learning curve for teams new to the model$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Self-hosting requires operating a distributed system and managing a separate storage backend$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Self-hosted enterprise licensing and Dedicated Cloud pricing require a custom quote rather than public pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Is SpiceDB open source?$q$, $q$Yes, SpiceDB is licensed under Apache 2.0 and can be self-hosted for free.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What storage backends does SpiceDB support?$q$, $q$SpiceDB supports in-memory storage as well as PostgreSQL, MySQL, CockroachDB, and Google Cloud Spanner as pluggable datastores.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Does AuthZed offer a managed version of SpiceDB?$q$, $q$Yes, AuthZed Cloud is a self-service managed hosting option billed on a pay-as-you-go basis starting around $2/hr, alongside AuthZed Dedicated and Self-Hosted enterprise licensing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What companies use SpiceDB in production?$q$, $q$According to AuthZed, SpiceDB is used in production by companies including Reddit and Netflix.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$What APIs does SpiceDB expose?$q$, $q$SpiceDB exposes both gRPC and HTTP/JSON APIs for defining and evaluating authorization logic.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Fine-grained application permissions$q$, $q$Teams building SaaS applications that need relationship-based access control (e.g., who can view or edit a document) can model permission hierarchies using SpiceDB's schema language.$q$, $q$Backend and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Zanzibar-style authorization at scale$q$, $q$Organizations needing low-latency, consistent authorization checks across a distributed graph can deploy SpiceDB's distributed graph engine.$q$, $q$Engineering teams at high-traffic platforms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Kubernetes-native permission deployments$q$, $q$Teams running Kubernetes can use the SpiceDB Operator to manage SpiceDB clusters alongside their existing infrastructure.$q$, $q$Platform and DevOps teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Apache 2.0 licensed","Self-hosted deployment","Community support via Discord and GitHub"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Cloud$q$, $q$From $2/hr$q$, NULL, $q$["Usage-based, pay-as-you-go pricing","Managed service with workload isolation","Observability APIs","Standard support, with Premium/Enterprise available"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Self-Hosted$q$, $q$Custom quote$q$, $q$annual$q$, $q$["Annual license priced per region/vCPU","Enterprise support","Dedicated account team"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$Dedicated Cloud$q$, $q$Custom quote$q$, NULL, $q$["Private infrastructure","Multi-region deployments","Premium support included"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$overview$q$, $q$What is SpiceDB?$q$, 2, ARRAY[$q$SpiceDB is an open-source permissions database inspired by Google's Zanzibar paper, built to help engineering teams implement fine-grained, relationship-based access control (ReBAC) instead of hand-rolling custom authorization logic.$q$, $q$It exposes gRPC and HTTP/JSON APIs backed by a distributed graph engine, and supports pluggable storage backends including PostgreSQL, MySQL, CockroachDB, and Google Cloud Spanner. AuthZed, the company behind SpiceDB, also offers managed hosting through AuthZed Cloud and AuthZed Dedicated, plus a licensed self-hosted enterprise edition.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', $q$who-its-for$q$, $q$Who SpiceDB is for$q$, 2, ARRAY[$q$SpiceDB is aimed at backend and platform engineering teams that need to model complex, evolving permission structures across an application — from simple role checks to nested organizational hierarchies — with a system proven in production at companies like Reddit and Netflix.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce745a19-20cd-4b81-bc11-a6593524a8d1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── WorkOS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$WorkOS is an API platform providing enterprise SSO, directory sync, RBAC, and user management for B2B SaaS applications.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$100+ employees$q$,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$WorkOS provides enterprise SSO, directory sync, and user management APIs so B2B SaaS companies can sell to enterprise customers.$q$,
  og_description = $q$WorkOS provides enterprise SSO, directory sync, and user management APIs so B2B SaaS companies can sell to enterprise customers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3455877b-59ac-4ce9-8371-d5101e680c67';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3455877b-59ac-4ce9-8371-d5101e680c67' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Enterprise SSO$q$, $q$Unified single sign-on integration supporting 20+ identity providers, including Okta, Azure AD, Google, OneLogin, PingIdentity, ADFS, and JumpCloud, via SAML and OIDC.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Directory Sync$q$, $q$Automated user lifecycle management by syncing users and groups from corporate directories and HR systems such as BambooHR.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$AuthKit$q$, $q$A customizable, prebuilt authentication UI covering email/password login, social login, passkeys, magic auth, and MFA.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Admin Portal$q$, $q$A self-serve portal that lets corporate IT admins configure their own SSO and directory connections without vendor involvement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$RBAC$q$, $q$Role-based access control for defining and managing flexible permissions across users and organizations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Audit Logs$q$, $q$Event logging with export and streaming support, including SIEM connections, for compliance and security monitoring.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Radar$q$, $q$Real-time protection against bots, fraud, and abuse, with the first 1,000 checks included free each month.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Multi-language SDKs$q$, $q$Official SDKs for Node.js, Ruby, Python, Go, PHP, Java, and .NET, plus a REST API with cURL examples.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$AuthKit is free for the first 1 million monthly active users in production$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Broad enterprise identity provider coverage with 20+ supported providers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Tiered connection pricing includes automatic volume discounts as usage scales$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Staging environments are always free regardless of usage$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Used in production by companies including Vercel, OpenAI, Cursor, and Perplexity$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$SSO and Directory Sync are billed per connection starting at $125 each, which can add up for B2B apps serving many enterprise customers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Pricing above 200 connections requires contacting sales, so costs at scale aren't fully public$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Guaranteed support SLAs and video call support require the $1,000/month Scale plan or a custom Enterprise plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Audit Logs and Custom Domain are separately priced add-ons rather than included by default$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Does WorkOS have a free plan?$q$, $q$Yes. AuthKit is free for the first 1 million monthly active users in production, and staging environments are always free.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$How is Single Sign-On priced on WorkOS?$q$, $q$SSO and Directory Sync are billed per connection on a tiered scale, from $125/connection for 1-15 connections down to $50/connection for 101-200 connections, with custom pricing above 200 connections.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$What identity providers does WorkOS support?$q$, $q$WorkOS integrates with 20+ identity providers, including Okta, Azure AD, Google, OneLogin, PingIdentity, ADFS, and JumpCloud.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Does WorkOS provide fraud or bot protection?$q$, $q$Yes, through a feature called Radar, which offers real-time protection against bots, fraud, and abuse, with the first 1,000 checks free each month.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$What SDKs and languages does WorkOS support?$q$, $q$WorkOS provides SDKs for Node.js, Ruby, Python, Go, PHP, Java, and .NET, along with a REST API.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Becoming enterprise-ready$q$, $q$Adding SSO, SCIM directory sync, RBAC, and an admin portal so a SaaS product meets the security and provisioning requirements of enterprise procurement.$q$, $q$B2B SaaS engineering teams selling to enterprise customers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Fraud and bot mitigation$q$, $q$Using Radar to detect and block bots, fraud, and abusive traffic in real time.$q$, $q$Security and platform teams protecting sign-up and login flows$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Prebuilt authentication UI$q$, $q$Using AuthKit to launch passwordless, social, and MFA-enabled login flows without building auth screens from scratch.$q$, $q$Early-stage startups and developer teams that want to ship auth quickly$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$AuthKit (User Management)$q$, $q$Free up to 1M MAU, then $2,500/month per additional 1M MAU$q$, $q$monthly$q$, $q$["Email/password login","Social login","Passkeys","MFA","Magic auth","Enterprise SSO"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$SSO / Directory Sync$q$, $q$$125 per connection (1-15), decreasing to $50 per connection (101-200); custom above 200$q$, $q$monthly$q$, $q$["Tiered volume discounts","SAML/OIDC support","Directory/HR system sync"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Scale Support$q$, $q$$1,000/month$q$, $q$monthly$q$, $q$["Video call support","Onboarding guidance","1-hour P1 response time"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated account manager","24/7 SLAs","Architecture reviews","99.99% uptime SLA","Guided migration"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$overview$q$, $q$What is WorkOS?$q$, 2, ARRAY[$q$WorkOS is an API platform that helps developers add enterprise-grade authentication and identity features to their applications. Its core products include Enterprise SSO, Directory Sync, an Admin Portal, RBAC, Audit Logs, and AuthKit, a prebuilt authentication UI covering passwords, social login, passkeys, magic auth, and MFA.$q$, $q$The platform connects to more than 20 identity providers, including Okta, Azure AD, Google, OneLogin, PingIdentity, ADFS, and JumpCloud, and offers SDKs for Node.js, Ruby, Python, Go, PHP, Java, and .NET alongside a REST API.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', $q$who-its-for$q$, $q$Who WorkOS is for$q$, 2, ARRAY[$q$WorkOS is built for B2B SaaS engineering teams that need to satisfy enterprise procurement and IT requirements, such as SSO, SCIM directory sync, and audit logging, without building that infrastructure themselves. Companies referenced as customers on the WorkOS site include Vercel, OpenAI, Cursor, Perplexity, and Netlify.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3455877b-59ac-4ce9-8371-d5101e680c67', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Stytch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Stytch is an identity platform providing authentication, authorization, and fraud prevention APIs for humans and AI agents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month (Pay As You Go, free up to 10,000 MAUs)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$Stytch offers authentication, SSO, and fraud prevention APIs for human users and AI agents, with a free tier up to 10,000 MAUs.$q$,
  og_description = $q$Stytch offers authentication, SSO, and fraud prevention APIs for human users and AI agents, with a free tier up to 10,000 MAUs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2b01301f-20d2-49a2-a9d0-dfcb07a99c20' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Enterprise SSO & SCIM$q$, $q$SAML and OIDC single sign-on plus SCIM provisioning, with the first 5 SSO/SCIM connections included free.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Passwordless authentication$q$, $q$Passkeys, magic links, and one-time passcodes delivered via SMS and email, with automatic provider failover for delivery reliability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Machine-to-machine (M2M) authentication$q$, $q$Authentication for service-to-service calls and AI agents, with 1,000 M2M tokens included in the free tier.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Fraud and bot protection$q$, $q$Device fingerprinting and intelligent rate limiting, described as achieving 99.99% bot detection accuracy, with 10,000 free fingerprints per month.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Turnkey multi-tenancy$q$, $q$Organization-level policies, RBAC, and SCIM support for building B2B applications with unlimited organizations, even on the free tier.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Embeddable Admin Portal$q$, $q$A self-service portal that lets enterprise customers manage their own SSO and SCIM connections.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Connected Apps$q$, $q$Support for cross-application integrations between a company's own products and third-party apps.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Web & mobile UI components$q$, $q$Prebuilt, customizable login UI components alongside headless SDKs and backend APIs for full flexibility.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Free tier includes 10,000 monthly active users/AI agents, unlimited organizations, 5 SSO/SCIM connections, and 1,000 M2M tokens$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Pricing has no hard caps or pricing cliffs, so overages are billed for actual usage only$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Explicit support for machine-to-machine and AI agent authentication, not just human end users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Broad auth method coverage including passkeys, OAuth, SSO, sessions, and RBAC in the base tier$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Backed by Twilio after Stytch joined the company, adding messaging infrastructure depth$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$SSO/SCIM connections beyond the free 5 cost $125 per connection, similar to competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Enterprise pricing, including HIPAA/BAA compliance and a 99.99% uptime SLA, is custom and not publicly listed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Brand customization requires a separate $99 one-time fee$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Fraud prevention fingerprinting beyond the free 10,000 is billed per use at $0.005 each$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Is Stytch free to use?$q$, $q$Yes. The Pay As You Go plan is free up to 10,000 monthly active users/AI agents, 5 SSO or SCIM connections, and 1,000 M2M tokens.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Does Stytch support authentication for AI agents?$q$, $q$Yes, Stytch positions itself as an identity platform for both humans and AI agents, and its free tier explicitly covers AI agents alongside human monthly active users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$What happens if usage exceeds the free tier?$q$, $q$Stytch charges usage-based overages with no hard caps or pricing cliffs, plus $125 per additional SSO/SCIM connection beyond the 5 included free.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Is Stytch part of Twilio?$q$, $q$Yes, Stytch has joined Twilio to build what the company describes as the intelligent identity layer for the internet.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Does Stytch offer fraud protection?$q$, $q$Yes, via device fingerprinting (10,000 free per month, then $0.005 each) and intelligent rate limiting for bot detection.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$B2B multi-tenant applications$q$, $q$Using turnkey multi-tenancy, organization policies, and SSO/SCIM to serve enterprise customers with their own auth requirements.$q$, $q$B2B SaaS engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$AI agent authentication$q$, $q$Issuing M2M tokens to authenticate AI agents and backend services rather than only human users.$q$, $q$Teams building AI-agent products that need machine identity$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Consumer passwordless login$q$, $q$Implementing passkeys, magic links, and OTP delivery to reduce password-related friction in consumer sign-up and login flows.$q$, $q$Consumer application developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Pay As You Go$q$, $q$$0/month base, usage-based overages$q$, $q$monthly$q$, $q$["10,000 free MAUs/AI agents","Unlimited organizations","5 free SSO/SCIM connections","1,000 free M2M tokens","OAuth, SSO, Sessions, RBAC"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["99.99% uptime SLA","HIPAA/BAA compliance","Advanced fraud protection","Private support channels","Migration assistance"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$overview$q$, $q$What is Stytch?$q$, 2, ARRAY[$q$Stytch is an identity platform offering authentication, authorization, and security APIs, including SSO, SCIM, passkeys, OTP, and machine-to-machine authentication. The company describes its product as built for both human users and AI agents.$q$, $q$Core features include an embeddable admin portal for enterprise self-service, device fingerprinting and rate limiting for fraud prevention, turnkey multi-tenancy with organization policies, and prebuilt web and mobile UI components alongside headless SDKs and backend APIs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', $q$who-its-for$q$, $q$Who Stytch is for$q$, 2, ARRAY[$q$Stytch is aimed at development teams building B2B or consumer applications that need enterprise-grade authentication, including SSO/SCIM for enterprise customers and passwordless login for end users. Its free tier and explicit support for authenticating AI agents also make it relevant to teams building AI-agent products that need machine-to-machine identity.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b01301f-20d2-49a2-a9d0-dfcb07a99c20', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Descope ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Descope is a customer identity platform offering no-code auth flows, fine-grained authorization, and identity security for apps and AI agents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$249/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Descope offers passwordless login, MFA, RBAC/ReBAC/ABAC, multi-tenancy, and AI agent/MCP authorization with a no-code Flows builder.$q$,
  og_description = $q$Descope offers passwordless login, MFA, RBAC/ReBAC/ABAC, multi-tenancy, and AI agent/MCP authorization with a no-code Flows builder.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f510c6a5-cbc9-401c-86fa-13a9b3bcc298' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Descope Flows$q$, $q$A visual, drag-and-drop workflow builder for designing authentication and identity journeys without hand-coding custom auth logic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Multiple authentication methods$q$, $q$Supports passwordless login, OTP, magic links, social login, SSO, and adaptive MFA.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Fine-grained authorization$q$, $q$Role-based (RBAC), relationship-based (ReBAC), and attribute-based (ABAC) access control models.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Multi-tenancy$q$, $q$Organization and tenant management with delegated admin for B2B customers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$AI agent and MCP server security$q$, $q$Authorization, scope-based access control, consent, token management, and DCR security purpose-built for AI agents and MCP servers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Broad SDK and framework support$q$, $q$SDKs for React, Next.js, Vue.js, Angular, Python, Node.js, Java, .NET, Go, PHP, Ruby, Kotlin, Swift, React Native, and Flutter.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Adaptive, risk-based security controls$q$, $q$Risk signals and adaptive MFA that adjust authentication requirements based on user behavior.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Third-party integrations$q$, $q$Connects with 50+ third-party tools as part of its identity orchestration.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Free Forever tier includes 7,500 MAUs, 10 tenants, and 3 SSO connections with no time limit$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$No-code visual Flows builder reduces the need for custom authentication code$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Supports advanced authorization models (RBAC/ReBAC/ABAC) beyond basic login$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Wide SDK/language coverage across web, backend, and mobile frameworks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Purpose-built support for securing AI agents and MCP servers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Paid plans include usage-based MAU overages that can add cost as user base grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$SCIM provisioning and bot protection require the Growth tier or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Enterprise pricing is quote-only and not publicly listed$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Free tier is capped at 10 tenants and 3 SSO connections$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Does Descope offer a free plan?$q$, $q$Yes, its Free Forever plan includes 7,500 MAUs, 10 tenants, and 3 SSO connections at no cost.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$What is Descope Flows?$q$, $q$A visual, drag-and-drop workflow builder for designing authentication and identity journeys without writing custom auth code.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Does Descope support AI agent authentication?$q$, $q$Yes, Descope provides authorization, scope-based access control, and consent and token management for AI agents and MCP servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$What authorization models does Descope support?$q$, $q$Descope supports role-based (RBAC), relationship-based (ReBAC), and attribute-based (ABAC) access control.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$How much does Descope's Pro plan cost?$q$, $q$The Pro plan starts at $249/month (billed annually) and includes 10,000 MAUs and 5 SSO connections.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Customer identity and access management for SaaS apps$q$, $q$Add login, MFA, and identity flows to customer-facing applications using prebuilt auth methods.$q$, $q$SaaS product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$B2B multi-tenant authentication$q$, $q$Manage delegated admin, SSO, and per-tenant configuration for business customers.$q$, $q$B2B software companies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Securing AI agents and MCP servers$q$, $q$Apply authorization, consent, and token management to AI agents accessing internal systems.$q$, $q$AI/ML engineering teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$No-code auth journey design$q$, $q$Build and iterate on login flows visually without hand-coding integrations.$q$, $q$Startups and solo developers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Free Forever$q$, $q$$0$q$, NULL, $q$["7,500 MAUs","10 tenants","3 SSO connections","All auth methods","RBAC","MFA","99% SLA"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Pro$q$, $q$$249/month$q$, $q$annual$q$, $q$["10,000 MAUs","35 tenants","5 SSO connections","Custom domain","Google One Tap","99.99% SLA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Growth$q$, $q$$799/month$q$, $q$annual$q$, $q$["25,000 MAUs","100 tenants","10 SSO connections","Unlimited federated apps","Bot protection","SCIM provisioning","Fine-grained authorization"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$Enterprise$q$, NULL, NULL, $q$["Everything in Growth","Tiered discounts","Dedicated customer success engineer","Unlimited test users and anonymous users"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$overview$q$, $q$What is Descope?$q$, 2, ARRAY[$q$Descope is a customer identity and access management (CIAM) platform for building authentication, authorization, and identity workflows.$q$, $q$Its Descope Flows builder lets teams design login journeys visually, while its authorization layer supports RBAC, ReBAC, and ABAC models. Descope also markets specific support for securing AI agents and MCP servers, including scope-based access control, consent management, and token management.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', $q$who-its-for$q$, $q$Who Descope is for$q$, 2, ARRAY[$q$Descope suits engineering teams building customer-facing or B2B applications that need flexible authentication and multi-tenant access control, from solo developers on its free tier to enterprises needing SCIM provisioning and dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f510c6a5-cbc9-401c-86fa-13a9b3bcc298', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Kinde ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kinde is a developer platform that combines authentication, user management, feature flags, and billing to help teams build and monetize SaaS products.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Kinde combines auth, B2B org management, feature flags, and built-in subscription billing on one platform, with a free plan up to 10,500 MAU.$q$,
  og_description = $q$Kinde combines auth, B2B org management, feature flags, and built-in subscription billing on one platform, with a free plan up to 10,500 MAU.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c0d7e15c-04f7-4a2d-9419-58dab06d3af3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c0d7e15c-04f7-4a2d-9419-58dab06d3af3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Authentication and MFA$q$, $q$Login, multi-factor authentication, and custom domain support for user-facing auth flows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$User management and organizations$q$, $q$Multi-tenant organization support for B2B products, including roles and permissions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Feature flags$q$, $q$Control feature rollout without redeploying code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Built-in billing and monetization$q$, $q$Subscription billing tied directly to user authentication and access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Access management$q$, $q$Roles, permissions, and API scopes to control what authenticated users can do.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Extensive SDK support$q$, $q$SDKs for .NET, Java, Node.js, Python, Ruby, PHP, Elixir, React, JavaScript, iOS, Android, Flutter, and React Native.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Enterprise SSO and SCIM$q$, $q$Unlimited enterprise SSO from the Plus plan, with SCIM provisioning on the Scale plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Custom branding and domains$q$, $q$Customize the look of authentication pages and use custom domains.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Free plan supports up to 10,500 MAU with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Built-in billing/monetization reduces need for a separate billing integration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Transparent, publicly listed pricing across all four tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Free MAU for users on paid billing subscriptions$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Broad SDK coverage across backend, frontend, and mobile frameworks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Transaction fees (0.5%-0.7%) apply on top of subscription cost when using billing features$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Enterprise SSO only available starting on the $75/month Plus plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$SCIM provisioning requires the top-tier $250/month Scale plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Environment counts are capped even on paid plans (e.g., 6 on Plus, 11 on Scale)$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Does Kinde have a free plan?$q$, $q$Yes, the Free plan supports up to 10,500 MAU with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$How much does Kinde cost?$q$, $q$Plans range from Free ($0) to Pro ($25/month), Plus ($75/month), and Scale ($250/month), all billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Does Kinde charge transaction fees?$q$, $q$Yes, Kinde charges a transaction fee on billing plans that decreases from 0.7% on Free/Pro to 0.5% on Scale.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Does Kinde support enterprise SSO?$q$, $q$Yes, unlimited enterprise SSO is included starting on the Plus plan ($75/month).$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$What SDKs does Kinde support?$q$, $q$Kinde provides SDKs for .NET, Java, Node.js, Python, Ruby, PHP, Elixir, React, JavaScript, iOS, Android, Flutter, and React Native.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Auth and billing for SaaS startups$q$, $q$Combine login and subscription billing in a single platform instead of stitching together separate tools.$q$, $q$Early-stage SaaS founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$B2B organization management$q$, $q$Manage multi-tenant organizations with roles and permissions for business customers.$q$, $q$B2B software teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Feature flag rollouts$q$, $q$Control feature releases and gradual rollouts without redeploying code.$q$, $q$Product and engineering teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Enterprise-ready authentication$q$, $q$Add SSO, SCIM provisioning, and compliance reporting to sell to larger customers.$q$, $q$Companies selling to enterprise buyers$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["10,500 MAU","2 custom roles","10 permissions","10 feature flags","Basic authentication","MFA","B2B management","Custom domain support","0.7% transaction fee"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Pro$q$, $q$$25/month$q$, $q$monthly$q$, $q$["Everything in Free","Unlimited MAU","Unlimited webhooks","Unlimited roles/permissions","API keys","Google Analytics integration","SOC 2 attestation report","0.7% transaction fee"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Plus$q$, $q$$75/month$q$, $q$monthly$q$, $q$["Pro features","Unlimited enterprise SSO","6 environments","API scopes","Advanced security features","Hotjar integration","Workflow preview mode","0.6% transaction fee"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$Scale$q$, $q$$250/month$q$, $q$monthly$q$, $q$["All Plus features","11 environments","Custom domains and email senders per organization","SCIM provisioning","ISO 27001 compliance reports","0.5% transaction fee"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$overview$q$, $q$What is Kinde?$q$, 2, ARRAY[$q$Kinde is a developer platform that bundles authentication, user management, feature flags, and billing into one product for building and monetizing SaaS applications.$q$, $q$It offers a free plan for up to 10,500 monthly active users, with paid tiers adding unlimited MAU, enterprise SSO, SCIM provisioning, and compliance reporting as needs grow.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', $q$who-its-for$q$, $q$Who Kinde is for$q$, 2, ARRAY[$q$Kinde suits SaaS teams that want authentication, B2B organization management, and subscription billing handled by a single platform rather than integrating separate auth and billing providers, scaling from free-tier startups to enterprise customers needing SSO and SCIM.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c0d7e15c-04f7-4a2d-9419-58dab06d3af3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Clerk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Clerk is a full-stack authentication and user management platform with prebuilt UI components for React, Next.js, and other frameworks.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Clerk offers prebuilt auth UI, B2B organizations, and billing for developers. Free up to 50,000 MAU; Pro plans start at $25/month.$q$,
  og_description = $q$Clerk offers prebuilt auth UI, B2B organizations, and billing for developers. Free up to 50,000 MAU; Pro plans start at $25/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '84902cee-488e-4583-aad3-f2fbf318cb9e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '84902cee-488e-4583-aad3-f2fbf318cb9e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Prebuilt UI components$q$, $q$Drop-in sign-up, sign-in, user profile, and waitlist components that can be embedded without building custom auth screens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$B2B organizations$q$, $q$Multi-tenant organization support with custom roles, auto-join, and invitations for B2B SaaS products.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Billing integration$q$, $q$Built-in subscription management and plan-based content gating tied directly to user accounts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Security controls$q$, $q$Multi-factor authentication, bot detection, fraud detection, and managed session handling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Multiple sign-on methods$q$, $q$Supports social sign-on, magic links, passwords, SMS, and API keys.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Broad framework support$q$, $q$SDKs for Next.js, React, React Router, TanStack React Start, Astro, and Expo for mobile.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Generous free tier covering 50,000 monthly active users and 100 organizations with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Prebuilt, customizable UI components reduce time spent building auth screens$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$First-class B2B multi-tenancy via the Organizations feature$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Wide framework and platform support including mobile via Expo$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Enterprise SSO connections are billed separately at $75/month each on the Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Billing add-on charges 0.7% of processed billing volume on top of the base plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Enterprise-tier features require a custom, annual-only contract$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Does Clerk have a free plan?$q$, $q$Yes. The Hobby plan is free for up to 50,000 monthly active users and 100 monthly active organizations, with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$What frameworks does Clerk support?$q$, $q$Clerk provides SDKs for Next.js, React, React Router, TanStack React Start, Astro, and Expo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$How much does Clerk cost after the free tier?$q$, $q$The Pro plan starts at $25/month ($20/month billed annually), and the Business plan starts at $300/month ($250/month billed annually).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Does Clerk support B2B multi-tenancy?$q$, $q$Yes, through its Organizations feature, which includes custom roles, auto-join, and invitations.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Is enterprise SSO available on Clerk?$q$, $q$Yes, enterprise connections can be added to the Pro plan at $75/month each, or included via the Business and Enterprise plans.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$B2C SaaS authentication$q$, $q$Add sign-up, sign-in, and session management to a consumer-facing application without building auth from scratch.$q$, $q$Startups and indie developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$B2B multi-tenant apps$q$, $q$Manage organizations, roles, and invitations for products serving multiple companies from one codebase.$q$, $q$B2B SaaS teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Enterprise-ready applications$q$, $q$Add SAML/SSO connections, SOC2 reporting, and priority support for larger customer deployments.$q$, $q$Scaling companies with enterprise customers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Hobby$q$, $q$$0/month$q$, $q$monthly$q$, $q$["50,000 monthly active users","Up to 3 dashboard seats","Unlimited applications","Basic auth APIs","Custom domains","1-day log retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Pro$q$, $q$$25/month ($20/month annually)$q$, $q$monthly$q$, $q$["50,000 MRUs included, $0.02/mo overage","Branding removal","MFA","Enterprise connections at $75/month each","Custom sessions","7-day log retention","SMS authentication"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Business$q$, $q$$300/month ($250/month annually)$q$, $q$monthly$q$, $q$["10 included dashboard seats","SOC2 reporting","Enhanced dashboard roles","Priority support","30-day log retention"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom MRU allowance","99.99% uptime SLA","Dedicated Slack support","HIPAA/BAA compliance","Custom log retention","Migration support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$overview$q$, $q$What is Clerk?$q$, 2, ARRAY[$q$Clerk is a full-stack user management and authentication platform that provides prebuilt UI components for sign-up, sign-in, user profiles, and organization management.$q$, $q$Beyond core authentication, Clerk offers B2B multi-tenancy tools, subscription billing integration, and security features like MFA and bot detection, with SDKs for Next.js, React, and other popular frameworks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', $q$who-its-for$q$, $q$Who Clerk is for$q$, 2, ARRAY[$q$Clerk suits developers and teams building B2C or B2B web applications who want to avoid building authentication and user management infrastructure from scratch, from early-stage startups on the free tier through to enterprises needing SSO and compliance features.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84902cee-488e-4583-aad3-f2fbf318cb9e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Logto ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Logto is an open-source authentication platform offering passwordless login, enterprise SSO, RBAC, and multi-tenancy for SaaS and AI applications.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$24/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Logto provides open-source identity infrastructure with passwordless auth, enterprise SSO, and RBAC. Free up to 50,000 MAU; Pro starts at $24/month.$q$,
  og_description = $q$Logto provides open-source identity infrastructure with passwordless auth, enterprise SSO, and RBAC. Free up to 50,000 MAU; Pro starts at $24/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e0668898-096e-49d0-a80e-31cce8d69397';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e0668898-096e-49d0-a80e-31cce8d69397' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Passwordless and social sign-in$q$, $q$Email/SMS passwordless login alongside social sign-in and traditional password authentication.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Multi-factor authentication$q$, $q$WebAuthn, authenticator apps, and backup codes for additional login security.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Enterprise SSO$q$, $q$SAML and OIDC-based single sign-on for enterprise customers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Role-based access control and multi-tenancy$q$, $q$Organizations feature supports multi-tenant apps with role-based permissions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Machine-to-machine authentication$q$, $q$Supports service-to-service auth flows alongside user-facing sign-in.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Protected App (no-code)$q$, $q$A no-code option to add authentication in front of an existing app without SDK integration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Open source and self-hostable$q$, $q$Full source is available, and Logto can be self-hosted instead of using the managed cloud.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Free tier includes 50,000 monthly active users with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Open-source with a self-hosting option for teams wanting full control over their identity infrastructure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Enterprise SSO (SAML/OIDC) is included on the $24/month Pro plan rather than gated behind a custom Enterprise tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Supports 20+ frameworks including Next.js, React, Vue, Angular, Go, Swift, and Python$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Token usage beyond the included free allotment is billed per use ($0.08 per 100 extra tokens on Pro)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Pro plan audit log retention is limited to 14 days$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Custom data regions, private cloud, and premium support require contacting sales for Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Is Logto free to use?$q$, $q$Yes, the Free plan supports up to 50,000 monthly active users with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Does Logto support enterprise SSO?$q$, $q$Yes, SAML and OIDC-based enterprise SSO is included on the $24/month Pro plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Can Logto be self-hosted?$q$, $q$Yes, Logto is open source and can be self-hosted instead of using the managed cloud service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$What is Logto's Pro plan price?$q$, $q$The Pro plan costs $24/month and includes unlimited MAU, RBAC, organizations, MFA, and enterprise SSO.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Does Logto support multi-tenancy?$q$, $q$Yes, through its Organizations feature, which is available on the Pro plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$SaaS multi-tenant authentication$q$, $q$Add organizations, RBAC, and multi-tenant user management to a SaaS product.$q$, $q$SaaS product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Enterprise SSO compliance$q$, $q$Offer SAML/OIDC single sign-on to enterprise customers without building it in-house.$q$, $q$B2B software vendors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Self-hosted identity infrastructure$q$, $q$Run Logto on private infrastructure for full data control and compliance requirements.$q$, $q$Regulated or security-conscious organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Up to 50,000 MAU","50K tokens","1 machine-to-machine app","3 applications","1 webhook","3-day audit log retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Pro$q$, $q$$24/month$q$, $q$monthly$q$, $q$["Unlimited MAU","Unlimited applications","RBAC","Organizations (multi-tenancy)","MFA","Enterprise SSO (SAML/OIDC)","10 webhooks","14-day audit log retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom resource quota","Custom data region","Logto Private Cloud","SLA","Premium support","Migration support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$overview$q$, $q$What is Logto?$q$, 2, ARRAY[$q$Logto is an open-source authentication and identity infrastructure platform aimed at simplifying identity management for SaaS and AI applications.$q$, $q$It offers passwordless login, social sign-in, MFA, enterprise SSO, role-based access control, and multi-tenancy, with SDKs for 20+ frameworks and the option to self-host.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', $q$who-its-for$q$, $q$Who Logto is for$q$, 2, ARRAY[$q$Logto is suited to developers building SaaS or B2B products who need multi-tenancy and enterprise SSO, as well as teams that prefer an open-source, self-hostable identity platform over a fully closed managed service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e0668898-096e-49d0-a80e-31cce8d69397', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Hanko ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hanko is an open-source, passkey-first authentication platform offering cloud, private cloud, and self-hosted deployment options.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hanko offers open-source, passkey-first authentication with a free 10,000 MAU tier and paid plans from $29/month.$q$,
  og_description = $q$Hanko offers open-source, passkey-first authentication with a free 10,000 MAU tier and paid plans from $29/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd7124bf7-efbe-423b-8a94-15a5db73d353';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd7124bf7-efbe-423b-8a94-15a5db73d353' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Passkey-based authentication$q$, $q$FIDO2-certified passwordless login using passkeys as the primary sign-in method.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Passwords and passcodes$q$, $q$Traditional password and one-time passcode login options alongside passkeys.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Multi-factor authentication$q$, $q$MFA support via security keys and authenticator apps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Social login$q$, $q$Sign-in with Google as a social login option.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Hanko Elements$q$, $q$Customizable Web Components for building auth UI without starting from scratch.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Flexible hosting$q$, $q$Available as managed cloud, managed private cloud, or fully self-hosted deployment.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Free Starter plan includes 10,000 monthly active users and 2 projects at no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Passkey-first design reduces reliance on passwords$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Deployment flexibility across cloud, private cloud, and self-hosted options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Startup program can offer up to one million free monthly active users for qualifying startups$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$SAML SSO is a paid add-on at $49/month per connection, even on the Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Extended audit log retention and admin dashboard SSO require the custom-priced Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Community support is the only support option on the free Starter plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Does Hanko have a free plan?$q$, $q$Yes, the Starter plan is free and includes 10,000 monthly active users and 2 projects.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$What is Hanko's main authentication method?$q$, $q$Hanko is built around FIDO2-certified passkey authentication, alongside passwords, passcodes, and social login.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Can Hanko be self-hosted?$q$, $q$Yes, Hanko supports self-hosted deployment in addition to managed cloud and private cloud options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$How much does Hanko's Pro plan cost?$q$, $q$The Pro plan costs $29/month plus $0.01 per monthly active user over 10,000.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Does Hanko offer a startup discount?$q$, $q$Yes, qualifying startups can get up to one million monthly active users for free under Hanko's startup offering.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Passwordless consumer apps$q$, $q$Replace password login with passkeys to reduce account takeover risk and login friction.$q$, $q$Web and mobile app developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Self-hosted authentication$q$, $q$Run Hanko on private infrastructure for full control over user data and compliance.$q$, $q$Privacy-conscious or regulated teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Startup authentication at scale$q$, $q$Use the startup program to get generous free MAU while scaling a new product.$q$, $q$Early-stage startups$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Starter$q$, $q$Free$q$, NULL, $q$["10,000 free monthly active users","2 projects","Passkeys, passwords, passwordless","Social SSO","Multi-factor authentication","Custom domain","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Pro$q$, $q$$29/month + $0.01 per MAU over 10,000$q$, $q$monthly$q$, $q$["5 projects","Personal support (Email, Slack)","Team member invites","Webhooks","Admin API","Custom SMTP","SAML SSO at $49/month per connection"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited projects","99.99% uptime SLA","Priority support","Admin dashboard SSO","Extended audit log retention","Commercial license option","Private Cloud"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$overview$q$, $q$What is Hanko?$q$, 2, ARRAY[$q$Hanko is an open-source authentication and user management platform built around passkey login, positioned as an alternative to services like Auth0, Clerk, Firebase Auth, and Keycloak.$q$, $q$It supports passwords, passcodes, social login, and MFA alongside passkeys, with customizable UI components and cloud, private cloud, or self-hosted deployment options.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', $q$who-its-for$q$, $q$Who Hanko is for$q$, 2, ARRAY[$q$Hanko fits developers who want a passkey-first, open-source authentication option, particularly teams that value deployment flexibility or want to self-host their identity infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d7124bf7-efbe-423b-8a94-15a5db73d353', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Corbado ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Corbado is a passkey intelligence platform that gives visibility into login journeys and helps drive passkey adoption alongside existing identity providers.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Corbado adds passkey intelligence and login journey observability on top of existing identity providers like Okta, Auth0, and Cognito.$q$,
  og_description = $q$Corbado adds passkey intelligence and login journey observability on top of existing identity providers like Okta, Auth0, and Cognito.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '62db571f-582a-43e0-9f5f-3cf4413ae59a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '62db571f-582a-43e0-9f5f-3cf4413ae59a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Journey reconstruction$q$, $q$Turns scattered client-side login events into a single trusted journey model showing branches, retries, fallbacks, and outcomes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Friction detection$q$, $q$Identifies where users abandon login flows so teams can address drop-off points.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Per-user debugging$q$, $q$Lets teams inspect specific failed authentication attempts at the individual user level.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Passkey intelligence controls$q$, $q$Manages passkey rollout and routes users through the appropriate authentication path.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Authentication analytics$q$, $q$Tracks adoption rates, recovery load, and completion metrics across authentication methods.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Non-invasive IDP compatibility$q$, $q$Works alongside existing identity providers such as Okta, Auth0, Ping Identity, Cognito, and Entra without replacing them.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Operates as a non-invasive layer on top of existing identity providers rather than requiring migration$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Compatible with 20+ CIAM systems including Okta, Auth0, Ping Identity, ForgeRock, Cognito, and Entra$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Certified for ISO 27001, SOC 2 Type II, and GDPR compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Integrates with monitoring and analytics tools such as Splunk, Datadog, New Relic, Amplitude, and Mixpanel$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Pricing is not published; both Observe and Connect plans require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Reported adoption metrics (e.g., mobile activation gains) come from specific case studies and may not generalize to every deployment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Focused specifically on passkey/login analytics rather than being a full identity provider replacement$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$What does Corbado do?$q$, $q$Corbado provides visibility into login journeys, helping teams detect friction and increase passkey adoption alongside their existing identity provider.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Does Corbado replace my identity provider?$q$, $q$No, Corbado's Observe product works as a non-invasive layer on top of existing IDPs such as Okta, Auth0, and Cognito; Connect offers managed passkeys.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$How much does Corbado cost?$q$, $q$Corbado does not publish fixed pricing; both the Observe and Connect plans require contacting the company for a custom quote.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Is Corbado compliant with security standards?$q$, $q$Yes, Corbado states it is ISO 27001, SOC 2 Type II, and GDPR compliant.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Passkey rollout analytics$q$, $q$Track passkey adoption and recovery load while rolling out passwordless login.$q$, $q$Identity and IAM teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Checkout conversion optimization$q$, $q$Reduce login friction that causes drop-off during checkout or sign-in flows.$q$, $q$Product managers and growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$Managed passkey deployment$q$, $q$Use Corbado Connect to add managed passkey sign-up and sign-in without building the infrastructure in-house.$q$, $q$Enterprises scaling passwordless authentication$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$overview$q$, $q$What is Corbado?$q$, 2, ARRAY[$q$Corbado is an authentication intelligence platform that reconstructs login journeys to show where users encounter friction or abandon sign-in flows.$q$, $q$It offers two products: Corbado Observe, a read-only observability layer, and Corbado Connect, which adds managed passkey sign-up and sign-in, both designed to work alongside existing identity providers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', $q$who-its-for$q$, $q$Who Corbado is for$q$, 2, ARRAY[$q$Corbado is aimed at identity/IAM teams, product managers, and security or support teams at organizations that already use an identity provider but want deeper visibility into login friction and passkey adoption.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62db571f-582a-43e0-9f5f-3cf4413ae59a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Frontegg ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Frontegg is a customer identity and access management platform offering hosted login, enterprise SSO, and usage-based pricing.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Frontegg provides low-code customer identity management with hosted login and enterprise SSO, with a free tier for up to 7,500 MAU.$q$,
  og_description = $q$Frontegg provides low-code customer identity management with hosted login and enterprise SSO, with a free tier for up to 7,500 MAU.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5eaaad6-9ac2-4633-a29e-68531875f434';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5eaaad6-9ac2-4633-a29e-68531875f434' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Hosted login$q$, $q$Fully customized hosted login pages that can be embedded without building auth screens from scratch.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Enterprise SSO/SCIM connections$q$, $q$Support for SSO and SCIM connections aimed at enterprise customer requirements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Multi-tenant organizations$q$, $q$Unlimited organizations supported for B2B SaaS multi-tenancy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Usage-based pricing calculator$q$, $q$Interactive calculator that prices plans based on monthly active users, SSO connections, and M2M tokens.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Custom domain support$q$, $q$Ability to serve the hosted login experience from a custom domain.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Agentic access layer (Agen.co)$q$, $q$A related offering enabling users to interact with SaaS products through generative AI platforms.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Free Pay-as-you-Go tier includes 7,500 monthly active users and 5 enterprise SSO/SCIM connections$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Custom domain and fully customized hosted login included even on the free tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Usage-based calculator lets teams estimate costs as usage scales$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Enterprise tier adds advanced fraud protection and a 99.99% uptime SLA$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Specific per-unit pricing beyond the free tier is not published; requires using the calculator or contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Enterprise features such as advanced fraud protection and premium support require a custom-priced contract$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Marketing site provides limited detail on specific third-party integrations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Does Frontegg have a free plan?$q$, $q$Yes, the Pay-as-you-Go plan is free and includes 7,500 monthly active users and 5 enterprise SSO/SCIM connections.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$How is Frontegg priced beyond the free tier?$q$, $q$Frontegg uses a usage-based calculator based on monthly active users, enterprise connections, and M2M tokens; exact per-unit rates require contacting sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Does Frontegg support enterprise SSO?$q$, $q$Yes, enterprise SSO/SCIM connections are included starting on the free Pay-as-you-Go plan, with more available on Enterprise.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$What is Agen.co?$q$, $q$Agen.co is Frontegg's related offering that lets users interact with SaaS products through generative AI platforms.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$SaaS customer identity management$q$, $q$Add hosted login, organizations, and SSO to a SaaS product without building identity infrastructure in-house.$q$, $q$SaaS engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Enterprise customer onboarding$q$, $q$Offer SSO/SCIM connections and advanced fraud protection to satisfy enterprise procurement requirements.$q$, $q$B2B software vendors selling to enterprises$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Pay as You Go$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Fully customized hosted login","7,500 monthly active users","5 enterprise connections (SSO/SCIM)","Unlimited organizations","Custom domain"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Pay as You Go","Multiple environments","Advanced fraud protection","99.99% uptime SLA","Premium support"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$overview$q$, $q$What is Frontegg?$q$, 2, ARRAY[$q$Frontegg is a customer identity and access management platform that describes itself as the identity layer for every SaaS entry point, offering hosted login, enterprise SSO, and multi-tenant organization support.$q$, $q$Pricing is based on a usage calculator covering monthly active users, enterprise SSO/SCIM connections, and machine-to-machine tokens, with a free tier and a custom-priced Enterprise tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', $q$who-its-for$q$, $q$Who Frontegg is for$q$, 2, ARRAY[$q$Frontegg is aimed at SaaS companies that want to implement customer identity and enterprise SSO without building and maintaining the infrastructure themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5eaaad6-9ac2-4633-a29e-68531875f434', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SlashID ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SlashID is an identity security platform that detects and remediates identity-based threats across human, machine, and AI identities.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SlashID detects identity-based threats across human, machine, and AI identities with 500+ built-in detections mapped to MITRE ATT&CK.$q$,
  og_description = $q$SlashID detects identity-based threats across human, machine, and AI identities with 500+ built-in detections mapped to MITRE ATT&CK.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6d1eff7c-0366-4a72-af49-95cd19369f3b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6d1eff7c-0366-4a72-af49-95cd19369f3b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Identity threat detection$q$, $q$500+ built-in detections mapped to the MITRE ATT&CK framework.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Risk and posture management$q$, $q$Continuous scoring of identities across exposure and entitlements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Access reviews and governance$q$, $q$Automated certification campaigns and compliance workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Browser extension$q$, $q$Edge-level phishing detection, shadow SaaS discovery, and session hijacking prevention.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Remediation automation$q$, $q$One-click enforcement of MFA, user suspension, or credential rotation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Broad integrations$q$, $q$100+ integrations across cloud providers, SaaS apps, databases, and identity providers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Covers human, machine, and AI identities under one system of record$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$500+ built-in detections mapped to the MITRE ATT&CK framework$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Sub-1-second detection-to-remediation capability claimed$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$SOC 2 Type II certified and supports compliance workflows for SOC 2, ISO 27001, PCI DSS, HIPAA, and GDPR$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$No public pricing is available; the site directs visitors to request a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Aimed at organizations with hybrid/multi-cloud complexity, which may be more than smaller teams need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Specific implementation and onboarding details are not published on the marketing site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$What does SlashID do?$q$, $q$SlashID detects and helps remediate identity-based breach attacks across human, machine, and AI identities.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$How many integrations does SlashID support?$q$, $q$SlashID states it supports 100+ integrations across cloud providers, SaaS applications, databases, and identity providers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Is SlashID pricing public?$q$, $q$No, SlashID does not publish pricing; the site directs visitors to request a demo.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$What compliance standards does SlashID support?$q$, $q$SlashID is SOC 2 Type II certified and supports compliance workflows for SOC 2, ISO 27001, PCI DSS, HIPAA, and GDPR.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Identity threat detection$q$, $q$Detect account takeover, credential misuse, and identity-based attacks across an organization.$q$, $q$Security operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Access governance and compliance$q$, $q$Run automated access review campaigns to satisfy compliance requirements.$q$, $q$Compliance and IT governance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$Multi-cloud identity risk management$q$, $q$Score and manage identity risk and entitlements across hybrid and multi-cloud environments.$q$, $q$Security leaders at mid-size to large organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$overview$q$, $q$What is SlashID?$q$, 2, ARRAY[$q$SlashID is an identity security platform positioned as one system of record for human, machine, and AI identities, offering detection, governance, and audit capabilities.$q$, $q$It includes 500+ built-in threat detections mapped to MITRE ATT&CK, risk and posture scoring, automated access reviews, and a browser extension for phishing and session-hijacking detection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', $q$who-its-for$q$, $q$Who SlashID is for$q$, 2, ARRAY[$q$SlashID targets security leaders and teams managing identity risk across hybrid and multi-cloud environments that need to meet compliance requirements such as SOC 2, ISO 27001, PCI DSS, HIPAA, or GDPR.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d1eff7c-0366-4a72-af49-95cd19369f3b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Scalekit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Scalekit provides authentication and authorization for AI agents, handling delegated OAuth, token management, and SaaS auth from one platform.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Scalekit handles delegated OAuth and auth for AI agents with 500+ connectors, plus SaaS SSO and RBAC. Free tier, then $99/month.$q$,
  og_description = $q$Scalekit handles delegated OAuth and auth for AI agents with 500+ connectors, plus SaaS SSO and RBAC. Free tier, then $99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f089f3d0-931d-41ab-b83c-765e387a247e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f089f3d0-931d-41ab-b83c-765e387a247e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Agentkit delegated OAuth$q$, $q$Handles delegated OAuth flows and token management with an AES-256 encrypted token vault so agents can act on behalf of users.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$500+ pre-built connectors$q$, $q$Ready-made connectors across productivity, CRM, project management, and data tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Scoped per-tool-call permissions$q$, $q$Permissions are scoped per tool call rather than per agent, with full attribution logging for every action.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Auth for SaaS$q$, $q$User and organization management, RBAC, and SSO with SAML/OIDC support for SaaS applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Auth for MCP$q$, $q$OAuth 2.1 support for Model Context Protocol servers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Agent Gateway (early access)$q$, $q$A deployment control plane for managing internal agent teams and connector catalogs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Native AI framework integrations$q$, $q$Integrations with Anthropic Claude, OpenAI, LangChain, Google ADK, Vercel AI, and Mastra.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Free tier includes 5,000 tool calls per month with unlimited connected accounts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$500+ pre-built connectors reduce the work of integrating agents with common SaaS tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Native integrations with major AI agent frameworks including Claude, OpenAI, and LangChain$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$SOC 2 and ISO 27001 certified with multi-region (US/EU) deployment$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Free plan auto-upgrades to the paid Growth tier after exceeding 5,000 monthly tool calls$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$EU data residency is a paid add-on (+$99/month) on the Growth plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$VPC/on-premises deployment and forward-deployed engineer support require custom Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Does Scalekit have a free plan?$q$, $q$Yes, the Free plan includes 5,000 tool calls per month with unlimited connected accounts and 500+ pre-built connectors.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$How much does Scalekit's Growth plan cost?$q$, $q$The Growth plan costs $99/month and includes 100,000 tool calls per month, with $0.50 per 1,000 in overage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$What happens if I exceed the free tool call limit?$q$, $q$The Free plan auto-upgrades to the paid Growth plan after exceeding 5,000 monthly tool calls.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Does Scalekit support AI agent frameworks?$q$, $q$Yes, Scalekit offers native integrations with Anthropic Claude, OpenAI, LangChain, Google ADK, Vercel AI, and Mastra.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Where is Scalekit based?$q$, $q$Scalekit is based in San Francisco, CA.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$AI agent tool access$q$, $q$Let AI agents securely act on behalf of users across 500+ connected tools using delegated OAuth.$q$, $q$AI agent developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$SaaS authentication and SSO$q$, $q$Add user management, RBAC, and SAML/OIDC SSO to a SaaS product.$q$, $q$SaaS engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Internal agent deployment governance$q$, $q$Manage and approve connector catalogs for internal AI agent teams via the Agent Gateway.$q$, $q$Enterprises deploying internal AI agents$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["5,000 tool calls/month","Unlimited connected accounts","500+ pre-built connectors","Bring your own credentials","Community + email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Growth$q$, $q$$99/month$q$, $q$monthly$q$, $q$["100,000 tool calls/month included, $0.50 per 1K overage","Custom connectors & API proxy","Customization & branding","Private Slack support","EU data residency (+$99/month add-on)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Negotiated volume tool call rates","VPC/on-premises deployment","99.99% uptime SLA","Forward-deployed engineer + CSM","SIEM integrations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$overview$q$, $q$What is Scalekit?$q$, 2, ARRAY[$q$Scalekit is an authentication and authorization platform built specifically for AI agents, handling OAuth flows, token management, and credential storage so agents can act on behalf of users without shared service accounts.$q$, $q$Alongside Agentkit for agent authentication, Scalekit also offers Auth for SaaS (user management, RBAC, SSO) and Auth for MCP (OAuth 2.1 for Model Context Protocol servers).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', $q$who-its-for$q$, $q$Who Scalekit is for$q$, 2, ARRAY[$q$Scalekit is built for AI agent developers, SaaS companies adding agent features, and enterprises deploying internal AI agents that need secure, scoped access to external tools and systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f089f3d0-931d-41ab-b83c-765e387a247e', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── PropelAuth ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$PropelAuth is a B2B authentication platform providing multi-tenant organizations, RBAC, and enterprise SSO with prebuilt UI components.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$150/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$PropelAuth offers B2B authentication with organizations, RBAC, and enterprise SSO. Free up to 10,000 MAU; Growth plan starts at $150/month.$q$,
  og_description = $q$PropelAuth offers B2B authentication with organizations, RBAC, and enterprise SSO. Free up to 10,000 MAU; Growth plan starts at $150/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '789f97be-c510-457a-8f6f-591187e6b959';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '789f97be-c510-457a-8f6f-591187e6b959' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Prebuilt UI components$q$, $q$Customizable component library for rapid deployment of auth screens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Organization management$q$, $q$First-class support for organizations, built for multi-tenant B2B products.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Role-based access control$q$, $q$Custom roles and permissions for managing what users can access.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Enterprise SSO$q$, $q$Self-service SAML, OIDC, and SCIM setup for enterprise customers.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$MCP server authentication$q$, $q$OAuth 2.1 flows and token revocation for Model Context Protocol servers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$User management dashboard$q$, $q$Includes impersonation capabilities and audit logs.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$API key authentication$q$, $q$API key issuance with rate limiting for machine access.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Free plan includes 10,000 monthly active users with unlimited organizations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Self-service SAML/SSO setup reduces integration overhead for enterprise customers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Supports MCP authentication for AI-agent use cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Broad framework and language support including React, Next.js, FastAPI, Flask, .NET, Spring Boot, and Go$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$SCIM/directory sync requires the $500/month Growth Plus plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Additional charges apply for extra MAUs ($0.05/user), SCIM connections ($100 each), and audit log export ($50/connection)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Advanced security options are gated behind the higher-priced Growth Plus tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Does PropelAuth have a free plan?$q$, $q$Yes, the Free plan includes 10,000 monthly active users, unlimited organizations, 2FA, and RBAC.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$How much does PropelAuth's Growth plan cost?$q$, $q$The Growth plan costs $150/month and adds user impersonation, unlimited SAML/enterprise SSO, and MCP authentication.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Does PropelAuth support SCIM?$q$, $q$Yes, SCIM/directory sync is available on the $500/month Growth Plus plan, with additional per-connection charges.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Can PropelAuth authenticate MCP servers?$q$, $q$Yes, PropelAuth supports MCP server authentication on its Growth plan and above.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$What frameworks does PropelAuth support?$q$, $q$PropelAuth supports React, Next.js, FastAPI, Flask, .NET, Spring Boot, Remix, Axum, Go, Laravel, and others.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$B2B SaaS authentication$q$, $q$Add multi-tenant organizations and role-based access control to a B2B product.$q$, $q$B2B SaaS startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Enterprise SSO and SCIM onboarding$q$, $q$Offer self-service SAML/SSO and SCIM directory sync to satisfy enterprise procurement requirements.$q$, $q$Scaling B2B companies selling to enterprises$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$AI-native application auth$q$, $q$Authenticate MCP servers and AI-native products using OAuth 2.1.$q$, $q$AI-native companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10,000 MAUs","Unlimited organizations","Waitlist users","Custom domain","2FA & RBAC","Customizable UIs"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Growth$q$, $q$$150/month$q$, $q$monthly$q$, $q$["Everything in Free","User impersonation","Unlimited SAML/enterprise SSO","Separate staging environment","API keys/M2M","MCP authentication"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Growth Plus$q$, $q$$500/month$q$, $q$monthly$q$, $q$["Everything in Growth","SCIM/directory sync","Advanced organization controls","Advanced security options"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Volume discounts","Custom terms","Feature acceleration","Custom SLAs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$overview$q$, $q$What is PropelAuth?$q$, 2, ARRAY[$q$PropelAuth is a B2B authentication platform built around multi-tenant organizations, offering prebuilt UI components, role-based access control, and self-service enterprise SSO/SCIM setup.$q$, $q$It also supports MCP server authentication via OAuth 2.1, positioning itself for AI-native companies alongside traditional B2B SaaS products.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', $q$who-its-for$q$, $q$Who PropelAuth is for$q$, 2, ARRAY[$q$PropelAuth is aimed at B2B SaaS companies at any growth stage, from pre-launch startups using the free tier to scaling companies that need enterprise SSO, SCIM, and advanced organization controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('789f97be-c510-457a-8f6f-591187e6b959', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Casdoor ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Casdoor is an open-source identity and access management platform supporting OAuth, OIDC, SAML, LDAP, and an MCP server for AI-agent management.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Casdoor is an open-source IAM and SSO platform with OAuth, OIDC, SAML, LDAP support, and a built-in MCP server for AI-agent management.$q$,
  og_description = $q$Casdoor is an open-source IAM and SSO platform with OAuth, OIDC, SAML, LDAP support, and a built-in MCP server for AI-agent management.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '698be4be-d4e5-4e9b-8413-12a637e83e7c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '698be4be-d4e5-4e9b-8413-12a637e83e7c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Multi-protocol IAM$q$, $q$Supports OAuth 2.0, OIDC, SAML, CAS, LDAP, WebAuthn, and MFA.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$100+ identity provider integrations$q$, $q$Built-in connectors for social networks and enterprise identity systems such as Google, GitHub, and WeChat.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$MCP server$q$, $q$A built-in Model Context Protocol server that lets AI agents manage Casdoor through natural language.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$OAuth 2.1 with Dynamic Client Registration$q$, $q$Includes per-tool permissions designed for agent-based access.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Built-in SaaS billing$q$, $q$Plans, pricing tiers, payment processing, and subscription management features.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$OpenClaw integration$q$, $q$LLM agent protection with audit trails via OpenTelemetry.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Open source and self-hostable$q$, $q$Fully open-source project that can be self-hosted.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Fully open source and self-hostable at no license cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Very broad protocol support including OAuth2, OIDC, SAML, CAS, LDAP, and WebAuthn$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$100+ built-in identity provider connectors$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Native MCP server lets AI coding assistants like Claude Desktop, Cursor, and VS Code Copilot manage Casdoor via natural language$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Used by large organizations including Intel, VMware Harbor, Docker, and Cisco$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$No published pricing or SLA for any managed/commercial offering; self-hosting requires operational effort$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Documentation and setup are aimed at a technical/developer audience$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$As a broad multi-protocol platform, initial configuration may require more setup than single-purpose auth tools$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Is Casdoor free?$q$, $q$Yes, Casdoor is an open-source project and is free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$What protocols does Casdoor support?$q$, $q$Casdoor supports OAuth 2.0, OIDC, SAML, CAS, LDAP, WebAuthn, and MFA.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Does Casdoor support AI agent management?$q$, $q$Yes, Casdoor includes a built-in MCP server that lets AI agents like Claude Desktop, Cursor, and VS Code Copilot manage it through natural language.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Who uses Casdoor?$q$, $q$Casdoor lists notable users including Intel, VMware Harbor, Docker, Cisco, Microsoft, Alibaba, and Tencent.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Self-hosted enterprise IAM$q$, $q$Run a full-featured identity and SSO platform on private infrastructure.$q$, $q$Enterprises and platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$AI-agent-manageable authentication$q$, $q$Let AI coding assistants configure and manage identity settings via the built-in MCP server.$q$, $q$Developer teams using AI coding tools$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$Multi-protocol SSO$q$, $q$Consolidate OAuth, OIDC, SAML, CAS, and LDAP-based sign-in under one platform.$q$, $q$Organizations with mixed legacy and modern identity systems$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$overview$q$, $q$What is Casdoor?$q$, 2, ARRAY[$q$Casdoor is an open-source identity and access management (IAM) and single sign-on (SSO) platform supporting OAuth 2.0, OIDC, SAML, CAS, LDAP, WebAuthn, and MFA, along with 100+ identity provider integrations.$q$, $q$It includes a built-in MCP server that lets AI agents and coding assistants such as Claude Desktop, Cursor, and VS Code with GitHub Copilot manage Casdoor configuration through natural language, plus OpenClaw integration for LLM agent protection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', $q$who-its-for$q$, $q$Who Casdoor is for$q$, 2, ARRAY[$q$Casdoor is built for enterprise teams, SaaS platforms, and startups that want a self-hosted, open-source identity platform with broad protocol support and AI-agent manageability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('698be4be-d4e5-4e9b-8413-12a637e83e7c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── OpenSign ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OpenSign is an open-source PDF e-signature platform offering unlimited free signatures with an option to self-host.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenSign is an open-source e-signature tool with unlimited free signing, document vault storage, and self-hosting options.$q$,
  og_description = $q$OpenSign is an open-source e-signature tool with unlimited free signing, document vault storage, and self-hosting options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8b92e33a-9ce9-4f11-bf8a-c6758fc2237c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8b92e33a-9ce9-4f11-bf8a-c6758fc2237c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Unlimited free e-signatures$q$, $q$Sign documents with no cap on the number of signatures on the free plan.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Multi-user collaboration$q$, $q$Multiple users can collaborate on the same documents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Completion certificates$q$, $q$Signed documents include completion certificates with access logs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$OpenSign Drive$q$, $q$A secure vault for storing and organizing signed and pending documents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Self-hosting option$q$, $q$OpenSign can be self-hosted instead of using the hosted app.opensignlabs.com service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$API access$q$, $q$API available for integrating e-signature workflows into other applications.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Free plan offers unlimited e-signatures with no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Open-source alternative to DocuSign, with source code available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Self-hosting option gives organizations full control over document data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Completion certificates with access logs support audit and compliance needs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Specific paid-tier pricing was not visible on the public pricing page at time of review$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Community support is primarily via Discord rather than dedicated account management$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$As a newer open-source tool, its third-party integration ecosystem may be smaller than established competitors like DocuSign$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Is OpenSign free?$q$, $q$Yes, OpenSign offers a free plan with unlimited e-signatures.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Can OpenSign be self-hosted?$q$, $q$Yes, OpenSign is open source and can be self-hosted instead of using the hosted app.opensignlabs.com service.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Does OpenSign provide proof of signing?$q$, $q$Yes, signed documents include completion certificates with access logs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Is there an API for OpenSign?$q$, $q$Yes, OpenSign provides API access for integrating e-signature workflows into other applications.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Free document signing$q$, $q$Collect e-signatures on contracts and forms without a per-signature cost.$q$, $q$Individuals and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Self-hosted e-signature compliance$q$, $q$Host the e-signature platform on private infrastructure to keep document data in-house.$q$, $q$Organizations with data residency or compliance requirements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$Embedded e-signature workflows$q$, $q$Use the API to add e-signature capability inside another application.$q$, $q$Developers building document workflows$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$overview$q$, $q$What is OpenSign?$q$, 2, ARRAY[$q$OpenSign is an open-source PDF e-signature platform positioned as a free alternative to DocuSign, offering unlimited signatures on its free plan.$q$, $q$It includes multi-user collaboration, completion certificates with access logs, and OpenSign Drive for secure document storage, with both a hosted app and a self-hosting option.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', $q$who-its-for$q$, $q$Who OpenSign is for$q$, 2, ARRAY[$q$OpenSign suits individuals and businesses looking for a free or self-hosted alternative to commercial e-signature tools, especially those who value open-source software and control over document data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8b92e33a-9ce9-4f11-bf8a-c6758fc2237c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


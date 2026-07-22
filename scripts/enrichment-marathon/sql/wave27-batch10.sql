-- Enrichment marathon batch: Tenable, Tenacity, TestingBot, Tettra, TextCortex, Textpattern, Thanos, The Lounge

-- ── Tenable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Tenable is a publicly traded cybersecurity company best known for Nessus, one of the most widely deployed vulnerability scanners, plus a broader exposure management platform called Tenable One.$q$, short_description),
  pricing_model = COALESCE($q$subscription (with a free tier)$q$, pricing_model),
  starting_price = COALESCE($q$Free (Nessus Essentials); Nessus Professional from $4,790/year$q$, starting_price),
  founded_year = COALESCE(2002, founded_year),
  company_size = COALESCE($q$1,001-5,000 employees$q$, company_size),
  headquarters = COALESCE($q$Columbia, Maryland, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Tenable Review 2026: Nessus and Exposure Management Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Tenable is the cybersecurity company behind Nessus. Compare pricing, features, pros and cons of its vulnerability and exposure management platform.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Tenable Holdings, Inc. (NASDAQ: TENB) is a publicly traded cybersecurity company headquartered in Columbia, Maryland. It traces its roots to 2002, when Ron Gula, Jack Huffard, and Renaud Deraison founded Tenable Network Security around Deraison's Nessus vulnerability scanner, first released in 1998. Tenable went public in 2018 and today employs roughly 2,000 people serving tens of thousands of customers, including a majority of the Fortune 500. Its core product line includes Nessus (a standalone vulnerability scanner available as free Nessus Essentials, paid Nessus Professional, and Nessus Expert), Tenable.io for cloud-based vulnerability management, Tenable Cloud Security for cloud infrastructure risk, and Tenable One, its unified exposure management platform that combines asset discovery, vulnerability data, identity risk, and attack path analysis into a single risk score. Pricing ranges from free (Nessus Essentials, limited to 16 IP addresses for personal or educational use) to roughly 4,790 dollars per year for Nessus Professional, with enterprise platform pricing quoted individually. Tenable is best suited for security teams, IT administrators, and MSPs that need to find, prioritize, and remediate vulnerabilities and misconfigurations across on-premises, cloud, container, and identity infrastructure.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus vulnerability scanner$q$, $q$Industry-standard scanner for identifying vulnerabilities, misconfigurations, and missing patches across networks, servers, and endpoints.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Tenable One exposure management$q$, $q$Unified platform that combines vulnerability, cloud, identity, and attack surface data into a single prioritized risk view.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Tenable.io cloud vulnerability management$q$, $q$Cloud-delivered vulnerability management for continuous asset discovery and scanning at scale.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Tenable Cloud Security$q$, $q$Cloud security posture management covering AWS, Azure, and Google Cloud misconfigurations and entitlements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Web application scanning$q$, $q$Automated scanning for OWASP Top 10 and other common web application vulnerabilities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Container security$q$, $q$Scans container images in the build pipeline for vulnerabilities before deployment.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Compliance auditing$q$, $q$Built-in checks against benchmarks such as CIS and regulatory frameworks like PCI DSS and HIPAA.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Attack path analysis$q$, $q$Visualizes how an attacker could chain vulnerabilities and identity misconfigurations to reach critical assets.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus is a mature, widely trusted scanner with an enormous plugin library covering new threats quickly$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Strong compliance and audit checklist support for regulated industries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Scales from a free single-scanner tool up to a full enterprise exposure management platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Large community, extensive documentation, and broad third-party integration support$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus Essentials' 16-IP limit makes it unsuitable for anything beyond small labs or learning$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Full platform pricing (Tenable One, Tenable.io) is not published and can be expensive for smaller organizations$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Scan configuration and tuning has a learning curve for newcomers to vulnerability management$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Some users report scan performance slows on very large or complex networks$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$What is Tenable best known for$q$, $q$Tenable is best known for Nessus, a vulnerability scanner originally created by co-founder Renaud Deraison in 1998 that remains one of the most widely used tools of its kind.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Is Tenable free to use$q$, $q$Tenable offers a free product, Nessus Essentials, limited to scanning 16 IP addresses for personal or educational use. Paid tiers remove that limit and add features.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$How much does Nessus Professional cost$q$, $q$Nessus Professional is priced at approximately 4,790 dollars per year per scanner, based on publicly listed pricing at the time of writing.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Is Tenable a public company$q$, $q$Yes. Tenable Holdings, Inc. trades on the Nasdaq under the ticker TENB and has been publicly listed since 2018.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$What is Tenable One$q$, $q$Tenable One is Tenable's unified exposure management platform that combines vulnerability, cloud, identity, and attack surface data into a single risk view.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Who founded Tenable$q$, $q$Tenable was founded in 2002 by Ron Gula, Jack Huffard, and Renaud Deraison.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Where is Tenable headquartered$q$, $q$Tenable is headquartered in Columbia, Maryland, United States.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Does Tenable support compliance auditing$q$, $q$Yes, Tenable products include checks against benchmarks such as CIS controls and regulations including PCI DSS and HIPAA.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Vulnerability scanning for small IT teams$q$, $q$IT administrators use Nessus Professional to run regular scans of servers and workstations and prioritize patching based on severity.$q$, $q$Small and mid-sized IT and security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Enterprise exposure management$q$, $q$Large security organizations use Tenable One to unify vulnerability, cloud, and identity risk data across thousands of assets into one prioritized view.$q$, $q$Enterprise security operations and CISO teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Compliance and audit preparation$q$, $q$Regulated organizations run Tenable compliance scans ahead of audits to catch misconfigurations against frameworks like PCI DSS.$q$, $q$Compliance and risk management teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus Essentials$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Scans up to 16 IP addresses","Personal, educational, non-commercial use only","Core vulnerability scanning engine","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus Professional$q$, $q$From $4,790/year$q$, $q$annual$q$, NULL, $q$["Unlimited IP scanning per scanner","Compliance and configuration auditing","Live results and expanded reporting","Optional 24/7 phone support add-on"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus Expert$q$, $q$From $6,790/year$q$, $q$annual$q$, NULL, $q$["Everything in Nessus Professional","External attack surface scanning","Cloud infrastructure scanning","Domain and subdomain discovery"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Tenable One / Tenable.io$q$, $q$Custom$q$, $q$annual (quoted)$q$, NULL, $q$["Unified exposure management platform","Cloud, identity, and attack path analysis","Enterprise-scale asset discovery","Dedicated account and support team"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$overview$q$, $q$What Is Tenable$q$, 2, ARRAY[$q$Tenable is a cybersecurity company that builds vulnerability management and exposure management software used by security teams to find, prioritize, and fix weaknesses before attackers can exploit them. Its flagship product, Nessus, is one of the most recognized and widely deployed vulnerability scanners in the industry, used by security professionals, students, and enterprises alike.$q$, $q$Beyond Nessus, Tenable has expanded into a full exposure management platform called Tenable One, which unifies vulnerability data, cloud security posture, identity risk, and attack surface information so security teams can see and reduce risk across an entire organization rather than working from siloed tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Tenable's product suite spans network vulnerability scanning, cloud security posture management, web application scanning, container image scanning, identity exposure, and operational technology security. The underlying plugin library, maintained by Tenable Research, covers hundreds of thousands of known vulnerabilities and misconfigurations across operating systems, applications, and network devices.$q$, $q$Tenable One layers risk-based prioritization and attack path analysis on top of raw scan data, helping teams understand which vulnerabilities actually create exploitable paths to critical assets rather than treating every finding as equally urgent.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Tenable offers a free tier, Nessus Essentials, limited to scanning 16 IP addresses for personal, non-commercial use such as learning and small home labs. Nessus Professional, the standard paid edition for individual practitioners and small teams, is priced at approximately 4,790 dollars per year per scanner with no IP limits. Nessus Expert adds external attack surface and cloud scanning for around 6,790 dollars per year. Larger platform products such as Tenable One and Tenable.io are quoted with custom, usage-based enterprise pricing.$q$]::text[], 2);


-- ── Tenacity ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Tenacity is a free, open-source, privacy-focused multi-track audio editor for Windows, macOS, and Linux, created in 2021 as a community fork of Audacity.$q$, short_description),
  pricing_model = COALESCE($q$open-source / free$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Tenacity: Free Open-Source Audacity Fork Audio Editor$q$, seo_title),
  seo_meta_description = COALESCE($q$Tenacity is a free, privacy-friendly, open-source multi-track audio editor for Windows, macOS, and Linux, forked from Audacity.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Tenacity is a free and open-source, cross-platform, multi-track audio editor and recorder for Windows, macOS, and Linux, developed by a volunteer community rather than a company. It began in 2021 as a fork of Audacity, created after Audacity's new owner, Muse Group, drew criticism over a privacy policy that raised telemetry concerns and a contributor license agreement seen by some as conflicting with Audacity's GPL license. Tenacity rolled back to a pre-controversy Audacity codebase and continued development independently under the GNU General Public License version 2 or later. The project went through a rocky early period, including maintainer burnout after online harassment tied to the project's name, before restarting development in November 2022 when it merged with a similar fork called Saucedacity. Tenacity supports recording from audio devices, import and export of a wide range of audio formats (extensible via FFmpeg), up to 32-bit float audio processing, VST2, LADSPA, LV2, and AU plugin support, Nyquist scripting, and accessibility features such as keyboard-driven editing and screen reader support. It is aimed at podcasters, musicians, students, and anyone who wants an Audacity-like editor without telemetry or corporate ownership concerns. There is no cost to download or use Tenacity.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Multi-track recording and editing$q$, $q$Record from audio input devices and edit multiple tracks on a shared timeline.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Wide format support$q$, $q$Import and export a broad range of audio formats, extendable further with FFmpeg.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$32-bit float audio processing$q$, $q$High-quality audio processing pipeline for professional-grade editing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Plugin support$q$, $q$Compatible with VST2, LADSPA, LV2, and AU audio plugins for effects and processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Nyquist and external scripting$q$, $q$Automate edits with the built-in Nyquist language or external languages via named pipes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$No telemetry by design$q$, $q$Built specifically to avoid the data collection and crash reporting that sparked the original fork.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Native Matroska support$q$, $q$Import, edit, and export Matroska audio and chapter data without needing FFmpeg.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Accessibility features$q$, $q$Keyboard-driven editing and screen reader support for accessible audio production.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Completely free and open source under GPL$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$No telemetry or data collection built into the software$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Cross-platform support for Windows, macOS, and Linux$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Familiar Audacity-style workflow for users switching from Audacity$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Active volunteer community continuing development$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Smaller contributor base than Audacity means slower feature development at times$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Project has had periods of reduced activity and maintainer turnover$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$No official paid support or enterprise service tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Some newer Audacity features may not be present since the fork$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Is Tenacity free$q$, $q$Yes, Tenacity is completely free and open source under the GNU General Public License version 2 or later.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Is Tenacity the same as Audacity$q$, $q$No. Tenacity is a separate, community-run fork of Audacity created in 2021, though it shares much of its original codebase and workflow.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Why was Tenacity created$q$, $q$Tenacity was created after Audacity's new owner, Muse Group, introduced a privacy policy and contributor license agreement that raised telemetry and licensing concerns among users and contributors.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$What platforms does Tenacity support$q$, $q$Tenacity runs on Windows, macOS, and Linux, with community support extending to other platforms such as Haiku.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Does Tenacity support plugins$q$, $q$Yes, it supports VST2, LADSPA, LV2, and AU audio plugins.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Who maintains Tenacity$q$, $q$Tenacity is maintained by a volunteer open-source community rather than a company; there is no official corporate headquarters.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Can I import and export multiple audio formats in Tenacity$q$, $q$Yes, Tenacity supports a wide range of formats and can be extended further with FFmpeg.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Does Tenacity collect user data$q$, $q$No, avoiding telemetry and data collection was a core motivation for the project's creation.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Podcast editing$q$, $q$Podcasters use Tenacity to record, edit, and mix multi-track episodes without paying for software.$q$, $q$Podcasters and content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Music recording and editing$q$, $q$Musicians and hobbyists use Tenacity's multi-track editor and plugin support to record and produce audio.$q$, $q$Musicians and home studio users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Privacy-conscious audio editing$q$, $q$Users who want an Audacity-like tool without telemetry or corporate data collection choose Tenacity as their default editor.$q$, $q$Privacy-focused individuals and open-source advocates$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$Tenacity$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full multi-track audio editing and recording","All plugin and format support","No telemetry or data collection","Community-driven support via forums and chat"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'e22108c9-93fe-4a9c-aba5-89f5de7d0693';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$overview$q$, $q$What Is Tenacity$q$, 2, ARRAY[$q$Tenacity is a free, open-source multi-track audio editor built on the Audacity codebase. It was created in 2021 by volunteer developers who wanted to continue an Audacity-like editor without the telemetry and licensing concerns that arose after Audacity was acquired by Muse Group that year.$q$, $q$Because it is community-run rather than backed by a company, Tenacity has no headquarters, no pricing tiers, and no vendor lock-in. Development happens in the open on Codeberg and GitHub, and anyone can contribute code, translations, or documentation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Tenacity supports multi-track recording and editing, a wide range of import and export audio formats (extendable with FFmpeg), high-quality processing up to 32-bit float, and plugin support for VST2, LADSPA, LV2, and AU formats. It also supports scripting through the built-in Nyquist language as well as external languages via named pipes.$q$, $q$On top of the inherited Audacity feature set, Tenacity has added its own improvements, including modern UI themes, native Matroska (MKA/MKV) import and export without requiring FFmpeg, expanded platform support such as Haiku, and a modernized build system for easier compilation on current operating systems.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Tenacity is completely free to download and use under the GNU General Public License version 2 or later. There are no paid tiers, subscriptions, or in-app purchases, and the source code is publicly available for anyone to inspect, modify, or redistribute.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e22108c9-93fe-4a9c-aba5-89f5de7d0693', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── TestingBot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$TestingBot is a cloud-based cross-browser and mobile app testing platform that runs automated Selenium, Playwright, Cypress, and Appium tests, plus manual live testing, across thousands of real browsers and devices.$q$, short_description),
  pricing_model = COALESCE($q$subscription (with pay-as-you-go credits)$q$, pricing_model),
  starting_price = COALESCE($q$From EUR20/month (Live plan, billed annually)$q$, starting_price),
  founded_year = COALESCE(2011, founded_year),
  company_size = COALESCE($q$1-10 employees$q$, company_size),
  headquarters = COALESCE($q$Belgium$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$TestingBot Review: Cross-Browser Testing Pricing and Features$q$, seo_title),
  seo_meta_description = COALESCE($q$TestingBot offers cloud cross-browser and real-device testing for Selenium, Playwright, Cypress, and Appium. See pricing, features, pros and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$TestingBot is a cloud-based cross-browser and mobile app testing platform founded in 2011 by Jochen Delabie in Belgium, where it remains a small, bootstrapped, self-funded company with a lean team of roughly three to nine people. It gives development and QA teams access to more than 6,100 real desktop browser and physical mobile device combinations for both automated testing (via Selenium, Playwright, Cypress, and Appium) and manual live testing, plus visual regression testing and video or screenshot capture of test runs. TestingBot positions itself as a lower-cost, GDPR-friendly alternative to larger competitors such as BrowserStack and Sauce Labs, hosting its infrastructure in the European Union and typically pricing 30 to 40 percent below those rivals. Its subscription plans include Live (manual testing only), Automated (limited monthly minutes), and Automated Pro (unlimited automated testing minutes), each available in tiers by user count, with plans starting around 20 euros per month billed annually. A pay-as-you-go option and a custom-priced Enterprise plan with SSO are also available. TestingBot suits web and mobile development teams, QA engineers, and agencies that need reliable cross-browser and cross-device coverage without the cost of maintaining an in-house device lab.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b712ecf-94b6-4e1e-a274-928b0f776caa' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$6,100+ real browsers and devices$q$, $q$Access real desktop browsers and physical mobile devices rather than emulators for accurate results.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Selenium, Playwright, Cypress, and Appium support$q$, $q$Run automated tests using the most popular open-source testing frameworks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Live manual testing$q$, $q$Interact directly with a real browser or device in real time for exploratory and manual QA.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Visual regression testing$q$, $q$Automatically detect unintended visual changes between test runs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Video and screenshot capture$q$, $q$Every automated test run is recorded with video and screenshots for debugging.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Local testing tunnel$q$, $q$Test applications running behind firewalls or on localhost via a secure tunnel.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$EU-based data hosting$q$, $q$Infrastructure hosted in the European Union to support GDPR compliance.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Native mobile app testing$q$, $q$Upload and test native iOS and Android apps on real devices.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Typically 30 to 40 percent cheaper than BrowserStack and Sauce Labs for comparable coverage$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Real device testing included in every paid plan rather than gated to top tiers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$EU-based data hosting appeals to GDPR-conscious teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Pay-as-you-go credits available for teams with irregular testing volume$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Responsive support from a small, focused team$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Smaller company size than major competitors may mean fewer enterprise-scale integrations$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated plan's minute limits can be restrictive for high-volume testing without upgrading$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Device and browser catalog, while large, is smaller than the biggest industry players$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Documentation and community resources are less extensive than larger competitors$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$What is TestingBot used for$q$, $q$TestingBot is used for cross-browser and cross-device testing, letting teams run automated and manual tests against thousands of real browser and device combinations in the cloud.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Who founded TestingBot$q$, $q$TestingBot was founded in 2011 by Jochen Delabie in Belgium.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$How much does TestingBot cost$q$, $q$Plans start at roughly 20 euros per month for manual Live testing billed annually, with Automated and Automated Pro plans starting around 50 and 90 euros per month respectively.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Does TestingBot support Playwright and Cypress$q$, $q$Yes, TestingBot supports Selenium, Playwright, Cypress, and Appium for automated testing.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Is there a free trial$q$, $q$Yes, TestingBot offers a 14-day free trial that does not require a credit card.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Does TestingBot offer real devices or only emulators$q$, $q$TestingBot provides access to real physical mobile devices and real desktop browsers, not just emulators or simulators.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Is TestingBot GDPR compliant$q$, $q$TestingBot hosts its testing infrastructure in the European Union, which supports GDPR compliance for European customers.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Can I pay for TestingBot without a subscription$q$, $q$Yes, TestingBot offers pay-as-you-go minute credits as an alternative to a monthly subscription.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated regression testing$q$, $q$QA teams run Selenium or Playwright regression suites against real browsers on every deployment.$q$, $q$QA engineers and development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Manual cross-browser QA$q$, $q$Testers manually verify how a website renders and behaves on specific real browsers and devices before release.$q$, $q$Manual QA testers and agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Mobile app testing$q$, $q$Mobile teams test native iOS and Android apps on real physical devices before publishing to app stores.$q$, $q$Mobile app development teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Live$q$, $q$From EUR20/month$q$, $q$annual (or EUR30/month month-to-month)$q$, NULL, $q$["Unlimited manual live testing","Unlimited visual testing","Real iOS and Android devices","24/7 support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated$q$, $q$From EUR50/month$q$, $q$annual (or EUR70/month month-to-month)$q$, NULL, $q$["1,000-20,000 automated testing minutes per month","1-24 parallel tests","Unlimited live and visual testing included","Real device access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Automated Pro$q$, $q$From EUR90/month$q$, $q$annual (or EUR120/month month-to-month)$q$, NULL, $q$["Unlimited automated testing minutes","1-24 parallel tests","Unlimited live and visual testing","24/7 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Enterprise$q$, $q$Custom$q$, $q$annual (quoted)$q$, NULL, $q$["10+ parallel tests","Unlimited testing capabilities","Single sign-on","Priority support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$Pay-as-you-go$q$, $q$From EUR60 (1,000 minutes)$q$, $q$one-time credit purchase$q$, NULL, $q$["Credits never expire","EUR0.06 per minute","Optional auto-renewal","No monthly commitment"]$q$::jsonb, 4);

DELETE FROM tool_content_blocks WHERE tool_id = '1b712ecf-94b6-4e1e-a274-928b0f776caa';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$overview$q$, $q$What Is TestingBot$q$, 2, ARRAY[$q$TestingBot is a cloud testing platform that gives developers and QA teams instant access to thousands of real browsers and physical mobile devices for both automated and manual testing. Instead of maintaining an in-house device lab, teams point their test scripts at TestingBot's cloud grid to run Selenium, Playwright, Cypress, or Appium tests remotely.$q$, $q$Founded in 2011 by Jochen Delabie, TestingBot has grown into a small but established player in the cross-browser testing space, competing with much larger vendors like BrowserStack and Sauce Labs by offering comparable device coverage at a lower price point and EU-based data hosting for teams with GDPR requirements.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$TestingBot supports automated testing across major frameworks including Selenium WebDriver, Playwright, Cypress, and Appium, with access to over 6,100 real desktop browser and mobile device combinations. It also offers live manual testing, where testers interact directly with a real device or browser through the browser, and visual regression testing to catch unintended UI changes.$q$, $q$Additional capabilities include local testing tunnels for testing behind firewalls or on localhost, video recordings and screenshots of every automated test run, native mobile app testing, and team management features for assigning access across a QA organization.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b712ecf-94b6-4e1e-a274-928b0f776caa', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$TestingBot's Live plan for manual testing starts around 20 euros per month billed annually (30 euros month-to-month), scaling by number of users. The Automated plan starts around 50 euros per month with a monthly minutes allotment, while Automated Pro, the most popular tier, offers unlimited automated testing minutes starting around 90 euros per month billed annually. A custom-priced Enterprise plan adds single sign-on and priority support. Teams that prefer not to subscribe can buy pay-as-you-go minute credits that never expire.$q$]::text[], 2);


-- ── Tettra ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Tettra is an AI-powered internal knowledge base and wiki tool that helps teams document processes, answer repetitive questions, and keep information organized alongside Slack and Microsoft Teams.$q$, short_description),
  pricing_model = COALESCE($q$subscription (per-user)$q$, pricing_model),
  starting_price = COALESCE($q$$8/user/month (Scaling plan, minimum 10 users)$q$, starting_price),
  founded_year = COALESCE(2015, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Boston, Massachusetts, United States$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Tettra Review 2026: Knowledge Base Software Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$Tettra is an AI-powered internal knowledge base for teams. Compare pricing, features, pros and cons of this Slack-integrated wiki tool.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Tettra is an internal knowledge base and knowledge management platform designed to help growing companies document processes, policies, and institutional knowledge in one searchable place. It was founded in 2015 by Andy Cook and Nelson Joyce and is headquartered in Boston, Massachusetts, with a small team of roughly 10 to 20 people. Tettra was acquired by GSoft, a Canadian software company, in October 2023. The product integrates closely with Slack and Microsoft Teams, including an AI bot that answers employee questions directly using content already stored in Tettra rather than requiring people to search manually. Beyond a Q and A bot, Tettra includes content verification workflows, page request tracking, usage analytics, and single sign-on for larger deployments. Pricing centers on the Scaling plan at 8 dollars per user per month (minimum 10 users, with a 20 percent discount for annual billing), and a custom-priced Enterprise plan that adds SSO and SCIM provisioning, hands-on training, and custom onboarding, requiring a minimum of 50 users. A 30-day free trial is available without a credit card. Tettra is best suited for startups and mid-sized companies, particularly remote and hybrid teams, that want a lightweight, Slack-native alternative to heavier enterprise wiki tools like Confluence.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$AI bot for Slack and Microsoft Teams$q$, $q$Automatically answers employee questions inside chat using existing Tettra content.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Content verification workflows$q$, $q$Assign page owners and schedule periodic reviews to keep documentation accurate.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Page requests$q$, $q$Employees can request documentation that doesn't yet exist, routing it to the right owner.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Usage analytics$q$, $q$See which pages are viewed, ignored, or outdated across the knowledge base.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Guest and read-only roles$q$, $q$Control access levels for external collaborators or view-only employees.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Invite-only categories$q$, $q$Restrict sensitive content to specific teams or individuals.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Single sign-on and SCIM$q$, $q$Enterprise-grade authentication and automated user provisioning on the Enterprise plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$API access$q$, $q$Connect Tettra to other internal tools and automate content workflows.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Deep, genuinely useful Slack and Microsoft Teams integration with an AI Q and A bot$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Simple, predictable per-user pricing on the Scaling plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Content verification workflows help prevent documentation from going stale$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Fast to set up compared to heavier enterprise wiki platforms$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$30-day free trial with no credit card required$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Minimum of 10 users on the Scaling plan makes it less economical for very small teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Enterprise plan requires a minimum of 50 users, pricing itself out of mid-size deployments wanting SSO$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Feature set is more limited than large-scale enterprise knowledge platforms$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Customization and formatting options are simpler than dedicated documentation tools$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$What is Tettra used for$q$, $q$Tettra is used as an internal knowledge base and wiki so teams can document processes, policies, and institutional knowledge in one searchable place, often integrated with Slack or Microsoft Teams.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$How much does Tettra cost$q$, $q$Tettra's Scaling plan costs 8 dollars per user per month with a minimum of 10 users; Enterprise pricing is custom and requires a minimum of 50 users.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Who founded Tettra$q$, $q$Tettra was founded in 2015 by Andy Cook and Nelson Joyce.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Is Tettra still an independent company$q$, $q$No. Tettra was acquired by GSoft, a Canadian software company, in October 2023.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Does Tettra integrate with Slack$q$, $q$Yes, Tettra has deep Slack integration, including an AI bot that answers questions directly in Slack using existing documentation.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Is there a free trial for Tettra$q$, $q$Yes, Tettra offers a 30-day free trial that does not require a credit card.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Does Tettra support single sign-on$q$, $q$Yes, SSO and SCIM provisioning are available on the Enterprise plan.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Where is Tettra headquartered$q$, $q$Tettra is headquartered in Boston, Massachusetts, United States.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Reducing repetitive Slack questions$q$, $q$Teams use Tettra's AI bot to automatically answer common employee questions inside Slack instead of repeating answers manually.$q$, $q$Operations and people teams at growing companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Employee onboarding documentation$q$, $q$New hires reference a centralized Tettra knowledge base for onboarding guides, policies, and how-to content.$q$, $q$HR and people operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Cross-team process documentation$q$, $q$Engineering, support, and sales teams document internal processes and keep them verified and current using Tettra's review workflows.$q$, $q$Cross-functional teams at startups and mid-sized companies$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Scaling$q$, $q$$8/user/month$q$, $q$monthly or annual (20 percent discount annually), minimum 10 users$q$, NULL, $q$["AI bot for Slack and Microsoft Teams","Google Workspace integration","Usage analytics and API access","Unlimited storage","Page requests, verification, and content reports","Guest and read-only user roles","Invite-only categories and page locking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$Enterprise$q$, $q$Custom$q$, $q$annual (quoted), minimum 50 users$q$, NULL, $q$["All Scaling plan features","SSO and SCIM provisioning","Hands-on training","Custom import and onboarding","Custom reporting and priority support"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'dc281520-800a-45ee-9fd8-a1cb5ca5cea6';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$overview$q$, $q$What Is Tettra$q$, 2, ARRAY[$q$Tettra is a knowledge management platform built to help growing teams capture and organize internal documentation, from onboarding guides to company policies to how-to processes, in a single searchable wiki. It was created specifically to reduce the repetitive questions that pile up in Slack and email as companies scale.$q$, $q$Founded in 2015 and based in Boston, Tettra has positioned itself as a lighter, faster-to-adopt alternative to heavier enterprise knowledge base tools, with deep integration into Slack and Microsoft Teams so employees can find or request documentation without leaving their everyday chat tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Tettra's core feature is its AI bot, which lives inside Slack or Microsoft Teams and answers employee questions automatically by pulling from existing Tettra content, reducing the need for someone to manually search or field the same question repeatedly. Content owners can also set up verification workflows so pages get periodically reviewed and marked as up to date.$q$, $q$Other features include page requests (so employees can ask for documentation that doesn't exist yet), usage analytics showing which pages are viewed or ignored, guest and read-only user roles, invite-only categories for sensitive content, and API access for connecting Tettra to other internal tools.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc281520-800a-45ee-9fd8-a1cb5ca5cea6', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Tettra's primary paid plan, Scaling, costs 8 dollars per user per month with a minimum of 10 users, billed monthly or annually (annual billing includes roughly two free months). An Enterprise plan with custom pricing adds single sign-on and SCIM user provisioning, hands-on training, custom import and onboarding, and custom reporting, and requires a minimum of 50 users. A 30-day free trial requiring no credit card is available on the Scaling plan.$q$]::text[], 2);


-- ── TextCortex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$TextCortex is an AI writing assistant and content-generation platform offering browser extensions, apps, and an API to help teams write, rewrite, translate, and manage content faster using large language models.$q$, short_description),
  pricing_model = COALESCE($q$freemium subscription$q$, pricing_model),
  starting_price = COALESCE($q$Free; Premium from $5.59/month billed annually ($6.99/month billed monthly)$q$, starting_price),
  founded_year = COALESCE(2021, founded_year),
  company_size = COALESCE($q$11-50 employees$q$, company_size),
  headquarters = COALESCE($q$Berlin, Germany$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$TextCortex Review 2026: AI Writing Assistant Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$TextCortex is an AI writing assistant with browser, desktop, and API tools. Compare pricing, features, pros and cons for content generation.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$TextCortex is an AI writing assistant and content-generation platform founded in 2021 by Ceyhun Derinbogaz and Dominik Lambersy in Berlin, Germany, where the company employs roughly 20 to 25 people. It provides a browser extension, desktop and mobile apps, and API access that let individuals and teams generate, rewrite, translate, and summarize text using large language models directly inside the tools they already use, such as email clients, CRMs, and office suites. The platform includes customizable AI personas, connectable knowledge bases for grounding responses in company-specific content, web search, and a library of more than 500 prompt templates for common writing tasks like emails, social posts, and product descriptions. TextCortex offers a free plan with 20 daily creations, up to three personas, three knowledge bases, and 50MB of file storage, alongside a Premium plan priced from about 5.59 dollars per month when billed annually (6.99 dollars billed monthly) that unlocks more creations, larger file storage, image generation, and access to more advanced reasoning models. An Enterprise tier with custom pricing adds single sign-on, governance controls, and priority support. TextCortex is aimed at marketers, sales teams, customer support agents, and knowledge workers who want an AI copilot embedded across their daily workflow rather than a standalone chat interface.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Browser extension writing assistant$q$, $q$Generate and rewrite text directly inside email, CRM, and web app text fields.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Customizable AI personas$q$, $q$Create personas that tailor tone, style, and voice for different brands or use cases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Connectable knowledge bases$q$, $q$Ground AI outputs in company-specific documents rather than generic model knowledge.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$500+ prompt templates$q$, $q$Pre-built templates for common writing tasks like emails, social posts, and product descriptions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$AI web search$q$, $q$Pull in current information from the web when generating content.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Translation and rewriting$q$, $q$Translate and rephrase existing content while preserving meaning and tone.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Image generation$q$, $q$Generate images alongside text content on paid plans.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$API access$q$, $q$Integrate TextCortex's writing capabilities into custom internal tools and workflows.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Free plan available with a meaningful number of daily creations$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Deep integration into existing tools via browser extension rather than a standalone app only$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Customizable personas and knowledge bases help outputs match brand voice$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Affordable entry-level paid pricing compared to many AI writing competitors$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Templates cover a broad range of practical business writing tasks$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Free plan's daily creation limit may be restrictive for heavy users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Advanced reasoning models and larger storage are gated behind the Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Enterprise pricing is not published and requires contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$As a smaller, newer company, integration ecosystem is less mature than larger AI writing platforms$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$What is TextCortex used for$q$, $q$TextCortex is used to generate, rewrite, translate, and summarize written content directly inside tools like email, CRMs, and web browsers using AI.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Is TextCortex free$q$, $q$Yes, TextCortex offers a free plan with 20 daily creations, though higher usage and advanced features require the paid Premium or Enterprise plans.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Who founded TextCortex$q$, $q$TextCortex was founded in 2021 by Ceyhun Derinbogaz and Dominik Lambersy in Berlin, Germany.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$How much does TextCortex Premium cost$q$, $q$TextCortex Premium starts at roughly 5.59 dollars per month when billed annually, or 6.99 dollars per month billed monthly.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Does TextCortex have a browser extension$q$, $q$Yes, TextCortex offers a browser extension that lets users generate and rewrite text directly inside other websites and applications.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Can TextCortex use my company's own documents$q$, $q$Yes, TextCortex supports connectable knowledge bases so AI outputs can be grounded in company-specific content.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Does TextCortex offer an API$q$, $q$Yes, API access is available for integrating TextCortex's writing capabilities into custom tools.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Where is TextCortex based$q$, $q$TextCortex is headquartered in Berlin, Germany.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Sales and marketing copywriting$q$, $q$Marketers use TextCortex templates and personas to draft emails, social posts, and product descriptions faster.$q$, $q$Marketing and sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Customer support response drafting$q$, $q$Support agents use TextCortex's browser extension to draft and rewrite responses directly inside their helpdesk tool.$q$, $q$Customer support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Company-specific content generation$q$, $q$Teams connect internal documentation as a knowledge base so AI-generated content reflects accurate, brand-specific information.$q$, $q$Knowledge workers and content teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Free$q$, $q$$0/month$q$, $q$n/a$q$, NULL, $q$["20 daily creations","Up to 3 personas","3 knowledge bases","50MB file storage","AI web search"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Premium$q$, $q$From $5.59/month (annual) or $6.99/month (monthly)$q$, $q$monthly or annual$q$, NULL, $q$["150 creations per month","100MB storage (upgradable to 100GB)","Access to reasoning models","Full tool access","Image generation"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$Enterprise$q$, $q$Custom$q$, $q$annual (quoted)$q$, NULL, $q$["Single sign-on","Governance and admin controls","Priority support","Custom usage limits"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '6d4bf973-60bc-4423-b9e1-f29a29ba365a';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$overview$q$, $q$What Is TextCortex$q$, 2, ARRAY[$q$TextCortex is an AI writing and productivity platform that embeds generative AI directly into the tools people already use, via a browser extension, desktop app, mobile app, and API, rather than requiring users to switch to a separate chat window. It focuses on practical business writing tasks: emails, product descriptions, social posts, summaries, and translations.$q$, $q$Founded in 2021 in Berlin, Germany, TextCortex has grown into a team of roughly 20 to 25 people and has been recognized among notable early-stage European AI startups. The platform emphasizes customization through AI personas and connectable knowledge bases, letting outputs reflect a company's specific tone, products, and internal documentation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$TextCortex offers AI-powered writing, rewriting, translation, and summarization across a browser extension, desktop app, and API, alongside more than 500 prompt templates for tasks such as email replies, LinkedIn posts, and product listings. Customizable personas let users tailor tone and style for different use cases or brands.$q$, $q$The platform also supports connectable knowledge bases so generated content can be grounded in company-specific documents rather than generic web knowledge, plus built-in AI web search and, on paid plans, image generation and access to more advanced reasoning models.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d4bf973-60bc-4423-b9e1-f29a29ba365a', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$TextCortex offers a free plan with 20 daily creations, up to three personas, three knowledge bases, and 50MB of file storage. The Premium plan starts at roughly 5.59 dollars per month billed annually (6.99 dollars per month billed monthly) and includes 150 monthly creations, 100MB of storage (upgradable to 100GB), access to reasoning models, full tool access, and image generation. An Enterprise plan with custom pricing adds single sign-on, governance features, and priority support.$q$]::text[], 2);


-- ── Textpattern ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Textpattern is a free, open-source content management system written in PHP, known for its lightweight tag-based templating language and clean, minimalist publishing workflow.$q$, short_description),
  pricing_model = COALESCE($q$open-source / free$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2003, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Textpattern CMS: Free Open-Source PHP Content Management$q$, seo_title),
  seo_meta_description = COALESCE($q$Textpattern is a free, open-source PHP and MySQL content management system with a tag-based templating language. See features, pros, and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Textpattern is a free, open-source content management system written in PHP and backed by MySQL, originally created by Dean Allen and now maintained by a volunteer group called Team Textpattern. Allen began developing the system to publish his personal site, Textism, with an early alpha version circulating in 2001 and a formal public announcement in January 2003. After an extended development period, the first stable release, version 4.0, arrived in August 2005, and the project has continued under active community development since, with all code hosted publicly on GitHub under the GNU General Public License version 2.0. Textpattern is distinguished by its tag-based templating language, which lets designers structure pages and control content display without needing to write PHP directly, and by its comparatively lightweight, low-overhead footprint relative to larger CMS platforms. The system supports hundreds of community-built plugins for extending functionality, from SEO tools to custom fields to e-commerce add-ons. Because it is fully open source with no company behind it, Textpattern has no pricing tiers, headquarters, or company size; it is free to download, self-host, and modify. It is best suited for designers, developers, and writers who want a minimalist, fast, and highly customizable publishing platform rather than a heavier, plugin-bloated CMS.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Tag-based templating language$q$, $q$Structure pages and control content display using Textpattern's own readable tag syntax instead of raw PHP.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Lightweight PHP and MySQL footprint$q$, $q$Runs efficiently on modest hosting without the overhead of larger CMS platforms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Plugin ecosystem$q$, $q$Hundreds of community-built plugins extend functionality for SEO, custom fields, galleries, and more.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Clean semantic HTML output$q$, $q$Generates markup without unnecessary bloat, helpful for performance and SEO.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Article and page management$q$, $q$Organize content into sections, categories, and custom URL structures.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Comment moderation tools$q$, $q$Built-in tools for managing and moderating reader comments on articles.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Multi-author support$q$, $q$Assign different privilege levels to multiple authors and editors.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Open-source and self-hosted$q$, $q$Full control over hosting, data, and customization since there is no vendor lock-in.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Completely free and open source with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Lightweight codebase runs well on modest, low-cost hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Tag-based templating is approachable for designers without deep PHP knowledge$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Generates clean, minimal HTML output favorable for site performance$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Long track record and stable, mature codebase dating back to 2003$q$, 4);

DELETE FROM tool_cons WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Much smaller plugin and theme ecosystem than WordPress or other mainstream CMS platforms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Smaller community means fewer tutorials, agencies, and ready-made themes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$No official commercial support; help comes from community forums$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Tag-based syntax has a learning curve for those used to conventional templating languages$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Is Textpattern free$q$, $q$Yes, Textpattern is completely free and open source under the GNU General Public License version 2.0.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Who created Textpattern$q$, $q$Textpattern was originally created by Dean Allen, with an early version circulating in 2001 and a formal announcement in 2003.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$When was the first stable version of Textpattern released$q$, $q$The first stable release, version 4.0, came out in August 2005.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Who maintains Textpattern today$q$, $q$Textpattern is maintained by Team Textpattern, a group of volunteer open-source developers.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$What language is Textpattern written in$q$, $q$Textpattern is written in PHP and uses MySQL as its database.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Does Textpattern support plugins$q$, $q$Yes, Textpattern has a library of hundreds of community-built plugins for extending its functionality.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Is Textpattern good for SEO$q$, $q$Textpattern's lightweight footprint and clean HTML output are generally favorable for SEO, and SEO-focused plugins are available.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Where can I download Textpattern$q$, $q$Textpattern can be downloaded from its official site, textpattern.com, or from its source repository on GitHub.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Minimalist blogging and personal sites$q$, $q$Writers and designers use Textpattern to publish clean, fast-loading personal sites and blogs.$q$, $q$Independent writers and bloggers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Small business and agency websites$q$, $q$Web developers use Textpattern's lightweight footprint and templating language to build custom client sites.$q$, $q$Freelance developers and small agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Content-focused publications$q$, $q$Editorial teams use Textpattern's article and section management for structured, content-heavy publications.$q$, $q$Small editorial and publishing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$Textpattern CMS$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full content management system source code","Tag-based templating language","Community plugin ecosystem","Self-hosted, no licensing fees"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = '0b080413-76d9-4f14-9aef-d7d87f04bc3d';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$overview$q$, $q$What Is Textpattern$q$, 2, ARRAY[$q$Textpattern is a free, open-source content management system built on PHP and MySQL, designed around simplicity, clean output, and a distinctive tag-based templating language. It was created by Dean Allen, first announced publicly in 2003, and reached its first stable release, version 4.0, in August 2005.$q$, $q$Since Allen's departure from active development, Textpattern has been maintained by Team Textpattern, a group of volunteer developers who continue to release updates, fix bugs, and support the surrounding plugin ecosystem. The project's source code is hosted on GitHub and licensed under the GNU General Public License version 2.0.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Textpattern's defining feature is its tag-based templating language, which allows designers to structure pages, loop through content, and control conditional display logic without writing raw PHP. This keeps templates readable for non-developers while still giving experienced developers fine-grained control.$q$, $q$The platform also supports a large library of community-built plugins covering SEO, custom fields, image galleries, comment moderation, and more, along with clean semantic HTML output, a straightforward admin interface, and a comparatively small codebase that keeps hosting requirements light.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Textpattern is entirely free to download, install, and use under the GNU General Public License version 2.0. There are no paid editions, subscription tiers, or licensing fees; the only costs involved are typical self-hosting expenses like web hosting and a domain name.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b080413-76d9-4f14-9aef-d7d87f04bc3d', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Thanos ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Thanos is an open-source, CNCF-incubating project that extends Prometheus with highly available, globally queryable, and virtually unlimited long-term storage for large-scale cloud native metrics monitoring.$q$, short_description),
  pricing_model = COALESCE($q$open-source / free$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2017, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Thanos: Open-Source Prometheus Monitoring at Scale$q$, seo_title),
  seo_meta_description = COALESCE($q$Thanos is a free, open-source CNCF project that adds high availability, global querying, and long-term storage on top of Prometheus.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Thanos is an open-source set of components, licensed under Apache License 2.0, that extends Prometheus into a highly available, globally queryable metrics system with virtually unlimited long-term storage. It was designed and built starting in November 2017 by Fabian Reinartz and Bartek Plotka at Improbable, a company that needed reliable, large-scale monitoring across many Kubernetes clusters, and it was open source from its very first commit. Improbable donated Thanos to the Cloud Native Computing Foundation, which accepted it as a sandbox project in July 2019 and promoted it to Incubating status in August 2020, where it remains today alongside other major cloud native projects. Thanos works by deploying sidecars and components (such as the Sidecar, Store Gateway, Compactor, Ruler, and Querier) alongside existing Prometheus servers, giving teams a single global query view across many Prometheus instances and clusters, deduplication of metrics from high-availability Prometheus pairs, and the ability to offload metrics to any S3-compatible, GCS, Azure, or Swift object storage for indefinite retention at low cost. It is used at significant scale by companies including Disney, Adobe, eBay, and ByteDance. As a fully open-source project with no vendor and no licensing cost, Thanos is best suited for platform and SRE teams running Prometheus across multiple clusters or regions who need long-term retention and a unified view without re-architecting their existing monitoring stack.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Global query view$q$, $q$Query metrics across multiple Prometheus servers and clusters from a single unified endpoint.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Long-term object storage$q$, $q$Store metrics indefinitely in S3, GCS, Azure Blob Storage, or Swift at a fraction of local disk cost.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$High-availability deduplication$q$, $q$Automatically merges and deduplicates metrics collected from redundant Prometheus HA pairs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Downsampling and compaction$q$, $q$Reduces storage costs and speeds up queries over long time ranges through automatic data compaction.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Grafana compatibility$q$, $q$Works with existing dashboards and alerting tools that support the Prometheus Query API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Ruler component$q$, $q$Evaluates recording and alerting rules across the global view of metrics.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Seamless Prometheus integration$q$, $q$Deploys alongside existing Prometheus servers without requiring a re-architected monitoring stack.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$CNCF-backed governance$q$, $q$Developed as an open, vendor-neutral CNCF Incubating project with broad community contribution.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Completely free and open source with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Solves long-term retention and multi-cluster querying that Prometheus alone cannot handle well$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Backed by CNCF with a broad, active contributor and adopter community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Works with existing Prometheus and Grafana setups without a rewrite$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Proven at large scale by companies including Disney, Adobe, and eBay$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Operational complexity increases with multiple additional components to deploy and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Requires object storage infrastructure and expertise to get full long-term storage benefits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Steeper learning curve than running Prometheus alone for smaller environments$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$No official vendor support; teams rely on community documentation and forums$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$What is Thanos used for$q$, $q$Thanos is used to extend Prometheus with high availability, a global query view across multiple clusters, and long-term metrics storage using object storage.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Is Thanos free$q$, $q$Yes, Thanos is completely free and open source under the Apache License 2.0.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Who created Thanos$q$, $q$Thanos was designed and built by Fabian Reinartz and Bartek Plotka at Improbable starting in November 2017.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Is Thanos a CNCF project$q$, $q$Yes, Thanos was accepted into the CNCF sandbox in July 2019 and promoted to Incubating status in August 2020.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Does Thanos replace Prometheus$q$, $q$No, Thanos extends and works alongside existing Prometheus deployments rather than replacing them.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$What object storage does Thanos support$q$, $q$Thanos supports any S3-compatible storage as well as Google Cloud Storage, Azure Blob Storage, and OpenStack Swift.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Is Thanos related to the Marvel character$q$, $q$No, Thanos the monitoring project is an unrelated open-source CNCF metrics system and has no connection to any fictional character or game.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Which companies use Thanos$q$, $q$Companies including Disney, Adobe, eBay, SoundCloud, and ByteDance have used Thanos for monitoring at scale.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Multi-cluster Kubernetes monitoring$q$, $q$Platform teams use Thanos to get a unified metrics view across many Kubernetes clusters running separate Prometheus instances.$q$, $q$Platform engineering and SRE teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Long-term metrics retention$q$, $q$Organizations offload Prometheus metrics to object storage via Thanos to retain historical data for months or years at low cost.$q$, $q$SRE and observability teams with compliance or trend-analysis needs$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$High-availability monitoring$q$, $q$Teams run redundant Prometheus pairs and use Thanos to deduplicate and merge their data into one reliable source of truth.$q$, $q$Infrastructure teams requiring resilient monitoring$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$Thanos$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full source-available component set","Global query view and deduplication","Long-term object storage integration","Community support via CNCF Slack and GitHub"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'a66f3bc4-b0a5-4c55-9356-c797b9ad54a2';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$overview$q$, $q$What Is Thanos$q$, 2, ARRAY[$q$Thanos is an open-source project that solves two problems Prometheus alone struggles with at scale: querying metrics across many separate Prometheus servers or clusters as if they were one, and storing metrics for the long term without running out of local disk space. It is not related to any fictional character; it is a metrics infrastructure project maintained under the Cloud Native Computing Foundation.$q$, $q$Originally built at Improbable in late 2017 by Fabian Reinartz and Bartek Plotka to support monitoring across many Kubernetes clusters, Thanos was open source from its first commit and was donated to the CNCF in 2019, where it reached Incubating maturity in 2020. It integrates seamlessly with existing Prometheus deployments rather than replacing them.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Thanos provides a global query view that lets teams query metrics across multiple Prometheus servers and geographic regions from a single endpoint, along with automatic deduplication of data collected from Prometheus high-availability pairs. It works with any S3-compatible object storage as well as GCS, Azure Blob Storage, and other cloud storage backends to retain metrics indefinitely at low cost.$q$, $q$Its component-based architecture (Sidecar, Store Gateway, Compactor, Ruler, Querier, and Receiver) lets teams adopt pieces incrementally, and it integrates with existing visualization tools like Grafana that support the Prometheus Query API, so dashboards and alerting rules continue to work unchanged.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a66f3bc4-b0a5-4c55-9356-c797b9ad54a2', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Thanos is completely free and open source under the Apache License 2.0. There is no vendor, subscription, or licensing fee; the only costs are the infrastructure teams choose to run it on, including compute for Thanos components and object storage costs for long-term metric retention.$q$]::text[], 2);


-- ── The Lounge ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$The Lounge is a free, open-source, self-hosted web IRC client that keeps you connected to IRC channels across devices with a modern, responsive interface.$q$, short_description),
  pricing_model = COALESCE($q$open-source / free$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2016, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$The Lounge: Free Self-Hosted Web IRC Client$q$, seo_title),
  seo_meta_description = COALESCE($q$The Lounge is a free, open-source, self-hosted web IRC client that keeps you connected across devices. See features, pricing, pros and cons.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$The Lounge is a free, open-source, self-hosted web IRC client built with JavaScript and Node.js, licensed under the MIT license. It began around 2016 as a community-managed fork of Shout, a similar IRC client created by Mattias Erming that had stagnated because its original author preferred it to remain a personal project; a group of contributors forked it to be collegially governed by multiple maintainers instead. The Lounge is designed to feel like a modern chat application rather than a traditional IRC client: in its default private mode it behaves like a combined bouncer and client, keeping users connected to IRC networks and channels even while their device is offline, then letting them resume exactly where they left off on any browser or device with push notifications, file uploads, and chat history preserved. It can also run in public mode, offering an open chat accessible to anyone without an account. Because it runs wherever Node.js runs, individuals and organizations self-host The Lounge on their own server, retaining full control over their data with no subscription or hosting fee from the project itself. The Lounge supports multiple user accounts on a single instance and is popular among open-source communities, developer teams, and long-time IRC users who want an always-connected, mobile-friendly IRC experience.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3bc3a20-56e4-4435-a993-1159046d7812';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3bc3a20-56e4-4435-a993-1159046d7812' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Always-connected private mode$q$, $q$Acts as a combined IRC bouncer and client, staying connected to channels even while offline.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Cross-device session resume$q$, $q$Pick up conversations exactly where you left off on any desktop, phone, or tablet.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Push notifications$q$, $q$Receive alerts for mentions and direct messages even when the browser tab is closed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$File uploads$q$, $q$Share files directly within IRC channels through the web interface.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Multi-user support$q$, $q$Host multiple independent user accounts on a single self-hosted instance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Public mode$q$, $q$Offer an open, account-free chat experience for community or support channels.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Responsive web interface$q$, $q$Works smoothly across desktop, smartphone, and tablet browsers without a native app.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Self-hosted deployment$q$, $q$Runs wherever Node.js runs, including via Docker, giving full control over data and infrastructure.$q$, 7);

DELETE FROM tool_pros WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Completely free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Always-connected mode solves the classic IRC problem of missing messages while offline$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Modern, responsive interface that works well on mobile devices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Self-hosted, so users retain full control over their data and server$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Active community-managed development with collegial governance$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Requires self-hosting and basic server administration knowledge, unlike hosted chat SaaS$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$No official managed hosting option directly from the project$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Feature set is focused on IRC and does not include modern chat platform extras like voice or video$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Push notification reliability can depend on browser and device configuration$q$, 3);

DELETE FROM tool_faqs WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Is The Lounge free$q$, $q$Yes, The Lounge is completely free and open source under the MIT license.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Do I need to host The Lounge myself$q$, $q$Yes, The Lounge is self-hosted; you run it on your own server or infrastructure using Node.js or Docker.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$What is the difference between private and public mode$q$, $q$Private mode acts like a bouncer and client combined, keeping you connected and letting you resume sessions across devices; public mode offers open chat access to anyone without an account.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$What was The Lounge forked from$q$, $q$The Lounge began as a community-managed fork of Shout, an IRC client originally created by Mattias Erming.$q$, 3, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Does The Lounge support multiple users$q$, $q$Yes, a single self-hosted instance of The Lounge can support multiple independent user accounts.$q$, 4, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Can I use The Lounge on mobile$q$, $q$Yes, The Lounge has a responsive web interface that works on smartphones and tablets as well as desktops.$q$, 5, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$What technology is The Lounge built with$q$, $q$The Lounge is built with JavaScript and runs on Node.js.$q$, 6, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Does The Lounge stay connected to IRC while I'm offline$q$, $q$Yes, in private mode The Lounge remains connected to IRC networks even when your device or browser is closed, and lets you resume where you left off.$q$, 7, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Always-connected personal IRC access$q$, $q$Individuals self-host The Lounge to stay connected to their favorite IRC networks across devices without missing messages.$q$, $q$Individual IRC users and open-source contributors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Open-source community chat$q$, $q$Open-source projects run The Lounge in public mode to offer accessible, account-free community chat for their channels.$q$, $q$Open-source project maintainers and communities$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$Team or organization IRC bouncer$q$, $q$Development teams self-host The Lounge as a shared, multi-user bouncer for internal or community IRC channels.$q$, $q$Developer teams and technical organizations$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$The Lounge$q$, $q$Free$q$, $q$n/a$q$, NULL, $q$["Full self-hosted IRC client source code","Always-connected private mode","Public mode for open community chat","Multi-user account support"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'e3bc3a20-56e4-4435-a993-1159046d7812';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$overview$q$, $q$What Is The Lounge$q$, 2, ARRAY[$q$The Lounge is a self-hosted web-based IRC client that lets users stay connected to IRC networks and channels from any browser or device, with a modern, responsive interface built on Node.js. Rather than requiring a dedicated desktop IRC client, users log into The Lounge through a web browser and interact with IRC channels much like a modern chat app.$q$, $q$The project began as a community-managed fork of Shout, an earlier IRC client by Mattias Erming, after Shout's development stalled as its author's personal project. A group of contributors forked it around 2016 to establish collegial, multi-maintainer governance, and it has since grown into one of the most popular self-hosted IRC clients available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The Lounge's signature feature is its always-connected private mode, which acts as a combined IRC bouncer and client: it stays connected to IRC servers even while a user's browser or device is closed, then lets them pick up exactly where they left off across desktop, phone, or tablet with full chat history preserved.$q$, $q$Other features include push notifications for mentions and messages, file uploads, support for multiple simultaneous user accounts on a single self-hosted instance, and an optional public mode that offers open, account-free chat access for community or support channels. Because it runs wherever Node.js runs, it is straightforward to deploy via Docker or directly on a server.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The Lounge is completely free and open source under the MIT license. There is no subscription fee or paid tier from the project itself; users self-host the software on their own server or infrastructure, so the only costs involved are typical hosting expenses.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bc3a20-56e4-4435-a993-1159046d7812', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;


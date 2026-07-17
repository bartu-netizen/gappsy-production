-- Enrichment batch: Snyk, Semgrep, SonarQube Cloud, GitGuardian, Socket, Aikido Security, Wiz, Orca Security, Tenable, Rapid7, Huntress, Vanta, Fillout, Feathery, Formbricks, Formsort, Formcarry, Formspark, Heyflow, involve.me, Outgrow, ScoreApp, Opinion Stage, Youform, Cal.com, SavvyCal, Zencal, OnceHub, YouCanBookMe, Setmore, Appointlet, Calday, Doodle, LettuceMeet, Zeeg, Cronofy, Penpot, Lunacy, Visme, Piktochart, Venngage, Snappa, RelayThat, Marq, Kittl, Artboard Studio, Rotato, Shots, Screen Studio, Tella, CleanShot X, Xnapper, ScreenFlow, Camtasia, Jitter, Rive, Spline, ProtoPie, Principle, Sintra AI, Relevance AI, Lindy, Dust, Stack AI, Svix, Hookdeck, Trigger.dev, Encore, Doppler, Infisical
-- Publishes 70 bulk-imported tool(s) with full editorial content.

-- ── Snyk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Developer security platform that scans code, open source dependencies, containers, and IaC for vulnerabilities within IDEs and CI/CD pipelines.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month per contributing developer$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = $q$Boston, Massachusetts, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Snyk scans code, open source dependencies, containers, and infrastructure-as-code for vulnerabilities directly in your IDE and CI/CD pipeline.$q$,
  og_description = $q$Snyk scans code, open source dependencies, containers, and infrastructure-as-code for vulnerabilities directly in your IDE and CI/CD pipeline.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7fb17539-57c9-48ad-9999-e9c23b8b0ab8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Snyk Code (SAST)$q$, $q$Static analysis that finds security vulnerabilities in application source code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Snyk Open Source (SCA)$q$, $q$Scans open source dependencies for known vulnerabilities and license risk.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Snyk Container$q$, $q$Scans container images for vulnerable base images and packages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Snyk IaC$q$, $q$Checks infrastructure-as-code configurations for misconfigurations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$IDE and CI/CD integrations$q$, $q$Integrates with IDEs, source code managers, and CI/CD pipelines including AI coding assistants like Claude Code, Cursor, and Codex.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Free tier available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Covers code, dependencies, containers, and IaC from one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Integrates directly into developer IDEs and CI/CD workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Supports regional data hosting (US, EU, AU)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Free plan is capped at 5 projects and limited monthly test counts$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Enterprise-level features (custom rules, full SDLC automation) require the top-tier or custom-priced Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Per-developer pricing can scale up quickly for larger teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Does Snyk have a free plan?$q$, $q$Yes, Snyk offers a Free tier for up to 5 projects with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$What does the Team plan cost?$q$, $q$The Team plan starts at $25/month per contributing developer, billed monthly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Does Snyk scan containers and infrastructure code?$q$, $q$Yes, in addition to code and open source dependency scanning, Snyk offers Snyk Container and Snyk IaC products.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Can Snyk integrate with AI coding tools?$q$, $q$Yes, Snyk integrates with AI coding assistants including Claude Code, Cursor, and Codex.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Securing open source dependencies$q$, $q$Development teams scan third-party packages for known vulnerabilities before shipping.$q$, $q$Application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Shift-left code security$q$, $q$Security teams embed SAST scanning into IDEs and pull requests to catch issues early.$q$, $q$AppSec teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Container and IaC hardening$q$, $q$Platform teams check container images and infrastructure-as-code templates for misconfigurations.$q$, $q$DevOps/Platform engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Free$q$, $q$$0/month per contributing developer$q$, $q$monthly$q$, $q$["SCA, SAST, IaC & Container access","Real-time code scanning","IDE, CLI, and SCM integrations","5 projects"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Team$q$, $q$Starting at $25/month per contributing developer$q$, $q$monthly$q$, $q$["All Free features","100 projects","1,000 Code tests/month","Jira integration","Next business day support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Ignite$q$, $q$Starting at $1,260/year per contributing developer$q$, $q$annual$q$, $q$["All Team features","Unlimited projects","Unlimited code tests","Custom security rules","Risk-based prioritization"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["All Ignite features","Zero-day risk prevention","Unified AppSec control","Full SDLC automation"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$overview$q$, $q$What is Snyk?$q$, 2, ARRAY[$q$Snyk is a developer security platform that scans application code, open source dependencies, containers, and infrastructure-as-code for vulnerabilities. It integrates into IDEs, source code managers, and CI/CD pipelines so issues can be caught before deployment.$q$, $q$The platform also connects with AI coding assistants such as Claude Code, Cursor, and Codex to validate AI-generated code as it is written.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', $q$who-its-for$q$, $q$Who Snyk is for$q$, 2, ARRAY[$q$Snyk is aimed at development and AppSec teams that need vulnerability scanning across the full software stack, from a single free-tier developer up to enterprise organizations needing custom security rules and dedicated support.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7fb17539-57c9-48ad-9999-e9c23b8b0ab8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Semgrep ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Static analysis security platform combining SAST, software composition analysis, and secrets detection with AI-assisted triage.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$30/month per contributor$q$,
  founded_year = 2017,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Semgrep combines SAST, open source dependency scanning, and secrets detection with AI-powered triage across 35+ programming languages.$q$,
  og_description = $q$Semgrep combines SAST, open source dependency scanning, and secrets detection with AI-powered triage across 35+ programming languages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7b87aa12-a696-4762-9cbd-1a738f0fd2c7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7b87aa12-a696-4762-9cbd-1a738f0fd2c7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Code (SAST)$q$, $q$Static analysis with a Pro Engine and Pro Rules to detect vulnerabilities like IDORs and business logic flaws.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Supply Chain (SCA)$q$, $q$Reachability analysis prioritizes exploitable open source dependencies, reducing false positives.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Semantic secrets detection$q$, $q$Detects and blocks hardcoded credentials before code is merged.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$AI-powered triage memory$q$, $q$Learns from past triage decisions to automatically suppress repeat false positives.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Broad ecosystem integration$q$, $q$Works with GitHub, GitLab, Bitbucket, and Azure; supports VS Code and JetBrains IDEs, plus an MCP server for AI tools like Cursor and Replit.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Free Community Edition covers up to 10 contributors and 10 repositories$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Supports 35+ programming languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Reachability analysis reduces false positives in dependency findings$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Includes secrets, SAST, and supply chain scanning in one product line$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Secrets detection is a paid $15/month add-on on the Teams plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Free tier is capped at 10 contributors and 10 repositories$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Enterprise pricing and on-prem SCM support require custom/quote-based plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Is there a free version of Semgrep?$q$, $q$Yes, the Free Edition supports up to 10 contributors and 10 repositories with Code and Supply Chain scanning included.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$How much does the Teams plan cost?$q$, $q$The Teams plan starts at $30/month per contributor, billed monthly, covering up to 500 private repositories.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Does Semgrep detect secrets?$q$, $q$Yes, secrets detection is available, though on the Teams plan it is a $15/month add-on.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$How many languages does Semgrep support?$q$, $q$The platform supports 35+ programming languages.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Static code scanning in CI/CD$q$, $q$Developers run SAST scans on pull requests via GitHub, GitLab, Bitbucket, or Azure integrations.$q$, $q$Application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Dependency risk reduction$q$, $q$AppSec teams use reachability analysis to prioritize truly exploitable open source vulnerabilities.$q$, $q$AppSec teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Secrets prevention$q$, $q$Teams add semantic secrets detection to block hardcoded credentials before merge.$q$, $q$Security engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Free Edition$q$, $q$$0$q$, NULL, $q$["Up to 10 contributors, 10 repositories","Code (SAST) with Pro Engine and Pro Rules","Supply Chain (SCA)","60 AI credits included","35+ programming languages supported"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Teams$q$, $q$Starting at $30/month per contributor$q$, $q$monthly$q$, $q$["Up to 500 private repositories","AI-powered detection, triage, and remediation","20 AI credits per developer/month","SSO (OIDC + SAML)","RBAC","Jira and Slack integrations","REST API access"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited contributors and repositories","On-prem SCM support","Custom CI/CD integration","50 AI credits per developer/month","Dedicated account manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$overview$q$, $q$What is Semgrep?$q$, 2, ARRAY[$q$Semgrep is an application security platform that combines static analysis (SAST), software composition analysis (SCA), and secrets detection to find and help remediate vulnerabilities before deployment.$q$, $q$It uses a mix of rule-based analysis and AI reasoning, including reachability analysis for dependencies and a triage memory that suppresses repeat false positives.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', $q$who-its-for$q$, $q$Who Semgrep is for$q$, 2, ARRAY[$q$Semgrep serves developers who want fast, integrated security feedback as well as AppSec teams and CISOs who need centralized visibility across code and dependency risk.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b87aa12-a696-4762-9cbd-1a738f0fd2c7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SonarQube Cloud ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based code quality and security platform that scans code for bugs, vulnerabilities, and code smells across 40+ languages.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$32/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SonarQube Cloud scans code in real time for bugs, vulnerabilities, and code smells across 40+ languages, with CI/CD and IDE integrations.$q$,
  og_description = $q$SonarQube Cloud scans code in real time for bugs, vulnerabilities, and code smells across 40+ languages, with CI/CD and IDE integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '19756a8e-09b5-44fb-801b-926184dbba14';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '19756a8e-09b5-44fb-801b-926184dbba14' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Automated code review$q$, $q$Integrates with CI/CD pipelines to provide pull request feedback and enforce quality gates.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Multi-language support$q$, $q$Covers 40+ programming languages including Java, Python, JavaScript, C#, and infrastructure-as-code tools like Terraform and Kubernetes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$AI CodeFix$q$, $q$Suggests one-click AI-assisted fixes for detected issues.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Secrets detection$q$, $q$Identifies exposed credentials and other sensitive data in code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Test coverage tracking$q$, $q$Measures how much code is exercised by automated tests.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Compliance reporting$q$, $q$Supports NIST SSDF, OWASP, CWE, STIG, and PCI DSS reporting standards.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Free tier available for individual developers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Covers 40+ languages including IaC tools like Terraform and Kubernetes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$14-day free trial for paid features$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Integrates with GitHub, Bitbucket Cloud, GitLab, and Azure DevOps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Team plan pricing recently increased (from $65 to $32/month per the vendor's own before/after framing, indicating a prior higher price point)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Enterprise plan requires custom annual pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Full platform value depends on CI/CD integration setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Is SonarQube Cloud free?$q$, $q$A free tier is available for individual developers; paid Team plans start at $32/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Is there a free trial?$q$, $q$Yes, a 14-day free trial is offered for paid features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Which languages does it support?$q$, $q$SonarQube Cloud supports 40+ programming languages plus infrastructure-as-code tools like Terraform and Kubernetes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Does it integrate with my Git provider?$q$, $q$Yes, it integrates with GitHub, Bitbucket Cloud, GitLab, and Azure DevOps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Pull request quality gates$q$, $q$Teams enforce code quality and security standards automatically on every pull request.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$AI-generated code verification$q$, $q$Teams scan AI-generated and developer-written code together in real time.$q$, $q$Engineering teams adopting AI coding tools$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$Compliance reporting$q$, $q$Organizations generate reports aligned to NIST SSDF, OWASP, and PCI DSS.$q$, $q$Regulated enterprises$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$overview$q$, $q$What is SonarQube Cloud?$q$, 2, ARRAY[$q$SonarQube Cloud (formerly SonarCloud) is a cloud-based code quality and security platform that scans source code in real time to find bugs, vulnerabilities, code smells, and architectural issues.$q$, $q$It integrates with CI/CD pipelines and Git providers to give pull request feedback and enforce quality gates before code ships, and is used by over 7 million developers according to the vendor.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', $q$who-its-for$q$, $q$Who SonarQube Cloud is for$q$, 2, ARRAY[$q$It serves individual developers and small teams on the free tier, as well as enterprise organizations in healthcare, financial services, retail, and government that need compliance reporting and custom annual plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19756a8e-09b5-44fb-801b-926184dbba14', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── GitGuardian ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Secrets detection and non-human identity governance platform that finds and remediates exposed credentials in code and CI/CD.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0 (Starter plan, up to 25 developers)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GitGuardian detects and helps remediate exposed secrets and credentials across code repositories, CI/CD, and developer machines.$q$,
  og_description = $q$GitGuardian detects and helps remediate exposed secrets and credentials across code repositories, CI/CD, and developer machines.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f79bb617-e492-4f3f-b2e0-6a6ffd43dc71' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Internal secrets monitoring$q$, $q$Scans code repositories, CI/CD pipelines, and container registries for exposed credentials.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Public secrets monitoring$q$, $q$Monitors public GitHub for exposed credentials in real time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Non-Human Identity (NHI) governance$q$, $q$Discovers and manages service accounts, API keys, and OAuth tokens.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Developer endpoint protection$q$, $q$Detects credentials present on developer laptops.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$GitGuardian CLI (ggshield)$q$, $q$Detects 550+ secret types directly from developer tools.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Free Starter plan for up to 25 developers with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Detects 550+ secret types via its ggshield CLI$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Multi-VCS support including GitHub, GitLab, Azure Repos, and Bitbucket$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Ranked as a top security app on the GitHub Marketplace by the vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Pull request scanning on the free plan is limited to GitHub only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Business and Enterprise pricing is quote-based rather than published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Public Secrets Monitoring and NHI governance features are reserved for the Enterprise plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Does GitGuardian have a free plan?$q$, $q$Yes, the Starter plan is free for up to 25 developers with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$How is Business/Enterprise pricing structured?$q$, $q$Both the Business (Teams) and Enterprise plans use custom, quote-based pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$What does ggshield detect?$q$, $q$GitGuardian's CLI, ggshield, detects 550+ types of secrets across development tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Which version control systems are supported?$q$, $q$GitGuardian supports GitHub, GitLab, Azure Repos, and Bitbucket.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Preventing secret leaks in commits$q$, $q$Developers use git hooks and IDE extensions to catch hardcoded credentials before pushing code.$q$, $q$Individual developers and small teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Enterprise secrets governance$q$, $q$Security teams centrally monitor and remediate exposed secrets and manage non-human identities.$q$, $q$SecOps/AppSec teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Public exposure monitoring$q$, $q$Organizations track whether their credentials have leaked onto public GitHub.$q$, $q$Enterprise security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Starter$q$, $q$$0$q$, NULL, $q$["Up to 25 developers","Unlimited real-time scanning","Up to 500 historical scan detections","Multi-VCS support","VSCode extension"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Teams (Business)$q$, $q$Custom$q$, NULL, $q$["Up to 200 developers","Up to 20 teams","Remediation playbooks","Custom regex detectors","SSO (SAML 2.0)","100,000 API calls/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["200+ developers","Public Secrets Monitoring","NHI Governance with unlimited honeytokens","Self-hosted deployment","SSO with SCIM"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$overview$q$, $q$What is GitGuardian?$q$, 2, ARRAY[$q$GitGuardian is a secrets security and non-human identity governance platform that finds, prevents, and remediates exposed credentials across the development lifecycle, from developer laptops to CI/CD pipelines and public GitHub.$q$, $q$Its ggshield CLI detects 550+ types of secrets, and the platform offers pre-commit and pre-push checks alongside centralized incident monitoring.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', $q$who-its-for$q$, $q$Who GitGuardian is for$q$, 2, ARRAY[$q$It serves individual developers on the free Starter plan up to large enterprises needing public exposure monitoring, self-hosted deployment, and non-human identity governance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f79bb617-e492-4f3f-b2e0-6a6ffd43dc71', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Socket ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Supply chain security tool that scans open source dependencies for malicious behavior and blocks risky packages before install.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month per developer$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Socket scans open source dependencies for malicious behavior, detecting 70+ risk types and blocking risky packages before they ship.$q$,
  og_description = $q$Socket scans open source dependencies for malicious behavior, detecting 70+ risk types and blocking risky packages before they ship.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95b33c4f-2d04-4277-8964-3cefa7c43f5f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Risk type detection$q$, $q$Detects 70+ risk types in open source dependencies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Automatic blocking$q$, $q$Automatically blocks malicious dependencies from entering a project.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$AI-powered behavior analysis$q$, $q$Uses AI to analyze packages for hidden malicious behaviors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Reachability analysis$q$, $q$Precomputed reachability analysis cuts CVE false positives, per the vendor, by up to 60% on paid plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$SBOM import/export$q$, $q$Supports software bill of materials import and export on the Business plan.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Free plan includes unlimited developers and repos with 1,000 scans/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Detects 70+ categories of dependency risk, not just known CVEs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Reachability analysis reduces false positive CVE alerts$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Business plan adds SSO/SAML and compliance integrations (e.g. Vanta)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Free plan is capped to 3 members and 1 repository label$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Unlimited scans and API quota require the Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Enterprise-level multi-platform VCS support (GitLab, Bitbucket, Azure DevOps) requires custom pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Is Socket free to use?$q$, $q$Yes, the Free plan offers unlimited developers and repos with 1,000 scans per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$What does the Team plan cost?$q$, $q$The Team plan starts at $25/month per developer, with a 20% discount for annual billing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Does Socket support GitLab or Bitbucket?$q$, $q$Multi-platform VCS support for GitLab, Bitbucket, and Azure DevOps is available on the Enterprise plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Does Socket integrate with Slack?$q$, $q$Yes, Slack integration for security alerts is available starting on the Team plan.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Blocking malicious packages$q$, $q$Teams automatically block newly published malicious open source packages before install.$q$, $q$Application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Reducing CVE alert noise$q$, $q$Security teams use reachability analysis to focus only on exploitable dependency vulnerabilities.$q$, $q$AppSec teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Compliance-ready supply chain security$q$, $q$Larger organizations use SBOM export and SSO/SAML to meet compliance requirements.$q$, $q$Enterprise security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Free$q$, $q$$0/month per developer$q$, $q$monthly$q$, $q$["Unlimited developers & repos","1,000 scans per month","Up to 3 members, 1 repository label","Detection of 70+ risk types","Automatic blocking of malicious dependencies"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Team$q$, $q$$25/month per developer$q$, $q$monthly$q$, $q$["5,000 scans per month","Up to 10 members, 3 repository labels","Precomputed reachability analysis","Priority risk scoring","Slack integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Business$q$, $q$$50/month per developer$q$, $q$monthly$q$, $q$["Unlimited members and repository labels","Unlimited scans & API quota","Vanta compliance integration","SBOM import/export","SSO/SAML support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Full application function-level reachability","Multi-platform VCS support (GitLab, Bitbucket, Azure DevOps)","SCIM provisioning and audit logs","Dedicated account manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$overview$q$, $q$What is Socket?$q$, 2, ARRAY[$q$Socket is a supply chain security tool that scans open source dependencies for malicious or risky behavior, detecting 70+ risk types and automatically blocking dangerous packages before they enter a codebase.$q$, $q$It uses AI-powered analysis to flag hidden malicious behaviors and offers reachability analysis to reduce false-positive CVE alerts on paid plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', $q$who-its-for$q$, $q$Who Socket is for$q$, 2, ARRAY[$q$Socket is used by development teams wanting free, unlimited-developer dependency scanning, as well as larger organizations that need SBOM export, SSO/SAML, and compliance integrations on paid plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95b33c4f-2d04-4277-8964-3cefa7c43f5f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Aikido Security ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Unified application security platform covering code, cloud, and runtime scanning plus AI-powered pentesting from one dashboard.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$300/month (Basic plan)$q$,
  founded_year = 2022,
  company_size = NULL,
  headquarters = $q$Ghent, Belgium$q$,
  languages = '{}',
  seo_meta_description = $q$Aikido Security unifies SAST, SCA, secrets detection, cloud posture management, and runtime protection in one developer-focused platform.$q$,
  og_description = $q$Aikido Security unifies SAST, SCA, secrets detection, cloud posture management, and runtime protection in one developer-focused platform.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '500f337a-c890-4561-b62d-d9dfd247fbc6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '500f337a-c890-4561-b62d-d9dfd247fbc6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Code security (SAST/SCA)$q$, $q$Static code analysis, open source dependency scanning, and secrets detection.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Cloud Security Posture Management$q$, $q$Scans cloud accounts, virtual machines, and Kubernetes/container configurations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$AI-powered pentesting$q$, $q$Runs automated penetration tests using AI agents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Zen runtime protection$q$, $q$Runtime firewall that blocks bot and injection attacks in production.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$AutoTriage alert deduplication$q$, $q$Uses contextual analysis and custom rules to reduce alert noise.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Free forever plan with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Combines code, cloud, and runtime security in a single platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Offers AI AutoFixes for detected issues on paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Separate transparent pricing published for one-off and continuous pentesting$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Free plan is limited to 2 users, 10 repos, and 1 cloud account$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$On-prem scanning and REST API fuzzing require the Pro plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Enterprise features require custom, quote-based pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Is Aikido Security free?$q$, $q$Yes, the Developer plan is free forever for 2 users with limited repos, containers, and cloud accounts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$What does the Basic plan cost?$q$, $q$The Basic plan starts at $300/month for 10 users, billed monthly or annually with a 10% discount.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Where is Aikido headquartered?$q$, $q$Aikido Security is headquartered in Ghent, Belgium, with an additional office in San Francisco.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Does Aikido offer pentesting?$q$, $q$Yes, Aikido offers Standard, Rightsized, and Continuous pentest options priced separately from the platform plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Consolidating AppSec tooling$q$, $q$Development teams replace multiple point security tools with one unified platform.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Cloud misconfiguration detection$q$, $q$Teams scan cloud accounts and Kubernetes clusters for posture issues.$q$, $q$DevOps/Platform engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$On-demand penetration testing$q$, $q$Organizations purchase scoped or continuous pentests alongside automated scanning.$q$, $q$Security-conscious startups and SMBs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Developer (Free)$q$, $q$$0/month$q$, $q$monthly$q$, $q$["2 users included","10 repos, 2 container images, 1 domain, 1 cloud account","Dependency scanning, SAST, secrets detection","10 AI AutoFixes/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Basic$q$, $q$$300/month$q$, $q$monthly$q$, $q$["10 users included","100 repos, 25 container images, 3 domains, 3 cloud accounts","PR security review","Jira/Linear sync","Unlimited AI AutoFixes"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Pro$q$, $q$$600/month$q$, $q$monthly$q$, $q$["10-50+ users","200 repos, 50 container images, 10 domains, 10 cloud accounts","On-prem scanning","REST API fuzzing","VM scanning"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Advanced$q$, $q$$600/month$q$, $q$monthly$q$, $q$["500 repos, 100 container images, 20 domains, 20 cloud accounts","Broker support","Private registry proxy","FIPS base images"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Multi-tenant portal","Custom SLA","Local deployment","Training"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$overview$q$, $q$What is Aikido Security?$q$, 2, ARRAY[$q$Aikido Security is an application security platform that unifies code scanning (SAST, SCA, secrets), cloud security posture management, and runtime protection into a single dashboard.$q$, $q$Founded in 2022 and based in Ghent, Belgium, it also offers AI-powered automated penetration testing and a runtime firewall (Zen) to block attacks in production.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', $q$who-its-for$q$, $q$Who Aikido Security is for$q$, 2, ARRAY[$q$It's aimed at development teams that want to consolidate multiple security tools into one platform, from small teams on the free plan to organizations needing on-prem scanning and dedicated pentesting engagements.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('500f337a-c890-4561-b62d-d9dfd247fbc6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Wiz ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud security platform unifying code, cloud infrastructure, and runtime protection for enterprise security teams.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Wiz is a cloud security platform connecting code, cloud infrastructure, and runtime protection with AI-driven automation.$q$,
  og_description = $q$Wiz is a cloud security platform connecting code, cloud infrastructure, and runtime protection with AI-driven automation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Wiz Code$q$, $q$Secures development from the IDE through CI/CD deployment.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Wiz Cloud$q$, $q$Protects cloud infrastructure and AI applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Wiz Defend$q$, $q$Provides runtime protection and threat detection.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$AI security agents$q$, $q$Automates code fixes, penetration testing, and threat investigations.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Unifies code, cloud, and runtime security in one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Supports multi-cloud environments including AWS and Azure$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Offers a free trial before purchase$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Used by a large share of Fortune 100 companies according to the vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Full platform access requires quote-based custom pricing rather than published rates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$No self-serve/free-forever tier is advertised on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Primarily positioned for enterprise-scale organizations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Does Wiz offer a free trial?$q$, $q$Yes, Wiz offers a free trial with demo scheduling available on their website.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Is Wiz pricing public?$q$, $q$No, full platform pricing is quote-based; a demo or sales conversation is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Which cloud providers does Wiz support?$q$, $q$Wiz supports multi-cloud environments including AWS and Azure.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$What are the three main components of Wiz?$q$, $q$Wiz Code, Wiz Cloud, and Wiz Defend cover development, cloud infrastructure, and runtime protection respectively.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Unified cloud risk visibility$q$, $q$Security teams get a single view of vulnerabilities and misconfigurations across cloud environments.$q$, $q$Enterprise security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Shift-left code security$q$, $q$Developers get security feedback from the IDE through CI/CD before deployment.$q$, $q$Development teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$Runtime threat detection$q$, $q$Organizations use Wiz Defend to detect and investigate active threats in running workloads.$q$, $q$SOC/incident response teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$overview$q$, $q$What is Wiz?$q$, 2, ARRAY[$q$Wiz is a cloud security platform that connects code, cloud infrastructure, and runtime protection into one system, spanning development through production for multi-cloud environments including AWS and Azure.$q$, $q$The platform uses AI agents to automate parts of security operations, such as generating code fixes and conducting threat investigations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', $q$who-its-for$q$, $q$Who Wiz is for$q$, 2, ARRAY[$q$Wiz targets enterprise security teams managing large, multi-cloud environments, with reported adoption among a majority of Fortune 100 companies.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e1b75119-d6cf-4ef2-b9ef-c4c9c840eef4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Orca Security ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Agentless cloud-native application protection platform (CNAPP) covering vulnerabilities, misconfigurations, and malware from code to runtime.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = $q$approximately 350 employees$q$,
  headquarters = $q$London, Tel Aviv, and Portland, OR$q$,
  languages = '{}',
  seo_meta_description = $q$Orca Security is an agentless CNAPP that scans cloud environments for vulnerabilities, misconfigurations, and malware without installing agents.$q$,
  og_description = $q$Orca Security is an agentless CNAPP that scans cloud environments for vulnerabilities, misconfigurations, and malware without installing agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de412e9f-bb56-438d-8972-125d8b06d414';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de412e9f-bb56-438d-8972-125d8b06d414' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Agentless scanning$q$, $q$Delivers full cloud visibility within 24 hours without installing agents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Reachability analysis$q$, $q$Analyzes risk across agentless, dynamic, and code-level layers to reduce alert noise.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$AI-powered capabilities$q$, $q$Includes automated code fixes, risk assessment, and an AI Assistant.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Shift-left developer integration$q$, $q$Integrates into CI/CD pipelines and IDEs for pre-deployment security checks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Unified Data Model$q$, $q$Combines context across misconfigurations, vulnerabilities, identity risks, and sensitive data.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Agentless deployment claims full visibility within 24 hours$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Combines vulnerability, misconfiguration, and malware detection in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Integrates with 25+ tools including AWS, GitHub, Slack, Jira, and Okta$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Founded in 2019 with offices across three regions (London, Tel Aviv, Portland)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$No published self-serve pricing; requires a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Primarily targeted at enterprise organizations rather than solo developers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$ROI/savings figures cited by the vendor are not independently broken down by plan tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Does Orca require installing agents?$q$, $q$No, Orca uses agentless scanning to achieve visibility, according to the vendor, within 24 hours.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$When was Orca Security founded?$q$, $q$Orca Security was founded in 2019.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Where is Orca headquartered?$q$, $q$Orca operates from offices in London, Tel Aviv, and Portland, Oregon.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Is Orca pricing public?$q$, $q$No, specific pricing is not published on the site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Agentless cloud risk visibility$q$, $q$Security teams get full visibility into cloud misconfigurations and vulnerabilities without deploying agents.$q$, $q$Cloud security teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Reducing alert fatigue$q$, $q$Teams use multi-layer reachability analysis to focus on truly exploitable risks.$q$, $q$AppSec/SOC teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$Shift-left cloud security$q$, $q$Developers integrate cloud security checks into CI/CD pipelines and IDEs.$q$, $q$DevOps/Platform engineers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$overview$q$, $q$What is Orca Security?$q$, 2, ARRAY[$q$Orca Security is a Cloud-Native Application Protection Platform (CNAPP) that provides agentless scanning for vulnerabilities, misconfigurations, malware, and identity risks across cloud environments.$q$, $q$Founded in 2019 and operating from offices in London, Tel Aviv, and Portland, Oregon, Orca combines agentless, dynamic, and code-level reachability analysis to reduce alert noise.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', $q$who-its-for$q$, $q$Who Orca Security is for$q$, 2, ARRAY[$q$Orca serves enterprise organizations building cloud-native applications, from Fortune 500 companies to cloud-native startups, that need unified visibility across their cloud estate.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de412e9f-bb56-438d-8972-125d8b06d414', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Tenable ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Exposure management platform that identifies vulnerabilities across IT, cloud, identity, OT, and AI attack surfaces, anchored by Tenable One.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$3,500/year (Tenable One Vulnerability Management, 100 assets)$q$,
  founded_year = 2002,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Tenable's exposure management platform, led by Tenable One and Nessus, identifies vulnerabilities across IT, cloud, identity, and OT environments.$q$,
  og_description = $q$Tenable's exposure management platform, led by Tenable One and Nessus, identifies vulnerabilities across IT, cloud, identity, and OT environments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Tenable One$q$, $q$AI-powered exposure management platform providing unified visibility across infrastructure, cloud, identity, OT, and AI environments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Hexa AI$q$, $q$Agentic orchestration system for automated remediation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus$q$, $q$Vulnerability scanner available in Professional and Expert editions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Cloud Security/CNAPP$q$, $q$Cloud-native application protection capabilities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$OT Security$q$, $q$Security monitoring for operational technology environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Web App Scanning and Patch Management$q$, $q$Additional specialized modules for web application and patch risk management.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Broad coverage spanning IT, cloud, identity, OT, and AI attack surfaces$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus is a widely used, dedicated vulnerability scanner product$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Published starting prices exist for some products (e.g. Tenable One VM, Nessus editions)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Named a leader by Gartner, IDC, and Forrester in 2025 per the vendor$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Full Tenable One platform pricing beyond the base tier is not fully itemized on the public site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Multiple separate product lines (Nessus, Tenable One, OT Security, etc.) can add complexity when choosing a package$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Headquarters location is not stated on the pages reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$What is Tenable One?$q$, $q$Tenable One is the company's flagship AI-powered exposure management platform, unifying visibility across infrastructure, cloud, identity, OT, and AI environments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$How much does Nessus cost?$q$, $q$Nessus Professional is priced at $4,790/year and Nessus Expert at $6,790/year.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$When was Tenable founded?$q$, $q$Tenable was founded in 2002.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Does Tenable offer multi-year pricing discounts?$q$, $q$Yes, multi-year discounts are available according to the vendor.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Enterprise vulnerability management$q$, $q$Security teams use Tenable One for unified exposure visibility across their attack surface.$q$, $q$Enterprise security/CISO teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Standalone vulnerability scanning$q$, $q$Teams use Nessus Professional or Expert for dedicated vulnerability scans.$q$, $q$Security analysts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$OT/industrial security$q$, $q$Organizations with operational technology environments monitor OT-specific risks.$q$, $q$Industrial/critical infrastructure security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Tenable One Vulnerability Management$q$, $q$$3,500/year (100 assets)$q$, $q$annual$q$, $q$["Unified visibility across infrastructure, cloud, identity, OT, and AI","Hexa AI agentic orchestration","Native third-party connectors"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus Professional$q$, $q$$4,790/year$q$, $q$annual$q$, $q$["Vulnerability scanning"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$Nessus Expert$q$, $q$$6,790/year$q$, $q$annual$q$, $q$["Vulnerability scanning","Expanded scanning capabilities beyond Professional edition"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$overview$q$, $q$What is Tenable?$q$, 2, ARRAY[$q$Tenable is a cybersecurity company specializing in exposure management, helping organizations identify and close gaps between vulnerability detection and actual exploitation across their attack surface.$q$, $q$Its flagship product, Tenable One, unifies visibility across IT infrastructure, cloud, identity, operational technology (OT), and AI environments, alongside standalone products like the Nessus vulnerability scanner.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', $q$who-its-for$q$, $q$Who Tenable is for$q$, 2, ARRAY[$q$Founded in 2002, Tenable serves enterprise security teams and CISOs across sectors including financial services, healthcare, energy, and government who need to manage vulnerabilities across complex, hybrid environments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c7a39bfe-434a-4f64-8bf3-c8fb3d8d9406', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Rapid7 ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rapid7 is a managed cybersecurity platform offering MDR, exposure management, vulnerability management, and cloud security (CNAPP).$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rapid7 delivers managed detection and response, exposure management, and cloud security through its Command platform for 11,000+ organizations.$q$,
  og_description = $q$Rapid7 delivers managed detection and response, exposure management, and cloud security through its Command platform for 11,000+ organizations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '13b772a5-dcc4-4861-96b2-092a5abf26bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '13b772a5-dcc4-4861-96b2-092a5abf26bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Managed Detection and Response (MDR)$q$, $q$24x7 XDR monitoring, remediation, and digital forensics/incident response from Rapid7 experts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Exposure Management$q$, $q$Continuous assessment of an organization's attack surface with contextual risk prioritization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Attack Surface Management (ASM)$q$, $q$Unified asset visibility across an organization's digital estate.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Next-Gen SIEM$q$, $q$Cloud-first threat detection and centralized security event analysis.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Cloud Security (CNAPP)$q$, $q$Protection and posture management across multi-cloud environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Vulnerability Management$q$, $q$Risk assessment and remediation guidance across hybrid IT environments.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Application Security$q$, $q$Security testing and monitoring for custom application code.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Broad security platform spanning MDR, vulnerability management, cloud security, and SIEM under one company$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$24/7 human-led SOC combined with AI-driven detection$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Serves more than 11,000 organizations globally across multiple industries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Integrated 'Command' platform reduces need for multiple point tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Pricing is not published on the site and requires contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Founding year and headquarters are not disclosed on the pages reviewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Enterprise-oriented product suite aimed primarily at organizations with dedicated security teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$What does Rapid7 offer?$q$, $q$Rapid7 offers managed detection and response, exposure and vulnerability management, cloud security (CNAPP), next-gen SIEM, threat intelligence, and application security, unified under its Command platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Is Rapid7 pricing publicly listed?$q$, $q$No, Rapid7 does not publish pricing on its site; prospective customers must contact sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Does Rapid7 use AI?$q$, $q$Yes, Rapid7 markets its platform as 'AI-powered' with an AI engine supporting its security operations alongside human analysts.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Who uses Rapid7?$q$, $q$Rapid7 states it serves more than 11,000 global organizations, including customers in finance, transportation, entertainment, and manufacturing.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Managed threat detection and response$q$, $q$Organizations without a large in-house SOC use Rapid7's MDR for 24/7 monitoring and incident response.$q$, $q$Security and IT teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Attack surface and vulnerability management$q$, $q$Continuous scanning and prioritization of vulnerabilities across hybrid environments.$q$, $q$Enterprise security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$Cloud security posture$q$, $q$CNAPP capabilities to secure multi-cloud infrastructure.$q$, $q$Cloud and DevSecOps teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$overview$q$, $q$What is Rapid7?$q$, 2, ARRAY[$q$Rapid7 is a cybersecurity company that provides an integrated platform, branded Rapid7 Command, covering managed detection and response, exposure management, vulnerability management, cloud security, next-gen SIEM, threat intelligence, and application security.$q$, $q$The company states it serves more than 11,000 organizations worldwide and combines 24/7 human-led SOC monitoring with AI-assisted detection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', $q$who-its-for$q$, $q$Who Rapid7 is for$q$, 2, ARRAY[$q$Rapid7 targets mid-market and enterprise organizations that need managed security operations, attack surface visibility, and vulnerability management, spanning industries such as finance, transportation, manufacturing, and entertainment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13b772a5-dcc4-4861-96b2-092a5abf26bb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Huntress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Huntress is a managed cybersecurity platform providing 24/7 human-led threat detection across endpoints, identities, and SIEM for SMBs and MSPs.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$2.08/month per user (Managed SAT); per-product pricing varies, e.g. $8.99/month per endpoint for Managed EDR$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Huntress is a managed security platform offering 24/7 human-led EDR, identity threat detection, SIEM, and security awareness training for SMBs and MSPs.$q$,
  og_description = $q$Huntress is a managed security platform offering 24/7 human-led EDR, identity threat detection, SIEM, and security awareness training for SMBs and MSPs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6519e387-8e19-4973-8093-cbf36862242e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6519e387-8e19-4973-8093-cbf36862242e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed EDR$q$, $q$Endpoint detection and response with 24/7 SOC monitoring, starting at $8.99/month per endpoint (50-endpoint minimum).$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed ITDR$q$, $q$Identity Threat Detection and Response for Microsoft 365 and Google Workspace, at $4.80/month per identity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed SIEM$q$, $q$Security information and event management billed per data source, at $4.00/month per source.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed SAT$q$, $q$Security awareness training with phishing simulations, at $2.08/month per learner.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed ISPM$q$, $q$Identity Security Posture Management that hardens Microsoft 365 configurations, at $4.00/month per identity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed ESPM$q$, $q$Endpoint Security Posture Management, currently listed as coming soon.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Transparent, published per-unit pricing across all core products$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$24/7 human-led Security Operations Center backing every plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Covers endpoints, identities, SIEM data sources, and security awareness training in one vendor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Full-featured free trial available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Each product requires a 50-unit minimum (endpoints, identities, sources, or learners)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Standard contracts run 12 months$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed ESPM is not yet generally available$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Headquarters and company size are not disclosed on the pages reviewed$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Is there a free trial of Huntress?$q$, $q$Yes, Huntress offers a full-featured trial with 24/7 SOC support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$What is the minimum size to buy Huntress?$q$, $q$Each Huntress product (EDR, ITDR, SIEM, SAT, ISPM) has a 50-unit minimum, e.g. 50 endpoints or 50 learners.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$When was Huntress founded?$q$, $q$Huntress was founded in 2015.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Who is Huntress built for?$q$, $q$Huntress targets small and mid-sized businesses and the managed service providers (MSPs) that support them.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Outsourced 24/7 SOC for SMBs$q$, $q$Small businesses without in-house security staff use Huntress's managed EDR and SIEM for continuous threat monitoring.$q$, $q$Small to mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$MSP security stack$q$, $q$Managed service providers resell Huntress products across their client base.$q$, $q$MSPs and resellers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Microsoft 365 / Google Workspace identity protection$q$, $q$Managed ITDR and ISPM harden and monitor cloud identity platforms.$q$, $q$IT teams using Microsoft 365 or Google Workspace$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed EDR$q$, $q$$8.99/month per endpoint$q$, $q$monthly$q$, $q$["24/7 threat detection and response","Free managed antivirus","Custom incident reporting","50 endpoint minimum"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed ITDR$q$, $q$$4.80/month per identity$q$, $q$monthly$q$, $q$["24/7 human-led SOC monitoring","Privilege escalation and login event monitoring","Automated threat remediation","50 identity minimum"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed SIEM$q$, $q$$4.00/month per data source$q$, $q$monthly$q$, $q$["Pooled storage allocation","No overage charges","Extended retention","50 source minimum"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed SAT$q$, $q$$2.08/month per learner$q$, $q$monthly$q$, $q$["Phishing simulation","Automated reporting","Customizable training content","50 learner minimum"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$Managed ISPM$q$, $q$$4.00/month per identity$q$, $q$monthly$q$, $q$["Microsoft 365 hardening","Drift detection in ~15 minutes","Learning Mode policy preview","50 identity minimum"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$overview$q$, $q$What is Huntress?$q$, 2, ARRAY[$q$Huntress, founded in 2015, is a managed cybersecurity platform that pairs a 24/7 human-led SOC with products for endpoint detection and response, identity threat detection, SIEM, security posture management, and security awareness training.$q$, $q$Pricing is published per unit for each product, with a 50-unit minimum, and the company states it serves 268,000+ organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', $q$who-its-for$q$, $q$Who Huntress is for$q$, 2, ARRAY[$q$Huntress is built for small and mid-sized businesses and the MSPs that serve them, across sectors including education, healthcare, financial services, manufacturing, law, and government.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6519e387-8e19-4973-8093-cbf36862242e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Vanta ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vanta is a compliance automation platform that continuously monitors security controls and streamlines audits for SOC 2, ISO 27001, HIPAA, and other frameworks.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2018,
  company_size = NULL,
  headquarters = $q$San Francisco, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Vanta automates compliance monitoring, audit evidence collection, risk management, and vendor risk across SOC 2, ISO 27001, HIPAA, and more.$q$,
  og_description = $q$Vanta automates compliance monitoring, audit evidence collection, risk management, and vendor risk across SOC 2, ISO 27001, HIPAA, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'afc32d91-8855-4308-bcef-20828d9e78e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'afc32d91-8855-4308-bcef-20828d9e78e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Automated Compliance$q$, $q$Continuous monitoring and status tracking across multiple compliance frameworks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Risk Management$q$, $q$Centralized visualization and management of organizational risk.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Third-Party Risk Management (TPRM)$q$, $q$Vendor assessment and ongoing monitoring.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Audit Automation$q$, $q$Streamlined audit preparation and automated evidence collection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Questionnaire Automation$q$, $q$AI-powered responses to incoming security questionnaires.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Trust Center$q$, $q$Public-facing dashboard that showcases an organization's compliance status.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Vanta AI Agent$q$, $q$AI assistant for drafting policies, completing questionnaires, and flagging compliance issues.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Supports SOC 2, ISO 27001, HIPAA, GDPR, HITRUST, FedRAMP, CMMC, and 15+ other frameworks$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$AI agent automates policy drafting and security questionnaire responses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Integrates with 400+ tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Used by 16,000+ customers across startups, mid-market, and enterprise$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Pricing across all tiers (Essentials, Plus, Professional, Enterprise) is quote-based and not published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Comparing plans requires requesting a demo since feature-to-price mapping isn't public$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Company size is not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Does Vanta publish its pricing?$q$, $q$No, all Vanta plans (Essentials, Plus, Professional, Enterprise) require contacting sales for a custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$What compliance frameworks does Vanta support?$q$, $q$Vanta supports SOC 2, ISO 27001, HIPAA, GDPR, HITRUST, NIST AI RMF, ISO 42001, FedRAMP, CMMC, and 15+ additional frameworks.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$When was Vanta founded?$q$, $q$Vanta was founded in 2018.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Where is Vanta headquartered?$q$, $q$Vanta lists San Francisco and New York, USA as its primary U.S. offices and operates as remote-first, with additional offices in Sydney, Dublin, and London.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$First-time SOC 2 or ISO 27001 certification$q$, $q$Startups automate evidence collection to prepare for their first compliance audit.$q$, $q$Startups$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Ongoing GRC program management$q$, $q$Mid-market and enterprise teams manage risk, audits, and multiple frameworks continuously.$q$, $q$GRC and security teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Vendor risk assessment$q$, $q$Security teams use TPRM to assess and monitor third-party vendors.$q$, $q$Enterprise security teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Essentials$q$, $q$Custom (quote-based)$q$, NULL, $q$["One compliance framework","Basic Vanta AI Agent","Automated evidence collection","Basic reporting","Trust Center access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Plus$q$, $q$Custom (quote-based)$q$, NULL, $q$["Everything in Essentials","Expanded AI features","AI-powered questionnaire automation (25/year)","Access management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Professional$q$, $q$Custom (quote-based)$q$, NULL, $q$["Everything in Plus","Risk management","Advanced Trust Center","Custom monitoring","Advanced reporting (6 customizable reports)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$Enterprise$q$, $q$Custom (quote-based)$q$, NULL, $q$["Fully customizable package","Advanced GRC needs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$overview$q$, $q$What is Vanta?$q$, 2, ARRAY[$q$Vanta, founded in 2018 and headquartered in San Francisco, is a compliance automation platform that continuously monitors security controls, automates audit evidence collection, and manages risk across frameworks like SOC 2, ISO 27001, HIPAA, and GDPR.$q$, $q$Its Vanta AI Agent assists with drafting policies, completing security questionnaires, and identifying compliance gaps.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', $q$who-its-for$q$, $q$Who Vanta is for$q$, 2, ARRAY[$q$Vanta serves startups pursuing their first compliance certification as well as mid-market and enterprise teams that need ongoing GRC, risk, and vendor-risk management, across healthcare, fintech, government, and software industries.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('afc32d91-8855-4308-bcef-20828d9e78e2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Fillout ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Fillout is an all-in-one form, quiz, and survey builder with drag-and-drop design, conditional logic, payments, and 50+ integrations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month (Starter plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Fillout is a drag-and-drop form, quiz, and survey builder with a free plan, AI tools, payments, and 50+ integrations for teams of any size.$q$,
  og_description = $q$Fillout is a drag-and-drop form, quiz, and survey builder with a free plan, AI tools, payments, and 50+ integrations for teams of any size.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e77aef61-9ca8-4e8b-8c7c-e11365f41e17' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Drag-and-drop builder$q$, $q$Customizable themes, fonts, logos, and CSS for building forms visually.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Smart form automation$q$, $q$Intelligent routing and conditional logic to reduce manual follow-up work.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Secure/login forms$q$, $q$Respondents can log in to edit their existing submissions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Analytics and collaboration$q$, $q$Track response data and collaborate with a team in real time.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$White-label options$q$, $q$Custom domains, branding control, and custom share links on higher tiers.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Multiple embed formats$q$, $q$Popup, slider, side tab, and full-screen embed options.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$AI form/quiz/survey tools$q$, $q$AI-assisted creation of forms, quizzes, and surveys, plus a Google Forms import tool.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Free plan includes 1,000 responses/month with unlimited forms, seats, and questions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$No per-seat charges on any plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$AI-assisted form, quiz, and survey creation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$50+ native integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Branding removal, custom CSS, and custom fonts require the Pro plan ($40/month) or higher$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Custom domains and form analytics require the Business plan ($75/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$SSO and advanced audit logs are Enterprise-only and require a custom quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Does Fillout have a free plan?$q$, $q$Yes, Fillout's Free plan includes 1,000 responses/month with unlimited forms, seats, and questions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$What is Fillout's starting paid price?$q$, $q$The Starter plan is $15/month ($180/year billed annually) for 2,000 responses/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Does Fillout charge per seat?$q$, $q$No, Fillout states there are no per-seat charges on any plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Does Fillout use AI?$q$, $q$Yes, Fillout offers an AI agent for form creation along with AI quiz, survey, and form builder tools.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Lead-gen quizzes and surveys$q$, $q$Marketers build quizzes and surveys using the AI-assisted builder and conditional logic.$q$, $q$Marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Internal data-collection forms$q$, $q$Teams build secure, login-gated forms that respondents can edit after submission.$q$, $q$Operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Event registration and job applications$q$, $q$Organizations use embeddable forms for registrations and applications.$q$, $q$Nonprofits and government organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1,000 responses/month","Unlimited forms, seats, and questions","50+ field types","Payments, PDF generation, conditional logic"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Starter$q$, $q$$15/month ($180/year annual)$q$, $q$monthly$q$, $q$["2,000 responses/month","All question types","Custom endings","Login forms","Redirect on completion"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Pro$q$, $q$$40/month ($480/year annual)$q$, $q$monthly$q$, $q$["5,000 responses/month","Custom emails","Remove branding","Custom share links","Custom fonts & favicon","Custom CSS"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Business$q$, $q$$75/month ($900/year annual)$q$, $q$monthly$q$, $q$["Unlimited responses/month","Form analytics","Custom domain","Custom code","Partial submissions","Priority support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$Enterprise$q$, $q$Custom (quote-based)$q$, NULL, $q$["SSO","1M+ database records","Unlimited workflow runs","Audit logs","Dedicated support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$overview$q$, $q$What is Fillout?$q$, 2, ARRAY[$q$Fillout is a form, quiz, and survey builder with a drag-and-drop editor, conditional logic, payments, and 50+ integrations, used by the company's stated 100,000+ organizations, including government, food-service, and nonprofit customers.$q$, $q$Its Free plan covers 1,000 responses/month with unlimited forms and seats, while paid Starter, Pro, and Business tiers add branding removal, custom domains, and analytics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', $q$who-its-for$q$, $q$Who Fillout is for$q$, 2, ARRAY[$q$Fillout suits marketers, operations teams, and nonprofits or public-sector organizations that need customizable, embeddable forms without per-seat pricing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e77aef61-9ca8-4e8b-8c7c-e11365f41e17', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Feathery ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Feathery is a forms and workflow automation platform for financial services firms, combining forms, e-signatures, document intelligence, and an AI assistant.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Feathery automates forms, e-signatures, and document intelligence for wealth management and insurance firms, with an AI assistant that builds workflows.$q$,
  og_description = $q$Feathery automates forms, e-signatures, and document intelligence for wealth management and insurance firms, with an AI assistant that builds workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'acaa6370-6b47-4ce4-a037-fe2c52fd137b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'acaa6370-6b47-4ce4-a037-fe2c52fd137b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Forms$q$, $q$Pixel-perfect forms with advanced conditional logic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Document Templates & eSignatures$q$, $q$Fill out, generate, and sign documents within a workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Document Intelligence$q$, $q$Extracts structured data from documents with stated 98%+ accuracy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Meeting & Audio Intelligence$q$, $q$Extracts data from meetings and audio recordings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Collaborative Workflows$q$, $q$Multi-user approvals and routing across a workflow.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$White Label Editor$q$, $q$Feathery's editor can be embedded directly into a company's own product.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Robin AI Assistant$q$, $q$Describe a workflow in plain language and Robin builds and deploys it.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Free plan with unlimited questions, pages, seats, and conditions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$SOC 2 Type II and HIPAA compliant$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$AI assistant (Robin) generates workflows from natural-language descriptions$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$150+ integrations including Salesforce, Guidewire, and HubSpot$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Free plan is capped at 500 monthly submissions and 5 live forms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Growth and Business plan pricing is quote-based and not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Positioned specifically for financial services rather than general-purpose forms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Does Feathery have a free plan?$q$, $q$Yes, the Free plan includes unlimited questions, seats, pages, and conditions, with 500 monthly submissions and 5 live forms.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Is Feathery's paid pricing public?$q$, $q$No, the Growth and Business plans require contacting sales for a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Who is Feathery built for?$q$, $q$Feathery targets registered investment advisors, broker-dealers, banks, insurance carriers, and insurance brokers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Does Feathery use AI?$q$, $q$Yes, its Robin AI assistant builds and deploys workflows from natural-language descriptions, and Document Intelligence extracts structured data automatically.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Wealth management account opening$q$, $q$RIAs and broker-dealers use Feathery forms and e-signatures to speed up account opening.$q$, $q$Registered Investment Advisors$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Insurance quoting$q$, $q$Insurance carriers use Feathery to reduce time-to-quote.$q$, $q$Insurance carriers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Broker proposal generation$q$, $q$Insurance brokers and wholesalers automate proposal generation with Feathery workflows.$q$, $q$Insurance brokers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Unlimited questions, seats, pages & conditions","500 monthly submissions","5 live forms","10MB file upload limit","Standard integrations","SOC 2 compliance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Growth$q$, $q$Custom (quote-based)$q$, NULL, $q$["Custom monthly submissions and live forms","Branding removal","Custom HTML/CSS","SSO, audit logs","White label editor","HIPAA, GDPR compliance"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$Business$q$, $q$Custom (quote-based)$q$, NULL, $q$["All Growth features","Data sovereignty options","Priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$overview$q$, $q$What is Feathery?$q$, 2, ARRAY[$q$Feathery is a forms and workflow automation platform built for financial services, combining forms with advanced logic, e-signatures, document intelligence, and audio/meeting data extraction.$q$, $q$Its Robin AI assistant lets users describe a workflow in plain language and have it built and deployed automatically.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', $q$who-its-for$q$, $q$Who Feathery is for$q$, 2, ARRAY[$q$Feathery is built for registered investment advisors, broker-dealers, banks, insurance carriers, and insurance brokers automating client-facing paperwork and workflows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acaa6370-6b47-4ce4-a037-fe2c52fd137b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Formbricks ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Formbricks is an open-source experience management platform for building and deploying surveys across websites, apps, and emails, with self-hosting available.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$74/month (Pro plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Formbricks is an open-source survey and experience management platform with a free Hobby plan, self-hosting, and multi-channel deployment.$q$,
  og_description = $q$Formbricks is an open-source survey and experience management platform with a free Hobby plan, self-hosting, and multi-channel deployment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6b896e4-5bf3-4a3c-9f83-469792152818';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6b896e4-5bf3-4a3c-9f83-469792152818' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Multi-channel surveys$q$, $q$Deploy surveys on websites, in emails, and within apps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Event-based triggering$q$, $q$Launch surveys at specific moments in the user journey.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Audience segmentation$q$, $q$Target surveys based on custom user attributes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Centralized analytics$q$, $q$Consolidate feedback across multiple touchpoints.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Open source & self-hosting$q$, $q$Full source code available on GitHub; can be self-hosted instead of using the cloud service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$AI labeling and translations$q$, $q$Scale/Pro plans include AI-based feedback labeling and AI translations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Fully open source with a self-hosting option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Free Hobby plan includes 250 responses/month and full API access$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$SOC 2 Type II and ISO 27001 certified$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$14-day free trial of Pro features with no credit card required$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Response volume beyond the free tier requires Pro ($74/month) or Scale ($325/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$AI feedback labeling and quota management are limited to the Scale plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Cloud Hobby plan is limited to 1 workspace$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Is Formbricks open source?$q$, $q$Yes, Formbricks is fully open source with code available on GitHub, and it can be self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Does Formbricks have a free plan?$q$, $q$Yes, the Hobby plan is free and includes 250 responses/month and full API access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Is there a free trial?$q$, $q$Yes, all Pro plan features are free to try for 14 days with no credit card required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$What certifications does Formbricks have?$q$, $q$Formbricks is SOC 2 Type II certified and ISO 27001 certified, and states GDPR and CCPA compliance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$In-app and website feedback$q$, $q$Product teams trigger surveys based on user behavior across websites and apps.$q$, $q$Product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Self-hosted survey infrastructure$q$, $q$Privacy-conscious organizations self-host Formbricks instead of using the cloud version.$q$, $q$Engineering and privacy-focused teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Multi-channel customer research$q$, $q$Researchers consolidate survey responses collected across web, email, and app channels.$q$, $q$Researchers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Hobby$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1 workspace","250 responses/month","Link-based and in-product surveys","Full API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Pro$q$, $q$$74/month$q$, $q$monthly$q$, $q$["3 workspaces","2,000 responses/month","Unlimited team seats","Remove branding","iOS/Android SDKs","AI translations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$Scale$q$, $q$$325/month$q$, $q$monthly$q$, $q$["5 workspaces","5,000 responses/month","Teams & access roles","Quota management","AI feedback labeling","Two-factor authentication"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$overview$q$, $q$What is Formbricks?$q$, 2, ARRAY[$q$Formbricks is an open-source experience management platform for building and deploying surveys across websites, in-app experiences, and email, with a self-hosting option alongside its cloud plans.$q$, $q$Its free Hobby plan includes full API access, while paid Pro and Scale plans add branding removal, mobile SDKs, and AI-based feedback labeling and translation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', $q$who-its-for$q$, $q$Who Formbricks is for$q$, 2, ARRAY[$q$Formbricks suits product and research teams that want multi-channel surveys, as well as privacy-conscious organizations that prefer to self-host their survey infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6b896e4-5bf3-4a3c-9f83-469792152818', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Formsort ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Formsort is a low-code, multi-step form builder for product teams, with conditional logic, A/B testing, and HIPAA/SOC 2 compliance for healthcare intake.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$279/month (Pro plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Formsort is a low-code form builder with conditional logic, A/B testing, and HIPAA/SOC 2 compliance, with a free tier and Pro plan from $279/month.$q$,
  og_description = $q$Formsort is a low-code form builder with conditional logic, A/B testing, and HIPAA/SOC 2 compliance, with a free tier and Pro plan from $279/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2118c9da-01b6-493f-b26d-224cc4de5ba8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2118c9da-01b6-493f-b26d-224cc4de5ba8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Multi-step forms with conditional logic$q$, $q$Build personalized, branching form experiences.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Dynamic forms$q$, $q$Populate answer choices dynamically from backend APIs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$A/B / split testing$q$, $q$Compare conversion rates across form variants.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Custom CSS and validation$q$, $q$Advanced styling and field-level validation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Embedded and pre-filled forms$q$, $q$Embed forms in other pages and pre-fill fields with known data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$HIPAA and SOC 2 Type II compliance$q$, $q$Secure handling suitable for patient intake and healthcare workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$EHR integration$q$, $q$Connects with electronic health record systems for healthcare workflows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Free plan includes unlimited users and forms with 100 flow starts/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$HIPAA compliance with BAA available for healthcare use cases$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Native integrations with BigQuery, Postgres, Redshift, Salesforce, and analytics tools like Segment and Amplitude$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Built-in A/B testing for form conversion optimization$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Pro plan jumps to $279/month once flow starts exceed the free tier's 100/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Enterprise pricing is custom and quote-based$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$No AI capabilities are mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Does Formsort have a free plan?$q$, $q$Yes, the Free plan supports unlimited users and forms with 100 flow starts/month, though it includes Formsort branding.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$What is Formsort's Pro plan price?$q$, $q$Pro is $279/month (or discounted with annual billing) and supports 1,000 flow starts/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Is Formsort HIPAA compliant?$q$, $q$Yes, Formsort's Enterprise plan includes HIPAA compliance with a BAA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$What integrations does Formsort support?$q$, $q$Formsort integrates with BigQuery, PostgreSQL, Redshift, Salesforce, Google Sheets, webhooks, Segment, Google Analytics, Optimizely, and Amplitude.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Patient intake forms$q$, $q$Healthcare practices use Formsort's HIPAA-compliant forms for patient intake.$q$, $q$Healthcare providers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Onboarding and check-in flows$q$, $q$Product teams build multi-step onboarding forms with conditional logic.$q$, $q$Product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Lead generation forms$q$, $q$Marketing agencies build and A/B test lead-capture forms.$q$, $q$Marketing agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["100 flow starts/month","Unlimited users and forms","Basic customization","Formsort branding included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Pro$q$, $q$$279/month$q$, $q$monthly$q$, $q$["1,000 flow starts/month","Complete design control","Remove Formsort branding","Stripe, Salesforce, webhook integrations","A/B testing and analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$Enterprise$q$, $q$Custom (quote-based)$q$, NULL, $q$["1,000+ flow starts/month","HIPAA compliance with BAA","Multiple environments","Dedicated implementation manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$overview$q$, $q$What is Formsort?$q$, 2, ARRAY[$q$Formsort is a low-code form builder that gives product teams full control over multi-step form UX, with conditional logic, dynamic API-driven fields, and built-in A/B testing.$q$, $q$It offers a free tier for smaller usage and HIPAA/SOC 2-compliant paid plans for healthcare and enterprise use.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', $q$who-its-for$q$, $q$Who Formsort is for$q$, 2, ARRAY[$q$Formsort is used by healthcare organizations for patient intake, product teams building onboarding flows, and marketing agencies building and testing lead-capture forms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2118c9da-01b6-493f-b26d-224cc4de5ba8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Formcarry ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Formcarry is a form backend service that turns plain HTML forms into working contact and order forms with email notifications and spam protection.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/month (Starter plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Formcarry is a form backend API with email notifications, spam protection, and integrations, with a free plan and paid plans starting at $5/month.$q$,
  og_description = $q$Formcarry is a form backend API with email notifications, spam protection, and integrations, with a free plan and paid plans starting at $5/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '76d62d00-398c-4138-b919-379a5ca37c2b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '76d62d00-398c-4138-b919-379a5ca37c2b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Email notifications$q$, $q$Instant email alerts for each form submission.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$File uploads$q$, $q$Accept file uploads directly from connected forms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Spam protection$q$, $q$Built-in spam blocking with a stated 98.6% accuracy rate.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Field validations$q$, $q$Automated validation of submitted form fields.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Auto responses$q$, $q$Automatic reply emails sent to form submitters.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Team collaboration$q$, $q$Invite team members into shared workspaces.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$3,000+ integrations$q$, $q$Connect submissions to CRMs, email marketing tools, and other apps.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Free BABY plan available with no cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Paid plans start as low as $5/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Works with plain HTML, jQuery, React, or Vue forms without backend code$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$GDPR and CCPA compliant with data processing agreements available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Free plan is limited to 1 form and 50 submissions/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Even the $80/month Premium plan caps submissions at 30,000/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$No free trial is mentioned for paid plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Does Formcarry have a free plan?$q$, $q$Yes, the BABY plan is free and includes 1 form and 50 submissions/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$What frameworks does Formcarry support?$q$, $q$Formcarry works with plain HTML, jQuery, React, and Vue forms.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$How is Formcarry priced?$q$, $q$Paid plans (Starter $5/mo, Basic $15/mo, Premium $80/mo) are billed annually, with a custom Enterprise option available.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Is Formcarry GDPR compliant?$q$, $q$Yes, Formcarry states GDPR and CCPA compliance with data processing agreements available.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Static site contact forms$q$, $q$Developers add working contact forms to static or JAMstack sites without a backend.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Client order and application forms$q$, $q$Agencies build order forms and job-application forms for clients.$q$, $q$Agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Spam-protected form intake$q$, $q$Teams needing built-in spam filtering without custom server logic.$q$, $q$Small businesses$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$BABY$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1 form","50 submissions/month","1 team member","File upload","Built-in integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$STARTER$q$, $q$$5/month$q$, $q$annual$q$, $q$["Unlimited forms","500 submissions/month","3 team members","1GB file upload","500 integration calls/month"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$BASIC$q$, $q$$15/month$q$, $q$annual$q$, $q$["Unlimited forms","2,000 submissions/month","5 team members","2GB file upload","2,000 integration calls/month"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$PREMIUM$q$, $q$$80/month$q$, $q$annual$q$, $q$["Unlimited forms","30,000 submissions/month","20 team members","30GB file upload","10,000 integration calls/month"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$Enterprise$q$, $q$Custom (quote-based)$q$, NULL, $q$["SLA for 99.9% uptime","Unlimited form submissions","Unlimited file uploads","Advanced customer support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$overview$q$, $q$What is Formcarry?$q$, 2, ARRAY[$q$Formcarry is a form backend service: users build their own HTML form and point it at a Formcarry API endpoint to get email notifications, file uploads, spam protection, and integrations without writing server code.$q$, $q$It offers a free BABY plan plus paid tiers billed annually, from $5/month up to a custom Enterprise plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', $q$who-its-for$q$, $q$Who Formcarry is for$q$, 2, ARRAY[$q$Formcarry is aimed at developers and agencies building contact, order, or job-application forms on static or front-end-only sites, without needing to run their own backend.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('76d62d00-398c-4138-b919-379a5ca37c2b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Formspark ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Formspark is a form-to-email backend service that lets developers collect HTML form submissions without building server infrastructure.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25 one-time (Upgrade bundle, 50% off the regular $50 price)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Ukrainian$q$]::text[],
  seo_meta_description = $q$Formspark is a form backend service with a free plan, one-time paid bundles, Slack/Zapier integrations, and support for 20+ frontend platforms.$q$,
  og_description = $q$Formspark is a form backend service with a free plan, one-time paid bundles, Slack/Zapier integrations, and support for 20+ frontend platforms.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '304e1389-15d6-4292-826c-3085c32d74e1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '304e1389-15d6-4292-826c-3085c32d74e1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Submission management$q$, $q$View submissions by email, an online dashboard, or export as CSV/JSON.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Integrations$q$, $q$Send form data to Slack, Zapier, Make, or custom webhooks.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Customization$q$, $q$Adjustable thank-you pages, redirect URLs, email templates, and error pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Multi-language support$q$, $q$Supports 10 languages, including English, Spanish, French, German, and Ukrainian.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Spam protection$q$, $q$Built-in spam filtering on all plans, plus optional Botpoison, reCAPTCHA, hCaptcha, or Turnstile.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Team collaboration$q$, $q$Unlimited team members per workspace.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Free plan included with every account (250 submissions, 10 forms)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Pay-once data bundles that don't expire, instead of a recurring subscription$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Supports 20+ frontend platforms including React, Next.js, Vue, Angular, Svelte, WordPress, and Webflow$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Multiple CAPTCHA provider options plus built-in spam filtering$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Additional capacity is sold as one-time bundles rather than a scalable recurring plan, requiring manual repurchases as usage grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Only two pricing tiers are listed (Free and one Upgrade bundle), with no mid-size recurring plan$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Does Formspark have a free plan?$q$, $q$Yes, every account includes a free tier with 250 submissions and 10 forms.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$How does Formspark pricing work?$q$, $q$Formspark uses one-time, non-expiring data bundles (e.g. $25 for 50,000 submissions and 100 forms) rather than recurring subscriptions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$What integrations does Formspark support?$q$, $q$Formspark integrates with Slack, Zapier, Make, and custom webhooks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$What platforms does Formspark support?$q$, $q$Formspark supports 20+ platforms including React, Next.js, Vue, Angular, Svelte, WordPress, Webflow, Hugo, Jekyll, and Astro.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$JAMstack contact forms$q$, $q$Freelancers and agencies embed contact forms into static or JAMstack sites.$q$, $q$Freelancers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Framework-based apps$q$, $q$Developers add form handling to React, Vue, or Next.js apps without building backend infrastructure.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Marketing form data collection$q$, $q$Marketing teams collect form submissions and route them to Slack or a CRM via Zapier.$q$, $q$Marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Free$q$, $q$$0$q$, NULL, $q$["250 submissions","10 forms","Unlimited team members"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$Upgrade$q$, $q$$25 one-time (50% off $50)$q$, NULL, $q$["50,000 submissions","100 forms","Unlimited team members","Non-expiring data bundle"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$overview$q$, $q$What is Formspark?$q$, 2, ARRAY[$q$Formspark is a form-to-email backend service that lets developers collect HTML form submissions without managing servers or databases, viewing results by email, dashboard, or CSV/JSON export.$q$, $q$Instead of monthly subscriptions, Formspark sells non-expiring data bundles that customers purchase as needed, alongside a free tier included with every account.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', $q$who-its-for$q$, $q$Who Formspark is for$q$, 2, ARRAY[$q$Formspark targets agencies, freelancers, developers, and marketing teams building forms on static sites or JAMstack frameworks who don't want to run their own backend.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('304e1389-15d6-4292-826c-3085c32d74e1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Heyflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Heyflow is a no-code funnel and interactive form builder for lead generation, with native ad tracking, payments, and appointment booking built into the flow.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$45/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Heyflow is a no-code funnel builder for lead generation with native server-side ad tracking, A/B testing, and in-flow payments, from $45/month.$q$,
  og_description = $q$Heyflow is a no-code funnel builder for lead generation with native server-side ad tracking, A/B testing, and in-flow payments, from $45/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69056d48-f2a0-4191-ac9b-4a5b7c1c0412';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69056d48-f2a0-4191-ac9b-4a5b7c1c0412' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Interactive multi-step funnels$q$, $q$Show or hide questions based on previous answers to create tailored user journeys.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Native server-side tracking$q$, $q$Built-in server-side tracking for Meta CAPI, TikTok, Google Ads, LinkedIn, and Bing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Phone-level lead validation$q$, $q$HLR and SMS OTP verification of phone numbers submitted through a flow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Built-in A/B testing$q$, $q$Compare funnel variants to improve conversion rates.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$In-flow payments, e-signatures, and booking$q$, $q$Collect Stripe payments, e-signatures, and Calendly-style appointment bookings without leaving the funnel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$50+ direct integrations plus Zapier$q$, $q$Send lead data into CRMs and other tools directly or via Zapier.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Native server-side ad tracking across major ad platforms (Meta, TikTok, Google, LinkedIn, Bing)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Supports payments, e-signatures, and appointment booking within the same funnel$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$50+ direct integrations plus Zapier access to additional apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Built-in A/B testing for funnel optimization$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Pricing scales primarily with the number of leads generated, which can raise costs at higher volumes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Unlimited visitors, quiz funnels, or the full feature suite require custom/high-volume pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Direct access to detailed product documentation was blocked during research, limiting verification of some plan specifics$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$What is Heyflow?$q$, $q$Heyflow is a no-code platform for building interactive lead-generation funnels, multi-step forms, and landing pages.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$What does Heyflow cost?$q$, $q$Heyflow plans start from $45/month, with a free test available and custom pricing for high-volume needs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Does Heyflow support ad tracking?$q$, $q$Yes, Heyflow offers native server-side tracking for Meta CAPI, TikTok, Google Ads, LinkedIn, and Bing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Can Heyflow collect payments?$q$, $q$Yes, Heyflow supports Stripe payments, e-signatures, and appointment booking directly within a funnel.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Paid lead-generation campaigns$q$, $q$Performance marketing teams build funnels optimized for cost per lead and use native ad-platform tracking.$q$, $q$Performance marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Agency client funnels$q$, $q$Agencies build interactive funnels for clients that need CRM integration and A/B testing.$q$, $q$Marketing agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$Qualify-and-collect funnels$q$, $q$Businesses qualify a lead, collect payment, and book a call in a single flow without redirects.$q$, $q$Sales and service businesses$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$overview$q$, $q$What is Heyflow?$q$, 2, ARRAY[$q$Heyflow is a no-code platform for building interactive lead-generation funnels, multi-step forms, and landing pages, positioned as a replacement for a stack of separate landing page, form, A/B testing, and tracking tools.$q$, $q$It includes native server-side tracking for major ad platforms and lets flows collect payments, e-signatures, and appointment bookings without redirecting to another tool.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', $q$who-its-for$q$, $q$Who Heyflow is for$q$, 2, ARRAY[$q$Heyflow is aimed at performance marketing teams and agencies running paid lead-generation campaigns who need conversion-optimized funnels with built-in ad tracking and CRM integrations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69056d48-f2a0-4191-ac9b-4a5b7c1c0412', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── involve.me ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$involve.me builds interactive quizzes, forms, calculators, and surveys that score leads and trigger automated email sequences.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/month$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_meta_description = $q$involve.me lets you build quizzes, forms, and calculators that score and route leads with automated email follow-ups.$q$,
  og_description = $q$involve.me lets you build quizzes, forms, and calculators that score and route leads with automated email follow-ups.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd865b7df-50df-49c9-97ab-b4f5ff75a05c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd865b7df-50df-49c9-97ab-b4f5ff75a05c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$AI funnel builder$q$, $q$Build complete funnels through a conversational AI agent.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Drag-and-drop editor$q$, $q$Create quizzes, forms, calculators, and surveys with 50+ elements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Lead scoring & routing$q$, $q$Qualify and segment leads in real time based on their answers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Automated email sequences$q$, $q$Trigger branching email workflows based on scores and engagement.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Built-in CRM$q$, $q$Store contact records with mapped properties and dynamic segments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Native payments$q$, $q$Accept payments directly in funnels via Stripe, PayPal, or Mollie.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$55+ integrations$q$, $q$Connect to HubSpot, Salesforce, ActiveCampaign, Mailchimp, Klaviyo, and Pipedrive.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$A/B testing$q$, $q$Test questions, scoring logic, designs, and email variations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Native payment processing built into funnels (Stripe, PayPal, Mollie)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$55+ native integrations plus a built-in CRM$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$SOC 2 Type II certified and GDPR-compliant$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Free plan is capped at 50 submissions or 500 visits per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Branding removal and custom domains require the Grow plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Enterprise-level features like SSO start at $399/month$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Is there a free plan?$q$, $q$Yes, involve.me offers a free plan with up to 50 submissions or 500 visits per month and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$What does the Start plan include?$q$, $q$$19/month billed annually for 3 live funnels, 1 user, email automations, conditional logic, and 30+ integrations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$What languages does involve.me support?$q$, $q$The platform is available in English and German.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Can I collect payments through involve.me?$q$, $q$Yes, native integrations with Stripe, PayPal, and Mollie let you collect payments directly in funnels.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Lead qualification funnels$q$, $q$Score and route leads to the right sales rep automatically based on quiz answers.$q$, $q$Financial advisors and insurance brokers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Product recommendation quizzes$q$, $q$Guide shoppers to the right product with a branching quiz.$q$, $q$Direct-to-consumer brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Interactive assessments$q$, $q$Deliver personalized scoring and follow-up sequences for consultation leads.$q$, $q$Consultants and coaches$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Free$q$, $q$$0$q$, NULL, $q$["Up to 50 submissions or 500 visits/month","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Start$q$, $q$$19/month$q$, $q$annual$q$, $q$["3 live funnels","1 user","Email automations","Conditional logic","30+ integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Grow$q$, $q$$49/month$q$, $q$annual$q$, $q$["5 live funnels","2 users","Branding removal","UTM parameters","1 custom domain"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Scale$q$, $q$$119/month$q$, $q$annual$q$, $q$["25 live funnels","5 users","A/B testing","Custom CSS","Webhooks"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$Enterprise$q$, $q$From $399/month$q$, $q$annual$q$, $q$["Custom limits","SSO","Security assessment","Dedicated onboarding"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$overview$q$, $q$What is involve.me?$q$, 2, ARRAY[$q$involve.me is a platform for building interactive quizzes, forms, calculators, and surveys that qualify leads through scoring and logic. Responses can trigger automated, branching email sequences and feed a built-in CRM.$q$, $q$The platform includes native payment collection (Stripe, PayPal, Mollie), 55+ integrations with tools like HubSpot and Salesforce, and an AI agent that can build a funnel from a conversation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', $q$who-its-for$q$, $q$Who involve.me is for$q$, 2, ARRAY[$q$involve.me targets businesses selling higher-value services or products, including financial advisors, insurance brokers, consultants, real estate professionals, and software companies that need to qualify leads before a sales conversation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d865b7df-50df-49c9-97ab-b4f5ff75a05c', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Outgrow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Outgrow is a no-code platform for building interactive quizzes, calculators, chatbots, and forms that qualify leads.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$14/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Florida, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Outgrow lets marketers build no-code quizzes, calculators, chatbots, and forms with 1000+ templates to generate leads.$q$,
  og_description = $q$Outgrow lets marketers build no-code quizzes, calculators, chatbots, and forms with 1000+ templates to generate leads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba73b0fc-07ff-4d10-9bbb-1291ae579cf8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$No-code builder$q$, $q$Create quizzes, calculators, chatbots, surveys, polls, forms, and assessments without coding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$1000+ templates$q$, $q$Pre-built templates across content types speed up creation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Branching logic$q$, $q$Deliver personalized outcomes based on how users answer.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Native integrations$q$, $q$Connect to CRM, email, payment, and storage platforms.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Multiple deployment options$q$, $q$Embed content, or serve it as a popup, chat, exit-intent, or dedicated subdomain.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Analytics & segmentation$q$, $q$Track performance and segment the data you collect.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Free Forms/Surveys tier requires no credit card$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$1000+ templates across content types reduce build time$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$SOC 2 Type II certified$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$7-day free trial of the Business plan without a credit card$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Free tier is limited to forms and surveys only, capped at 100 leads/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Business plan starts at $600/month billed annually$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Founding year and AI feature details are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Does Outgrow have a free plan?$q$, $q$Yes, a free Forms/Surveys tier is available with 100 leads/month and 4 content pieces.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$What is the cheapest paid plan?$q$, $q$Freelancer Limited starts at $14/month billed annually for 5 content types and 250 leads/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Is there a free trial?$q$, $q$Yes, a 7-day trial of the Business plan is offered without requiring a credit card.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Where is Outgrow based?$q$, $q$Outgrow lists its headquarters in Florida, USA.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Lead-generating calculators$q$, $q$Let shoppers calculate savings or ROI and capture their contact details.$q$, $q$E-commerce businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Interactive content marketing$q$, $q$Build quizzes and assessments to drive engagement and leads.$q$, $q$Marketing agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Chatbot-driven qualification$q$, $q$Qualify prospects conversationally before handing off to sales.$q$, $q$SaaS companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Free Forms/Surveys$q$, $q$$0/month$q$, NULL, $q$["Forms & surveys only","100 leads/month","4 content pieces"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Freelancer Limited$q$, $q$$14/month$q$, $q$annual$q$, $q$["5 content types","250 leads/month","1 user"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Freelancer Pro$q$, $q$$25/month$q$, $q$annual$q$, $q$["7 content types","1,000 leads/month","1 user"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Startup Basic$q$, $q$$35/month$q$, $q$annual$q$, $q$["7 content types","750 leads/month"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Startup Special$q$, $q$$55/month$q$, $q$annual$q$, $q$["8 content types","1,000 leads/month"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Essentials$q$, $q$$95/month$q$, $q$annual$q$, $q$["9 content types","7,500 leads/month","3 users"]$q$::jsonb, 5);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Business$q$, $q$$600/month$q$, $q$annual$q$, $q$["All content types","50,000 leads/month","10 users"]$q$::jsonb, 6);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Account manager","SSO","API access","Consulting"]$q$::jsonb, 7);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$overview$q$, $q$What is Outgrow?$q$, 2, ARRAY[$q$Outgrow is a no-code platform for building interactive content — quizzes, calculators, chatbots, surveys, polls, forms, and assessments — that qualifies leads and personalizes outcomes with branching logic.$q$, $q$The platform ships with 1000+ templates and can be deployed as an embed, popup, chat widget, exit-intent overlay, or on its own subdomain, with native integrations into CRM, email, and payment tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', $q$who-its-for$q$, $q$Who Outgrow is for$q$, 2, ARRAY[$q$Outgrow is built for marketers, agencies, e-commerce businesses, and SaaS companies that want to increase lead generation and conversion rates using interactive content instead of static forms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba73b0fc-07ff-4d10-9bbb-1291ae579cf8', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── ScoreApp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ScoreApp is an AI-powered scorecard and quiz builder that qualifies leads with personalized results and follow-up emails.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ScoreApp lets coaches and agencies build AI scorecards and quizzes that qualify leads with personalized results and automated emails.$q$,
  og_description = $q$ScoreApp lets coaches and agencies build AI scorecards and quizzes that qualify leads with personalized results and automated emails.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e479f0c5-74e4-41f4-aa19-bfdcda30ccd9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$AI scorecard & quiz builders$q$, $q$Generate scorecards, assessments, quizzes, surveys, waitlists, and forms with AI assistance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Dynamic results pages$q$, $q$Personalize the results shown to each respondent based on their answers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Drag-and-drop landing pages$q$, $q$Build customizable landing pages for each funnel.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Automated email follow-ups$q$, $q$Trigger emails based on how users respond.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$CRM integrations$q$, $q$Connect to HubSpot, Salesforce, Keap, Insightly, Mailchimp, and Kit.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$A/B testing$q$, $q$Split test scorecards on the Pro plan.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$151k+ users worldwide per the company site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$CRM integrations built into paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$14-day money-back guarantee on paid plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Free plan capped at 1 live scorecard and 10 responses/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Advanced insights, custom domain, and abandon emails require the Business plan ($99/month) or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Enterprise plan starts at $799/month and needs custom quoting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Is ScoreApp free?$q$, $q$Yes, a free plan offers 1 live scorecard and up to 10 responses per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$What does the Starter plan cost?$q$, $q$$39/month, or $30/month billed annually, for 3 live scorecards and 100 responses/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Does ScoreApp integrate with a CRM?$q$, $q$Yes, direct integrations include HubSpot, Salesforce, Keap, Insightly, Mailchimp, and Kit.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Is there a money-back guarantee?$q$, $q$Yes, ScoreApp offers a 14-day money-back guarantee.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Lead-qualifying scorecards$q$, $q$Score respondents and route qualified leads into automated follow-up emails.$q$, $q$Coaches and consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Audience assessments$q$, $q$Build assessments that segment prospects by need before a sales call.$q$, $q$Agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Event waitlists and registrations$q$, $q$Collect and qualify signups for launches or events.$q$, $q$Creators and influencers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Free$q$, $q$$0$q$, NULL, $q$["1 live scorecard","10 responses/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Starter$q$, $q$$39/month$q$, $q$monthly$q$, $q$["3 live scorecards","100 responses/month","1 user","Unlimited landing pages","CRM connectivity"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Business$q$, $q$$99/month$q$, $q$monthly$q$, $q$["10 live scorecards","1,000 responses/month","3 users","Custom domain","Abandon emails","Advanced insights"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Pro$q$, $q$$149/month$q$, $q$monthly$q$, $q$["30 live scorecards","3,000 responses/month","5 users","Data enrichment","Split testing"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$Enterprise$q$, $q$From $799/month$q$, NULL, $q$["Unlimited scalability","Unlimited seats","SSO","VIP support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$overview$q$, $q$What is ScoreApp?$q$, 2, ARRAY[$q$ScoreApp is a platform for building AI-powered scorecards, assessments, quizzes, surveys, waitlists, and forms that qualify leads and gather customer insights.$q$, $q$Each funnel can show dynamic, personalized results and trigger automated email follow-ups, with direct CRM integrations into HubSpot, Salesforce, Keap, Insightly, Mailchimp, and Kit.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', $q$who-its-for$q$, $q$Who ScoreApp is for$q$, 2, ARRAY[$q$ScoreApp is aimed at coaches, consultants, agencies, service businesses, and creators who want to attract, qualify, and engage an audience through interactive scorecards rather than static forms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e479f0c5-74e4-41f4-aa19-bfdcda30ccd9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Opinion Stage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Opinion Stage is an interactive content platform for building quizzes, polls, surveys, and forms that capture leads.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Opinion Stage lets marketers create quizzes, polls, and surveys with AI to boost engagement and capture leads.$q$,
  og_description = $q$Opinion Stage lets marketers create quizzes, polls, and surveys with AI to boost engagement and capture leads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '448308da-5605-49bb-9624-815b9f255cf3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '448308da-5605-49bb-9624-815b9f255cf3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$No-code builder$q$, $q$Create quizzes, polls, surveys, forms, and calculators from scratch, a template, or AI.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$AI-assisted creation$q$, $q$Generate interactive content and analyze response patterns with AI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Full customization$q$, $q$Control colors, fonts, logos, and layouts to match your brand.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Lead & email capture$q$, $q$Embed lead-capture forms directly inside quizzes and polls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Real-time analytics$q$, $q$Track voting results and completion trends as they happen.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Integrations$q$, $q$Connect to tools including Mailchimp and Google Sheets.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Free plan available with no credit card required, including AI creation and lead capture$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$4.8/5 rating on G2 based on 110 reviews, per the company site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Large scale claimed: 1.3M+ experiences created and 20M+ leads captured$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$20% discount for annual billing on paid tiers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Free plan limited to 25 responses/month and 2 users$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Removing Opinion Stage branding requires the Business plan ($99+/month)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Enterprise pricing is custom and quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Is Opinion Stage free?$q$, $q$Yes, a free-forever plan includes unlimited items/questions and up to 25 responses per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$What does the Pro plan cost?$q$, $q$Starting at $25/month billed annually (or $32/month billed monthly) for 1,000 responses/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Does Opinion Stage use AI?$q$, $q$Yes, AI is used to help build quizzes and polls and to analyze response patterns.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$What is Opinion Stage's G2 rating?$q$, $q$4.8 out of 5 based on 110 reviews, according to the company's site.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Lead-capture quizzes$q$, $q$Embed lead forms inside quizzes to grow an email list.$q$, $q$Marketers and publishers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Audience polls$q$, $q$Run real-time voting campaigns to drive engagement.$q$, $q$Content creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Customer feedback surveys$q$, $q$Collect structured feedback with AI-assisted analysis.$q$, $q$Startups and enterprises$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Free$q$, $q$$0/month$q$, NULL, $q$["25 responses/month","2 users","Unlimited items & questions","AI creation","Lead & email capture"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Pro$q$, $q$$25-$39/month$q$, $q$annual$q$, $q$["1,000-2,500 responses/month","3 users","Priority support & onboarding call"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Business$q$, $q$$79-$400/month$q$, $q$annual$q$, $q$["10,000-50,000 responses/month","5 users","Remove branding","Conversion tracking","Drop-off reports"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited responses","Unlimited users","Custom CSS branding","Dedicated success manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$overview$q$, $q$What is Opinion Stage?$q$, 2, ARRAY[$q$Opinion Stage is an interactive content platform for building quizzes, polls, surveys, forms, and calculators without code, using a from-scratch builder, templates, or AI.$q$, $q$Interactive content can embed lead-capture forms and is backed by real-time analytics on voting results and completion trends.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', $q$who-its-for$q$, $q$Who Opinion Stage is for$q$, 2, ARRAY[$q$Opinion Stage is used by marketers, publishers, content creators, service providers, startups, and enterprises that want to turn traffic into responses, leads, and sales through interactive content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('448308da-5605-49bb-9624-815b9f255cf3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Youform ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Youform is a free-forever form and quiz builder with an AI form generator, conditional logic, and 6,000+ Zapier integrations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Youform offers free, unlimited forms and surveys with an AI form builder, conditional logic, and native Stripe payments.$q$,
  og_description = $q$Youform offers free, unlimited forms and surveys with an AI form builder, conditional logic, and native Stripe payments.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'acb5fd7b-7099-4d41-a28a-be19f1114546';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'acb5fd7b-7099-4d41-a28a-be19f1114546' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$AI form builder$q$, $q$Describe what you need in plain English and AI builds the form's fields and questions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$30+ block types$q$, $q$Text fields, payments, signatures, schedulers, file uploads, and more.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Conditional logic$q$, $q$Forms adapt dynamically based on how a respondent answers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Partial submissions$q$, $q$Saves each answer as it's typed, even if the form isn't finished.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Multiple sharing options$q$, $q$Share via embeds, links, QR codes, email, or popups.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Analytics$q$, $q$Track views, completion rates, and drop-off per question.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Integrations$q$, $q$Connect to Stripe, Google Sheets, Notion, Slack, Calendly, Cal.com, SavvyCal, and 6,000+ apps via Zapier.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Free plan offers unlimited forms and responses with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$EU-based data hosting with GDPR compliance and TLS encryption$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Native calendar integrations (Calendly, Cal.com, SavvyCal) and 6,000+ Zapier apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$5/5 rating on Capterra per the company site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Custom domains, branding removal, and Stripe payment collection require the Pro plan ($29/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Phone/SMS verification on the Business plan requires bringing your own Twilio account$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Founding year and headquarters city are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Is Youform really free?$q$, $q$Yes, the Free plan includes unlimited forms and responses with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$What does the Pro plan add?$q$, $q$Removal of Youform branding, custom domains, Stripe payments, and advanced analytics for $29/month, or $20/month billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Does Youform have an AI form builder?$q$, $q$Yes, it generates form fields and questions from a plain-English description.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Does Youform integrate with Zapier?$q$, $q$Yes, it connects to over 6,000 apps via Zapier plus direct integrations like Calendly and Cal.com.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Free unlimited surveys$q$, $q$Run surveys without response caps on the free plan.$q$, $q$Indie creators and solo founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Payment-collecting forms$q$, $q$Collect payments directly inside a form via Stripe.$q$, $q$Small teams and freelancers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Lead-capture forms with automation$q$, $q$Send leads into Slack, Notion, or a CRM in real time.$q$, $q$Marketing professionals$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Free$q$, $q$$0$q$, NULL, $q$["Unlimited forms & responses","Conditional logic","Calculations","Google Sheets/Slack/Zapier integrations","1 user"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Pro$q$, $q$$29/month$q$, $q$monthly$q$, $q$["Branding removal","Custom domains","Stripe payments","Partial submissions","Advanced analytics","Up to 3 team members"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$Business$q$, $q$$89/month$q$, $q$monthly$q$, $q$["Email/SMS OTP verification","Activity log with CSV export","5 team members included","Extra seats at $10/month"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$overview$q$, $q$What is Youform?$q$, 2, ARRAY[$q$Youform is a form builder that positions itself as a free-forever alternative to premium form tools, offering unlimited forms and responses on its free tier.$q$, $q$It includes an AI form generator, conditional logic, partial-submission saving, and native integrations with Stripe, Google Sheets, Notion, Slack, and calendar tools like Cal.com and SavvyCal.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', $q$who-its-for$q$, $q$Who Youform is for$q$, 2, ARRAY[$q$Youform targets indie creators, small teams, and marketing professionals looking for an affordable form and survey builder without response limits on the free tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb5fd7b-7099-4d41-a28a-be19f1114546', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Cal.com ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cal.com is an open-source scheduling platform with calendar sync, built-in video calls, and Stripe-enabled bookings.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cal.com is an open-source scheduling tool with calendar sync, built-in video calls, Stripe payments, and a free plan.$q$,
  og_description = $q$Cal.com is an open-source scheduling tool with calendar sync, built-in video calls, Stripe payments, and a free plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Calendar integration$q$, $q$Prevents double-booking by syncing with connected calendars.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Custom booking links$q$, $q$Personalized links such as cal.com/username.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Cal Video$q$, $q$Built-in video conferencing for scheduled meetings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Automated reminders$q$, $q$SMS and email reminders plus follow-ups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Stripe payments$q$, $q$Charge for bookings directly through the platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Round-robin scheduling$q$, $q$Distribute bookings across a team on the Teams plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Open source$q$, $q$Source code is available on GitHub for self-hosting or customization.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Cal.ai phone agent$q$, $q$An AI phone agent that handles automated scheduling calls.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Free plan includes unlimited event types and calendars for one user$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Open-source codebase available on GitHub$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$100+ app integrations, including two-way Salesforce and HubSpot sync, on the free tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$14-day free trial on paid Teams and Organizations plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Round-robin scheduling and team features require the Teams plan ($12/user/month annual)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$SSO, SAML, and compliance checks require the Organizations plan ($28/user/month annual)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Enterprise pricing is custom and quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Is Cal.com free?$q$, $q$Yes, the Free plan supports one user with unlimited event types, calendars, and Stripe/PayPal payments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$What does the Teams plan cost?$q$, $q$$12/user/month billed annually, with a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Is Cal.com open source?$q$, $q$Yes, its source code is available on GitHub.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Does Cal.com offer AI features?$q$, $q$Yes, Cal.ai is an AI phone agent for automated scheduling.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Individual booking links$q$, $q$Share a personal link that syncs availability and books meetings automatically.$q$, $q$Solo founders and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Team round-robin scheduling$q$, $q$Distribute inbound meetings evenly across a sales team.$q$, $q$Sales teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Custom scheduling platforms$q$, $q$Build scheduling into your own product using Cal.com's open-source codebase.$q$, $q$Developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Free$q$, $q$$0$q$, NULL, $q$["1 user","Unlimited event types & calendars","Email & SMS notifications","100+ app integrations","Stripe & PayPal payments"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Teams$q$, $q$$12/user/month$q$, $q$annual$q$, $q$["Round-robin scheduling","Managed & collective event types","Recurring events","Branding removal","Booking analytics"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Organizations$q$, $q$$28/user/month$q$, $q$annual$q$, $q$["Unlimited sub-teams","Company subdomain","SAML SSO & SCIM","Compliance checks"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Dedicated onboarding & engineering support","SLA & uptime guarantees","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$overview$q$, $q$What is Cal.com?$q$, 2, ARRAY[$q$Cal.com is an open-source scheduling platform that replaces back-and-forth emails with a shareable booking link. It handles calendar syncing, timezone detection, reminders, and video calls.$q$, $q$Paid plans add round-robin scheduling, managed event types, branding removal, and enterprise features like SAML SSO and SCIM provisioning.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', $q$who-its-for$q$, $q$Who Cal.com is for$q$, 2, ARRAY[$q$Cal.com serves individuals, small businesses, sales teams, healthcare practices, and developers who want to build scheduling into their own products using its open-source codebase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aee8fc7c-2bc5-4e1a-ba70-2a8958f81cc7', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── SavvyCal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SavvyCal is a scheduling tool that shows recipients their own calendar overlaid on your availability when booking.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SavvyCal lets meeting recipients overlay their own calendar on your availability, with branding and team scheduling modes.$q$,
  og_description = $q$SavvyCal lets meeting recipients overlay their own calendar on your availability, with branding and team scheduling modes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bb0117d-0174-4a18-963f-a0a873a4b2b1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bb0117d-0174-4a18-963f-a0a873a4b2b1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Calendar overlay$q$, $q$Recipients see their own calendar events alongside your availability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Week view interface$q$, $q$Replaces traditional single day/time pickers with a full week view.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Branding customization$q$, $q$Custom colors, banner images, and avatars on booking pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Custom domains$q$, $q$White-labeled booking links on the Premium plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Buffers & limits$q$, $q$Prevent back-to-back meeting overload.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Team scheduling modes$q$, $q$Collective, Round Robin, and Group scheduling for teams.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Meeting polls$q$, $q$Let invitees vote on proposed meeting times.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Free tier lets users try the product before paying$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$30-day money-back guarantee on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Calendar overlay differentiates it from single-view competitors$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Annual billing saves 2 months compared to monthly$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Custom domains and paid bookings require the Premium plan ($17/user/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$No AI features are mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Founding year and headquarters are not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Is SavvyCal free to try?$q$, $q$Yes, users can use it for free and upgrade later; paid plans also carry a 30-day money-back guarantee.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$What does the Basic plan cost?$q$, $q$$10/user/month for unlimited calendars, unlimited links, and team scheduling.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$What does Premium add?$q$, $q$Custom domains, delegate-to-assistant access, and paid bookings for $17/user/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Does SavvyCal support team scheduling?$q$, $q$Yes, via Collective, Round Robin, and Group scheduling modes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Sales meeting scheduling$q$, $q$Let prospects overlay their calendar to pick a time that actually works.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Podcast guest booking$q$, $q$Share a branded link for guests to book recording slots.$q$, $q$Podcasters$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Client consultations$q$, $q$Offer buffers and preferred slots for one-on-one sessions.$q$, $q$Consultants and coaches$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Basic$q$, $q$$10/user/month$q$, $q$monthly$q$, $q$["Unlimited calendars","Unlimited links","Team scheduling"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$Premium$q$, $q$$17/user/month$q$, $q$monthly$q$, $q$["Everything in Basic","Custom domains","Delegate to an assistant","Paid bookings"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$overview$q$, $q$What is SavvyCal?$q$, 2, ARRAY[$q$SavvyCal is a scheduling tool built around a week-view interface where recipients can overlay their own calendar on top of your availability to pick a mutually convenient time.$q$, $q$It supports branding customization, custom domains, buffers, preferred slots, and team scheduling modes such as Collective, Round Robin, and Group.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', $q$who-its-for$q$, $q$Who SavvyCal is for$q$, 2, ARRAY[$q$SavvyCal serves individuals and teams across sales, marketing, recruiting, customer success, education, and consulting who need scheduling links that feel more collaborative than a simple grid of open slots.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bb0117d-0174-4a18-963f-a0a873a4b2b1', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Zencal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zencal is a booking platform that handles scheduling, 0%-commission payments, invoicing, and reminders.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$10/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Polish$q$]::text[],
  seo_meta_description = $q$Zencal is a booking platform with 0% commission payments, invoicing, SMS reminders, and calendar sync for teams.$q$,
  og_description = $q$Zencal is a booking platform with 0% commission payments, invoicing, SMS reminders, and calendar sync for teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bef9e8d8-86d1-4254-b054-8fdc286672d5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bef9e8d8-86d1-4254-b054-8fdc286672d5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Smart booking$q$, $q$Clients self-book available time slots online.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Calendar sync$q$, $q$Integrates with Google, Outlook, and iCloud calendars.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Payments with 0% commission$q$, $q$Built-in processing via Stripe, PayPal, PayU, P24, and tPay.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Automated reminders$q$, $q$SMS and email notifications for upcoming bookings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Team scheduling$q$, $q$Round-robin assignment with shared analytics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Invoicing$q$, $q$Invoices are automatically generated and sent to clients.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Events & bundles$q$, $q$Package multiple sessions or event registrations together.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$API & webhooks$q$, $q$Real-time event notifications for custom integrations.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$0% commission on payments processed through the platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Supports regional payment gateways including PayU, P24, and tPay$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$14-day free trial with no credit card required$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Available in English and Polish$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$No permanently free plan is offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Analytics and Events modules are not included on the entry-level Light plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Founding year and exact headquarters are not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Does Zencal have a free plan?$q$, $q$No, but it offers a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$What does the Light plan include?$q$, $q$$10/month per user for unlimited meetings and calendar connections, but no payments, invoicing, or analytics.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Does Zencal charge commission on payments?$q$, $q$No, payments processed through Zencal carry 0% commission.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$What languages does Zencal support?$q$, $q$English and Polish.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Service booking with payments$q$, $q$Sell and schedule paid sessions with 0% commission.$q$, $q$Solo professionals and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Team appointment scheduling$q$, $q$Assign incoming bookings across a team with round-robin routing.$q$, $q$Healthcare and fitness businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Consulting session bundles$q$, $q$Package and sell multiple sessions as a bundle.$q$, $q$Consultants$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Light$q$, $q$$10/month per user$q$, $q$monthly$q$, $q$["Unlimited meetings & calendar connections","Hosted profile page","Email notifications","Zoom integration","No payments/invoicing/Events/Analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Pro$q$, $q$$28/month per user$q$, $q$monthly$q$, $q$["Payments & invoicing at 0% commission","Email + SMS notifications","Team management","API & webhooks","HubSpot integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Team$q$, $q$$349/month for up to 20 users$q$, $q$monthly$q$, $q$["All Pro features","Team page","Round robin","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["20+ users","Dedicated infrastructure","Custom domain","Dedicated account manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$overview$q$, $q$What is Zencal?$q$, 2, ARRAY[$q$Zencal is an online booking platform that automates the full workflow from booking through payment and follow-up, including smart booking pages, calendar sync, and automated SMS/email reminders.$q$, $q$It processes payments with 0% commission across Stripe, PayPal, PayU, P24, and tPay, and adds automatic invoicing, round-robin team scheduling, and API/webhook access on paid plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', $q$who-its-for$q$, $q$Who Zencal is for$q$, 2, ARRAY[$q$Zencal serves solo professionals and teams of any size across industries like healthcare, fitness, consulting, and rentals who need booking, payments, and invoicing in one product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bef9e8d8-86d1-4254-b054-8fdc286672d5', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── OnceHub ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$OnceHub combines self-serve booking pages with AI phone and web chat agents to screen, route, and schedule meetings.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OnceHub pairs booking pages with AI phone and web chat agents to screen leads and schedule meetings across channels.$q$,
  og_description = $q$OnceHub pairs booking pages with AI phone and web chat agents to screen leads and schedule meetings across channels.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bde29d40-4c62-40a8-861e-ba3a8862dedc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bde29d40-4c62-40a8-861e-ba3a8862dedc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Self-serve booking pages$q$, $q$Branded pages that consolidate multiple calendars into a single smart link.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$AI phone agents$q$, $q$Automatically answer missed calls and convert them into scheduled meetings.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$AI web chatbots$q$, $q$Chatbots trained on your content answer questions and route conversations 24/7.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Lead screening$q$, $q$Qualify leads before they book a meeting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Multi-host meetings$q$, $q$Support for one-on-one, multi-host, group, and concurrent meeting types.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$CRM integrations$q$, $q$Two-way sync with Salesforce and HubSpot.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Compliance certifications$q$, $q$GDPR, PCI, HIPAA, SOC2, and FINRA certified.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Free Basic plan available with one user, one calendar, and one booking link$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$AI phone and web chat agents built natively into the platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Broad compliance certifications (HIPAA, SOC2, FINRA) suit regulated industries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$14-day free trial of the Engage plan without a credit card$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Dedicated phone numbers and routing forms require paid Schedule/Route plans$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$AI chatbot functionality is limited to the top-tier Engage plan ($39/seat/month) or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$SSO and HIPAA BAA require an additional Security & Compliance add-on ($5/seat/month)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Is OnceHub free?$q$, $q$Yes, the Basic plan is free with one user, one calendar, and one booking link.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$What does the Schedule plan cost?$q$, $q$$10/seat/month (discounted from $12) for unlimited booking links, calendars, and meetings.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Does OnceHub include AI features?$q$, $q$Yes, AI phone agents and web chatbots are available starting with the Engage plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Is there a free trial?$q$, $q$Yes, a 14-day trial of the Engage plan is available without a credit card.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Missed-call-to-meeting conversion$q$, $q$Use an AI phone agent to turn missed calls into booked meetings.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Patient and client booking$q$, $q$Screen and schedule appointments across multiple hosts.$q$, $q$Healthcare providers and coaches$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Recruiting interview scheduling$q$, $q$Route candidates to available interviewers automatically.$q$, $q$Recruiting departments$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Basic$q$, $q$$0/month$q$, NULL, $q$["1 user","1 connected calendar","1 booking link"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Schedule$q$, $q$$10/seat/month$q$, $q$monthly$q$, $q$["Unlimited booking links, calendars, and meetings","1 dedicated phone number","CRM integrations","Stripe payments"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Route$q$, $q$$19/seat/month$q$, $q$monthly$q$, $q$["Unlimited routing forms","Round-robin & dynamic distribution","Room scheduling","2 dedicated phone numbers"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Engage$q$, $q$$39/seat/month$q$, $q$monthly$q$, $q$["Unlimited chatbots and conversations","AI-driven scheduling","3 dedicated phone numbers"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["30+ users","Dedicated success manager"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$overview$q$, $q$What is OnceHub?$q$, 2, ARRAY[$q$OnceHub is an appointment scheduling and engagement platform that manages meetings across web, phone, and chat. It combines branded self-serve booking pages with AI phone agents and web chatbots that screen and route leads.$q$, $q$Paid plans add dedicated phone numbers, routing forms, round-robin distribution, and CRM integrations with Salesforce and HubSpot, backed by GDPR, PCI, HIPAA, SOC2, and FINRA certifications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', $q$who-its-for$q$, $q$Who OnceHub is for$q$, 2, ARRAY[$q$OnceHub serves remote and hybrid teams in sales, service delivery, healthcare, financial advising, academia, and recruiting that need to screen and schedule meetings across phone and web channels.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bde29d40-4c62-40a8-861e-ba3a8862dedc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── YouCanBookMe ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$YouCanBookMe lets businesses build customizable booking pages with calendar sync, payments, and automated reminders.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$YouCanBookMe offers customizable booking pages with calendar sync, Stripe payments, and automated reminders.$q$,
  og_description = $q$YouCanBookMe offers customizable booking pages with calendar sync, Stripe payments, and automated reminders.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '523ab821-6dbc-4f0a-ad9c-477f20ab7e52';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '523ab821-6dbc-4f0a-ad9c-477f20ab7e52' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Customizable booking pages$q$, $q$Add your logo, colors, and background images to match your brand.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Automated notifications$q$, $q$Confirmations, reminders, and follow-ups via email and SMS.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Payment processing$q$, $q$Accepts Apple Pay, Google Pay, and cards via Stripe.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Calendar sync$q$, $q$Connects with Google Calendar, Outlook, Apple Calendar, and Microsoft 365.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Video meeting links$q$, $q$Supports Zoom, Google Meet, and Microsoft Teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$No-show tracking$q$, $q$Analytics on cancellations and the client journey.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Group sessions & discount codes$q$, $q$Configurable session lengths, buffer times, and promo codes.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Free plan available with one calendar and one booking page$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Native Stripe integration for Apple Pay, Google Pay, and card payments$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$2-week free trial with no credit card required on paid tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$30-day money-back guarantee on paid plans$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Paid plan pricing is not published; Individual, Professional, and Team tiers require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Free plan is limited to a single calendar and single booking page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Founding year and headquarters are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Is YouCanBookMe free?$q$, $q$Yes, a Free plan offers 1 calendar connection and 1 booking page.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$How much do paid plans cost?$q$, $q$Pricing for the Individual, Professional, and Team plans is not publicly listed; you need to contact sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Is there a free trial?$q$, $q$Yes, a 2-week free trial is available with no credit card required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Does YouCanBookMe integrate with Zapier?$q$, $q$Yes, it connects to over 7,000 apps via Zapier.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Client appointment booking$q$, $q$Share a branded page for clients to self-book sessions.$q$, $q$Coaches and consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Team round-robin scheduling$q$, $q$Distribute bookings across a team automatically.$q$, $q$Sales and recruiting teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Paid session booking$q$, $q$Collect payment via Stripe when a client books a session.$q$, $q$Photographers and salons$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Free$q$, $q$$0/month$q$, NULL, $q$["1 calendar connection","1 booking page","Stripe payments","Zoom/Teams/Google Meet integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Individual$q$, $q$Contact sales$q$, NULL, $q$["2 calendar connections","2 booking pages","Custom branding","Password protection"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Professional$q$, $q$Contact sales$q$, NULL, $q$["6 calendar connections","10 booking pages","Automated workflows","HubSpot integration","Zapier access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$Team$q$, $q$Contact sales$q$, NULL, $q$["10 calendar connections per user","15+ booking pages per user","Role-based access","Round robin scheduling"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$overview$q$, $q$What is YouCanBookMe?$q$, 2, ARRAY[$q$YouCanBookMe is an online scheduling tool for creating customizable booking pages, managing appointments, and automating confirmations, reminders, and follow-ups by email and SMS.$q$, $q$It syncs with Google Calendar, Outlook, Apple Calendar, and Microsoft 365, supports Zoom/Google Meet/Teams for video meetings, and accepts payments via Stripe, including Apple Pay and Google Pay.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', $q$who-its-for$q$, $q$Who YouCanBookMe is for$q$, 2, ARRAY[$q$YouCanBookMe is used by small businesses, solopreneurs, coaches, consultants, photographers, financial planners, salons, and educators who need a branded booking page for clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('523ab821-6dbc-4f0a-ad9c-477f20ab7e52', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Setmore ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Setmore is an online appointment scheduling platform with branded booking pages, calendar sync, payments, and automated reminders.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/user/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$Portuguese$q$, $q$French$q$, $q$German$q$, $q$Italian$q$]::text[],
  seo_meta_description = $q$Setmore is free appointment scheduling software with booking pages, calendar sync, payments, and reminders for service businesses.$q$,
  og_description = $q$Setmore is free appointment scheduling software with booking pages, calendar sync, payments, and reminders for service businesses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd498e2a2-205f-436a-b281-0d60d3a97b18';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd498e2a2-205f-436a-b281-0d60d3a97b18' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Branded booking page$q$, $q$Custom online booking page showing real-time availability for clients to self-schedule.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Calendar sync$q$, $q$Two-way synchronization with Google Calendar and Office 365 to avoid double-booking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Automated reminders$q$, $q$Email confirmations and reminders, with SMS reminders available on the Pro plan.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Payment acceptance$q$, $q$Accept online and in-person payments through Stripe, Square, or PayPal.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Video appointments$q$, $q$Built-in video meeting integration with Zoom and Google Meet.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Mobile and desktop apps$q$, $q$Native apps for iOS, Android, Windows, and macOS in addition to the web dashboard.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Free plan supports up to 4 users and 200 appointments a month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Accepts payments through Stripe, Square, or PayPal at checkout$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Native mobile and desktop apps in addition to the web dashboard$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Pro plan removes appointment limits for a flat per-user price$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$SMS reminders, two-way calendar sync, and API access require the paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Free plan is capped at 4 users and 200 monthly appointments$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Booking page carries Setmore branding unless upgraded to Pro$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Is Setmore free?$q$, $q$Yes, Setmore has a free plan for up to 4 users and 200 appointments per month with a branded booking page and email reminders.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Does Setmore sync with Google Calendar?$q$, $q$Yes, Setmore syncs with Google Calendar and Office 365, with two-way sync available on the Pro plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Can clients pay when they book with Setmore?$q$, $q$Yes, Setmore integrates with Stripe, Square, and PayPal for accepting online and in-person payments.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Does Setmore have mobile apps?$q$, $q$Yes, Setmore offers native apps for iOS and Android, plus desktop apps for Windows and macOS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Client self-scheduling$q$, $q$Give clients a branded booking page to pick an available time without back-and-forth emails.$q$, $q$Service businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Paid appointment bookings$q$, $q$Collect payment at the time of booking through Stripe, Square, or PayPal.$q$, $q$Solo practitioners and small teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Multi-staff scheduling$q$, $q$Coordinate bookings across multiple staff members with unlimited users on the Pro plan.$q$, $q$Growing service teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 4 users","200 appointments/month","Branded booking page","Email reminders","Payment acceptance","iOS and Android apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Pro$q$, $q$$5/user/month$q$, $q$annual$q$, $q$["Unlimited users and appointments","2-way calendar sync","SMS reminders","Video appointments","API access","HIPAA compliance with signed BAA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom pricing for larger organizations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$overview$q$, $q$What is Setmore?$q$, 2, ARRAY[$q$Setmore is an appointment scheduling platform that gives businesses a branded online booking page, two-way calendar sync, automated reminders, and built-in payment collection.$q$, $q$It offers native apps for iOS, Android, Windows, and macOS alongside its web dashboard, and integrates with Zoom, Google Meet, Stripe, Square, and PayPal.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', $q$who-its-for$q$, $q$Who Setmore is for$q$, 2, ARRAY[$q$Setmore suits small service businesses and solo practitioners that need a free way to take online bookings, with a paid Pro plan for teams that need unlimited users, SMS reminders, and API access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d498e2a2-205f-436a-b281-0d60d3a97b18', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Appointlet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Appointlet is online meeting scheduling software with shareable booking links, calendar sync, and automated reminders.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9/member/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Appointlet lets professionals share booking links, sync Google or Outlook calendars, and automate meeting reminders online.$q$,
  og_description = $q$Appointlet lets professionals share booking links, sync Google or Outlook calendars, and automate meeting reminders online.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Scheduling pages$q$, $q$Customizable, brandable booking pages for clients to pick a meeting time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Calendar sync$q$, $q$Two-way sync with Google Calendar and Office 365 to keep availability accurate.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Automated reminders$q$, $q$Automatic invitations and reminders sent to reduce no-shows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Team scheduling$q$, $q$Distribute bookings across multiple staff members from shared scheduling pages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Web conferencing$q$, $q$Automatically generates a video conferencing room for booked meetings.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Payment collection$q$, $q$Collect payment at time of booking on the Premium plan.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Free plan requires no credit card and includes unlimited meetings$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$30-day money-back guarantee on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Annual billing gives roughly 25% savings over monthly billing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Discount available for accredited educational institutions and nonprofits$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Free plan is capped at 5 members, 25 monthly meetings, and 1 scheduling page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Payment collection and Zapier integration require the paid Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$No languages or localization details published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Is Appointlet free?$q$, $q$Yes, Appointlet has a free plan for up to 5 members with up to 25 meetings per month, no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Does Appointlet integrate with Zapier?$q$, $q$Yes, Zapier integration and webhooks are available on the Premium plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Can I collect payments through Appointlet?$q$, $q$Yes, payment collection at booking time is available on the Premium plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Does Appointlet offer a discount for nonprofits?$q$, $q$Yes, the site states a 25% discount for accredited educational institutions and nonprofits.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Sharing a booking link$q$, $q$Let prospects or clients book time directly from a personal scheduling page.$q$, $q$Consultants and salespeople$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Team meeting distribution$q$, $q$Route bookings across multiple staff members from shared scheduling pages.$q$, $q$Small sales or support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 5 members","25 meetings/month","1 scheduling page","Web conference integration","Cancel/reschedule events"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Premium$q$, $q$$9/member/month$q$, $q$annual$q$, $q$["Unlimited members and meetings","Unlimited scheduling pages","Automated reminders","Manual booking approval","Payment collection","Zapier integration and webhooks","Branding removal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Priority support","Quarterly account reviews","Advanced security measures"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$overview$q$, $q$What is Appointlet?$q$, 2, ARRAY[$q$Appointlet is online scheduling software that lets professionals share a booking link or embed a widget so clients can pick a meeting time that syncs with Google Calendar or Outlook.$q$, $q$It automatically generates a web conferencing room for each booking and can send automated confirmations and reminders.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', $q$who-its-for$q$, $q$Who Appointlet is for$q$, 2, ARRAY[$q$Appointlet fits individuals and small teams that need a free way to book meetings without a credit card, with a Premium tier for teams that need payment collection and Zapier automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1b9d7fb5-074c-4e82-9ac7-0933bc5db0cc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Calday ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Calday is online booking software for solo service providers and small businesses, with a booking page, calendar sync, and payments.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Calday gives solo service providers a booking page, calendar sync, and Stripe payments, with a free-forever plan and a $12/month upgrade.$q$,
  og_description = $q$Calday gives solo service providers a booking page, calendar sync, and Stripe payments, with a free-forever plan and a $12/month upgrade.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '59765ae5-0390-4cfe-8c3d-77fc6b87aa0d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Online booking page$q$, $q$A booking page listing services, availability, and pricing that can go live in minutes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Calendar sync$q$, $q$Appointments sync automatically with Google, Outlook, and Apple Calendar.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Automated reminders$q$, $q$Automatic email reminders sent 24 hours and 1 hour before each appointment.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Client management$q$, $q$Booking history, notes, and contact details saved per client automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Integrated payments$q$, $q$Collect deposits or full payment at booking via Stripe, with only standard Stripe fees applying.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Free-forever plan with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Month-to-month billing with no contracts or cancellation fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Calday does not add its own cut on top of Stripe processing fees$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Syncs with Google, Outlook, and Apple Calendar$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Only one paid tier is publicly listed, with less plan differentiation than some competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$No mobile app availability confirmed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Aimed mainly at solo operators and small businesses rather than large teams$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Is Calday free?$q$, $q$Yes, Calday offers a free-forever plan with core booking tools and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Does Calday take a cut of payments?$q$, $q$No, Calday connects to Stripe for payments and does not add its own fee on top of standard Stripe processing fees.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Does Calday sync with my calendar?$q$, $q$Yes, every appointment syncs automatically with Google, Outlook, and Apple Calendar.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Is there a contract with Calday?$q$, $q$No, Calday is billed month-to-month with no contracts, and you can downgrade or cancel anytime.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Solo service booking$q$, $q$Set up a booking page for appointments, on-site visits, classes, or consultations in minutes.$q$, $q$Solo operators and small service businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Deposit collection$q$, $q$Collect a deposit or full payment via Stripe at the moment a client books.$q$, $q$Service providers requiring upfront payment$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Free forever","No credit card required","Core booking tools"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$Paid$q$, $q$$12/month$q$, $q$monthly$q$, $q$["No contracts","Cancel anytime","Full booking and payment features"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$overview$q$, $q$What is Calday?$q$, 2, ARRAY[$q$Calday is booking software built for people who sell their time in person, such as 1-on-1 appointments, on-site visits, classes, consultations, and rentals.$q$, $q$It provides a booking page with services and pricing, automatic calendar sync across Google, Outlook, and Apple, and Stripe-based payment collection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', $q$who-its-for$q$, $q$Who Calday is for$q$, 2, ARRAY[$q$Calday is aimed at solo operators and small service businesses that want a simple, contract-free booking page rather than a full enterprise scheduling suite.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('59765ae5-0390-4cfe-8c3d-77fc6b87aa0d', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Doodle ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Doodle is a scheduling platform for finding meeting times through group polls, 1:1 booking pages, and calendar sync.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$6.95/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Switzerland$q$,
  languages = '{}',
  seo_meta_description = $q$Doodle helps groups agree on a meeting time with scheduling polls, branded booking pages, and calendar sync starting free.$q$,
  og_description = $q$Doodle helps groups agree on a meeting time with scheduling polls, branded booking pages, and calendar sync starting free.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f952f07d-b3f7-4527-af58-4d07608f83cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f952f07d-b3f7-4527-af58-4d07608f83cf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Group polls$q$, $q$Create a poll of proposed times and let invitees vote on what works for them.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$1:1 booking pages$q$, $q$Branded booking pages for external contacts to schedule meetings directly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Calendar sync$q$, $q$Connects to existing calendars to check availability and avoid double-booking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Payment collection$q$, $q$Collect payment for booked meetings through a Stripe integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Time protection rules$q$, $q$Set no-meeting blocks and focus-time limits to protect parts of the calendar.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Cross-timezone support$q$, $q$Shows meeting times in each participant's own timezone.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Free tier lets anyone create a scheduling poll without logging in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Rated 4.8/5 on both G2 and Capterra$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Calendar-aware time protection rules for focus time$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Built-in Stripe payment collection for paid bookings$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Detailed paid-plan pricing is not published on the main site and requires visiting a separate premium page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Full integrations list is not detailed on the homepage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Language and platform support are not documented on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Is Doodle free?$q$, $q$Yes, Doodle offers a free tier for creating scheduling polls without logging in, alongside paid premium plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Can Doodle collect payments for meetings?$q$, $q$Yes, Doodle integrates with Stripe to collect payment for booked meetings.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Does Doodle sync with my calendar?$q$, $q$Yes, Doodle connects to calendars to check availability when scheduling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Where is Doodle based?$q$, $q$Doodle describes itself as built in Switzerland.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$Group meeting polls$q$, $q$Send a poll of proposed times to a group and let them vote on what works.$q$, $q$Teams coordinating internal meetings$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$External booking pages$q$, $q$Share a branded booking page so clients or prospects can book time directly.$q$, $q$Client-facing professionals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$overview$q$, $q$What is Doodle?$q$, 2, ARRAY[$q$Doodle is a meeting scheduling platform that helps groups agree on a time through polls, offers branded 1:1 booking pages, and syncs with calendars to protect focus time.$q$, $q$It also supports payment collection for paid bookings through a Stripe integration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', $q$who-its-for$q$, $q$Who Doodle is for$q$, 2, ARRAY[$q$Doodle suits teams and individuals coordinating group meetings across multiple calendars, from a free polling tool up to paid plans for businesses needing more scheduling pages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f952f07d-b3f7-4527-af58-4d07608f83cf', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LettuceMeet ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LettuceMeet is a free group scheduling tool where participants overlay their availability on a shared grid to find the best meeting time.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LettuceMeet is a free, no-signup group scheduling tool that finds the best meeting time from everyone's shared availability.$q$,
  og_description = $q$LettuceMeet is a free, no-signup group scheduling tool that finds the best meeting time from everyone's shared availability.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '636ed515-67d3-49ef-bcc8-c781f89295ef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '636ed515-67d3-49ef-bcc8-c781f89295ef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$No account required$q$, $q$Create or join a scheduling grid without signing up for an account.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Visual availability grid$q$, $q$Participants fill in their availability on a shared grid that highlights overlapping free times.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Google Calendar overlay$q$, $q$Connect Google Calendar to view existing events underneath the availability grid.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Flexible meeting windows$q$, $q$Schedule across a single day or a range of dates, for group or one-on-one meetings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Shareable link$q$, $q$Share one link with the group so everyone can add their availability.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Completely free with no account or signup required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Simple visual grid makes comparing group availability fast$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Google and Outlook calendar overlay avoids re-entering existing events$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Works for both group meetings and one-on-one scheduling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$No paid tier or advanced team features beyond basic availability polling$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$No mobile app found on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$No enterprise, branding, or payment features for businesses$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Is LettuceMeet free?$q$, $q$Yes, LettuceMeet is a free group scheduling tool that doesn't require an account.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Do participants need to sign up?$q$, $q$No, participants can fill in their availability using just the shared meeting link.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Does LettuceMeet connect to my calendar?$q$, $q$Yes, you can connect Google Calendar to see your existing events underneath the availability grid.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Can LettuceMeet be used for one-on-one scheduling?$q$, $q$Yes, when creating a meeting you can choose between a group meeting or a one-on-one meeting.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Group study or club scheduling$q$, $q$Share a link so everyone in a group can mark their availability and find an overlapping time.$q$, $q$Student groups and clubs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$Ad hoc team meetings$q$, $q$Coordinate a one-off meeting across a team without a paid scheduling tool.$q$, $q$Small teams and organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$overview$q$, $q$What is LettuceMeet?$q$, 2, ARRAY[$q$LettuceMeet is a free group scheduling tool that replaces back-and-forth emails with a shared visual grid: each participant marks their availability, and overlapping free times are highlighted automatically.$q$, $q$It requires no account to create or join a meeting, and can overlay a connected Google Calendar to show existing events alongside the availability grid.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', $q$who-its-for$q$, $q$Who LettuceMeet is for$q$, 2, ARRAY[$q$LettuceMeet suits groups, clubs, and teams that need a quick, free way to agree on a meeting time without creating accounts or paying for a scheduling tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('636ed515-67d3-49ef-bcc8-c781f89295ef', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Zeeg ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Zeeg is scheduling software with an AI voice agent that answers calls, qualifies leads, and books appointments alongside standard booking pages.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€10/user/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Germany$q$,
  languages = ARRAY[$q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Polish$q$]::text[],
  seo_meta_description = $q$Zeeg pairs an AI voice agent that answers and qualifies calls with online booking pages, calendar sync, and CRM workflows.$q$,
  og_description = $q$Zeeg pairs an AI voice agent that answers and qualifies calls with online booking pages, calendar sync, and CRM workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3be42f56-bb10-429e-833e-4732e857fc3a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3be42f56-bb10-429e-833e-4732e857fc3a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$AI phone answering$q$, $q$An AI voice agent answers inbound calls, qualifies leads through conversation, and books the right meeting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Online booking pages$q$, $q$24/7 scheduling links for one-on-one and group meetings, with white-label branding on higher plans.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Round-robin distribution$q$, $q$Routes leads and bookings to the right team member automatically.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$CRM workflows$q$, $q$Built-in workflow automation and contact management tied to bookings.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Calendar integrations$q$, $q$Connects with Google Calendar, Outlook, Office 365, Exchange, and iCloud.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Video conferencing links$q$, $q$Automatically attaches Zoom, Google Meet, Teams, or Webex links to booked meetings.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Free Starter plan available permanently, with a 14-day free trial of paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$AI phone-answering feature is uncommon among scheduling tools$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$GDPR-compliant with data hosted in Europe$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Rated 4.9/5 across OMR, Capterra, GetApp, and G2 per the site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Group event hosting and workflow automation require the paid Professional plan or higher$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$SSO and SCIM provisioning are limited to the top Scale plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Free Starter plan is limited to 2 scheduling pages and 1 calendar connection$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Does Zeeg have a free plan?$q$, $q$Yes, Zeeg's Starter plan is free forever, with 2 active scheduling pages and 1 calendar connection.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$What does Zeeg's AI voice agent do?$q$, $q$It answers inbound calls, has a conversation to qualify the caller, and books the appropriate meeting automatically.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Is Zeeg GDPR compliant?$q$, $q$Yes, Zeeg is described as GDPR-compliant with data hosted in Europe.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Which calendars does Zeeg support?$q$, $q$Zeeg integrates with Google Calendar, Microsoft Outlook, Office 365, Exchange, and iCloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Inbound lead qualification$q$, $q$Let the AI voice agent answer calls, qualify callers, and book them with the right rep.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Solo booking page$q$, $q$Share a single scheduling link for one-on-one meetings on the free Starter plan.$q$, $q$Solo founders and consultants$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Starter$q$, $q$Free$q$, $q$monthly$q$, $q$["2 active scheduling pages","1 calendar connection","One-on-one events","Video conferencing integration","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Professional$q$, $q$€12/user/month$q$, $q$monthly$q$, $q$["4 active scheduling pages","2 calendar connections","Group event hosting","Workflow automation","Webhooks and Zapier integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Business$q$, $q$€20/user/month$q$, $q$monthly$q$, $q$["Unlimited scheduling pages","6 calendar connections","Multiuser meeting scheduling","White-label branding","Routing forms"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Scale$q$, $q$€40/user/month$q$, $q$monthly$q$, $q$["Custom CRM objects and attributes","Single sign-on (SSO)","SCIM user provisioning","Priority support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated support","Custom terms"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$overview$q$, $q$What is Zeeg?$q$, 2, ARRAY[$q$Zeeg combines a traditional online scheduling tool with an AI voice agent that can answer inbound calls, hold a qualifying conversation, and book the appropriate meeting without a human involved.$q$, $q$It also offers standard scheduling features such as booking pages, round-robin distribution, workflow automation, and calendar integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', $q$who-its-for$q$, $q$Who Zeeg is for$q$, 2, ARRAY[$q$Zeeg is aimed at sales and support teams that want inbound calls automatically qualified and booked, as well as solo professionals who just need a booking link on its free plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3be42f56-bb10-429e-833e-4732e857fc3a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Cronofy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cronofy is calendar and scheduling infrastructure that lets companies embed calendar sync, meeting scheduling, and transcription into their own apps.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cronofy is an API platform for embedding calendar sync, scheduling, and meeting transcription into other software products.$q$,
  og_description = $q$Cronofy is an API platform for embedding calendar sync, scheduling, and meeting transcription into other software products.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c6e0d85c-8664-4863-9ef9-fd20448bffd6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Calendar sync API$q$, $q$Syncs with Google, Microsoft, Apple, and Exchange calendars from a single integration.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Scheduling API$q$, $q$Handles one-on-one, panel, and multi-user scheduling with automatic conferencing link provisioning.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Meeting transcription$q$, $q$Captures recordings and transcripts with AI-generated summaries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Free sandbox$q$, $q$Connect up to 20 accounts for free with 24 hours of meeting recording included, no credit card required.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Pre-built UI components$q$, $q$Ready-made scheduling UI components in addition to raw API access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$MCP server$q$, $q$An MCP server is offered for connecting calendar data to agentic AI workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Free sandbox with no credit card required for testing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Supports Google, Microsoft, Apple, and Exchange calendars from one API$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$ISO 27001/27701/27018 certified and SOC 2 Type 2 attested$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Data centers across the US, UK, Canada, Germany, Australia, and Singapore$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Self-serve pricing is not published; plans require visiting a pricing page with a usage-based seat calculator$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Built for developers embedding scheduling into other software, not as an end-user booking app on its own$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$No mobile app or consumer-facing product described on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Is Cronofy free to try?$q$, $q$Yes, Cronofy offers a free sandbox that connects up to 20 accounts with 24 hours of meeting recording, no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$What calendars does Cronofy support?$q$, $q$Cronofy syncs with Google, Microsoft, Apple, and Exchange calendars.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Does Cronofy provide meeting transcripts?$q$, $q$Yes, Cronofy can capture recordings and transcripts with AI-generated summaries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Is Cronofy compliant with data regulations?$q$, $q$Yes, Cronofy states ISO 27001/27701/27018 certification, SOC 2 Type 2 attestation, and GDPR, CCPA, and HIPAA compliance.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$Embedded scheduling$q$, $q$Add calendar sync and scheduling to a SaaS product via API rather than building it in-house.$q$, $q$Software companies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$High-volume interview scheduling$q$, $q$Coordinate large numbers of scheduled meetings, as cited in Cronofy's recruiting case studies.$q$, $q$Recruiting and HR platforms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$overview$q$, $q$What is Cronofy?$q$, 2, ARRAY[$q$Cronofy is calendar and scheduling infrastructure that other software products embed via API to add calendar sync, meeting scheduling, and transcription without building it themselves.$q$, $q$It supports Google, Microsoft, Apple, and Exchange calendars, and offers a free sandbox for testing before moving to a paid usage-based plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', $q$who-its-for$q$, $q$Who Cronofy is for$q$, 2, ARRAY[$q$Cronofy is built for software companies and platforms, such as recruiting or CRM tools, that need to embed calendar and scheduling capability into their own product rather than end users looking for a standalone booking page.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c6e0d85c-8664-4863-9ef9-fd20448bffd6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Penpot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Penpot is an open-source design platform for UI design, prototyping, and design systems, usable in the cloud or self-hosted.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$7/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Penpot is a free, open-source design tool for UI design, prototyping, and design systems, with cloud and self-hosted options.$q$,
  og_description = $q$Penpot is a free, open-source design tool for UI design, prototyping, and design systems, with cloud and self-hosted options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e79526e3-fc9f-4ec0-848a-0c70b7a3bd92' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$UI design$q$, $q$Build responsive interfaces and interactive prototypes with CSS Grid and Flexbox layout support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Design systems$q$, $q$Create shared component libraries and design tokens across a team.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Design-to-code workflows$q$, $q$AI-assisted workflows for going between code and design.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Open file format$q$, $q$Built on open standards including CSS, HTML, SVG, and Penpot's own open file format.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Self-hosting$q$, $q$Can be self-hosted as an alternative to the cloud-hosted version.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Multiplayer collaboration$q$, $q$Real-time collaborative editing across team members.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Fully open-source, unlike most mainstream design tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Free plan supports up to 8 team members with unlimited viewers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Self-hosting option for teams that need full control over their data$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Built on open web standards (SVG, CSS, HTML) rather than a proprietary format$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Advanced admin features like SSO and audit logs require the Enterprise tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Self-hosted Private Server plan is priced at $50,000/year, out of reach for small teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Free plan is capped at 8 team members$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Is Penpot free?$q$, $q$Yes, Penpot's Professional plan is free for up to 8 team members with unlimited viewers.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Is Penpot open source?$q$, $q$Yes, Penpot is an open-source design platform built on open standards like SVG, CSS, and HTML.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Can Penpot be self-hosted?$q$, $q$Yes, Penpot offers a self-hosted Private Server option in addition to the cloud-hosted plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Does Penpot support design systems?$q$, $q$Yes, Penpot includes design components, design tokens, and shared libraries for design systems.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Open-source design workflow$q$, $q$Design UIs and prototypes without relying on a closed, proprietary file format.$q$, $q$Design teams wanting an open-source alternative$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Design-to-code handoff$q$, $q$Use design-to-code and code-to-design workflows to bridge design and development.$q$, $q$Product and engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Professional$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 8 team members","Unlimited viewers","10GB storage","7-day version history","Unlimited design files"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Unlimited$q$, $q$$7/user/month$q$, $q$monthly$q$, $q$["25GB storage","30-day version history","Early access to features","Capped at $175/month regardless of team size"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Enterprise$q$, $q$$25/user/month$q$, $q$monthly$q$, $q$["Unlimited storage","90-day version history","Centralized admin console","SSO","Audit logs"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$Private Server$q$, $q$$50,000/year$q$, $q$annual$q$, $q$["Dedicated infrastructure","Enterprise SSO","SCIM role assignment","Regional hosting options","IP whitelisting"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$overview$q$, $q$What is Penpot?$q$, 2, ARRAY[$q$Penpot is an open-source design platform for UI design, prototyping, and design systems, built on open web standards like SVG, CSS, and HTML rather than a proprietary file format.$q$, $q$It can be used as a cloud-hosted product or self-hosted on a team's own infrastructure, and includes plugin support and real-time multiplayer collaboration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', $q$who-its-for$q$, $q$Who Penpot is for$q$, 2, ARRAY[$q$Penpot suits design and product teams that want an open-source alternative to proprietary design tools, especially those that value self-hosting or working with open file formats.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e79526e3-fc9f-4ec0-848a-0c70b7a3bd92', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Lunacy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lunacy is a free graphic design app for Windows, Mac, and Linux with vector editing, offline use, and Sketch/Figma file import.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$11.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lunacy by Icons8 is a free desktop design app for Windows, Mac, and Linux with offline editing and Sketch/Figma import.$q$,
  og_description = $q$Lunacy by Icons8 is a free desktop design app for Windows, Mac, and Linux with offline editing and Sketch/Figma import.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Offline editing$q$, $q$Works fully offline as a native desktop app, unlike browser-based design tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Sketch and Figma import$q$, $q$Can open Sketch files and import designs from Figma.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Built-in design assets$q$, $q$Includes built-in vectors, photos, icons, illustrations, and UI kits.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Responsive design constraints$q$, $q$Define constraints and rules so elements adapt responsively.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Real-time collaboration$q$, $q$Collaborate on projects with live feedback, text and audio chat, and sticker reactions.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Free plan includes all major features with no ads or restrictions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Native apps for Windows, Mac, and Linux that work fully offline$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Can open Sketch files and import from Figma without conversion tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Includes built-in stock icons, illustrations, and UI kits$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$No web-based version confirmed; it is a native desktop app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$No iOS or Android app found on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Paid plan pricing and its exact feature differences from the free plan are not detailed on the main page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Is Lunacy free?$q$, $q$Yes, Lunacy's free plan includes all major features with no ads, and a paid plan is available for extra benefits starting at $11.99/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Can Lunacy open Sketch files?$q$, $q$Yes, Lunacy can open Sketch files and import designs from Figma.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Does Lunacy work offline?$q$, $q$Yes, Lunacy works offline as a native desktop application.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$What platforms does Lunacy support?$q$, $q$Lunacy has native apps for Windows, Mac, and Linux.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Offline design work$q$, $q$Design without an internet connection using a native desktop app.$q$, $q$Designers who need offline access$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$Migrating from Sketch or Figma$q$, $q$Open existing Sketch files or import Figma designs into a free tool.$q$, $q$Teams switching design tools$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$overview$q$, $q$What is Lunacy?$q$, 2, ARRAY[$q$Lunacy is a free graphic design app from Icons8 for Windows, Mac, and Linux that works fully offline and can open Sketch files or import Figma designs.$q$, $q$It includes built-in vectors, photos, icons, illustrations, and UI kits, along with responsive design constraints and real-time collaboration.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', $q$who-its-for$q$, $q$Who Lunacy is for$q$, 2, ARRAY[$q$Lunacy suits designers who want a free, native desktop alternative to browser-based tools, including those migrating existing Sketch or Figma files.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9d2f9ed7-498a-4028-a5a4-cc3e13c64bcc', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Visme ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Visme is an online design tool for creating presentations, infographics, documents, and videos using templates and an AI design assistant.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12.25/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Maryland, United States$q$,
  languages = ARRAY[$q$English$q$, $q$Spanish$q$, $q$French$q$, $q$German$q$, $q$Portuguese$q$, $q$Italian$q$, $q$Japanese$q$, $q$Hindi$q$, $q$Arabic$q$]::text[],
  seo_meta_description = $q$Visme is a design platform for presentations, infographics, and video with templates, a brand kit, and an AI design assistant.$q$,
  og_description = $q$Visme is a design platform for presentations, infographics, and video with templates, a brand kit, and an AI design assistant.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$AI Designer$q$, $q$Generates designs from text prompts to speed up the creation process.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Data visualization$q$, $q$Build interactive charts and data visualizations within a design.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Template library$q$, $q$Thousands of customizable templates for presentations, infographics, and social content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Brand kit$q$, $q$Store brand colors, fonts, and logos to keep content consistent across a team.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Social media scheduler$q$, $q$Schedule and publish social media graphics directly from Visme.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Real-time collaboration$q$, $q$Comment and collaborate on projects with teammates in real time.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Free plan available with unlimited projects, though with limited templates and assets$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Large template library covering presentations, infographics, documents, and video$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Wide integration list including HubSpot, Salesforce, Slack, and monday.com$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$5-star ratings and a G2 Leader badge cited on the site$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Free Basic plan restricts premium templates, assets, and export formats$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Advanced exports like PPTX, HTML5, and video/GIF require the Pro plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Enterprise plan requires a minimum of 10 users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Is Visme free?$q$, $q$Yes, Visme has a free Basic plan with unlimited projects, though with limited templates and assets.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Does Visme have an AI design tool?$q$, $q$Yes, Visme's AI Designer can generate designs from text prompts.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$What languages does Visme support?$q$, $q$Visme supports 15+ languages including English, Spanish, French, German, Portuguese, and Arabic.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Does Visme offer education pricing?$q$, $q$Yes, Visme offers separate Student and Educator plans, priced at $48/year and $96/year respectively.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Branded marketing content$q$, $q$Create on-brand presentations, infographics, and social graphics using a shared brand kit.$q$, $q$Marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Academic presentations$q$, $q$Build presentations and reports using discounted Student or Educator plans.$q$, $q$Students and educators$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Basic$q$, $q$$0$q$, $q$monthly$q$, $q$["Unlimited projects","Limited templates and assets","Basic support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Starter$q$, $q$$12.25/month$q$, $q$annual$q$, $q$["All premium assets","Full template access","JPG/PNG/PDF downloads","24/7 support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Pro$q$, $q$$24.75/month$q$, $q$annual$q$, $q$["PPTX/HTML5/video/GIF downloads","Brand Kit","Analytics","10GB storage","Advanced collaboration"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$Enterprise$q$, $q$Custom (10-user minimum)$q$, NULL, $q$["Custom sub-domain","SSO and 2FA","Dedicated Customer Success Manager","Project approvals"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$overview$q$, $q$What is Visme?$q$, 2, ARRAY[$q$Visme is a design platform for creating presentations, infographics, documents, reports, videos, and social media graphics using templates, an AI Designer, and a shared brand kit.$q$, $q$It supports 15+ languages and integrates with tools like HubSpot, Salesforce, Slack, monday.com, and Google Drive.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', $q$who-its-for$q$, $q$Who Visme is for$q$, 2, ARRAY[$q$Visme suits marketing teams and educators who need branded, templated visual content, with a free Basic plan for individuals and paid plans for teams needing advanced exports and collaboration.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6661ffae-4b7b-4c87-9e11-ab1ba1fe67cc', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Piktochart ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based design platform for creating infographics, reports, presentations, and visual content with AI-assisted generation.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Piktochart is a web-based infographic and design maker with templates, AI generation, and brand kits for teams and individuals.$q$,
  og_description = $q$Piktochart is a web-based infographic and design maker with templates, AI generation, and brand kits for teams and individuals.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd5db9612-39d7-4c31-8562-b26cbfaca743';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd5db9612-39d7-4c31-8562-b26cbfaca743' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$AI Infographic Generator$q$, $q$Creates infographic designs from a text prompt using AI credits.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Templates$q$, $q$Over 230 professionally designed templates across categories like timelines, comparisons, and reports.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Data visualization$q$, $q$Build pie charts, bar charts, and pictographs, with CSV, Excel, and Google Sheets import.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Brand Kit$q$, $q$Upload logos, extract brand colors, and apply custom fonts for consistent branded content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Drag-and-drop editor$q$, $q$Customize colors, fonts, and layouts without design experience.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Interactive infographics$q$, $q$Add interactive elements to infographics for audience engagement.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Free plan available with no watermark on PNG downloads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$AI credits included even on the free tier$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Dedicated Education and Nonprofit pricing tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Large template library across many content formats$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Free plan limited to 2 PNG downloads$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$PDF and PowerPoint export require a paid Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Enterprise pricing is custom/quote-only$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Web-based only, no listed desktop or mobile apps$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Is Piktochart free?$q$, $q$Yes, Piktochart has a free plan that includes unlimited visual projects, 60 AI credits, and 2 PNG downloads.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Does Piktochart use AI?$q$, $q$Yes, it includes an AI Infographic Generator and other AI design generators that use monthly AI credits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Can I export to PDF or PowerPoint?$q$, $q$PDF and PPT export are available on the Business plan and above.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Does Piktochart offer team pricing?$q$, $q$Yes, Pro and Business plans support 1-100 team members, and Enterprise supports 101+.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Marketing reports$q$, $q$Build data-driven reports and infographics from spreadsheet data.$q$, $q$Marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Educational visuals$q$, $q$Create infographics and presentations at discounted Education pricing.$q$, $q$Educators and students$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Brand-consistent content$q$, $q$Use Brand Kit to keep logos, colors, and fonts consistent across designs.$q$, $q$Small business teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["2 PNG downloads","Unlimited visual projects","60 AI credits","1GB storage","Basic templates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Pro$q$, $q$$10/month$q$, $q$annual$q$, $q$["Unlimited PNG downloads","500 AI credits","100GB storage","Premium templates","5M+ icons/illustrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Business$q$, $q$$17/month$q$, $q$annual$q$, $q$["Unlimited PNG, PDF, PPT downloads","1,000 AI credits","250GB storage","Brand Kit with unlimited colors/fonts/logos"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated account manager & training","Advanced security","SSO/SAML","Custom templates"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$overview$q$, $q$What is Piktochart?$q$, 2, ARRAY[$q$Piktochart is a cloud-based design platform for creating infographics, reports, presentations, and other visual content without design experience.$q$, $q$It combines a drag-and-drop editor with an AI Infographic Generator, template library, and data visualization tools that import from CSV, Excel, or Google Sheets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', $q$who-its-for$q$, $q$Who Piktochart is for$q$, 2, ARRAY[$q$Piktochart suits marketing teams, educators, nonprofits, and small businesses that need to turn data or text into visual reports and infographics, with dedicated discounted pricing for education and nonprofit organizations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d5db9612-39d7-4c31-8562-b26cbfaca743', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Venngage ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Web-based design platform for creating infographics, reports, and presentations with AI-assisted generation and brand kits.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$Español$q$, $q$Français$q$, $q$Italiano$q$, $q$Português$q$, $q$Deutsch$q$, $q$Arabic$q$]::text[],
  seo_meta_description = $q$Venngage is a design platform for infographics, reports, and presentations with AI generation, templates, and brand kits.$q$,
  og_description = $q$Venngage is a design platform for infographics, reports, and presentations with AI generation, templates, and brand kits.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ce3723e1-5b42-475e-a527-b5f4b7ad1088' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$DesignAI Generator$q$, $q$Generates visual designs from plain text descriptions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Templates$q$, $q$Over 10,000 customizable templates for infographics, reports, and presentations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Royalty-free assets$q$, $q$Access to 4M+ icons, illustrations, stock photos, and maps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$AI accessibility checker$q$, $q$Checks designs for WCAG compliance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Brand Kit$q$, $q$Manage brand colors, fonts, and logos for team consistency.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Real-time collaboration$q$, $q$Multiple users can edit designs together.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Multi-format export$q$, $q$Export designs as PNG, PDF, PPTX, or HTML.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Large template library with over 10,000 options$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$AI design generation and AI accessibility checker included$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Supports multiple UI languages$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Free plan available to start$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Free plan limited to 5 designs and public sharing only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$PDF and PowerPoint export require the Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Enterprise pricing requires a minimum of 10 members$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Web-based only, no listed desktop or mobile apps$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Is Venngage free?$q$, $q$Yes, Venngage has a free plan limited to 5 designs with public sharing and a free AI trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Does Venngage support multiple languages?$q$, $q$Yes, the interface supports English, Spanish, French, Italian, Portuguese, German, and Arabic.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Can I export to PDF or PowerPoint?$q$, $q$PDF and PowerPoint export are available starting on the Business plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Does Venngage have an Enterprise plan?$q$, $q$Yes, Enterprise pricing starts at $499/month with a minimum of 10 members.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Marketing infographics$q$, $q$Turn text and data into shareable infographics using DesignAI.$q$, $q$Marketing professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$HR and internal reports$q$, $q$Create branded reports and presentations for internal teams.$q$, $q$HR teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Nonprofit communications$q$, $q$Design visual content for outreach and reporting.$q$, $q$Nonprofits$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["5 designs","Public sharing","Free AI trial","Free icons and widgets","6 image uploads"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Premium$q$, $q$$10/month$q$, $q$annual$q$, $q$["Unlimited designs","PNG & HD PNG exporting","Private sharing","Email & chat support","50 image uploads"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Business$q$, $q$$24/month per user$q$, $q$annual$q$, $q$["Venngage AI","PDF and PowerPoint exporting","Brand Kits","Team sharing","Password-protected sharing"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$Enterprise$q$, $q$From $499/month$q$, $q$monthly$q$, $q$["11-100+ team size","Dedicated account manager","Multi-factor authentication","Custom API and integrations"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$overview$q$, $q$What is Venngage?$q$, 2, ARRAY[$q$Venngage is a web-based design platform for creating infographics, reports, presentations, and other visual content.$q$, $q$It pairs a drag-and-drop editor with an AI generator called DesignAI, a library of over 10,000 templates, and 4M+ royalty-free assets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', $q$who-its-for$q$, $q$Who Venngage is for$q$, 2, ARRAY[$q$Venngage is aimed at marketing professionals, HR teams, nonprofits, and enterprise organizations that need branded visual content, with multi-language support for international teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ce3723e1-5b42-475e-a527-b5f4b7ad1088', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Snappa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Web-based graphic design tool for creating social media graphics, ads, and blog images from templates.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Snappa is a web-based graphic design tool with templates, stock photos, and one-click background removal for social media graphics.$q$,
  og_description = $q$Snappa is a web-based graphic design tool with templates, stock photos, and one-click background removal for social media graphics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Templates$q$, $q$Thousands of pre-made templates sized for social media, ads, and blogs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Stock photo library$q$, $q$Access to over 5,000,000 free, high-resolution stock photos.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Background removal$q$, $q$One-click background removal for photos.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Image dimension presets$q$, $q$Presets for common social media and ad platform sizes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Fonts and vectors$q$, $q$200+ fonts and 100,000+ vectors and shapes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Buffer integration$q$, $q$Schedule and share designs to social media via Buffer.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Free Starter plan with no cost to begin$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Large stock photo and template library included in all plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$One-click background removal built in$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Buffer integration for direct social scheduling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Free plan limited to 3 downloads per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Team plan limited to 5 users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$No languages, mobile app, or desktop app listed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Is Snappa free?$q$, $q$Yes, Snappa has a free Starter plan limited to 3 downloads per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Does Snappa include stock photos?$q$, $q$Yes, all plans include access to over 5,000,000 free, high-resolution stock photos and graphics.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Can I schedule posts from Snappa?$q$, $q$Yes, Snappa integrates with Buffer for social media sharing and scheduling.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$How much does Snappa cost?$q$, $q$Pro is $15/month (or $10/month billed yearly) and Team is $30/month (or $20/month billed yearly) for 5 users.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Social media graphics$q$, $q$Create graphics sized for specific social platforms using templates.$q$, $q$Content creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Blog and ad visuals$q$, $q$Design blog headers and advertisements without a designer.$q$, $q$Non-designers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Team content production$q$, $q$Collaborate on graphics with up to 5 users on the Team plan.$q$, $q$Small marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Starter$q$, $q$$0$q$, $q$monthly$q$, $q$["1 user","6,000+ templates","5,000,000+ HD photos & graphics","3 downloads per month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Pro$q$, $q$$15/month$q$, $q$monthly$q$, $q$["1 user","Unlimited downloads","Buffer integration","Custom font uploads","Background removal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$Team$q$, $q$$30/month$q$, $q$monthly$q$, $q$["5 users","Unlimited downloads","Buffer integration","Custom font uploads","Team collaboration"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$overview$q$, $q$What is Snappa?$q$, 2, ARRAY[$q$Snappa is a web-based graphic design tool for creating graphics for social media, advertisements, and blogs without design expertise.$q$, $q$It provides thousands of templates, a library of over 5,000,000 stock photos, and one-click background removal, with unlimited downloads on paid plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', $q$who-its-for$q$, $q$Who Snappa is for$q$, 2, ARRAY[$q$Snappa is built for non-designers and content creators who need to produce social media and marketing graphics quickly, including small teams of up to 5 users on the Team plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7c3b2ea2-f4c8-4a51-b3bc-e498903c1fb7', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── RelayThat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Design automation platform that converts brand guidelines into resized, on-brand marketing graphics across channels.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$RelayThat automates on-brand marketing graphics with SmartLayouts, brand portals, and one-click resizing for ads and social media.$q$,
  og_description = $q$RelayThat automates on-brand marketing graphics with SmartLayouts, brand portals, and one-click resizing for ads and social media.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2b39520f-ab30-4e58-8473-236949ec4dc5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2b39520f-ab30-4e58-8473-236949ec4dc5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$SmartLayouts$q$, $q$Over 2,000 layout templates that auto-adjust to brand guidelines.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Brand portals$q$, $q$Manage brand colors, fonts, and assets in one place.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Headline Generator$q$, $q$Generates headline copy using wildcard keywords.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$One-click resizing$q$, $q$Resize a design across multiple ad sizes and social channels at once.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Royalty-free image library$q$, $q$Access to over 3 million copyright-free images.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Custom font uploads$q$, $q$Upload brand-specific fonts for use across designs.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Automated resizing across many ad and social formats at once$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Large royalty-free image library included$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Headline Generator speeds up ad copywriting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Enterprise tier offers white-label and branded sign-in options$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$No free plan; paid subscription required from the start$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Enterprise pricing is custom/quote-only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$No languages, mobile app, or desktop app listed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Does RelayThat have a free plan?$q$, $q$No, RelayThat does not offer a free plan; pricing starts at $15/month for the Pro tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$What is a SmartLayout?$q$, $q$SmartLayouts are pre-built design templates, with over 2,000 available, that adapt to a brand's colors, fonts, and assets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Can RelayThat generate ad copy?$q$, $q$Yes, its Headline Generator uses wildcard keywords to produce headline copy automatically.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Does RelayThat support team collaboration?$q$, $q$Yes, the Pro+ Plus plan includes 2 users, and Enterprise supports larger teams with branded sign-in pages.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Multi-channel ad creation$q$, $q$Resize a single design across dozens of ad and social formats at once.$q$, $q$Marketing managers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Agency campaign production$q$, $q$Manage multiple client brand portals and campaigns.$q$, $q$Agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Real estate marketing$q$, $q$Produce branded listing graphics and ads.$q$, $q$Real estate professionals$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Pro$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Single user license","Brand portals","2,000+ SmartLayouts","Headline generator","3M+ copyright-free images"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Pro+ Plus$q$, $q$$25/month$q$, $q$monthly$q$, $q$["2 users included","Team collaboration","Unlimited image downloads","Multiple project workspaces"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Branded sign-in pages","Large team collaboration","Data integration","White label options"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$overview$q$, $q$What is RelayThat?$q$, 2, ARRAY[$q$RelayThat is a design automation platform that converts brand guidelines into on-brand marketing images across multiple channels.$q$, $q$It uses SmartLayouts to automatically apply a brand's colors, fonts, and assets, and includes a Headline Generator and one-click resizing for ads and social media.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', $q$who-its-for$q$, $q$Who RelayThat is for$q$, 2, ARRAY[$q$RelayThat is aimed at marketing managers, agencies, and real estate professionals who need to produce consistent, on-brand ad creative across many formats quickly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2b39520f-ab30-4e58-8473-236949ec4dc5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Marq ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Brand enablement platform (formerly Lucidpress) for building locked templates that teams personalize while staying on-brand.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Draper, Utah$q$,
  languages = '{}',
  seo_meta_description = $q$Marq is a brand templating platform with locked brand controls, smart fields, and data automation for on-brand content at scale.$q$,
  og_description = $q$Marq is a brand templating platform with locked brand controls, smart fields, and data automation for on-brand content at scale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7d954194-528b-4c02-af62-5032ccb9918a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7d954194-528b-4c02-af62-5032ccb9918a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Brand controls$q$, $q$Lock logos, fonts, and colors on templates so team members can't go off-brand.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Smart Fields$q$, $q$Auto-populate text and images from custom data sources.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Data automation$q$, $q$Integrate data via CSV, Google Sheets, XML, or MLS feeds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Approval workflows$q$, $q$Review and approve designs in real time before publishing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Marq AI$q$, $q$AI-powered brand guardrails and automated creative workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Print integration$q$, $q$Order print products directly from the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Analytics$q$, $q$Track template usage and performance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Free plan available to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Strong brand-locking controls for non-designers on a team$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Data automation supports CSV, Google Sheets, XML, and MLS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Print ordering built into the platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Free plan limited to 25MB storage and 3 projects$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Enterprise pricing is custom/quote-only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$No languages, mobile app, or desktop app listed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Is Marq free?$q$, $q$Yes, Marq has a free plan with 25MB storage and a 3-project limit.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Was Marq previously called something else?$q$, $q$Yes, Marq was previously known as Lucidpress before rebranding.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Does Marq support data automation?$q$, $q$Yes, it can populate templates from CSV, Google Sheets, XML, or MLS data feeds.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Does Marq have AI features?$q$, $q$Yes, Marq AI provides brand guardrails and automated creative workflows.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Franchise marketing$q$, $q$Let local franchise teams personalize approved templates without breaking brand rules.$q$, $q$Franchises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Real estate listing flyers$q$, $q$Auto-populate listing templates from MLS data.$q$, $q$Real estate professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Healthcare and education collateral$q$, $q$Produce on-brand materials across departments with approval workflows.$q$, $q$Healthcare and higher education teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["25MB cloud storage","3 project limit","Basic template library","Social sharing","Print & ship"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Pro$q$, $q$$10/month$q$, $q$monthly$q$, $q$["2GB storage","5 free design imports","Premium design library","Profile smart fields","Smart brand assets"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Team$q$, $q$$10/month per user$q$, $q$monthly$q$, $q$["2GB+ shared storage per user","15 free design imports","Admin & user roles","Advanced locking","1 custom data automation"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited storage","30+ design imports","Unlimited custom automations","API and webhook access","SSO/SCIM"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$overview$q$, $q$What is Marq?$q$, 2, ARRAY[$q$Marq, formerly known as Lucidpress, is a brand enablement platform for creating locked templates that teams can personalize while staying on-brand.$q$, $q$It offers Smart Fields for auto-populating content, data automation from sources like CSV and MLS feeds, approval workflows, and Marq AI for brand guardrails.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', $q$who-its-for$q$, $q$Who Marq is for$q$, 2, ARRAY[$q$Marq is aimed at mid to large organizations in real estate, healthcare, education, franchises, and financial services that need consistent branded content produced by non-designers across teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7d954194-528b-4c02-af62-5032ccb9918a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Kittl ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered design platform for creating branding, merchandise, and product visuals with generative image, vector, and video tools.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Kittl is an AI design platform with generative image, vector, and video tools plus templates for branding and merchandise design.$q$,
  og_description = $q$Kittl is an AI design platform with generative image, vector, and video tools plus templates for branding and merchandise design.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3823f80c-7e1b-4a40-b37f-ad8fde45d0d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$AI image generation$q$, $q$Generate images from text prompts within the editor.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$AI vector generation$q$, $q$Create vector graphics using AI models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$AI video generation$q$, $q$Generate short videos from prompts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Background removal and upscaling$q$, $q$Remove backgrounds and upscale images automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Vectorization$q$, $q$Convert raster images into vector graphics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Templates and mockups$q$, $q$Customizable templates and product mockups for branding.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Asset library$q$, $q$Access to over 1M photos, graphics, and fonts.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Free plan includes 200 one-time AI tokens to try AI tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Integrates multiple third-party AI models (ByteDance, Ideogram, Google, OpenAI, Black Forest Labs)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Real-time collaboration in an infinite-canvas editor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Broad AI toolset covering image, vector, and video generation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Free plan limited to 5 projects and one-time AI tokens rather than recurring credits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Daily AI credit caps on Pro (30/day) and Expert (80/day) plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$No languages, mobile app, or desktop app listed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Is Kittl free?$q$, $q$Yes, the Free plan includes 5 projects, 200 one-time AI tokens, and basic templates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$How much does Kittl Pro cost?$q$, $q$Pro is $19/month, or $14/month billed annually, with 30 daily AI credits.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$What AI models does Kittl use?$q$, $q$Kittl integrates AI models from ByteDance, Ideogram, Google, OpenAI, and Black Forest Labs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Can Kittl generate video?$q$, $q$Yes, its AI Creative Suite includes video generation alongside image and vector generation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Merchandise design$q$, $q$Generate and vectorize graphics for print-on-demand products.$q$, $q$Merchandise creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Brand visual creation$q$, $q$Produce branding assets using AI image and vector tools.$q$, $q$Small businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Social media content$q$, $q$Create social graphics and videos from templates and AI generation.$q$, $q$Designers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["5 projects","200 AI tokens (one-time)","Basic templates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Pro$q$, $q$$19/month$q$, $q$annual$q$, $q$["Unlimited projects","30 daily AI credits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$Expert$q$, $q$$45/month$q$, $q$annual$q$, $q$["80 daily AI credits","100GB storage"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$overview$q$, $q$What is Kittl?$q$, 2, ARRAY[$q$Kittl is an AI-powered design platform for creating branding and product visuals, combining a professional editor with generative image, vector, and video tools.$q$, $q$It integrates multiple third-party AI models and provides templates, mockups, and a library of over 1M photos, graphics, and fonts.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', $q$who-its-for$q$, $q$Who Kittl is for$q$, 2, ARRAY[$q$Kittl is built for designers, small businesses, and merchandise creators who want to combine AI generation with template-based design for branding and social content.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3823f80c-7e1b-4a40-b37f-ad8fde45d0d9', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Artboard Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Browser-based mockup generator that applies images or videos to realistic device, apparel, and packaging mockups.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Artboard Studio is a browser-based mockup generator with 5,000+ mockups, video mockups, and an AI text-to-mockup tool.$q$,
  og_description = $q$Artboard Studio is a browser-based mockup generator with 5,000+ mockups, video mockups, and an AI text-to-mockup tool.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '50c5a2e1-7d7b-4c77-8690-4b087ff79b6c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Mockup library$q$, $q$Over 5,000 mockups across devices, apparel, packaging, print, and branding.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$AI mockup generator$q$, $q$Turns a text prompt into a ready-to-use mockup.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Video mockups$q$, $q$Apply videos to mockup surfaces and export as video files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Browser-based editor$q$, $q$No software installation required to edit mockups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Figma and Adobe Express plugins$q$, $q$Integrate mockup creation into existing design workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Multi-format export$q$, $q$Export images as PNG, JPEG, or WEBP, and video as MP4 or WEBM.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Free tier available to get started$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Large mockup library covering devices, apparel, and packaging$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Video mockup support, not just static images$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Direct Figma and Adobe Express plugin integration$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Unlimited exports require the paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$No languages, mobile app, or desktop app listed on the site$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Is Artboard Studio free?$q$, $q$Yes, it offers a freemium plan; paid tiers start at $9/month billed annually.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Does Artboard Studio support video mockups?$q$, $q$Yes, users can apply videos to mockup surfaces and export as MP4 or WEBM.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Is there a Figma plugin?$q$, $q$Yes, Artboard Studio has both a Figma plugin and an Adobe Express plugin.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Is there a lifetime plan?$q$, $q$Yes, a Lifetime Mockup plan is available for a $129 one-time payment.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Portfolio presentation$q$, $q$Showcase design work on realistic device and print mockups.$q$, $q$Designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Product marketing visuals$q$, $q$Generate mockups for apparel, packaging, and branding.$q$, $q$Small businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Client case studies$q$, $q$Present client projects with polished mockup visuals.$q$, $q$Freelancers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Lite$q$, $q$$9/month$q$, $q$annual$q$, $q$["Access to mockup library"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Pro$q$, $q$$19/month$q$, $q$annual$q$, $q$["Unlimited exports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$Lifetime Mockup$q$, $q$$129 one-time$q$, NULL, $q$["One-time payment for lifetime access"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$overview$q$, $q$What is Artboard Studio?$q$, 2, ARRAY[$q$Artboard Studio is a browser-based mockup generator that lets designers apply images or videos to thousands of realistic mockups across devices, apparel, packaging, and print.$q$, $q$It includes an AI mockup generator that turns a text prompt into a ready-to-use mockup, plus Figma and Adobe Express plugins.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', $q$who-its-for$q$, $q$Who Artboard Studio is for$q$, 2, ARRAY[$q$It's built for designers and freelancers who need quick, realistic mockups for portfolios, case studies, and client presentations without installing software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('50c5a2e1-7d7b-4c77-8690-4b087ff79b6c', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Rotato ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$3D mockup and animation tool for displaying app and web designs on realistic device models with camera and lighting controls.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rotato creates 3D device mockups and animated videos of app and web designs, with a free unlimited trial and no credit card required.$q$,
  og_description = $q$Rotato creates 3D device mockups and animated videos of app and web designs, with a free unlimited trial and no credit card required.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fa4a289c-deca-4f77-9a17-9124d83266ee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fa4a289c-deca-4f77-9a17-9124d83266ee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$3D device library$q$, $q$30+ pre-built 3D models of phones, laptops, and watches.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$3D animation timeline$q$, $q$Animate device mockups with timeline-based control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Virtual camera controls$q$, $q$DSLR-level virtual camera lens controls for framing shots.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Figma plugin$q$, $q$Import designs directly from Figma.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$iPhone mirroring$q$, $q$Mirror an iPhone screen via USB into a mockup scene.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$8K export$q$, $q$Export mockups and animations at up to 8K resolution.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Customization$q$, $q$Adjust reflections, backgrounds, device colors, orientations, and shadow styles.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Unlimited free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Lifetime one-time payment plans instead of a subscription$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$8K export resolution and ProRes support on higher tiers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Figma plugin for direct design import$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Mac only currently; Windows version is still in development$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Exact plan prices are not published on the pricing page (Premium/Standard/Basic tiers link to checkout for pricing)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$No AI features mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Is Rotato free?$q$, $q$Rotato offers an unlimited free trial with no credit card required and no usage limits; paid Pro plans unlock additional templates and devices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Does Rotato run on Windows?$q$, $q$Rotato is primarily a Mac app; a Windows version is mentioned as in development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Is Rotato a subscription?$q$, $q$No, paid plans are one-time payments that provide lifetime access to included devices and features.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Can I import Figma designs?$q$, $q$Yes, Rotato has a Figma plugin for importing designs directly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$App Store screenshots$q$, $q$Create polished device mockups for App Store listings.$q$, $q$Indie developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Product launch videos$q$, $q$Animate app or web designs on 3D devices for launch marketing.$q$, $q$Marketing professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$Client presentations$q$, $q$Present designs on realistic 3D device mockups.$q$, $q$Freelancers and designers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$overview$q$, $q$What is Rotato?$q$, 2, ARRAY[$q$Rotato is a 3D mockup generator and animator for displaying app and web designs on realistic device screens, with over 30 pre-built 3D device models.$q$, $q$It offers DSLR-level virtual camera controls, timeline-based 3D animation, and export up to 8K resolution, available as a Mac app and web app.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', $q$who-its-for$q$, $q$Who Rotato is for$q$, 2, ARRAY[$q$Rotato is aimed at designers, indie developers, and marketing professionals creating App Store visuals, product launch videos, and client presentations without 3D experience.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fa4a289c-deca-4f77-9a17-9124d83266ee', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Shots ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Web design tool for creating device mockups, animated presets, and short videos from static designs.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Shots turns static designs into device mockups, animations, and videos with magic backgrounds and social media export presets.$q$,
  og_description = $q$Shots turns static designs into device mockups, animations, and videos with magic backgrounds and social media export presets.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4ed46725-5825-4345-b71d-388bad6fdf91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4ed46725-5825-4345-b71d-388bad6fdf91' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Mockup library$q$, $q$Free, ready-to-use device mockup templates including iPhone, Android, iPad, and desktop.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Animated mockups$q$, $q$Video zoom effects and animated presets applied to static designs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Magic Backgrounds$q$, $q$Generates background variations based on uploaded content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$3D shapes and shadows$q$, $q$Add 3D shapes and shadow overlays to designs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Filters and effects$q$, $q$Apply noise, VHS, and glitch effects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Export presets$q$, $q$Export with social media frame presets and shareable links.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Custom watermarking$q$, $q$Add a custom watermark for branding.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Free mockup library with no cost to start$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Built-in animation and video zoom effects, not just static mockups$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Magic Backgrounds generates varied backgrounds automatically$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Shareable links for exporting content$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Exact pricing for premium features is not published on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$No languages, mobile app, or desktop app listed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$No founding year or headquarters information available$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Is Shots free?$q$, $q$Yes, Shots offers a free mockup library, with premium features available on paid plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$What is Magic Backgrounds?$q$, $q$It's a feature that generates background variations based on the content you've uploaded.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Can Shots create animated content?$q$, $q$Yes, it supports animated mockups, video zoom effects, and animation presets.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$What devices are covered by the mockup library?$q$, $q$The library includes iPhone, Android, iPad, and desktop device mockups.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$App Store previews$q$, $q$Create device mockups and animated previews for app listings.$q$, $q$Indie developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Social media content$q$, $q$Produce animated design showcases for social platforms.$q$, $q$Content creators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$Product showcase videos$q$, $q$Turn static UI designs into short showcase videos.$q$, $q$Product teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$overview$q$, $q$What is Shots?$q$, 2, ARRAY[$q$Shots is a web-based design tool for turning static designs into device mockups, animations, and short videos.$q$, $q$It includes a free mockup library, Magic Backgrounds for automatic background generation, and animation presets with video zoom effects.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', $q$who-its-for$q$, $q$Who Shots is for$q$, 2, ARRAY[$q$Shots is aimed at designers, content creators, and product teams who want to quickly turn static app or web designs into animated mockups for social media and app store listings.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4ed46725-5825-4345-b71d-388bad6fdf91', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Screen Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$macOS screen recorder that automatically applies cursor-following zoom effects and smooths cursor movement for polished demo videos.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$9/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Screen Studio is a macOS screen recorder with automatic zoom, smooth cursor movement, and built-in editing for demo videos.$q$,
  og_description = $q$Screen Studio is a macOS screen recorder with automatic zoom, smooth cursor movement, and built-in editing for demo videos.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '79f83550-468f-4378-89d2-b95607e2f72e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '79f83550-468f-4378-89d2-b95607e2f72e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Automatic zoom$q$, $q$Automatically zooms in to follow cursor actions during recording.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Smooth cursor movement$q$, $q$Smooths cursor motion and lets you customize cursor size.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Multi-source recording$q$, $q$Records webcam, microphone, and system audio together.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$iPhone/iPad recording$q$, $q$Records iOS devices directly via USB connection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Automatic transcripts$q$, $q$Generates transcripts and subtitles automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Vertical export mode$q$, $q$Export videos in vertical format for social media.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Keyboard shortcut display$q$, $q$Shows keyboard shortcuts used during recording.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Fully automatic zoom and cursor smoothing with minimal manual editing$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Records iPhone/iPad screens directly via USB$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Transcript and background noise removal are processed locally$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Used by teams at companies including Stripe, Vercel, and Google$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$macOS only; Windows version is explicitly listed as not ready$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$No free plan; paid subscription required$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$No languages listed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Does Screen Studio work on Windows?$q$, $q$No, Screen Studio is macOS only; the FAQ states a Windows version is 'not ready.'$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$How much does Screen Studio cost?$q$, $q$It's $20/month billed monthly, or $9/month billed yearly.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Can Screen Studio record iPhone screens?$q$, $q$Yes, it can record iPhone or iPad screens via a USB connection.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Does Screen Studio generate transcripts?$q$, $q$Yes, it automatically generates transcripts and subtitles, processed locally without sending data to servers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Product demo videos$q$, $q$Record polished product walkthroughs with automatic zoom effects.$q$, $q$Product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Course and tutorial creation$q$, $q$Produce instructional videos with clear cursor tracking and subtitles.$q$, $q$Course instructors$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Social content clips$q$, $q$Export vertical-format recordings for social media.$q$, $q$Content creators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Monthly$q$, $q$$20/month$q$, $q$monthly$q$, $q$["Automatic zoom","Cursor smoothing","Up to 4K 60fps export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$Yearly$q$, $q$$9/month$q$, $q$annual$q$, $q$["Automatic zoom","Cursor smoothing","Up to 4K 60fps export"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$overview$q$, $q$What is Screen Studio?$q$, 2, ARRAY[$q$Screen Studio is a macOS screen recorder built to produce polished product demo and tutorial videos with minimal manual editing.$q$, $q$It automatically applies cursor-following zoom effects, smooths cursor movement, records iPhone/iPad screens via USB, and generates transcripts locally on-device.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', $q$who-its-for$q$, $q$Who Screen Studio is for$q$, 2, ARRAY[$q$It's built for Mac users creating product demos, tutorials, and social video content, including teams at companies such as Stripe, Vercel, and Google.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79f83550-468f-4378-89d2-b95607e2f72e', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;

-- ── Tella ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tella is a screen recording and video editing platform for recording, editing, and sharing business videos from Mac, Windows, or the web.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$13/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Record, edit, and share business videos with Tella — screen/camera recording, text-based editing, analytics, and Slack, Notion, Zapier integrations.$q$,
  og_description = $q$Record, edit, and share business videos with Tella — screen/camera recording, text-based editing, analytics, and Slack, Notion, Zapier integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b1850e50-e82f-45cf-a0c9-accb892735a7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b1850e50-e82f-45cf-a0c9-accb892735a7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Multi-platform recording$q$, $q$Capture screen, camera, and system audio from native Mac and Windows apps, the web app, or a Chrome extension.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Text-based editing$q$, $q$Edit videos by editing the auto-generated transcript, including automatic filler-word removal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Studio Voice and automatic zoom$q$, $q$Applies audio enhancement and automatic zoom effects to recordings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Instant sharing$q$, $q$Shareable links and an embeddable player with export up to 4K at 60 FPS.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Video analytics$q$, $q$Tracks views, engagement, and funnel performance on shared videos.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Collaboration and integrations$q$, $q$Invite editors or viewers, organize videos into playlists, and connect to Slack, Notion, Linear, Zapier, and Google Drive.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Built-in teleprompter$q$, $q$An invisible on-screen teleprompter for reading scripts while recording.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Native recording on Mac, Windows, and the web without extra tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Text-based (transcript) editing speeds up trimming and filler-word removal$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Built-in analytics show per-video viewer engagement$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Includes a migration tool for teams switching from Loom$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$No permanent free plan — only a 7-day free trial of the Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Custom domains and full branding removal require the Premium tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Enterprise features like SSO/SCIM are quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Does Tella have a free plan?$q$, $q$There is no permanent free plan; Tella offers a 7-day free trial of the Pro plan without requiring a credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$What platforms does Tella support?$q$, $q$Native apps for macOS and Windows, a web app, and a Chrome extension; the web recorder also works on Chromebooks and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Can I migrate from Loom?$q$, $q$Yes, paid plans include a Loom migration tool.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$What does Premium add over Pro?$q$, $q$Premium adds a custom domain, branding removal, 60 FPS export, and advanced analytics.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Async team updates$q$, $q$Recording onboarding, standups, and product walkthroughs for distributed teams.$q$, $q$Remote teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Sales and marketing demos$q$, $q$Creating shareable product demo videos with view analytics.$q$, $q$Sales and marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Tutorial content$q$, $q$Producing screen-recorded tutorials and courses.$q$, $q$YouTubers and course creators$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Pro$q$, $q$$13/month$q$, NULL, $q$["Unlimited videos","106 languages","4K export","Team collaboration and analytics","Up to 6-hour recording length","Timeline/transcript editing with AI tools","Embedded player with unlimited hosting","Basic analytics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Premium$q$, $q$$19/month$q$, NULL, $q$["Everything in Pro","Custom domain and domain restrictions","Branding removal","60 FPS export","Advanced analytics","Priority email support","Shared Slack channel"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["All Premium features","SSO and SCIM authentication","Personalized onboarding","Volume discounts","Dedicated Slack channel"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$overview$q$, $q$What is Tella?$q$, 2, ARRAY[$q$Tella is a screen recording and video editing platform that lets people record, edit, and share business videos directly from Mac, Windows, or a web app.$q$, $q$It combines recording (screen, camera, and audio) with text-based editing, automatic zoom, and audio enhancement, then adds sharing tools like embeddable players and per-video analytics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', $q$who-its-for$q$, $q$Who Tella is for$q$, 2, ARRAY[$q$Tella suits remote teams, sales and marketing teams, and content creators who need to record and share short business or tutorial videos without a full video-editing workflow, and who want built-in analytics on who watched.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1850e50-e82f-45cf-a0c9-accb892735a7', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── CleanShot X ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$CleanShot X is a macOS screenshot and screen recording app with scrolling capture, annotation tools, OCR, and cloud sharing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$29 (one-time)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$CleanShot X: macOS screenshot and screen recording app with scrolling capture, annotations, OCR text recognition, and CleanShot Cloud sharing.$q$,
  og_description = $q$CleanShot X: macOS screenshot and screen recording app with scrolling capture, annotations, OCR text recognition, and CleanShot Cloud sharing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e49a063e-cf60-43ca-ac4b-f2c2740a9b67' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Scrolling capture$q$, $q$Captures the full length of scrollable windows or pages that exceed the visible screen.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Screen recording$q$, $q$Records video or GIF exports of screen activity.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Annotation tools$q$, $q$Highlight and mark up screenshots after capture.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Text recognition (OCR)$q$, $q$On-device OCR extracts text directly from screenshots.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$CleanShot Cloud$q$, $q$Upload and share captures via cloud links, with custom domains and team management on the Pro plan.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Webcam and audio recording$q$, $q$Overlay a webcam and capture microphone or system audio during screen recordings.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Self-timer and pin-to-screen$q$, $q$Delay captures with a self-timer, or pin screenshots so they stay visible above other windows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$One-time purchase option avoids a required subscription for the core app$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Scrolling capture and OCR are built directly into the capture workflow$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Cloud Pro plan adds team features like custom domains and SSO$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$30-day money-back guarantee on purchases$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$macOS only — no Windows, iOS, or Android version$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Unlimited cloud storage and team/SSO features require the paid Cloud Pro subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$The one-time license includes only one year of free updates, with a renewal fee after$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Is CleanShot X macOS only?$q$, $q$Yes, it's a native Mac app (Apple Silicon and macOS Tahoe compatible).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Is it a subscription or a one-time purchase?$q$, $q$The App + Cloud Basic plan is a one-time $29 purchase with a year of updates and 1 GB of Cloud storage; App + Cloud Pro is a subscription ($8/month billed annually or $10/month billed monthly) with unlimited Cloud storage and team features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Does it support OCR?$q$, $q$Yes, on-device text recognition lets you extract text from screenshots.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Is there a refund policy?$q$, $q$A 30-day money-back guarantee applies to purchases.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Documentation and support screenshots$q$, $q$Capturing clean, annotated screenshots for docs or support tickets.$q$, $q$Solo creators and indie makers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$Shared team screenshot links$q$, $q$Uploading to CleanShot Cloud with a custom domain for team sharing.$q$, $q$Small teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$QA and bug reporting$q$, $q$Capturing full scrolling pages or app windows for review.$q$, $q$Support and QA teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$App + Cloud Basic$q$, $q$$29 one-time$q$, NULL, $q$["Mac app license, yours to keep","1 year of updates","1 GB of Cloud storage","Optional $19/year renewal"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$App + Cloud Pro (annual)$q$, $q$$8/month$q$, $q$annual$q$, $q$["App access for all team members via Cloud account","Unlimited Cloud storage","Custom domain and branding","Advanced security (self-destruct, password protection)","Advanced team features with SSO"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$App + Cloud Pro (monthly)$q$, $q$$10/month$q$, $q$monthly$q$, $q$["Same features as the annual Pro plan, billed monthly"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$overview$q$, $q$What is CleanShot X?$q$, 2, ARRAY[$q$CleanShot X is a macOS screenshot and screen recording app that replaces macOS's built-in screenshot tool with scrolling capture, annotation tools, OCR text recognition, and cloud-based sharing.$q$, $q$It's sold as a one-time app purchase, with an optional Cloud Pro subscription that adds unlimited cloud storage, custom domains, and team management features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', $q$who-its-for$q$, $q$Who CleanShot X is for$q$, 2, ARRAY[$q$Mac users who want more control over screenshots and screen recordings than the built-in tool offers, including solo creators documenting their work and small teams that need shared, branded screenshot links.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e49a063e-cf60-43ca-ac4b-f2c2740a9b67', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Xnapper ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Xnapper is a macOS app that automatically frames, backgrounds, and redacts sensitive data in screenshots before you share them.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$29.99 (one-time)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Xnapper for Mac auto-beautifies and redacts screenshots, with OCR text copy, annotations, and social-media preset export sizes.$q$,
  og_description = $q$Xnapper for Mac auto-beautifies and redacts screenshots, with OCR text copy, annotations, and social-media preset export sizes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '75b7cec6-4a39-4456-8f5f-bb719bb42775';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '75b7cec6-4a39-4456-8f5f-bb719bb42775' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Automatic balancing$q$, $q$Automatically frames and balances screenshots for a polished look.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Automatic background selection$q$, $q$Picks a matching background color for screenshots automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Automatic redaction$q$, $q$Detects and redacts sensitive data such as emails, credit card numbers, IP addresses, and API keys.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$On-device text recognition$q$, $q$Select and copy text from screenshots using macOS's built-in vision engine.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Custom shortcuts and window capture$q$, $q$Global keyboard shortcuts and spacebar window capture.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Annotation tools$q$, $q$Arrows, shapes, text, and blur for marking up screenshots.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Screenshot history and social presets$q$, $q$Keeps a history of captures and offers preset sizes/ratios for social media.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Free to use indefinitely; only watermark removal requires payment$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Automatic background and redaction features cut down manual editing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$On-device text recognition avoids uploading screenshots to the cloud$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$30-day money-back guarantee on paid tiers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$macOS only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Free version keeps a watermark on exported screenshots$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Team plan is billed per device/month rather than a flat team price$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Is Xnapper free?$q$, $q$Yes, the base app is free to use; a one-time paid license removes the watermark.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$What platforms does it support?$q$, $q$macOS, as a native app.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Does it redact sensitive info automatically?$q$, $q$Yes, it automatically redacts emails, credit card numbers, IP addresses, and API keys.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$How is the Team plan priced?$q$, $q$$5 per device per month, billed annually with a 20% discount.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$App and landing page screenshots$q$, $q$Producing polished, framed product screenshots for marketing pages.$q$, $q$Marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Redacted developer screenshots$q$, $q$Sharing screenshots that need automatic redaction of secrets or credentials.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Quick everyday screenshots$q$, $q$Fast, auto-framed screenshots without manual editing.$q$, $q$Solo Mac users$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Basic$q$, $q$$29.99$q$, NULL, $q$["1 macOS device","No watermark","1 year of updates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Personal$q$, $q$$54.99$q$, NULL, $q$["2 macOS devices","No watermark","1 year of updates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Standard$q$, $q$$79.99$q$, NULL, $q$["3 macOS devices","No watermark","1 year of updates"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$Team$q$, $q$$5/device/month$q$, $q$annual$q$, $q$["Automatic renewal","No watermark","20% savings vs. monthly billing"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$overview$q$, $q$What is Xnapper?$q$, 2, ARRAY[$q$Xnapper is a macOS screenshot app built around a "Snap → Preview → Share" workflow, automatically framing, backgrounding, and redacting sensitive information in screenshots.$q$, $q$The app is free to use, with a one-time paid license required to remove the watermark from exported images.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', $q$who-its-for$q$, $q$Who Xnapper is for$q$, 2, ARRAY[$q$Mac users who regularly share screenshots — developers who need automatic redaction of secrets, marketers producing polished product shots, and anyone who wants a faster alternative to manually editing screenshots.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75b7cec6-4a39-4456-8f5f-bb719bb42775', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── ScreenFlow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ScreenFlow is a Mac-only app for recording your screen, camera, and microphone, then editing the footage into finished videos.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$199 (one-time)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ScreenFlow: Mac screen recording and video editing software with multi-track audio, titles, filters, and iOS screen recording.$q$,
  og_description = $q$ScreenFlow: Mac screen recording and video editing software with multi-track audio, titles, filters, and iOS screen recording.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '45e6cf2f-5a73-4152-bc7c-35947a2f985f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '45e6cf2f-5a73-4152-bc7c-35947a2f985f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Simultaneous multi-source recording$q$, $q$Records screen, camera, and microphone at the same time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$iOS screen recording$q$, $q$Captures iPhone or iPad screens directly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Multi-channel audio editing$q$, $q$Edits multiple audio channels alongside video.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Dynamic titles and cinematic filters$q$, $q$Customizable, branded title library and video color filters.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Freehand annotations and animations$q$, $q$Transitions, text/video animations, and freehand drawing tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Built-in stock media library$q$, $q$Includes stock images, audio, and video clips.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Flexible export$q$, $q$Encodes to ProRes or MP4 with multiple export presets, plus animated GIF/PNG export.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Closed captions$q$, $q$Supports closed captions with ADA-compliance capability.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$One-time purchase — no required subscription for the core app$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Free trial has no stated time limit (exports are watermarked until purchase)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Built-in iOS device screen recording$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Supports ADA-compliant closed captioning$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$macOS only$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$The Stock Media Library is a separate $99/year add-on$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$No AI-based editing features are mentioned (e.g., no automatic transcription or text-based editing)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Is ScreenFlow a subscription?$q$, $q$No, it's sold as a one-time purchase starting at $199.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Can I try it before buying?$q$, $q$Yes, a free trial is offered with no stated time limit, though exported videos are watermarked.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Does it work on Windows?$q$, $q$No, ScreenFlow is Mac only.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Can I record my iPhone or iPad screen?$q$, $q$Yes, built-in iOS screen recording is supported.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Course and tutorial recording$q$, $q$Recording screen and camera together for training content.$q$, $q$Course creators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$iOS app walkthroughs$q$, $q$Recording iPhone/iPad screens directly for product demos or support.$q$, $q$Educators and trainers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$One-time-purchase video editing$q$, $q$Editing screen recordings without a recurring subscription.$q$, $q$Mac video editors$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$ScreenFlow$q$, $q$$199$q$, NULL, $q$["One-time license","Free trial with watermarked exports, no stated time limit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$Stock Media Library (add-on)$q$, $q$$99/year$q$, $q$annual$q$, $q$["Optional stock images, audio, and video clip library"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$overview$q$, $q$What is ScreenFlow?$q$, 2, ARRAY[$q$ScreenFlow is Mac-only screen recording and video editing software that captures screen, camera, and microphone simultaneously, then provides editing tools like transitions, titles, and annotations to turn recordings into finished videos.$q$, $q$It's sold as a one-time purchase starting at $199, with an optional yearly stock media library add-on.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', $q$who-its-for$q$, $q$Who ScreenFlow is for$q$, 2, ARRAY[$q$Mac users — course creators, trainers, and educators — who want a one-time-purchase alternative to subscription screen recorders, including built-in iOS screen capture.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('45e6cf2f-5a73-4152-bc7c-35947a2f985f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Camtasia ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Camtasia is screen recording and video editing software for Windows and Mac with AI script, voice, and avatar generation tools.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€39.57/year$q$,
  founded_year = 1995,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Camtasia: Windows/Mac screen recorder and video editor with text-based editing, AI voiceovers, avatars, and video translation.$q$,
  og_description = $q$Camtasia: Windows/Mac screen recorder and video editor with text-based editing, AI voiceovers, avatars, and video translation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '217a3242-bd27-4f82-bf44-e768e2d249f8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '217a3242-bd27-4f82-bf44-e768e2d249f8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Multitrack recording$q$, $q$Records screen, camera, system audio, and microphone on separate tracks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Text-based editing (Audiate)$q$, $q$Automatically transcribes audio so you can edit video by editing the text, including filler-word removal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$AI script and voiceover generation$q$, $q$Generates scripts from prompts and voiceovers from 200+ AI voice options.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$AI avatar generation and translation$q$, $q$Generates video avatars (49 styles) and translates video/audio into multiple languages and dialects (7 languages, 9 dialects on the Pro tier).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Automatic captions and cleanup$q$, $q$Automatic caption generation, filler-word/hesitation removal, background noise removal, and video background removal.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Drag-and-drop editing$q$, $q$Animations, callouts, and cursor effects (Screentelligence) added via drag-and-drop.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Custom themes and templates$q$, $q$Branded themes and templates for consistent video styling.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Deep AI toolset (script, voice, avatar, translation) built into higher tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Text-based editing via Audiate speeds up trimming and filler-word removal$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Native apps for both Windows and macOS$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$A free version exists for basic screen capture$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Full AI feature set (avatars, translation, dubbing) is limited to the top Pro tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Free version exports include a watermark$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$The entry Starter tier covers only capture — editing requires Essentials or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Is Camtasia free?$q$, $q$A free version is available for basic screen capture, but exports include a watermark; full editing requires a paid plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$What platforms does Camtasia support?$q$, $q$Windows 10 (64-bit, 20H2+) or Windows 11, and macOS 14 or later.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Does Camtasia have AI features?$q$, $q$Yes — AI script generation, voiceover generation, avatar generation, translation, and filler-word removal are available depending on plan tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$What does the Pro plan add over Create?$q$, $q$Pro adds avatar generation, transcript/script translation, audio dubbing, image generation, and access to TechSmith's larger stock asset library.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Training and e-learning videos$q$, $q$Building courses with quizzes and SCORM export.$q$, $q$L&D and training teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$AI-narrated explainer videos$q$, $q$Producing marketing videos with AI scripts and voiceovers.$q$, $q$Marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$How-to and support videos$q$, $q$Recording and editing tutorial content.$q$, $q$Support and IT teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Starter$q$, $q$€39.57/year$q$, $q$annual$q$, $q$["AI-powered blur/redact/background noise removal/webcam background removal","Full-screen/window/region/panoramic capture","Unlimited 4K/60fps recording","Camtasia Editor (watermarked) + Snagit"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Essentials$q$, $q$€182.50/year$q$, $q$annual$q$, $q$["Everything in Starter","Text-based video editing","Automatic filler-word removal","Speech-to-text transcription","Unlimited captions","Multitrack recording","Watermark-free"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Create$q$, $q$€252.62/year$q$, $q$annual$q$, $q$["Everything in Essentials","AI script generation","200+ AI voiceover options","Multi-language support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$Pro$q$, $q$€607.71/year$q$, $q$annual$q$, $q$["Everything in Create","AI avatar generation (49 styles)","Transcript/script translation","Audio dubbing","Image generation","100M+ stock assets","Unlimited Screencast sharing"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$overview$q$, $q$What is Camtasia?$q$, 2, ARRAY[$q$Camtasia is TechSmith's screen recording and video editing software for Windows and Mac, combining multitrack recording with text-based editing and a growing set of AI tools for scripts, voiceovers, avatars, and translation.$q$, $q$Pricing is tiered from a capture-only Starter plan up to a Pro plan that unlocks the full AI production suite and a large stock asset library.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', $q$who-its-for$q$, $q$Who Camtasia is for$q$, 2, ARRAY[$q$Training/L&D teams, marketers, and IT/support teams who need to produce polished tutorial or explainer videos, especially those who want AI-assisted scripting, voiceovers, or translation without hiring outside production help.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('217a3242-bd27-4f82-bf44-e768e2d249f8', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Jitter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Jitter is a web-based motion design tool for creating animations with AI generation, templates, and batch export to video, GIF, or Lottie.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jitter is a browser-based animation tool with AI animation generation, image-to-video, templates, and video/GIF/Lottie export.$q$,
  og_description = $q$Jitter is a browser-based animation tool with AI animation generation, image-to-video, templates, and video/GIF/Lottie export.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '78d1d55e-3d44-4509-a118-9b5206efa57a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '78d1d55e-3d44-4509-a118-9b5206efa57a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$AI animation generation$q$, $q$Describe an idea in text to generate an editable animation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Image-to-video$q$, $q$Convert static images into animated video using AI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Auto-resize and auto-translate$q$, $q$AI-assisted resizing and translation of designs across formats and languages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Pen tool and morphing$q$, $q$Curved paths and vector shape morphing for custom animation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Gradient, blur, and blend effects$q$, $q$Multi-stop gradient animation, layer/background blur, and blend modes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Magic Import$q$, $q$Generates batch variations of a design automatically.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Batch export$q$, $q$Exports to video, GIF, and Lottie formats in bulk.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Templates and fonts$q$, $q$Includes 400+ free templates and 1,500+ free fonts.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Free plan available with unlimited drafts$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$AI features (animation generation, image-to-video, auto-translate) are built into every paid tier via credits$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Large built-in template (400+) and font (1,500+) libraries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Reports a large user base of creative teams (20,000+ per the site)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Free plan is capped at 3 workspace files and 720p/30fps export$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Higher-resolution export (4K/120fps) and frame-by-frame export require the Max tier or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Pro/Max/Ultra plan prices are not published on the pricing page and require an account to see$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Is Jitter free?$q$, $q$Yes, a free plan exists with 3 workspace files, 720p/30fps export, and limited AI credits.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$What export formats does Jitter support?$q$, $q$Video, GIF, and Lottie, with resolution up to 4K/120fps on higher tiers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Is Jitter a desktop app?$q$, $q$Jitter is web-based; the site does not mention a desktop app.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Can Jitter generate animations with AI?$q$, $q$Yes, it includes AI animation generation from text prompts and image-to-video conversion.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$On-brand social motion graphics$q$, $q$Producing quick animated assets for marketing and social posts.$q$, $q$Marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Product micro-interactions$q$, $q$Adding animated assets and interaction previews.$q$, $q$Product designers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Client animation deliverables$q$, $q$Fast turnaround motion design for client work.$q$, $q$Freelance motion designers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Free$q$, $q$$0$q$, NULL, $q$["Unlimited drafts","3 workspace files","Video/GIF/Lottie export","720p, 30fps export","Limited AI credits"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Pro$q$, NULL, $q$annual$q$, $q$["Everything in Free","Unlimited files and folders","1080p, 60fps export","ProRes/WebM export","Image to Video","Standard AI credits"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Max$q$, NULL, $q$annual$q$, $q$["Everything in Pro","Transparent export","Frame-by-frame export","4K, 120fps export","2x Pro AI credits"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Ultra$q$, NULL, $q$annual$q$, $q$["Everything in Max","Increased AI output","Priority AI processing","3x Max AI credits"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Advanced security","Custom SSO/SCIM","Dedicated account manager"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$overview$q$, $q$What is Jitter?$q$, 2, ARRAY[$q$Jitter is a web-based motion design tool that lets creative teams build animations using vector and gradient tools, or generate them from text prompts and static images using AI.$q$, $q$It offers a free tier plus Pro, Max, and Ultra subscriptions that unlock higher export resolutions, more AI credits, and team features.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', $q$who-its-for$q$, $q$Who Jitter is for$q$, 2, ARRAY[$q$Marketing teams, product designers, and freelance motion designers who need to produce animated graphics quickly in the browser, without a full desktop motion-design application.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('78d1d55e-3d44-4509-a118-9b5206efa57a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Rive ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rive is a design, animation, and state-machine tool for building interactive graphics that run natively across web, mobile, and game engines.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$9/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rive: design, animate, and code interactive vector graphics in one editor, with native runtimes for web, iOS, Android, Unity, and more.$q$,
  og_description = $q$Rive: design, animate, and code interactive vector graphics in one editor, with native runtimes for web, iOS, Android, Unity, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dcc42744-8093-4da4-b78b-0290e5d5def0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dcc42744-8093-4da4-b78b-0290e5d5def0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Unified design/animate/code editor$q$, $q$Design, animate, and add interactive logic to graphics in one file.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Rive Renderer$q$, $q$A GPU-accelerated vector graphics engine described as running at up to 120fps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$State Machine$q$, $q$An interactive logic layer that drives animations based on inputs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Open-source runtimes$q$, $q$Native playback of .riv files across Web, iOS, Android, Flutter, React, React Native, Unity, Unreal Engine, and more.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Built-in AI agent$q$, $q$A credit-metered AI agent for assisted editing, available on paid plans, with an advanced-model option on Voyager.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Real-time collaboration$q$, $q$Shared file browser and real-time collaboration from the Cadet tier up.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$One file format (.riv) deploys natively across many platforms and frameworks without re-exporting per platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Free tier available to try the editor and state machine tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$A real vector rendering engine (not video playback) enables interactive, resolution-independent animation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Used in production by large companies including Spotify and Duolingo, per the site's client list$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Free plan is limited to 1 project, 1 workspace, and 3 collaborative files$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$AI agent usage is credit-metered and capped by plan on Cadet and Voyager$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Enterprise tier requires $10M+ in annual company revenue to qualify$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Is Rive free to use?$q$, $q$Yes, a free plan exists with 3 collaborative files, 1 project, and limited AI agent usage.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$What platforms can Rive content run on?$q$, $q$The site lists Web, iOS, macOS, Android, Flutter, React, React Native, Framer, Webflow, Wix Studio, C++, Defold, Unity, and Unreal Engine as supported runtime targets.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Does Rive include AI features?$q$, $q$Yes, paid plans include an "agent" with monthly credit allowances, or a bring-your-own-API-key option on Voyager.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$How many seats does Voyager support?$q$, $q$Up to 25 seats.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Interactive app animation$q$, $q$Building app animations that hand off directly to engineering via runtimes.$q$, $q$Product designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Lightweight game/app graphics$q$, $q$Creating vector animations that run across multiple game engines.$q$, $q$Game and app developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Interactive marketing content$q$, $q$Deploying animated content across web and native apps.$q$, $q$Marketing and creative teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Free$q$, $q$$0/seat/month$q$, $q$monthly$q$, $q$["3 collaborative files","Agent with limits","1 project","1 workspace","10 MB imported asset size"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Cadet$q$, $q$$9/seat/month$q$, $q$monthly$q$, $q$["Up to 3 seats","Unlimited files","Export .riv files","Agent with limits","100 MB imported assets","Unlimited revision history","Real-time collaboration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Voyager$q$, $q$$32/seat/month$q$, $q$monthly$q$, $q$["Up to 25 seats","Libraries","Embed URL hosting","Agent with advanced models","$20/seat monthly agent credits","Unlimited revision history","100 MB imported assets"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$Enterprise$q$, $q$$120/seat/month$q$, $q$monthly$q$, $q$["Requires $10M+ annual revenue","Subteam workspaces","Custom S3 bucket","$40/seat monthly agent credits","SSO","SOC2 Type II compliance"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$overview$q$, $q$What is Rive?$q$, 2, ARRAY[$q$Rive is a design and animation platform where design, animation, and interactive logic (via a State Machine) are built together in one editor, then deployed using open-source runtimes to run natively on many platforms.$q$, $q$Plans range from a free tier for individuals up to an Enterprise tier for large organizations, with a credit-metered AI agent available on paid plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', $q$who-its-for$q$, $q$Who Rive is for$q$, 2, ARRAY[$q$Product designers and game/app developers who need interactive, resolution-independent vector animations that run natively across web, mobile, and game engines like Unity and Unreal.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcc42744-8093-4da4-b78b-0290e5d5def0', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Spline ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Spline is a browser-based 3D design tool for building real-time, interactive 3D scenes with physics, materials, and code export.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$12/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Spline: browser-based 3D design and animation tool with real-time collaboration, physics, materials, and an optional AI 3D generator.$q$,
  og_description = $q$Spline: browser-based 3D design and animation tool with real-time collaboration, physics, materials, and an optional AI 3D generator.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fdd5fb34-6747-4479-81aa-8ae793ce0279';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fdd5fb34-6747-4479-81aa-8ae793ce0279' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Real-time 3D design$q$, $q$3D modeling with primitives and real-time rendering, exportable to multiple platforms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Layer-based materials$q$, $q$Material creation with a pre-made material library.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Interactivity and motion$q$, $q$States, events, timeline animation, game-style controls, physics, and particles.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Real-time data integration$q$, $q$Connects scenes to live data via webhooks, APIs, and variables.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Hana design tool$q$, $q$A web-based 2D canvas with infinite canvas, frames, auto layout, vector networks, and visual effects.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Real-time collaboration$q$, $q$Comments, team invitations, and link sharing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Optional AI 3D generation$q$, $q$An add-on that generates 3D content from prompts, with monthly AI credits.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Free plan available to start designing in the browser with no install$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Native export/code support for React, Next.js, Swift, Kotlin, Webflow, Framer, and Wix Studio$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Combines 3D design, physics/interactivity, and a 2D design tool (Hana) in one product$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Real-time collaboration built into every plan$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Free plan exports carry a watermark and limit the number of files$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$AI 3D generation is a separate paid add-on (+$5/seat/month), not included by default$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Native Apple/Android exports and code export require the Professional plan or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Is Spline free?$q$, $q$Yes, a free plan exists with limited files and watermarked web exports.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$What platforms does Spline support?$q$, $q$Web, iOS, and Android, plus integrations with Webflow, Framer, Wix Studio, React, Next.js, Swift, and Kotlin.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Does Spline include AI tools?$q$, $q$An optional Spline AI add-on (+$5/seat/month) provides AI 3D generation and 2,000 monthly AI credits.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Can I remove the watermark?$q$, $q$Yes, the Starter plan and above remove the watermark from web exports.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Interactive 3D web scenes$q$, $q$Adding 3D visuals and interactions to marketing sites.$q$, $q$Web designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$3D product prototyping$q$, $q$Prototyping 3D interactions and physics-based motion.$q$, $q$Product design teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Lightweight web-native 3D assets$q$, $q$Building 3D assets deployable to web and native apps.$q$, $q$Creative developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Limited files","Unlimited viewers","Watermarked web exports","Access to Spline Templates"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Starter$q$, $q$$12/month$q$, $q$annual$q$, $q$["Unlimited 3D and 2D files","No watermark on web exports","Higher-resolution image exports","Material and audio library access","Video uploads"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Professional$q$, $q$$20/month$q$, $q$annual$q$, $q$["Everything in Starter","Unlimited folders/projects","Video export","Unlimited scenes per file","Apple and Android exports","Code exports","Unlimited variables/APIs/webhooks","2D editor access"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Professional","Centralized licensing","Multiple teams with privacy","SAML SSO","Self-hosted exports","File version history","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$overview$q$, $q$What is Spline?$q$, 2, ARRAY[$q$Spline is a browser-based 3D design platform for creating real-time, interactive 3D scenes with materials, physics, and event-driven interactivity, plus a companion 2D design tool called Hana.$q$, $q$It runs a freemium model, from a watermarked free tier up to Professional and Enterprise plans that add native platform exports, code export, and SSO.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', $q$who-its-for$q$, $q$Who Spline is for$q$, 2, ARRAY[$q$Web designers and product design teams who want to add interactive 3D content to sites and apps without a traditional 3D modeling pipeline, and creative developers who need code-exportable 3D assets.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fdd5fb34-6747-4479-81aa-8ae793ce0279', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── ProtoPie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ProtoPie is a no-code interactive prototyping tool for building logic-driven interactions across mobile, web, automotive, and more.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ProtoPie: no-code interactive prototyping with device sensors, voice interactions, and ProtoPie AI, for mobile, web, and automotive UX.$q$,
  og_description = $q$ProtoPie: no-code interactive prototyping with device sensors, voice interactions, and ProtoPie AI, for mobile, web, and automotive UX.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'bcaff713-bcb7-45e0-a2be-7c83c04fb5a4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$No-code dynamic interactions$q$, $q$Build interactions like email validation and logic-driven object animation using variables and formulas, without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$ProtoPie AI$q$, $q$An AI-assisted prototyping feature (specific functionality not detailed on the site).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Real data integration$q$, $q$Connect prototypes to real data sources for interactions.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Multi- and cross-device interactions$q$, $q$Interactions that span or coordinate across multiple devices.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Native device sensors$q$, $q$Uses real device sensors for more realistic prototype behavior.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Voice interactions$q$, $q$Supports voice-driven prototype interactions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Design tool import$q$, $q$Import existing designs from other design tools.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Shareable interaction recordings$q$, $q$Record interactions and share them via links for review.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$No coding required to build complex, logic-driven interactions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Supports target platforms beyond mobile/web, including automotive HMI, smartwatches, TV, and gaming$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$A free tier is available to start prototyping$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Used by design teams at large organizations, per the site's client list (e.g., Meta, Warner Bros. Discovery)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Specific pricing for paid plans is not published on the marketing site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$ProtoPie AI's exact capabilities are not detailed on the page$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$A dedicated pricing page was unavailable to verify plan tiers directly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Is ProtoPie free?$q$, $q$A free tier is available; paid plans exist but exact pricing isn't published on the marketing page.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$What can ProtoPie prototype beyond phone apps?$q$, $q$Per the site, it supports automotive HMI simulations, TV, smartwatches, and gaming interfaces in addition to mobile and web.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Do I need to code to use ProtoPie?$q$, $q$No, it's built for no-code interactive prototyping using logic, variables, and formulas.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Does ProtoPie include AI features?$q$, $q$Yes, "ProtoPie AI" is listed as a feature, though the site doesn't detail its specific functionality.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$High-fidelity app prototypes$q$, $q$Prototyping complex app interactions before handoff to engineering.$q$, $q$UX and product designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$In-vehicle HMI simulation$q$, $q$Simulating automotive human-machine-interface interactions.$q$, $q$Automotive HMI designers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$Sensor- and voice-driven prototypes$q$, $q$Building prototypes that use device sensors or voice input.$q$, $q$Interaction designers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$overview$q$, $q$What is ProtoPie?$q$, 2, ARRAY[$q$ProtoPie is a no-code interactive prototyping tool that lets designers build logic-driven interactions — using variables, formulas, device sensors, and voice — without writing code.$q$, $q$Beyond mobile and web, the site lists automotive HMI simulations, TV, smartwatches, and gaming as supported prototype targets.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', $q$who-its-for$q$, $q$Who ProtoPie is for$q$, 2, ARRAY[$q$UX and product designers who need realistic, interactive prototypes for stakeholder review or developer handoff, including teams working on automotive interfaces or sensor/voice-driven products.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('bcaff713-bcb7-45e0-a2be-7c83c04fb5a4', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── Principle ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Principle is a native macOS app for designing animated, interactive prototypes with multi-screen app flows and timeline-based transitions.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$129 (one-time purchase)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Principle for Mac: design animated, interactive app prototypes with timeline transitions, multi-screen flows, and Figma/Sketch import.$q$,
  og_description = $q$Principle for Mac: design animated, interactive app prototypes with timeline transitions, multi-screen flows, and Figma/Sketch import.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '99ec53f2-7bec-4016-a54d-dea91440a5b5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '99ec53f2-7bec-4016-a54d-dea91440a5b5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Timeline-based animation$q$, $q$Design custom bounce, ease, and pop transitions on a timeline rather than picking from preset animations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Multi-screen flow view$q$, $q$Lay out and connect entire app flows in a bird's-eye view to see how screens link together.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Figma and Sketch import$q$, $q$Import existing designs from Figma or Sketch with intelligent merging into Principle documents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Device presets$q$, $q$Start designs with built-in presets for mobile, web, and desktop screen sizes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Web sharing$q$, $q$Publish interactive prototypes to a web link that can be viewed on Windows, Linux, macOS, Android, and iOS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Video and GIF export$q$, $q$Export finished animations as video files or animated GIFs for presentations and handoff.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$One-time license fee instead of a recurring subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Deep timeline control for custom animation curves, not just preset transitions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Direct import from Figma and Sketch reduces rebuild work$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Prototypes can be shared via web link and viewed cross-platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$macOS only — no native Windows or Linux editor$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$No team collaboration or commenting features mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$$129 upfront cost with no monthly or free-forever plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$What platforms does Principle run on?$q$, $q$Principle is a native macOS app (Intel and Apple Silicon); shared prototypes can be viewed on the web from Windows, Linux, macOS, Android, and iOS.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Is there a free trial?$q$, $q$Yes, Principle can be downloaded and tried before purchasing the $129 license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Can I import my existing Figma or Sketch files?$q$, $q$Yes, Principle supports importing designs from both Figma and Sketch with intelligent merging.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$How much does Principle cost?$q$, $q$Principle is a one-time $129 purchase, with options to renew or add seats.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Animated UI prototyping$q$, $q$Design custom-timed transitions and micro-interactions for app screens before handing off to engineering.$q$, $q$Product designers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Multi-screen flow prototyping$q$, $q$Map out and prototype full app flows across many connected screens in one document.$q$, $q$UX designers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$Principle License$q$, $q$$129$q$, NULL, $q$["One-time purchase","Free trial available before buying","Renewal and additional seat options"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$overview$q$, $q$What is Principle?$q$, 2, ARRAY[$q$Principle is a native macOS design tool for building animated, interactive prototypes of app interfaces. Instead of choosing from a list of preset transitions, designers set custom timing and easing on a timeline for each interaction.$q$, $q$The tool also supports laying out entire multi-screen app flows in a single bird's-eye view, and can import existing designs directly from Figma or Sketch.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', $q$who-its-for$q$, $q$Who Principle is for$q$, 2, ARRAY[$q$Principle is aimed at product and UX designers on macOS who need finer control over animation timing than static design tools provide, and who want to share working prototypes with teammates via a web link.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('99ec53f2-7bec-4016-a54d-dea91440a5b5', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Sintra AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sintra AI offers 12 pre-built AI agents that automate tasks like social media, copywriting, data analysis, and customer support.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$48.50/month (monthly billing; lower per-month rates on longer commitments)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sintra AI: 12 role-based AI agents that automate social media, copywriting, support, and other business tasks.$q$,
  og_description = $q$Sintra AI: 12 role-based AI agents that automate social media, copywriting, support, and other business tasks.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd417de39-f651-4a18-aaad-445fe17ab81b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd417de39-f651-4a18-aaad-445fe17ab81b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$12 specialized AI agents$q$, $q$Pre-trained AI employees for roles such as social media manager, copywriter, data analyst, and customer support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$50+ tool integrations$q$, $q$Connects to Gmail, Google Calendar, Outlook, Facebook, Instagram, Notion, Slack, and other business tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Brain AI context memory$q$, $q$Learns business-specific context so agents can act with awareness of the company's data and history.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Multiple business profiles$q$, $q$Supports up to 5 customizable business profiles per account for managing different brands or clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Team workspace$q$, $q$Provides a shared collaboration workspace for teams to manage AI agents together.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$24/7 task automation$q$, $q$Agents run continuously to execute tasks like email handling and scheduling without manual triggers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Covers multiple business functions (social, copy, support, data) from one platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Broad integration list including Gmail, Slack, and Notion$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$14-day money-back guarantee$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Multi-business-profile support for agencies or multi-brand teams$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$No free trial — paid subscription starts immediately$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Lowest advertised per-month price requires a 12-month prepaid commitment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$No on-premise or self-hosted option mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Does Sintra AI offer a free trial?$q$, $q$No free trial is advertised; Sintra offers a 14-day money-back guarantee instead.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$How many AI agents does Sintra AI include?$q$, $q$The platform includes 12 pre-built AI employees for different business roles.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$What does Sintra AI integrate with?$q$, $q$It integrates with 50+ tools including Gmail, Google Calendar, Outlook, Facebook, Instagram, Notion, and Slack.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$How much does Sintra AI cost?$q$, $q$Monthly billing starts at $48.50/month, with lower per-month rates available on quarterly ($23.60/mo) and annual ($15.60/mo) plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Automating routine marketing tasks$q$, $q$Delegate social media posting and copywriting to dedicated AI agents.$q$, $q$Small business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Customer support coverage$q$, $q$Use an AI support agent to handle customer inquiries around the clock.$q$, $q$Solo founders and small teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Monthly$q$, $q$$48.50/month$q$, $q$monthly$q$, $q$["Billed monthly","50% off list price of $97/month"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Quarterly$q$, $q$$23.60/month ($70.80 billed every 3 months)$q$, $q$monthly$q$, $q$["60% off list price"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$Annual$q$, $q$$15.60/month ($187.20 billed yearly)$q$, $q$annual$q$, $q$["70% off list price"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$overview$q$, $q$What is Sintra AI?$q$, 2, ARRAY[$q$Sintra AI is a platform of 12 pre-built, role-based AI agents — described as "AI employees" — that handle tasks such as social media management, copywriting, data analysis, and customer support.$q$, $q$Agents connect to over 50 business tools, including Gmail, Slack, and Notion, and use a context-learning system the company calls Brain AI to act with awareness of a business's own data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', $q$who-its-for$q$, $q$Who Sintra AI is for$q$, 2, ARRAY[$q$Sintra AI targets small business owners, solo founders, and small teams who want to offload recurring marketing, support, and admin tasks to automated agents rather than hiring for each role.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d417de39-f651-4a18-aaad-445fe17ab81b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Relevance AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Relevance AI is a platform for building autonomous AI agents that handle sales, support, marketing, and operations workflows.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Relevance AI: build and deploy autonomous AI agents for sales, support, marketing, and ops with 1,000+ integrations.$q$,
  og_description = $q$Relevance AI: build and deploy autonomous AI agents for sales, support, marketing, and ops with 1,000+ integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '13ab6855-36e8-4dcc-bfd6-c5394bdc3674';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '13ab6855-36e8-4dcc-bfd6-c5394bdc3674' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$No-code agent builder$q$, $q$Build autonomous AI agents without writing code, using pre-built templates for common workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Multi-LLM support$q$, $q$Agents can run on multiple models (Claude, GPT, Gemini, and others) with automatic model selection for cost control.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$1,000+ app integrations$q$, $q$Connects to tools like Salesforce, HubSpot, LinkedIn, Slack, and Gmail.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Human-in-the-loop approvals$q$, $q$Agents can pause for human approval before completing sensitive actions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Enterprise security controls$q$, $q$SOC 2 and GDPR compliance, SSO/SAML, audit logs, and data residency options.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Real-time cost monitoring$q$, $q$Tracks task-level cost and usage in real time.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Very large integration library (1,000+ apps advertised)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Support for multiple LLM providers with automatic cost optimization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Enterprise-grade security options (SSO, SAML, audit logs, SOC 2)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Pre-built templates speed up building common agent workflows$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Detailed self-serve pricing tiers are not published — the public pricing page shows only a custom Enterprise plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Usage-based/per-task pricing can make monthly costs harder to predict than a flat subscription$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Is there a free trial for Relevance AI?$q$, $q$The site offers a "Try it out" option, though detailed self-serve plan pricing isn't published.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$How is Relevance AI priced?$q$, $q$Pricing is usage-based and billed per task, with examples cited as low as $0.02 per simple task; the public pricing page otherwise shows a custom Enterprise plan.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$What integrations does Relevance AI support?$q$, $q$It advertises 1,000+ integrations, including Salesforce, HubSpot, LinkedIn, Slack, and Gmail.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Does Relevance AI support multiple AI models?$q$, $q$Yes, agents can use Claude, GPT, Gemini, and other models with automatic optimization.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Sales workflow automation$q$, $q$Automate lead enrichment, meeting scheduling, and proposal generation.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Customer success operations$q$, $q$Deploy agents for deal review and customer follow-up tasks.$q$, $q$Customer success teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Enterprise process automation$q$, $q$Build agents across HR, marketing, and operations workflows with governance controls.$q$, $q$Enterprise operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom actions","Unlimited agents & tools","Unlimited users & projects","2,000+ integrations","SSO, RBAC & audit logs","Dedicated account manager"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$overview$q$, $q$What is Relevance AI?$q$, 2, ARRAY[$q$Relevance AI is a platform for building and deploying autonomous AI agents that carry out specific business tasks, such as lead enrichment, meeting scheduling, or proposal generation.$q$, $q$Agents can run on multiple LLM providers, connect to over 1,000 third-party apps, and include human-in-the-loop approval steps and enterprise security controls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', $q$who-its-for$q$, $q$Who Relevance AI is for$q$, 2, ARRAY[$q$Relevance AI is aimed at teams — particularly in sales, customer success, marketing, and operations — that want to automate repetitive workflows with AI agents rather than building custom automation in-house.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('13ab6855-36e8-4dcc-bfd6-c5394bdc3674', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Lindy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lindy is an AI work assistant that manages email, scheduling, meeting notes, and CRM follow-ups across connected apps.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$49.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lindy: an AI assistant for inbox triage, meeting prep, scheduling, and CRM follow-ups, with a 7-day free trial.$q$,
  og_description = $q$Lindy: an AI assistant for inbox triage, meeting prep, scheduling, and CRM follow-ups, with a 7-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5420efbb-d040-4bba-98e1-eb3de9843667';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5420efbb-d040-4bba-98e1-eb3de9843667' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Email management$q$, $q$Prioritizes inbox items and drafts replies matched to the user's writing voice.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Meeting preparation and notes$q$, $q$Prepares briefs before meetings and records notes with action items afterward.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Calendar coordination$q$, $q$Schedules and coordinates meetings across calendars.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Automated follow-ups$q$, $q$Sends post-meeting follow-up messages automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$CRM integration$q$, $q$Updates records in HubSpot and Salesforce.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Mobile delegation$q$, $q$Tasks can be delegated via iMessage or SMS in addition to the web app.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$7-day free trial before committing to a paid plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Delegate tasks via text message, not just a web dashboard$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Integrates directly with major CRMs (HubSpot, Salesforce)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Multiple usage tiers scale connected inboxes and features$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$No free-forever plan — only a 7-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Higher-usage features like computer use are gated to the Pro tier and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Enterprise features (SSO, SCIM, audit logs) require a custom-priced plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Does Lindy offer a free trial?$q$, $q$Yes, a 7-day free trial is available before paid billing starts.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$How much does Lindy cost?$q$, $q$Plans start at $49.99/month (Plus), with Pro at $99.99/month and Max at $199.99/month; Enterprise is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$What apps does Lindy integrate with?$q$, $q$Gmail, Outlook, Google Calendar, Slack, Notion, HubSpot, Salesforce, Microsoft Teams, and Zoom.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Can I delegate tasks to Lindy from my phone?$q$, $q$Yes, tasks can be delegated via iMessage or SMS.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Inbox and calendar management$q$, $q$Automate email triage, drafting, and meeting scheduling.$q$, $q$Busy professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Meeting operations$q$, $q$Get meeting prep briefs, notes, and follow-up emails handled automatically.$q$, $q$Sales and account teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Plus$q$, $q$$49.99/month$q$, $q$monthly$q$, $q$["2 connected inboxes","Standard usage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Pro$q$, $q$$99.99/month$q$, $q$monthly$q$, $q$["3 connected inboxes","3x usage","Computer use"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Max$q$, $q$$199.99/month$q$, $q$monthly$q$, $q$["5 connected inboxes","7x usage"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Team controls","SSO","SCIM","Audit logs","Dedicated support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$overview$q$, $q$What is Lindy?$q$, 2, ARRAY[$q$Lindy is an AI work assistant that handles administrative work across a user's connected apps — triaging and drafting email, preparing for and taking notes on meetings, coordinating calendars, and updating CRM records.$q$, $q$Work can be delegated through a web interface, inside integrated apps, or by texting Lindy directly via iMessage or SMS.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', $q$who-its-for$q$, $q$Who Lindy is for$q$, 2, ARRAY[$q$Lindy is built for professionals who want an AI assistant to handle recurring inbox, scheduling, and follow-up work, with plans that scale from individual use up to enterprise teams needing SSO and audit logs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5420efbb-d040-4bba-98e1-eb3de9843667', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Dust ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Dust is a platform for building custom AI agents that connect to company knowledge like Slack, Notion, and Drive to take action.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dust: build custom AI agents that read your company's Slack, Notion, and Drive data and take action via built-in and custom tools.$q$,
  og_description = $q$Dust: build custom AI agents that read your company's Slack, Notion, and Drive data and take action via built-in and custom tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '997e1c48-766a-4593-b774-3364383103c2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '997e1c48-766a-4593-b774-3364383103c2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Agent builder$q$, $q$Create custom AI agents without engineering support, using built-in and custom tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Knowledge connectors$q$, $q$Agents can read company data from sources like Slack, Notion, and Google Drive.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Multi-model support$q$, $q$Agents can run on leading models such as GPT and Claude.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$MCP tool support$q$, $q$Agents can connect to external tools via the Model Context Protocol.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Native integrations$q$, $q$Includes integrations such as Zendesk, Slack, and a Chrome extension.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Enterprise controls$q$, $q$Supports SSO, SCIM, SOC 2, and an optional zero data retention mode.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Agent builder is accessible to non-technical team members$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Connects directly to common company knowledge sources (Slack, Notion, Drive)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Supports multiple leading LLMs rather than locking into one model$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Enterprise security options including SSO, SCIM, and SOC 2$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Detailed self-serve pricing tiers could not be independently confirmed from the official site at time of writing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Some enterprise controls (SCIM, single-tenant deployment) are limited to higher/custom tiers$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$What can Dust agents connect to?$q$, $q$Dust agents can read company knowledge from sources like Slack, Notion, and Google Drive, and take action through built-in and custom tools.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Which AI models does Dust support?$q$, $q$Dust supports multiple leading models, including GPT and Claude.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Does Dust support the Model Context Protocol (MCP)?$q$, $q$Yes, agents can use MCP to connect to external tools.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$What enterprise security features does Dust offer?$q$, $q$SSO, SCIM, SOC 2 compliance, and an optional zero data retention mode.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Internal knowledge assistants$q$, $q$Build agents that answer questions using company docs stored in Slack, Notion, and Drive.$q$, $q$Internal ops and support teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$Cross-department automation$q$, $q$Deploy agents for sales, support, and marketing workflows without engineering involvement.$q$, $q$Non-technical business teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$overview$q$, $q$What is Dust?$q$, 2, ARRAY[$q$Dust is a platform for building custom AI agents that read a company's own knowledge — from sources like Slack, Notion, and Google Drive — and take action using built-in and custom tools.$q$, $q$Agents can run on multiple leading models and connect to external tools through the Model Context Protocol (MCP), with enterprise controls like SSO, SCIM, and SOC 2 available for larger teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('997e1c48-766a-4593-b774-3364383103c2', $q$who-its-for$q$, $q$Who Dust is for$q$, 2, ARRAY[$q$Dust targets companies that want non-technical teams to build AI agents grounded in their own internal data, rather than relying solely on engineering to wire up custom automation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('997e1c48-766a-4593-b774-3364383103c2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('997e1c48-766a-4593-b774-3364383103c2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Stack AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Stack AI is a no-code platform for building and deploying enterprise AI agents and workflows.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Stack AI: build no-code AI agent workflows for finance, legal, healthcare, and support with 100+ integrations.$q$,
  og_description = $q$Stack AI: build no-code AI agent workflows for finance, legal, healthcare, and support with 100+ integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '24da33b5-7fec-4150-97a5-ac2d1c92593c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '24da33b5-7fec-4150-97a5-ac2d1c92593c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$No-code workflow builder$q$, $q$Drag-and-drop interface for assembling AI agent workflows without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Multi-model support$q$, $q$LLM-agnostic platform that works with multiple AI models.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$100+ integrations$q$, $q$Connects to existing business systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Industry-specific templates$q$, $q$Pre-built workflows for finance, legal, healthcare, customer service, and IT.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Governance controls$q$, $q$Audit logs and human-in-the-loop review built into workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Flexible deployment$q$, $q$Available as multi-tenant cloud, VPC, or on-premise installation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Free plan available with 500 runs/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$No-code builder makes agent creation accessible without engineering$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Deployment flexibility (cloud, VPC, on-prem)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Broad security certifications: SOC 2 Type II, HIPAA, ISO 27001, GDPR$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$No mid-tier paid plan is publicly listed — pricing jumps from a 500-run Free plan straight to custom Enterprise$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Free plan is limited to 2 projects and 1 seat$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Is there a free plan for Stack AI?$q$, $q$Yes, a Free plan includes 500 runs/month, 2 projects, and 1 seat.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$How is Stack AI priced above the free tier?$q$, $q$Beyond the Free plan, pricing is custom (Enterprise), available on request.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$What compliance certifications does Stack AI have?$q$, $q$SOC 2 Type II, HIPAA, GDPR, and ISO 27001.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Can Stack AI be deployed on-premise?$q$, $q$Yes, in addition to multi-tenant cloud, VPC and on-premise deployment options are available.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Document and contract review$q$, $q$Automate contract review and claims processing with no-code agent workflows.$q$, $q$Legal and compliance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Support ticket triage$q$, $q$Route and triage customer support tickets using AI agents.$q$, $q$Customer support teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["500 runs/month","2 projects","1 seat","Community Discord support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom runs/month","Unlimited projects","On-premises/VPC deployment","SSO","SOC 2, HIPAA & GDPR compliance"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$overview$q$, $q$What is Stack AI?$q$, 2, ARRAY[$q$Stack AI is a no-code platform for building enterprise AI agent workflows using a drag-and-drop interface. It's LLM-agnostic and includes over 100 integrations with existing business systems.$q$, $q$The platform ships with industry-specific templates for finance, legal, healthcare, customer service, and IT, plus governance features like audit logs and human-in-the-loop review.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', $q$who-its-for$q$, $q$Who Stack AI is for$q$, 2, ARRAY[$q$Stack AI is aimed at enterprises that need to deploy AI agents for regulated or process-heavy work — such as contract review or claims processing — with deployment options including on-premise and VPC installs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('24da33b5-7fec-4150-97a5-ac2d1c92593c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Svix ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Svix is a webhooks-as-a-service platform that sends and manages webhooks with automatic retries, monitoring, and security hardening.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$490/month (Professional plan; Free plan also available)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Svix: webhooks-as-a-service with automatic retries, monitoring, and a 50,000 message/month free tier.$q$,
  og_description = $q$Svix: webhooks-as-a-service with automatic retries, monitoring, and a 50,000 message/month free tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '73f3cde5-a743-4dc7-ac8d-a85aebdd62bd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Automatic retries$q$, $q$Retries failed webhook deliveries automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Monitoring and logs$q$, $q$Dashboards for tracking delivery status and debugging.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Security hardening$q$, $q$Protects against SSRF and replay attacks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Embeddable customer portal$q$, $q$Lets your customers manage their own webhook subscriptions inside your app.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Standard Webhooks compliance$q$, $q$Follows the Standard Webhooks specification.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Broad SDK support$q$, $q$Official SDKs for JavaScript/TypeScript, Python, Go, Kotlin, Ruby, C#, Java, PHP, and Rust.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Free tier includes 50,000 messages/month with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Wide language/SDK coverage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$SOC 2 Type II, HIPAA, and PCI-DSS compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Embeddable portal lets end customers self-manage webhook settings$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Professional plan starts at $490/month — a large step up from the free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Enterprise pricing is quote-only$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Is Svix free to start?$q$, $q$Yes, the Free plan includes 50,000 messages/month with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$How much does Svix's paid plan cost?$q$, $q$The Professional plan starts at $490/month for 50,000 messages/month with a higher SLA and throughput.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$What compliance certifications does Svix have?$q$, $q$SOC 2 Type II, HIPAA, PCI-DSS, GDPR, and CCPA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$What languages does Svix provide SDKs for?$q$, $q$JavaScript/TypeScript, Python, Go, Kotlin, Ruby, C#, Java, PHP, and Rust.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Outbound webhook delivery for SaaS products$q$, $q$Give customers a reliable, self-service way to receive event notifications from your API.$q$, $q$SaaS platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Customer-facing webhook management$q$, $q$Embed a webhook management portal directly into your product for end users.$q$, $q$Developer platform teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["50,000 messages/month","99.9% uptime SLA","30-day payload retention","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Professional$q$, $q$$490/month$q$, $q$monthly$q$, $q$["50,000 messages/month","99.99% uptime SLA","90-day payload retention","Unbranded/white-label portal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom rate limits","99.999% uptime SLA","On-premises deployment","Dedicated account manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$overview$q$, $q$What is Svix?$q$, 2, ARRAY[$q$Svix is a webhooks-as-a-service platform that handles sending, receiving, and managing webhooks, including automatic retries, monitoring, security hardening, and idempotency.$q$, $q$It also provides an embeddable customer-facing portal so a company's own customers can manage their webhook subscriptions.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', $q$who-its-for$q$, $q$Who Svix is for$q$, 2, ARRAY[$q$Svix is built for engineering teams at SaaS and API companies that need to deliver reliable outbound webhooks to customers without building retry, security, and monitoring infrastructure in-house.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('73f3cde5-a743-4dc7-ac8d-a85aebdd62bd', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Hookdeck ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hookdeck is an event gateway for receiving, transforming, routing, and monitoring webhooks, plus outbound delivery via Outpost.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39/month (Team plan; Developer plan is free)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hookdeck: manage inbound and outbound webhooks with routing, transformation, and full observability, free up to 10,000 events/month.$q$,
  og_description = $q$Hookdeck: manage inbound and outbound webhooks with routing, transformation, and full observability, free up to 10,000 events/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '36a47b1c-ff9a-44c4-8e50-572883c5348b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '36a47b1c-ff9a-44c4-8e50-572883c5348b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Event Gateway$q$, $q$Receives, transforms, and routes inbound webhooks with full observability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Outpost$q$, $q$Open-source outbound webhook delivery with multi-destination support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$CLI$q$, $q$Debug webhooks locally on localhost.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Console$q$, $q$Inspect webhook payloads without needing an account.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Radar$q$, $q$Alerts on third-party webhook latency issues.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$MCP server$q$, $q$Integrates with AI coding tools such as Cursor and Claude.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Free Developer tier includes 10,000 events/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Outpost outbound component is open source$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$MCP server support for AI coding assistants$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Enterprise security options: SOC 2 Type II, SSO, SCIM, RBAC, MFA$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Growth plan (uptime guarantees, SSO) starts at $499/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Additional events and throughput beyond plan limits are billed separately$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Enterprise pricing is quote-only$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Is Hookdeck free to use?$q$, $q$Yes, the Developer plan is free forever with 10,000 events/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$How much do paid Hookdeck plans cost?$q$, $q$Team starts at $39/month and Growth starts at $499/month; Enterprise is custom.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$What is Outpost?$q$, $q$Outpost is Hookdeck's open-source product for outbound webhook delivery to customers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Does Hookdeck integrate with AI coding tools?$q$, $q$Yes, it provides an MCP server for tools like Cursor and Claude.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Inbound webhook management$q$, $q$Receive, transform, and route incoming webhooks with full observability.$q$, $q$Backend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Outbound webhook delivery for SaaS$q$, $q$Send reliable outbound webhooks to customers using the open-source Outpost component.$q$, $q$Platform/API teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Developer$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10,000 events/month","3-day retention","Single user","SOC 2 compliance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Team$q$, $q$$39/month$q$, $q$monthly$q$, $q$["7-day retention","Unlimited users","Slack integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Growth$q$, $q$$499/month$q$, $q$monthly$q$, $q$["Uptime/latency guarantees","30-day retention","SSO, SAML and SCIM"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Priority support","Dedicated support manager","Custom SLAs"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$overview$q$, $q$What is Hookdeck?$q$, 2, ARRAY[$q$Hookdeck provides infrastructure for managing webhooks across their full lifecycle. Its Event Gateway receives, transforms, and routes inbound webhooks with full observability, while Outpost handles outbound webhook delivery for APIs and SaaS platforms.$q$, $q$It also includes a local-debugging CLI, a no-account payload inspector (Console), and third-party latency alerting (Radar).$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', $q$who-its-for$q$, $q$Who Hookdeck is for$q$, 2, ARRAY[$q$Hookdeck is aimed at backend and platform engineering teams that need reliable inbound and outbound webhook infrastructure without building retry, routing, and observability tooling themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36a47b1c-ff9a-44c4-8e50-572883c5348b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Trigger.dev ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Trigger.dev is a TypeScript platform for running long-running background jobs and AI agent workflows with retries, queues, and observability.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month (Hobby plan; Free plan also available)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Trigger.dev: build durable background jobs and AI agent workflows in TypeScript, with a free tier and usage-based pricing.$q$,
  og_description = $q$Trigger.dev: build durable background jobs and AI agent workflows in TypeScript, with a free tier and usage-based pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'caa46b4a-ddf7-473a-8793-845e45dd40b3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'caa46b4a-ddf7-473a-8793-845e45dd40b3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$AI agent tasks$q$, $q$Build tool-calling AI agents with human-in-the-loop approval steps.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Realtime updates$q$, $q$Stream LLM responses and task status to frontends.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Durable cron scheduling$q$, $q$Run scheduled jobs without timeout limitations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Concurrency and queues$q$, $q$Control how many tasks run at once.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Observability$q$, $q$Real-time monitoring, logging, and tracing with advanced filtering.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Automatic retries$q$, $q$Configurable retry logic with exponential backoff.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Build extensions$q$, $q$Add support for Python, Prisma, Puppeteer, FFmpeg, and esbuild.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Free tier with monthly usage credits to start building$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Usage-based compute pricing — pay only while code executes$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Works across many frameworks (Next.js, Remix, Bun, SvelteKit, Astro, and more)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Extension system adds Python, Puppeteer, and FFmpeg support to a TypeScript-first platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Additional concurrency, team seats, and Realtime connections beyond plan limits cost extra$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Enterprise plan is custom-priced$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Does Trigger.dev have a free plan?$q$, $q$Yes, the Free plan includes $5/month in credits, 20 concurrent runs, and unlimited tasks.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$How is Trigger.dev priced?$q$, $q$Plans start at $10/month (Hobby) and $50/month (Pro), plus usage-based compute charged per second of execution.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$What languages does Trigger.dev support?$q$, $q$It's built for TypeScript/JavaScript, with Python support available via a build extension.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Can Trigger.dev build AI agents?$q$, $q$Yes, it supports tool-calling AI agents with human-in-the-loop approval and realtime streaming of responses.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Background job processing$q$, $q$Run long-running or scheduled tasks without managing servers or worrying about timeouts.$q$, $q$Backend developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$AI agent workflows$q$, $q$Build agents that call tools and stream results to a frontend in real time.$q$, $q$AI product engineers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["$5/month included credits","20 concurrent runs","Unlimited tasks","5 team members","1-day log retention"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Hobby$q$, $q$$10/month$q$, $q$monthly$q$, $q$["$10/month included credits","50 concurrent runs","7-day log retention"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Pro$q$, $q$$50/month$q$, $q$monthly$q$, $q$["$50/month included credits","200+ concurrent runs","30-day log retention","Dedicated Slack support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom log retention","SSO","SOC 2 and pen test reports"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$overview$q$, $q$What is Trigger.dev?$q$, 2, ARRAY[$q$Trigger.dev is a platform for building and deploying background tasks and AI agent workflows in TypeScript, with built-in retries, queuing, observability, and elastic scaling.$q$, $q$It's designed to remove the need to manage servers or work around request timeouts for long-running jobs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', $q$who-its-for$q$, $q$Who Trigger.dev is for$q$, 2, ARRAY[$q$Trigger.dev is aimed at developers building on TypeScript/JavaScript frameworks who need durable background jobs or AI agent workflows without standing up their own queue and worker infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('caa46b4a-ddf7-473a-8793-845e45dd40b3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Encore ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Encore lets developers declare backend infrastructure in TypeScript or Go code and auto-provisions it to their own AWS or GCP account.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$From $49/member/month (Pro plan; Free plan also available)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Encore: define backend infrastructure in TypeScript or Go and deploy it automatically to your own AWS or GCP account.$q$,
  og_description = $q$Encore: define backend infrastructure in TypeScript or Go and deploy it automatically to your own AWS or GCP account.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3d5d1f6f-0d6c-43a6-848d-b04582cb94c5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3d5d1f6f-0d6c-43a6-848d-b04582cb94c5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Infrastructure as code$q$, $q$Declare databases, Pub/Sub topics, and storage buckets directly in application code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Local development environment$q$, $q$Run the whole backend locally with one command, mirroring production.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Preview environments$q$, $q$Get a full production-like environment for every pull request.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Built-in observability$q$, $q$Automatic distributed tracing, metrics, and architecture diagrams.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Service Catalog$q$, $q$Auto-generated API documentation and service explorer.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$MCP server$q$, $q$Provides context to AI coding tools for guardrailed code generation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Free forever tier for local development$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Deploys directly into your own AWS or GCP account — no infrastructure vendor lock-in$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Automatic tracing, metrics, and architecture diagrams with no extra setup$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$200+ engineering teams and 12,000+ GitHub stars (per site)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Pro plan combines per-member, per-environment, and per-resource charges, which can add up$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Only TypeScript and Go are supported languages$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Is Encore free to use?$q$, $q$Yes, there's a free-forever tier for local development with 2 free cloud dev environments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$How much does Encore's Pro plan cost?$q$, $q$From $49/member/month, plus $99/month per AWS/GCP environment and $2.50/month per resource.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Which languages does Encore support?$q$, $q$TypeScript and Go.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Where does Encore deploy my backend?$q$, $q$To your own AWS or GCP account, rather than a proprietary Encore-hosted cloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Cloud backend development$q$, $q$Build and deploy backend services without hand-writing Terraform or cloud config.$q$, $q$Backend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Preview environments for PRs$q$, $q$Spin up a full production-like environment automatically for every pull request.$q$, $q$Engineering teams using CI/CD$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Free$q$, $q$$0$q$, NULL, $q$["2 free dev environments","1M tracing events/month","7-day logs & trace retention","Community Discord support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Pro$q$, $q$From $49/member/month + $99/month per environment + $2.5/month per resource$q$, $q$monthly$q$, $q$["Unlimited dev environments","20M tracing events/month","30-day retention","Preview environments per PR","Deploy to your own AWS & GCP"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom RBAC","Self-hosted preview environments","Technical Account Manager","Custom SLAs"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$overview$q$, $q$What is Encore?$q$, 2, ARRAY[$q$Encore is a backend platform that lets developers define infrastructure — databases, Pub/Sub topics, storage buckets, and more — directly in TypeScript or Go application code, instead of separate config like Terraform.$q$, $q$It automatically provisions and deploys that infrastructure to the user's own AWS or GCP account, and includes built-in distributed tracing, a local dev environment that mirrors production, and preview environments for every pull request.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', $q$who-its-for$q$, $q$Who Encore is for$q$, 2, ARRAY[$q$Encore is aimed at backend engineering teams building on AWS or GCP with TypeScript or Go who want infrastructure defined in code and automatic observability, without manually maintaining separate IaC tooling.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3d5d1f6f-0d6c-43a6-848d-b04582cb94c5', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Doppler ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Centralized secrets management platform for storing, syncing, and rotating API keys and credentials across infrastructure, CI/CD, and AI agents.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$8/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Doppler is a secrets management platform for securely storing, syncing, and rotating API keys and credentials across your infrastructure.$q$,
  og_description = $q$Doppler is a secrets management platform for securely storing, syncing, and rotating API keys and credentials across your infrastructure.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b899dd8e-5a92-4424-9a3d-1964775af19a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b899dd8e-5a92-4424-9a3d-1964775af19a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Centralized secrets storage$q$, $q$Stores API keys, database credentials, and cloud access tokens in one place instead of scattering them across config files and scripts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Dynamic secrets$q$, $q$Auto-rotating credentials that self-destruct after deployment, reducing the window a leaked secret stays valid.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Native integrations$q$, $q$Syncs secrets directly into Vercel, Heroku, AWS Secrets Manager, GitHub Actions, Kubernetes, and CI/CD pipelines.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Audit logging$q$, $q$Logs all secret access for SOC 2 and ISO 27001 compliance requirements.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$AI agent access via MCP$q$, $q$Provides an MCP server and OIDC-scoped service accounts so AI agents can request secrets without custom scripts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Change requests and secret rotation$q$, $q$Team plan adds approval workflows for secret changes plus automatic rotation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$SAML SSO and role-based access$q$, $q$Team plan includes SAML SSO and RBAC for controlling who can view or edit secrets.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Free tier available for teams of up to 3 users$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$SOC 2 and ISO 27001 compliant, with full access logging$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Native integrations with major cloud, CI/CD, and deployment platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Built-in MCP support for scoping secret access to AI agents$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Per-user pricing ($8-$21/user/month) can grow costly for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Enterprise-only features like Enterprise Key Management and custom SLAs require quote-only pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Add-ons such as custom roles, user groups, and integration syncs cost extra per seat$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Does Doppler have a free plan?$q$, $q$Yes, the Developer plan is free for up to 3 users, with additional users billed at $8/month each.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Does Doppler support AI agents?$q$, $q$Yes, Doppler provides an MCP server and OIDC-scoped service accounts so AI agents can request secrets without embedding credentials in code.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$What compliance certifications does Doppler have?$q$, $q$Doppler is SOC 2 and ISO 27001 compliant, with complete audit logging of secret access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Is there a free trial for paid plans?$q$, $q$The Team plan ($21/user/month) includes a 14-day free trial.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Can Doppler be self-hosted?$q$, $q$The Enterprise plan supports on-premise or cloud deployment options.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Centralizing secrets across environments$q$, $q$Replace scattered .env files and config secrets with a single synced source across dev, staging, and production.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Securing AI agent credential access$q$, $q$Scope and audit the credentials individual AI agents can access using OIDC-based service accounts and MCP.$q$, $q$Enterprises deploying AI agents$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Automating secret injection in CI/CD$q$, $q$Sync secrets automatically into GitHub Actions, Kubernetes, and other pipeline tools to avoid hardcoding credentials.$q$, $q$DevOps teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Developer$q$, $q$Free for 3 users, then $8/user/month$q$, $q$monthly$q$, $q$["3-day activity log retention","50 service tokens","10 projects maximum","4 environments","5 config syncs","Up to 25 users","Doppler CLI","API and webhooks access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Team$q$, $q$$21/user/month$q$, $q$monthly$q$, $q$["90-day activity log retention","500 service tokens","250 projects maximum","15 environments","100 config syncs","Up to 500 users","SAML SSO and role-based access controls","Change requests and automatic secret rotation","Priority support","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom activity log retention","Unlimited config syncs","Custom user limits","On-premise or cloud deployment","Enterprise Key Management (EKM)","Dynamic secrets and log forwarding","99.95% SLO","Dedicated account manager","Enterprise SCIM support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$overview$q$, $q$What is Doppler?$q$, 2, ARRAY[$q$Doppler is a secrets management platform that centralizes API keys, database credentials, and cloud access tokens so teams stop copying them across config files and scripts.$q$, $q$It syncs secrets into tools like Vercel, Heroku, AWS Secrets Manager, GitHub Actions, and Kubernetes, and adds audit logging, dynamic (auto-rotating) secrets, and MCP-based access scoping for AI agents.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', $q$who-its-for$q$, $q$Who Doppler is for$q$, 2, ARRAY[$q$Doppler suits engineering teams that need a single source of truth for secrets across development, staging, and production, as well as organizations running AI agents that need scoped, auditable credential access rather than hardcoded keys.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b899dd8e-5a92-4424-9a3d-1964775af19a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Infisical ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source platform for managing application secrets, PKI certificates, and privileged access across cloud and AI infrastructure.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$18/identity/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Infisical is an open-source secrets management, certificate (PKI), and privileged access platform for developers and AI agents.$q$,
  og_description = $q$Infisical is an open-source secrets management, certificate (PKI), and privileged access platform for developers and AI agents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '870d8f7e-4a30-42b3-8999-2b52c10af200';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '870d8f7e-4a30-42b3-8999-2b52c10af200' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Secrets management$q$, $q$Centralized storage, rotation, and auditing of application credentials with RBAC, approval workflows, and dynamic secret issuance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Certificate management (PKI)$q$, $q$Automates private certificate authority operations including issuance, renewal, revocation, and discovery.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Privileged access management (PAM)$q$, $q$Grants short-lived, identity-based access sessions with session recording and AI-generated summaries.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Agent Vault$q$, $q$Gives AI agents access to credentials they need without exposing the underlying secret values directly to the agent.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Dynamic secrets$q$, $q$Issues short-lived, on-demand credentials scoped to individual requests instead of long-lived static secrets.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Broad integrations$q$, $q$Connects with AWS, Kubernetes, Docker, GitHub, GitLab, Terraform, Ansible, Jenkins, Vercel, Heroku, Azure, GCP, and Datadog.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Free-forever plan covering up to 5 identities and 3 projects$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Open source with a self-hosting option in addition to cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Combines secrets management, PKI, and privileged access management in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Wide range of native integrations across cloud and CI/CD tooling$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Pro plan is priced per identity ($18/month), which scales with team/agent count$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Advanced capabilities like dynamic secrets, AI security advisor, SCIM, and LDAP require the custom-priced Enterprise plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Free tier is capped at 5 identities, 3 projects, 3 environments, and 10 integrations$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Does Infisical have a free plan?$q$, $q$Yes, the Free plan is free forever and includes up to 5 identities, 3 projects, and 3 environments.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Is Infisical open source?$q$, $q$Yes, Infisical is an open-source project that also offers self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Does Infisical support certificate management?$q$, $q$Yes, it includes PKI features for automated certificate authority issuance, renewal, and revocation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Does Infisical support AI agent credential access?$q$, $q$Yes, through Agent Vault, which lets AI agents use credentials without exposing the secret values directly.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$How is the Pro plan priced?$q$, $q$The Pro plan costs $18 per identity per month and adds features like secret rotation, SAML SSO, and 90-day audit log retention.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Centralizing application secrets$q$, $q$Store, rotate, and audit credentials across environments with RBAC and approval workflows.$q$, $q$Development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Managing internal certificates$q$, $q$Automate private CA issuance, renewal, and revocation instead of handling certificates manually.$q$, $q$Security and platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Securing AI agent access to credentials$q$, $q$Use Agent Vault to let AI agents access the secrets they need without exposing raw credential values.$q$, $q$Organizations deploying AI agents$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Dashboard, API, CLI, and SDKs","Kubernetes Operator and Infisical Agent","Webhooks and 2FA","Self-hosting or cloud","All integrations (up to 10)","Secret referencing, scanning, and sharing","Up to 5 identities, 3 projects, 3 environments","Community Slack support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Pro$q$, $q$$18/identity/month$q$, $q$monthly$q$, $q$["All Free features","Secret versioning and point-in-time recovery","Role-based access controls","Secret rotation","Up to 3 honey tokens","Temporary access provisioning","SAML SSO and IP allowlisting","90-day audit log retention","Higher rate limits and priority support","12 environments, 50 integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["All Pro features","Dedicated infrastructure","Unlimited honey tokens","Enterprise SCIM and LDAP authentication","Dynamic secrets and AI security advisor","Approval workflows and access requests","Gateways and sub-organizations","KMIP and KMS/HSM support","Audit log streaming and custom retention","99.99% SLA and dedicated support engineer"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$overview$q$, $q$What is Infisical?$q$, 2, ARRAY[$q$Infisical is an open-source platform that combines secrets management, certificate (PKI) management, and privileged access management so teams don't need separate tools for each.$q$, $q$It supports self-hosting or cloud deployment, integrates with tools like AWS, Kubernetes, GitHub, and Terraform, and includes an Agent Vault feature for giving AI agents scoped access to credentials without exposing the raw secret values.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', $q$who-its-for$q$, $q$Who Infisical is for$q$, 2, ARRAY[$q$Infisical fits development and security teams that want centralized control over secrets and certificates, particularly those that prefer an open-source, self-hostable option or need to secure credential access for AI agents alongside human users.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('870d8f7e-4a30-42b3-8999-2b52c10af200', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;


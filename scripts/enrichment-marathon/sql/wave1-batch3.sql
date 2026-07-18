-- Enrichment marathon batch: 1Password Secrets Automation, ACP Admin, activepieces, ActivityWatch

-- ── 1Password Secrets Automation ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$1Password's toolkit for automating secure secrets access in apps, CI/CD pipelines, and infrastructure, via Service Accounts, self-hosted Connect servers, a CLI, and SDKs — included with a 1Password Business subscription.$q$, short_description),
  pricing_model = COALESCE($q$Included with 1Password Business subscription$q$, pricing_model),
  starting_price = COALESCE($q$$8.99/user/month (1Password Business, billed annually)$q$, starting_price),
  founded_year = COALESCE(2005, founded_year),
  company_size = COALESCE($q$1,001-5,000 employees$q$, company_size),
  headquarters = COALESCE($q$Toronto, Canada$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$1Password Secrets Automation: Features & Pricing$q$, seo_title),
  seo_meta_description = COALESCE($q$How 1Password Secrets Automation works: Service Accounts, Connect servers, CLI, and SDKs for automating secrets in CI/CD and infrastructure.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$1Password Secrets Automation is a set of developer tools from 1Password (founded 2005, headquartered in Toronto, Canada) for giving applications, scripts, and infrastructure secure, non-human access to secrets stored in 1Password vaults. It offers two deployment models: Service Accounts, which are simple, non-personal, rate-limited credentials suited to CI/CD pipelines and scripts (up to 100 per organization); and Connect, a self-hosted server (deployable via Docker or Kubernetes) that caches secrets locally in the user's own infrastructure, allowing unlimited re-requests after the first fetch, lower latency, and no rate limits. Access is available through the 1Password CLI, a REST API (Connect only), and official SDKs for Go, Python, and JavaScript, plus native Kubernetes integration for syncing secrets into clusters. Typical uses include injecting secrets into CI/CD builds, provisioning database credentials for web services, keeping infrastructure credentials separate from personal user accounts, and centralizing human and machine secrets management in one system. Secrets Automation is not sold as a standalone product — it is bundled into a 1Password Business subscription, which starts at $8.99 per user per month billed annually (a smaller Teams Starter Pack is $24.95/month for up to 10 members but is not confirmed to include Secrets Automation). It is aimed at DevOps, platform, backend engineering, and security teams that need to eliminate hardcoded credentials from code and pipelines.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ae78ea6a-31f8-4642-9dd7-797047244d47' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Service Accounts$q$, $q$Non-personal, scoped credentials for CI/CD and scripts, with up to 100 accounts per organization and usage audit reports.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Connect server$q$, $q$Self-hosted REST API server that caches secrets locally, enabling unlimited re-requests after the initial fetch.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$1Password CLI$q$, $q$Command-line access to vault items for scripting and terminal-based workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$SDKs (Go, Python, JavaScript)$q$, $q$Libraries for embedding secrets retrieval directly into application code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Kubernetes integration$q$, $q$Native syncing of 1Password secrets into Kubernetes clusters.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Usage/audit reporting$q$, $q$Visibility into which items a given service account or Connect token has accessed.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Two deployment models let teams trade off setup effort against rate limits and latency$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Bundled into an existing 1Password Business subscription rather than sold separately$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Native Kubernetes and CI/CD-friendly tooling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Centralizes both human and machine secrets in one system$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Service Accounts are rate-limited, pushing high-volume use cases toward self-hosting Connect$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Connect requires standing up and maintaining your own server infrastructure$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Requires a 1Password Business (or higher) plan — not available on free/personal accounts$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Is 1Password Secrets Automation a separate paid product?$q$, $q$No. It's included with a 1Password Business subscription, which starts at $8.99 per user per month billed annually.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$What's the difference between Service Accounts and Connect?$q$, $q$Service Accounts are simple, rate-limited, non-personal credentials ideal for CI/CD and scripts. Connect is a self-hosted server that caches secrets after the first fetch, giving unlimited subsequent requests, lower latency, and no rate limits in exchange for running your own infrastructure.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Does it integrate with Kubernetes?$q$, $q$Yes, via the Connect server and a native Kubernetes integration for syncing secrets into clusters.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Which languages have official SDKs?$q$, $q$Go, Python, and JavaScript, alongside the 1Password CLI and the Connect REST API.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$CI/CD secret injection$q$, $q$Automatically inject credentials into build and deployment pipelines without hardcoding them.$q$, $q$DevOps/platform teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Automated service provisioning$q$, $q$Provision database credentials and other secrets for web services on demand.$q$, $q$Backend engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Kubernetes secret sync$q$, $q$Sync vault secrets into Kubernetes clusters via Connect.$q$, $q$Infrastructure/SRE teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Separating infra credentials from personal accounts$q$, $q$Keep infrastructure and application secrets on non-personal Service Accounts rather than individual logins.$q$, $q$Security teams$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Teams Starter Pack$q$, $q$$24.95$q$, $q$per month, billed annually (includes 10 members)$q$, NULL, $q$["Password sharing","Security alerts","Role-based permissions","Developer tools access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$Business$q$, $q$$8.99$q$, $q$per user/month, billed annually$q$, NULL, $q$["Everything in Teams Starter Pack","SSO (Okta, Entra ID, OneLogin, Duo)","Vault sharing with granular permissions","Watchtower usage reporting","Secrets Automation (Service Accounts / Connect)"]$q$::jsonb, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'ae78ea6a-31f8-4642-9dd7-797047244d47';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$1Password Secrets Automation extends 1Password's password manager into infrastructure and application code, letting servers, scripts, and CI/CD jobs fetch secrets from 1Password vaults instead of hardcoding credentials or environment variables.$q$, $q$It's built around two non-personal access methods — Service Accounts and Connect servers — plus a CLI, REST API, and SDKs that developers use to wire secrets retrieval into their existing tooling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$service-accounts-vs-connect$q$, $q$Service Accounts vs. Connect Servers$q$, 2, ARRAY[$q$Service Accounts are lightweight, non-personal credentials (up to 100 per organization) that authenticate the 1Password CLI without tying access to an individual team member. They have low setup overhead and are well suited to shared environments and test pipelines, but operate under rate limits.$q$, $q$Connect servers are self-hosted (via Docker or Kubernetes) and cache secrets locally after the first fetch, which removes rate limits, reduces latency, and keeps requests entirely inside the user's own infrastructure — at the cost of having to run and maintain that server.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$integrations-and-sdks$q$, $q$CLI, SDKs, and Kubernetes Integration$q$, 2, ARRAY[$q$Developers can pull secrets via the 1Password CLI, a REST API (available with Connect), or official SDK libraries for Go, Python, and JavaScript for embedding secrets access directly in application code.$q$, $q$A native Kubernetes integration syncs 1Password secrets into clusters, and both Service Accounts and Connect are designed to plug into common CI/CD pipelines for automatic secret injection during builds and deployments.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$Secrets Automation is not a separate paid product — it's included with a 1Password Business subscription, which starts at $8.99 per user per month when billed annually and adds SSO, vault-sharing permissions, and usage reporting on top of core password-manager features.$q$, $q$A smaller Teams Starter Pack ($24.95/month for up to 10 members) covers basic team password sharing and developer tool access, though 1Password's own documentation does not specify whether it includes Secrets Automation features.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ae78ea6a-31f8-4642-9dd7-797047244d47', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── ACP Admin ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$A purpose-built web platform (also known as CSA Admin) for managing Community Supported Agriculture (CSA/ACP) organizations — members, deliveries, billing, and communications — used to coordinate 140,000+ baskets a year.$q$, short_description),
  pricing_model = COALESCE($q$Usage-based (revenue share)$q$, pricing_model),
  starting_price = COALESCE($q$1% of annual invoiced amount (capped at 2,400 CHF/EUR per year)$q$, starting_price),
  founded_year = COALESCE(2014, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$, $q$Italian$q$, $q$Dutch$q$]::text[],
  seo_title = COALESCE($q$ACP Admin (CSA Admin): CSA Management Software$q$, seo_title),
  seo_meta_description = COALESCE($q$ACP Admin manages CSA members, deliveries, billing, and communications. In use since 2014, coordinating 140,000+ baskets a year.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ACP Admin — published under the project name CSA Admin at csa-admin.org — is a web-based management platform built specifically for Community Supported Agriculture (CSA, or "ACP" in French-speaking Switzerland) organizations. It was created by developer Thibaud Guillaume-Gentil, originally to run the CSA "Rage de Vert," and has been in use since 2014. It now serves associations, cooperatives, businesses, and individuals running CSA-style direct farm-to-consumer distribution across Switzerland, Germany, and the Netherlands, together managing over 140,000 baskets annually. Core functionality covers member registration and waiting lists, flexible delivery scheduling (including variable frequencies and absences), automated invoicing with QR-bill and SEPA Direct Debit support and EBICS payment reconciliation, subscription renewal and cancellation workflows, personalized member email communications and newsletters, an online shop for supplementary products with stock management, basket/harvest content tracking, and member fieldwork participation tracking. The platform is GDPR/nLPD-compliant and available in English, French, German, Italian, and Dutch. Pricing is unusual for SaaS: instead of a flat subscription, organizations pay 1% of the amount invoiced through the platform per year, capped at 2,400 CHF/EUR annually, with hosting, security updates, and support included and no setup fee. The source code is published on GitHub under the O'Saasy license (source-available rather than a standard open-source license). It targets CSA operators and cooperatives specifically rather than general-purpose CRM or e-commerce users.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Member & waiting-list management$q$, $q$Registration, subscription tracking, and waiting lists for CSA members.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Flexible delivery scheduling$q$, $q$Supports variable delivery frequencies and member absence handling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Automated QR-bill invoicing$q$, $q$Generates QR-bill invoices with SEPA Direct Debit and EBICS payment reconciliation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Renewal & cancellation workflows$q$, $q$Structured annual renewal process, including bidding-based renewals.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Online shop & stock management$q$, $q$Sell supplementary products alongside baskets with built-in inventory tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Member email communications$q$, $q$Personalized newsletters and communications sent directly to members.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Fieldwork participation tracking$q$, $q$Tracks member involvement in farm fieldwork and preparation activities.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Purpose-built for CSA/ACP operations rather than a generic CRM adapted to the use case$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Hosting, support, and security updates bundled into the pricing with no setup fee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Proven at scale — used to coordinate 140,000+ baskets annually across multiple countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Multilingual (English, French, German, Italian, Dutch) for cross-border European use$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Source code publicly available on GitHub$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Revenue-share pricing (1% of invoiced amount) can be harder to budget for than a flat subscription, especially for larger CSAs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Licensed as source-available (O'Saasy), not a standard open-source license$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Narrow focus on CSA/direct farm distribution means it isn't a fit for other retail or subscription-box models$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$What is ACP Admin used for?$q$, $q$Managing the day-to-day operations of Community Supported Agriculture (CSA/ACP) organizations: member subscriptions, delivery scheduling, invoicing, and communications.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$How much does ACP Admin cost?$q$, $q$1% of the amount invoiced through the platform per year, capped at 2,400 CHF/EUR annually, with hosting, support, and updates included and no setup fee.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Is the source code available?$q$, $q$Yes, it's published on GitHub under the O'Saasy license.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Which countries is it used in?$q$, $q$CSA organizations in Switzerland, Germany, and the Netherlands use the platform, among others.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Running an established CSA farm's admin$q$, $q$Managing members, deliveries, and billing for an existing farm-to-consumer subscription program.$q$, $q$Farmers / CSA operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Launching a new CSA cooperative$q$, $q$Setting up membership, delivery, and payment workflows for a newly formed cooperative.$q$, $q$New agricultural cooperatives$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$Coordinating multi-site basket distribution$q$, $q$Managing basket content, value tracking, and logistics across multiple distribution points.$q$, $q$Larger CSA networks$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'dfb290e4-e468-49f6-8a3d-bb8dbcae59cf';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ACP Admin (published under the name CSA Admin) is software built exclusively for Community Supported Agriculture organizations — the model where members subscribe in advance to receive regular baskets of produce directly from a farm or cooperative.$q$, $q$It has been in production use since 2014, created by developer Thibaud Guillaume-Gentil, and today coordinates the administration of more than 140,000 baskets a year across organizations in Switzerland, Germany, and the Netherlands.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform handles the full membership lifecycle: registration, waiting lists, flexible delivery schedules that account for variable frequencies and member absences, and structured renewal or cancellation workflows (including bidding-based renewals).$q$, $q$Beyond membership, it includes an online shop for supplementary products with stock/inventory management, tools for tracking basket contents and harvest value, and features for organizing member participation in fieldwork and preparation activities.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$billing-and-payments$q$, $q$Billing and Payments$q$, 2, ARRAY[$q$Invoicing is automated, generating QR-bill invoices and supporting SEPA Direct Debit and EBICS-based payment reconciliation, which reduces manual bookkeeping for organizations handling hundreds of recurring member payments.$q$, $q$Personalized email communications and newsletters are built in for keeping members informed about deliveries, renewals, and organizational updates.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$pricing-model$q$, $q$Pricing Model$q$, 2, ARRAY[$q$Rather than a flat per-seat subscription, ACP Admin charges 1% of the total amount invoiced through the platform each year, capped at 2,400 CHF/EUR annually — so cost scales with an organization's size and revenue rather than user count.$q$, $q$Hosting, security updates, and support are included in that fee, and there is no separate setup cost.$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', $q$source-availability$q$, $q$Source Code and License$q$, 2, ARRAY[$q$The codebase is published on GitHub and described as "source-available" under the O'Saasy license — code can be reviewed and contributions accepted, though this differs from a standard permissive open-source license.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dfb290e4-e468-49f6-8a3d-bb8dbcae59cf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── activepieces ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Open-source, AI-first automation platform for building no-code workflows and AI agents, with 700+ integrations, positioned as an alternative to Zapier and Make.$q$, short_description),
  pricing_model = COALESCE($q$Freemium (usage-based) plus a free open-source self-hosted edition$q$, pricing_model),
  starting_price = COALESCE($q$Free (10 active flows); $5 per active flow/month after that$q$, starting_price),
  founded_year = COALESCE(2022, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$San Francisco, CA$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Activepieces: Open-Source No-Code Automation & AI Agents$q$, seo_title),
  seo_meta_description = COALESCE($q$Activepieces is an open-source, AI-first automation platform with 700+ integrations, no-code workflows, and AI agents. Free tier available.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Activepieces is an open-source, AI-first automation platform that lets teams build no-code workflows and AI agents to connect apps and automate business processes, positioning itself as an alternative to Zapier and Make. Founded in 2022 and backed by Y Combinator (W2023 batch), the company is based in San Francisco. Its drag-and-drop builder connects 700+ integrations, including Gmail, Slack, HubSpot, OpenAI, and Notion, and it offers AI agents that can autonomously carry out multi-step tasks with optional human approval steps, alongside unlimited MCP (Model Context Protocol) servers and unlimited tables for structured data. It's used by companies including PostHog, Red Bull, Rakuten, DocuSign, and Roblox. Activepieces is MIT-licensed and available as a fully free, self-hosted Community Edition on GitHub, requiring technical setup but including core automation features. Its hosted Standard plan is free for up to 10 active flows with unlimited workflow runs, then charges $5 per active flow per month with no run limits. An Ultimate plan adds enterprise governance — team/personal project separation, piece access controls, custom RBAC, SSO, and audit logs — via a custom annual contract. It targets automation use across sales, support, marketing, finance, HR, IT, operations, engineering, and data teams, appealing especially to teams that want both a generous free/self-hosted option and modern AI-agent building blocks in one platform.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$No-code workflow builder$q$, $q$Drag-and-drop interface for assembling multi-step automations without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$700+ integrations$q$, $q$Connects apps including Gmail, Slack, HubSpot, OpenAI, and Notion.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$AI agents$q$, $q$Agents that autonomously handle tasks, with optional human-approval steps.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Unlimited MCP servers$q$, $q$Model Context Protocol servers included without limits on hosted plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Unlimited tables$q$, $q$Built-in structured data tables for use within automations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Enterprise governance (Ultimate plan)$q$, $q$SSO, custom RBAC, piece access controls, and audit logs for larger organizations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Self-hosted Community Edition$q$, $q$MIT-licensed, free, self-hosted deployment of the core platform.$q$, 6);

DELETE FROM tool_pros WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Generous free tier: 10 active flows with unlimited runs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Fully free, MIT-licensed self-hosted Community Edition$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Large integration library (700+) including modern AI tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Built-in AI agent capability, not just linear automations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Per-flow (not per-run) pricing means high-volume automations don't get penalized$q$, 4);

DELETE FROM tool_cons WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Per-active-flow pricing can add up for teams running many distinct workflows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Enterprise security/governance features require the custom-priced Ultimate plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Self-hosting the Community Edition requires technical setup and maintenance$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Is Activepieces free?$q$, $q$Yes — the hosted Standard plan is free for up to 10 active flows with unlimited runs, and there's also a fully free, self-hosted, open-source Community Edition.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Is Activepieces open source?$q$, $q$Yes, it's MIT-licensed with source code available on GitHub.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$What's the difference between the Standard and Ultimate plans?$q$, $q$Standard is pay-per-active-flow ($5/flow/month after the first 10 free) with core AI and automation features. Ultimate is a custom-priced annual contract that adds enterprise governance: SSO, custom RBAC, piece access controls, and audit logs.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Can Activepieces build AI agents, not just automations?$q$, $q$Yes, it offers AI agents that can autonomously carry out multi-step tasks, with an option to require human approval.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Sales operations automation$q$, $q$Automate lead routing and CRM syncing across sales tools.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Support ticket automation$q$, $q$Route and respond to support tickets automatically across channels.$q$, $q$Support teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Internal IT/ops workflows$q$, $q$Automate recurring internal processes across IT and operations tooling.$q$, $q$IT/Ops teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Building AI agents$q$, $q$Create AI agents that autonomously execute tasks with optional human approval.$q$, $q$Product/engineering teams$q$, 3);

DELETE FROM tool_pricing_plans WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Standard$q$, $q$Free, then $5 per active flow$q$, $q$per month (usage-based)$q$, NULL, $q$["10 free active flows","Unlimited runs","AI agents","Unlimited MCP servers","Unlimited tables","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Ultimate$q$, $q$Custom$q$, $q$annual contract$q$, NULL, $q$["Team & personal projects","Piece access controls","Global connections","Custom RBAC","SSO","Audit logs"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$Community Edition$q$, $q$Free$q$, $q$self-hosted$q$, NULL, $q$["MIT licensed","Core automation features","Requires self-managed deployment"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'f0485685-77e9-44e2-bfce-dffbe3d4b29f';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Activepieces is a no-code, AI-first automation platform for building workflows ('flows') that connect apps and services, plus AI agents that can carry out multi-step tasks autonomously with optional human approval.$q$, $q$Founded in 2022 and part of Y Combinator's W2023 batch, the company is based in San Francisco and is used by teams at companies including PostHog, Red Bull, Rakuten, DocuSign, and Roblox.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$A drag-and-drop builder connects 700+ integrations spanning email, CRM, communication, and AI tools such as Gmail, Slack, HubSpot, OpenAI, and Notion, letting non-developers assemble multi-step automations without writing code.$q$, $q$The platform includes unlimited MCP (Model Context Protocol) servers and unlimited tables for structured data on every hosted plan, alongside its core AI agent capability.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$ai-agents$q$, $q$AI Agents$q$, 2, ARRAY[$q$Beyond linear if-this-then-that automations, Activepieces offers AI agents that can handle tasks autonomously, with the option to require human approval before an agent takes a given action — aimed at teams that want AI in the loop without losing oversight.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$open-source-and-self-hosting$q$, $q$Open Source and Self-Hosting$q$, 2, ARRAY[$q$Activepieces is MIT-licensed, with its Community Edition available for free, self-hosted deployment from its GitHub repository. This gives technical teams full control over data and infrastructure, though it requires the skills to deploy and maintain it themselves, and includes only the core feature set (not the hosted plans' enterprise governance tools).$q$]::text[], 3);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', $q$pricing$q$, $q$Pricing$q$, 2, ARRAY[$q$The hosted Standard plan is free for up to 10 active flows with unlimited runs, then charges $5 per active flow per month with no cap on execution volume ('run millions, pay the same').$q$, $q$An Ultimate plan, sold on a custom annual contract, adds enterprise governance: separate team and personal projects, piece access controls, global connections, custom RBAC, SSO, and audit logs.$q$]::text[], 4);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f0485685-77e9-44e2-bfce-dffbe3d4b29f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── ActivityWatch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Free, open-source, privacy-first time-tracking app that automatically logs which apps and websites you use, storing all data locally on your own device with no cloud sync required.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ActivityWatch: Free, Open-Source Time Tracking$q$, seo_title),
  seo_meta_description = COALESCE($q$ActivityWatch automatically tracks app and website usage, storing data locally. Free, open-source, no premium tiers or ads.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ActivityWatch is a free, open-source application that automatically tracks how users spend time on their computers and phones, logging active applications, window titles, and (via browser extensions) websites visited. It was created by brothers Erik Bjäreholt and Johan Bjäreholt, who continue to maintain it, built because they wanted this kind of tool and it didn't exist yet; it's now maintained with community contributions. The software is licensed under MPL-2.0 and explicitly has 'no premium tiers, no usage limits, and no ads' — it is entirely free rather than freemium. Its defining feature is a privacy-first, local-first architecture: all tracked time data is stored on the user's own device and, according to the project, is never sent to any server, giving users full control over their data. Core capabilities include automatic tracking of active applications and window titles, category rules for organizing activity into groups, an activity timeline and dashboard for visualization, browser extensions for Chrome and Firefox that track website visits, and editor plugins for tracking coding time. Cross-device synchronization is listed as in development rather than fully mature. ActivityWatch runs on Windows, macOS, Linux, and Android (no official iOS app was found). It appeals to individuals who want personal productivity or digital-wellbeing insight, and to developers or privacy-conscious users and freelancers who want time-tracking data that never leaves their own machine.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c90b471e-f0b7-403c-972f-49e1d0871d55' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Automatic app & window tracking$q$, $q$Logs active applications and window titles in the background without manual input.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Browser extensions$q$, $q$Chrome and Firefox extensions extend tracking to website visits.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Editor plugins$q$, $q$Plugins for tracking time spent coding directly in supported editors.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Local-first storage$q$, $q$All data is stored on-device and never sent to a server.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Category rules$q$, $q$Group raw activity data into custom categories for easier review.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Activity dashboard$q$, $q$Local timeline and dashboard for visualizing tracked time.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Completely free with no premium tiers, usage limits, or ads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Strong privacy model — data never leaves the user's device$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Open source (MPL-2.0) and extensible$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Cross-platform: Windows, macOS, Linux, and Android$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$No official iOS app$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Cross-device data synchronization is still in development$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$As a volunteer-maintained project, support and integrations depend on community contribution rather than a commercial team$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Is ActivityWatch really free?$q$, $q$Yes. It's fully free and open source, with no premium tiers, usage limits, or ads.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Where is my tracked data stored?$q$, $q$Locally on your own device. According to the project, it is never sent to any server.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Does ActivityWatch track website visits?$q$, $q$Yes, via its Chrome and Firefox browser extensions.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$What platforms does it support?$q$, $q$Windows, macOS, Linux, and Android; no official iOS app is available.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Personal productivity tracking$q$, $q$Understand where your time actually goes across apps and websites.$q$, $q$Individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Developer time tracking$q$, $q$Track time spent coding directly from your editor via plugins.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Digital wellbeing awareness$q$, $q$Build awareness of screen time and app usage habits.$q$, $q$General users$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$Privacy-conscious time tracking$q$, $q$Track time without sending any data to a third-party server.$q$, $q$Privacy-focused users / freelancers$q$, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'c90b471e-f0b7-403c-972f-49e1d0871d55';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ActivityWatch is a free, open-source app that automatically tracks how you spend time on your devices — which applications you use, which windows are active, and (with browser extensions) which websites you visit — without requiring any manual logging.$q$, $q$It was built by brothers Erik Bjäreholt and Johan Bjäreholt, who created it because a tool like it 'should exist' but didn't, and it continues to be developed by volunteers and community contributors.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$how-it-works$q$, $q$How It Works$q$, 2, ARRAY[$q$The core app automatically tracks active applications and window titles in the background, and lets users define category rules so raw activity data can be grouped into meaningful buckets for review.$q$, $q$Browser extensions for Chrome and Firefox extend tracking to website visits, and editor plugins are available for logging coding time directly, with all results viewable in an activity timeline and dashboard.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$privacy-and-data$q$, $q$Privacy and Local-First Data$q$, 2, ARRAY[$q$ActivityWatch's central design principle is that data stays local: all tracked time data is stored on the user's own device and is never sent to any server, according to the project. This distinguishes it from cloud-based time trackers and gives users full control over their own activity data.$q$, $q$Cross-device synchronization is listed as a feature still in development, meaning users running ActivityWatch on multiple machines don't yet get a fully mature way to merge that data automatically.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', $q$platforms-and-cost$q$, $q$Platforms and Cost$q$, 2, ARRAY[$q$The app is available for Windows, macOS, Linux, and Android. It is released under the MPL-2.0 open-source license and is entirely free, with the project explicitly stating there are 'no premium tiers, no usage limits, and no ads.'$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c90b471e-f0b7-403c-972f-49e1d0871d55', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;


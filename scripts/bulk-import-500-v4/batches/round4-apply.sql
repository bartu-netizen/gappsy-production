-- Enrichment batch: Form.io, HeyForm, Formpress, Yakforms, SurveyJS, OpnForm, Docassemble, GoAccess, Open Web Analytics, Ackee, Counter, Flagsmith, Unleash, Flipt, FeatBit, ConfigCat, DevCycle, MariaDB, ScyllaDB, ClickHouse, DuckDB, FerretDB, Valkey, Dragonfly, KeyDB, OpenSearch, Quickwit, Manticore Search, Vespa, Chroma, LanceDB, Marqo, Parse Platform, PostgREST, DreamFactory, Kong, Tyk, Gravitee, KrakenD, Traefik Hub, Hurl, Schemathesis, Convoy, Novu, Knock, Courier, SuprSend, MagicBell, Engagespot, Gotify, ntfy, Listmonk, Mautic, Keila, Sendy, Postal, Mailcow, Mailu, Modoboa, Stalwart Mail Server, Maddy Mail Server, Mail-in-a-Box, Mailpit, MJML, Unlayer, GrapesJS, Builder.io, Plasmic, Webstudio, TeleportHQ, Pinegrow, Bootstrap Studio, Silex, Hugo, Jekyll
-- Publishes 75 bulk-imported tool(s) with full editorial content.

-- ── Form.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Self-hosted form and API platform that turns JSON-driven form schemas into APIs, PDFs, and data workflows.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = $q$$330/month$q$,
  founded_year = 2015,
  company_size = NULL,
  headquarters = $q$Dallas, TX, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Form.io is a self-hosted form and API platform with drag-and-drop building, auto-generated APIs, PDF forms, and enterprise SSO.$q$,
  og_description = $q$Form.io is a self-hosted form and API platform with drag-and-drop building, auto-generated APIs, PDF forms, and enterprise SSO.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a141dc6c-48ce-4194-aa10-52dc5225f542';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a141dc6c-48ce-4194-aa10-52dc5225f542' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Drag-and-drop form builder$q$, $q$Build multi-step forms with conditional logic through a visual, no-code builder.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Automatic API generation$q$, $q$Every form automatically becomes a RESTful API endpoint for submissions and data routing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$PDF forms$q$, $q$Convert forms to pixel-perfect PDFs or upload existing PDFs and turn them into dynamic, data-bound forms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Embedded reporting$q$, $q$Build interactive data analytics and reports on top of submission data using MongoDB aggregation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$E-Sign+ digital signatures$q$, $q$Capture cryptographic signatures that are bound to the submission data for legal validity.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Multi-tenancy$q$, $q$Run isolated sub-projects from a single deployment, suited to SaaS and multi-client platforms.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Role-based access control$q$, $q$Control access with RBAC, SAML authentication, and audit logging across projects.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Open-source core avoids hard vendor lock-in and allows full self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$No per-submission, per-API-call, or per-end-user usage fees$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Automatic API generation removes the need to hand-build backend endpoints for every form$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Enterprise features like SAML SSO, multi-tenancy, and audit logging are built in$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Used by large organizations including Accenture, Deloitte, and PepsiCo$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Enterprise pricing is configuration-based, starting at $330/month per project or server environment$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Advanced modules (PDF server, reporting UI, accessibility compliance) are priced as separate add-ons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Setup and self-hosting require developer resources rather than a simple SaaS sign-up$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Is Form.io open source?$q$, $q$Yes. Form.io has an open-source core, including the formio.js SDK and the Universal Agent Gateway, both available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Can Form.io be self-hosted?$q$, $q$Yes, Form.io offers a self-hosted starter configuration in addition to its SaaS offering.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$How does Form.io pricing work?$q$, $q$Pricing is configuration-based rather than usage-based, charging per project and per API/PDF server environment instead of per form, submission, or API call.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Is there a free trial?$q$, $q$Form.io SaaS offers a 30-day free trial with no credit card required.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Who uses Form.io?$q$, $q$Form.io lists enterprise and government customers including Accenture, Booz Allen Hamilton, Deloitte, LexisNexis, and the State of Ohio.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Enterprise application forms$q$, $q$Standardize data collection and API routing across large organizations without building custom backend endpoints for every form.$q$, $q$Enterprise IT and application development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Regulated document workflows$q$, $q$Convert paper PDF forms into dynamic digital forms and capture legally binding e-signatures.$q$, $q$Government agencies and regulated industries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Multi-tenant SaaS platforms$q$, $q$Isolate form and data configurations per client using Form.io's multi-tenancy feature.$q$, $q$SaaS platform builders$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["Open-source core","Self-hosted deployment","formio.js SDK"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Enterprise Project$q$, $q$$330/month$q$, $q$monthly$q$, $q$["Unlimited forms, submissions, and API calls"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$API Server Plus$q$, $q$$660/month$q$, $q$monthly$q$, $q$["Dedicated scalable API server environment"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$Multi-Tenanted Platform$q$, $q$$330/month$q$, $q$monthly$q$, $q$["10 child projects per bucket"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$overview$q$, $q$What is Form.io?$q$, 2, ARRAY[$q$Form.io is a self-hosted, enterprise application composition platform for building forms, APIs, and data workflows from JSON schemas.$q$, $q$Beyond drag-and-drop form building, it automatically generates REST APIs from form schemas, converts forms to PDFs, and supports role-based access, SAML SSO, and multi-tenancy for enterprise deployments.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', $q$who-its-for$q$, $q$Who Form.io is for$q$, 2, ARRAY[$q$Form.io is aimed at enterprise development teams, government agencies, and SaaS builders who need self-hosted control over form data and are willing to work with configuration-based, per-project enterprise pricing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a141dc6c-48ce-4194-aa10-52dc5225f542', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;

-- ── HeyForm ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source Typeform alternative with AI-assisted form generation, conditional logic, and 40+ integrations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$HeyForm is an open-source form builder with AI form generation, conditional logic, templates, and 40+ integrations like Slack and Zapier.$q$,
  og_description = $q$HeyForm is an open-source form builder with AI form generation, conditional logic, templates, and 40+ integrations like Slack and Zapier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fddc4cea-b640-45b6-a982-077960bcbadc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fddc4cea-b640-45b6-a982-077960bcbadc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$AI-powered form generation$q$, $q$Generate a complete form in seconds from a prompt using built-in AI tools.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Conditional logic$q$, $q$Personalize the form flow for respondents based on their previous answers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Multiple endings$q$, $q$Route respondents to different outcome or redirect screens based on their responses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Pre-built templates$q$, $q$Start from templates across categories like HR, marketing, education, and support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$40+ integrations$q$, $q$Connect forms to tools including Slack, Google Sheets, Zapier, Stripe, and Mailchimp.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Responsive design$q$, $q$Forms are optimized to display correctly across mobile, tablet, and desktop.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Self-hosting$q$, $q$Deploy HeyForm on your own infrastructure since the project is fully open source.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Fully open source with a self-hostable codebase (8,886+ GitHub stars)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$AI-assisted form generation speeds up form creation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$40+ native integrations including Slack, Google Sheets, and Zapier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Bootstrapped, independently run project (EarlyBird) with no external investors$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Custom domains and branding removal require the Premium plan or higher$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Team member seats are capped on lower tiers (3 on Premium, 10 on Business)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Full feature set is spread across four separate pricing tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Is HeyForm open source?$q$, $q$Yes, HeyForm is fully open source and can be self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Does HeyForm offer a free trial?$q$, $q$Yes, HeyForm offers a 7-day free trial on its Basic, Premium, and Business plans.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$What is the cheapest paid plan?$q$, $q$The Basic plan starts at $15/month and includes unlimited forms, 5,000 monthly responses, and 10GB of storage.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Who maintains HeyForm?$q$, $q$HeyForm is built and maintained by EarlyBird, a bootstrapped, independent software company.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Can I remove HeyForm branding?$q$, $q$Branding removal is available starting on the Premium plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Lead and survey forms$q$, $q$Build conditional, mobile-responsive forms for lead capture and surveys without a developer.$q$, $q$Small businesses and marketers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Self-hosted data collection$q$, $q$Deploy HeyForm on private infrastructure to keep form response data fully in-house.$q$, $q$Teams with data-residency or privacy requirements$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Basic$q$, $q$$15/month$q$, $q$monthly$q$, $q$["Unlimited forms","5,000 monthly responses","10GB storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Premium$q$, $q$$24/month$q$, $q$monthly$q$, $q$["20,000 responses","20GB storage","Up to 3 team members","Custom domain","Branding removal"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Business$q$, $q$$40/month$q$, $q$monthly$q$, $q$["150,000 responses","50GB storage","Up to 10 team members","Unlimited file uploads","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Dedicated support","Fully customizable features"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$overview$q$, $q$What is HeyForm?$q$, 2, ARRAY[$q$HeyForm is an open-source form builder positioned as a Typeform alternative, aimed at small businesses that want to keep full control of their form data.$q$, $q$It combines AI-assisted form generation with conditional logic, customizable themes, and over 40 integrations, and is available both as a hosted service and as a self-hosted deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', $q$who-its-for$q$, $q$Who HeyForm is for$q$, 2, ARRAY[$q$HeyForm suits small businesses and independent teams that want a lower-cost, self-hostable alternative to closed-source form builders, especially those who value data ownership.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddc4cea-b640-45b6-a982-077960bcbadc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Formpress ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, MIT-licensed drag-and-drop form builder for collecting data with conditionals and integrations.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Formpress is a free, open-source drag-and-drop form builder with smart conditionals, custom themes, and embeddable forms.$q$,
  og_description = $q$Formpress is a free, open-source drag-and-drop form builder with smart conditionals, custom themes, and embeddable forms.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a0118430-d952-414d-b1c2-ca4afbeb6470';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a0118430-d952-414d-b1c2-ca4afbeb6470' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Drag-and-drop builder$q$, $q$Create forms with a WYSIWYG drag-and-drop interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Smart conditionals$q$, $q$Show or hide fields dynamically based on form conditionals.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Custom themes$q$, $q$Customize the look of forms with configurable themes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Multiple field types$q$, $q$Build forms using a range of supported field types.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Embeddable and shareable forms$q$, $q$Share forms via a direct link or embed them on external websites.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Integrations$q$, $q$Connect forms to third-party services via built-in integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Fully open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Source code hosted on GitLab with a substantial commit history (2,300+ commits since 2019)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$No cost since it's self-hosted and free to use$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Lightweight, fast-loading forms$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$No published cloud-hosted plan or managed pricing option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Self-hosting is required to run the product$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Limited public documentation on company backing or support options$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Is Formpress free?$q$, $q$Yes, Formpress is fully open source and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$What license does Formpress use?$q$, $q$Formpress is licensed under the MIT license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Where is the source code hosted?$q$, $q$Formpress's source code is hosted on GitLab under the FormPress organization.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Does Formpress support conditional logic?$q$, $q$Yes, it offers 'smart conditionals' to control which fields display based on form logic.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Self-hosted data collection forms$q$, $q$Deploy Formpress on your own servers to collect survey or contact data without third-party hosting.$q$, $q$Developers and teams needing full data control$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$Embedded website forms$q$, $q$Embed Formpress forms directly into existing websites for lead capture or feedback.$q$, $q$Website owners and small teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$overview$q$, $q$What is Formpress?$q$, 2, ARRAY[$q$Formpress is an open-source form builder for web data collection and online surveys, built around a drag-and-drop WYSIWYG editor.$q$, $q$It is MIT-licensed and hosted on GitLab, with support for smart conditionals, custom themes, multiple field types, and shareable or embeddable forms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', $q$who-its-for$q$, $q$Who Formpress is for$q$, 2, ARRAY[$q$Formpress fits developers and organizations that want a free, self-hosted form builder they can fully control and customize rather than relying on a paid SaaS platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a0118430-d952-414d-b1c2-ca4afbeb6470', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Yakforms ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, GPL-licensed open-source form and survey builder, the rebrand of Framaforms after five years.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Yakforms is a free, open-source (GPL 2.0) form and survey builder that can be self-hosted or used in SaaS mode.$q$,
  og_description = $q$Yakforms is a free, open-source (GPL 2.0) form and survey builder that can be self-hosted or used in SaaS mode.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'aedcb41b-b1e4-4c36-a18f-c2f220a1750c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'aedcb41b-b1e4-4c36-a18f-c2f220a1750c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Drag-and-drop form builder$q$, $q$Create surveys and questionnaires with multiple field types using a visual builder.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Design themes$q$, $q$Choose from multiple design themes to customize the look of a form.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Multi-channel sharing$q$, $q$Share forms via link, email, social media, or embed them on a website.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Built-in analytics$q$, $q$View response analytics with data visualization and export results to Excel.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Form cloning$q$, $q$Clone existing forms so others can reuse and adapt them.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Fully open source under the GPL 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Can be self-hosted for full control over form data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Large-scale real-world usage: reported 825,000+ forms created and 18 million+ responses collected$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Adopted by organizations including Framasoft and France's Ministry of Foreign Affairs$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Site and documentation are primarily in French$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$No public pricing is listed for the hosted SaaS mode$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Smaller international community than mainstream form-builder competitors$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Is Yakforms free?$q$, $q$Yes, Yakforms is free and open source under the GPL 2.0 license, and can be self-hosted.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$What was Yakforms called before?$q$, $q$Yakforms is a rebrand of Framaforms after five years under that name.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Can Yakforms be used as a hosted SaaS?$q$, $q$Yes, the site mentions a SaaS mode, though no public pricing is listed for it.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Who uses Yakforms?$q$, $q$Adopters include Framasoft and France's Ministry of Foreign Affairs, among other organizations running their own instances.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Self-hosted surveys$q$, $q$Run survey and questionnaire collection on your own infrastructure instead of proprietary tools like Google Forms.$q$, $q$Organizations wanting data sovereignty$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$Public sector and nonprofit forms$q$, $q$Collect public-facing form submissions at scale, as demonstrated by government and nonprofit adopters.$q$, $q$Government agencies and nonprofits$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$overview$q$, $q$What is Yakforms?$q$, 2, ARRAY[$q$Yakforms is a free and open-source form and survey builder, rebranded from Framaforms after five years under that name.$q$, $q$It offers a drag-and-drop builder, multiple design themes, built-in analytics with Excel export, and can be self-hosted or accessed through a SaaS mode.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', $q$who-its-for$q$, $q$Who Yakforms is for$q$, 2, ARRAY[$q$Yakforms is suited to organizations, particularly in French-speaking and public-sector contexts, that want a free alternative to Google Forms with the option to self-host.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('aedcb41b-b1e4-4c36-a18f-c2f220a1750c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SurveyJS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source JavaScript UI library suite for building custom survey, form, and dashboard tools with a one-time developer license.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$569/developer (first year)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SurveyJS offers open-source JavaScript libraries for forms, surveys, dashboards, and PDF generation, with a free tier and paid developer licenses.$q$,
  og_description = $q$SurveyJS offers open-source JavaScript libraries for forms, surveys, dashboards, and PDF generation, with a free tier and paid developer licenses.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b8e9003-1dee-4fa7-ab68-fbf26bacf48a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Form Library$q$, $q$Render interactive, JSON-schema-driven forms and surveys in React, Angular, Vue 3, or vanilla JavaScript.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Survey Creator$q$, $q$A drag-and-drop builder that generates the underlying JSON configuration for a form or survey.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Dashboard$q$, $q$Visualize collected survey response data through charts and tables.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$PDF Generator$q$, $q$Convert forms to editable or pre-filled PDF documents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Accessibility compliance$q$, $q$Built to meet WCAG, Section 508, and ARIA accessibility standards.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Offline data collection$q$, $q$Collect form responses without an active internet connection.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$AI-assisted form generation$q$, $q$Generate forms with the help of built-in AI assistance.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Open-source core (Form Library) is MIT-licensed and free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Unlimited usage with no caps on forms, responses, admins, or submissions$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Supports React, Angular, Vue 3, and vanilla JavaScript$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Royalty-free developer licenses cover distribution without extra end-user fees$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$WCAG/Section 508/ARIA accessibility compliance built in$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Full commercial toolset (Creator, Dashboard, PDF Generator) requires a paid developer license starting at $569 for the first year$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Enterprise tier pricing starts at $2,299 with custom quotes$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Requires developer integration rather than being a standalone, no-code SaaS app$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Is SurveyJS free?$q$, $q$The Essential tier and the core Form Library are free and open source under the MIT license; the Survey Creator, Dashboard, and PDF Generator require a paid developer license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$How is SurveyJS licensed?$q$, $q$SurveyJS uses one-time-purchase developer licenses that are royalty-free, with no extra fees for end users, instances, or apps.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$What frameworks does SurveyJS support?$q$, $q$SurveyJS supports React, Angular, Vue 3, and vanilla JavaScript.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$What is included with a developer license?$q$, $q$A license includes the first 12 months of maintenance; renewals extend continued support and access to new updates.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Does SurveyJS support offline use?$q$, $q$Yes, SurveyJS supports offline data collection.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Embedded survey tools$q$, $q$Add form and survey creation, data collection, and analytics directly inside a web application.$q$, $q$Software developers building custom platforms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Accessible public-sector forms$q$, $q$Build forms that meet WCAG/Section 508/ARIA accessibility requirements.$q$, $q$Teams with accessibility compliance requirements$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Essential$q$, $q$Free$q$, NULL, $q$["Open-source Form Library"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Basic$q$, $q$$569/developer (first year)$q$, $q$annual$q$, $q$["12 months of updates and support","Renewal at $229/year"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$PRO$q$, $q$$1,029/developer (first year)$q$, $q$annual$q$, $q$["12 months of updates and support","Renewal at $409/year"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$Enterprise$q$, $q$From $2,299$q$, $q$annual$q$, $q$["Custom pricing","Renewal from $919/year"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$overview$q$, $q$What is SurveyJS?$q$, 2, ARRAY[$q$SurveyJS is a suite of JavaScript UI libraries for building custom survey, form, dashboard, and PDF-generation tools inside web applications.$q$, $q$The core Form Library is open source and MIT-licensed and free to use, while the Survey Creator, Dashboard, and PDF Generator are available under paid, royalty-free developer licenses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', $q$who-its-for$q$, $q$Who SurveyJS is for$q$, 2, ARRAY[$q$SurveyJS is built for software developers who want to embed survey and form functionality directly into their own React, Angular, Vue, or JavaScript applications rather than using a hosted SaaS form tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b8e9003-1dee-4fa7-ab68-fbf26bacf48a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── OpnForm ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source form builder with unlimited free submissions, self-hosting via Docker, and a paid hosted tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpnForm is an open-source form builder with unlimited free forms and submissions, self-hosting via Docker, and paid Pro, Business, and Enterprise plans.$q$,
  og_description = $q$OpnForm is an open-source form builder with unlimited free forms and submissions, self-hosting via Docker, and paid Pro, Business, and Enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'acb31b58-aa23-4c6b-b191-585512bf65f6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'acb31b58-aa23-4c6b-b191-585512bf65f6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Unlimited forms and submissions$q$, $q$Free plan includes unlimited forms and submissions with no per-response charges.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Multi-step and single-page layouts$q$, $q$Build forms as either a single page or a guided multi-step flow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Conditional logic and computed fields$q$, $q$Show or hide fields dynamically and calculate values based on other responses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Integrations$q$, $q$Connect forms to Slack, Discord, Google Sheets, Zapier, and Stripe.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Custom domains$q$, $q$Serve forms on a custom domain (available on paid plans).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Self-hosting$q$, $q$Self-host OpnForm via Docker as a free Community Edition or a licensed Enterprise edition.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$SSO and audit logs$q$, $q$Enterprise plan adds SAML/LDAP SSO and audit logging.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Free plan offers unlimited forms and submissions with no per-response charges$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Fully open source (3,000+ GitHub stars) with self-hosting via Docker$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$EU hosting with GDPR-compliant architecture$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Wide integration list including Slack, Discord, Google Sheets, Zapier, and Stripe$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Free plan requires OpnForm branding on forms$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Advanced integrations like HubSpot and Salesforce are locked behind the $67/month Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Self-hosted Enterprise license costs $1,999/year per instance$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Is OpnForm free?$q$, $q$Yes, OpnForm has a free plan with unlimited forms and submissions, plus a free, self-hostable Community Edition.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Can OpnForm be self-hosted?$q$, $q$Yes, via Docker, either as the free Community Edition or a licensed Enterprise edition at $1,999/year per instance.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$What does the Pro plan cost?$q$, $q$The Pro plan starts at $25/month and removes branding while adding custom domains and more integrations.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Does OpnForm offer discounts for annual billing?$q$, $q$Yes, all paid plans offer a 15% discount when billed yearly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Startup and small business forms$q$, $q$Collect unlimited responses on the free plan without worrying about per-submission costs.$q$, $q$Startups and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Compliance-sensitive data collection$q$, $q$Self-host or use EU-hosted infrastructure with GDPR-compliant handling for sensitive form data.$q$, $q$Teams in the EU or with data-residency requirements$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited forms and submissions","10MB file uploads","Form logic, validation, computed fields","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Pro$q$, $q$$25/month$q$, $q$monthly$q$, $q$["Remove branding","Custom domains","Slack/Discord/Telegram integrations","Password-protected forms","Analytics dashboard"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Business$q$, $q$$67/month$q$, $q$monthly$q$, $q$["Multi-user roles and permissions","Advanced branding","1GB file uploads","Priority support","HubSpot/Salesforce/Airtable integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Enterprise$q$, $q$$220/month$q$, $q$monthly$q$, $q$["SAML/LDAP SSO","Audit logs","White-label hosting","SLA and onboarding support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Self-Hosted Community Edition$q$, $q$Free$q$, NULL, $q$["Open-source, self-hosted deployment"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$Self-Hosted Enterprise License$q$, $q$$1,999/year per instance$q$, $q$annual$q$, $q$["Enterprise features on self-hosted deployment"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$overview$q$, $q$What is OpnForm?$q$, 2, ARRAY[$q$OpnForm is an open-source form builder that lets users create forms, surveys, and workflows with unlimited response collection on its free tier.$q$, $q$It offers drag-and-drop building, conditional logic, computed fields, and integrations with tools like Slack, Google Sheets, and Zapier, and can be self-hosted via Docker in addition to its hosted plans.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', $q$who-its-for$q$, $q$Who OpnForm is for$q$, 2, ARRAY[$q$OpnForm fits teams that want unlimited free form submissions or the option to self-host, ranging from small businesses to larger organizations needing SSO and audit logging on the Enterprise plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('acb31b58-aa23-4c6b-b191-585512bf65f6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Docassemble ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source expert system for building guided interviews that assemble documents, built on Python and YAML.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Docassemble is a free, open-source Python/YAML platform for guided interviews and document assembly, generating PDF, RTF, and DOCX output.$q$,
  og_description = $q$Docassemble is a free, open-source Python/YAML platform for guided interviews and document assembly, generating PDF, RTF, and DOCX output.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c386a7f9-0f7e-468a-84bc-c61cc73cf1a4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c386a7f9-0f7e-468a-84bc-c61cc73cf1a4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Guided interviews$q$, $q$Run web-based, question-and-answer interviews that adapt based on user responses.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Document assembly$q$, $q$Generate downloadable documents in PDF, RTF, or DOCX format from interview answers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$WYSIWYG template editing$q$, $q$Edit .docx and .pdf document templates directly.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$E-signature capture$q$, $q$Capture touchscreen signatures within an interview.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$SMS and email integration$q$, $q$Send and receive messages via SMS and email as part of an interview flow.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$OCR support$q$, $q$Extract text from scanned documents using optical character recognition.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Multilingual interviews$q$, $q$Build interviews that support multiple languages.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$API access$q$, $q$Interact with Docassemble programmatically via its API for application submissions and data storage.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Completely free with no pricing tiers; code is MIT-licensed and docs are CC BY 3.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Highly extensible using Python for custom logic$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Supports document assembly, e-signatures, OCR, and SMS/email in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Built for legal and government use cases but usable as a general-purpose platform$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Active open-source project accepting community contributions on GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Requires programming knowledge (Python, YAML, Markdown) to build interviews$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Requires self-hosting and server setup rather than a simple SaaS sign-up$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Steeper learning curve than simple drag-and-drop form builders$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Is Docassemble free?$q$, $q$Yes, Docassemble is completely free and open source, with code under the MIT license and documentation under CC BY 3.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$What formats can Docassemble generate?$q$, $q$It can generate downloadable documents in PDF, RTF, or DOCX format.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Who created Docassemble?$q$, $q$Docassemble was created by Jonathan Pyle, a lawyer and computer programmer, initially to automate legal practice.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$What languages does Docassemble use?$q$, $q$Docassemble interviews are built using Python, YAML, and Markdown.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Can Docassemble be used outside of legal work?$q$, $q$Yes, although built to automate legal practice, it is designed as a general-purpose guided-interview platform applicable across other fields.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Legal document automation$q$, $q$Build guided interviews that generate legal documents such as pleadings or forms based on user answers.$q$, $q$Law firms and legal aid organizations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$Government application processing$q$, $q$Guide applicants through eligibility questions and generate the resulting application documents.$q$, $q$Government agencies and public-benefits programs$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$overview$q$, $q$What is Docassemble?$q$, 2, ARRAY[$q$Docassemble is a free, open-source expert system for guided interviews and document assembly, built on Python, YAML, and Markdown.$q$, $q$It conducts web-based interviews and generates downloadable documents in PDF, RTF, or DOCX, with additional support for e-signatures, OCR, SMS/email, and API access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', $q$who-its-for$q$, $q$Who Docassemble is for$q$, 2, ARRAY[$q$Docassemble is built for developers, legal aid organizations, and government agencies that need to automate guided interviews and document generation and are comfortable working with Python and YAML.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c386a7f9-0f7e-468a-84bc-c61cc73cf1a4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── GoAccess ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source real-time web log analyzer with a terminal dashboard and browser-based reporting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GoAccess is a free, open-source, MIT-licensed real-time log analyzer with a terminal and web dashboard for Apache, Nginx, and more.$q$,
  og_description = $q$GoAccess is a free, open-source, MIT-licensed real-time log analyzer with a terminal and web dashboard for Apache, Nginx, and more.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a432f190-1b4c-4ed3-8f70-e63c936ac1f0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a432f190-1b4c-4ed3-8f70-e63c936ac1f0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Real-time analysis$q$, $q$Processes logs with millisecond/second updates in a terminal (TUI) or web dashboard, written in C for speed.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Broad log format support$q$, $q$Parses logs from Apache, Nginx, AWS S3, CloudFront, and nearly all major web log formats.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Terminal and web dashboards$q$, $q$View statistics in a terminal interface or a browser-based dashboard with customizable color schemes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Minimal dependencies$q$, $q$Only requires ncurses to run, keeping the install footprint small.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Report exports$q$, $q$Generate HTML, JSON, and CSV reports from parsed log data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Traffic and threat visibility$q$, $q$Helps identify traffic patterns and potential threats like brute-force attempts and bot activity.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Extremely lightweight with minimal dependencies (just ncurses)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Real-time updates in both terminal and web dashboard views$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Runs fully self-hosted/offline without sending data to a third party$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Large open-source community (20,000+ GitHub stars)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$No official managed cloud/SaaS hosting option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Primarily a command-line-first tool, which may not suit non-technical users$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Requires direct access to raw server log files to analyze them$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Is GoAccess free?$q$, $q$Yes, GoAccess is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$What log formats does GoAccess support?$q$, $q$It supports nearly all major web log formats, including Apache, Nginx, AWS S3, and CloudFront.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Can GoAccess run in a browser?$q$, $q$Yes, in addition to its terminal dashboard, GoAccess offers a web-based dashboard.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$What are the system requirements?$q$, $q$GoAccess has minimal dependencies, requiring only ncurses to run.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Server traffic monitoring$q$, $q$Analyze web server access logs in real time to understand traffic patterns.$q$, $q$System administrators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$Security monitoring$q$, $q$Detect suspicious activity such as brute-force attempts and bot traffic from raw log data.$q$, $q$Security and DevOps teams$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$overview$q$, $q$What is GoAccess?$q$, 2, ARRAY[$q$GoAccess is a real-time, open-source web log analyzer that runs as a terminal application or a browser-based dashboard.$q$, $q$Written in C for speed, it parses logs from sources like Apache, Nginx, AWS S3, and CloudFront, and can export HTML, JSON, and CSV reports.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', $q$who-its-for$q$, $q$Who GoAccess is for$q$, 2, ARRAY[$q$GoAccess is built for system administrators and security teams who need fast, self-hosted visibility into web server traffic and log data without relying on a third-party analytics service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a432f190-1b4c-4ed3-8f70-e63c936ac1f0', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Open Web Analytics ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open Web Analytics is a free, open-source, self-hosted PHP web analytics platform with heatmaps, session recording, and e-commerce tracking.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Open Web Analytics (OWA): free, open-source, self-hosted PHP analytics with heatmaps, session recording, and e-commerce tracking. GPL-2.0.$q$,
  og_description = $q$Open Web Analytics (OWA): free, open-source, self-hosted PHP analytics with heatmaps, session recording, and e-commerce tracking. GPL-2.0.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b8ecbeea-8621-4dc5-9c0a-606221d037c3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b8ecbeea-8621-4dc5-9c0a-606221d037c3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Pageview & visitor tracking$q$, $q$Tracks visits, pageviews, and e-commerce transactions on unlimited domains from a single self-hosted instance.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Heatmaps & session recording$q$, $q$Generates click heatmaps and visual session replays (Domstream) to show how visitors interact with pages.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Multi-site management$q$, $q$Monitor and report on multiple websites from one OWA installation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$REST API$q$, $q$Programmatic access to tracking data and administration for custom integrations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Visitor geolocation$q$, $q$Reports visitor location data alongside standard traffic metrics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Extensible module framework$q$, $q$Add custom functionality through OWA's pluggable module system.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Free and open source under GPL-2.0, no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Full data ownership via self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Includes heatmaps and session recording, uncommon in free analytics tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$REST API enables custom reporting and integrations$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Established GitHub project with 2.7k+ stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Requires self-hosting and maintaining a PHP/MySQL server stack$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$No official managed or cloud-hosted version documented$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$UI and documentation are less polished than commercial analytics tools$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Smaller community and support ecosystem than mainstream analytics platforms$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Is Open Web Analytics free?$q$, $q$Yes, OWA is free and open source under the GPL-2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Do I need to self-host OWA?$q$, $q$Yes, OWA is a self-hosted PHP application installed on your own server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Does OWA support heatmaps?$q$, $q$Yes, OWA includes a heatmap and session-recording feature called Domstream.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Can OWA track e-commerce?$q$, $q$Yes, OWA supports tracking e-commerce transactions alongside pageview and visitor data.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Privacy-conscious website analytics$q$, $q$Website owners who want to avoid sending visitor data to third-party analytics services can self-host OWA on their own infrastructure.$q$, $q$Privacy-focused site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Multi-site agencies$q$, $q$Manage analytics for multiple websites from a single OWA instance instead of separate tracking accounts per site.$q$, $q$Agencies and developers managing multiple sites$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["Unlimited websites","Full source code access","Heatmaps and session recording","REST API"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$overview$q$, $q$What is Open Web Analytics?$q$, 2, ARRAY[$q$Open Web Analytics (OWA) is a free, open-source web analytics framework written in PHP, positioned as an alternative to commercial tools like Google Analytics. It is self-hosted, so the data collected on visits, pageviews, and e-commerce transactions stays on the operator's own server.$q$, $q$Beyond standard traffic reporting, OWA includes heatmap and session-recording tooling (Domstream), visitor geolocation, a REST API, and an extensible module framework, letting developers instrument tracking and build custom reports on top of the raw data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', $q$who-its-for$q$, $q$Who Open Web Analytics is for$q$, 2, ARRAY[$q$OWA suits developers and website owners who want full control over their analytics data and are comfortable self-hosting a PHP/MySQL application, particularly those who value heatmaps and session recording without paying for a separate tool.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b8ecbeea-8621-4dc5-9c0a-606221d037c3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Ackee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Ackee is a free, open-source, self-hosted Node.js analytics tool built for privacy, with no cookies and no unique user tracking.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Ackee: self-hosted, open-source Node.js website analytics with a GraphQL API and cookie-free, privacy-first tracking. MIT licensed.$q$,
  og_description = $q$Ackee: self-hosted, open-source Node.js website analytics with a GraphQL API and cookie-free, privacy-first tracking. MIT licensed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd7bd8c7-fe68-48d5-ac4b-748e419b0d16' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Privacy-first tracking$q$, $q$No cookies, no unique visitor identifiers, and a multi-step anonymization process.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$GraphQL API$q$, $q$Fully documented GraphQL API for querying stats and building custom dashboards or integrations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Multi-domain dashboard$q$, $q$Monitor unlimited websites from one Ackee instance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Custom event tracking$q$, $q$Track clicks, form submissions, and other custom interactions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Core traffic metrics$q$, $q$Reports views, referrers, visit duration, and device/OS/browser breakdown.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Flexible deployment$q$, $q$Deploy via Docker, Heroku, Netlify, Vercel, or manual installation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$No cookies or cookie-consent banner required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$GraphQL API enables flexible custom integrations$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Minimal, focused dashboard UI$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Multiple ready-made deployment paths (Docker, Heroku, Netlify, Vercel)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Requires self-hosting Node.js and MongoDB infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$No official managed or cloud-hosted version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Feature set is more basic than full-featured analytics suites$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$No built-in e-commerce or funnel tracking documented$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Is Ackee free to use?$q$, $q$Yes, Ackee is free, open-source software under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Does Ackee use cookies?$q$, $q$No, Ackee is designed to work without cookies and does not uniquely track individual users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$What does Ackee run on?$q$, $q$Ackee is a Node.js application that stores data in MongoDB, deployable via Docker, Heroku, Netlify, or Vercel.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Can I access Ackee's data programmatically?$q$, $q$Yes, Ackee exposes a fully documented GraphQL API.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Privacy-compliant site tracking$q$, $q$Developers who need GDPR-friendly analytics without cookie consent banners.$q$, $q$Privacy-conscious developers and site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Custom analytics dashboards$q$, $q$Teams building bespoke reporting tools on top of Ackee's GraphQL API.$q$, $q$Developers building custom integrations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$Self-Hosted (Open Source)$q$, $q$Free$q$, NULL, $q$["Unlimited domains","GraphQL API","Custom event tracking","Cookie-free tracking"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$overview$q$, $q$What is Ackee?$q$, 2, ARRAY[$q$Ackee is a self-hosted, Node.js-based web analytics tool built around privacy. It runs on a developer's own server with MongoDB for storage, and it avoids cookies and unique user identifiers, instead using a multi-step anonymization process to report aggregate traffic metrics.$q$, $q$The dashboard covers core metrics like views, referrers, visit duration, and device details, and Ackee also supports custom event tracking and a fully documented GraphQL API for teams that want to build their own reporting layer.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', $q$who-its-for$q$, $q$Who Ackee is for$q$, 2, ARRAY[$q$Ackee fits developers and site owners who want a lightweight, privacy-first alternative to mainstream analytics platforms and are willing to self-host a Node.js/MongoDB service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd7bd8c7-fe68-48d5-ac4b-748e419b0d16', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Counter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Counter.dev is a free, open-source, privacy-friendly web analytics service with no cookies, logging, or IP fingerprinting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Counter.dev: simple, open-source web analytics with no cookies, logging, or IP fingerprinting. Pay-what-you-want, AGPL-3.0 licensed.$q$,
  og_description = $q$Counter.dev: simple, open-source web analytics with no cookies, logging, or IP fingerprinting. Pay-what-you-want, AGPL-3.0 licensed.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Cookie-free tracking$q$, $q$No cookies, no logging, and no IP address fingerprinting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Unique visitor counts$q$, $q$Reports unique daily visitor numbers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Referral source tracking$q$, $q$Shows which sites are linking to your pages.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Geographic reporting$q$, $q$Visualizes visitor location data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Simplified dashboard$q$, $q$Single-page dashboard showing only essential traffic metrics.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Open-source codebase$q$, $q$Source published on GitHub under the AGPL-3.0 license.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Free to use, with an optional pay-what-you-want model$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Strong privacy stance: no cookies or IP fingerprinting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Open source under AGPL-3.0$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Very simple, distraction-free dashboard$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Minimal feature set compared to full analytics platforms (no heatmaps, funnels, or custom events documented)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$No documented official self-hosting instructions on the marketing site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$No advanced segmentation documented$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Is Counter.dev free?$q$, $q$Yes, Counter.dev is free to use, with an optional 'pay when ready' payment model rather than a mandatory subscription.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Does Counter.dev use cookies?$q$, $q$No, Counter.dev tracks visitors without cookies, logging, or IP address fingerprinting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Is Counter.dev open source?$q$, $q$Yes, its code is published on GitHub under the AGPL-3.0 license.$q$, 2);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Lightweight analytics for personal sites$q$, $q$Bloggers and small site owners who want basic traffic numbers without complex setup.$q$, $q$Bloggers and independent site owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Privacy-first analytics$q$, $q$Teams that want to avoid cookie consent banners while still tracking visits and referrers.$q$, $q$Privacy-conscious developers$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$Pay What You Want$q$, $q$Free (optional payment)$q$, NULL, $q$["Unique visitor counts","Referrer tracking","Geographic reports","No cookies or logging"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$overview$q$, $q$What is Counter?$q$, 2, ARRAY[$q$Counter (counter.dev) is a free, open-source web analytics service built around simplicity and privacy. It reports unique daily visitors, referral sources, and visitor geography without using cookies, server logging, or IP address fingerprinting.$q$, $q$The service uses a 'pay when ready' model: it can be used for free indefinitely, with payment left as an optional, user-initiated choice rather than a required subscription. Its source code is published on GitHub under the AGPL-3.0 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', $q$who-its-for$q$, $q$Who Counter is for$q$, 2, ARRAY[$q$Counter fits bloggers, indie developers, and small site owners who want a no-fuss traffic dashboard and prefer a privacy-respecting alternative to cookie-based analytics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ef53c4a7-0fd5-4507-9b35-ef5053bbcf0e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Flagsmith ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Flagsmith is an open-source feature flag and remote config platform for web, mobile, and server apps, deployable in the cloud or self-hosted.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$40/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Flagsmith: open-source feature flags, remote config, and A/B testing with 13+ SDKs. Free plan available; paid plans start at $40/month.$q$,
  og_description = $q$Flagsmith: open-source feature flags, remote config, and A/B testing with 13+ SDKs. Free plan available; paid plans start at $40/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '019204fd-182f-40f5-9827-49ed1e395308';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '019204fd-182f-40f5-9827-49ed1e395308' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Feature flags$q$, $q$Toggle features across web, mobile, and server-side applications with 13+ official SDKs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Remote configuration$q$, $q$Change application behavior in real time without redeploying code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Segmentation & targeting$q$, $q$Target rollouts by environment, user traits/segments, or percentage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$A/B & multivariate testing$q$, $q$Run percentage-split experiments and variations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Change tracking$q$, $q$Audit logs and rollback capabilities for flag changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Flexible deployment$q$, $q$SaaS cloud across 8 regions, private cloud, or self-hosted via Docker, Kubernetes (Helm), or OpenShift.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Open-source core (BSD-3-Clause) with 6.5k+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Free plan covers unlimited flags, environments, and segments up to 50,000 requests/month$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Deployment flexibility: cloud, private cloud, or fully self-hosted$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$13+ official SDKs across major languages and frameworks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$SOC 2 compliant with enterprise features (SSO, RBAC, audit logs) on higher tiers$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Free plan is limited to 1 team member and 50,000 requests/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Advanced governance (SSO, roles, audit logs) requires the Scale-Up tier or above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Enterprise pricing is quote-based, not published$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Self-hosting requires managing your own Docker/Kubernetes infrastructure$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Is Flagsmith open source?$q$, $q$Yes, Flagsmith's core platform is open source under the BSD-3-Clause license and available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Can I self-host Flagsmith?$q$, $q$Yes, Flagsmith supports self-hosted deployment via Docker, Kubernetes (Helm), or OpenShift, in addition to managed cloud and private cloud options.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Does Flagsmith have a free plan?$q$, $q$Yes, the Free plan includes unlimited feature flags, environments, and segments for 1 team member with up to 50,000 API requests per month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$What languages does Flagsmith support?$q$, $q$Flagsmith offers 13+ SDKs, including REST, React, Next.js, Node, Android/Kotlin, iOS, Flutter, Python, Ruby, .NET, PHP, Go, and Rust.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Gradual feature rollouts$q$, $q$Engineering teams that want to release features to a percentage of users and roll back instantly if issues arise.$q$, $q$Product and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Self-hosted flag management$q$, $q$Organizations with data residency or compliance requirements that need to run feature flags on their own infrastructure.$q$, $q$Enterprises in regulated industries$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$A/B testing$q$, $q$Teams running percentage-split experiments to validate feature changes before full rollout.$q$, $q$Product managers and growth teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 50,000 requests/month","1 team member","Unlimited feature flags, environments, and segments","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Start-Up$q$, $q$$40/month (annual) or $45/month (monthly)$q$, $q$monthly$q$, $q$["Up to 1,000,000 requests/month","3 team members","Unlimited projects","A/B and multivariate testing","Scheduled flags","2FA"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Scale-Up$q$, $q$$250/month (annual) or $300/month (monthly)$q$, $q$monthly$q$, $q$["5,000,000+ requests/month","5 team members included (up to 20 at $50/member/month)","SAML/SSO","Roles, permissions, change requests, audit logs","Priority support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Cloud, private cloud, or self-hosted deployment","Custom hosting solutions","Real-time support","SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$overview$q$, $q$What is Flagsmith?$q$, 2, ARRAY[$q$Flagsmith is an open-source feature flag and remote configuration platform that lets engineering teams control feature releases, run A/B and multivariate tests, and change application behavior without redeploying code, across web, mobile, and server-side apps.$q$, $q$The platform can be used as a managed SaaS across 8 cloud regions, as a private cloud instance, or fully self-hosted via Docker, Kubernetes, or OpenShift. Its core is open source under the BSD-3-Clause license, with paid tiers adding higher usage limits, SSO, and governance controls.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', $q$who-its-for$q$, $q$Who Flagsmith is for$q$, 2, ARRAY[$q$Flagsmith suits engineering and product teams that want feature flag infrastructure with deployment flexibility, from small teams on the free plan to regulated enterprises that need self-hosted or private-cloud deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('019204fd-182f-40f5-9827-49ed1e395308', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Unleash ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Unleash is an open-source feature management platform for gradual rollouts, kill switches, and A/B testing, self-hosted or via managed cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$75/seat/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Unleash: open-source feature flags with gradual rollouts, kill switches, and 15+ SDKs. Free self-hosted edition; paid plans from $75/seat/month.$q$,
  og_description = $q$Unleash: open-source feature flags with gradual rollouts, kill switches, and 15+ SDKs. Free self-hosted edition; paid plans from $75/seat/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7796a03d-4b99-4591-a6d0-97a6d4b4c39b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7796a03d-4b99-4591-a6d0-97a6d4b4c39b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Runtime flag evaluation$q$, $q$Evaluates flags locally at runtime with no added network latency.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Gradual rollouts$q$, $q$Canary releases and progressive delivery to subsets of users.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Kill switches$q$, $q$Instantly disable features during incidents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$A/B testing$q$, $q$Built-in experimentation support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Governance controls$q$, $q$Role-based access control, audit logs, and change request workflows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Broad SDK support$q$, $q$15+ official SDKs, including Node.js, Java, Go, Python, .NET, Ruby, PHP, Rust, React, and Vue.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Open source under AGPL-3.0-or-later with 13.7k+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Free, self-hosted open-source edition available via Docker$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$SOC 2 Type II certified and GDPR compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$SSO support (SAML 2.0, OpenID Connect, Okta, Azure AD) on paid tiers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Large SDK ecosystem covering 15+ languages and frameworks$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Paid Pay-as-you-go tier starts at $75/seat/month with a 5-seat minimum for self-hosted deployments$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Enterprise pricing is custom/quote-based$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Advanced governance and compliance features require a paid plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Self-hosted open-source edition requires managing your own infrastructure$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Is Unleash open source?$q$, $q$Yes, Unleash's core is open source under the AGPL-3.0-or-later license and available on GitHub with 13.7k+ stars.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Can I self-host Unleash for free?$q$, $q$Yes, the open-source edition can be self-hosted for free via Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$What does the paid plan cost?$q$, $q$Unleash's Pay-as-you-go plan starts at $75/seat/month, with a 14-day free trial and no credit card required to start.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Does Unleash support SSO?$q$, $q$Yes, SAML 2.0, OpenID Connect, Okta, and Azure AD SSO are supported on paid and enterprise plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Enterprise progressive delivery$q$, $q$Large organizations rolling out features gradually with instant rollback and kill switches for incident response.$q$, $q$Enterprise engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Free self-hosted flag management$q$, $q$Teams that want full control over feature flag infrastructure without per-seat costs.$q$, $q$Cost-conscious engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted via Docker","Core feature flag functionality","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Pay-as-you-go$q$, $q$$75/seat/month$q$, $q$monthly$q$, $q$["14-day free trial","Cloud or self-hosted","5-seat minimum for self-hosted"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Cloud, self-hosted, or hybrid deployment","Guided onboarding","Annual contract","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$overview$q$, $q$What is Unleash?$q$, 2, ARRAY[$q$Unleash is an open-source feature management platform that lets teams decouple deployments from releases using feature flags. It supports gradual rollouts, canary releases, A/B testing, and kill switches for rapid incident response, evaluating flags at runtime with no added latency.$q$, $q$The open-source edition is free and self-hostable via Docker, while paid Pay-as-you-go and Enterprise tiers add SSO, RBAC, audit logs, and managed cloud or hybrid deployment options with SOC 2 Type II and GDPR compliance.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', $q$who-its-for$q$, $q$Who Unleash is for$q$, 2, ARRAY[$q$Unleash fits engineering teams ranging from cost-conscious teams self-hosting the free open-source edition to larger enterprises that need SSO, compliance certifications, and dedicated support on paid plans.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7796a03d-4b99-4591-a6d0-97a6d4b4c39b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Flipt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Flipt is a Git-native, self-hosted feature flag platform where flag changes become reviewable Git commits, deployable as a single binary.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$200/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Flipt: Git-native feature flags with single-binary self-hosted deployment. Free open-source tier; Pro plan starts at $200/month.$q$,
  og_description = $q$Flipt: Git-native feature flags with single-binary self-hosted deployment. Free open-source tier; Pro plan starts at $200/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6732bbc4-c8d6-442d-91b0-c2d8939b74bb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6732bbc4-c8d6-442d-91b0-c2d8939b74bb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Git-native flag storage$q$, $q$UI changes to flags generate reviewable Git commits with full version history.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Real-time streaming updates$q$, $q$Server-Sent Events (SSE) propagate flag changes instantly without polling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Multi-environment support$q$, $q$Isolated environments per branch, directory, or repository.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Single-binary deployment$q$, $q$Runs as one binary with zero required external dependencies by default.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Broad SDK support$q$, $q$SDKs for Go, Python, JavaScript, Java, C#, Swift, Kotlin, Dart, and more.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$DevOps integrations$q$, $q$Native support for GitHub, GitLab, BitBucket, and Azure DevOps workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Free, self-hosted open-source tier with unlimited flags$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Zero-dependency single-binary deployment simplifies self-hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Git-native workflow gives a full audit history via commits$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Real-time flag propagation via SSE streaming$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$4.9k+ GitHub stars$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Server code is licensed under the Fair Core License (source-available), not a fully permissive OSI license$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Pro plan pricing ($200/month) is fixed rather than usage-scaled$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Secrets management via Vault or cloud providers requires the Pro tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Smaller ecosystem/community than more established feature-flag tools$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Is Flipt free?$q$, $q$Yes, Flipt's open-source tier is free forever and includes unlimited flags and Git-native workflows.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$What license does Flipt use?$q$, $q$Flipt's client SDKs are MIT licensed, while the server code uses the Fair Core License (source-available, converting to MIT after a future date).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Can I self-host Flipt?$q$, $q$Yes, Flipt is designed to be self-hosted as a single binary with no required external dependencies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$What does Flipt Pro cost?$q$, $q$Flipt Pro is $200/month and adds PR creation, secrets management, and dedicated support.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Git-based flag governance$q$, $q$Engineering teams that want feature flag changes reviewed the same way as code, via pull requests.$q$, $q$Engineering teams using Git workflows$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Lightweight self-hosted flags$q$, $q$Teams that want a zero-dependency, single-binary feature flag server they fully control.$q$, $q$DevOps and platform teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Unlimited flags","Git-native workflows","Real-time updates","Self-hosted single binary"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Pro$q$, $q$$200/month$q$, $q$monthly$q$, $q$["PR creation","Secrets management","Dedicated support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["RBAC","Audit logging","Dedicated support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$overview$q$, $q$What is Flipt?$q$, 2, ARRAY[$q$Flipt is a feature flag management platform built around Git as the source of truth: changes made in its UI are converted into reviewable Git commits, giving teams a full audit trail and code-review-style workflow for flag changes.$q$, $q$It's designed for self-hosting as a single binary with no required external dependencies, and propagates flag changes in real time via Server-Sent Events. The open-source tier is free forever, while Pro and Enterprise tiers add secrets management, RBAC, and dedicated support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', $q$who-its-for$q$, $q$Who Flipt is for$q$, 2, ARRAY[$q$Flipt suits engineering teams already working in Git who want feature flag changes to go through the same review process as code, and who prefer a lightweight, self-hosted binary over a heavier vendor platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6732bbc4-c8d6-442d-91b0-c2d8939b74bb', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── FeatBit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$FeatBit is an open-source feature flag and experimentation platform that self-hosts via Docker Compose, Kubernetes, or AWS.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$FeatBit: open-source feature flags with A/B testing, an MCP server for AI coding agents, and self-hosting via Docker or Kubernetes.$q$,
  og_description = $q$FeatBit: open-source feature flags with A/B testing, an MCP server for AI coding agents, and self-hosting via Docker or Kubernetes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '94397512-e81a-4da3-8e0a-9e8fa8ba4e79';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '94397512-e81a-4da3-8e0a-9e8fa8ba4e79' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Feature flag lifecycle management$q$, $q$CLI-first workflow for creating, filtering, and organizing flags.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$A/B testing$q$, $q$Built-in experimentation for data-driven release decisions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Self-hosted deployment$q$, $q$Deploy via Docker Compose, Kubernetes, or AWS using Terraform.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$MCP server$q$, $q$FeatBit MCP server integrates feature flag workflows with AI coding agents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Multi-language SDKs$q$, $q$Server and client SDKs for .NET, JavaScript, React, Node.js, Java, Python, and Go.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Audit logging & integrations$q$, $q$Tracks flag and segment changes, with Slack, Datadog, and Grafana integrations.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Open source under the MIT license with 1.9k+ GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Full self-hosting options (Docker Compose, Kubernetes, AWS)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$MCP server support for AI coding agent workflows$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Multi-language SDK coverage$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Multi-project and multi-environment management$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Smaller GitHub star count and community than more established competitors like Unleash or Flagsmith$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$A commercial 'Professional version' exists but its pricing is not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$No documented managed cloud offering with published pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Is FeatBit open source?$q$, $q$Yes, FeatBit is open source under the MIT license and available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Can I self-host FeatBit?$q$, $q$Yes, FeatBit supports self-hosting via Docker Compose, Kubernetes, or AWS using Terraform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Does FeatBit support AI tooling?$q$, $q$Yes, FeatBit offers an MCP server and Copilot-style skills for AI coding agent workflows.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Is FeatBit free?$q$, $q$The open-source, self-hosted version is free; a separate commercial Professional version is also offered.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Self-hosted flags with data ownership$q$, $q$Teams that want to own their infrastructure and control feature-flag data and costs.$q$, $q$Engineering teams needing full data ownership$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$AI-assisted flag management$q$, $q$Developers using AI coding agents that need MCP-based access to feature flag workflows.$q$, $q$Developers using AI coding assistants$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$Open Source (Self-Hosted)$q$, $q$Free$q$, NULL, $q$["Feature flag management","A/B testing","Self-hosted via Docker/Kubernetes/AWS","MCP server"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$overview$q$, $q$What is FeatBit?$q$, 2, ARRAY[$q$FeatBit is an open-source feature flag management platform that supports flag lifecycle management, user targeting, and A/B testing, with a CLI-first workflow and a growing set of AI-oriented tools including an MCP server for AI coding agents.$q$, $q$It is designed for self-hosting, with deployment options covering Docker Compose, Kubernetes, and AWS via Terraform, and SDKs across .NET, JavaScript, React, Node.js, Java, Python, and Go.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', $q$who-its-for$q$, $q$Who FeatBit is for$q$, 2, ARRAY[$q$FeatBit fits engineering teams that want to self-host feature flag infrastructure for data ownership and cost control, including teams experimenting with AI coding agents via its MCP server.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('94397512-e81a-4da3-8e0a-9e8fa8ba4e79', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── ConfigCat ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ConfigCat is a hosted feature flag service with a forever-free plan and 30+ open-source, MIT-licensed SDKs.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$110/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ConfigCat: feature flags and remote config with a forever-free plan and 30+ open-source SDKs. Paid plans start at $110/month.$q$,
  og_description = $q$ConfigCat: feature flags and remote config with a forever-free plan and 30+ open-source SDKs. Paid plans start at $110/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cce6651b-abc7-4428-9917-f07ac8142bf2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cce6651b-abc7-4428-9917-f07ac8142bf2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Feature toggles$q$, $q$Turn features on/off after deployment without redeploying code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$User segmentation$q$, $q$Target users by region, email, subscription, or custom attributes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Rollout strategies$q$, $q$Percentage rollouts, A/B testing, and multivariate variations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Configuration values$q$, $q$Store strings, numbers, and text variables alongside boolean flags.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Audit & compliance$q$, $q$Mandatory notes, audit logs, and compliance tracking.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Broad SDK support$q$, $q$30+ open-source SDKs, including JavaScript, React, Python, Java, Go, iOS, and Android.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Third-party integrations$q$, $q$Connects with Slack, GitHub Actions, Jira, Datadog, Segment, and Amplitude.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Forever-free plan with unlimited seats and no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Free plan includes security features like SSO, 2FA, and SAML$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$30+ MIT-licensed open-source SDKs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Wide integration ecosystem$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Used by large organizations including Nasdaq, Rakuten, and Heineken$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Core platform is closed-source/hosted; only client SDKs are open source$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Paid plans range from $110 to $4,500+/month depending on scale$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$No published self-hosted deployment option for the core platform$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Higher-tier pricing (Smart, Enterprise, Dedicated) requires a larger budget$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Does ConfigCat have a free plan?$q$, $q$Yes, ConfigCat offers a 'Forever Free' plan with unlimited seats and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Are ConfigCat's SDKs open source?$q$, $q$Yes, ConfigCat provides 30+ MIT-licensed open-source SDKs across web, mobile, desktop, and backend platforms.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$How much does ConfigCat cost?$q$, $q$Paid plans start at $110/month (Pro), with Smart at $325/month, Enterprise at $900/month, and Dedicated from $4,500+/month.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Can I self-host ConfigCat?$q$, $q$No self-hosted deployment option for the core platform is documented; ConfigCat is a hosted service.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Budget-friendly feature flags$q$, $q$Startups and small teams that need feature flags without cost via the forever-free plan.$q$, $q$Startups and small development teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Enterprise-grade release management$q$, $q$Larger organizations needing audit logs, SSO, and compliance tracking for regulated releases.$q$, $q$Enterprise development teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Forever Free$q$, $q$$0$q$, NULL, $q$["Unlimited seats","No credit card required","SSO, 2FA, SAML included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Pro$q$, $q$$110/month$q$, $q$monthly$q$, $q$["Higher usage limits","Additional features over the Free plan"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Smart$q$, $q$$325/month$q$, $q$monthly$q$, $q$["Higher usage limits"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Enterprise$q$, $q$$900/month$q$, $q$monthly$q$, $q$["Enterprise-grade features"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$Dedicated$q$, $q$$4,500+/month$q$, $q$monthly$q$, $q$["Dedicated infrastructure"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$overview$q$, $q$What is ConfigCat?$q$, 2, ARRAY[$q$ConfigCat is a hosted feature flag and remote configuration service that lets teams turn features on or off, target users, and run rollouts without redeploying applications. It provides 30+ open-source, MIT-licensed SDKs across web, mobile, desktop, and backend platforms.$q$, $q$The service offers a permanently free tier with unlimited seats and no credit card required, and paid plans that add higher usage limits and enterprise features, priced from $110/month up to $4,500+/month for dedicated infrastructure.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', $q$who-its-for$q$, $q$Who ConfigCat is for$q$, 2, ARRAY[$q$ConfigCat suits development teams of any size that want a hosted feature flag service with a genuinely free starting tier, from small startups to larger organizations needing audit logs and compliance tracking.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce6651b-abc7-4428-9917-f07ac8142bf2', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── DevCycle ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$DevCycle is an OpenFeature-native feature flag platform with a free tier, usage-based pricing, and AI/MCP tooling, now part of Dynatrace.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$500/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DevCycle: OpenFeature-native feature flags with usage-based pricing, a free tier, and AI/MCP tooling. Business plan starts at $500/month.$q$,
  og_description = $q$DevCycle: OpenFeature-native feature flags with usage-based pricing, a free tier, and AI/MCP tooling. Business plan starts at $500/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4697278a-138a-4bf7-873d-8d71a39b66c4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4697278a-138a-4bf7-873d-8d71a39b66c4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$OpenFeature-native SDKs$q$, $q$Open-source SDKs across 15+ platforms with no vendor lock-in.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Real-time flag updates$q$, $q$Flag changes take effect without restarting applications.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Gradual rollouts$q$, $q$Incrementally release features to user subsets with rollback capability.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$A/B testing$q$, $q$Data-driven experimentation before full release.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Roles & permissions$q$, $q$Granular role-based access control.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$AI-generated feature summaries & MCP server$q$, $q$Natural-language tools for managing feature flags via AI coding agents.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Free plan with no credit card required, up to 1,000 client-side MAUs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Usage-based pricing with no per-seat charges; unlimited seats on all plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$OpenFeature-native with open-source SDKs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$AI/MCP tooling for feature flag management$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Backed by Dynatrace following its acquisition$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Business plan starts at $500/month annual (or $625/month monthly)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Overage charges apply beyond included MAU/request allowances$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Now owned by Dynatrace, which could affect independent product direction$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Enterprise pricing is custom/quote-based$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Does DevCycle have a free plan?$q$, $q$Yes, DevCycle offers a free plan with up to 1,000 client-side MAUs and no credit card required, plus a no-signup playground.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$What does DevCycle's Business plan cost?$q$, $q$The Business plan is $500/month billed annually (or $625/month billed monthly), including 100,000 MAUs and 1,000,000 cloud config requests/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Is DevCycle OpenFeature-native?$q$, $q$Yes, DevCycle describes itself as the first OpenFeature-native feature management platform, with open-source SDKs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Who owns DevCycle?$q$, $q$DevCycle is now part of Dynatrace, following an acquisition.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Usage-based flag management$q$, $q$Teams that want unlimited seats and pay based on usage rather than per-user licensing.$q$, $q$Growing engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$AI-assisted feature flag workflows$q$, $q$Developers using natural-language/MCP tools to manage flags from AI coding agents.$q$, $q$Developers using AI coding assistants$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Free$q$, $q$$0$q$, $q$monthly$q$, $q$["Up to 1,000 client-side MAUs","Unlimited seats","Unlimited flags","All integrations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Business$q$, $q$$500/month (annual) or $625/month (monthly)$q$, $q$monthly$q$, $q$["100,000 MAUs","1,000,000 cloud config requests/month","10,000,000 server config requests/month","AI-generated feature summaries","Audit logging"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Approval workflows","Full RBAC","Custom SSO/SAML","SCIM provisioning","Uptime SLA"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$overview$q$, $q$What is DevCycle?$q$, 2, ARRAY[$q$DevCycle is a feature flag management platform built on the OpenFeature standard, letting teams deploy code behind feature flags, run gradual rollouts and A/B tests, and manage releases across web, backend, and mobile with 15+ SDKs and no vendor lock-in.$q$, $q$Pricing is usage-based rather than seat-based, with a free tier covering up to 1,000 client-side MAUs and a Business plan starting at $500/month for larger usage allowances. DevCycle is now part of Dynatrace following its acquisition, while continuing to operate under the DevCycle name.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', $q$who-its-for$q$, $q$Who DevCycle is for$q$, 2, ARRAY[$q$DevCycle suits engineering teams that want OpenFeature-compliant, vendor-neutral feature flag tooling with usage-based pricing rather than per-seat licensing, including teams experimenting with AI-assisted flag management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4697278a-138a-4bf7-873d-8d71a39b66c4', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── MariaDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MariaDB Server is a free, open-source relational database, created by MySQL's original developers as a drop-in MySQL replacement.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2009,
  company_size = NULL,
  headquarters = $q$Delaware, USA$q$,
  languages = '{}',
  seo_meta_description = $q$MariaDB Server: free, open-source GPLv2 relational database and drop-in MySQL replacement, used by Wikipedia, WordPress.com, and Google.$q$,
  og_description = $q$MariaDB Server: free, open-source GPLv2 relational database and drop-in MySQL replacement, used by Wikipedia, WordPress.com, and Google.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b06d1d19-b0b8-4c54-894b-14a56a483e6c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Galera Cluster 4$q$, $q$Synchronous multi-master clustering for high availability.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Oracle Database compatibility$q$, $q$Compatibility features that ease migration from Oracle Database.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Temporal tables$q$, $q$System-versioned tables for querying historical data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Pluggable storage engines$q$, $q$Extensible storage-engine architecture.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Rich data types$q$, $q$Support for JSON, BLOB, TEXT, and GEOMETRY data types.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Online schema change$q$, $q$Modify schema without locking tables.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Free and open source under GPLv2, guaranteed to remain so by the MariaDB Foundation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Drop-in replacement for MySQL, easing migration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Default database in most major Linux distributions and available on most cloud platforms$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Used in production by Wikipedia, WordPress.com, and Google$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Commercial enterprise support and hardened builds available via MariaDB Corporation for organizations that need them$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Enterprise features (Enterprise Server, Enterprise Cluster, MaxScale) require a separate commercial contract with MariaDB Corporation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Some newer MySQL features and compatibility can lag or diverge over time$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Self-managed deployment requires in-house database administration expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Is MariaDB free?$q$, $q$Yes, MariaDB Server is free and open source under the GPLv2 license, maintained by the non-profit MariaDB Foundation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Is MariaDB compatible with MySQL?$q$, $q$Yes, MariaDB was created as a drop-in replacement for MySQL by MySQL's original developers, including Monty Widenius.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$When was MariaDB created?$q$, $q$MariaDB Server was created in 2009, after Sun Microsystems acquired MySQL AB.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Is there a paid version of MariaDB?$q$, $q$The core MariaDB Server is free; MariaDB Corporation separately offers commercial Enterprise Server, clustering, and support contracts.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Open-source MySQL replacement$q$, $q$Organizations migrating off MySQL who want a compatible, community-governed, open-source database.$q$, $q$Backend engineering and DBA teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$High-availability clustering$q$, $q$Teams needing synchronous multi-master replication via Galera Cluster for high availability.$q$, $q$Infrastructure and platform teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Community Server$q$, $q$Free$q$, NULL, $q$["Full relational database engine","Galera Cluster","GPLv2 licensed","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$Enterprise Server (MariaDB Corporation)$q$, $q$Custom$q$, NULL, $q$["Enterprise-hardened builds","Enterprise Cluster and MaxScale proxy","Commercial support contracts"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$overview$q$, $q$What is MariaDB?$q$, 2, ARRAY[$q$MariaDB Server is a free, open-source relational database management system created in 2009 by the original developers of MySQL, following Sun Microsystems' acquisition of MySQL AB. It is designed as a drop-in replacement for MySQL and is licensed under GPLv2.$q$, $q$The database is maintained by the non-profit MariaDB Foundation, which is incorporated in Delaware, USA, and it is the default database in most major Linux distributions and widely available on cloud platforms. Notable users include Wikipedia, WordPress.com, and Google. A separate commercial entity, MariaDB Corporation, offers enterprise-hardened builds, clustering tools, and paid support contracts on top of the free open-source core.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', $q$who-its-for$q$, $q$Who MariaDB is for$q$, 2, ARRAY[$q$MariaDB fits organizations that want a free, open-source, MySQL-compatible relational database with strong community governance, from individual developers self-hosting a single instance to enterprises running Galera Cluster for high availability.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b06d1d19-b0b8-4c54-894b-14a56a483e6c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── ScyllaDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A distributed NoSQL database built for high-throughput, low-latency, data-intensive applications.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ScyllaDB is an open-source, DynamoDB-compatible NoSQL database for high-throughput, low-latency workloads at massive scale.$q$,
  og_description = $q$ScyllaDB is an open-source, DynamoDB-compatible NoSQL database for high-throughput, low-latency workloads at massive scale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '19274a99-a56f-41a7-8809-d973ed36645b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '19274a99-a56f-41a7-8809-d973ed36645b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Shard-per-core architecture$q$, $q$Designed for high throughput with predictable single-digit millisecond latencies at large scale.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$DynamoDB-compatible API$q$, $q$ScyllaDB Alternator exposes a DynamoDB-compatible API so DynamoDB workloads can run against ScyllaDB.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Vector search$q$, $q$Native vector search capability aimed at retrieval-augmented generation, agentic, and semantic search use cases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Kubernetes operator$q$, $q$The ScyllaDB Operator supports deploying and managing ScyllaDB clusters on Kubernetes.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Feature store support$q$, $q$Optimized for machine learning feature stores that require scale and low latency.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Open-source core available for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$DynamoDB-compatible API eases migration from DynamoDB$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Built for high throughput and predictable low latency at billion-row scale$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Offers both a fully managed cloud service and a self-managed Enterprise edition$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$ScyllaDB Cloud and Enterprise pricing is quote-only and not published$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Distributed NoSQL operations require specialized expertise to run well$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Advanced HA/DR and security features are reserved for higher-tier paid plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Is ScyllaDB open source?$q$, $q$ScyllaDB has an open-source component available on GitHub, alongside a self-managed Enterprise edition and a fully managed ScyllaDB Cloud service.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Can ScyllaDB replace DynamoDB?$q$, $q$ScyllaDB Alternator provides a DynamoDB-compatible API, allowing applications built for DynamoDB to run against ScyllaDB.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Does ScyllaDB support Kubernetes?$q$, $q$Yes, the ScyllaDB Operator is available for deploying and managing ScyllaDB clusters on Kubernetes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Is there a free trial for ScyllaDB Cloud?$q$, $q$ScyllaDB offers a 30-day developer trial and a 48-hour production evaluation for ScyllaDB Cloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Real-time AI and ML inference$q$, $q$Serving feature stores and low-latency lookups for machine learning inference pipelines.$q$, $q$ML engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$High-throughput event-driven apps$q$, $q$Backing applications that need millions of operations per second with predictable latency.$q$, $q$Backend and infrastructure engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$DynamoDB migration$q$, $q$Moving DynamoDB-based workloads to a self-hosted or multi-cloud database via the Alternator API.$q$, $q$Teams reducing DynamoDB lock-in or cost$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted ScyllaDB core"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$ScyllaDB Cloud - Standard$q$, $q$Quote-based$q$, NULL, $q$["Fully managed on AWS & GCP","99.9% uptime SLA","8x5 P1 support response"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$ScyllaDB Cloud - Professional$q$, $q$Quote-based$q$, NULL, $q$["Multi-region active-active HA/DR","24x7 P1 support response"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$ScyllaDB Cloud - Premium$q$, $q$Quote-based$q$, NULL, $q$["Custom security and networking","15-minute 24x7 P1 support response"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$ScyllaDB Enterprise$q$, $q$Quote-based$q$, NULL, $q$["Self-managed deployment on-prem, VM, or Kubernetes"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$overview$q$, $q$What is ScyllaDB?$q$, 2, ARRAY[$q$ScyllaDB is a distributed NoSQL database built for data-intensive applications that need high throughput and predictable low latency, with an open-source core plus self-managed Enterprise and fully managed Cloud editions.$q$, $q$It offers a DynamoDB-compatible API (Alternator), a Kubernetes operator, and native vector search aimed at retrieval-augmented generation and other AI workloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', $q$who-its-for$q$, $q$Who ScyllaDB is for$q$, 2, ARRAY[$q$ScyllaDB fits teams running large-scale, latency-sensitive workloads such as real-time personalization, event-driven systems, and ML feature stores, and organizations looking to migrate off DynamoDB while keeping the same API shape.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('19274a99-a56f-41a7-8809-d973ed36645b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── ClickHouse ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, column-oriented SQL database built for fast analytical (OLAP) queries at scale.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ClickHouse is an open-source, column-oriented database for real-time analytics, offering both self-managed and ClickHouse Cloud deployment.$q$,
  og_description = $q$ClickHouse is an open-source, column-oriented database for real-time analytics, offering both self-managed and ClickHouse Cloud deployment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd1cc98c8-156a-4960-9e1b-8d537e303a0e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd1cc98c8-156a-4960-9e1b-8d537e303a0e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Column-oriented storage$q$, $q$Stores data by column rather than row, accelerating analytical queries over large datasets.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$High compression$q$, $q$Column-oriented storage enables strong compression ratios that reduce storage footprint and speed up queries.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Standard SQL$q$, $q$Queries are written in SQL, making it accessible to teams already familiar with relational databases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$100+ integrations$q$, $q$Connects to BI tools, data visualization platforms, and language clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$ClickHouse Local$q$, $q$A local mode for querying files directly without running a server.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Free, fully open-source self-managed option$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Delivers fast query performance on large datasets via columnar storage$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Wide ecosystem of integrations with BI and observability tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Managed ClickHouse Cloud option removes operational overhead$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Used in production by large organizations including Meta, Spotify, and Lyft$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$ClickHouse Cloud pricing is not published on the pricing page and requires contacting sales for specifics$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Column-oriented design is optimized for analytics, not transactional (OLTP) workloads$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Self-managed deployments require infrastructure and operations expertise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Is ClickHouse free to use?$q$, $q$Yes, the self-managed, open-source version of ClickHouse is free to download and run; costs depend only on the infrastructure you run it on.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Does ClickHouse offer a managed cloud service?$q$, $q$Yes, ClickHouse Cloud is a paid managed service available on AWS, GCP, and Azure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$What is ClickHouse best suited for?$q$, $q$ClickHouse is designed for real-time analytics, dashboards, observability data, and data warehousing rather than transactional workloads.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Can I query files without a ClickHouse server?$q$, $q$Yes, ClickHouse Local lets you query files directly using ClickHouse's SQL engine without deploying a server.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Real-time analytics dashboards$q$, $q$Powering dashboards that need fast aggregate queries over large, continuously updated datasets.$q$, $q$Data and analytics engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Observability data storage$q$, $q$Storing and querying high-volume logs, metrics, and traces.$q$, $q$Platform and SRE teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Data warehousing$q$, $q$Serving as a SQL-based analytical warehouse for reporting and BI tools.$q$, $q$Data teams and analysts$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$Self-Managed$q$, $q$Free$q$, NULL, $q$["Open-source ClickHouse server","Run on your own infrastructure"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$ClickHouse Cloud$q$, $q$Contact sales$q$, NULL, $q$["Fully managed on AWS, GCP, or Azure","Automatic compute autoscaling","Separate storage and compute billing"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$overview$q$, $q$What is ClickHouse?$q$, 2, ARRAY[$q$ClickHouse is a fast, open-source, column-oriented SQL database management system designed for online analytical processing (OLAP), enabling real-time queries over petabyte-scale datasets.$q$, $q$It can be self-managed for free or run as ClickHouse Cloud, a fully managed service on AWS, GCP, and Azure with automatic compute autoscaling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', $q$who-its-for$q$, $q$Who ClickHouse is for$q$, 2, ARRAY[$q$ClickHouse suits data and platform teams building real-time analytics, observability pipelines, or SQL-based data warehouses that need to query very large datasets quickly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d1cc98c8-156a-4960-9e1b-8d537e303a0e', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── DuckDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An in-process, open-source SQL OLAP database engine for fast analytics on local files and cloud storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DuckDB is a free, MIT-licensed, in-process SQL OLAP database for querying Parquet, CSV, JSON, and cloud storage directly.$q$,
  og_description = $q$DuckDB is a free, MIT-licensed, in-process SQL OLAP database for querying Parquet, CSV, JSON, and cloud storage directly.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '80cb4f6d-eff0-4feb-abf9-70df2946bcfe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '80cb4f6d-eff0-4feb-abf9-70df2946bcfe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$In-process execution$q$, $q$Runs embedded inside an application with no separate server process required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Multi-format querying$q$, $q$Queries Parquet, CSV, and JSON files, as well as cloud storage such as S3, Azure, and GCP, directly with SQL.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Columnar storage engine$q$, $q$Uses columnar storage with disk-spilling to handle datasets larger than available memory.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Extension architecture$q$, $q$Supports extensions that add custom functionality beyond the core engine.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$WebAssembly support$q$, $q$Can run inside web browsers via WebAssembly for client-side analytics.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$MIT-licensed and completely free with no licensing costs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$No server setup required — runs embedded in-process$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Native client libraries for Python, Go, Rust, JavaScript, Java, C, C++, and R$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Can query remote and cloud-stored files without moving data first$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Runs on Linux, macOS, Windows, and in the browser via WebAssembly$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$In-process design means it is not built as a multi-user networked database server by default$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Best suited to analytical (OLAP) queries rather than high-concurrency transactional workloads$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Very large distributed workloads may require a different architecture than a single-process engine$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Is DuckDB free?$q$, $q$Yes, DuckDB is released under the MIT license and is free to use with no licensing fees.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Do I need a server to run DuckDB?$q$, $q$No, DuckDB runs in-process, embedded directly inside the application or script that uses it.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$What file formats can DuckDB query?$q$, $q$DuckDB can query Parquet, CSV, and JSON files, as well as data stored in S3, Azure, and GCP, directly using SQL.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Which languages does DuckDB support?$q$, $q$DuckDB provides native client libraries for Python, Go, Rust, JavaScript, Java, C, C++, R, and a command-line interface.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Local analytics on data files$q$, $q$Running SQL analytics directly against Parquet, CSV, or JSON files without loading them into a separate database.$q$, $q$Data analysts and data scientists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Embedded analytics in applications$q$, $q$Adding an analytical query engine directly inside a Python, Java, or JavaScript application.$q$, $q$Application developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Browser-based analytics$q$, $q$Running SQL queries client-side in the browser via the WebAssembly build.$q$, $q$Frontend and data-app developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$Open Source$q$, $q$Free$q$, NULL, $q$["MIT-licensed","Embedded in-process engine","Native clients for multiple languages"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$overview$q$, $q$What is DuckDB?$q$, 2, ARRAY[$q$DuckDB is an in-process SQL OLAP database management system released under the MIT license, designed to run analytical queries directly against data files and cloud storage without a separate server.$q$, $q$It offers native client libraries for languages including Python, Go, Rust, JavaScript, Java, C, C++, and R, and can run on Linux, macOS, Windows, or in the browser via WebAssembly.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', $q$who-its-for$q$, $q$Who DuckDB is for$q$, 2, ARRAY[$q$DuckDB fits data analysts and developers who want fast SQL analytics on local files or cloud storage without standing up a database server, and application developers embedding analytical queries directly in their software.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('80cb4f6d-eff0-4feb-abf9-70df2946bcfe', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── FerretDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source proxy that translates the MongoDB wire protocol to PostgreSQL, offering a MongoDB-compatible database.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$FerretDB is an open-source, MongoDB-compatible database that converts MongoDB wire protocol queries to PostgreSQL, avoiding SSPL licensing.$q$,
  og_description = $q$FerretDB is an open-source, MongoDB-compatible database that converts MongoDB wire protocol queries to PostgreSQL, avoiding SSPL licensing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c63f5cdd-3d2b-4852-9c15-e6302ec5f68e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c63f5cdd-3d2b-4852-9c15-e6302ec5f68e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$MongoDB wire protocol compatibility$q$, $q$Converts MongoDB 5.0+ wire protocol queries into SQL, letting existing MongoDB drivers connect to FerretDB.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$PostgreSQL-backed engine$q$, $q$Uses PostgreSQL with the DocumentDB extension as its underlying storage engine.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Open-source licensing$q$, $q$Built as a license-unrestricted alternative after MongoDB moved to the Server Side Public License (SSPL).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Managed cloud option$q$, $q$FerretDB Cloud provides a hosted version of FerretDB via a separate signup portal.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Open-source with no SSPL-style licensing restrictions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Lets teams reuse existing MongoDB drivers and tooling$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Built on PostgreSQL, a mature and widely supported database engine$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Both self-hosted and managed cloud deployment options are available$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$MongoDB compatibility is still being expanded, so some commands or behaviors may differ from MongoDB$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$FerretDB Cloud pricing is not published$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Teams must verify feature-by-feature compatibility before relying on it for production MongoDB workloads$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Is FerretDB a drop-in replacement for MongoDB?$q$, $q$FerretDB aims to support MongoDB 5.0+ wire protocol commands, but documentation notes known differences, so compatibility should be verified for each use case before production deployment.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$What database does FerretDB run on?$q$, $q$FerretDB uses PostgreSQL with the DocumentDB extension as its underlying storage engine.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Why was FerretDB created?$q$, $q$FerretDB was created as an open-source alternative to MongoDB after MongoDB moved to the Server Side Public License (SSPL).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Is there a managed version of FerretDB?$q$, $q$Yes, FerretDB Cloud offers a hosted version of FerretDB alongside the self-hosted open-source option.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$MongoDB license migration$q$, $q$Replacing MongoDB deployments that need an open-source, non-SSPL document database.$q$, $q$Engineering teams avoiding SSPL licensing$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$PostgreSQL-based document workloads$q$, $q$Running document-style queries on top of a PostgreSQL infrastructure teams already operate.$q$, $q$Teams standardized on PostgreSQL$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted FerretDB","MongoDB wire protocol compatibility"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$FerretDB Cloud$q$, $q$Contact for pricing$q$, NULL, $q$["Hosted, managed FerretDB"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$overview$q$, $q$What is FerretDB?$q$, 2, ARRAY[$q$FerretDB is an open-source proxy that converts MongoDB 5.0+ wire protocol queries into SQL, running on PostgreSQL with the DocumentDB extension as its storage engine.$q$, $q$It was created as a license-unrestricted alternative to MongoDB after MongoDB adopted the Server Side Public License (SSPL), and is available both self-hosted and as a managed FerretDB Cloud service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', $q$who-its-for$q$, $q$Who FerretDB is for$q$, 2, ARRAY[$q$FerretDB is aimed at developers and organizations that want MongoDB-style document database compatibility without SSPL licensing terms, particularly teams already running PostgreSQL infrastructure.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c63f5cdd-3d2b-4852-9c15-e6302ec5f68e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Valkey ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A BSD-licensed, open-source key-value data store supported by the Linux Foundation as a permanent open-source fork.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Valkey is a free, open-source, BSD-licensed key-value data store backed by the Linux Foundation for caching and real-time workloads.$q$,
  og_description = $q$Valkey is a free, open-source, BSD-licensed key-value data store backed by the Linux Foundation for caching and real-time workloads.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Rich data structures$q$, $q$Supports strings, numbers, hashes, lists, sets, sorted sets, bitmaps, and hyperloglogs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Lua scripting and modules$q$, $q$Supports Lua scripting and module-based extensibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Cluster and replication support$q$, $q$Can run as a standalone daemon or in cluster mode with replication and high-availability options.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Linux Foundation governance$q$, $q$Governed by LF Projects, LLC under the Linux Foundation, which manages trademarks and open-source policy.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Multi-cloud managed availability$q$, $q$Available as a managed service from multiple cloud providers, including AWS, Google Cloud, and Oracle.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Fully open source under a permissive BSD license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Backed by the Linux Foundation, giving it vendor-neutral governance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Supports caching, message queuing, and primary database use cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Available as a managed service from several major cloud providers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$No official paid tier or support contract directly from the Valkey project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$As a newer fork, feature parity with Redis extensions may vary over time$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Cluster and HA configuration require operational expertise to run reliably$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Is Valkey free?$q$, $q$Yes, Valkey is open source under a BSD license with no licensing costs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Who governs the Valkey project?$q$, $q$Valkey is backed by the Linux Foundation through LF Projects, LLC, which manages the project's trademarks and policies.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Can Valkey run in a cluster?$q$, $q$Yes, Valkey supports standalone and cluster deployment modes with replication and high-availability options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Is Valkey available as a managed service?$q$, $q$Yes, several cloud providers, including AWS, Google Cloud, and Oracle, offer managed Valkey services.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Application caching$q$, $q$Using Valkey as an in-memory cache to reduce load on primary databases.$q$, $q$Backend engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Real-time and low-latency workloads$q$, $q$Serving low-latency reads and writes for real-time application features.$q$, $q$Application developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Message queuing$q$, $q$Using Valkey's data structures to implement lightweight message queues.$q$, $q$Backend and infrastructure engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$Open Source$q$, $q$Free$q$, NULL, $q$["BSD-licensed","Self-hosted deployment"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$overview$q$, $q$What is Valkey?$q$, 2, ARRAY[$q$Valkey is an open-source, BSD-licensed key-value data store backed by the Linux Foundation, positioned as a permanently open-source project that supports caching, message queuing, and primary database use cases.$q$, $q$It supports data structures such as strings, hashes, lists, sets, sorted sets, bitmaps, and hyperloglogs, along with Lua scripting, modules, and cluster/replication deployment modes.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', $q$who-its-for$q$, $q$Who Valkey is for$q$, 2, ARRAY[$q$Valkey suits teams that want a vendor-neutral, permissively licensed in-memory data store for caching or low-latency workloads, including those seeking an open-source alternative in the Redis ecosystem.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48bf1eae-a2e1-4a2b-99ed-b79c030ae0e8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Dragonfly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A Redis-compatible, multi-threaded in-memory data store built for higher throughput on modern cloud hardware.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$36/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Dragonfly is a Redis-compatible, multi-threaded in-memory data store, available open source or as managed Dragonfly Cloud from $36/month.$q$,
  og_description = $q$Dragonfly is a Redis-compatible, multi-threaded in-memory data store, available open source or as managed Dragonfly Cloud from $36/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9a28f7a9-0896-4972-aa26-4337e26797f9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9a28f7a9-0896-4972-aa26-4337e26797f9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Thread-per-core architecture$q$, $q$Uses a multi-threaded, shared-nothing design that utilizes every core, unlike Redis's single-threaded model.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Redis API compatibility$q$, $q$Compatible with the Redis protocol, allowing Redis clients to connect to Dragonfly.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Higher throughput per instance$q$, $q$The vendor reports significantly higher queries-per-second than Redis on comparable hardware, reducing the number of instances needed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Managed cloud service$q$, $q$Dragonfly Cloud offers fully managed deployment on AWS, GCP, and Azure with one-click provisioning.$q$, 3);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Open source and free to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Redis protocol compatibility eases migration for existing Redis users$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Multi-threaded architecture can reduce the number of instances needed versus Redis clusters$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Managed Dragonfly Cloud plans start at a published price ($36/month Flex plan)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Free trial credit offered for Dragonfly Cloud$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Business and Enterprise cloud tiers are priced much higher ($2,000/month and quote-based respectively)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Performance claims are vendor-published benchmarks and may vary by workload$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$As a newer project, its operational track record is shorter than Redis's$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Is Dragonfly compatible with Redis?$q$, $q$Yes, Dragonfly is compatible with the Redis protocol, so existing Redis clients can connect to it.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$How much does Dragonfly Cloud cost?$q$, $q$Dragonfly Cloud's Flex plan starts at $36/month; Business starts at $2,000/month; Enterprise pricing is quote-based.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Is there a free trial for Dragonfly Cloud?$q$, $q$Yes, Dragonfly offers a free trial with credit for the Flex plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Can I self-host Dragonfly for free?$q$, $q$Yes, the open-source version of Dragonfly can be self-deployed at no cost.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$High-performance caching$q$, $q$Replacing Redis clusters with fewer Dragonfly instances for caching workloads.$q$, $q$Backend and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Real-time feature stores$q$, $q$Serving low-latency feature lookups for real-time applications.$q$, $q$ML and application engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Real-time leaderboards and message queues$q$, $q$Powering leaderboard and queue-based application features that need high throughput.$q$, $q$Application developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted Dragonfly"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Flex$q$, $q$$36/month$q$, $q$monthly$q$, $q$["Fully managed on AWS, GCP, or Azure","One-click provisioning","Horizontal and vertical scaling"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Business$q$, $q$$2,000/month$q$, $q$monthly$q$, $q$["Bring your own cloud","SSO & MFA","Custom SLA"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$Enterprise$q$, $q$Contact sales$q$, NULL, $q$["Air-gapped infrastructure support","White-glove migrations","Enterprise SLA"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$overview$q$, $q$What is Dragonfly?$q$, 2, ARRAY[$q$Dragonfly is a Redis-protocol-compatible, in-memory data store built with a thread-per-core, shared-nothing architecture designed to use every core on modern cloud hardware.$q$, $q$It's available as free open-source software for self-hosting, or as Dragonfly Cloud, a managed service with published plans starting at $36/month for the Flex tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', $q$who-its-for$q$, $q$Who Dragonfly is for$q$, 2, ARRAY[$q$Dragonfly fits teams currently running Redis who want to consolidate multiple Redis instances or clusters into fewer, higher-throughput Dragonfly instances, whether self-hosted or via the managed cloud service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9a28f7a9-0896-4972-aa26-4337e26797f9', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── KeyDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$A fully open-source, multithreaded, drop-in alternative to Redis maintained by Snap Inc.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$KeyDB is a free, open-source, multithreaded, Redis-compatible in-memory data store maintained by Snap Inc.$q$,
  og_description = $q$KeyDB is a free, open-source, multithreaded, Redis-compatible in-memory data store maintained by Snap Inc.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5090858f-f936-401a-988e-90e50e3c63af';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5090858f-f936-401a-988e-90e50e3c63af' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Multithreaded engine$q$, $q$A multithreaded architecture enabling over 1 million operations per second per node.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Redis compatibility$q$, $q$Functions as a drop-in alternative to Redis with support for the same data structures, including strings, hashes, lists, sets, sorted sets, and streams.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$MVCC concurrency$q$, $q$Uses a multi-version concurrency control (MVCC) architecture that allows concurrent queries without blocking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Active-active replication$q$, $q$Supports cross-region multi-master replication.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$ModJS scripting$q$, $q$Allows custom commands to be written in JavaScript using the V8 engine.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Fully open source under a BSD-3 license with no cost to self-host$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Multithreaded design targets higher throughput than single-threaded Redis$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Backed and used in production by Snap Inc.'s caching infrastructure$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Supports cross-region multi-master (active-active) replication$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Latest GitHub release (6.3.4) dates to October 2023, indicating a slower release cadence recently$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$No managed cloud offering from the KeyDB project itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Open-source and Enterprise editions were consolidated into a single project, which may affect availability of prior Enterprise-only features$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Is KeyDB free?$q$, $q$Yes, KeyDB is a fully open-source project with no licensing cost, released under a BSD-3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Who maintains KeyDB?$q$, $q$KeyDB is maintained by Snap Inc., which also uses it as part of its own caching infrastructure.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$How is KeyDB different from Redis?$q$, $q$KeyDB uses a multithreaded architecture, unlike Redis's traditionally single-threaded design, aiming for higher throughput while maintaining Redis compatibility.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Does KeyDB support active-active replication?$q$, $q$Yes, KeyDB supports cross-region multi-master replication.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$High-throughput caching$q$, $q$Replacing Redis in caching layers that need higher per-node throughput.$q$, $q$Backend and infrastructure teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Multi-region active-active deployments$q$, $q$Running replicated data stores across regions with multi-master writes.$q$, $q$Teams operating globally distributed applications$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$Open Source$q$, $q$Free$q$, NULL, $q$["BSD-3 licensed","Self-hosted multithreaded data store"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$overview$q$, $q$What is KeyDB?$q$, 2, ARRAY[$q$KeyDB is a fully open-source, multithreaded, in-memory data store built as a drop-in alternative to Redis, maintained by Snap Inc. and used as part of its caching infrastructure.$q$, $q$It combines Redis-compatible data structures and commands with a multithreaded engine, MVCC concurrency, and support for cross-region multi-master replication.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', $q$who-its-for$q$, $q$Who KeyDB is for$q$, 2, ARRAY[$q$KeyDB is suited to teams already using Redis who want a compatible, free, multithreaded alternative capable of higher per-node throughput and multi-region active-active replication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5090858f-f936-401a-988e-90e50e3c63af', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── OpenSearch ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An Apache 2.0-licensed, open-source search, analytics, and observability suite governed by the Linux Foundation.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$OpenSearch is a free, Apache 2.0-licensed, open-source search and analytics suite for search, observability, and security use cases.$q$,
  og_description = $q$OpenSearch is a free, Apache 2.0-licensed, open-source search and analytics suite for search, observability, and security use cases.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '897517f2-e813-44cf-9a91-5b3befd56d44';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '897517f2-e813-44cf-9a91-5b3befd56d44' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$OpenSearch Core$q$, $q$A search and analytics engine built on Apache Lucene.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$OpenSearch Dashboards$q$, $q$Data visualization and exploration tools for OpenSearch data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$OpenSearch Data Prepper$q$, $q$A server-side data collector for enriching and transforming data before indexing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Vector engine for AI/ML$q$, $q$A vector engine supporting vector search and anomaly detection for AI and ML applications.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Security analytics$q$, $q$Supports threat intelligence and event correlation use cases.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Fully open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Governed by the Linux Foundation via the OpenSearch Software Foundation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Covers search, observability, and security analytics in one project$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Includes a vector engine for AI/ML search use cases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Active community across forums, Slack, and GitHub$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$No pricing or managed-service details are provided directly by the OpenSearch project itself$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Running OpenSearch at scale requires operational expertise or a third-party managed service$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Multiple components (Core, Dashboards, Data Prepper, Vector Engine) add deployment complexity$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Is OpenSearch free?$q$, $q$Yes, OpenSearch is open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Who governs the OpenSearch project?$q$, $q$OpenSearch is governed by the OpenSearch Software Foundation under the Linux Foundation, established in September 2024.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Does OpenSearch support vector search?$q$, $q$Yes, the OpenSearch Vector Engine supports vector search and anomaly detection for AI and machine learning applications.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$What is OpenSearch Dashboards?$q$, $q$OpenSearch Dashboards is the data visualization and exploration component of the OpenSearch suite.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Enterprise and e-commerce search$q$, $q$Powering document and product search experiences.$q$, $q$Search and application engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Observability$q$, $q$Log analysis and performance monitoring across systems.$q$, $q$SRE and platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Security analytics$q$, $q$Threat intelligence and security event correlation.$q$, $q$Security operations teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Apache 2.0 licensed","Self-hosted deployment","Community-driven development"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$overview$q$, $q$What is OpenSearch?$q$, 2, ARRAY[$q$OpenSearch is an open-source, Apache 2.0-licensed search and analytics suite governed by the OpenSearch Software Foundation under the Linux Foundation, combining a Lucene-based search engine (OpenSearch Core) with Dashboards, Data Prepper, and a Vector Engine.$q$, $q$It targets search, observability, security analytics, and AI/ML use cases such as vector search and anomaly detection.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', $q$who-its-for$q$, $q$Who OpenSearch is for$q$, 2, ARRAY[$q$OpenSearch fits teams that need an open-source, vendor-neutral platform for search, log and metrics observability, or security analytics, without relying on a single-vendor search product.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('897517f2-e813-44cf-9a91-5b3befd56d44', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Quickwit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$An open-source, Rust-based search and analytics engine built on Tantivy, optimized for cloud object storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Quickwit is an open-source, Rust-based search engine built on Tantivy for sub-second search directly on cloud object storage.$q$,
  og_description = $q$Quickwit is an open-source, Rust-based search engine built on Tantivy for sub-second search directly on cloud object storage.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1ad07660-a8fd-4c45-a63d-f9199fe54fa9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1ad07660-a8fd-4c45-a63d-f9199fe54fa9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Decoupled compute and storage$q$, $q$Separates compute from storage so search runs directly against cloud object storage such as S3, MinIO, or Ceph.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Optimized file format$q$, $q$Uses a custom file format that reduces I/O requests against object storage.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Native observability protocol support$q$, $q$Supports OpenTelemetry and Jaeger natively for log and trace ingestion.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Multi-tenancy with retention policies$q$, $q$Supports multi-tenant indexes with retention and lifecycle policies, plus GDPR-compliant deletion.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Horizontally scalable, high-availability design$q$, $q$Built to run in single- or multi-node configurations that scale horizontally.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Free, open-source, community-based software$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Built in Rust on the Tantivy search library for performance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Searches directly against cheap object storage instead of requiring costly local disks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Native OpenTelemetry and Jaeger support suits observability and log-management use cases$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Continued as open source with plans to move to the Apache 2.0 license after Quickwit's team joined Datadog$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Quickwit's founding team joined Datadog, shifting primary company focus toward a new Datadog product rather than a standalone Quickwit commercial offering$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$No published managed-cloud pricing tiers for Quickwit itself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$As the project transitions ownership/licensing, roadmap and support commitments may evolve$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Is Quickwit still maintained after joining Datadog?$q$, $q$Yes, according to Quickwit's own announcement, the open-source engine continues to be developed, with a new version planned under the Apache 2.0 license, even as the founding team also works on a new product with Datadog.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Is Quickwit free to use?$q$, $q$Yes, Quickwit is free, open-source, community-based software available on GitHub.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$What is Quickwit built on?$q$, $q$Quickwit is built in Rust and powered by the Tantivy search library.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Can Quickwit search data directly on object storage?$q$, $q$Yes, Quickwit's decoupled compute-and-storage architecture is designed to run sub-second search directly against cloud object storage like S3, MinIO, and Ceph.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Log management$q$, $q$Ingesting and searching high-volume logs stored on cost-efficient object storage.$q$, $q$Platform and observability teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Distributed tracing$q$, $q$Storing and querying trace data ingested via OpenTelemetry or Jaeger.$q$, $q$SRE and observability engineers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Full-text search on cloud storage$q$, $q$Running full-text search applications without maintaining local search-node disks.$q$, $q$Backend and infrastructure engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted Quickwit engine","Community-based development"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$overview$q$, $q$What is Quickwit?$q$, 2, ARRAY[$q$Quickwit is an open-source search and analytics engine, written in Rust and powered by the Tantivy library, designed to deliver sub-second search directly against cloud object storage such as S3, MinIO, and Ceph.$q$, $q$Quickwit's founding team joined Datadog; the company has said the open-source engine will continue under the Apache 2.0 license even as it also builds a new product with Datadog.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', $q$who-its-for$q$, $q$Who Quickwit is for$q$, 2, ARRAY[$q$Quickwit suits teams that want log management, distributed tracing, or full-text search running directly against low-cost object storage rather than maintaining expensive local search-node disks.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1ad07660-a8fd-4c45-a63d-f9199fe54fa9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Manticore Search ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Manticore Search is a free, open-source database for full-text, vector, and SQL-based search built as a fast, low-resource alternative to Elasticsearch.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Chatham, Kent, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Manticore Search is a free, open-source search database for full-text, vector, and SQL search, built as a fast alternative to Elasticsearch.$q$,
  og_description = $q$Manticore Search is a free, open-source search database for full-text, vector, and SQL search, built as a fast alternative to Elasticsearch.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8eeed669-fbb5-47e4-8555-27145e4a692e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8eeed669-fbb5-47e4-8555-27145e4a692e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Full-text search$q$, $q$Advanced text indexing with morphology support and result highlighting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Vector and semantic search$q$, $q$Built-in support for vector and semantic/hybrid search alongside traditional keyword search.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Multiple query interfaces$q$, $q$Query via SQL over the MySQL protocol, JSON/REST, or native client APIs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Low resource requirements$q$, $q$Designed to run efficiently on as little as 1 CPU core and 1GB of RAM.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Client libraries$q$, $q$Official clients for PHP, Python, JavaScript, TypeScript, Go, Java, .NET, Rust, and Elixir.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Container-friendly deployment$q$, $q$Ships with Docker images and Helm charts for Kubernetes deployment.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$100% open source with source code available on GitHub$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Benchmarked significantly faster than Elasticsearch on several workloads per the vendor's own tests$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Runs on minimal hardware, making it cheap to self-host$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Supports SQL, JSON/REST, and native APIs in one engine$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Client libraries for most major programming languages$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$No official managed Manticore Cloud service was found — self-hosting or third-party cloud partners (e.g. Elestio) are the deployment routes$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Vendor support and custom feature development are sold separately as paid professional services$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$As a smaller project than Elasticsearch, the surrounding ecosystem of plugins and integrations is more limited$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Is Manticore Search free to use?$q$, $q$Yes. Manticore Search is 100% open source and free to self-host; the company separately sells consulting and support services.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$What license is Manticore Search released under?$q$, $q$It is published under GPLv3 or later, per its GitHub repository.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Can Manticore Search do vector search?$q$, $q$Yes, it supports vector and semantic search in addition to traditional full-text and SQL-based search.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$How do I query Manticore Search?$q$, $q$You can query it using SQL over the MySQL protocol, a JSON/REST API, or native client libraries.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Log analytics$q$, $q$Index and search large volumes of log data with full-text search performance.$q$, $q$Platform and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$E-commerce search$q$, $q$Power product search and autocomplete for online storefronts.$q$, $q$E-commerce engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Hybrid semantic search$q$, $q$Combine keyword and vector search for AI-assisted search applications.$q$, $q$Developers building search or RAG features$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment","SQL, JSON/REST, and native APIs","Full-text and vector search","Docker and Kubernetes support"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$overview$q$, $q$What is Manticore Search?$q$, 2, ARRAY[$q$Manticore Search is an open-source database engine focused on full-text and vector search, positioned by its maintainer as a faster, more resource-efficient alternative to Elasticsearch. It can be queried through SQL over the MySQL protocol, a JSON/REST API, or native client libraries, and it is designed to run on modest hardware.$q$, $q$The project is maintained by UK-based Manticore Software Ltd, headquartered in Chatham, Kent. The core engine is free and open source under GPLv3, with the company generating revenue from consulting, performance tuning, and custom feature development rather than a paid product tier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', $q$who-its-for$q$, $q$Who Manticore Search is for$q$, 2, ARRAY[$q$Manticore Search suits teams that need fast full-text or hybrid semantic search — for log analytics, e-commerce search, or autocomplete — and want to self-host on limited infrastructure without paying for a managed search service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8eeed669-fbb5-47e4-8555-27145e4a692e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Vespa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Vespa is an open-source, distributed engine for combining vector, text, and structured-data search with real-time machine-learned ranking at scale.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Vespa is an open-source AI search and serving engine for vector, text, and structured data, available self-hosted or via managed Vespa Cloud.$q$,
  og_description = $q$Vespa is an open-source AI search and serving engine for vector, text, and structured data, available self-hosted or via managed Vespa Cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e3bab8d3-6cb7-4707-add4-248119724ff1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e3bab8d3-6cb7-4707-add4-248119724ff1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Unified vector, text, and structured search$q$, $q$Search and rank across vectors, tensors, text, and structured data in one engine.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Distributed ML ranking$q$, $q$Runs machine-learned ranking models directly in the serving path at query time.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Low-latency at scale$q$, $q$Sub-100 millisecond latencies claimed across billions of data items and thousands of queries per second.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud$q$, $q$Fully managed hosting option with automated scaling, as an alternative to self-hosting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$RAG-oriented retrieval$q$, $q$Built for retrieval-augmented generation and other generative AI search workloads.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Core engine is open source under Apache 2.0$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Used in production by large-scale services including Spotify, Yahoo, Perplexity, and Elicit per the vendor's site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Handles very large datasets and high query throughput$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud offers a free trial with no credit card required$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Combines retrieval, ranking, and ML inference in a single system rather than stitching together separate tools$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud pricing is not published upfront — it requires a price calculator or contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Self-hosting Vespa means operating a distributed serving engine, which is more involved than a simple database$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$No founding year or company headquarters is disclosed on the public site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Is Vespa open source?$q$, $q$Yes, the core Vespa engine is open source under the Apache 2.0 license and available on GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Does Vespa offer a managed hosting option?$q$, $q$Yes, Vespa Cloud is a managed hosting service with a free trial that doesn't require a credit card.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$What kind of search does Vespa support?$q$, $q$Vespa supports vector, text, and structured-data search together, with machine-learned ranking applied at serving time.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Who uses Vespa?$q$, $q$The vendor's site lists adopters including Spotify, Yahoo, Perplexity, Elicit, Farfetch, and Groupon.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Retrieval-augmented generation$q$, $q$Serve as the retrieval layer for RAG and generative AI applications.$q$, $q$AI application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Recommendation and personalization$q$, $q$Rank and retrieve personalized results at query time using ML models.$q$, $q$Product and search engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Large-scale enterprise search$q$, $q$Search billions of items with sub-100ms latency.$q$, $q$Engineering teams at high-traffic consumer platforms$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Open Source (self-hosted)$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment","Full engine functionality","Apache 2.0 licensed"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$Vespa Cloud Free Trial$q$, $q$Free$q$, NULL, $q$["No credit card required","Managed hosting for development/testing"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$overview$q$, $q$What is Vespa?$q$, 2, ARRAY[$q$Vespa is a distributed serving engine that unifies retrieval, ranking, machine-learned inference, and real-time serving for search and AI applications. It supports vector, text, and structured-data search in a single system, applying ranking models directly at query time rather than as a separate offline step.$q$, $q$The open-source engine is available under Apache 2.0 on GitHub, and can be self-hosted or run on the managed Vespa Cloud, which offers a free trial without a credit card. The vendor lists Spotify, Yahoo, Perplexity, Elicit, Farfetch, and Groupon among the organizations using Vespa in production.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', $q$who-its-for$q$, $q$Who Vespa is for$q$, 2, ARRAY[$q$Vespa fits engineering teams building large-scale search, recommendation, or retrieval-augmented-generation systems that need to combine vector, text, and structured data with real-time ML ranking, whether self-hosted or through the managed Vespa Cloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e3bab8d3-6cb7-4707-add4-248119724ff1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Chroma ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Chroma is an open-source, Apache-2.0-licensed vector, full-text, and metadata search database for AI applications, self-hosted or via Chroma Cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$0/month + usage (Chroma Cloud Starter plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Chroma is an open-source vector, full-text, and metadata search database for AI apps, with a free self-hosted option and paid Chroma Cloud.$q$,
  og_description = $q$Chroma is an open-source vector, full-text, and metadata search database for AI apps, with a free self-hosted option and paid Chroma Cloud.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cd5a43d0-6c12-4d8c-95e4-dbcf7e682046' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Vector search$q$, $q$Semantic similarity search over embeddings.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Sparse vector search$q$, $q$Support for BM25 and SPLADE-style sparse retrieval alongside dense vectors.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Full-text search$q$, $q$Trigram and regex-based text search.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Metadata filtering$q$, $q$Faceted, metadata-filtered querying alongside search.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Collection forking$q$, $q$Version datasets by forking collections for A/B testing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Automatic data tiering$q$, $q$Moves data automatically between memory, SSD, and cloud object storage to control cost.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Apache 2.0 open source with over 26,000 GitHub stars per the vendor's site$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Large community: 11+ million monthly downloads and 10,000+ Discord members claimed$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Chroma Cloud Starter plan includes $5 in free credits before usage billing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Enterprise BYOC (bring-your-own-cloud) option for deployment inside a customer's own VPC$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Used by named customers including Capital One, UnitedHealthcare, Weights & Biases, and Mintlify per the vendor$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Chroma Cloud is usage-based (writes, storage, queries, network egress billed separately), which can be harder to predict than flat pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Team plan's included $100 credit expires, unlike other unused credits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Enterprise/BYOC pricing requires a custom quote$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$No founding year or headquarters is disclosed on the public site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Is Chroma free to use?$q$, $q$The core Chroma database is open source under Apache 2.0 and free to self-host. Chroma Cloud is a separate paid managed service with a free-credit Starter tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$What is Chroma Cloud's pricing?$q$, $q$Chroma Cloud has a Starter plan ($0/month plus usage, with $5 in free credits), a Team plan ($250/month with $100 in credits), and custom Enterprise pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$What kinds of search does Chroma support?$q$, $q$Chroma supports dense vector search, sparse vector search (BM25/SPLADE), full-text search with regex, and metadata filtering.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Can I self-host Chroma?$q$, $q$Yes, Chroma OSS can be deployed on your own infrastructure using the project's open-source deployment guides.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Retrieval-augmented generation$q$, $q$Store and query embeddings for RAG pipelines and AI chat systems.$q$, $q$AI application developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Knowledge base retrieval$q$, $q$Semantic search over internal documents and knowledge bases.$q$, $q$Engineering and data teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$A/B testing of retrieval strategies$q$, $q$Use collection forking to version and compare datasets.$q$, $q$ML engineers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Starter$q$, $q$$0/month + usage$q$, $q$monthly$q$, $q$["$5 in free credits","Up to 10 databases","Up to 10 team members","Community Slack access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Team$q$, $q$$250/month$q$, $q$monthly$q$, $q$["$100 in included credits","Up to 100 databases","Up to 30 team members","Slack support, SOC 2 Type II, volume discounts"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited databases and team members","Dedicated support","Single-tenant/BYOC options","SLAs"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$overview$q$, $q$What is Chroma?$q$, 2, ARRAY[$q$Chroma is an open-source search infrastructure platform for AI applications, supporting vector, sparse vector, full-text, and metadata search in one system. It automatically tiers data between memory, SSD, and cloud object storage to keep costs down while serving low-latency queries.$q$, $q$The core project is Apache 2.0 licensed and self-hostable, with over 26,000 GitHub stars claimed. Chroma Cloud, launched in August 2025, is a separate managed, serverless offering with usage-based pricing, a free-credit Starter tier, a $250/month Team tier, and custom Enterprise/BYOC plans for larger organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', $q$who-its-for$q$, $q$Who Chroma is for$q$, 2, ARRAY[$q$Chroma fits developers building RAG pipelines, AI chat memory, or semantic search features who want an open-source vector database they can self-host, with the option to move to a managed Chroma Cloud plan as usage grows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cd5a43d0-6c12-4d8c-95e4-dbcf7e682046', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── LanceDB ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LanceDB is an open-source, Apache-2.0 multimodal vector database and AI data lakehouse built on the Lance columnar format, self-hosted or via LanceDB Cloud.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, United States$q$,
  languages = '{}',
  seo_meta_description = $q$LanceDB is an open-source multimodal vector database built on the Lance format, with self-hosted, embedded, and cloud deployment options.$q$,
  og_description = $q$LanceDB is an open-source multimodal vector database built on the Lance format, with self-hosted, embedded, and cloud deployment options.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '391b42a3-3312-43a4-800a-ec03d77e0694';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '391b42a3-3312-43a4-800a-ec03d77e0694' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Multimodal data support$q$, $q$Handles text, images, audio, and video in a single table.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Unified vector, full-text, and hybrid search$q$, $q$Combine vector, full-text, and hybrid search with SQL filters in one query layer.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Feature engineering with Python UDFs$q$, $q$Define transformations as Python user-defined functions with automatic updates and schema evolution without table rewrites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Data curation tooling$q$, $q$Built-in deduplication, distribution optimization, and edge-case identification for training datasets.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Large-scale performance$q$, $q$Supports 100B+ rows per table and 100K+ queries per second per the vendor.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Embeddable local deployment$q$, $q$Python and TypeScript libraries let LanceDB run embedded, without a separate server.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Apache 2.0 open source, built on the open Lance columnar storage format$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Can run embedded locally (no server to manage) or scale via LanceDB Cloud$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Named users include Netflix, Runway, Uber, ByteDance, CodeRabbit, and Midjourney per the vendor's site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Handles multimodal data (text, image, audio, video) in one table rather than separate systems$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Raised a $30M Series A in 2025 per the company's own site, indicating ongoing investment$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$LanceDB Cloud pricing is not published on the public site — the pricing page is a contact form rather than listed tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Enterprise features require contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$No public founding year is disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Is LanceDB open source?$q$, $q$Yes, LanceDB is Apache 2.0 licensed and built on the open-source Lance columnar format.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Can LanceDB run embedded, without a server?$q$, $q$Yes, Python and TypeScript libraries let LanceDB run locally as an embedded database.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Does LanceDB have a managed cloud offering?$q$, $q$Yes, LanceDB Cloud is a managed deployment option, though its pricing is not publicly listed and requires contacting the company.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$What kind of data can LanceDB store?$q$, $q$It stores multimodal data — text, images, audio, and video — in a single table alongside vector, full-text, and SQL-filterable search.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$AI training dataset pipelines$q$, $q$Curate, deduplicate, and version large multimodal datasets for model training.$q$, $q$ML engineers and data teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Semantic and code search$q$, $q$Combine vector and full-text search with SQL filters for application search features.$q$, $q$Application developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Media asset management$q$, $q$Store and query large volumes of text, image, audio, and video data together.$q$, $q$Media and entertainment engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$Open Source (self-hosted / embedded)$q$, $q$Free$q$, NULL, $q$["Self-hosted or embedded deployment","Python and TypeScript libraries","Apache 2.0 licensed"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$LanceDB Cloud$q$, $q$Custom$q$, NULL, $q$["Managed cloud deployment","Production-scale vector search"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$overview$q$, $q$What is LanceDB?$q$, 2, ARRAY[$q$LanceDB is an AI-native multimodal database built on the open-source Lance columnar storage format. It unifies vector, full-text, and hybrid search with SQL filters, and adds data-curation tooling such as deduplication, schema evolution, and Python UDF-based feature engineering aimed at machine learning training pipelines.$q$, $q$The project is Apache 2.0 licensed and can run embedded locally via Python or TypeScript libraries, be self-hosted, or run on the managed LanceDB Cloud. The company is headquartered in San Francisco and raised a $30M Series A in 2025 according to its own site; named users include Netflix, Runway, Uber, ByteDance, and Midjourney.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', $q$who-its-for$q$, $q$Who LanceDB is for$q$, 2, ARRAY[$q$LanceDB suits ML engineers and application developers who need to store and search multimodal data (text, images, audio, video) at scale, whether embedded in a local app, self-hosted, or run through LanceDB Cloud.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('391b42a3-3312-43a4-800a-ec03d77e0694', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Marqo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Marqo is an AI-native product discovery and search platform for enterprise retailers, delivering search, recommendations, and merchandising trained on their own catalog.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2021,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Marqo delivers AI-native ecommerce search, recommendations, and merchandising trained on a retailer's own catalog, used by enterprise retailers.$q$,
  og_description = $q$Marqo delivers AI-native ecommerce search, recommendations, and merchandising trained on a retailer's own catalog, used by enterprise retailers.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7bc828a9-6a44-47e7-9d64-c584650ed6e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7bc828a9-6a44-47e7-9d64-c584650ed6e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Semantic product search$q$, $q$Search with instant indexing, typo tolerance, and multilingual support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Adaptive shopper journeys$q$, $q$Real-time adaptation to shopper behavior across search, carousels, and conversational interfaces.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$AI-driven merchandising automation$q$, $q$Automated ranking, boosts, filters, and collection generation.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Multimodal search$q$, $q$LLM-based image and product search capability.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$MarqTune$q$, $q$Trains dedicated AI models on a retailer's own catalog and customer behavior data rather than shared or synthetic models.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Ecommerce platform integrations$q$, $q$One-click integrations for Shopify, Adobe Commerce, and Salesforce Commerce Cloud.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Reports documented commercial results, including $130M+ in incremental revenue for enterprise retailers per the vendor$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Named case studies: Mejuri (+19.8% search revenue per user), Redbubble (+21% add-to-cart rate), Kicks Crew (+17.7% conversion uplift)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Native one-click integrations for major commerce platforms (Shopify, Adobe Commerce, Salesforce Commerce Cloud)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Trains dedicated per-retailer models via MarqTune rather than a single shared model$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Founded in 2021, giving it several years of enterprise deployment history$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$The original open-source Marqo vector search engine (marqo-ai/marqo on GitHub) is deprecated and no longer receives updates$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$No self-serve pricing is published — a sales demo is required to get pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Headquarters location is not disclosed on the public site$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Positioned specifically for enterprise retail/ecommerce rather than as a general-purpose vector database$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Is Marqo open source?$q$, $q$Marqo's original open-source vector search project has been deprecated by the company and no longer receives updates; the current product is a commercial, sales-led ecommerce search and discovery platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$What does Marqo do?$q$, $q$Marqo provides AI-native product search, recommendations, and merchandising for enterprise retailers, trained on each retailer's own product catalog and shopper behavior.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$How is Marqo priced?$q$, $q$Pricing is not published; prospective customers must book a demo and get commercial terms from Marqo's sales team.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Which ecommerce platforms does Marqo integrate with?$q$, $q$Marqo offers one-click integrations for Shopify, Adobe Commerce, and Salesforce Commerce Cloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Ecommerce site search$q$, $q$Replace keyword-only site search with semantic, typo-tolerant product search.$q$, $q$Enterprise retailers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Onsite merchandising$q$, $q$Automate ranking, boosts, and collection generation using AI trained on the retailer's catalog.$q$, $q$Ecommerce merchandising teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$Conversational and visual shopping$q$, $q$Support image-based and conversational product discovery.$q$, $q$Retail digital experience teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$overview$q$, $q$What is Marqo?$q$, 2, ARRAY[$q$Marqo, founded in 2021, is an AI-native product discovery platform for enterprise retailers. It combines semantic search, real-time personalization, and AI-driven merchandising automation, and uses a technology it calls MarqTune to train dedicated models on each retailer's own catalog and shopper behavior rather than a shared model.$q$, $q$The company originally released Marqo as an open-source vector search engine on GitHub, but that project has since been deprecated and no longer receives updates. The current product is a commercial, sales-led platform with one-click integrations for Shopify, Adobe Commerce, and Salesforce Commerce Cloud, and case studies citing revenue and conversion improvements for retailers such as Mejuri, Redbubble, and Kicks Crew.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', $q$who-its-for$q$, $q$Who Marqo is for$q$, 2, ARRAY[$q$Marqo is built for enterprise retailers and ecommerce teams looking to replace traditional keyword site search with AI-driven product discovery, merchandising, and personalization, rather than for developers seeking a general-purpose, self-hosted vector database.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7bc828a9-6a44-47e7-9d64-c584650ed6e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Parse Platform ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Parse Platform (Parse Server) is a free, open-source Node.js backend providing REST/GraphQL APIs, real-time queries, push notifications, and file storage.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Parse Platform is an open-source, Apache-2.0 Node.js backend with REST/GraphQL APIs, real-time Live Queries, push notifications, and self-hosted deployment.$q$,
  og_description = $q$Parse Platform is an open-source, Apache-2.0 Node.js backend with REST/GraphQL APIs, real-time Live Queries, push notifications, and self-hosted deployment.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3fda03d5-8efa-4417-bae1-e4cc14dc560a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Auto-generated REST and GraphQL APIs$q$, $q$APIs are generated automatically from your data classes.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Live Queries$q$, $q$Real-time data synchronization for connected clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Cloud Code$q$, $q$Run custom backend logic alongside the API layer.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Push notifications$q$, $q$Send notifications via APNs and FCM.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Pluggable file storage$q$, $q$Multiple adapters available for storing files.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$User authentication$q$, $q$Built-in user accounts, sessions, email verification, and password reset.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Apache-2.0 licensed and completely free to use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$21.4k+ GitHub stars and 4.8k forks, governed by the parse-community organization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Supports both MongoDB and PostgreSQL (with PostGIS) as the backing database$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Deployable to many platforms: Docker, Heroku, AWS Elastic Beanstalk, Google App Engine, Azure, DigitalOcean$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$SDKs available for major client platforms$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$No official managed hosting from the Parse Platform project itself — you must self-host on your own infrastructure$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Relies on community and Open Collective sponsorship rather than a commercial vendor for ongoing support$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Requires running and maintaining your own Node.js and database infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Is Parse Platform free?$q$, $q$Yes, Parse Server is open source under the Apache-2.0 license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$What databases does Parse Server support?$q$, $q$It supports MongoDB (versions 6-8) and PostgreSQL (versions 15-18, with PostGIS).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Does Parse Platform offer real-time functionality?$q$, $q$Yes, via Live Queries, which push real-time data updates to connected clients.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Where can I deploy Parse Server?$q$, $q$Anywhere that can run Node.js, including Docker, Heroku, AWS Elastic Beanstalk, Google App Engine, Azure, and DigitalOcean.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Mobile and web app backends$q$, $q$Provide a self-hosted backend-as-a-service for apps needing data storage, auth, and push notifications.$q$, $q$App developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Real-time applications$q$, $q$Build apps that need live data sync using Live Queries.$q$, $q$Developers building collaborative or real-time features$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Self-hosted BaaS alternative$q$, $q$Replace a hosted backend-as-a-service with a self-managed, open-source equivalent.$q$, $q$Teams wanting full control over their backend infrastructure$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment","REST and GraphQL APIs","Live Queries","Cloud Code","Push notifications"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$overview$q$, $q$What is Parse Platform?$q$, 2, ARRAY[$q$Parse Platform is the open-source continuation of the original Parse backend-as-a-service. Its core component, Parse Server, is a Node.js backend that can be deployed to any infrastructure capable of running Node.js, providing auto-generated REST and GraphQL APIs, real-time Live Queries, Cloud Code for custom logic, push notifications, and pluggable file storage.$q$, $q$The project is Apache-2.0 licensed, governed by the parse-community organization, and supported through Open Collective sponsorship. It has 21.4k+ GitHub stars and supports both MongoDB and PostgreSQL as backing databases, with SDKs for major client platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', $q$who-its-for$q$, $q$Who Parse Platform is for$q$, 2, ARRAY[$q$Parse Platform fits developers who want a free, self-hosted backend-as-a-service — with data storage, authentication, real-time sync, and push notifications — instead of relying on a hosted commercial BaaS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3fda03d5-8efa-4417-bae1-e4cc14dc560a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── PostgREST ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$PostgREST is a free, open-source standalone web server that turns any PostgreSQL database directly into a RESTful API.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$PostgREST is an open-source, MIT-licensed server that generates a RESTful API directly from your PostgreSQL database schema and permissions.$q$,
  og_description = $q$PostgREST is an open-source, MIT-licensed server that generates a RESTful API directly from your PostgreSQL database schema and permissions.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dd33727e-2e57-4b2e-af05-7dee39588471';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dd33727e-2e57-4b2e-af05-7dee39588471' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Auto-generated REST API$q$, $q$Endpoints and operations are determined directly by your database structure and permissions — no custom coding required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$No ORM layer$q$, $q$Database-centric design that avoids ORM abstraction overhead by relying on PostgreSQL's query planner.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Database-delegated authorization$q$, $q$Authentication via JSON Web Tokens, with authorization delegated to PostgreSQL roles.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$OpenAPI documentation$q$, $q$Generates self-documenting API specs using the OpenAPI standard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Schema-based API versioning$q$, $q$Supports versioning APIs through database schemas.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Docker deployment$q$, $q$Available as a Docker image for straightforward deployment.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$MIT licensed and completely free$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$27.5k+ GitHub stars with active development (83+ releases)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Removes ORM overhead by treating the database as the single source of truth$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Used in production by Supabase, Catarse, and Image-charts per the docs$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Backed by sponsors including Supabase, Neon, and Cybertec$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Requires solid PostgreSQL schema and permissions design to use safely, since authorization is delegated to database roles$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Only even-numbered major versions are intended for production use, per its MAJOR.PATCH versioning scheme, which requires upgrade planning$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$No official managed/hosted version — it's self-run software, not a service$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$336 open issues on GitHub at time of review, typical of an actively used but community-driven project$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Is PostgREST free to use?$q$, $q$Yes, it is open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$What does PostgREST do?$q$, $q$It turns an existing PostgreSQL database directly into a RESTful API, based on the database's schema and permissions.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$What language is PostgREST written in?$q$, $q$It's written primarily in Haskell, with some PL/pgSQL and Python in the codebase.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Who uses PostgREST in production?$q$, $q$The documentation lists Supabase, Catarse, and Image-charts as production users.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Instant API over an existing database$q$, $q$Expose a PostgreSQL database as a REST API without writing custom backend code.$q$, $q$Backend developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Supabase-style backends$q$, $q$Serve as the API layer for projects following a Postgres-first backend architecture.$q$, $q$Full-stack developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Replacing hand-written CRUD APIs$q$, $q$Cut down on boilerplate CRUD endpoint code by generating them from the schema.$q$, $q$Engineering teams optimizing for development speed$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted deployment","Auto-generated REST API","OpenAPI documentation","Docker image"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$overview$q$, $q$What is PostgREST?$q$, 2, ARRAY[$q$PostgREST is a standalone web server that turns an existing PostgreSQL database directly into a RESTful API, with endpoints and permitted operations determined by the database's structure and role-based permissions. It avoids an ORM layer entirely, leaning on PostgreSQL's own query planner for performance.$q$, $q$The project is MIT licensed, written primarily in Haskell, and has 27.5k+ GitHub stars. It's sponsored by companies including Supabase, Neon, and Cybertec, and is used in production by Supabase, Catarse, and Image-charts according to its documentation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', $q$who-its-for$q$, $q$Who PostgREST is for$q$, 2, ARRAY[$q$PostgREST fits backend developers who already model their application logic in PostgreSQL and want an instant, low-maintenance REST API layer instead of writing and maintaining custom CRUD endpoints or an ORM.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dd33727e-2e57-4b2e-af05-7dee39588471', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── DreamFactory ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$DreamFactory is a self-hosted API gateway that auto-generates governed REST and MCP APIs from 30+ databases and legacy systems, with free and paid tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$1,500/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DreamFactory auto-generates secure REST and MCP APIs from databases and legacy systems, with a free open-source tier and paid enterprise plans.$q$,
  og_description = $q$DreamFactory auto-generates secure REST and MCP APIs from databases and legacy systems, with a free open-source tier and paid enterprise plans.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Auto-generated REST APIs$q$, $q$Zero-code API creation directly from database schemas and services.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$30+ database and system connectors$q$, $q$Supports SQL databases, NoSQL systems, cloud warehouses, SaaS platforms, and legacy systems including DB2 and SOAP.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Governed data access$q$, $q$Role-based access controls, field-level security, and identity passthrough for REST and MCP API access.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$API gateway capabilities$q$, $q$Rate limiting, traffic shaping, caching, routing, and observability.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Security and compliance controls$q$, $q$Audit trails and SQL-injection threat protection aimed at regulated industries.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Flexible deployment$q$, $q$On-premises, private cloud, edge, and hybrid deployment via Docker/Kubernetes installers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Free open-source tier available for learning, personal projects, and early-stage development$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Wide connector coverage, including legacy systems like DB2 and SOAP that many API gateways don't support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Strong governance and security feature set aimed at regulated industries (healthcare, finance, government)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Flexible self-hosted deployment via Docker, Kubernetes, or cloud marketplaces (DigitalOcean, AWS Marketplace)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Named enterprise customers including ExxonMobil, Deloitte, NIH, and Toyota per the vendor's site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Free open-source tier is limited to a single PostgreSQL connector$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Paid plans start at $1,500/month (Essential), billed annually$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Full connector list (Oracle, Snowflake, DB2) is reserved for the top Enterprise tier$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Dedicated support is a separate paid add-on, ranging from $500 to $7,000/month$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Is DreamFactory free?$q$, $q$There is a free open-source tier for learning and early-stage projects, limited to a PostgreSQL connector. Paid plans start at $1,500/month for broader connector access and features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$What does DreamFactory's paid pricing look like?$q$, $q$Essential is $1,500/month, Professional is $4,000/month (both billed annually), and Enterprise is custom-priced per vCPU, starting at 4 vCPUs.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Which databases does DreamFactory connect to?$q$, $q$It supports 30+ connectors covering SQL and NoSQL databases, cloud data warehouses, SaaS platforms, and legacy systems like DB2 and SOAP.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Can DreamFactory be self-hosted?$q$, $q$Yes, it supports on-premises, private cloud, edge, and hybrid deployment via Docker and Kubernetes installers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Governed AI/LLM data access$q$, $q$Provide LLMs and AI agents with policy-controlled REST/MCP access to enterprise data without direct database exposure.$q$, $q$AI platform and data governance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Legacy system modernization$q$, $q$Expose legacy databases and systems (e.g. DB2, SOAP) as modern REST APIs.$q$, $q$Enterprise IT teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Regulated-industry API compliance$q$, $q$Meet governance, audit, and access-control requirements for healthcare, finance, and government data.$q$, $q$Compliance and platform engineering teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Open Source$q$, $q$Free$q$, NULL, $q$["PostgreSQL connector only","Self-hosted (DigitalOcean, AWS Marketplace)"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Essential$q$, $q$$1,500/month$q$, $q$annual$q$, $q$["Single database connector of choice","Unlimited roles, API keys, and requests"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Professional$q$, $q$$4,000/month$q$, $q$annual$q$, $q$["All connectors except Oracle, Snowflake, DB2","RBAC, API scripting, authentication, rate limiting"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$Enterprise$q$, $q$Custom (from $1,500 per vCPU, 4 vCPU minimum)$q$, $q$annual$q$, $q$["All connectors including Oracle, Snowflake, DB2","Docker/Kubernetes deployment","Full governance and logging"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$overview$q$, $q$What is DreamFactory?$q$, 2, ARRAY[$q$DreamFactory is a self-hosted API gateway that auto-generates governed REST and MCP API access to enterprise data sources, sitting between applications or AI workloads and backend databases. It supports over 30 connectors, spanning SQL and NoSQL databases, cloud warehouses, SaaS platforms, and legacy systems like DB2 and SOAP, with role-based access controls, field-level security, and audit trails.$q$, $q$A free open-source tier (limited to a PostgreSQL connector) is available for learning and early-stage projects, while paid Essential ($1,500/month), Professional ($4,000/month), and custom-priced Enterprise plans unlock more connectors, RBAC, scripting, and full governance features. Deployment options include Docker, Kubernetes, on-premises, and cloud marketplace installers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', $q$who-its-for$q$, $q$Who DreamFactory is for$q$, 2, ARRAY[$q$DreamFactory targets enterprises and regulated industries — healthcare, financial services, government, manufacturing — that need governed, auditable API access to a wide range of databases and legacy systems, including for AI/LLM data access.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad6e6869-5d9c-4229-9644-9d7ac6a8d7e2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Kong ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Kong is an API and AI connectivity platform built around the open-source Kong Gateway, plus the paid Kong Konnect cloud platform and AI Gateway.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2009,
  company_size = NULL,
  headquarters = $q$San Francisco, California, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Kong provides the open-source Kong Gateway plus the paid Konnect cloud platform for managing API and AI/LLM traffic, security, and governance.$q$,
  og_description = $q$Kong provides the open-source Kong Gateway plus the paid Konnect cloud platform for managing API and AI/LLM traffic, security, and governance.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '739a3d06-32a8-47ca-88cb-0b897c628ff9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '739a3d06-32a8-47ca-88cb-0b897c628ff9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Kong Gateway$q$, $q$Open-source API gateway for managing, securing, and routing API traffic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Kong Konnect$q$, $q$Unified paid SaaS platform for API and AI management, including a service catalog, developer portal, and usage-based billing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Kong AI Gateway$q$, $q$Purpose-built for managing AI/LLM traffic and agent orchestration, including token budgeting, semantic caching, and context window management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Kong Event Gateway$q$, $q$Real-time event management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Kong Mesh$q$, $q$Service mesh for microservices environments.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Kong Insomnia$q$, $q$API testing and development tool, sold separately with its own pricing tiers.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Core Kong Gateway is free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Konnect offers a 30-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Used by large enterprises including United Airlines, HSBC, BMW, Wayfair, and PayPal per the vendor's site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Covers API gateway, AI/LLM traffic management, event streaming, and service mesh under one product family$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Founded in 2009, making Kong Gateway one of the longest-established open-source API gateways$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Konnect's Plus tier is usage-based per gateway plus $200/month per additional 1M requests, which can be hard to predict at scale$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Enterprise tier requires a custom annual contract and sales contact$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Full feature set is spread across several separate products (Gateway, Konnect, AI Gateway, Mesh, Insomnia) rather than one bundle$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Is Kong Gateway free?$q$, $q$Yes, Kong Gateway is open source and free to self-host. Kong Konnect, the managed cloud platform, is a separate paid product with a 30-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$What is Kong Konnect's pricing?$q$, $q$The Plus tier is charged per gateway/month with 1M API requests included and $200/month per additional 1M requests; Enterprise is custom-priced and billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Does Kong support AI/LLM traffic management?$q$, $q$Yes, Kong AI Gateway is purpose-built for managing AI/LLM traffic and agent orchestration, including token budgeting and semantic caching.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$When was Kong founded?$q$, $q$Kong was founded in 2009 and is headquartered in San Francisco, California.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Microservices API management$q$, $q$Manage, secure, and route traffic across microservices and Kubernetes environments.$q$, $q$Platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$AI/LLM traffic governance$q$, $q$Control cost, rate limits, and caching for LLM and agent traffic via Kong AI Gateway.$q$, $q$AI platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$API monetization$q$, $q$Publish and monetize APIs through Konnect's developer portal and usage-based billing.$q$, $q$API product teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Konnect Free Trial$q$, $q$$0 for 30 days$q$, NULL, $q$["No credit card required","Full platform access during trial"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Konnect Plus$q$, $q$Per gateway/month + $200/month per additional 1M requests$q$, $q$monthly$q$, $q$["Up to 5 Serverless Gateways, 2 Hybrid Gateways, 2 Dedicated Cloud Gateways","1M API requests/month included","Up to 2 Developer Portals with 20 published APIs","Email support (2-business-day SLA)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$Konnect Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["Unlimited gateways and portals","Custom API request limits with volume discounts","Self-hosted options","Dedicated account managers and professional services"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$overview$q$, $q$What is Kong?$q$, 2, ARRAY[$q$Kong, founded in 2009 and headquartered in San Francisco, provides connectivity infrastructure for APIs and AI systems. Its core product, Kong Gateway, is a widely used open-source API gateway for managing, securing, and routing traffic, while Kong Konnect is a paid, unified SaaS platform layered on top for API and AI management, including a service catalog, developer portal, and usage-based billing.$q$, $q$The broader product family includes Kong AI Gateway for managing LLM and agent traffic (token budgeting, semantic caching, context-window management), Kong Event Gateway for real-time event management, Kong Mesh for service mesh, and Kong Insomnia for API testing, each with its own pricing. Konnect offers a 30-day free trial with no credit card required, with paid tiers billed per gateway and per request beyond included volume.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', $q$who-its-for$q$, $q$Who Kong is for$q$, 2, ARRAY[$q$Kong fits platform engineering teams managing microservices and Kubernetes-native architectures, as well as teams that need to govern and control cost for AI/LLM and agent traffic, whether self-hosting the open-source gateway or using the managed Konnect platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('739a3d06-32a8-47ca-88cb-0b897c628ff9', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Tyk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Tyk is an independent API management platform built on an open-source gateway, supporting REST, GraphQL, gRPC, and async APIs plus AI/MCP governance.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = 2014,
  company_size = NULL,
  headquarters = $q$London, United Kingdom$q$,
  languages = '{}',
  seo_meta_description = $q$Tyk is an open-source API management platform for REST, GraphQL, gRPC, and AI/MCP traffic, deployable as Cloud, Hybrid, Self-managed, or Sovereign.$q$,
  og_description = $q$Tyk is an open-source API management platform for REST, GraphQL, gRPC, and AI/MCP traffic, deployable as Cloud, Hybrid, Self-managed, or Sovereign.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '89dff1be-8908-47b5-b669-4283360cd267';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '89dff1be-8908-47b5-b669-4283360cd267' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Multi-protocol API gateway$q$, $q$Manages REST, GraphQL, gRPC, and asynchronous APIs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Open-source AI governance$q$, $q$Token-aware rate limiting for LLM spending and unified audit trails, described by the vendor as the only open-source AI governance control plane on the market.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$MCP Gateway$q$, $q$Governs Model Context Protocol servers with per-tool rate limiting and filtered discovery.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Policy as Code$q$, $q$GitOps workflows for managing API governance policies.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Developer portal and API monetization$q$, $q$Publish and commercialize APIs through a built-in developer portal.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Multiple deployment models$q$, $q$Tyk Cloud (managed SaaS), Self-managed, Hybrid (cloud control plane with local data-plane gateways), and Sovereign (compliant regional deployment), all running the same codebase.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Core gateway is open source with no proprietary runtime, per the vendor$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Free self-hosted option plus a 48-hour Tyk Cloud free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Holds ISO 27001, SOC 2 Type II, PCI DSS, and ISO 9001 certifications$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Described as the first IMDA-accredited API management provider$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Deployment flexibility across cloud, hybrid, self-managed, and sovereign/regulated regions with identical feature parity$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Specific pricing isn't published — Core, Professional, and Enterprise tiers all require contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Free Tyk Cloud trial is limited to 48 hours$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Is Tyk open source?$q$, $q$Yes, the core Tyk API gateway is open source with no proprietary runtime, available via GitHub.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$What deployment options does Tyk offer?$q$, $q$Tyk Cloud (fully managed), Self-managed (on-premises/private cloud), Hybrid (cloud control plane with local gateways), and Sovereign (for regulated regions).$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Does Tyk support AI/LLM governance?$q$, $q$Yes, Tyk includes an open-source AI governance control plane with token-aware rate limiting for LLM spending and an MCP Gateway for governing Model Context Protocol servers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$When was Tyk founded?$q$, $q$Tyk was founded in 2014 and is headquartered in London, United Kingdom.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Regulated-industry API management$q$, $q$Manage APIs under compliance requirements for finance, government, and telecom.$q$, $q$Enterprise platform and compliance teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$AI/LLM and MCP governance$q$, $q$Rate-limit and audit LLM spend and MCP tool access.$q$, $q$AI platform teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Multi-region and sovereign deployments$q$, $q$Run identical Tyk deployments across cloud, hybrid, and sovereign regions.$q$, $q$Global enterprises with regional compliance needs$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Self-hosted API gateway","No proprietary runtime"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Core$q$, $q$Usage-based (custom)$q$, NULL, $q$["Cloud, Hybrid, or Self-managed deployment","Unlimited API gateways","Developer portal included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Professional$q$, $q$Flat-rate (custom)$q$, NULL, $q$["Unlimited API gateways","Unlimited APIs and requests/month","Enhanced success plan"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Multi-cloud, multi-region architecture","Premium support and named CSM","Guided proof-of-concept"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$overview$q$, $q$What is Tyk?$q$, 2, ARRAY[$q$Tyk, founded in 2014 and headquartered in London, is an API management platform built around an open-source gateway with no proprietary runtime. It manages REST, GraphQL, gRPC, and asynchronous APIs, and includes an open-source AI governance layer with token-aware rate limiting for LLM spend and an MCP Gateway for governing Model Context Protocol servers.$q$, $q$Tyk offers four deployment models — Cloud, Self-managed, Hybrid, and Sovereign — all running the same codebase with feature parity. Pricing runs from a free open-source self-hosted tier, through usage-based Core and flat-rate Professional plans, up to custom Enterprise contracts; a 48-hour free trial of Tyk Cloud is available with no credit card required. The company holds ISO 27001, SOC 2 Type II, PCI DSS, and ISO 9001 certifications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', $q$who-its-for$q$, $q$Who Tyk is for$q$, 2, ARRAY[$q$Tyk fits organizations — particularly in regulated industries like finance, government, and telecom — that need flexible API management deployment options (including sovereign/on-prem) and want an open-source gateway with paid governance and AI/MCP features layered on top.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('89dff1be-8908-47b5-b669-4283360cd267', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Gravitee ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gravitee is an API management platform with AI agent governance, event streaming security, and a developer portal.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$2,500/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gravitee: API management platform with AI agent governance, event streaming, and gateway plans from $2,500/month.$q$,
  og_description = $q$Gravitee: API management platform with AI agent governance, event streaming, and gateway plans from $2,500/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '64537204-ede8-4be9-b3b2-bb1a6ffab1aa';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '64537204-ede8-4be9-b3b2-bb1a6ffab1aa' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$AI Agent & MCP Governance$q$, $q$Secures and governs AI agents and Model Context Protocol (MCP) servers with identity/access control, LLM cost and rate limiting, and PII filtering.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Multi-Gateway API Management$q$, $q$Deploys API gateways across multiple brokers with observability, governance, and a self-service developer portal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Kafka & Event Stream Security$q$, $q$Exposes and secures Kafka streams with protocol mediation for event-driven architectures.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Open Source API Gateway$q$, $q$Includes an open-source API Gateway component alongside its commercial API management platform.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$API Observability$q$, $q$Provides API observability and governance tooling across gateway deployments.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Recognized as a Leader in the Gartner Magic Quadrant for API Management for two consecutive years$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Includes an open-source API Gateway option$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Covers API, event stream (Kafka), and AI agent/MCP governance in one platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Used by large enterprises including Walmart, BMW, Michelin, and Schneider Electric$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Entry-level API Management plan (Planet) starts at $2,500/month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Higher tiers (Galaxy, Universe) require custom/contact-sales pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$No free tier pricing disclosed for the full commercial platform beyond the OSS gateway$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Is Gravitee open source?$q$, $q$Gravitee offers an open-source API Gateway component in addition to its commercial API management, event management, and AI agent governance platform.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$How much does Gravitee cost?$q$, $q$Gravitee's API Management starts at $2,500/month for the Planet plan; Event Management starts at $1,250/month for the Comet plan. Higher tiers require custom pricing.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Does Gravitee support AI agent governance?$q$, $q$Yes, Gravitee includes AI Agent Management features such as MCP server governance, LLM cost/rate controls, and agent-to-agent traffic auditing.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$What does Gravitee do with event streams?$q$, $q$Gravitee can expose and secure Kafka streams with protocol mediation for event-driven architectures.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Enterprise API Management$q$, $q$Manage, secure, and observe APIs across gateways with a developer portal.$q$, $q$Platform and API teams at large enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$AI Agent Governance$q$, $q$Control identity, access, and cost for AI agents and MCP servers.$q$, $q$Teams deploying AI agents and LLM-based systems$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Event Stream Security$q$, $q$Secure and mediate Kafka event streams across brokers.$q$, $q$Teams running event-driven architectures$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Planet$q$, $q$$2,500/month$q$, $q$monthly$q$, $q$["Unlimited users and APIs","1 production gateway","Gold support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Galaxy$q$, $q$Custom$q$, NULL, $q$["Unlimited users and APIs","2 production gateways","Enterprise plugins","Gold support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Universe$q$, $q$Custom$q$, NULL, $q$["4+ production gateways","All supported event brokers","Identity and Access Management","24/7 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$Comet (Event Management)$q$, $q$$1,250/month$q$, $q$monthly$q$, $q$["1 production gateway","1 third-party federated broker","Developer portal","Gold support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$overview$q$, $q$What is Gravitee?$q$, 2, ARRAY[$q$Gravitee is an API and AI agent management platform that secures, governs, and controls APIs, event streams, and AI agents from a single system. It combines API gateway and management functionality with AI agent governance features such as MCP server control and LLM cost/rate limiting.$q$, $q$The platform includes an open-source API Gateway component alongside commercial API Management, Event Management, and Agent Management add-ons. Gravitee has been recognized as a Leader in the Gartner Magic Quadrant for API Management for two consecutive years and is used by enterprises including Walmart, BMW, Michelin, and Schneider Electric.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', $q$who-its-for$q$, $q$Who Gravitee is for$q$, 2, ARRAY[$q$Gravitee suits platform and API teams at mid-size to large enterprises that need to manage APIs, Kafka event streams, and AI agents/MCP servers under one governance model, and that can accommodate its enterprise-oriented pricing starting at $2,500/month.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('64537204-ede8-4be9-b3b2-bb1a6ffab1aa', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── KrakenD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$KrakenD is a high-performance, stateless open-source API gateway with a paid Enterprise Edition for SLAs and support.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Barcelona, Spain$q$,
  languages = '{}',
  seo_meta_description = $q$KrakenD: open-source, stateless API gateway handling 80K+ req/sec, with an Enterprise Edition offering SLAs and support.$q$,
  og_description = $q$KrakenD: open-source, stateless API gateway handling 80K+ req/sec, with an Enterprise Edition offering SLAs and support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '27e34a6d-64ed-4d82-bdf3-3bc216000871';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '27e34a6d-64ed-4d82-bdf3-3bc216000871' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$API Aggregation$q$, $q$Combines multiple backend responses into a single API response.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Traffic Management$q$, $q$Provides rate limiting, circuit breakers, bot detection, and IP filtering.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Authentication & Security$q$, $q$Supports JWT, OAuth2, OpenID, API keys, mTLS, and Basic Auth.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Multi-Protocol Support$q$, $q$Works with REST, GraphQL, gRPC, RabbitMQ, Kafka, SNS, SQS, and Lambda.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$AI Gateway Capabilities$q$, $q$Adds LLM routing, prompt guardrails, token budgets, and an MCP server.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Observability$q$, $q$Exports logs, metrics, and traces via OpenTelemetry.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$GitOps-Ready Configuration$q$, $q$Version-controlled, single-binary configuration deployable via GitOps workflows.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Community Edition is free and open source, distributed as a single binary$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Handles 80K+ requests/second on commodity hardware per vendor benchmarks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Broad protocol and authentication support (REST, GraphQL, gRPC, JWT, OAuth2, mTLS)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$SOC 2 Type II certified$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Stateless architecture avoids the need for a database or external state store$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Enterprise Edition pricing is not published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$24/7 support and SLAs are limited to the paid Enterprise Edition$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Is KrakenD free?$q$, $q$Yes, the KrakenD Community Edition is free and open source. A paid Enterprise Edition adds SLAs, 24/7 support, and additional governance features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$What protocols does KrakenD support?$q$, $q$KrakenD supports REST, GraphQL, gRPC, and messaging systems including RabbitMQ, Kafka, SNS, SQS, and AWS Lambda.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Does KrakenD require a database?$q$, $q$No, KrakenD is a stateless gateway distributed as a single binary with no external state store required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Where is KrakenD based?$q$, $q$KrakenD is made by KRAKEND S.L.U., based in Barcelona, Spain.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Microservices API Aggregation$q$, $q$Aggregate multiple microservice responses into a single API call.$q$, $q$Backend and platform engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$AI/LLM Gateway$q$, $q$Route and govern LLM traffic with prompt guardrails and token budgets.$q$, $q$Teams exposing AI/LLM endpoints$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Enterprise API Gateway$q$, $q$Deploy a production-grade gateway with SLA-backed support.$q$, $q$Enterprises needing certified, supported infrastructure$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Community Edition$q$, $q$Free$q$, NULL, $q$["Single binary deployment","80K+ requests/second capability","Open source"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$Enterprise Edition$q$, $q$Custom$q$, NULL, $q$["24/7 support and SLAs","Enhanced security and governance tools","Unlimited requests and APIs","Flat pricing, no hidden costs"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$overview$q$, $q$What is KrakenD?$q$, 2, ARRAY[$q$KrakenD is a high-performance, stateless API gateway used to connect, secure, aggregate, transform, and filter data across microservices and AI workloads. It ships as a single binary with no runtime dependencies and is built by KRAKEND S.L.U. in Barcelona, Spain.$q$, $q$The open-source Community Edition is free to use and can reportedly handle over 80,000 requests per second on commodity hardware. A paid Enterprise Edition adds SLA-backed support, advanced governance, and unlimited requests/APIs at flat pricing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', $q$who-its-for$q$, $q$Who KrakenD is for$q$, 2, ARRAY[$q$KrakenD fits backend and platform teams building microservice or AI/LLM architectures that need a fast, stateless gateway, and organizations that want the option to move from a free open-source edition to a supported enterprise deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27e34a6d-64ed-4d82-bdf3-3bc216000871', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Traefik Hub ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Traefik Hub is a Kubernetes-native API management platform from Traefik Labs, built on open-source Traefik Proxy.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Traefik Hub: Kubernetes-native API management platform with GitOps workflows, built on open-source Traefik Proxy.$q$,
  og_description = $q$Traefik Hub: Kubernetes-native API management platform with GitOps workflows, built on open-source Traefik Proxy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea6717b3-d173-4853-b8b4-beb2d3f1c1e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea6717b3-d173-4853-b8b4-beb2d3f1c1e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Kubernetes-Native Architecture$q$, $q$Auto-discovery, Helm charts, and Kubernetes Gateway API support for cloud-native deployments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$GitOps Configuration$q$, $q$Declarative API management via Kubernetes Custom Resource Definitions (CRDs).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$API Governance$q$, $q$API inventory management, versioning, and policy enforcement across API groups.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Security & IAM$q$, $q$Granular access control with IAM integrations (Keycloak, Okta, Azure Entra ID), TLS management, and a native Web Application Firewall.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Observability$q$, $q$OpenTelemetry integration plus third-party monitoring support (e.g., Treblle).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Developer Portal$q$, $q$Self-service API discovery, interactive testing, and credential management for API consumers.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$CI/CD Integration$q$, $q$Linters, rollback capabilities, and change-impact analysis in CI/CD pipelines.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Built on Traefik Proxy, an open-source project with roughly 50,000 GitHub stars and 3.5+ billion downloads$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Kubernetes-native with GitOps-based configuration via CRDs$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Integrates with common IAM providers (Keycloak, Okta, Azure Entra ID)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Used by organizations including NASA, Siemens, Dell, eBay, and Expedia$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Free trial available to evaluate before purchasing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Pricing for the API Gateway and API Management tiers is not published; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Full API management capabilities require a paid tier above the free, open-source Traefik Proxy$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Kubernetes-native design assumes a Kubernetes-based infrastructure$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Is Traefik Hub free?$q$, $q$Traefik Hub offers a free trial; full pricing for its API Gateway and API Management tiers requires contacting Traefik Labs' sales team. The underlying Traefik Proxy is free and open source.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$What is Traefik Hub built on?$q$, $q$Traefik Hub is built on Traefik Proxy, Traefik Labs' open-source reverse proxy and ingress controller.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$What IAM providers does Traefik Hub support?$q$, $q$Traefik Hub integrates with IAM providers including Keycloak, Okta, and Azure Entra ID.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Does Traefik Hub support GitOps?$q$, $q$Yes, it uses Kubernetes Custom Resource Definitions (CRDs) for declarative, GitOps-based API configuration.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Kubernetes API Gateway$q$, $q$Manage and secure APIs running on Kubernetes with native CRDs.$q$, $q$Platform engineering and DevOps teams on Kubernetes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$API Governance at Scale$q$, $q$Enforce versioning and policy across many APIs with an inventory and developer portal.$q$, $q$API platform teams at larger organizations$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$Application Proxy$q$, $q$Free$q$, NULL, $q$["Open source ingress controller / reverse proxy","Services auto-discovery","HTTP/2, HTTP/3, TCP, UDP, gRPC support","Dashboard and plugin support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$API Gateway$q$, $q$Custom$q$, NULL, $q$["Everything in Application Proxy","AI Gateway add-on","MCP Gateway add-on","Native Web Application Firewall","Advanced security controls (LDAP, JWT, OAuth, OIDC)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$API Management$q$, $q$Custom$q$, NULL, $q$["Everything in API Gateway","API mocking and request validation","Developer portal","API discovery and versioning"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$overview$q$, $q$What is Traefik Hub?$q$, 2, ARRAY[$q$Traefik Hub is a Kubernetes-native API management platform from Traefik Labs, built on top of the open-source Traefik Proxy. It lets platform and DevOps teams manage APIs declaratively through Kubernetes Custom Resource Definitions instead of manual UI configuration.$q$, $q$The product sits above Traefik Labs' free, open-source Application Proxy tier, adding an API Gateway layer (WAF, advanced auth, AI/MCP gateway add-ons) and a full API Management layer (developer portal, API mocking, versioning, governance). Traefik Proxy itself has around 50,000 GitHub stars and over 3.5 billion downloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', $q$who-its-for$q$, $q$Who Traefik Hub is for$q$, 2, ARRAY[$q$Traefik Hub is aimed at platform engineering and DevOps teams running APIs on Kubernetes who want GitOps-based governance, IAM integration, and a developer portal, and who are willing to work with custom, sales-quoted pricing above the free Traefik Proxy tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea6717b3-d173-4853-b8b4-beb2d3f1c1e0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Hurl ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Hurl is a free, open-source Rust-based command-line tool for running and testing HTTP requests from plain text files.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hurl: free, open-source Rust CLI for running and testing HTTP requests defined in plain text, with CI/CD reporting.$q$,
  og_description = $q$Hurl: free, open-source Rust CLI for running and testing HTTP requests defined in plain text, with CI/CD reporting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5db80a47-34dc-4c07-9969-53321dbed91e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5db80a47-34dc-4c07-9969-53321dbed91e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Plain-Text Request Format$q$, $q$Defines HTTP requests and expected responses in a simple, readable plain-text syntax.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Request Chaining$q$, $q$Runs multiple HTTP requests sequentially, capturing and reusing data between them.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Response Assertions$q$, $q$Validates responses using XPath, JSONPath, status codes, headers, and SSL certificate checks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Multi-API Support$q$, $q$Works with REST, GraphQL, SOAP, and other XML/JSON-based APIs.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$CI/CD Reporting$q$, $q$Generates text, JUnit, TAP, and HTML test reports for pipeline integration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Single Binary, No Dependencies$q$, $q$Distributed as a lightweight Rust binary powered by libcurl, with no runtime dependencies.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Free and open source under the Apache-2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Around 19,000 GitHub stars, indicating an active user community$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Single-binary distribution with no runtime dependencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Supports HTTP/3 and IPv6 via libcurl$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Actively maintained with frequent releases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Command-line/plain-text workflow has a learning curve compared to GUI API clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$No official hosted/cloud service; usage is limited to local or CI execution$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Is Hurl free?$q$, $q$Yes, Hurl is free, open-source software licensed under Apache-2.0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$What is Hurl written in?$q$, $q$Hurl is written in Rust and uses libcurl for HTTP handling, making it fast and dependency-free.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Can Hurl test GraphQL and SOAP APIs?$q$, $q$Yes, in addition to REST, Hurl supports GraphQL, SOAP, and other XML/JSON-based APIs.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Does Hurl integrate with CI/CD?$q$, $q$Yes, Hurl can generate text, JUnit, TAP, and HTML reports for CI/CD pipelines.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$API Smoke Testing$q$, $q$Chain and assert HTTP requests to verify API behavior in CI pipelines.$q$, $q$Developers and QA engineers testing REST/GraphQL APIs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$HTTP Scripting$q$, $q$Script sequences of HTTP requests with data capture between steps, replacing ad hoc curl scripts.$q$, $q$Backend engineers and DevOps$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Full CLI functionality","No usage limits","Apache-2.0 licensed"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$overview$q$, $q$What is Hurl?$q$, 2, ARRAY[$q$Hurl is a free, open-source command-line tool developed by the Orange-OpenSource team for running HTTP requests defined in a simple plain-text format. Built in Rust and powered by libcurl, it ships as a single binary with no runtime dependencies and supports HTTP/3 and IPv6.$q$, $q$Beyond firing individual requests, Hurl can chain multiple requests together, capture data from one response for use in the next, and assert on status codes, headers, and body content using XPath or JSONPath. It has around 19,000 stars on GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', $q$who-its-for$q$, $q$Who Hurl is for$q$, 2, ARRAY[$q$Hurl suits developers and QA engineers who want a lightweight, scriptable way to test REST, GraphQL, or SOAP APIs from the command line or CI/CD pipelines, without adopting a full GUI API client.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5db80a47-34dc-4c07-9969-53321dbed91e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Schemathesis ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Schemathesis is an open-source, property-based API testing tool that generates tests from OpenAPI and GraphQL schemas.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Schemathesis: open-source property-based testing tool that auto-generates API tests from OpenAPI and GraphQL schemas.$q$,
  og_description = $q$Schemathesis: open-source property-based testing tool that auto-generates API tests from OpenAPI and GraphQL schemas.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5da7c24e-f64f-46b1-a907-d8b6683f3c73';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5da7c24e-f64f-46b1-a907-d8b6683f3c73' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Property-Based Testing$q$, $q$Uses Hypothesis to automatically generate diverse test cases from API schemas.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Schema Validation$q$, $q$Checks that API responses conform to the OpenAPI specification.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Schema-Aware Fuzzing$q$, $q$Generates inputs based on declared data types and constraints to find edge cases.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$CI/CD Integration$q$, $q$Integrates with GitHub Actions, GitLab CI, and pytest.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Reproducible Failures$q$, $q$Produces minimal reproduction cases and equivalent curl commands for each failure.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Broad Schema Support$q$, $q$Supports OpenAPI 2.0, 3.0, 3.1, and GraphQL schemas.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Extensible via Python Hooks$q$, $q$Allows custom hooks and configuration for tailored test generation.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Open source and free to use$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Research presented at ICSE 2022 found it detected 1.4x-4.5x more defects than other tools tested$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Used by engineers at companies including Netflix, SAP, Red Hat, IBM, and JetBrains$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Supports both OpenAPI and GraphQL schemas$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Paid cloud add-ons (Workbench, TraceCov) don't have public pricing on the main site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Primarily a Python-ecosystem tool, which may require Python familiarity$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Is Schemathesis free?$q$, $q$Yes, the core Schemathesis tool is free and open source. The company also offers paid cloud add-ons, Workbench and TraceCov.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$What schema formats does Schemathesis support?$q$, $q$Schemathesis supports OpenAPI 2.0, 3.0, and 3.1, as well as GraphQL schemas.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$How does Schemathesis generate test cases?$q$, $q$It uses property-based testing powered by Hypothesis to automatically generate and fuzz test inputs based on your API schema.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Does Schemathesis integrate with CI/CD?$q$, $q$Yes, it integrates with GitHub Actions, GitLab CI, and pytest.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Automated API Test Generation$q$, $q$Generate test cases directly from an OpenAPI or GraphQL schema without hand-writing test scripts.$q$, $q$Backend developers and QA engineers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$API Fuzzing in CI$q$, $q$Run schema-aware fuzz tests in CI/CD pipelines to catch validation bugs before release.$q$, $q$Engineering teams practicing continuous testing$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$Open Source$q$, $q$Free$q$, NULL, $q$["Full CLI and library functionality","OpenAPI 2.0/3.0/3.1 and GraphQL support","Python hooks and CI integration"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$overview$q$, $q$What is Schemathesis?$q$, 2, ARRAY[$q$Schemathesis is an open-source API testing tool that uses property-based testing to automatically generate test cases from OpenAPI and GraphQL schemas, rather than requiring hand-written test scripts. It's built on the Hypothesis testing library and is written in Python.$q$, $q$Published research presented at ICSE 2022 found that Schemathesis detected 1.4x to 4.5x more defects than other tools when testing real-world APIs. The project is used by engineers at companies including Netflix, SAP, Red Hat, IBM, and JetBrains, and the company behind it also offers paid cloud products, Workbench and TraceCov, for continuous API testing and schema coverage analysis.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', $q$who-its-for$q$, $q$Who Schemathesis is for$q$, 2, ARRAY[$q$Schemathesis suits backend developers and QA engineers who maintain OpenAPI or GraphQL APIs and want automated, schema-driven test generation integrated into CI/CD, without manually writing individual test cases.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5da7c24e-f64f-46b1-a907-d8b6683f3c73', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Convoy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Convoy is an open-source and cloud webhooks gateway for sending, receiving, and managing webhook events reliably.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$999/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$San Francisco, CA, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Convoy: open-source and cloud webhooks gateway for reliable delivery, retries, and security. Self-hosted plans from $999/month.$q$,
  og_description = $q$Convoy: open-source and cloud webhooks gateway for reliable delivery, retries, and security. Self-hosted plans from $999/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'eb460c74-dce8-4856-9dc3-61f824bd3a75';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'eb460c74-dce8-4856-9dc3-61f824bd3a75' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Incoming & Outgoing Webhooks$q$, $q$Manages both receiving and sending of webhook events through a single gateway.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Automatic Retries$q$, $q$Retries failed webhook deliveries automatically for reliability.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Payload Signing & Verification$q$, $q$Signs payloads and supports rolling secrets for endpoint security.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$SSRF Protection$q$, $q$Includes SSRF attack prevention and payload inspection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Convoy Playground$q$, $q$Generates test webhook URLs and analyzes payloads for debugging.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Control/Data Plane Architecture$q$, $q$Uses a control and data plane design backed by PostgreSQL for high availability.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Message Broker Support$q$, $q$Supports message broker-backed event delivery.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Free, open-source Community edition available for self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Around 2,800 GitHub stars$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$14-day free trial for both self-hosted Premium and Cloud options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$SOC 2 and GDPR compliant with SSO/SAML support on higher tiers$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Built-in SSRF protection and payload signing for webhook security$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Community edition lacks portal links, RBAC, and priority support (Premium-only)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Premium self-hosted plan costs $999/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Enterprise and Cloud pricing require contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Open-source code is licensed under Elastic License v2.0 rather than a fully permissive license$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Is Convoy free?$q$, $q$Yes, Convoy's Community edition is free and open source for self-hosting. Paid Premium ($999/month) and Enterprise tiers add features like RBAC, SSO, and priority support.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Does Convoy offer a cloud version?$q$, $q$Yes, Convoy Cloud is a managed offering with a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$What license is Convoy under?$q$, $q$Convoy's open-source code is licensed under the Elastic License v2.0.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Where is Convoy based?$q$, $q$Convoy is based in San Francisco, California.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Outgoing Webhook Delivery$q$, $q$Reliably send webhook events to customer endpoints with retries and signing.$q$, $q$SaaS platforms sending webhooks to customers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Webhook Ingestion Gateway$q$, $q$Receive and inspect incoming webhooks with SSRF protection.$q$, $q$Engineering teams consuming third-party webhooks$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Self-Hosted Event Infrastructure$q$, $q$Run webhook infrastructure on your own infrastructure for compliance needs.$q$, $q$Fintech, healthcare, and other regulated companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Community$q$, $q$Free$q$, NULL, $q$["Self-hosted gateway","Incoming/outgoing webhooks","Automatic retries","Message broker support","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Premium$q$, $q$$999/month$q$, $q$monthly$q$, $q$["Everything in Community","Portal links","JS webhook transformation","OpenTelemetry export","Role-based access control","Priority support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Premium","SAML SSO","Dedicated support with SLA","On-premises deployment support","SOC 2 compliance support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$overview$q$, $q$What is Convoy?$q$, 2, ARRAY[$q$Convoy is a webhooks gateway for sending, receiving, and managing webhook events reliably. It's available as a free, open-source Community edition for self-hosting, a managed Convoy Cloud service, and paid self-hosted Premium and Enterprise tiers.$q$, $q$The platform includes automatic retries, payload signing with rolling secrets, SSRF attack prevention, and a control/data plane architecture backed by PostgreSQL. Convoy is based in San Francisco and reports SOC 2 and GDPR compliance on its higher tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', $q$who-its-for$q$, $q$Who Convoy is for$q$, 2, ARRAY[$q$Convoy fits engineering teams that need reliable webhook infrastructure, whether self-hosting the free Community edition, paying $999/month for the Premium self-hosted tier, or using the managed Convoy Cloud, including regulated industries like fintech and healthcare that need on-premises deployment options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('eb460c74-dce8-4856-9dc3-61f824bd3a75', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Novu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Novu is an open-source notification infrastructure platform for multi-channel workflows across email, SMS, push, and chat.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$30/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Novu: open-source notification platform for multi-channel workflows (email, SMS, push, chat). Free tier plus plans from $30/month.$q$,
  og_description = $q$Novu: open-source notification platform for multi-channel workflows (email, SMS, push, chat). Free tier plus plans from $30/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '555aaf18-6846-4042-ba95-cc4fd3189aec';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '555aaf18-6846-4042-ba95-cc4fd3189aec' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Multi-Channel Delivery$q$, $q$Sends notifications across 9+ channels including email, in-app inbox, SMS, push, and chat apps like Slack and Microsoft Teams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Workflow Orchestration$q$, $q$Coordinates multi-step, multi-channel notification workflows through a unified API.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Digest Engine$q$, $q$Consolidates multiple alerts into a single digest message.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Prebuilt Inbox Component$q$, $q$Drops a notification inbox UI into an app with minimal code.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Block-Based Email Editor$q$, $q$Provides a React Email-powered visual editor for building notification templates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$User Preference Management$q$, $q$Lets end users manage channel preferences and snooze messages.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Framework Integrations$q$, $q$Integrates with providers such as Twilio, Resend, Clerk, and Stripe.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Open source with an MIT-licensed core (open-core model) and roughly 39,000 GitHub stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Generous free tier: 10,000 workflow runs/month forever$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Supports 9+ notification channels from one API$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Self-hosted deployment available on the Enterprise plan$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$US and EU data residency options$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Paid plans start at $30/month once usage exceeds the free tier's 10,000 workflow runs$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Removing Novu branding requires the paid Pro plan or higher$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Enterprise features (self-hosting, HIPAA BAA, dedicated SSO) require custom Enterprise pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Is Novu free?$q$, $q$Yes, Novu's Free plan includes 10,000 workflow runs per month at no cost, forever. Paid plans start at $30/month for additional usage and features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Is Novu open source?$q$, $q$Yes, Novu's core is open source under the MIT license, with additional enterprise features under a commercial license.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Can Novu be self-hosted?$q$, $q$Self-hosted deployment is available on Novu's Enterprise plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$What channels does Novu support?$q$, $q$Novu supports email, in-app inbox, SMS, push notifications, and chat channels including Slack and Microsoft Teams.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Product Notification Infrastructure$q$, $q$Add multi-channel notifications (email, in-app, push, SMS) to a product without building channel integrations from scratch.$q$, $q$Product and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Alert Digesting$q$, $q$Consolidate high-frequency alerts into digest notifications to reduce noise.$q$, $q$Teams sending frequent transactional or system alerts$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10,000 workflow runs/month","All channels","Up to 20 workflows","2 environments","24-hour activity feed retention","Up to 3 team members"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Pro$q$, $q$$30/month$q$, $q$monthly$q$, $q$["30,000+ workflow runs/month","7-day activity feed retention","Remove Novu branding","Advanced email editor"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Team$q$, $q$$250/month$q$, $q$monthly$q$, $q$["250,000+ workflow runs/month","Up to 10 environments","90-day activity feed retention","Unlimited team members","RBAC"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["10M+ workflow runs/month","Unlimited environments","HIPAA BAA compliance","Dedicated SSO (SAML/OIDC)","Self-hosted deployment"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$overview$q$, $q$What is Novu?$q$, 2, ARRAY[$q$Novu is an open-source notification infrastructure platform that lets developers build multi-channel notification workflows for web and mobile apps through a unified API. It supports email, in-app inbox, SMS, push notifications, and chat channels like Slack and Microsoft Teams.$q$, $q$Novu follows an open-core model: its core code is MIT-licensed and open source (around 39,000 GitHub stars), while enterprise features are covered by a commercial license. The Free plan includes 10,000 workflow runs per month forever, with paid Pro, Team, and Enterprise plans for higher volume and additional features like self-hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', $q$who-its-for$q$, $q$Who Novu is for$q$, 2, ARRAY[$q$Novu suits product and engineering teams that need to add multi-channel notifications to an application without building and maintaining separate integrations for each channel provider, from early-stage teams on the free tier to larger organizations needing self-hosted or enterprise deployments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('555aaf18-6846-4042-ba95-cc4fd3189aec', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Knock ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Knock is a customer messaging infrastructure platform for cross-channel notifications, workflows, and preferences.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$250/month$q$,
  founded_year = NULL,
  company_size = $q$11-50 employees$q$,
  headquarters = $q$New York, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Knock: messaging infrastructure for cross-channel notifications with a free Developer plan and paid plans from $250/month.$q$,
  og_description = $q$Knock: messaging infrastructure for cross-channel notifications with a free Developer plan and paid plans from $250/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '146cfaaf-aaff-451e-bc9c-ee8099f69750';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '146cfaaf-aaff-451e-bc9c-ee8099f69750' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Multi-Channel Delivery$q$, $q$Sends messages via email, SMS, push, chat, and in-app notifications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$AI-Native Workflow Builder$q$, $q$Builds messaging workflows using natural-language prompts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Data Unification$q$, $q$Ingests real-time data from warehouses, CDPs, reverse ETL tools, and webhooks.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Dynamic Segmentation$q$, $q$Builds audience segments from attributes, events, and relationships.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$AI-Powered Personalization$q$, $q$Generates tailored email content matching brand layouts.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Preference Centers$q$, $q$Gives end users control over channels and send windows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Developer Tooling$q$, $q$Provides a CLI, MCP server, and SDKs for Node, Python, Ruby, Go, Java, .NET, Elixir, and PHP.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Observability$q$, $q$Built-in debugging and log streaming for message delivery.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Free Developer plan includes 10K messages/month with unlimited workflows and team members$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$99.99% uptime guarantee$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$HIPAA, SOC2, GDPR, and CCPA compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Broad SDK support across 8 languages plus an MCP server$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Handles hundreds of millions of monthly messages per company claims$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Starter plan costs $250/month once free-tier usage limits are exceeded$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Enterprise pricing (volume/monthly active user based) requires contacting sales$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Branding removal and email client previews require the paid Starter plan or above$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Is Knock free?$q$, $q$Yes, Knock's Developer plan is free and includes 10,000 messages, 500 guide active users, and 500 AI agent credits per month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$How much does Knock cost beyond the free plan?$q$, $q$The Starter plan costs $250/month with usage-based overage pricing; Enterprise pricing is custom and volume-based.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Where is Knock based?$q$, $q$Knock is headquartered at 175 Varick St, New York, NY.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$What channels does Knock support?$q$, $q$Knock supports email, SMS, push notifications, chat, and in-app messaging.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Does Knock offer an AI workflow builder?$q$, $q$Yes, Knock includes an AI-native workflow builder that lets teams create messaging journeys using natural-language prompts.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Product & Transactional Notifications$q$, $q$Send cross-channel product and transactional messages without building channel infrastructure from scratch.$q$, $q$Product and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Marketing & Lifecycle Messaging$q$, $q$Segment audiences from unified customer data and trigger lifecycle messages.$q$, $q$Growth and marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Regulated-Industry Messaging$q$, $q$Send compliant notifications under HIPAA, SOC2, GDPR, and CCPA requirements.$q$, $q$Healthcare and other regulated companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Developer$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10K messages","500 guide active users","500 AI agent credits","Unlimited workflows and team members","Google SSO"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Starter$q$, $q$$250/month$q$, $q$monthly$q$, $q$["50K messages ($0.005/additional)","2.5K guide active users","2K AI agent credits","Branding removal","Email client previews"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Volume-based pricing with annual commit discounts","Per-customer branding","Data warehouse analytics","SCIM directory sync","SAML 2.0 SSO","HIPAA compliance"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$overview$q$, $q$What is Knock?$q$, 2, ARRAY[$q$Knock is a customer messaging infrastructure platform for product, marketing, and transactional communications. It unifies customer data from warehouses, CDPs, and webhooks to power cross-channel messaging across email, SMS, push, chat, and in-app notifications, including an AI-native workflow builder that lets teams build messaging journeys from natural-language prompts.$q$, $q$The company is headquartered in New York and reports 11-50 employees. It offers SDKs for eight languages plus an MCP server, and states HIPAA, SOC2, GDPR, and CCPA compliance with a 99.99% uptime guarantee.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', $q$who-its-for$q$, $q$Who Knock is for$q$, 2, ARRAY[$q$Knock fits product and engineering teams building cross-channel notification and messaging systems, from small teams on the free Developer plan to larger or regulated organizations that need enterprise compliance and volume-based pricing.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('146cfaaf-aaff-451e-bc9c-ee8099f69750', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Courier ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Courier is a multichannel notification API that lets developers send email, SMS, push, Slack, Teams, and in-app messages through one integration.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan (10,000 sends/month); Business plan pay-as-you-go from $0.005 per send$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Courier is a multichannel notification API for email, SMS, push, chat, and in-app messages, with journeys, templates, and a free 10K-send tier.$q$,
  og_description = $q$Courier is a multichannel notification API for email, SMS, push, chat, and in-app messages, with journeys, templates, and a free 10K-send tier.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '47573ceb-bc2e-4aa8-88aa-21c943d7431f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '47573ceb-bc2e-4aa8-88aa-21c943d7431f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Omnichannel routing$q$, $q$Send email, SMS, push, Slack, Microsoft Teams, and in-app notifications through a single API instead of integrating each provider separately.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Customer journeys$q$, $q$Multi-step automated workflows triggered by user actions or data events, with personalization and branching logic.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Visual design studio$q$, $q$No-code template editor for building and previewing notification content across channels.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Notification inbox$q$, $q$Embeddable in-app notification center component for adding a bell/inbox UI to a product.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Preference center$q$, $q$Built-in user preference management so recipients can control which notifications and channels they receive.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$50+ provider integrations$q$, $q$Pre-built integrations with providers such as SendGrid, Twilio, Firebase Cloud Messaging, and Apple Push Notification service.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Delivery observability$q$, $q$End-to-end delivery tracking and engagement analytics for every notification sent.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Multi-tenant support$q$, $q$Tenant-level routing and configuration for SaaS platforms serving multiple customers from one account.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Single API covers email, SMS, push, chat, and in-app channels instead of juggling separate provider SDKs$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Free tier includes 10,000 sends per month with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Visual, no-code template and journey builders reduce engineering time for notification changes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Detailed delivery logs and analytics for debugging notification issues$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Cited in production use by companies such as Twilio and Nav in Courier's published case studies$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Usage-based Business plan pricing ($0.005/send) can scale unpredictably at high volume$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Enterprise features like SSO, RBAC, and EU data residency require custom/Enterprise pricing$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Requires integrating your own downstream provider accounts (e.g., Twilio, SendGrid) for many channels$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Does Courier have a free plan?$q$, $q$Yes, the Developer plan is free and includes 10,000 sends per month with access to journeys, broadcasts, and SDKs.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$What channels does Courier support?$q$, $q$Courier routes notifications across email, SMS, push notifications, Slack, Microsoft Teams, and in-app messaging.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$How is paid usage billed?$q$, $q$The Business plan is pay-as-you-go at $0.005 per send, on top of the features included in the free Developer plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Can I build a notification inbox with Courier?$q$, $q$Yes, Courier provides an embeddable notification center/inbox component for in-app notifications.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Product notification infrastructure$q$, $q$Replace custom-built email/SMS/push integrations with a single API and template layer.$q$, $q$Engineering teams building product notifications$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Customer engagement journeys$q$, $q$Trigger multi-step, personalized messaging sequences based on user behavior or backend events.$q$, $q$Growth and lifecycle marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$In-app notification center$q$, $q$Add a bell-icon notification inbox to a web or mobile app using Courier's prebuilt component.$q$, $q$Product teams adding in-app alerts$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Developer$q$, $q$Free$q$, $q$monthly$q$, $q$["10,000 sends/month","Journeys & broadcasts","MCP server, CLI & SDKs","SSO via Google and GitHub","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Business$q$, $q$$0.005 per send$q$, NULL, $q$["All Developer features","Pay-as-you-go pricing","AI translations","AI Agent node","Email & chat support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Volume pricing","Dedicated Slack channel","Observability integrations","Role-based access control","Enterprise SLA","EU data residency"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$overview$q$, $q$What is Courier?$q$, 2, ARRAY[$q$Courier is a notification infrastructure platform that gives developers a single API to send messages across email, SMS, push, Slack, Microsoft Teams, and in-app channels, instead of integrating each provider individually.$q$, $q$The platform includes a visual template editor, multi-step customer journeys, a notification preference center, and delivery observability, plus a free tier for smaller-volume senders.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', $q$who-its-for$q$, $q$Who Courier is for$q$, 2, ARRAY[$q$Courier is aimed at engineering and product teams that need to send transactional or lifecycle notifications across multiple channels and want centralized templates, routing, and delivery tracking rather than building that infrastructure in-house.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('47573ceb-bc2e-4aa8-88aa-21c943d7431f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── SuprSend ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SuprSend is a notification infrastructure API for building email, SMS, push, WhatsApp, Slack, and in-app notification workflows from one platform.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan (10,000 notifications/month); paid plans from $110/month ($100/month billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SuprSend is an omnichannel notification API with workflows, in-app inbox, and batching, offering a free 10K/month tier and paid plans from $110/month.$q$,
  og_description = $q$SuprSend is an omnichannel notification API with workflows, in-app inbox, and batching, offering a free 10K/month tier and paid plans from $110/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a57f6aeb-72fe-474e-8368-01db35053063';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a57f6aeb-72fe-474e-8368-01db35053063' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Workflows$q$, $q$No-code workflow builder for constructing notification logic, with AI assistance for building flows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Templates$q$, $q$WYSIWYG, multi-channel template editor with versioning and A/B testing support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Smart channel routing$q$, $q$Automatically routes notifications to the best channel to help reduce user fatigue.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Batching & digest$q$, $q$Aggregates multiple events into a single digested notification instead of sending each one separately.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$In-app inbox$q$, $q$Socket-based, embeddable in-app notification center.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Preferences center$q$, $q$Granular per-channel opt-in/opt-out controls for end users.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Multi-tenancy$q$, $q$Per-tenant customization and routing for SaaS platforms, available on the Enterprise plan.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$MCP server support$q$, $q$Native MCP server integration for connecting AI assistants such as Claude, Cursor, and Windsurf to notification workflows.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Free plan includes 10,000 notifications/month across unlimited channels with unlimited team members$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Supports a wide channel set including WhatsApp, Slack, and Microsoft Teams alongside email/SMS/push$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Enterprise plan offers self-hosted and Bring Your Own Cloud deployment options for compliance-sensitive teams$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$SOC 2 Type 2 and HIPAA compliance stated for enterprise customers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$In-app feed carries SuprSend branding until the Essentials plan or higher$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Batching/digest and user preferences are gated behind the Business plan, not included in Free or Essentials$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Per-notification overage pricing ($2-$5 per 1,000) can add up for high-volume senders$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Is there a free plan?$q$, $q$Yes, SuprSend's Free plan includes 10,000 notifications per month with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$What channels does SuprSend support?$q$, $q$Email, SMS, mobile push, web push, WhatsApp, Slack, Microsoft Teams, and an in-app inbox.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Can SuprSend be self-hosted?$q$, $q$The Enterprise plan offers self-hosted and Bring Your Own Cloud deployment options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Does SuprSend support AI workflows?$q$, $q$Yes, it offers an Agent Node for AI-driven runtime decisions and MCP server support for AI assistants like Claude and Cursor.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Multi-channel product notifications$q$, $q$Send transactional and product notifications across email, push, and in-app channels from a single workflow.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Notification digesting$q$, $q$Batch multiple triggered events into a single digest to reduce notification fatigue.$q$, $q$Product and growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Enterprise self-hosted messaging$q$, $q$Deploy SuprSend in a private cloud or self-hosted environment to meet compliance requirements.$q$, $q$Enterprise and regulated companies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["10,000 notifications/month","Unlimited channels","In-app feed (SuprSend branded)","Branching & conditions","Lists & broadcasts","Unlimited team members"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Essentials$q$, $q$$110/month ($100/month billed annually)$q$, $q$monthly$q$, $q$["Everything in Free","In-app feed with branding removed","Internationalization support","Send in recipient's timezone"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Business$q$, $q$$275/month ($250/month billed annually)$q$, $q$monthly$q$, $q$["Everything in Essentials","Batching & digest","User preferences","Data modeling for objects","Sync logs to Segment or data warehouse"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Everything in Business","Multi-tenant data modeling","Audit trail","RBAC","SAML SSO","HIPAA/BAA","Self-hosted / Bring Your Own Cloud"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$overview$q$, $q$What is SuprSend?$q$, 2, ARRAY[$q$SuprSend is a notification infrastructure platform that provides a unified API, workflow builder, and in-app inbox for sending product and marketing notifications across email, SMS, push, WhatsApp, Slack, and Microsoft Teams.$q$, $q$It includes features such as batching/digest, timezone-aware sending, user preference centers, and MCP server support for connecting AI assistants to notification workflows.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', $q$who-its-for$q$, $q$Who SuprSend is for$q$, 2, ARRAY[$q$SuprSend targets engineering and product teams that need to unify product and marketing notification sending across many channels, including teams with compliance needs that require self-hosted or Bring Your Own Cloud deployment.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a57f6aeb-72fe-474e-8368-01db35053063', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── MagicBell ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MagicBell is a notification API and inbox component for sending email, push, web push, SMS, and Slack messages with a free 1,000-delivery tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan (1,000 deliveries/month); paid plans from $249/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MagicBell is a multichannel notification API with a prebuilt inbox and delivery tracking, offering a free 1,000-delivery/month tier and plans from $249/mo.$q$,
  og_description = $q$MagicBell is a multichannel notification API with a prebuilt inbox and delivery tracking, offering a free 1,000-delivery/month tier and plans from $249/mo.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '683c4752-3d3c-49ed-8578-cbba9f8507d3';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '683c4752-3d3c-49ed-8578-cbba9f8507d3' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Unified notification API$q$, $q$Single API to send mobile push, web push, email, SMS, and Slack notifications.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Notification inbox component$q$, $q$Prebuilt, embeddable in-app notification center UI.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Delivery tracking$q$, $q$Full delivery event logging with raw payload inspection for debugging.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Preference management$q$, $q$Built-in user notification preference controls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Smart Delivery / fallback rules$q$, $q$Configurable channel prioritization and fallback rules if a notification fails on one channel.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Broad provider integrations$q$, $q$Integrates with APNs, FCM, Expo, Twilio, SendGrid, Mailgun, Amazon SES, SMTP, Slack, and Microsoft Teams.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Free Builder plan includes 1,000 deliveries/month with access to all integrations and unlimited team members$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Prebuilt notification inbox component speeds up adding in-app notifications to a product$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Detailed delivery logs with raw payload inspection aid debugging$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$States over 1 billion notifications delivered and 99.99% uptime across 10,000+ active projects$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Startup plan jumps to $249/month for 50,000 deliveries, a large step up from the free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Additional projects beyond the included 5 cost $99 each on the Startup plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Deliveries are counted per channel, so a single multi-channel notification counts as multiple deliveries$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Does MagicBell have a free plan?$q$, $q$Yes, the Builder plan is free and includes 1,000 deliveries per month with access to all integrations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$What channels does MagicBell support?$q$, $q$Mobile push, web push, email, SMS, Slack, and Microsoft Teams, plus an in-app notification inbox.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$How are deliveries counted?$q$, $q$A delivery is counted per channel, so one notification sent to multiple channels counts as multiple deliveries.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$What does the Startup plan include?$q$, $q$50,000 deliveries per month for $249/month, with $0.0025 per additional delivery and 5 projects included.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$In-app notification inbox$q$, $q$Add a prebuilt bell-icon notification center to a web or mobile app.$q$, $q$Product teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Multichannel delivery with fallback$q$, $q$Send notifications with configured fallback rules across push, email, and SMS if one channel fails.$q$, $q$Engineering teams$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Builder$q$, $q$$0/month$q$, $q$monthly$q$, $q$["All integrations","1,000 deliveries/month","1 project","Smart Delivery","Unlimited team members and users"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Startup$q$, $q$$249/month$q$, $q$monthly$q$, $q$["All Builder features","50,000 deliveries/month","$0.0025 per additional delivery","5 projects ($99 each additional)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited deliveries and projects","Integration support","Invoice billing","Security review"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$overview$q$, $q$What is MagicBell?$q$, 2, ARRAY[$q$MagicBell is a notification infrastructure service that lets developers send mobile push, web push, email, SMS, and Slack notifications through a single API and manage them with a prebuilt notification inbox component.$q$, $q$It provides delivery tracking, user preference management, and channel fallback rules, with a free tier covering 1,000 deliveries per month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', $q$who-its-for$q$, $q$Who MagicBell is for$q$, 2, ARRAY[$q$MagicBell is built for product and engineering teams that want to add a multichannel notification system and in-app inbox to their application without building the delivery and preference infrastructure themselves.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('683c4752-3d3c-49ed-8578-cbba9f8507d3', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Engagespot ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Engagespot is a notification infrastructure API offering unified email, SMS, push, Slack, Discord and WhatsApp messaging with a free 10,000-trigger tier.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free plan (10,000 event triggers/month); paid plans from $250/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Engagespot is a notification API with an in-app inbox, workflow builder, and broad SDK support, offering a free 10K-trigger tier and plans from $250/mo.$q$,
  og_description = $q$Engagespot is a notification API with an in-app inbox, workflow builder, and broad SDK support, offering a free 10K-trigger tier and plans from $250/mo.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '128a81ea-1a14-4c1e-9cd9-5cad1207d02b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '128a81ea-1a14-4c1e-9cd9-5cad1207d02b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Unified notification API$q$, $q$Single API for email, SMS, push, webhooks, Slack, Discord, and WhatsApp.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$In-app notification inbox$q$, $q$Prebuilt, customizable notification inbox UI components.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Template editor$q$, $q$Editor for managing multi-channel notification content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Workflow builder$q$, $q$Visual builder for multi-step notification logic.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Preference management$q$, $q$User-level preference controls for channels and notification types.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$CLI for deployments$q$, $q$Command-line tool for version-controlling and deploying notification templates and workflows to production.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Broad SDK coverage$q$, $q$SDKs for React, Angular, Vue, Flutter, React Native, Node.js, Laravel, Symfony, Go, and Rust.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Free Launch plan includes 10,000 event triggers/month with unlimited channels and workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Broad SDK support across major frontend, mobile, and backend frameworks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Enterprise plan offers private cloud or on-premises deployment for compliance needs$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$States 850M+ notifications delivered and 3.7B+ API requests handled monthly at 99.98% uptime$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Engagespot branding remains on the notification inbox until the Growth plan or higher$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Growth plan starts at $250/month, a significant jump from the free tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Enterprise pricing starts at $2,500/month for custom SLAs and dedicated support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Does Engagespot have a free plan?$q$, $q$Yes, the Launch plan is free forever and includes 10,000 event triggers per month with unlimited channels and workflows.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$What channels does Engagespot support?$q$, $q$In-app, email, web push, mobile push, SMS, Slack, Discord, WhatsApp, and webhooks.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Can Engagespot be deployed on-premises?$q$, $q$The Enterprise plan offers private cloud or on-premises deployment options.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$What frameworks does Engagespot have SDKs for?$q$, $q$React, Angular, Vue, Flutter, React Native, Node.js, Laravel, Symfony, Go, and Rust.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Multi-channel product notifications$q$, $q$Send in-app, email, push, and messaging-app notifications from a single workflow using framework-specific SDKs.$q$, $q$Developers across web and mobile stacks$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Enterprise on-premises notifications$q$, $q$Run Engagespot in a private cloud or on-premises for organizations with strict data residency needs.$q$, $q$Large enterprises$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Launch$q$, $q$Free$q$, $q$monthly$q$, $q$["10,000 event triggers/month","Unlimited channels","Unlimited workflows","2-way notifications","US/EU region","Multi-tenancy","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Growth$q$, $q$$250/month$q$, $q$monthly$q$, $q$["250,000 event triggers/month","$1.50 per 1,000 additional triggers","Branding removed","Multi-lingual templates","Priority email and chat support","Unlimited environments"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$Enterprise$q$, $q$Starting at $2,500/month$q$, $q$monthly$q$, $q$["Custom volume pricing","24/7 priority support","Dedicated solutions architect","Datawarehouse and observability integrations","SSO/SAML","SOC 2 and HIPAA compliance","Private cloud or on-premises deployment"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$overview$q$, $q$What is Engagespot?$q$, 2, ARRAY[$q$Engagespot is a notification infrastructure platform giving developers a unified API and prebuilt in-app inbox for sending notifications across email, SMS, push, Slack, Discord, and WhatsApp.$q$, $q$It offers a workflow builder, template editor, and SDKs for major web and mobile frameworks, plus a free tier of 10,000 event triggers per month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', $q$who-its-for$q$, $q$Who Engagespot is for$q$, 2, ARRAY[$q$Engagespot is aimed at development teams that need a multi-channel notification system with framework-specific SDKs, and at larger organizations that need on-premises or private-cloud deployment for compliance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('128a81ea-1a14-4c1e-9cd9-5cad1207d02b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Gotify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Gotify is a free, open-source, self-hosted server for sending and receiving push messages via REST API and WebSocket, with an Android app.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Gotify is an open-source, self-hosted push notification server (MIT license) with a REST API, WebSocket delivery, web UI, and Android app.$q$,
  og_description = $q$Gotify is an open-source, self-hosted push notification server (MIT license) with a REST API, WebSocket delivery, web UI, and Android app.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '36781d6b-14d7-4e2f-b591-0f378b601761';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '36781d6b-14d7-4e2f-b591-0f378b601761' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$REST API messaging$q$, $q$Send messages to the server via a simple REST API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$WebSocket delivery$q$, $q$Clients receive messages in real time over WebSocket connections.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$User/app/client management$q$, $q$Admin controls for managing users, client devices, and registered applications.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Web UI$q$, $q$Built-in web interface for server administration and message management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Android client$q$, $q$Dedicated Android app available on Google Play and F-Droid for receiving push notifications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Plugin support$q$, $q$Server is extensible via plugins.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$CLI tool$q$, $q$Command-line client for pushing messages, in addition to using any HTTP client.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Fully free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Lightweight, self-hosted alternative to commercial push notification services$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Simple REST API makes it easy to integrate with scripts and other tools$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Available as an Android app via both Google Play and F-Droid$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$No official iOS or desktop client mentioned$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Requires self-hosting and server maintenance since there's no managed cloud option$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Feature set is intentionally minimal compared to full-featured notification platforms$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Is Gotify free?$q$, $q$Yes, Gotify is fully open source under the MIT license and free to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$How do I send messages with Gotify?$q$, $q$Messages are sent via a REST API call to your self-hosted server.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Does Gotify have a mobile app?$q$, $q$Yes, an Android client is available on Google Play and F-Droid.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Is there a hosted version of Gotify?$q$, $q$No, Gotify is self-hosted only; there is no official managed cloud service.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Self-hosted alerting for scripts and servers$q$, $q$Send push alerts from cron jobs, monitoring scripts, or CI pipelines to a phone or desktop.$q$, $q$Homelab users and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$Lightweight app notification backend$q$, $q$Run a self-hosted message server for small apps needing simple push notifications.$q$, $q$Developers wanting a self-hosted alternative to commercial push services$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$overview$q$, $q$What is Gotify?$q$, 2, ARRAY[$q$Gotify is an open-source, self-hosted server for sending and receiving messages in real time. Applications and scripts push messages to the server via a REST API, and connected clients receive them instantly over WebSocket.$q$, $q$It includes a web UI for administering users, applications, and clients, plus a native Android app, and is released under the MIT license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', $q$who-its-for$q$, $q$Who Gotify is for$q$, 2, ARRAY[$q$Gotify suits developers, sysadmins, and homelab users who want a simple, self-hosted push notification server for scripts, monitoring tools, and small applications without relying on a third-party service.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('36781d6b-14d7-4e2f-b591-0f378b601761', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── ntfy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$ntfy is an open-source HTTP pub-sub notification service, usable free on the hosted ntfy.sh or self-hosted, with paid plans for higher limits.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free hosted tier available; paid plans from $5/month billed annually ($6/month monthly)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ntfy is an open-source pub-sub push notification service via HTTP, free on ntfy.sh or self-hosted, with paid plans from $5/month for higher limits.$q$,
  og_description = $q$ntfy is an open-source pub-sub push notification service via HTTP, free on ntfy.sh or self-hosted, with paid plans from $5/month for higher limits.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '65e976a6-18cc-449b-b109-b26bbd870c7c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '65e976a6-18cc-449b-b109-b26bbd870c7c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$HTTP pub-sub messaging$q$, $q$Send notifications by making a simple PUT/POST HTTP request to a topic URL; no signup required.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Dynamic topics$q$, $q$Topics are created on the fly just by publishing or subscribing to a URL path.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Rich message options$q$, $q$Support for priorities, action buttons, tags/emojis, and file attachments such as images, video, and documents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Multi-platform apps$q$, $q$Native apps for iOS and Android, plus a web app and CLI support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Self-hostable server$q$, $q$Open-source server that can be self-hosted instead of using the public ntfy.sh service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Third-party integrations$q$, $q$Used with tools such as GitHub Actions, Home Assistant, Sonarr, and Radarr for alerting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Free to use on the public ntfy.sh service without signup or fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Fully open source (dual Apache 2.0 / GPLv2 licensed) and self-hostable$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Native iOS, Android, web, and CLI clients$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Simple integration via plain HTTP requests, compatible with curl and most scripting languages$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Free-tier topics act like public passwords and aren't reserved, so anyone who guesses the topic name can subscribe or publish$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Paid plans are required to reserve topic names or increase daily message/attachment limits$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Business plan tops out at 50,000 daily messages before requiring a custom arrangement$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Is ntfy free?$q$, $q$Yes, ntfy.sh can be used for free without signing up, and the server software is free and open source to self-host.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$What are ntfy's paid plans?$q$, $q$Supporter ($5-6/mo), Pro ($10-12/mo), and Business ($20-25/mo) plans add reserved topics, higher message limits, and larger attachments.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Can I self-host ntfy?$q$, $q$Yes, the ntfy server is open source (Apache 2.0 / GPLv2) and documented for self-hosting.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$What platforms does ntfy support?$q$, $q$iOS, Android, web browsers, and any HTTP client such as curl.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Script and server alerting$q$, $q$Send notifications from shell scripts, cron jobs, or CI/CD pipelines using a single HTTP request.$q$, $q$Developers and sysadmins$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Home automation alerts$q$, $q$Integrate with tools like Home Assistant, Sonarr, or Radarr to push status alerts to a phone.$q$, $q$Self-hosters and homelab users$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Self-hosted push notifications$q$, $q$Run a private ntfy server for internal tooling without depending on a third-party service.$q$, $q$Privacy-conscious teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Free$q$, $q$$0$q$, NULL, $q$["Unreserved topics on ntfy.sh","No signup required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Supporter$q$, $q$$6/month ($5/month billed annually)$q$, $q$monthly$q$, $q$["2,500 daily messages","3 reserved topics","3 phone calls","50 daily emails","25 MB per attachment"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Pro$q$, $q$$12/month ($10/month billed annually)$q$, $q$monthly$q$, $q$["20,000 daily messages","10 reserved topics","20 phone calls","250 daily emails","250 MB per attachment","Email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$Business$q$, $q$$25/month ($20/month billed annually)$q$, $q$monthly$q$, $q$["50,000 daily messages","50 reserved topics","50 phone calls","500 daily emails","1 GB per attachment","Email & chat support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$overview$q$, $q$What is ntfy?$q$, 2, ARRAY[$q$ntfy is an open-source, HTTP-based publish-subscribe notification service. Users publish messages by sending a PUT or POST request to a topic URL, and any subscriber to that topic receives the notification instantly.$q$, $q$It's free to use on the public ntfy.sh service without signup, dual-licensed under Apache 2.0 and GPLv2, and can be self-hosted; paid Supporter, Pro, and Business plans add reserved topic names and higher limits.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', $q$who-its-for$q$, $q$Who ntfy is for$q$, 2, ARRAY[$q$ntfy is built for developers, sysadmins, and homelab users who want to send push notifications from scripts, servers, or home automation tools without building notification infrastructure from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('65e976a6-18cc-449b-b109-b26bbd870c7c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Listmonk ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Listmonk is a free, open-source, self-hosted newsletter and mailing list manager delivered as a single Go binary with a Postgres backend.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Listmonk is a free, open-source, self-hosted email newsletter and mailing list manager built as a single Go binary, requiring PostgreSQL.$q$,
  og_description = $q$Listmonk is a free, open-source, self-hosted email newsletter and mailing list manager built as a single Go binary, requiring PostgreSQL.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '84142957-2683-4f6e-9088-2169508d193b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '84142957-2683-4f6e-9088-2169508d193b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Single-binary deployment$q$, $q$Ships as a single Go binary (or Docker image) with no external runtime dependencies beyond PostgreSQL.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$High-throughput sending$q$, $q$Multi-threaded SMTP queues with rate limiting designed to handle mailing lists with millions of subscribers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Campaign analytics$q$, $q$Built-in tracking for opens, clicks, bounces, and link performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Visual and template-based email builder$q$, $q$Drag-and-drop visual builder alongside Go-template-based dynamic email templating.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Transactional API$q$, $q$API for sending one-off transactional messages in addition to bulk campaigns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Extensible messengers$q$, $q$HTTP webhook-based messenger interfaces for extending delivery to channels beyond email.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$OIDC SSO$q$, $q$Single sign-on support for admin authentication.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Completely free and open source (AGPLv3) with no paid tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Single binary is simple to deploy and self-host$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Designed to scale to millions of subscribers with multi-threaded sending queues$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Built-in analytics reduce the need for separate tracking tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Requires self-hosting and a PostgreSQL database; no official managed cloud version from the maintainers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$No built-in SMTP sending service — you must supply your own SMTP/mail provider$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$AGPLv3 license may impose obligations for organizations building derivative hosted services$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Is Listmonk free?$q$, $q$Yes, it's fully open source under the AGPLv3 license with no paid tier.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$What database does Listmonk require?$q$, $q$PostgreSQL.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Can Listmonk send transactional emails?$q$, $q$Yes, it includes a transactional messaging API in addition to bulk campaigns.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Is there a hosted version of Listmonk?$q$, $q$The core project is self-hosted, though third-party hosts like Railway and Northflank offer one-click deployments.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Self-hosted newsletter sending$q$, $q$Run your own mailing list infrastructure instead of paying per-subscriber SaaS fees.$q$, $q$Publishers and newsletter operators$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$Large-scale opt-in mailing lists$q$, $q$Manage and send to mailing lists with millions of subscribers using multi-threaded SMTP queues.$q$, $q$High-volume senders$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$overview$q$, $q$What is Listmonk?$q$, 2, ARRAY[$q$Listmonk is a self-hosted, open-source newsletter and mailing list manager distributed as a single Go binary that requires only a PostgreSQL database to run.$q$, $q$It supports high-throughput multi-threaded email sending, built-in campaign analytics, drag-and-drop and template-based email building, and a transactional messaging API, all under the AGPLv3 license.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('84142957-2683-4f6e-9088-2169508d193b', $q$who-its-for$q$, $q$Who Listmonk is for$q$, 2, ARRAY[$q$Listmonk is aimed at developers, publishers, and organizations that want to run their own newsletter infrastructure rather than pay per-subscriber SaaS pricing, and that are comfortable self-hosting a Go binary with PostgreSQL.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84142957-2683-4f6e-9088-2169508d193b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84142957-2683-4f6e-9088-2169508d193b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84142957-2683-4f6e-9088-2169508d193b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('84142957-2683-4f6e-9088-2169508d193b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mautic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mautic is an open-source marketing automation platform for email, landing pages, and lead nurturing, self-hostable for free or available as managed hosting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (self-hosted community edition); official managed hosting via Dropsolid from €247.50/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mautic is a free, open-source marketing automation platform for email, landing pages, and lead nurturing, self-hostable or available as managed hosting.$q$,
  og_description = $q$Mautic is a free, open-source marketing automation platform for email, landing pages, and lead nurturing, self-hostable or available as managed hosting.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '780f67bf-33b3-43f7-9cf1-e78a31b9f50f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Campaign builder$q$, $q$Drag-and-drop visual campaign builder for multi-step marketing automation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Email & landing page builder$q$, $q$Mobile-optimized email and landing page builder.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Lead scoring & nurturing$q$, $q$Score and segment leads based on behavior and data for nurture campaigns.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Omnichannel messaging$q$, $q$Supports email, SMS, WhatsApp, and notification channels.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$REST API$q$, $q$Full REST API for integrations with other systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Plugin ecosystem$q$, $q$Extensible via a plugin and integration ecosystem.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Self-hosted data ownership$q$, $q$Runs on your own infrastructure, keeping campaign and contact data under your control.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Core software is free and open source, with no vendor lock-in$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Self-hosting gives full control and ownership of marketing data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Supports multi-channel campaigns (email, SMS, WhatsApp) beyond just email$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Large community, described as used by 200,000+ companies with 40,000+ companies participating in the community$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Official managed/cloud hosting (via partner Dropsolid) starts at €247.50/month, a significant cost versus self-hosting$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Self-hosted deployments require you to manage servers, updates, and email deliverability yourself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Higher-volume managed plans (Professional at €1,237/month) are priced for larger organizations, not solo users$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Is Mautic free?$q$, $q$The core Mautic software is free and open source; official managed hosting plans are paid.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Can I self-host Mautic?$q$, $q$Yes, self-hosting on your own infrastructure is a primary supported deployment method.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$What channels does Mautic support?$q$, $q$Email, SMS, WhatsApp, and other notification channels alongside landing pages.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Is there official managed hosting?$q$, $q$Yes, Managed Mautic is offered through the partner Dropsolid, starting at €247.50/month billed annually.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Self-hosted marketing automation$q$, $q$Run lead nurturing, email campaigns, and landing pages on your own infrastructure without SaaS fees.$q$, $q$Privacy-focused marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Multi-channel lead nurturing$q$, $q$Score and segment leads, then nurture them across email, SMS, and WhatsApp.$q$, $q$Marketing and growth teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Managed marketing automation$q$, $q$Use officially managed Mautic hosting instead of self-hosting for teams that want a hands-off deployment.$q$, $q$Mid-size to enterprise marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Community Edition (self-hosted)$q$, $q$Free$q$, NULL, $q$["Open source","Self-hosted","Full feature access","No vendor lock-in"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Mautic Essential (Managed, via Dropsolid)$q$, $q$€247.50/month billed annually (€275/month quarterly)$q$, $q$monthly$q$, $q$["Shared hosting","Up to 50K emails/month","Up to 50K contacts"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Mautic Professional (Managed, via Dropsolid)$q$, $q$Starting at €1,237/month$q$, $q$monthly$q$, $q$["Dedicated hosting","50K-3M emails/month","Dedicated support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$Mautic Enterprise (Managed, via Dropsolid)$q$, $q$Custom$q$, NULL, $q$["Dedicated infrastructure","Up to 6M emails/month","Enterprise security"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$overview$q$, $q$What is Mautic?$q$, 2, ARRAY[$q$Mautic is an open-source marketing automation platform for building campaigns, nurturing leads, and running email, landing page, and multi-channel marketing without vendor lock-in.$q$, $q$The core software is free to self-host, while officially managed Mautic hosting is available through the partner Dropsolid for teams that want a hands-off deployment.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', $q$who-its-for$q$, $q$Who Mautic is for$q$, 2, ARRAY[$q$Mautic suits marketing teams and developers who want an open-source, self-hostable alternative to commercial marketing automation SaaS, particularly those prioritizing data ownership and privacy.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('780f67bf-33b3-43f7-9cf1-e78a31b9f50f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Keila ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Keila is an open-source email newsletter platform, free to self-host (AGPLv3) or available as EU-hosted Keila Cloud starting at €8/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€8/month (Keila Cloud XS plan); free to self-host$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Keila is an open-source (AGPLv3) email newsletter platform, free to self-host or available as EU-hosted Keila Cloud from €8/month.$q$,
  og_description = $q$Keila is an open-source (AGPLv3) email newsletter platform, free to self-host or available as EU-hosted Keila Cloud from €8/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'c94c98e6-ef4f-4e3b-95b2-929dc548f9d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Visual & Markdown editors$q$, $q$Block-based visual editor, Markdown support, MJML customization, and plain-text sending.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Segmentation$q$, $q$Target contacts based on data and behavior.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Form builder$q$, $q$Customizable signup forms with bot protection, including captcha and double opt-in.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Personalization$q$, $q$Liquid templating language for dynamic, personalized content.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$API$q$, $q$REST API for integrations and workflow automation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Transactional email$q$, $q$Send one-off transactional messages via the API in addition to bulk campaigns.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Privacy-first analytics$q$, $q$Campaign analytics with the option to disable tracking entirely.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Fully open source (AGPLv3) with no proprietary premium-only features$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Free to self-host indefinitely via official Docker images$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila Cloud is hosted on EU (Germany/France) infrastructure for GDPR-focused users$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Tracking and analytics can be disabled for privacy-conscious senders$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila Cloud has no free plan — the cheapest hosted tier is €8/month for 2,000 emails$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Self-hosting requires running and maintaining your own Docker deployment$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Cloud pricing is in euros, which may add currency-conversion friction for non-EU customers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Is Keila free?$q$, $q$The self-hosted, open-source version is free (AGPLv3); the managed Keila Cloud service is paid, starting at €8/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Can I self-host Keila?$q$, $q$Yes, official Docker images are provided for self-hosting.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Where is Keila Cloud hosted?$q$, $q$On European infrastructure in Germany and France.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Does Keila support transactional email?$q$, $q$Yes, via its API in addition to bulk newsletter campaigns.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$EU-hosted newsletter sending$q$, $q$Send newsletters via Keila Cloud on EU infrastructure for GDPR-focused compliance.$q$, $q$European businesses and privacy-conscious senders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Self-hosted email newsletters$q$, $q$Run your own open-source newsletter platform via Docker instead of a SaaS subscription.$q$, $q$Developers and self-hosters$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila XS$q$, $q$€8/month$q$, $q$monthly$q$, $q$["2,000 emails/month","Unlimited contacts & projects","Flexible sending options"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila S$q$, $q$€16/month$q$, $q$monthly$q$, $q$["5,000 emails/month","Unlimited contacts & projects","Flexible sending options"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila M$q$, $q$€32/month$q$, $q$monthly$q$, $q$["15,000 emails/month","Unlimited contacts & projects","Flexible sending options"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila L$q$, $q$€64/month$q$, $q$monthly$q$, $q$["50,000 emails/month","Unlimited contacts & projects","Flexible sending options"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila XL$q$, $q$€128/month$q$, $q$monthly$q$, $q$["100,000 emails/month","Unlimited contacts & projects","Flexible sending options"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$Keila XXL$q$, $q$€256/month$q$, $q$monthly$q$, $q$["250,000 emails/month","Unlimited contacts & projects","Flexible sending options"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$overview$q$, $q$What is Keila?$q$, 2, ARRAY[$q$Keila is an open-source email newsletter platform released under the AGPLv3 license, offering visual and Markdown editors, contact segmentation, signup forms, and an API for transactional email.$q$, $q$It can be self-hosted for free via official Docker images, or used as Keila Cloud, a paid managed service hosted on European infrastructure, with tiers from €8/month.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', $q$who-its-for$q$, $q$Who Keila is for$q$, 2, ARRAY[$q$Keila is aimed at developers and businesses, particularly in Europe, who want an open-source or EU-hosted newsletter platform with privacy-focused analytics and no vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('c94c98e6-ef4f-4e3b-95b2-929dc548f9d9', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── Sendy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sendy is a self-hosted, single-domain email newsletter script sold for a $69 one-time fee, designed to send via Amazon SES for low per-email cost.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$69 one-time (per-domain license)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sendy is a self-hosted email newsletter script with a $69 one-time license per domain, sending through Amazon SES for roughly $1 per 10,000 emails.$q$,
  og_description = $q$Sendy is a self-hosted email newsletter script with a $69 one-time license per domain, sending through Amazon SES for roughly $1 per 10,000 emails.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '44d9699e-8d32-4e15-b625-c6a58b71f09e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '44d9699e-8d32-4e15-b625-c6a58b71f09e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Drag-and-drop editor$q$, $q$WYSIWYG drag-and-drop email builder with an HTML editing option.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Campaign reporting$q$, $q$Analytics on opens, clicks, bounces, and geographic location of recipients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$AI Assistant (add-on)$q$, $q$Optional paid AI add-on for generating newsletters, subject lines, and campaign insights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$List segmentation$q$, $q$Segment subscriber lists to target specific groups.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Autoresponders$q$, $q$Automated drip email sequences.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$White-labeled brands$q$, $q$Client account ('brand') management for agencies running multiple newsletters.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Amazon SES integration$q$, $q$Sends through Amazon SES, or SendGrid, Mailjet, and Elastic Email as alternatives, for roughly $1 per 10,000 emails.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Rules and webhooks$q$, $q$Automation triggers based on subscriber behavior.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$One-time $69 fee per domain instead of a recurring monthly SaaS subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Very low sending cost (about $1 per 10,000 emails) by routing through Amazon SES$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Includes agency-friendly white-labeled client account management$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Runs on standard PHP/MySQL hosting, similar to a WordPress install$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$License is per-domain, so multi-domain use requires additional $69 licenses$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Requires self-hosting on your own PHP/MySQL server and configuring Amazon SES yourself$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$AI Assistant is a separate paid add-on ($39-49), not included in the base license$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$No indication that the software is open source — it is a commercially licensed self-hosted script$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Is Sendy a subscription?$q$, $q$No, Sendy uses a one-time license fee ($69) per domain, with no recurring subscription.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$How does Sendy keep sending costs low?$q$, $q$It sends through Amazon SES, which costs roughly $1 per 10,000 emails.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$What do I need to run Sendy?$q$, $q$A standard web host with PHP and MySQL/MariaDB support.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Does Sendy include AI features?$q$, $q$An AI Assistant is available as a separate paid add-on, not included in the base license.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Low-cost self-hosted newsletters$q$, $q$Send high-volume newsletters at a fraction of typical SaaS per-subscriber pricing by self-hosting and using Amazon SES.$q$, $q$Bloggers, marketers, and small businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Agency newsletter management$q$, $q$Manage separate white-labeled client newsletter accounts from one Sendy installation.$q$, $q$Marketing agencies$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Sendy License$q$, $q$$69 one-time$q$, NULL, $q$["Self-hosted install on one domain","Drag-and-drop editor","Campaign reporting","Autoresponders","White-labeled brands"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$AI Assistant Add-on$q$, $q$$39 (discounted from $49)$q$, NULL, $q$["AI-generated newsletters and subject lines","Campaign insights"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$Installation Service$q$, $q$$79 one-time$q$, NULL, $q$["Sendy installed on your server by the Sendy team"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$overview$q$, $q$What is Sendy?$q$, 2, ARRAY[$q$Sendy is a self-hosted email newsletter application sold as a one-time $69 license per domain rather than a monthly subscription. It sends email through Amazon SES (or alternatives like SendGrid, Mailjet, and Elastic Email) to keep per-email costs low.$q$, $q$It includes a drag-and-drop editor, campaign reporting, autoresponders, list segmentation, and white-labeled client 'brand' accounts, and runs on standard PHP/MySQL web hosting.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', $q$who-its-for$q$, $q$Who Sendy is for$q$, 2, ARRAY[$q$Sendy is aimed at bloggers, marketers, and agencies who send large newsletter volumes and want to avoid recurring per-subscriber SaaS fees by self-hosting and paying Amazon SES sending costs directly.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('44d9699e-8d32-4e15-b625-c6a58b71f09e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Postal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Postal is an open-source, self-hosted mail delivery platform for sending and receiving transactional email, built as an alternative to SendGrid or Mailgun.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Postal is a free, open-source mail server for self-hosting SMTP relay and inbound email, released under the MIT license.$q$,
  og_description = $q$Postal is a free, open-source mail server for self-hosting SMTP relay and inbound email, released under the MIT license.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '23c53c70-2a21-4d74-b527-25a8f44a4362';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '23c53c70-2a21-4d74-b527-25a8f44a4362' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$SMTP relay and delivery$q$, $q$Send transactional and bulk email through your own infrastructure instead of a third-party ESP.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Inbound email handling$q$, $q$Receive and route incoming mail for connected domains.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Webhooks$q$, $q$Trigger events for message delivery, bounces, and other mail events for integration with other systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Web-based management UI$q$, $q$Administer mail servers, domains, and message queues from a browser.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Docker-based installation$q$, $q$Deploy Postal via Docker containers rather than a manual server build.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$MIT licensed$q$, $q$Fully open source and free for commercial and private use.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Self-hosted, giving full control over mail infrastructure and data$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Active project with 16.7k GitHub stars and regular releases (latest v3.3.7)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Webhooks support for integrating mail events into other systems$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Requires self-managed server infrastructure, Docker, and Ruby to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$No official first-party hosted/managed version$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Deliverability depends on the operator's own IP reputation and DNS setup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Is Postal free?$q$, $q$Yes, Postal is open source and released under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Does Postal offer a hosted version?$q$, $q$The official project is self-hosted via Docker; no first-party managed hosting is documented on the official site.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$What does Postal replace?$q$, $q$It's designed as a self-hosted alternative to commercial services like SendGrid or Mailgun.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Does Postal support webhooks?$q$, $q$Yes, it provides webhooks for mail delivery events.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Self-hosted transactional email$q$, $q$Run your own SMTP relay for application-generated email instead of paying a third-party ESP.$q$, $q$Developers and DevOps teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$Inbound email processing$q$, $q$Receive and route incoming mail programmatically via webhooks.$q$, $q$SaaS teams building email-driven workflows$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$overview$q$, $q$What is Postal?$q$, 2, ARRAY[$q$Postal is an open-source mail delivery platform that lets organizations run their own mail server for sending and receiving email, rather than relying on a commercial email service provider.$q$, $q$It is released under the MIT license, deployed via Docker, and built primarily with Ruby. The project has 16.7k GitHub stars and continues to ship regular releases, including v3.3.7.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', $q$who-its-for$q$, $q$Who Postal is for$q$, 2, ARRAY[$q$Postal suits developers and DevOps teams who want a self-hosted, MIT-licensed alternative to services like SendGrid or Mailgun and are comfortable managing their own mail infrastructure via Docker.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('23c53c70-2a21-4d74-b527-25a8f44a4362', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mailcow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mailcow is an open-source, Dockerized mail server suite combining Postfix, Rspamd, SOGo, and Nginx behind a web-based admin UI.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mailcow is a free, GPLv3-licensed Dockerized mail server suite with Postfix, Rspamd, and SOGo, plus optional paid professional support.$q$,
  og_description = $q$Mailcow is a free, GPLv3-licensed Dockerized mail server suite with Postfix, Rspamd, and SOGo, plus optional paid professional support.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Dockerized deployment$q$, $q$Runs via Docker and Docker Compose for reproducible installs.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Postfix mail transfer agent$q$, $q$Handles sending and receiving mail for connected domains.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Rspamd spam filtering$q$, $q$Built-in spam filtering engine included in the stack.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$SOGo groupware$q$, $q$Provides webmail, calendar, and address book functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Nginx web component$q$, $q$Serves the admin panel and webmail interfaces.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Web-based administration UI$q$, $q$Manage domains, mailboxes, and settings from a browser.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Free and open source (GPLv3)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Combines multiple mail components (MTA, spam filter, groupware, web server) into one managed stack$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Large, active community with 13.1k GitHub stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Optional paid professional support available via servercow.de$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Requires Docker/Docker Compose and a Debian-based host$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$DNS and SSL/TLS configuration must be handled by the operator$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$No official free hosted/cloud version, only self-hosting or paid professional support$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Is Mailcow free?$q$, $q$Yes, the core software is free and open source under the GPLv3 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$What components does Mailcow bundle?$q$, $q$Postfix, Rspamd, SOGo, and Nginx, orchestrated via Docker.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Is professional support available?$q$, $q$Yes, through The Infrastructure Company GmbH / servercow.de.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$What OS does Mailcow require?$q$, $q$A Debian-based system running Docker and Docker Compose.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Self-hosted business email$q$, $q$Run a full mail server stack with webmail and groupware for a company domain.$q$, $q$IT admins and self-hosting enthusiasts$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$Managed alternative via paid support$q$, $q$Get professional support for a Mailcow deployment without building an in-house team.$q$, $q$Small businesses without dedicated sysadmins$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$overview$q$, $q$What is Mailcow?$q$, 2, ARRAY[$q$Mailcow is an open-source, Dockerized mail server suite that bundles Postfix, Rspamd, SOGo, and Nginx into a single managed stack with a web-based admin UI.$q$, $q$It is licensed under GPLv3, has 13.1k GitHub stars, and offers optional paid professional support through servercow.de for teams that don't want to self-support.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', $q$who-its-for$q$, $q$Who Mailcow is for$q$, 2, ARRAY[$q$Mailcow is aimed at IT admins and self-hosting teams who want a complete, Docker-based mail and groupware stack on a Debian-based server, with the option to buy professional support instead of handling everything in-house.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f9d56d4e-fc0b-4b1a-9ea8-231bd20b02d4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Mailu ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mailu is a free, open-source mail server distributed as Docker images, covering IMAP, SMTP, webmail, and spam/anti-spoofing protection.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mailu is a free, MIT-licensed Docker-based mail server with IMAP, SMTP, webmail, DKIM/DMARC, and antivirus, deployable via Compose or Kubernetes.$q$,
  og_description = $q$Mailu is a free, MIT-licensed Docker-based mail server with IMAP, SMTP, webmail, DKIM/DMARC, and antivirus, deployable via Compose or Kubernetes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fcb91d77-94ad-4a0c-b605-9adaf3d6225f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fcb91d77-94ad-4a0c-b605-9adaf3d6225f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$IMAP, SMTP, and Submission$q$, $q$Standard mail protocols with auto-configuration for clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Full-text search and aliases$q$, $q$Supports full-text search plus custom email forwarding and aliases.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Enforced TLS, DANE, and MTA-STS$q$, $q$Security protocols with Let's Encrypt certificate support.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$DKIM signing and DMARC/SPF validation$q$, $q$Built-in email authentication and anti-spoofing protection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Antivirus scanning$q$, $q$Blocks malicious attachments and scans incoming mail.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Auto-learning anti-spam with greylisting$q$, $q$Reduces spam without manual rule maintenance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Web interfaces$q$, $q$Separate interfaces for end users and administrators.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Domain delegation and quotas$q$, $q$Global admin roles, per-domain delegation, and mailbox quotas.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Free, MIT-licensed, fully open-source components$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Supports both Docker Compose and Kubernetes deployment$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Built-in antivirus, DKIM/DMARC, and anti-spoofing security$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$7.4k GitHub stars with active development$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Requires operator-managed DNS, TLS certificates, and a database backend$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$No official managed/hosted offering$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Self-hosting requires ongoing maintenance and security patching$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Is Mailu free?$q$, $q$Yes, it's free software licensed under MIT.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$What deployment options does Mailu support?$q$, $q$Docker Compose and Kubernetes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Does Mailu include antivirus and spam filtering?$q$, $q$Yes, both are built in.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$What databases does Mailu support?$q$, $q$MySQL, MariaDB, or PostgreSQL, per the documentation.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Self-hosted mail infrastructure$q$, $q$Deploy a full-featured mail server via Docker Compose or Kubernetes.$q$, $q$DevOps teams and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$Privacy-focused email hosting$q$, $q$Run your own domain email with built-in DKIM, DMARC, and antivirus protections.$q$, $q$Privacy-conscious organizations$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$overview$q$, $q$What is Mailu?$q$, 2, ARRAY[$q$Mailu is a free, open-source mail server distributed as a set of Docker images, providing IMAP, SMTP, webmail, and security features like DKIM signing, DMARC/SPF validation, and antivirus scanning.$q$, $q$It is MIT licensed, has 7.4k GitHub stars, and can be deployed via Docker Compose or Kubernetes with MySQL, MariaDB, or PostgreSQL as the database backend.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', $q$who-its-for$q$, $q$Who Mailu is for$q$, 2, ARRAY[$q$Mailu fits DevOps teams and self-hosters who want a container-native, fully open-source mail server with strong built-in security defaults and no vendor lock-in.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcb91d77-94ad-4a0c-b605-9adaf3d6225f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Modoboa ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Modoboa is an open-source email server platform offering webmail, unlimited domains and mailboxes, and admin tools, installable in minutes.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Modoboa is a free, ISC-licensed open-source email server with webmail, calendars, and unlimited domains, powering 800,000+ mailboxes.$q$,
  og_description = $q$Modoboa is a free, ISC-licensed open-source email server with webmail, calendars, and unlimited domains, powering 800,000+ mailboxes.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ba61acd7-9961-41fb-a375-101e19f2f40e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ba61acd7-9961-41fb-a375-101e19f2f40e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Browser-based webmail$q$, $q$Access mail directly from a web browser.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Calendar and address book$q$, $q$Built-in calendar and contacts management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Filtering rules and auto-responder$q$, $q$Configure email filtering rules and out-of-office replies.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Unlimited domains and mailboxes$q$, $q$No software-imposed cap on domains, mailboxes, or aliases created.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Admin statistics and migration tools$q$, $q$Built-in tools for administrators to monitor usage and migrate data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Fast installer$q$, $q$The site states installation takes less than 10 minutes.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Free and open source (ISC license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Reports over 800,000 mailboxes deployed$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Fast installation process (claimed under 10 minutes)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Unlimited domains, mailboxes, and aliases with no software-imposed cap$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Hands-on professional support requires paid services$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Requires the operator to configure DNS after installation$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Self-hosted only; no official managed cloud version$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Is Modoboa free?$q$, $q$Yes, the core software is free and open source (ISC license).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$How long does installation take?$q$, $q$The site states installation takes less than 10 minutes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Is paid support available?$q$, $q$Yes, via Modoboa.com, with installation/upgrade services starting from €150 and issue resolution from €120.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$How many mailboxes does Modoboa power?$q$, $q$The site cites more than 800,000 mailboxes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Self-hosted email for organizations$q$, $q$Run unlimited domains and mailboxes on your own infrastructure with webmail included.$q$, $q$IT teams and self-hosters$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Assisted deployment via paid services$q$, $q$Use Modoboa's paid installation and maintenance services instead of self-managing setup.$q$, $q$Small businesses without in-house sysadmins$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Installation/Upgrade Service$q$, $q$From €150$q$, NULL, $q$["Professional installation or upgrade assistance"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$Issue Resolution Service$q$, $q$From €120$q$, NULL, $q$["Professional troubleshooting assistance"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$overview$q$, $q$What is Modoboa?$q$, 2, ARRAY[$q$Modoboa is an open-source email server platform that lets anyone install their own email server with webmail, calendars, and unlimited domains and mailboxes.$q$, $q$It is ISC licensed, has 3.5k GitHub stars, and the project's site claims more than 800,000 mailboxes are running on Modoboa deployments worldwide.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', $q$who-its-for$q$, $q$Who Modoboa is for$q$, 2, ARRAY[$q$Modoboa targets both technical self-hosters who want a fast, unlimited-mailbox installation and less technical users who can pay for Modoboa.com's professional installation, troubleshooting, and maintenance services.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ba61acd7-9961-41fb-a375-101e19f2f40e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Stalwart Mail Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Stalwart is a Rust-native, open-source mail and collaboration server supporting JMAP, IMAP, and SMTP, with a paid Enterprise edition.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€2.00/mailbox/year (Enterprise, 25-499 mailboxes)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Stalwart is an open-source (AGPL-3.0) Rust mail server with JMAP/IMAP/SMTP and CalDAV/CardDAV; Enterprise pricing starts at €2/mailbox/year.$q$,
  og_description = $q$Stalwart is an open-source (AGPL-3.0) Rust mail server with JMAP/IMAP/SMTP and CalDAV/CardDAV; Enterprise pricing starts at €2/mailbox/year.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'db5dc978-1f33-4ece-86f5-07c85e0d3438';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'db5dc978-1f33-4ece-86f5-07c85e0d3438' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$JMAP, IMAP, POP3, and SMTP$q$, $q$Supports multiple mail access and transfer protocols.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$CalDAV, CardDAV, and WebDAV$q$, $q$Built-in calendar, contacts, and file storage collaboration protocols.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Spam and phishing protection$q$, $q$Statistical filtering combined with AI-based analysis.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Encryption at rest$q$, $q$Supports S/MIME and OpenPGP for stored message encryption.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$DANE, MTA-STS, and automatic TLS$q$, $q$Transport security protocols configured automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Clustering$q$, $q$Scale the server across multiple nodes.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Pluggable storage backends$q$, $q$Supports RocksDB, PostgreSQL, S3, Azure Blob, and other backends.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Community edition is open source (AGPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Combines email, calendar, contacts, and file storage in one server$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Rust-native, with 13.7k GitHub stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise edition includes unlimited domains, tenants, mailing lists, and aliases at no extra cost$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise edition uses a proprietary license (Stalwart Enterprise License v2), not open source$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise pricing is per-mailbox and scales with deployment size$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Premium support is only included starting at 150+ mailboxes on Enterprise$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Is Stalwart free?$q$, $q$The Community edition is free and open source under AGPL-3.0; the Enterprise edition is paid.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$What does Enterprise pricing look like?$q$, $q$It's tiered per mailbox, starting at €2.00/mailbox/year for 25-499 mailboxes and dropping in price at higher tiers, with custom quotes above 100,000 mailboxes.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$What protocols does Stalwart support?$q$, $q$JMAP, IMAP, POP3, SMTP, plus CalDAV/CardDAV/WebDAV.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Can Stalwart cluster across nodes?$q$, $q$Yes, it supports clustering for scaling across multiple nodes.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Self-hosted email and collaboration$q$, $q$Run mail, calendar, and contacts on one Rust-based server using the open-source Community edition.$q$, $q$Self-hosters and developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise mail hosting at scale$q$, $q$Deploy the paid Enterprise edition for per-mailbox licensing with premium support at larger mailbox counts.$q$, $q$Organizations needing supported, scalable mail infrastructure$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Community$q$, $q$Free$q$, NULL, $q$["Open source (AGPL-3.0)","Self-hosted"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise (25-499 mailboxes)$q$, $q$€2.00/mailbox/year$q$, $q$annual$q$, $q$["Unlimited domains, tenants, mailing lists and aliases"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise (500-999 mailboxes)$q$, $q$€1.70/mailbox/year$q$, $q$annual$q$, $q$["Unlimited domains, tenants, mailing lists and aliases"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise (1,000-4,999 mailboxes)$q$, $q$€1.45/mailbox/year$q$, $q$annual$q$, $q$["Unlimited domains, tenants, mailing lists and aliases"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$Enterprise (100,000+ mailboxes)$q$, $q$Custom quote$q$, NULL, $q$["Custom enterprise pricing"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$overview$q$, $q$What is Stalwart Mail Server?$q$, 2, ARRAY[$q$Stalwart is a Rust-native mail and collaboration platform that combines email (JMAP/IMAP/POP3/SMTP), calendar and contacts (CalDAV/CardDAV), and file storage (WebDAV) in a single server.$q$, $q$The Community edition is open source under AGPL-3.0 with 13.7k GitHub stars, while an Enterprise edition adds premium support and is licensed separately under the Stalwart Enterprise License v2, priced per mailbox per year.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', $q$who-its-for$q$, $q$Who Stalwart Mail Server is for$q$, 2, ARRAY[$q$Stalwart suits self-hosters who want a single Rust-based server for mail and collaboration, as well as organizations that want per-mailbox Enterprise pricing with premium support instead of maintaining a purely community-supported stack.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db5dc978-1f33-4ece-86f5-07c85e0d3438', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Maddy Mail Server ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Maddy is a free, open-source, composable all-in-one mail server written in Go that consolidates SMTP, IMAP, and mail security into one daemon.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Maddy Mail Server is a free, GPL-3.0-licensed Go mail server combining SMTP, IMAP, DKIM, SPF, DMARC, and DANE into a single daemon.$q$,
  og_description = $q$Maddy Mail Server is a free, GPL-3.0-licensed Go mail server combining SMTP, IMAP, DKIM, SPF, DMARC, and DANE into a single daemon.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e21bbe8e-03eb-4184-be8d-54e23a99ca1f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e21bbe8e-03eb-4184-be8d-54e23a99ca1f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Combined SMTP/MTA and SMTP/MX$q$, $q$Handles both sending and receiving mail in one daemon.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Built-in IMAP storage$q$, $q$Provides IMAP access to stored mail, currently labeled beta by the developers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$DKIM, SPF, DMARC, DANE, MTA-STS$q$, $q$Implements common email authentication and transport security protocols.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Docker support$q$, $q$Can be deployed using Docker.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Single-daemon architecture$q$, $q$Replaces separate tools like Postfix, Dovecot, and OpenDKIM with one process.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Free and open source (GPL-3.0)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Consolidates multiple mail server roles into a single Go binary/daemon$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$6,000 GitHub stars, actively maintained$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Built-in email authentication (DKIM/SPF/DMARC/DANE/MTA-STS)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$IMAP storage is labeled "beta" by the developers, who recommend Dovecot for production storage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$No documented specific OS/system requirements on the official site content reviewed$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Community-only support (IRC, mailing list), no paid support tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Is Maddy free?$q$, $q$Yes, it's open source under the GPL-3.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Is Maddy production-ready for IMAP storage?$q$, $q$The developers describe IMAP storage as "beta" and suggest pairing with Dovecot for production storage.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$What does Maddy replace?$q$, $q$It replaces separate tools like Postfix, Dovecot, and OpenDKIM with one daemon.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Does Maddy support Docker?$q$, $q$Yes, Docker deployment is supported.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Lightweight self-hosted mail server$q$, $q$Run SMTP sending/receiving and mail security (DKIM/SPF/DMARC) from a single Go daemon.$q$, $q$Self-hosters wanting a simpler alternative to multi-tool mail stacks$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$Mail delivery focus$q$, $q$Use Maddy primarily for message transmission while pairing with Dovecot for IMAP storage.$q$, $q$Admins prioritizing production-grade storage reliability$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$overview$q$, $q$What is Maddy Mail Server?$q$, 2, ARRAY[$q$Maddy is a composable, all-in-one mail server written in Go that consolidates message transmission, reception, and IMAP storage into a single daemon, along with DKIM, SPF, DMARC, DANE, and MTA-STS.$q$, $q$It is open source under GPL-3.0 with 6,000 GitHub stars. The developers note that its IMAP storage component is still labeled beta and recommend Dovecot for production storage needs.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', $q$who-its-for$q$, $q$Who Maddy Mail Server is for$q$, 2, ARRAY[$q$Maddy fits self-hosters and developers who want a single Go binary handling mail delivery and security protocols instead of wiring together Postfix, Dovecot, and OpenDKIM separately.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e21bbe8e-03eb-4184-be8d-54e23a99ca1f', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;

-- ── Mail-in-a-Box ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mail-in-a-Box is a free, CC0-licensed script that turns a fresh Ubuntu cloud server into a full self-hosted mail server in a few hours.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mail-in-a-Box is a free, public-domain (CC0) tool that installs a complete self-hosted mail server with webmail, DNS, and TLS on Ubuntu 22.04.$q$,
  og_description = $q$Mail-in-a-Box is a free, public-domain (CC0) tool that installs a complete self-hosted mail server with webmail, DNS, and TLS on Ubuntu 22.04.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd082b33f-646c-4955-831f-c22ea77858a8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd082b33f-646c-4955-831f-c22ea77858a8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Webmail via Roundcube$q$, $q$Browser-based email access included out of the box.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Contacts and calendar sync$q$, $q$Uses Nextcloud for contacts and calendar synchronization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Web-based control panel$q$, $q$Manage user accounts through a control panel.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Automated DNS configuration$q$, $q$Sets up SPF, DKIM, DMARC, MTA-STS, and DNSSEC automatically.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Automatic TLS certificates$q$, $q$Provisions certificates via Let's Encrypt.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Spam filtering with greylisting$q$, $q$Reduces unwanted mail without manual configuration.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Static website hosting$q$, $q$Can also serve a static website from the same box.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Two-factor authentication and REST API$q$, $q$Adds account security and programmatic access.$q$, 7);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Automated backups$q$, $q$Backs up to Amazon S3 and other supported storage services.$q$, 8);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Free and released under the CC0 public domain dedication, with no license restrictions$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Single-command setup targeted at non-experts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$15.4k GitHub stars, indicating broad adoption$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Automates DNS, TLS, and backup configuration, reducing manual setup work$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Requires a fresh Ubuntu 22.04 LTS 64-bit cloud server, not existing/shared servers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Installation takes "a few hours" per the official site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Self-hosted only; no official hosted/managed version$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Is Mail-in-a-Box free?$q$, $q$Yes, it's released under the CC0-1.0 public domain dedication.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$What server does it require?$q$, $q$A fresh Ubuntu 22.04 LTS 64-bit machine running in the cloud.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$How is it installed?$q$, $q$Via a single setup command: curl -s https://mailinabox.email/setup.sh | sudo bash.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Does it include webmail?$q$, $q$Yes, via Roundcube, plus contacts/calendar sync via Nextcloud.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Turnkey self-hosted email$q$, $q$Turn a fresh cloud VM into a working mail server without deep sysadmin expertise.$q$, $q$Individuals and small organizations self-hosting email$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$Privacy-focused personal email$q$, $q$Run your own domain's email, contacts, and calendar independent of third-party providers.$q$, $q$Privacy-focused individuals$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$overview$q$, $q$What is Mail-in-a-Box?$q$, 2, ARRAY[$q$Mail-in-a-Box is a free, public-domain script that turns a fresh Ubuntu 22.04 LTS cloud server into a complete, working mail server, including webmail, contacts/calendar sync, DNS automation, and TLS certificates.$q$, $q$It is released under the CC0-1.0 dedication, has 15.4k GitHub stars, and installs via a single setup command that takes a few hours to complete.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', $q$who-its-for$q$, $q$Who Mail-in-a-Box is for$q$, 2, ARRAY[$q$Mail-in-a-Box targets individuals and small organizations who want to self-host email without deep systems administration expertise, thanks to its heavily automated DNS, TLS, and backup setup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d082b33f-646c-4955-831f-c22ea77858a8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Mailpit ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mailpit is a free, open-source, single-binary email testing tool with a web UI, SMTP server, REST API, and HTML/CSS compatibility checks.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Mailpit is a free, MIT-licensed email testing tool for developers with a web UI, SMTP capture, REST API, and spam-score testing.$q$,
  og_description = $q$Mailpit is a free, MIT-licensed email testing tool for developers with a web UI, SMTP capture, REST API, and spam-score testing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '75720a0f-3359-4066-8426-dccd1160a142';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '75720a0f-3359-4066-8426-dccd1160a142' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Single binary, zero dependencies$q$, $q$Deploy as one executable with no external dependencies.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Live web UI$q$, $q$Real-time notifications as new captured messages arrive.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$HTML/CSS compatibility checker$q$, $q$Checks email markup against client compatibility rules.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Link validation and screenshots$q$, $q$Validates links and generates screenshots of rendered emails.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Spam testing$q$, $q$Integrates with SpamAssassin for spam-score testing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$REST API$q$, $q$Programmatic access to captured messages for test automation.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$POP3 server support$q$, $q$Exposes captured mail over POP3 in addition to the web UI.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Message tagging, relaying, and forwarding$q$, $q$Organize and route captured test messages.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Free and open source (MIT license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Single binary with zero dependencies, simple to deploy$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$9.9k GitHub stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Includes a REST API and webhook integration for test automation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Intended for email testing, not production mail delivery$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$No official pricing/support tiers; community-supported only$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Frontend built with Go/Vue, requiring build tooling to customize$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Is Mailpit free?$q$, $q$Yes, it's open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$What is Mailpit used for?$q$, $q$It's an SMTP testing tool for developers to capture and inspect outgoing email during development.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Does Mailpit have an API?$q$, $q$Yes, it includes a REST API for programmatic access.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Can Mailpit test for spam scoring?$q$, $q$Yes, via SpamAssassin integration.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$Local email testing$q$, $q$Capture and preview outgoing application email during development without sending real messages.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$CI/CD email testing$q$, $q$Use the REST API to assert on captured emails within automated test suites.$q$, $q$QA and DevOps engineers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$overview$q$, $q$What is Mailpit?$q$, 2, ARRAY[$q$Mailpit is a free, open-source email testing tool for developers: a small, zero-dependency single binary that runs an SMTP server plus a web UI and REST API for capturing and inspecting outgoing email.$q$, $q$It is MIT licensed, has 9.9k GitHub stars, and adds developer-focused extras like HTML/CSS client compatibility checks, link validation, screenshot generation, and SpamAssassin-based spam testing.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', $q$who-its-for$q$, $q$Who Mailpit is for$q$, 2, ARRAY[$q$Mailpit is built for developers and QA/DevOps engineers who need to capture and verify outgoing application email in local development or CI/CD pipelines without sending real messages.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('75720a0f-3359-4066-8426-dccd1160a142', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── MJML ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$MJML is a free, open-source markup language created by Mailjet in 2015 that compiles into responsive, cross-client HTML email.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = 2015,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$MJML is a free, MIT-licensed responsive email markup language from Mailjet that transpiles into cross-client HTML with inlined CSS.$q$,
  og_description = $q$MJML is a free, MIT-licensed responsive email markup language from Mailjet that transpiles into cross-client HTML with inlined CSS.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '7b032bbf-1c83-4ca0-8ae9-0ff746c43cee';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '7b032bbf-1c83-4ca0-8ae9-0ff746c43cee' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Semantic markup tags$q$, $q$Uses tags like mj-section and mj-column instead of raw HTML tables.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Responsive by default$q$, $q$Output is responsive across major email clients, including Outlook.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Component-based architecture$q$, $q$Reusable, extensible native components.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Custom components$q$, $q$Build your own components beyond the native set.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$HTML transpilation$q$, $q$Compiles MJML into responsive HTML with nested tables and inline CSS.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Built with React.js$q$, $q$The framework's tooling is built for high composability using React.js.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Free and open source (MIT license)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$18.2k GitHub stars, one of the most widely adopted email markup frameworks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Simplifies notoriously fragile HTML email coding$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Extensible with custom components$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Requires a build/compile step to transpile MJML into HTML$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$No official hosted editor or paid tier found on the official site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Learning a markup language adds overhead versus writing raw HTML for very simple emails$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Is MJML free?$q$, $q$Yes, it's open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Who created MJML?$q$, $q$Mailjet, released in 2015 during work on their Passport drag-and-drop email builder.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Does MJML guarantee cross-client compatibility?$q$, $q$It's designed to be responsive by default across major email clients, including Outlook.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Can I extend MJML with custom components?$q$, $q$Yes, its component-based architecture supports custom, reusable components.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Responsive transactional/marketing email$q$, $q$Author email templates in a simplified markup language that compiles to cross-client-safe HTML.$q$, $q$Frontend developers building email templates$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$Reusable email component libraries$q$, $q$Build custom, reusable MJML components for consistent email design across a product.$q$, $q$Product/design teams standardizing email output$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$overview$q$, $q$What is MJML?$q$, 2, ARRAY[$q$MJML is a responsive email framework created by Mailjet in 2015 that uses a semantic markup language, transpiled into responsive HTML with nested tables and inline CSS, to simplify the notoriously fragile process of coding HTML email.$q$, $q$It is open source under the MIT license, has 18.2k GitHub stars, and is built with a component-based architecture that includes both native and custom-buildable components.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', $q$who-its-for$q$, $q$Who MJML is for$q$, 2, ARRAY[$q$MJML is for frontend developers and product teams who build responsive HTML email templates and want a semantic markup layer plus a build step instead of hand-coding nested HTML tables and inline CSS.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('7b032bbf-1c83-4ca0-8ae9-0ff746c43cee', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Unlayer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Unlayer is a developer platform providing embeddable email, page, document, and popup builders with a free plan and paid usage-based tiers.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$250/month (Launch plan)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Unlayer lets developers embed drag-and-drop email, page, and document builders into their apps, from a free plan up to a $2,000/month Optimize plan.$q$,
  og_description = $q$Unlayer lets developers embed drag-and-drop email, page, and document builders into their apps, from a free plan up to a $2,000/month Optimize plan.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2af93f8f-0570-4f36-b4b2-40e5917e9e2a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2af93f8f-0570-4f36-b4b2-40e5917e9e2a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Visual builders$q$, $q$Drag-and-drop email, page, document, and popup builders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$AI workflows$q$, $q$Content generation, rewriting, personalization, and translation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Branded templates$q$, $q$Create and manage branded templates for end users.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Multi-format export$q$, $q$Export designs to HTML, PDF, images, and plain text.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Developer SDK and APIs$q$, $q$SDK, REST APIs, React Elements, and a CLI for integrating builders into a product.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Media management$q$, $q$Asset upload and organization within the builders.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$White-labeling$q$, $q$Available on paid plans for embedding under a customer's own brand.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Team collaboration$q$, $q$Available on the Scale plan and above.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Free plan available with core email/page/popup/document builders$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$SOC 2 Type II compliant with a 99.9% uptime SLA$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Used by 1,000+ SaaS brands including Mastercard, Bank of America, and Twilio, per Unlayer's site$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Y Combinator-backed$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$14-day free trial on paid plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Paid plans start at $250/month, a significant jump from the free tier$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Higher-value features (custom CSS, custom themes, AMP, inbox previews) are reserved for the $2,000/month Optimize plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Usage-based add-ons (AI, export, inbox preview, bandwidth credits) cost extra, from $50 to $2,000/month, on top of plan fees$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Enterprise pricing is custom/quote-only$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Does Unlayer have a free plan?$q$, $q$Yes, a free plan with email, page, popup, and document builders is available at $0.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$What do paid plans cost?$q$, $q$Launch is $250/month, Scale is $750/month, and Optimize is $2,000/month, each with a 14-day free trial; Enterprise is custom-priced.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Is Unlayer SOC 2 compliant?$q$, $q$Yes, it's SOC 2 Type II compliant with a 99.9% uptime SLA.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Does Unlayer offer an annual discount?$q$, $q$Yes, annual billing saves 10% versus monthly.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Who is Unlayer for?$q$, $q$Developers and technical teams embedding content-creation tools, such as email/page/document builders, into their own SaaS products.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Embedded email builder for SaaS$q$, $q$Add a drag-and-drop email design tool inside a marketing platform or CRM product.$q$, $q$SaaS product teams (email service providers, CRMs, marketing platforms)$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$White-labeled content creation tools$q$, $q$Offer branded page, document, and popup builders to end customers via SDK/API integration.$q$, $q$Developers building customer-facing design tools$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$AI-assisted content generation$q$, $q$Use built-in AI workflows to generate, rewrite, personalize, or translate email/page content.$q$, $q$Marketing and growth teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Free$q$, $q$$0$q$, NULL, $q$["Email, page, popup, and document builders"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Launch$q$, $q$$250/month$q$, $q$monthly$q$, $q$["1 TB bandwidth","White-labeling","Font management","Custom storage","AI assistant","Cloud API","14-day free trial"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Scale$q$, $q$$750/month$q$, $q$monthly$q$, $q$["Everything in Launch","Custom blocks","Audit tab","Team collaboration","Built-in themes","Smart merge tags","14-day free trial"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Optimize$q$, $q$$2,000/month$q$, $q$monthly$q$, $q$["Everything in Scale","Custom themes","Custom CSS","Custom tabs","AMP support","Inbox previews","Synced blocks","14-day free trial"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom contracts","SOC 2 Type II","White-label","Dedicated CSM"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$overview$q$, $q$What is Unlayer?$q$, 2, ARRAY[$q$Unlayer is a developer platform that lets companies embed drag-and-drop email, page, document, and popup builders directly inside their own applications, so end users can create content without leaving the host product.$q$, $q$It offers a free plan plus paid Launch ($250/month), Scale ($750/month), and Optimize ($2,000/month) tiers, each with a 14-day free trial, and custom Enterprise pricing. The company states it is SOC 2 Type II compliant, offers a 99.9% uptime SLA, is backed by Y Combinator, and serves 1,000+ SaaS brands.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', $q$who-its-for$q$, $q$Who Unlayer is for$q$, 2, ARRAY[$q$Unlayer is built for developers and technical teams at SaaS companies, such as marketing platforms, CRMs, and email service providers, who want to integrate content-creation experiences into their product via SDK, REST API, or React Elements rather than building a builder from scratch.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2af93f8f-0570-4f36-b4b2-40e5917e9e2a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GrapesJS ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source JavaScript framework for building drag-and-drop visual web builders and template editors.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$200/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GrapesJS is a free, open-source (MIT) framework for building drag-and-drop web builders, with a paid Studio SDK for hosted use.$q$,
  og_description = $q$GrapesJS is a free, open-source (MIT) framework for building drag-and-drop web builders, with a paid Studio SDK for hosted use.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95c8082d-ffa9-4958-bc60-8f9f554f3f0a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95c8082d-ffa9-4958-bc60-8f9f554f3f0a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Drag-and-drop visual editor$q$, $q$Core editing engine for building pages, newsletters, and templates without writing markup by hand.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Custom component system$q$, $q$Developers can define custom, reusable components and blocks tailored to their own product.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Asset and layer managers$q$, $q$Built-in managers for handling images/media and inspecting the page's element hierarchy.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Clean HTML/CSS/JS export$q$, $q$Editor state is stored as JSON and can be exported to standard HTML, CSS, and JavaScript.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$External data integration$q$, $q$Supports pulling in external data sources to power dynamic content inside the editor.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Custom branding and white-label$q$, $q$Studio SDK plans let companies remove GrapesJS branding and apply their own.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Core framework is free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Can be embedded as a developer framework inside any existing web app$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Active GitHub community with 25,000+ stars$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Exports clean, standard HTML/CSS/JS with no vendor lock-in$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Requires developer setup to embed; not a ready-made builder for non-technical end users on its own$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Studio SDK paid plans bill by monthly 'sessions,' which can scale unpredictably for high-traffic products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Removing Studio branding and custom domains requires a paid plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Is GrapesJS free?$q$, $q$The core GrapesJS framework is free and open source (MIT license). The hosted Studio SDK adds a free tier plus paid session-based plans starting at $200/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$What is GrapesJS Studio SDK?$q$, $q$It's a commercial, hosted layer built on top of the open-source GrapesJS core, adding custom domains, branding removal, and support tiers.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Can I self-host GrapesJS?$q$, $q$Yes. GrapesJS is an open-source JavaScript library you can embed and host yourself.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Does GrapesJS export standard code?$q$, $q$Yes, it stores editor state as JSON and can generate HTML, CSS, and JavaScript output.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$White-label page builders$q$, $q$Embed a drag-and-drop editor directly inside a SaaS product for end users to build pages.$q$, $q$Product and engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Email/newsletter editors$q$, $q$Build a template editor for marketing or transactional email content.$q$, $q$Marketing technology teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Custom CMS page builders$q$, $q$Add visual editing on top of an existing content management workflow.$q$, $q$Developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1,000 sessions/month","1 domain included","Studio branding","Standard email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Startup$q$, $q$$200/month$q$, $q$monthly$q$, $q$["20,000 sessions/month","2 domains included","Custom branding","Priority email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Business$q$, $q$$2,000/month$q$, $q$monthly$q$, $q$["50,000 sessions/month","2 domains plus wildcard domains","Dedicated Slack channel"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Unlimited sessions","Unlimited storage and domains","24x7 phone support","Custom branding and development support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$overview$q$, $q$What is GrapesJS?$q$, 2, ARRAY[$q$GrapesJS is an open-source JavaScript framework, licensed under MIT, for building visual, drag-and-drop web builders and template editors. Rather than being a finished end-user product, it's a toolkit that developers embed into their own applications to power page, email, and document editing.$q$, $q$The GrapesJS Studio SDK is a separate commercial layer built on top of the open-source core, offering a free tier plus paid, session-based plans for teams that want hosted infrastructure, custom domains, and custom branding without maintaining that layer themselves.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', $q$who-its-for$q$, $q$Who GrapesJS is for$q$, 2, ARRAY[$q$GrapesJS is aimed at developers and product teams who need to add a visual editing experience to their own software — for example, a SaaS platform that wants to let its customers design pages, newsletters, or templates without writing HTML.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95c8082d-ffa9-4958-bc60-8f9f554f3f0a', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Builder.io ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Visual development platform combining an AI-assisted visual editor, production code, and a headless CMS.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$24/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Builder.io lets teams visually edit production code and manage content with AI. Free plan available; paid plans start at $24/user/month.$q$,
  og_description = $q$Builder.io lets teams visually edit production code and manage content with AI. Free plan available; paid plans start at $24/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f8a615cc-2733-4282-bb83-ea78b3682118';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f8a615cc-2733-4282-bb83-ea78b3682118' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Visual editor tied to production code$q$, $q$Edits made visually map to real components and design tokens instead of exporting disconnected markup.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Agentic CMS (Publish)$q$, $q$AI-prompt-driven content creation with A/B testing, personalization, and scheduling.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Fusion for app/UI development$q$, $q$Build app and UI code from scratch or from an existing repository.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Git-integrated collaboration$q$, $q$Multi-role workflow (design, engineering, PM, marketing) with code review through Git.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Enterprise integrations$q$, $q$Connects to commerce, search, asset management, and localization tools, plus an MCP connector.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Role-based access and SSO$q$, $q$Available on higher tiers alongside SOC 2 Type II compliance and workflow controls.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Edits sync to real production code rather than exporting static markup$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$SOC 2 Type II compliant with enterprise security controls$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Used by large brands including Everlane, Zapier, and J.Crew$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Broad integration surface for commerce, search, and localization tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Paid plans are priced per user, which can add up for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$AI 'agent credits' are capped per plan; extra credits cost $25 per 500$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Enterprise pricing requires contacting sales rather than being self-serve$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Does Builder.io have a free plan?$q$, $q$Yes, a Free tier is available at $0/user/month for 1 user with 60 monthly AI agent credits.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$What's the difference between Fusion and Publish?$q$, $q$Fusion is for building apps and UI from scratch or existing repos; Publish is a headless CMS with a visual page builder.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Is Builder.io SOC 2 compliant?$q$, $q$Yes, Builder.io states it is SOC 2 Type II compliant with role-based permissions and workflow controls.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Can Builder.io work with my existing Git workflow?$q$, $q$Yes, it integrates with GitHub, GitLab, and Bitbucket, with Azure DevOps and Bitbucket Enterprise on higher tiers.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$AI-assisted landing page publishing$q$, $q$Marketers create and A/B test pages without needing an engineer for every change.$q$, $q$Marketing teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Visual UI development on real code$q$, $q$Engineers and designers collaborate visually while code stays in the team's own repository.$q$, $q$Frontend engineering teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Headless CMS with personalization$q$, $q$Enterprises manage content with scheduling and audience targeting at scale.$q$, $q$Enterprise content teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Free$q$, $q$$0/user/month$q$, $q$monthly$q$, $q$["1 user (up to 5 max)","60 monthly agent credits (15 daily)","Community support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Pro$q$, $q$$24/user/month$q$, $q$monthly$q$, $q$["1 user (up to 5 max)","500 monthly agent credits","Additional credits at $25 per 500"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Team$q$, $q$$40/user/month$q$, $q$monthly$q$, $q$["1 user (up to 20 max)","500 monthly agent credits","Additional credits at $25 per 500"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom seats and agent credit allocation","SSO and role-based access control","Priority support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$overview$q$, $q$What is Builder.io?$q$, 2, ARRAY[$q$Builder.io is a visual development platform that lets designers, engineers, product managers, and marketers collaborate on the same product from a single source of truth. Its visual editor maps directly to production code and design tokens rather than generating disconnected output.$q$, $q$The platform is organized around two products: Fusion, for building apps and UI from scratch or an existing repository, and Publish, a headless CMS with a visual page builder, A/B testing, and personalization.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', $q$who-its-for$q$, $q$Who Builder.io is for$q$, 2, ARRAY[$q$Builder.io targets engineering, design, product, and marketing teams at enterprises and scale-ups that need to ship UI and content faster while keeping code under version control and code review.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f8a615cc-2733-4282-bb83-ea78b3682118', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Plasmic ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source visual builder that lets teams design UI visually while integrating with an existing React codebase.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$39/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Plasmic is an open-source visual builder for React apps and sites, with a free-forever plan and paid tiers from $39/month.$q$,
  og_description = $q$Plasmic is an open-source visual builder for React apps and sites, with a free-forever plan and paid tiers from $39/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '62f1f869-8400-4cf4-bb92-4a6aa2ab0719';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '62f1f869-8400-4cf4-bb92-4a6aa2ab0719' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Visual drag-and-drop editor$q$, $q$Build responsive UI visually with layouts that map to real code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Figma import$q$, $q$A Figma-to-code plugin converts existing designs into editable Plasmic components.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Data integrations$q$, $q$Connects to Supabase, Contentful, Shopify, HTTP endpoints, and GraphQL APIs.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Component registration$q$, $q$Developers register their own React components so non-technical teammates can use them as building blocks.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Collaboration tools$q$, $q$Branching, multiplayer editing, and approval workflows for teams.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Codebase integration$q$, $q$Integrates with an existing codebase instead of operating as a closed, standalone platform.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Free plan is free forever with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Open source: MIT license for most of the codebase, AGPL for the platform directory$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Integrates directly with existing React codebases rather than locking teams into a silo$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Figma import speeds up design-to-build handoff$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Pro ($103/mo) and Scale ($399/mo) tiers, billed yearly, get expensive as teams grow$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Removing the Plasmic badge and custom favicon require at least the Starter plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Enterprise features like SSO and whitelabeling require custom, contact-sales pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Is Plasmic free?$q$, $q$Yes, Plasmic has a free-forever plan for up to 3 collaborators, with paid tiers for more collaborators and features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Is Plasmic open source?$q$, $q$Yes. Most of the codebase is MIT licensed, while the platform directory is AGPL licensed.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Can I use my own React components in Plasmic?$q$, $q$Yes, via component registration, which exposes your existing components as building blocks in the visual editor.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Does Plasmic support importing from Figma?$q$, $q$Yes, through a dedicated Figma-to-code plugin.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Visual editing on top of an existing app$q$, $q$Add a visual builder layer to a product's existing React codebase.$q$, $q$Engineering teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Marketing pages without developer bottlenecks$q$, $q$Let marketers build and publish landing pages using components engineers registered.$q$, $q$Marketing teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Agency client site delivery$q$, $q$Build client websites with reusable, brandable component libraries.$q$, $q$Agencies and design studios$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Free forever","3 collaborators"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Starter$q$, $q$$39/month$q$, $q$annual$q$, $q$["3 collaborators","Remove Plasmic badge","Custom favicon","AI support chat"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Pro$q$, $q$$103/month$q$, $q$annual$q$, $q$["4-10 collaborators","Priority support","Unlimited Plasmic AI access (Beta)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Scale$q$, $q$$399/month$q$, $q$annual$q$, $q$["8-30 collaborators","Content creator mode","A/B testing","Scheduled content","Custom targeting"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom integrations","SSO","Domain capture","Whitelabeling","SLAs","Dedicated support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$overview$q$, $q$What is Plasmic?$q$, 2, ARRAY[$q$Plasmic is an open-source visual editing and content platform for building websites and applications. Rather than acting as a closed, walled-garden builder, it integrates with an existing codebase, letting developers register real React components for use inside the visual editor.$q$, $q$Plasmic offers a free-forever plan alongside paid tiers (Starter, Pro, Scale) billed annually, plus a custom Enterprise tier with SSO and whitelabeling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', $q$who-its-for$q$, $q$Who Plasmic is for$q$, 2, ARRAY[$q$Plasmic suits development teams that want to give designers, marketers, and product managers a way to build and publish UI visually, without giving up control of the underlying codebase.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('62f1f869-8400-4cf4-bb92-4a6aa2ab0719', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Webstudio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source, AGPL-licensed visual website builder with full CSS control, self-hosting, or Webstudio's own cloud hosting.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$15/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Webstudio is an open-source (AGPL) website builder with full CSS control. Free Hobby plan; paid cloud plans start at $15/month.$q$,
  og_description = $q$Webstudio is an open-source (AGPL) website builder with full CSS control. Free Hobby plan; paid cloud plans start at $15/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '17c0bc49-5c4a-433c-9ace-21a7b1f6192b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '17c0bc49-5c4a-433c-9ace-21a7b1f6192b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Visual CSS editor$q$, $q$Full access to CSS properties across all breakpoints through a visual interface.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Design tokens$q$, $q$Reusable styles for consistency without hand-writing traditional CSS classes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$CMS integrations$q$, $q$Connects to Strapi, Supabase, Hygraph, Ghost, Notion, Airtable, WordPress, Contentful, Drupal, Payload, Sanity, Directus, and Decap.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Dynamic content$q$, $q$Dynamic routing, data bindings, collection lists, and dynamic sitemaps.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Automatic image optimization$q$, $q$Converts images to WebP/AVIF with compression automatically.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Cloud or self-hosted publishing$q$, $q$One-click publishing via Cloudflare, or export and self-host the project independently.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Core builder is open source under AGPL-3.0 and can be self-hosted$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Free Hobby plan offers unlimited projects and pages on a wstd.io subdomain$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Sites exported from Webstudio are the operator's own code, not bound by AGPL$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Wide range of native CMS integrations$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Custom domains and higher page-view limits require the paid Pro plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Overage charges of $20 per 100,000 additional page views apply on the Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Some optional components, like the animation SDK package, are proprietary rather than open source$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Is Webstudio free?$q$, $q$Yes, the Hobby plan is free, offering unlimited projects and pages on a wstd.io subdomain.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Can I self-host Webstudio?$q$, $q$Yes, the core builder is open source under AGPL-3.0-or-later and can be self-hosted.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Does Webstudio support custom domains?$q$, $q$Yes, starting on the paid Pro plan ($15/month billed yearly).$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$What CMS platforms does Webstudio integrate with?$q$, $q$Strapi, Supabase, Hygraph, Ghost, Notion, Airtable, WordPress, Contentful, Drupal, Payload, Sanity, Directus, and Decap.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Self-hosted Webflow alternative$q$, $q$Teams that want a visual builder they can host on their own infrastructure.$q$, $q$Developers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$CMS-driven marketing sites$q$, $q$Startups building marketing pages backed by a headless CMS.$q$, $q$Startup founders$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Full CSS control without hand-coding$q$, $q$Designers who need pixel-level CSS access via a visual interface.$q$, $q$Designers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Hobby$q$, $q$$0/month$q$, $q$monthly$q$, $q$["wstd.io subdomain","Unlimited projects and pages","Project sharing and export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Pro$q$, $q$$15/month$q$, $q$annual$q$, $q$["Custom domains","100,000 monthly page views","Unlimited form submissions","Content mode","Staging environment","Backups","CMS integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$Team$q$, $q$$35/month$q$, $q$annual$q$, $q$["Everything in Pro","Workspaces","Member roles","5 included seats"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$overview$q$, $q$What is Webstudio?$q$, 2, ARRAY[$q$Webstudio is an open-source website builder, licensed under AGPL-3.0-or-later, that gives designers full access to CSS properties through a visual interface rather than a limited style panel. Sites can be published through Webstudio's Cloudflare-backed cloud hosting or exported and self-hosted independently.$q$, $q$The platform reports 229,800+ projects created and 140,200+ users, with 8,700+ GitHub stars on its open-source repository.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', $q$who-its-for$q$, $q$Who Webstudio is for$q$, 2, ARRAY[$q$Webstudio is built for designers, developers, and startup founders looking for an alternative to closed no-code builders like Webflow and Framer, particularly those who value self-hosting or full CSS control.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('17c0bc49-5c4a-433c-9ace-21a7b1f6192b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── TeleportHQ ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Low-code website builder combining AI page generation with multi-framework code export and headless CMS integration.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$18/editor/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$TeleportHQ is an AI-assisted, low-code website builder that exports multi-framework code. 7-day free trial; plans from $9/editor/month.$q$,
  og_description = $q$TeleportHQ is an AI-assisted, low-code website builder that exports multi-framework code. 7-day free trial; plans from $9/editor/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2ecc0e88-527f-46f0-83e1-06163f665cdf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2ecc0e88-527f-46f0-83e1-06163f665cdf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$AI page generation$q$, $q$Generates page layouts from text prompts describing the desired design.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Multi-framework code export$q$, $q$Real-time code generation across multiple JavaScript frameworks, plus HTML/CSS/JS export.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Figma-to-code plugin$q$, $q$Converts existing Figma designs into TeleportHQ projects.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Headless CMS and data sources$q$, $q$Connects external data sources and headless CMS content into built pages.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$GitHub integration$q$, $q$Version control integration for exported code.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Built-in form management$q$, $q$Form creation with lead collection and submission limits per plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$One-click Vercel deployment$q$, $q$Deploy published sites directly to Vercel.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Exports real, framework-specific code instead of locking users into a proprietary runtime$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$GitHub and Vercel integrations fit standard developer workflows$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Figma import accelerates design-to-code handoff$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Annual billing roughly halves the Professional plan's per-editor price$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$No indefinite free plan — only a 7-day free trial before a paid plan is required$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$AI token allowance is capped per plan (15k on trial, 75k/month on Professional)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Agency-tier pricing requires contacting sales$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Hosting bandwidth and storage are capped even on the paid Professional plan$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Does TeleportHQ have a free plan?$q$, $q$It offers a 7-day free trial; continued use requires the Professional plan, starting at $9/editor/month billed yearly or $18/editor/month billed monthly.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$What code does TeleportHQ export?$q$, $q$Real-time code across multiple JavaScript frameworks, along with HTML/CSS/JS export.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Can TeleportHQ generate pages with AI?$q$, $q$Yes, via prompt-based AI page generation with a monthly AI token allowance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Does TeleportHQ integrate with version control?$q$, $q$Yes, it integrates with GitHub.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$AI-assisted client site delivery$q$, $q$Agencies turn mockups into working, framework-specific code quickly.$q$, $q$Agencies and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Framework-specific code export from a visual builder$q$, $q$Developers need exported code that matches their target JS framework.$q$, $q$Developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Landing pages with lead capture$q$, $q$Marketers build pages with built-in form submission tracking.$q$, $q$Marketing teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Trial$q$, $q$Free$q$, NULL, $q$["7-day trial","1 project","Unlimited pages","10 code views","15k AI tokens","10 forms","2,000 monthly form submissions"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Professional$q$, $q$$18/editor/month ($9/editor/month billed yearly)$q$, $q$monthly$q$, $q$["Unlimited projects and pages","Unlimited code views/downloads","75k AI tokens/month","No watermark","Video uploads","Private projects","Vercel integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$Agency$q$, $q$Custom$q$, NULL, $q$["All Professional features","10+ custom domains","Custom storage and bandwidth","Dedicated account manager"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$overview$q$, $q$What is TeleportHQ?$q$, 2, ARRAY[$q$TeleportHQ is a low-code website builder that pairs a visual, drag-and-drop editor with AI-driven page generation and real-time code generation across multiple JavaScript frameworks. Projects can pull in data sources, connect to headless CMS content, and version through GitHub.$q$, $q$New users get a 7-day free trial; ongoing use requires the Professional plan or a custom Agency plan for larger organizations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', $q$who-its-for$q$, $q$Who TeleportHQ is for$q$, 2, ARRAY[$q$TeleportHQ targets designers, developers, marketers, agencies, and freelancers who want to move quickly from an idea or Figma design to deployable, framework-specific code.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ecc0e88-527f-46f0-83e1-06163f665cdf', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Pinegrow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Desktop visual editor for professional developers that works with real HTML/CSS, Bootstrap, Tailwind, and WordPress themes.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$99/year$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pinegrow is a desktop visual web editor for HTML, CSS, Tailwind, and WordPress themes, priced from $99/year or as a one-time license.$q$,
  og_description = $q$Pinegrow is a desktop visual web editor for HTML, CSS, Tailwind, and WordPress themes, priced from $99/year or as a one-time license.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cce62d49-de89-4c74-80bb-713e85f97dbe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cce62d49-de89-4c74-80bb-713e85f97dbe' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Visual and code editing$q$, $q$Combines drag-and-drop tools with direct HTML and CSS code editors.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Framework support$q$, $q$Built-in components and visual controls for Bootstrap, Foundation, and Tailwind CSS.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Responsive multi-page editing$q$, $q$Edit multiple pages at different device sizes with media query helpers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$WordPress theme builder$q$, $q$Dedicated add-on for building custom WordPress themes and plugin support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$GSAP-powered animation$q$, $q$Interaction composer and timeline editor built on GreenSock GSAP.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Smart components$q$, $q$Master pages and reusable components with static CMS capabilities.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$AI assistant$q$, $q$Built-in AI assistant for design and code help, using the user's own API key.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Works directly with real HTML/CSS files rather than a proprietary format, fitting version-controlled workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Offers a one-time perpetual license option, not just a subscription$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Dedicated WordPress theme-building tooling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Cross-platform desktop app for Mac, Windows, and Linux$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$30-day money-back guarantee on annual and one-time purchases$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Core interactions, Tailwind editor, WordPress builder, and WooCommerce tooling are separate paid add-ons$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$AI assistant requires bringing your own API key, so usage has separate external cost$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Desktop-only; there is no hosted, collaborative cloud version$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Is Pinegrow a subscription?$q$, $q$Pinegrow offers both an annual subscription and a one-time perpetual license (which includes one year of free updates).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Does Pinegrow work with WordPress?$q$, $q$Yes, via a dedicated WordPress theme builder add-on.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$What platforms does Pinegrow support?$q$, $q$Mac (Apple Silicon and Intel), Windows 64-bit, and Linux 64-bit.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Does Pinegrow include AI features?$q$, $q$Yes, a built-in AI assistant that uses your own API key.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$WordPress theme development$q$, $q$Build custom WordPress themes visually with a dedicated theme builder add-on.$q$, $q$WordPress developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Visual CSS/Tailwind tooling alongside hand-written code$q$, $q$Professional developers who want visual controls without giving up code ownership.$q$, $q$Frontend developers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Offline, code-owned site building$q$, $q$Teams that need to build websites without depending on cloud infrastructure.$q$, $q$Development teams and agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Base Editor$q$, $q$$49.50/year (promotional; regular $99/year)$q$, $q$annual$q$, $q$["Core visual and code editor","Bootstrap/Foundation support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Interactions add-on$q$, $q$$50/year$q$, $q$annual$q$, $q$["GSAP-powered interaction and animation composer"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$Tailwind Editor add-on$q$, $q$$25/year$q$, $q$annual$q$, $q$["Visual Tailwind CSS controls"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$WordPress Builder add-on$q$, $q$$25/year$q$, $q$annual$q$, $q$["WordPress theme building"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$WooCommerce add-on$q$, $q$$25/year$q$, $q$annual$q$, $q$["WooCommerce-specific theme tooling"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$overview$q$, $q$What is Pinegrow?$q$, 2, ARRAY[$q$Pinegrow is a desktop application for visual web development that operates directly on standard HTML and CSS files, combining drag-and-drop visual tools with code editors. It includes built-in support for Bootstrap, Foundation, and Tailwind CSS, plus a WordPress theme builder add-on.$q$, $q$It's sold as either an annual subscription or a one-time perpetual license with one year of included updates, with add-ons like Interactions, Tailwind Editor, WordPress Builder, and WooCommerce priced separately.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', $q$who-its-for$q$, $q$Who Pinegrow is for$q$, 2, ARRAY[$q$Pinegrow targets professional web developers and designers who want visual tooling that integrates with their existing code-based workflows and version control, rather than a cloud-dependent, all-in-one builder.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cce62d49-de89-4c74-80bb-713e85f97dbe', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Bootstrap Studio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Desktop app for visually building responsive Bootstrap websites, sold as a one-time purchase with no subscription.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$29$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bootstrap Studio is a desktop visual website builder for Bootstrap sites, sold as a one-time purchase from $29, no subscription.$q$,
  og_description = $q$Bootstrap Studio is a desktop visual website builder for Bootstrap sites, sold as a one-time purchase from $29, no subscription.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3a32c2e6-fe5a-4065-bfb8-918758329971';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3a32c2e6-fe5a-4065-bfb8-918758329971' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Visual drag-and-drop editor$q$, $q$Build responsive websites using a Bootstrap 3/4/5 component library without writing code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Built-in AI assistant$q$, $q$Used for edits, complete website builds, and redesigns.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Code editor$q$, $q$VS Code-like environment for CSS, SASS, JavaScript, and HTML editing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Animations$q$, $q$Scroll/hover-triggered CSS animations, Lottie support, and parallax effects.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Smart Forms and ecommerce components$q$, $q$Forms with automatic email delivery, plus built-in ecommerce components.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$One-click SFTP publishing$q$, $q$Publish directly via SFTP, with free hosting slots on Bootstrap Studio's platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Import existing sites$q$, $q$Drag and drop existing HTML, CSS, and JS files to bring a site into the editor.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$One-time payment; no recurring subscription required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Standard plan includes 1 year of free upgrades; Lifetime plan includes upgrades and hosting forever$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$30-day refund policy on both plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Cross-platform desktop app for Windows, macOS, and Linux$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Desktop-only; there is no browser-based or cloud editing option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Free hosting and SFTP publishing are app-provided rather than a full managed hosting platform$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Standard plan's free upgrades are limited to 1 year$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Is Bootstrap Studio a subscription?$q$, $q$No, it's a one-time purchase: $29 for the Standard plan or $59 for the Lifetime plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$What operating systems does Bootstrap Studio support?$q$, $q$Windows 10+, macOS, and Linux.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Does Bootstrap Studio include AI features?$q$, $q$Yes, a built-in AI assistant for edits and full website builds.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Can I import an existing website?$q$, $q$Yes, by dragging and dropping existing HTML, CSS, and JS files into the app.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Client site delivery$q$, $q$Freelancers and agencies build client sites using the Bootstrap component library.$q$, $q$Freelance web designers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Learning web design visually$q$, $q$Beginners build sites without writing CSS from scratch.$q$, $q$Design students and beginners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Desktop visual building with full code access$q$, $q$Developers who want visual tools without losing access to raw code.$q$, $q$Frontend developers$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Standard$q$, $q$$29$q$, NULL, $q$["One-time purchase","1 year of free upgrades","Free web hosting slot"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$Lifetime$q$, $q$$59$q$, NULL, $q$["One-time purchase","Lifetime free upgrades","Lifetime free hosting"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$overview$q$, $q$What is Bootstrap Studio?$q$, 2, ARRAY[$q$Bootstrap Studio is a desktop application for visually designing and publishing websites built on the Bootstrap framework (versions 3, 4, and 5), generating static HTML output. It runs locally rather than in the browser and includes a built-in AI assistant, a code editor, and one-click SFTP publishing.$q$, $q$It's sold as a one-time purchase — $29 for the Standard plan with 1 year of free upgrades, or $59 for a Lifetime plan with lifetime upgrades and hosting — rather than a subscription.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', $q$who-its-for$q$, $q$Who Bootstrap Studio is for$q$, 2, ARRAY[$q$Bootstrap Studio serves a range of users from beginners unfamiliar with CSS to experienced frontend developers, including freelancers, agencies, and students building Bootstrap-based websites.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3a32c2e6-fe5a-4065-bfb8-918758329971', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Silex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source (AGPL) visual builder for static sites, maintained by the nonprofit Silex Labs.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Silex is a 100% free, open-source (AGPL) visual builder for static sites with CMS integrations, maintained by Silex Labs.$q$,
  og_description = $q$Silex is a 100% free, open-source (AGPL) visual builder for static sites with CMS integrations, maintained by Silex Labs.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b05cba9-d8b6-4cbf-8bf4-824461bac8ef' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Visual drag-and-drop editor$q$, $q$Build sites visually with direct access to underlying HTML and CSS.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$CMS integrations$q$, $q$Connects to WordPress, Strapi, Supabase, Squidex, and GraphQL APIs.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Static site generation with dynamic data$q$, $q$Generates static output while still supporting dynamic, data-driven content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$SEO-optimized output$q$, $q$Generated sites are designed to be SEO-friendly and accessible by default.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$No vendor lock-in$q$, $q$Built on open web standards so exported sites aren't tied to Silex.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Offline-first desktop app$q$, $q$A desktop app with offline-first capabilities is in development.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$100% free and open source under the AGPL license, with no paid tiers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Maintained by Silex Labs, a nonprofit organization$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$No proprietary lock-in; produces standard HTML/CSS output$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Received the OW2 Best Project Award 2026$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Funded by donations, which can mean slower feature development than VC-backed competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$The offline-first desktop app is still in development and not yet available$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Smaller plugin/integration ecosystem than commercial alternatives like Webflow$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Is Silex really free?$q$, $q$Yes, all features are free of charge. The project is funded through donations rather than subscriptions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Who maintains Silex?$q$, $q$Silex Labs, a nonprofit organization.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$What license is Silex released under?$q$, $q$The AGPL license.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Can Silex connect to a CMS?$q$, $q$Yes, including WordPress, Strapi, Supabase, and Squidex.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Free alternative to proprietary builders$q$, $q$Freelancers and agencies wanting a code-owned, no-cost alternative to platforms like Webflow.$q$, $q$Freelance designers and agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$Learning web design$q$, $q$Students building sites visually while learning underlying HTML/CSS concepts.$q$, $q$Design students$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$CMS-driven static sites$q$, $q$Nonprofits and individuals building free sites backed by dynamic data sources.$q$, $q$Nonprofits and small organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$overview$q$, $q$What is Silex?$q$, 2, ARRAY[$q$Silex is a visual builder for static sites that combines a visual editor, CMS integrations (including WordPress, Strapi, and Supabase), and hosting-agnostic static output. It's fully open source under the AGPL license and maintained by the nonprofit Silex Labs.$q$, $q$All features are free of charge; the project sustains development through donations and community contributions rather than paid subscription tiers.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', $q$who-its-for$q$, $q$Who Silex is for$q$, 2, ARRAY[$q$Silex is aimed at web professionals, freelancers, agencies, and students who want a free, open-source alternative to proprietary site builders while retaining full control over code and hosting.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b05cba9-d8b6-4cbf-8bf4-824461bac8ef', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Hugo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source static site generator written in Go, known for very fast site builds.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Hugo is a free, open-source (Apache 2.0) static site generator written in Go, built for extremely fast site rendering.$q$,
  og_description = $q$Hugo is a free, open-source (Apache 2.0) static site generator written in Go, built for extremely fast site rendering.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a46d19fe-50a3-4df2-8764-c03c06ff332b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a46d19fe-50a3-4df2-8764-c03c06ff332b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Fast rendering$q$, $q$Renders large sites in seconds, according to the project's own performance claims.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Advanced templating$q$, $q$Flexible templating system for controlling site structure and design.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Built-in asset pipeline$q$, $q$Image processing, JavaScript bundling, Sass support, and Tailwind CSS integration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Built-in development server$q$, $q$Local server with real-time preview during development.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Multilingual support$q$, $q$Handles multiple language versions of a site.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Taxonomy system$q$, $q$Organizes content with categories, tags, and custom taxonomies.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Completely free and open source under the Apache 2.0 license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Written in Go for high build performance$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$89,000+ GitHub stars with an active community$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Outputs static files with no database or server runtime required$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$No built-in visual editor; content is authored via templates, Markdown, and the command line$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Templating language has a steeper learning curve than simpler generators$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$No official hosted/managed version; requires self-hosting or a static hosting provider$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Is Hugo free?$q$, $q$Yes, Hugo is free and open source under the Apache 2.0 license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$What language is Hugo built in?$q$, $q$Go.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Does Hugo require a database?$q$, $q$No, it generates static files with no database or server-side runtime.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Does Hugo support multiple languages?$q$, $q$Yes, multilingual site support is built in.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Documentation sites$q$, $q$Fast builds suit large, frequently updated documentation.$q$, $q$Developers and technical writers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Marketing and informational sites$q$, $q$Simple, fast static sites for organizations and nonprofits.$q$, $q$Organizations and nonprofits$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$Blogs and news publishing$q$, $q$A code-based, database-free publishing workflow.$q$, $q$Bloggers and publishers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$overview$q$, $q$What is Hugo?$q$, 2, ARRAY[$q$Hugo is a popular open-source static site generator written in Go, designed to render sites — including large ones — in seconds. It's released under the Apache 2.0 license and includes advanced templating, a built-in asset pipeline for images, JS, and Sass, and multilingual support.$q$, $q$The project has an active open-source community, with 89,000+ GitHub stars and a rapid release cycle.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', $q$who-its-for$q$, $q$Who Hugo is for$q$, 2, ARRAY[$q$Hugo suits developers and technical teams building documentation sites, landing pages, corporate and government sites, nonprofit sites, educational sites, news outlets, and project sites who need fast builds and no database dependency.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a46d19fe-50a3-4df2-8764-c03c06ff332b', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Jekyll ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free, open-source Ruby-based static site generator with built-in blogging support and native GitHub Pages hosting.$q$,
  pricing_model = $q$Free$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Jekyll is a free, open-source (MIT) Ruby static site generator with built-in blogging support, powering GitHub Pages.$q$,
  og_description = $q$Jekyll is a free, open-source (MIT) Ruby static site generator with built-in blogging support, powering GitHub Pages.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'df10fa66-24a3-4755-9dcd-f62b7329c9c8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'df10fa66-24a3-4755-9dcd-f62b7329c9c8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Markdown and Liquid support$q$, $q$Converts Markdown, Liquid, HTML, and CSS content into a static site.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Blog-aware structure$q$, $q$Built-in permalinks, categories, pages, posts, and custom layouts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$No database required$q$, $q$Content-first workflow with no database or comment moderation system to manage.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Command-line deployment$q$, $q$Sites can be built and deployed from the command line in seconds.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Native GitHub Pages integration$q$, $q$GitHub Pages is powered by Jekyll, giving many users free hosting with no extra setup.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Custom domain support$q$, $q$Supports serving sites from a custom domain name.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Free and open source under the MIT license$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Powers GitHub Pages, giving many users free hosting with minimal configuration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Simple, content-first workflow with no database to manage$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Maintained by a volunteer core team with sponsor support$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Requires Ruby and gem installation, adding setup friction for non-Ruby developers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$No visual/WYSIWYG editor; content is authored via Markdown/Liquid and the command line$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Maintained by a volunteer core team rather than a dedicated company$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Is Jekyll free?$q$, $q$Yes, Jekyll is free and open source under the MIT license.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$What language is Jekyll built with?$q$, $q$Ruby.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Does Jekyll require a database?$q$, $q$No, no databases or comment moderation systems are required.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Can I host a Jekyll site for free?$q$, $q$Yes, GitHub Pages is powered by Jekyll and offers free hosting for Jekyll sites.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Free blogging on GitHub Pages$q$, $q$Developers publish a blog directly through GitHub Pages at no cost.$q$, $q$Developers and open-source maintainers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Documentation without a database backend$q$, $q$Technical teams publish docs using a simple, file-based workflow.$q$, $q$Technical writers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$Lightweight personal blogging$q$, $q$Individuals wanting full content ownership with a simple static site.$q$, $q$Bloggers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$overview$q$, $q$What is Jekyll?$q$, 2, ARRAY[$q$Jekyll is a static site generator that converts plain text — written in Markdown, Liquid, HTML, and CSS — into websites and blogs, with no database or comment moderation system required. It's released under the MIT license and can be deployed from the command line in seconds.$q$, $q$Jekyll is the engine behind GitHub Pages, which gives many Jekyll users free hosting with minimal configuration, alongside support for custom domains.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', $q$who-its-for$q$, $q$Who Jekyll is for$q$, 2, ARRAY[$q$Jekyll is aimed at developers and content creators who want a lightweight, blog-aware static site generator without the overhead of managing a hosting company or database, particularly those already using GitHub.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('df10fa66-24a3-4755-9dcd-f62b7329c9c8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;


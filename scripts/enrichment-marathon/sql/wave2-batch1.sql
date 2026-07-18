-- Enrichment marathon batch: Actual Budget, Acuity Scheduling, Adalo, ADempiere, AdEspresso, AdGuard Home, admidio, Adminer

-- ── Actual Budget ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Actual Budget is a free, open-source, privacy-focused personal finance app built around envelope budgeting, with bank sync, multi-device support, and self-hosted or managed sync options.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(NULL, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Actual Budget: Free, Open-Source Envelope Budgeting$q$, seo_title),
  seo_meta_description = COALESCE($q$Free, open-source envelope budgeting app with bank sync, multi-device access, and self-hosted or managed hosting for privacy-focused personal finance.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Actual Budget is a free, open-source personal finance application built around envelope-style budgeting, where users allocate actual income to spending categories. The project is developed by the Actual Budget open-source community and distributed via GitHub, with apps for web, desktop (Mac, Windows, Linux via Electron), iOS, and Android. It is local-first: data lives on the user's device and syncs across devices through a sync server that users either self-host or run via a third-party managed host such as PikaPods, with optional end-to-end encryption for synced data. Core features include bank account syncing (via GoCardless for the EU/UK and SimpleFIN for the US/Canada), transaction imports in QIF, OFX, QFX, CAMT.053, and CSV formats, custom reports, net worth tracking, undo/redo, dark mode, and a full API for developers who want to build on top of it. It also supports data migration from YNAB4 and nYNAB, making it a common destination for users leaving subscription-based budgeting apps. Because it is entirely free and open source, there are no subscription tiers or paywalled features; the only recurring cost, if any, comes from optionally paying a third party to host the sync server. Actual Budget suits privacy-conscious individuals and households who want full control over their financial data and are comfortable with a self-hosted or semi-technical setup, as an alternative to commercial budgeting apps like YNAB.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Envelope budgeting$q$, $q$Allocate actual income to spending categories rather than budgeting projected income.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Bank syncing$q$, $q$Connect bank accounts via GoCardless (EU/UK) or SimpleFIN (US/Canada) for automatic transaction imports.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Multi-device sync with encryption$q$, $q$Sync budgets across devices with optional end-to-end encryption on the sync server.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Flexible file imports$q$, $q$Import transactions from QIF, OFX, QFX, CAMT.053, and CSV files.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Custom reports & net worth tracking$q$, $q$Build custom reports and track net worth over time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Developer API$q$, $q$A documented API lets developers build integrations or automations on top of Actual Budget.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Completely free and open source with no subscription cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Privacy-focused: local-first data with optional end-to-end encrypted sync$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Flexible hosting: self-host or use a managed provider$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Direct migration path from YNAB4/nYNAB$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Sync requires either running your own server or paying a third party, unlike turnkey commercial apps$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Smaller community and support ecosystem than established paid budgeting apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Bank sync providers vary by region and may not cover every bank$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Is Actual Budget free?$q$, $q$Yes, Actual Budget is free and open source. The only potential cost is optional third-party hosting for the sync server.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Do I need to self-host Actual Budget?$q$, $q$You need a sync server for multi-device use, which you can self-host or run through a managed host like PikaPods; the app itself works locally without one.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Can I migrate from YNAB?$q$, $q$Yes, Actual Budget includes built-in tools to import budgets from YNAB4 and nYNAB.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Is my financial data private?$q$, $q$Actual Budget is local-first and supports optional end-to-end encryption for data synced between devices.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Privacy-conscious personal budgeting$q$, $q$Manage household finances with envelope budgeting while keeping full control of where data is stored.$q$, $q$Privacy-focused individuals and households$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Self-hosted finance stack$q$, $q$Run a budgeting app alongside other self-hosted services without recurring subscription fees.$q$, $q$Self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Switching from YNAB$q$, $q$Migrate an existing YNAB4 or nYNAB budget to a free, open-source alternative.$q$, $q$Former YNAB users$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$Self-hosted$q$, $q$Free$q$, $q$N/A$q$, NULL, $q$["Full app functionality","Bring your own server for multi-device sync","Optional end-to-end encryption"]$q$::jsonb, 0);

DELETE FROM tool_content_blocks WHERE tool_id = 'e27dc122-1b31-46b0-a5e4-521acfa85cbb';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Actual Budget is an open-source personal finance app that implements envelope-style budgeting, where every dollar of actual income is assigned to a category before it's spent. It positions itself as a fast, local-first, privacy-focused alternative to subscription budgeting apps.$q$, $q$The app is developed openly on GitHub by a community of contributors and is free to use. Because it has no company-run backend by default, users choose how to run the sync layer: fully self-hosted, or through a managed hosting provider such as PikaPods.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Actual Budget supports multi-device sync with optional end-to-end encryption, bank account syncing through GoCardless (EU/UK) and SimpleFIN (US/Canada), and transaction imports from QIF, OFX, QFX, CAMT.053, and CSV files.$q$, $q$It also includes custom reporting, net worth tracking, undo/redo history, a dark mode, a documented API for developers, and built-in tools to migrate existing budgets from YNAB4 or nYNAB.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Actual Budget itself is free with no paid tiers. Users who don't want to run their own sync server can pay a third-party host, such as PikaPods, for managed hosting; a portion of those hosting fees is donated to the project's Open Collective.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e27dc122-1b31-46b0-a5e4-521acfa85cbb', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Acuity Scheduling ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Acuity Scheduling is an online appointment booking platform, owned by Squarespace, that lets businesses offer 24/7 self-scheduling, payments, and automated client reminders.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$16/month$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Allentown, Pennsylvania, US (now part of Squarespace)$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Acuity Scheduling: Online Appointment Booking$q$, seo_title),
  seo_meta_description = COALESCE($q$Online booking software from Squarespace offering client self-scheduling, payments, calendar sync, and automated reminders for service businesses.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Acuity Scheduling is an online appointment scheduling and booking platform originally founded in 2006 and acquired by Squarespace in April 2019. It gives service-based businesses a branded booking page where clients can self-schedule appointments around the clock, along with tools to manage calendars, collect payments, and reduce no-shows. Key features include customizable booking pages, custom intake forms, calendar sync with Google and Apple Calendar to prevent double-booking, payment processing through Stripe, Square, or PayPal, automated email and text reminders, deposit collection and cancellation policies, staff and multi-location scheduling, and revenue tools such as packages, memberships, gift certificates, and coupons. It integrates with services including Zoom, Google Meet, QuickBooks, and Zapier, and offers a mobile app for managing bookings on the go. Acuity is priced on three paid tiers — Starter, Standard, and Premium — that scale by number of calendars and unlock features like text reminders, membership sales, HIPAA compliance (with a signed BAA), branding removal, and API/CSS customization on the top tier; each plan starts with a short free trial and no credit card required. It serves a wide range of industries, from solo coaches, therapists, and stylists to larger multi-staff wellness, fitness, and consulting businesses that need reliable self-service booking and payment collection.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Branded booking pages$q$, $q$Customizable, 24/7 client self-scheduling pages.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Calendar sync$q$, $q$Two-way sync with Google and Apple Calendar to prevent double-booking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Payment processing$q$, $q$Accept payments via Stripe, Square, or PayPal at time of booking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$No-show prevention$q$, $q$Deposits, cancellation policies, and automated email/text reminders.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Staff & location management$q$, $q$Manage availability across multiple staff members and locations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Revenue tools$q$, $q$Sell packages, memberships, subscriptions, and gift certificates.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Deep customization of booking pages and client workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Wide range of native integrations, including payments and video conferencing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Backed by Squarespace's infrastructure and support$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Built-in tools for selling packages, memberships, and gift certificates$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Pricing scales with number of calendars, which can get costly for larger teams$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$HIPAA compliance and full branding removal are limited to the top-tier Premium plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$No permanently free plan — only a short trial period$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Who owns Acuity Scheduling?$q$, $q$Acuity Scheduling is owned by Squarespace, which acquired the company in April 2019.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Does Acuity Scheduling have a free plan?$q$, $q$No permanent free plan; it offers a short free trial and requires a paid subscription afterward.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Can Acuity process payments?$q$, $q$Yes, it integrates with Stripe, Square, and PayPal for accepting payments at booking.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Is Acuity Scheduling HIPAA compliant?$q$, $q$HIPAA compliance, including BAA signing, is available on the Premium plan.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Solo service providers$q$, $q$Coaches, therapists, and stylists managing their own booking calendar and payments.$q$, $q$Solo practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Multi-staff wellness businesses$q$, $q$Spas, salons, and fitness studios coordinating bookings across multiple staff and locations.$q$, $q$Wellness and fitness businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Healthcare and HIPAA-sensitive scheduling$q$, $q$Practices needing signed BAAs for compliant appointment booking.$q$, $q$Healthcare providers$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Starter$q$, $q$$16/month$q$, $q$Annual (or $20/month billed monthly)$q$, NULL, $q$["1 calendar","Payment processing","Email reminders","Custom client forms","Automatic timezone conversion"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Standard$q$, $q$$27/month$q$, $q$Annual (or $34/month billed monthly)$q$, NULL, $q$["Up to 6 calendars","All Starter features","Text message reminders","Membership & package sales","Gift certificates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$Premium$q$, $q$$49/month$q$, $q$Annual (or $61/month billed monthly)$q$, NULL, $q$["Up to 36 calendars","All Standard features","HIPAA compliance (BAA)","No 'Powered by Acuity' branding","Custom API and CSS access"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'fb973a74-57dc-44bc-837f-58dfac85e6ce';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Acuity Scheduling is an online appointment booking platform that gives businesses a branded scheduling page clients can use to book appointments at any time. Founded in 2006, it was acquired by Squarespace in 2019 and now operates as part of the Squarespace family of products.$q$, $q$The platform is built for service-based businesses that need to manage bookings, collect payments, and reduce no-shows without manual back-and-forth scheduling.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Acuity provides customizable booking pages, custom client intake forms, calendar sync to prevent double-booking, and payment processing via Stripe, Square, or PayPal.$q$, $q$It also includes no-show prevention through deposits and cancellation policies, staff and multi-location scheduling, and revenue features like packages, memberships, subscriptions, gift certificates, and coupons.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Acuity offers three paid plans: Starter at $16/month, Standard at $27/month, and Premium at $49/month (annual billing; monthly billing costs more). Higher tiers add more calendars, text reminders, membership/package sales, HIPAA compliance, branding removal, and API access. Every plan includes a short free trial with no credit card required.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', $q$integrations$q$, $q$Integrations$q$, 2, ARRAY[$q$Acuity connects with Google Calendar, Apple Calendar, Stripe, Square, PayPal, QuickBooks, Zoom, Google Meet, Squarespace, and Zapier, among other tools.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb973a74-57dc-44bc-837f-58dfac85e6ce', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Adalo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adalo is a no-code platform for designing and publishing native iOS, Android, and web apps using a drag-and-drop visual builder, a hosted database, and an AI assistant.$q$, short_description),
  pricing_model = COALESCE($q$Freemium$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2018, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$St. Louis, Missouri, US$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Adalo: No-Code App Builder for iOS, Android & Web$q$, seo_title),
  seo_meta_description = COALESCE($q$No-code platform for building and publishing native iOS, Android, and web apps with a drag-and-drop builder, hosted database, and AI assistant.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adalo is a no-code app development platform founded in 2018 and headquartered in St. Louis, Missouri, that lets users design, build, and publish native iOS and Android apps as well as responsive web apps without writing code. Its core interface is a multi-screen, drag-and-drop visual canvas paired with pre-built components, feature templates (for things like scheduling, payments, and messaging), and a component marketplace for extending functionality. Adalo includes an AI assistant called Ada that can generate and edit parts of an app from prompts. Data can be stored in Adalo's built-in hosted Postgres database or connected to external sources such as Airtable and Google Sheets, and apps can integrate with thousands of external services through direct connections as well as Zapier and Make. From a single project, users can publish simultaneously to the Apple App Store, Google Play Store, and the web. Pricing follows a freemium model: a Free plan supports up to 500 records and unlimited test apps, while paid plans (Starter, Professional, and Team, billed monthly or annually) unlock published apps, custom domains, automated app store publishing, more editors, integrations, and features like push notifications, custom formulas, and white-labeling. Adalo is aimed at non-technical founders, small businesses, freelancers, agencies, and larger organizations that want to build and ship real mobile and web apps without hiring developers.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Drag-and-drop app builder$q$, $q$Visual, multi-screen canvas for designing app layouts without code.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$AI assistant (Ada)$q$, $q$Generate and edit app screens or logic from natural-language prompts.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Hosted database$q$, $q$Built-in Postgres database, or connect external sources like Airtable and Google Sheets.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Native app publishing$q$, $q$Publish to the Apple App Store and Google Play Store from one project.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Integrations$q$, $q$Direct connections to services like Zapier, Make, Stripe, Gmail, and HubSpot.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Templates and component marketplace$q$, $q$Pre-built feature templates and an extensible library of free and premium components.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$True no-code path to publishing native iOS and Android apps$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Free tier available for prototyping before committing to a paid plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Built-in database plus support for external data sources$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$AI assistant speeds up building common app screens$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Publishing to app stores and the web requires a paid plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Record limits on lower tiers can be restrictive for data-heavy apps$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Costs rise with number of published apps and team editors$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Is Adalo really no-code?$q$, $q$Yes, apps are built visually with a drag-and-drop canvas and pre-built components, without writing code.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Can I publish to the App Store and Google Play?$q$, $q$Yes, paid plans support automated publishing to both app stores from a single project.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Does Adalo have a free plan?$q$, $q$Yes, the Free plan supports up to 500 records and unlimited test apps, but published apps require a paid plan.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$What is Ada?$q$, $q$Ada is Adalo's built-in AI assistant that can generate or edit app screens and logic from prompts.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$MVP and startup app building$q$, $q$Founders building a functional app to validate an idea without hiring developers.$q$, $q$Startup founders$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Client app development$q$, $q$Agencies and freelancers building apps for clients using reusable templates and components.$q$, $q$Agencies and freelancers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Internal or small business apps$q$, $q$Small businesses building scheduling, booking, or data-tracking apps for their own operations.$q$, $q$Small business owners$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Free$q$, $q$$0/month$q$, $q$N/A$q$, NULL, $q$["500 records per app","Unlimited app actions","1 app editor","Hosted Postgres database","Unlimited test apps"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Starter$q$, $q$$36/month$q$, $q$Annual$q$, NULL, $q$["1 published app","Custom fonts and domain","Web publishing","Automated App Store publishing","No Adalo branding"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Professional$q$, $q$$52/month$q$, $q$Annual$q$, NULL, $q$["2 published apps","5 app editors","Custom integrations","Geolocation","Push notifications","App analytics"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$Team$q$, $q$$160/month$q$, $q$Annual$q$, NULL, $q$["5 published apps","10 app editors","Priority support","Xano integration","White labeling","Version history"]$q$::jsonb, 3);

DELETE FROM tool_content_blocks WHERE tool_id = 'ed8ef4d3-923b-43df-8e5d-e18829ae9f91';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adalo is a no-code platform, founded in 2018, that lets users visually design and publish native iOS and Android apps as well as web apps. It combines a drag-and-drop canvas with an AI assistant called Ada that can generate or edit parts of an app from a prompt.$q$, $q$Apps built in Adalo can be published from a single project to the Apple App Store, Google Play Store, and a custom web domain.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$The platform offers a multi-screen visual canvas, a hosted Postgres database (or connections to external data sources like Airtable and Google Sheets), a component marketplace, and pre-built templates for common app features such as scheduling, payments, and messaging.$q$, $q$Adalo also supports direct integrations with services like Zapier, Make, Stripe, Gmail, and HubSpot, so apps can connect to external tools without custom backend code.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$Adalo uses a freemium model. The Free plan allows up to 500 records and unlimited test apps but doesn't support publishing. Paid plans start at Starter ($36/month, one published app), Professional ($52/month, two published apps and more advanced features), and Team ($160/month, five published apps with white-labeling and priority support), all billed annually. Adalo states there are no usage- or token-based charges on top of these plans.$q$]::text[], 2);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', $q$who-its-for$q$, $q$Who It's For$q$, 2, ARRAY[$q$Adalo targets non-technical founders, small business owners, freelancers, and agencies building client apps, as well as larger organizations that need to publish multiple apps with team collaboration and white-labeling.$q$]::text[], 3);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ed8ef4d3-923b-43df-8e5d-e18829ae9f91', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── ADempiere ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$ADempiere is a free, open-source ERP and CRM business suite covering finance, supply chain, and manufacturing, self-hosted and maintained by a community since 2006.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2006, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$ADempiere: Free Open-Source ERP & CRM Suite$q$, seo_title),
  seo_meta_description = COALESCE($q$Free, open-source ERP and CRM business suite for finance, supply chain, and manufacturing, self-hosted and maintained by a global community.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$ADempiere is a free, open-source ERP (enterprise resource planning) and CRM business suite created in 2006 as a community fork of the Compiere ERP project. It is not run by a single company but maintained by an independent, bazaar-style open-source community with its own governance structure, including a community council, code of conduct, and project charter, supported by an association with members and a board. The software covers core business processes including finance, materials/supply chain management, manufacturing, and system administration, and includes a newer JavaScript-based user interface built with Vue. It is self-hosted, with deployment options including Docker, Helm, and Kubernetes Operator, giving organizations full control over their data and infrastructure without vendor lock-in or per-user licensing fees. Documentation covers developer guides, system administration, and functional tutorials, and the project has an active Discord community along with a history of in-person European developer conferences. Being fully open source under a copyleft license, ADempiere has no paid tiers or subscription plans; all costs come from self-hosting infrastructure and any optional third-party implementation or support services. It is best suited for small and mid-sized businesses, developers, and system integrators who want a customizable, self-hosted ERP/CRM alternative to proprietary commercial ERP systems and are comfortable managing their own deployment.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Finance & accounting$q$, $q$Core financial management as part of the ERP suite.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Materials & supply chain management$q$, $q$Tools for managing inventory and supply chain processes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Manufacturing management$q$, $q$Support for manufacturing and production processes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Vue-based UI$q$, $q$A modern JavaScript user interface built with Vue.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Flexible deployment$q$, $q$Self-host via Docker, Helm, or a Kubernetes Operator.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Community governance$q$, $q$Open, community-driven development with a council, code of conduct, and project charter.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Completely free and open source with no licensing fees$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Avoids vendor lock-in common with proprietary ERP systems$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Highly customizable and self-hostable$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Active, long-running open-source community since 2006$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Requires self-hosting and technical expertise to deploy and maintain$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Steeper learning curve than commercial SaaS ERP products$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Documentation and support are community-driven rather than vendor-backed$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Is ADempiere free to use?$q$, $q$Yes, ADempiere is fully open source and free, with no licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Is ADempiere self-hosted?$q$, $q$Yes, it is deployed on your own infrastructure, with support for Docker, Helm, and Kubernetes Operator deployments.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Who maintains ADempiere?$q$, $q$It is maintained by an independent open-source community with its own governance council, rather than a single company.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$What is ADempiere's history?$q$, $q$It began in 2006 as a community fork of the Compiere ERP project.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Self-hosted ERP for SMBs$q$, $q$Small and mid-sized businesses wanting a full ERP/CRM suite without per-user licensing costs.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$Custom ERP implementations$q$, $q$System integrators and developers building tailored business software on an open ERP foundation.$q$, $q$Developers and system integrators$q$, 1);

DELETE FROM tool_content_blocks WHERE tool_id = 'd896e501-64c6-49a9-a09c-ce638e9ebefe';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$ADempiere is a free, open-source ERP and CRM business suite that began in 2006 as a community fork of the Compiere ERP project. It is developed and governed by an independent open-source community rather than a single company.$q$, $q$The suite covers core business processes such as finance, materials/supply chain management, and manufacturing, and is designed to help organizations avoid vendor lock-in and licensing fees associated with proprietary ERP systems.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$ADempiere provides business process management, materials management, and system administration tools, along with a newer Vue-based JavaScript user interface. It supports modern deployment methods including Docker, Helm, and a Kubernetes Operator.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', $q$development-history$q$, $q$Development & Community$q$, 2, ARRAY[$q$The project operates under a 'bazaar-style' open governance model, with a community council, code of conduct, and project charter, backed by an association with members and a board. It maintains active documentation and a Discord community, and has held in-person European developer conferences.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d896e501-64c6-49a9-a09c-ce638e9ebefe', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── AdEspresso ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AdEspresso is a Facebook and Instagram ad management platform, now owned by Hootsuite, that helps businesses create, test, and optimize paid social campaigns from one dashboard.$q$, short_description),
  pricing_model = COALESCE($q$Free trial + paid plans$q$, pricing_model),
  starting_price = COALESCE($q$$49/month$q$, starting_price),
  founded_year = COALESCE(2012, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AdEspresso: Facebook & Instagram Ad Management$q$, seo_title),
  seo_meta_description = COALESCE($q$Facebook and Instagram ad management platform from Hootsuite offering campaign creation, split testing, and automated optimization tools.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AdEspresso is a digital advertising platform founded in 2012 that focuses on creating, managing, and optimizing Facebook and Instagram ad campaigns. It was acquired by social media management company Hootsuite in February 2017 and continues to operate as part of Hootsuite's advertising tools. AdEspresso lets users build campaigns across multiple ad accounts from a centralized dashboard, run split tests to compare ad variations, and apply automated optimization rules and performance triggers to shift budget toward better-performing ads. It supports collaboration features such as client approval workflows and role-based account access, reporting exports (web, PDF, email, Excel), and, on higher tiers, white-label reporting and Salesforce contacts sync. Pricing is subscription-based across three tiers: Starter at $49/month (up to $1,000 in monthly ad spend), Plus at $99/month (unlimited ad spend, more team seats, and multi-page bulk creation), and Enterprise starting at $259/month (unlimited ad spend, dedicated marketing consultant, monthly strategy sessions, and API access). All plans include a 14-day free trial. AdEspresso is aimed at digital marketing agencies managing multiple client ad accounts, e-commerce businesses, and SMBs that want to run and continuously optimize Facebook and Instagram advertising without manually managing campaigns inside Meta's native ads tools.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Multi-account campaign creation$q$, $q$Build Facebook and Instagram campaigns across multiple ad accounts from one dashboard.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Split testing$q$, $q$Compare ad variations to identify top performers.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Automated optimization$q$, $q$Apply performance triggers that automatically shift budget toward better-performing ads.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Reporting & exports$q$, $q$Generate reports and export them as web, PDF, email, or Excel formats.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Team collaboration$q$, $q$Client approval workflows and role-based account access.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$White-label reporting$q$, $q$Available on higher tiers for agencies presenting results to clients.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Strong split-testing and automated optimization tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Centralized management of multiple Facebook/Instagram ad accounts$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$White-label reporting and collaboration features for agencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Backed by Hootsuite's infrastructure$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$No permanent free plan, only a 14-day trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Focused solely on Facebook and Instagram, not other ad networks$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Enterprise-level features and unlimited spend require the highest, priciest tier$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Who owns AdEspresso?$q$, $q$AdEspresso has been owned by Hootsuite since Hootsuite acquired it in February 2017.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Does AdEspresso have a free plan?$q$, $q$No permanent free plan; it offers a 14-day free trial before requiring a paid subscription.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Which ad platforms does AdEspresso support?$q$, $q$It focuses on Facebook and Instagram advertising campaigns.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$What does the Starter plan include?$q$, $q$The Starter plan is $49/month for up to $1,000 in monthly ad spend, with core campaign creation, split testing, and reporting features.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Agency ad management$q$, $q$Agencies managing Facebook and Instagram ads across multiple client accounts with approval workflows.$q$, $q$Digital marketing agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$E-commerce advertising$q$, $q$Online stores running and optimizing paid social campaigns to drive sales.$q$, $q$E-commerce businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Split-test-driven campaign optimization$q$, $q$Marketing teams testing ad variations and automating budget allocation based on performance.$q$, $q$SMB marketing teams$q$, 2);

DELETE FROM tool_pricing_plans WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Starter$q$, $q$$49/month$q$, $q$Monthly$q$, NULL, $q$["Up to $1,000/month ad spend","Unlimited ad accounts","Split testing analysis","Automated optimization","Reporting tools"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Plus$q$, $q$$99/month$q$, $q$Monthly$q$, NULL, $q$["Unlimited ad spend","Multi-page bulk creation","Campaign approval","Up to 15 team seats","White label reports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, description, features, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$Enterprise$q$, $q$Starting at $259/month$q$, $q$Monthly$q$, NULL, $q$["Unlimited ad spend","Dedicated marketing consultant","Unlimited team seats","API access","Salesforce contacts sync"]$q$::jsonb, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '951b342f-ef42-4fc5-afdd-6e5a7df3ad94';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AdEspresso is a Facebook and Instagram ad management platform founded in 2012. Hootsuite acquired the company in February 2017, and AdEspresso now operates as part of Hootsuite's advertising product line.$q$, $q$The platform is built to simplify creating, managing, and analyzing paid social campaigns across multiple ad accounts from a single dashboard.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AdEspresso supports building campaigns across multiple channels and accounts simultaneously, split testing to compare ad variations, and automated optimization rules that shift budget based on performance triggers.$q$, $q$It also offers collaboration tools like client approval workflows, role-based access, and reporting exports in web, PDF, email, and Excel formats.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', $q$pricing-overview$q$, $q$Pricing$q$, 2, ARRAY[$q$AdEspresso is priced on three subscription tiers: Starter at $49/month (up to $1,000/month ad spend), Plus at $99/month (unlimited ad spend, more seats, campaign approval), and Enterprise starting at $259/month (unlimited ad spend, dedicated consultant, API access, Salesforce sync). All plans include a 14-day free trial.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('951b342f-ef42-4fc5-afdd-6e5a7df3ad94', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── AdGuard Home ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$AdGuard Home is a free, open-source, self-hosted DNS server that blocks ads and trackers network-wide for every connected device, made by AdGuard Software.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2009, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE($q$Limassol, Cyprus$q$, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$AdGuard Home: Free Network-Wide Ad & Tracker Blocker$q$, seo_title),
  seo_meta_description = COALESCE($q$Free, open-source, self-hosted DNS server that blocks ads and trackers across your whole network, from AdGuard Software.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$AdGuard Home is a free, open-source, network-wide DNS-based ad and tracker blocker made by AdGuard Software Ltd, a company founded in 2009 and headquartered in Limassol, Cyprus. Instead of installing a browser extension per device, AdGuard Home is installed once on a router, computer, or device like a Raspberry Pi and filters DNS requests for every device on the network, blocking ads and redirecting tracking-domain lookups to prevent data exchange with tracking servers. It also offers parental controls, including content filtering and Safe Search enforcement, support for custom filtering rules for advanced users, and activity monitoring with network statistics. Because it is self-hosted, users run and control their own instance rather than relying on a third-party cloud service; the source code is publicly available on GitHub. AdGuard Home supports Windows, macOS, and Linux natively, runs well on low-power hardware like the Raspberry Pi, and offers an official Docker image along with packages for Snap, Home Assistant, and OpenWrt. It is free with no paid tier, distinct from AdGuard's separate cloud-hosted DNS product, AdGuard DNS. AdGuard Home is best suited for privacy-conscious users, home labbers, and small organizations who want to block ads and trackers for an entire network from a single, self-managed point rather than device by device.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Network-wide DNS filtering$q$, $q$Blocks ads and trackers for every device on the network from a single install.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Custom filtering rules$q$, $q$Advanced users can add personalized blocklist rules.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Parental controls$q$, $q$Content filtering and Safe Search enforcement.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Activity monitoring$q$, $q$Network activity tracking and statistics dashboard.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Cross-platform support$q$, $q$Runs on Windows, macOS, Linux, and low-power devices like Raspberry Pi.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Docker support$q$, $q$Official Docker image for containerized deployment.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Completely free and open source$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Blocks ads and trackers across an entire network without per-device apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Full control via self-hosting, including on low-power hardware$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Runs well on inexpensive hardware like a Raspberry Pi$q$, 3);

DELETE FROM tool_cons WHERE tool_id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Requires some technical setup to install and maintain your own server$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$No fully managed cloud option under this product (that's AdGuard's separate AdGuard DNS product)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Effectiveness depends on network configuration, such as devices using the configured DNS server$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Is AdGuard Home free?$q$, $q$Yes, AdGuard Home is free and open source with no paid tier.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Do I need to self-host AdGuard Home?$q$, $q$Yes, it's designed to be installed and run on your own hardware, such as a router, home server, or Raspberry Pi.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$What platforms does AdGuard Home support?$q$, $q$It runs natively on Windows, macOS, and Linux, and supports Docker and Raspberry Pi deployments.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$How is AdGuard Home different from a browser ad blocker?$q$, $q$It filters DNS requests at the network level, blocking ads and trackers for every connected device rather than a single browser.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Home network ad and tracker blocking$q$, $q$Block ads and trackers across every device on a home network from one place.$q$, $q$Privacy-conscious home users$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Self-hosted network filtering$q$, $q$Run AdGuard Home on a Raspberry Pi or home server as part of a self-hosted infrastructure setup.$q$, $q$Home-lab and self-hosting enthusiasts$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$Small office network protection$q$, $q$Provide network-wide ad blocking and content filtering for a small office without per-device software.$q$, $q$Small businesses$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = 'b231ad20-3ac0-418a-8e94-0bcad60fb2de';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$AdGuard Home is a free, open-source, network-wide ad and tracker blocker built by AdGuard Software Ltd, founded in 2009 and headquartered in Limassol, Cyprus. Rather than blocking ads per device or browser, it operates as a DNS server that filters requests for every device on a network.$q$, $q$It is self-hosted, meaning users install and run it themselves on hardware such as a router, home server, or Raspberry Pi, giving full control over filtering without depending on a third-party cloud service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$AdGuard Home blocks ads and redirects tracking-domain lookups at the DNS level for browsers and apps alike. It includes parental controls such as content filtering and Safe Search enforcement, support for custom filtering rules, and activity monitoring with network statistics.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', $q$platforms$q$, $q$Platforms & Deployment$q$, 2, ARRAY[$q$AdGuard Home runs natively on Windows, macOS, and Linux, including low-power devices like the Raspberry Pi. It also offers an official Docker image and packages for platforms like Snap, Home Assistant, and OpenWrt, making it deployable in a wide range of home and small-network setups.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', 'f24fb236-dfcf-452c-9b9e-02926f4383d9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b231ad20-3ac0-418a-8e94-0bcad60fb2de', '381992fc-7997-449c-9c68-511f0dce4b99') ON CONFLICT DO NOTHING;

-- ── admidio ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Admidio is a free, open-source, self-hosted PHP application for managing memberships, events, documents, and communication for clubs, associations, and community organizations.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2004, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$, $q$German$q$]::text[],
  seo_title = COALESCE($q$Admidio: Free Membership Management for Organizations$q$, seo_title),
  seo_meta_description = COALESCE($q$Free, open-source, self-hosted membership management software for clubs, associations, and community organizations.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Admidio is a free, open-source membership and organization management application, in active development since 2004, aimed at clubs, associations, and community groups. It is a self-hosted, PHP-based web application that organizations install on their own web space to manage members and administrative tasks online. Core functionality includes member databases with role-based access control, customizable membership lists exportable to Excel, PDF, and CSV, event management with online registration, photo galleries and albums, document and file sharing, CSV-based user import and updates, and an extensible plugin system. Access to member data can be restricted by role, letting organizations grant different permissions to group leaders, webmasters, and general members. Development is community-driven and ongoing, with an active presence on GitHub, forums, and social platforms such as Mastodon and Instagram. Because Admidio is fully open source, it has no licensing cost or paid tiers; the only costs involved are the web hosting and PHP environment needed to run it. It suits nonprofit clubs, sports associations, hobby groups, and other community organizations that want a purpose-built, self-hosted alternative to generic spreadsheet-based or commercial membership-management tools, particularly organizations comfortable managing their own PHP hosting.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Role-based member database$q$, $q$Manage member data with access controls tied to organizational roles.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Event management$q$, $q$Create events with online registration for members.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Photo galleries$q$, $q$Organize and share photo albums with members.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Document & file sharing$q$, $q$Share files and documents within the organization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Exportable membership lists$q$, $q$Export member lists to Excel, PDF, or CSV.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Plugin support$q$, $q$Extend functionality with community plugins.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Free and fully open source with no licensing cost$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Purpose-built for clubs and associations, not a generic tool$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Full data control through self-hosting$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Long-running, actively maintained community project since 2004$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Requires your own PHP web hosting to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Interface is less modern than some commercial membership platforms$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Smaller ecosystem and support base than mainstream SaaS alternatives$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Is Admidio free?$q$, $q$Yes, Admidio is free and open source with no licensing fees.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Do I need to host Admidio myself?$q$, $q$Yes, it's a self-hosted PHP application that you install on your own web hosting.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Who is Admidio for?$q$, $q$It's designed for clubs, associations, and community organizations managing members, events, and documents.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Can Admidio manage event registrations?$q$, $q$Yes, it includes event management with online registration functionality.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Club and association membership management$q$, $q$Manage member records, roles, and communication for a nonprofit club or association.$q$, $q$Nonprofit clubs and associations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Event registration for community groups$q$, $q$Run event sign-ups and registration for community organizations.$q$, $q$Sports clubs and community groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$Document and photo sharing for members$q$, $q$Share files, documents, and photo albums within a member organization.$q$, $q$Community organization administrators$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Admidio is a free, open-source membership and organization management application that has been in active development since 2004. It is designed specifically for associations, clubs, and community groups that need to manage members and administrative tasks online.$q$, $q$The software is self-hosted and built in PHP, so organizations install it on their own web hosting rather than using a hosted SaaS product.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Admidio includes a role-based member database with access controls, customizable and exportable membership lists (Excel, PDF, CSV), event management with online registration, photo galleries, document and file sharing, and CSV import/update tools for member data.$q$, $q$The platform supports plugins for extended functionality and lets organizations assign different rights to roles such as group leaders and webmasters.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', $q$development-history$q$, $q$Development & Community$q$, 2, ARRAY[$q$Admidio has been developed continuously since 2004, with an active open-source community maintaining the project on GitHub and supporting users through forums and social channels.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('101c32bc-41e0-47dc-bff2-b5e2c5c7b0a5', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;

-- ── Adminer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = COALESCE($q$Adminer is a free, open-source database management tool distributed as a single PHP file, supporting MySQL, PostgreSQL, SQLite, MS SQL, Oracle, and more.$q$, short_description),
  pricing_model = COALESCE($q$Free (open source)$q$, pricing_model),
  starting_price = COALESCE($q$Free$q$, starting_price),
  founded_year = COALESCE(2007, founded_year),
  company_size = COALESCE(NULL, company_size),
  headquarters = COALESCE(NULL, headquarters),
  languages = ARRAY[$q$English$q$]::text[],
  seo_title = COALESCE($q$Adminer: Free Single-File Database Management Tool$q$, seo_title),
  seo_meta_description = COALESCE($q$Free, open-source, single-file PHP database management tool supporting MySQL, PostgreSQL, SQLite, MS SQL, Oracle, and more.$q$, seo_meta_description),
  llm_readable_summary = COALESCE($q$Adminer is a free, open-source database management tool created by developer Jakub Vrána, first released in 2007 as a lighter-weight alternative to phpMyAdmin. It is distributed as a single PHP file, which can simply be uploaded to a PHP-enabled server to provide a full web-based database administration interface, without a separate installation process. Adminer supports MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB natively, with additional support for databases like MongoDB, Redis, Elasticsearch, and Firebird available through plugins. Core functionality includes browsing and editing table structures and data, running SQL commands, exporting databases, and managing indexes, foreign keys, views, stored procedures, triggers, and user permissions. It requires PHP 5.3 or later with sessions enabled, and community-maintained packages exist for deploying it via Docker, Debian, WordPress, and Drupal, among other environments. Adminer is released under a dual Apache 2.0 / GPL 2 license, making it free for both commercial and non-commercial use, with no paid tiers. It is best suited for developers and system administrators who want a lightweight, portable database management tool that can run on nearly any PHP host, particularly as an alternative to heavier tools like phpMyAdmin when working across multiple database engines.$q$, llm_readable_summary),
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0e2f15fa-8304-4251-896f-4956273cb503';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0e2f15fa-8304-4251-896f-4956273cb503' AND logo IS NULL AND website IS NOT NULL;

DELETE FROM tool_features WHERE tool_id = '0e2f15fa-8304-4251-896f-4956273cb503';
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Single-file deployment$q$, $q$The entire tool is a single PHP file that can be uploaded directly to a server.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Multi-database support$q$, $q$Native support for MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Table & data editing$q$, $q$Browse, edit, search, sort, and filter table data and structure.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$SQL command execution$q$, $q$Run raw SQL commands directly against the database.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Export functionality$q$, $q$Export databases and query results.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Plugin extensibility$q$, $q$Add support for databases like MongoDB, Redis, and Elasticsearch via plugins.$q$, 5);

DELETE FROM tool_pros WHERE tool_id = '0e2f15fa-8304-4251-896f-4956273cb503';
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Extremely lightweight and portable as a single PHP file$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Free and open source under Apache 2.0 / GPL 2 dual license$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Broad database support, including through plugins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Actively maintained with regular releases$q$, 3);

DELETE FROM tool_cons WHERE tool_id = '0e2f15fa-8304-4251-896f-4956273cb503';
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Requires a PHP server environment to run$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Less feature-rich UI than dedicated desktop database clients$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Care is needed when exposing it on a public-facing server, as with any web-based DB admin tool$q$, 2);

DELETE FROM tool_faqs WHERE tool_id = '0e2f15fa-8304-4251-896f-4956273cb503';
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Is Adminer free?$q$, $q$Yes, Adminer is free and open source, licensed under Apache 2.0 / GPL 2, for both commercial and non-commercial use.$q$, 0, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$What databases does Adminer support?$q$, $q$It natively supports MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB, with plugins for others like MongoDB and Redis.$q$, 1, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$How is Adminer installed?$q$, $q$It's a single PHP file that you upload to any PHP-enabled server; no separate installation process is required.$q$, 2, 'published');
INSERT INTO tool_faqs (tool_id, question, answer, sort_order, status) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$How does Adminer compare to phpMyAdmin?$q$, $q$Adminer was created as a lighter-weight, single-file alternative to phpMyAdmin, supporting more database engines out of the box.$q$, 3, 'published');

DELETE FROM tool_use_cases WHERE tool_id = '0e2f15fa-8304-4251-896f-4956273cb503';
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Quick lightweight database administration$q$, $q$Developers needing a fast, portable way to browse and edit databases without a full desktop client.$q$, $q$Developers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Shared hosting database management$q$, $q$Sysadmins managing MySQL or PostgreSQL databases on shared or budget hosting environments.$q$, $q$System administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$Alternative to phpMyAdmin$q$, $q$Teams wanting a lighter-weight, single-file alternative to phpMyAdmin across multiple database engines.$q$, $q$Web developers and DBAs$q$, 2);

DELETE FROM tool_content_blocks WHERE tool_id = '0e2f15fa-8304-4251-896f-4956273cb503';
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$overview$q$, $q$Overview$q$, 2, ARRAY[$q$Adminer is a free, open-source database management tool created by developer Jakub Vrána and first released in 2007 as a lightweight alternative to phpMyAdmin. Its defining feature is that the entire application ships as a single PHP file.$q$, $q$Because it requires no separate install process beyond uploading that file to a PHP-enabled server, Adminer is especially portable and easy to deploy on shared hosting or alongside other web applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$key-features$q$, $q$Key Features$q$, 2, ARRAY[$q$Adminer supports browsing and editing table structures and data, running raw SQL commands, exporting databases, and managing indexes, foreign keys, views, stored procedures, triggers, and user/rights management.$q$, $q$It natively supports MySQL, MariaDB, PostgreSQL, SQLite, MS SQL, Oracle, and CockroachDB, with plugin-based support for additional systems like MongoDB, Redis, Elasticsearch, and Firebird.$q$]::text[], 1);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', $q$platforms$q$, $q$Deployment$q$, 2, ARRAY[$q$Adminer runs on any server with PHP 5.3+ and sessions enabled. Community-maintained packages make it easy to deploy via Docker, Debian, WordPress, Drupal, and other platforms.$q$]::text[], 2);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', '97eb8f3e-e378-4a5d-b2a5-331706e86e50') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0e2f15fa-8304-4251-896f-4956273cb503', 'efe7ced3-7cfa-4b39-9792-3427d24fa58d') ON CONFLICT DO NOTHING;


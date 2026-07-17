-- Enrichment batch: Documenso, Docuseal, BoldSign, SignWell, SignRequest, Oneflow, Scrive, Penneo, Concord, Juro, LinkSquares, SpotDraft, Contractbook, Sirion, Icertis, Agiloft, Evisort, Lexion, Robin AI, Spellbook, Harvey, Filevine, Litify, CosmoLex, TimeSolv, Bill4Time, Actionstep, CASEpeer, CloudLex, Everlaw, RelativityOne, Logikcull, DISCO, Reveal, Nextpoint, TheraNest, Jane App, Doctolib, Cliniko, Pabau, Carepatron, Healthie, Practice Better, Nutrium, Halaxy, Spruce Health, OhMD, Luma Health, Artera, Weave, Birdeye, Reputation, ReviewTrackers, GatherUp, Grade.us, NiceJob, Broadly, SOCi, Yext, Uberall, Synup, BrightLocal, Whitespark, Local Falcon, Places Scout, GeoRanker, Localo, Grid My Business, Merchynt, Chatmeter, Rio SEO, Marqii, Owner.com
-- Publishes 73 bulk-imported tool(s) with full editorial content.

-- ── Documenso ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source e-signature platform for creating, sending, and signing documents, with cloud or self-hosted deployment options.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Documenso is an open-source e-signature platform with free, team, and self-hosted plans for signing and managing documents.$q$,
  og_description = $q$Documenso is an open-source e-signature platform with free, team, and self-hosted plans for signing and managing documents.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4da77cfa-32ce-403c-8b98-4e1620167573';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4da77cfa-32ce-403c-8b98-4e1620167573' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Document workflows and templates$q$, $q$Create reusable, directly-linkable templates to speed up repeated document signing workflows.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$API and webhooks$q$, $q$Build custom signing automations and integrations using Documenso's API and webhook support.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Team collaboration$q$, $q$The Teams plan includes 5 users (expandable) and a shared team workspace for collaborative document signing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Embedded and white-label signing$q$, $q$The Platform plan supports embedded signing with white-label branding for deeper product integration.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Open-source and self-hosting$q$, $q$Documenso's code is open source on GitHub, and organizations can self-host via Docker instead of using the hosted cloud service.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Public signer profile$q$, $q$Users get a public profile page, with a premium profile name available on paid plans.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Compliance certifications$q$, $q$Documenso states compliance with the ESIGN Act, UETA, 21 CFR Part 11, SOC2, and HIPAA.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Open-source codebase available on GitHub for transparency and self-hosting$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Free plan available with no credit card required (5 documents/month)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Self-hosted licensing option for full infrastructure control$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$API access included even on the Individual plan for personal automation$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$States compliance with ESIGN Act, UETA, 21 CFR Part 11, SOC2, and HIPAA$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Free plan is limited to 5 documents per month and 10 recipients per document$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$White-label and enterprise add-ons require the higher-priced Platform or Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Language support is not documented on the website$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Company headquarters and founding year are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Is Documenso open source?$q$, $q$Yes, Documenso states its code is open source and available on GitHub, and it can be self-hosted via Docker.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Does Documenso have a free plan?$q$, $q$Yes, the Free plan allows up to 5 documents per month with up to 10 recipients per document, and no credit card is required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Can I self-host Documenso?$q$, $q$Yes, Documenso offers a self-hosted licensing option in addition to its hosted cloud service.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$What compliance standards does Documenso support?$q$, $q$Documenso states support for the ESIGN Act, UETA, 21 CFR Part 11, SOC2, and HIPAA.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Does Documenso offer an API?$q$, $q$Yes, API access is included starting with the Individual plan, with unlimited API access on the Platform plan.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Individual document signing$q$, $q$Individuals who need to sign or send a low volume of documents can use the free plan or the Individual plan for unlimited documents.$q$, $q$Freelancers and individual professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Team contract workflows$q$, $q$The Teams plan supports a shared workspace and embedded signing for collaborative document workflows.$q$, $q$Small to mid-size teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Custom product integration$q$, $q$The Platform plan offers unlimited API access and white-label embedded signing for companies building signing into their own products.$q$, $q$Developers and platform builders$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Self-hosted deployment$q$, $q$Organizations that require full infrastructure control can self-host Documenso instead of using the hosted cloud version.$q$, $q$Enterprises and privacy-conscious organizations$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Free$q$, $q$$0$q$, NULL, $q$["5 documents/month","Up to 10 recipients per document","No credit card required"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Individual$q$, $q$$25/month ($300/year)$q$, $q$annual$q$, $q$["Unlimited documents","API access for personal use","Email support","Premium profile name"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Teams$q$, $q$$40/month ($480/year)$q$, $q$annual$q$, $q$["5 users included (+$8/month per extra user)","Unlimited documents","1 team included","API access for automation","Embedded signing","Email support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Platform$q$, $q$$250/month ($3,000/year)$q$, $q$annual$q$, $q$["Unlimited documents and users","Unlimited API access","Slack integration support","Embedded signing with white-label","Enterprise add-ons available"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$Enterprise$q$, $q$Custom quote$q$, NULL, $q$["Cloud or self-hosted deployment","Advanced compliance","Custom licensing","Dedicated support"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$overview$q$, $q$What is Documenso?$q$, 2, ARRAY[$q$Documenso is an electronic signature platform for creating, sending, and signing documents online, with tools for building signing workflows and reusable templates.$q$, $q$The product is open source, with its code published on GitHub, and can be used as a hosted cloud service or self-hosted on your own infrastructure via Docker.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', $q$who-its-for$q$, $q$Who Documenso is for$q$, 2, ARRAY[$q$Documenso serves individuals who need a free or low-cost way to sign occasional documents, as well as teams and platform builders who need API access, embedded signing, and white-label options.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4da77cfa-32ce-403c-8b98-4e1620167573', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Docuseal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Open-source e-signature and document workflow platform for legally binding contracts, offering free, cloud, and self-hosted plans.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$20/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$DocuSeal is an open-source e-signature tool with a free plan, self-hosted option, and API for document signing workflows.$q$,
  og_description = $q$DocuSeal is an open-source e-signature tool with a free plan, self-hosted option, and API for document signing workflows.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fed2af81-3cbf-403c-8135-b548f382e7ac';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fed2af81-3cbf-403c-8135-b548f382e7ac' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Document signing API$q$, $q$Build custom signing automations and embed document workflows into your own applications using DocuSeal's API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Embedded and React signing$q$, $q$A dedicated React component lets developers embed the document signing experience directly into their apps.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Payment collection$q$, $q$Collect payments from signers as part of the signing workflow.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Qualified Electronic Signature$q$, $q$Supports Qualified Electronic Signatures for the highest level of legal trust.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Knowledge-Based Authentication$q$, $q$Verifies signer identity through knowledge-based authentication before signing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Broad file format support$q$, $q$Supports signing workflows for PDF, DOCX, XLSX, JPEG, PNG, and ZIP files up to 100MB.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$AI-native workflows$q$, $q$DocuSeal highlights new AI-native workflow capabilities on its site.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Self-hosted and cloud deployment$q$, $q$Available as a cloud-hosted service, a GDPR-compliant EU Cloud option, or a self-hosted on-premises installation.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Free forever plan for individuals$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Open-source on-premises option with GitHub-based support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$GDPR-compliant EU Cloud deployment option available$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Supports a wide range of file formats (PDF, DOCX, XLSX, JPEG, PNG, ZIP)$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$States it is used by 191,100+ businesses and individuals$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Free Basic plan is limited to 10 signature request emails and 20 SMS requests per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$SSO/SAML, bulk sending, and white-label branding require the paid Pro plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$ID verification and Qualified Electronic Signature carry additional per-use fees ($2-4)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Is DocuSeal open source?$q$, $q$Yes, DocuSeal offers a free, open-source on-premises plan supported through GitHub, alongside its hosted cloud plans.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Does DocuSeal have a free plan?$q$, $q$Yes, the Basic cloud plan is free and includes legally-binding e-signatures, indefinite document retention, and up to 10 signature request emails per month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Can DocuSeal be self-hosted?$q$, $q$Yes, DocuSeal provides an Open Source on-premises plan as well as a paid on-premises Pro license for full data control.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Does DocuSeal charge extra for identity verification?$q$, $q$Yes, ID verification costs $2 per verification and Qualified Electronic Signature costs $2-4 per signature.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Does DocuSeal support AI features?$q$, $q$DocuSeal's site highlights new AI-native workflow capabilities.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Individual e-signing$q$, $q$Individuals can use the free Basic or Open Source plan for legally-binding signatures with indefinite document retention.$q$, $q$Freelancers and individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Business compliance and branding$q$, $q$The Pro plan adds custom branding, automated reminders, SSO/SAML, and bulk sending for organizations with compliance and workflow needs.$q$, $q$Businesses in healthcare, financial services, real estate, and education$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Developer-embedded signing$q$, $q$The signing API and React component let developers embed document signing directly into their own products.$q$, $q$Developers and platform builders$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Data-sensitive self-hosting$q$, $q$The on-premises Open Source and Pro license plans let organizations run DocuSeal on their own infrastructure for full data control.$q$, $q$Enterprises and privacy-conscious organizations$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Basic (Cloud, Free)$q$, $q$$0/user/month$q$, $q$monthly$q$, $q$["Legally-binding eSignature","Indefinite document retention","User management","Multiple signers","10 field types","10 request emails/month","Email support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Pro (Cloud)$q$, $q$$20/user/month$q$, $q$monthly$q$, $q$["Unlimited signature requests","Custom branding","Personal email address","Automated reminders","Payment collection","Zapier/webhooks integration","Team management","Bulk sending","SSO/SAML","SMS identity verification","API and embedding","Account Manager support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Open Source (On-Premises, Free)$q$, $q$$0$q$, NULL, $q$["Legally-binding signing","Indefinite retention","User management","Multiple signers","10 field types","Own SMTP email","GitHub support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$Pro (On-Premises license)$q$, $q$$20/user/month$q$, $q$monthly$q$, $q$["Everything in OSS","White-label customization","Complete data control","Personalized emails","Automated reminders","Payment acceptance","Webhooks","Team roles","Bulk spreadsheet sending","SSO/SAML","SMS verification","API access","Account Manager support"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$overview$q$, $q$What is Docuseal?$q$, 2, ARRAY[$q$DocuSeal is an open-source document signing platform positioned as an alternative to DocuSign and PandaDoc, supporting legally-binding e-signatures.$q$, $q$It can be deployed as a cloud-hosted service, including a GDPR-compliant EU Cloud option, or self-hosted on-premises, with an open-source edition supported via GitHub.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', $q$who-its-for$q$, $q$Who Docuseal is for$q$, 2, ARRAY[$q$DocuSeal is used by individuals seeking a free e-signature tool as well as businesses in software, healthcare, real estate, education, and financial services that need compliance, branding, and API-driven signing workflows.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fed2af81-3cbf-403c-8135-b548f382e7ac', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── BoldSign ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$BoldSign is an electronic signature platform for sending, tracking, and embedding signing workflows, with an API and CRM integrations.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$5/month per user (billed annually) on the Growth plan; a free Essential plan is also available$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Morrisville, NC, USA$q$,
  languages = '{}',
  seo_meta_description = $q$BoldSign e-signature software: send, track, and embed signing workflows with bulk send, templates, and an API. Free plan and 30-day trial available.$q$,
  og_description = $q$BoldSign e-signature software: send, track, and embed signing workflows with bulk send, templates, and an API. Free plan and 30-day trial available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'de8338ea-b5f1-466f-9506-f229d3f662f7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'de8338ea-b5f1-466f-9506-f229d3f662f7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Bulk sending$q$, $q$Send documents to hundreds of recipients at once via CSV upload.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Embedded signing$q$, $q$Embed signing links and workflows into your own app without writing custom signing UI code.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$AI field detection$q$, $q$Automatically detects and places signature and form fields on uploaded documents (Business plan and above).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Signer verification$q$, $q$Includes ID verification and authentication options to reduce signing fraud.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Templates$q$, $q$Reusable document templates, with template sharing available on higher-tier plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Custom branding$q$, $q$Add a custom logo, colors, and personalized email messaging to the signing experience.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Developer API and SDKs$q$, $q$REST API with SDKs for cURL, C#, Java, PHP, Python, and Node.js, plus webhook support.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Pre-built integrations$q$, $q$Connects with Salesforce, HubSpot, Microsoft OneDrive, Power Automate, Zapier, and Xero.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Offers a genuine free tier (Essential) with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$30-day free trial available on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Unlimited envelopes and templates on the Business plan$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Broad developer support with multiple language SDKs and webhooks$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$SOC 2, GDPR, HIPAA, and PCI DSS compliance noted on the site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Free Essential plan is capped at 25 envelopes and 2 templates per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Advanced features like SSO, custom roles, and AI field detection are gated to the Business plan and above$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$API access is billed separately, per envelope, on top of app plans$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Does BoldSign have a free plan?$q$, $q$Yes, the Essential plan is free and includes 25 envelopes and 2 templates per month with no additional users.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Is there a free trial for paid plans?$q$, $q$Yes, BoldSign offers a 30-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Does BoldSign have an API?$q$, $q$Yes, BoldSign offers a REST API with SDKs for cURL, C#, Java, PHP, Python, and Node.js, priced separately at $0.75 per envelope with a $30/month minimum.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$What integrations does BoldSign support?$q$, $q$BoldSign integrates with Salesforce, HubSpot, Microsoft OneDrive, Power Automate, Zapier, and Xero.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Is BoldSign compliant with security standards?$q$, $q$The site states BoldSign is SOC 2, GDPR, HIPAA, and PCI DSS certified, and uses AES-256 encryption.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Contract signing for growing teams$q$, $q$Send and track contracts with unlimited envelopes and templates plus team management features.$q$, $q$Small and mid-size business teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Embedded signing in a product$q$, $q$Use embedded signing links and the API/SDKs to add e-signature workflows directly into an existing application.$q$, $q$Developers and SaaS product teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$High-volume outbound agreements$q$, $q$Use bulk CSV sending to distribute the same document to hundreds of recipients at once.$q$, $q$Sales and operations teams sending agreements at scale$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Essential (Free)$q$, $q$$0$q$, NULL, $q$["25 envelopes/month","2 templates","audit trail","signer authentication","automated reminders","multi-language support","custom branding"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Growth$q$, $q$$5/month per user (annual) / $15/month per user (monthly)$q$, $q$monthly$q$, $q$["50 envelopes/month per user","10 templates","template sharing","dynamic field placement","in-person signing","team management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Business$q$, $q$$15/month per user (annual) / $25/month per user (monthly)$q$, $q$monthly$q$, $q$["unlimited envelopes","unlimited templates","SSO","custom roles","AI-powered field detection","HIPAA compliance","dedicated account manager"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Premium$q$, $q$$99/month (annual) / $138/month (monthly), unlimited users$q$, $q$monthly$q$, $q$["250 envelopes/month","unlimited templates","all Business features","unlimited team members"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$Enterprise API$q$, $q$$0.75 per envelope (min $30/month for 40 envelopes)$q$, $q$monthly$q$, $q$["two application users included","embedded requesting/signing","webhooks","advanced authentication","Power Automate integration","free sandbox for testing"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$overview$q$, $q$What is BoldSign?$q$, 2, ARRAY[$q$BoldSign is an electronic signature platform that lets users send, track, and embed signing workflows, according to its website.$q$, $q$It offers a free Essential plan alongside paid Growth, Business, and Premium tiers, plus a separately priced API for developers building embedded signing into their own applications.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', $q$who-its-for$q$, $q$Who BoldSign is for$q$, 2, ARRAY[$q$BoldSign is positioned for businesses that need bulk sending, custom branding, and integrations with tools like Salesforce, HubSpot, and Zapier, as well as developers who want to embed signing via its API and SDKs.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('de8338ea-b5f1-466f-9506-f229d3f662f7', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── SignWell ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SignWell is an electronic signature platform for sending legally binding documents for signature, with a free plan and developer API.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$10/month per sender (billed monthly), $12/month billed annually, on the Light plan$q$,
  founded_year = 2019,
  company_size = NULL,
  headquarters = $q$Portland, Oregon, USA$q$,
  languages = '{}',
  seo_meta_description = $q$SignWell e-signature software: send legally binding documents in minutes with templates, an API, and a free plan. Paid plans start at $10/month.$q$,
  og_description = $q$SignWell e-signature software: send legally binding documents in minutes with templates, an API, and a free plan. Paid plans start at $10/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '082213b2-ced8-444a-8548-3b973c136452';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '082213b2-ced8-444a-8548-3b973c136452' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Document signing$q$, $q$Send documents for legally binding eSignature, optimized for signing from any device.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Reusable templates$q$, $q$Create custom templates with pre-fill capabilities to speed up repeated document sends.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Document workflows$q$, $q$Set signing orders and conditional logic for multi-party document routing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$eSignature API$q$, $q$REST API with full documentation, white-label embeds for signing, sending, and template editing, plus webhook support.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Audit trails$q$, $q$Court-admissible audit trails compliant with ESIGN, UETA, and eIDAS regulations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Native and Zapier integrations$q$, $q$Native integrations with Close and QuickBooks Online, plus Zapier connectivity to 5,000+ apps.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Notifications and reminders$q$, $q$Real-time notifications and automatic reminders for pending signatures.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Free plan available with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$API access included even on the free plan (3 free API docs/month)$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$No contracts or cancellation fees; can pay monthly and cancel anytime$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$20% discount for annual billing across paid plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Unlimited documents on all paid plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Free plan is limited to 1 sender, 1 template, and 3 documents per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Additional senders cost extra ($10-15/month each depending on plan)$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Enterprise pricing is custom and not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Does SignWell have a free plan?$q$, $q$Yes, SignWell offers a free plan with 1 sender, 1 template, and 3 documents per month, requiring no credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$How much does SignWell cost?$q$, $q$Paid plans start at $10/month (billed monthly) or $12/month (billed annually) for the Light plan; the Business plan is $30-36/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Does SignWell offer an API?$q$, $q$Yes, SignWell provides a REST API with documentation, white-label embeds, and webhook support, included at every plan tier with a free monthly API document allotment.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Is SignWell legally binding?$q$, $q$SignWell states its eSignatures are legally binding and compliant with ESIGN, UETA, and eIDAS regulations.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Are there cancellation fees?$q$, $q$No, SignWell states there are no contracts or cancellation fees, and monthly plans can be canceled anytime.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Simple document signing$q$, $q$Send a small number of documents for signature each month using the free plan.$q$, $q$Freelancers and individuals with occasional signing needs$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Team document workflows$q$, $q$Use signing order, conditional logic, and templates to route documents through multiple signers.$q$, $q$Small business teams handling contracts and agreements$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Embedded signing for developers$q$, $q$Use the eSignature API and white-label embeds to add signing directly into an existing product.$q$, $q$Developers building signing into their own applications$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["1 sender","1 template","3 documents/month","3 free API documents/month","audit trail","advanced security","compliance certifications"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Light$q$, $q$$10/month (monthly) / $12/month (annual)$q$, $q$monthly$q$, $q$["1 sender (additional senders $10-12/month each)","5 templates per sender","unlimited documents","15 free API documents/month","branding options","team management"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Business$q$, $q$$30/month (monthly) / $36/month (annual)$q$, $q$monthly$q$, $q$["3 senders (additional senders $12-15/month each)","unlimited templates","unlimited documents","25 free API documents/month","conditional field rules","data validation","request attachments","in-person signing"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$Enterprise$q$, $q$Custom (contact sales)$q$, NULL, $q$["custom sender pricing","unlimited templates and documents","custom API allocation","dedicated support","high-volume API access"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$overview$q$, $q$What is SignWell?$q$, 2, ARRAY[$q$SignWell is an electronic signature platform for sending documents for legally binding signature, according to its website, with plans ranging from a free tier to custom Enterprise pricing.$q$, $q$It includes a developer API with webhook support and white-label embeds, available starting on the free plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('082213b2-ced8-444a-8548-3b973c136452', $q$who-its-for$q$, $q$Who SignWell is for$q$, 2, ARRAY[$q$SignWell is positioned for individuals and small businesses needing occasional or ongoing document signing, as well as developers who want to embed signing workflows via its API.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082213b2-ced8-444a-8548-3b973c136452', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082213b2-ced8-444a-8548-3b973c136452', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082213b2-ced8-444a-8548-3b973c136452', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082213b2-ced8-444a-8548-3b973c136452', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082213b2-ced8-444a-8548-3b973c136452', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('082213b2-ced8-444a-8548-3b973c136452', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;

-- ── SignRequest ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SignRequest is an ISO 27001-certified electronic signature platform for signing, sending, and tracking documents online.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€9/month per user$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SignRequest: ISO 27001-certified e-signature tool with a free plan, unlimited signatures, and Slack, Zapier, and Salesforce integrations.$q$,
  og_description = $q$SignRequest: ISO 27001-certified e-signature tool with a free plan, unlimited signatures, and Slack, Zapier, and Salesforce integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fede56b3-f85c-4052-aeaf-1ba74f7f371f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fede56b3-f85c-4052-aeaf-1ba74f7f371f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Multiple signing methods$q$, $q$Sign by uploading an image, drawing with the mouse, typing a name, or using an auto-generated signature.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Document preparation$q$, $q$Upload PDF, Word, or Excel files and prepare them for signing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Templates$q$, $q$Create reusable templates for recurring documents (5 on Professional, unlimited on Business).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Audit trail$q$, $q$Every document includes a secure audit trail and signing log.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Team collaboration$q$, $q$Team accounts with customizable branding and email notifications on signing status.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Bulk send and API$q$, $q$Business plan adds bulk send, API access, and Single Sign-On.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Integrations$q$, $q$Connects with Google Apps, Slack, Zapier (2,000+ apps), Salesforce, and premium integrations like M-Files and Topdesk.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Free plan available with 10 documents per user per month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Unlimited signatures on all plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$14-day free trial on paid plans$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$ISO 27001 certified and recognized as a G2 Leader$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Broad integration support including Salesforce, Slack, and Zapier$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Free plan is capped at 10 documents per user per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$API access and Salesforce/SSO integrations require the top-tier Business plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Fair Use Policy applies to 'unlimited' documents, with separate bundles for excessive volume$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Founding year, headquarters, and company size are not disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Does SignRequest have a free plan?$q$, $q$Yes, the Free Plan allows 10 documents per user per month with sign-on-any-device support and Google integrations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Is there a free trial for paid plans?$q$, $q$Yes, both the Professional and Business plans include a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$What does the Business plan add over Professional?$q$, $q$The Business plan adds unlimited teams and users, unlimited templates, bulk send, API access, Salesforce integration, and Single Sign-On.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$What integrations does SignRequest support?$q$, $q$SignRequest integrates with Google Apps, Slack, Zapier (2,000+ apps), Salesforce, and premium integrations such as M-Files and Topdesk on the Business plan.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Is SignRequest ISO certified?$q$, $q$Yes, SignRequest is ISO 27001 certified and has been recognized as a G2 Leader.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Individual document signing$q$, $q$Sign contracts and documents quickly without printing, signing, or scanning.$q$, $q$Freelancers and individuals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Small team contract workflows$q$, $q$Teams of up to 5 users manage signing with custom branding and templates on the Professional plan.$q$, $q$Small businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Enterprise signing with Salesforce/SSO$q$, $q$Larger organizations use bulk send, API access, and Salesforce/SSO integration on the Business plan.$q$, $q$Mid-size to enterprise teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Free$q$, $q$€0$q$, NULL, $q$["10 documents per user per month","Sign on any device","Google integrations","15 languages","Secure audit trail"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Professional$q$, $q$€9/month per user$q$, $q$monthly$q$, $q$["14-day free trial","Unlimited documents (Fair Use Policy)","Up to 5 users, 1 team","5 templates","Custom branding","Public signing link and custom landing pages","Signing order control","Text message verification","Send reminders","Email support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$Business$q$, $q$€15/month per user$q$, $q$monthly$q$, $q$["14-day free trial","Unlimited documents (Fair Use Policy)","Unlimited teams and users","Unlimited templates","Bulk send","Slack and Zapier integrations","API access","Salesforce integration","Single Sign-On","Premium integrations (M-Files, Topdesk, Formdesk)","Unlimited phone support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$overview$q$, $q$What is SignRequest?$q$, 2, ARRAY[$q$SignRequest is an electronic signature platform that lets users sign contracts and other documents without printing, signing by hand, and scanning.$q$, $q$It offers a free plan for occasional use as well as paid Professional and Business plans with templates, bulk send, and integrations such as Salesforce, Slack, and Zapier.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', $q$who-its-for$q$, $q$Who SignRequest is for$q$, 2, ARRAY[$q$SignRequest suits individuals and small teams who need occasional document signing on the Free plan, as well as growing businesses that need templates, custom branding, and bulk sending on the Professional and Business plans.$q$, $q$Organizations needing API access, Salesforce integration, or Single Sign-On can use the Business plan.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fede56b3-f85c-4052-aeaf-1ba74f7f371f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Oneflow ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Oneflow is a Swedish contract lifecycle management platform with e-signatures, workflow automation, and AI-powered contract insights.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$€250/month (Business plan, 5 seats, billed annually)$q$,
  founded_year = NULL,
  company_size = $q$170+ employees$q$,
  headquarters = $q$Stockholm, Sweden$q$,
  languages = ARRAY[$q$English$q$, $q$Swedish$q$, $q$Norwegian$q$, $q$Finnish$q$, $q$French$q$, $q$Dutch$q$]::text[],
  seo_meta_description = $q$Oneflow: contract lifecycle management with e-signatures, workflow automation, and AI-powered contract data insights.$q$,
  og_description = $q$Oneflow: contract lifecycle management with e-signatures, workflow automation, and AI-powered contract data insights.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5508cca3-5bae-43ef-99a9-12d8e8bc4e09';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5508cca3-5bae-43ef-99a9-12d8e8bc4e09' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Digital contract repository$q$, $q$Centralizes contracts in a structured, searchable repository with clause and obligation tracking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Workflow automation$q$, $q$Automates contract approvals and compliance checks integrated with business systems.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$E-signature and eID signing$q$, $q$Supports electronic signatures, signing order, and eID authentication (including BankID).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Oneflow AI$q$, $q$AI features including Write with AI, AI Extract, AI Summary, AI Review, and AI Insights for contract data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$500+ integrations$q$, $q$Connects with CRM, HR, and productivity tools including Salesforce, HubSpot, Microsoft Dynamics 365, Slack, and Zapier.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Contract templates$q$, $q$Provides ready-made templates such as Sales Agreement, NDA, and Employment Agreement.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$500+ native integrations with CRM, HR, and productivity tools$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$AI-powered contract extraction, summarization, and review features$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$eIDAS, GDPR compliant with ISO 27001, ISO 14001, and ISO 9001 certifications$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Free tier for basic send, track, and sign of contracts$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Supports eID authentication including BankID$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Paid plans require annual billing only; no monthly billing option$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Entry paid plan limited to 5 seats at €250/month$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Enterprise pricing requires contacting sales for a custom quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Does Oneflow offer a free plan?$q$, $q$Yes, Oneflow offers a free option to send, track, and sign contracts, alongside paid plans with additional features.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Is there a free trial for Oneflow's paid plans?$q$, $q$Yes, Oneflow offers a 14-day free trial with no credit card required, giving access to full platform functionality.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$How much does Oneflow cost?$q$, $q$The Business plan starts at €250/month for 5 seats, billed annually. Enterprise pricing is custom and requires contacting sales.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Does Oneflow have AI features?$q$, $q$Yes, Oneflow AI includes Write with AI, AI Extract, AI Summary (Business plan), and AI Review and AI Insights (Enterprise plan).$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$What integrations does Oneflow support?$q$, $q$Oneflow supports 500+ integrations, including Salesforce, HubSpot, Microsoft Dynamics 365, Slack, Zapier, and SAP.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Sales contract management$q$, $q$Automates proposal, quoting, and contract signing workflows integrated with CRM systems.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$HR agreement workflows$q$, $q$Manages employment agreements and onboarding paperwork with e-signature support.$q$, $q$HR teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Enterprise contract governance$q$, $q$Provides SSO, SCIM, audit logs, and custom admin roles for large-scale contract oversight.$q$, $q$Enterprise legal and procurement teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Free$q$, $q$$0$q$, NULL, $q$["Send, track, and sign contracts"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Business$q$, $q$€250/month$q$, $q$annual$q$, $q$["5 seats","Multiple workspaces","Workspace branding","Approvals","eID signature","Signing order","Inline comments","Lifecycle management","Webhooks","Oneflow AI (Write with AI, AI Extract, AI Summary)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$Enterprise$q$, $q$Custom$q$, $q$annual$q$, $q$["10 seats","All Business features","SSO","SCIM API","Shared templates","User groups","AI Review","AI Insights","Section rules","Account audit log","Custom admin roles"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$overview$q$, $q$What is Oneflow?$q$, 2, ARRAY[$q$Oneflow is a digital contract lifecycle management platform, headquartered in Stockholm, Sweden, that centralizes contract creation, e-signature, and lifecycle tracking in one place.$q$, $q$The platform includes Oneflow AI features for extracting, summarizing, and reviewing contract data, plus over 500 integrations with CRM, HR, and productivity tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', $q$who-its-for$q$, $q$Who Oneflow is for$q$, 2, ARRAY[$q$Oneflow suits sales, HR, and legal teams that need to automate contract workflows and e-signatures, from individuals using the free tier to enterprises requiring SSO and custom admin controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5508cca3-5bae-43ef-99a9-12d8e8bc4e09', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Scrive ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Scrive is a Stockholm-based e-signature and eID platform offering eIDAS-compliant signing, identity verification, and web forms.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = 2010,
  company_size = $q$200+ employees$q$,
  headquarters = $q$Stockholm, Sweden$q$,
  languages = ARRAY[$q$English$q$, $q$Swedish$q$, $q$Finnish$q$, $q$Danish$q$, $q$German$q$, $q$French$q$, $q$Norwegian$q$, $q$Dutch$q$]::text[],
  seo_meta_description = $q$Scrive: eIDAS-compliant e-signature and eID platform for agreements, identity verification, and digital onboarding in the EU.$q$,
  og_description = $q$Scrive: eIDAS-compliant e-signature and eID platform for agreements, identity verification, and digital onboarding in the EU.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '285c3bc6-63b3-46e5-8de1-99baa6d03c1f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '285c3bc6-63b3-46e5-8de1-99baa6d03c1f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Electronic signature products$q$, $q$Offers eSign Online, eSign GO, and eSign API for signing agreements via portal, managed service, or API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Qualified Electronic Signatures (QES)$q$, $q$Provides eIDAS-compliant Qualified Electronic Signatures as a QTSP (Qualified Trust Service Provider).$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$eID Hub and ID Check$q$, $q$Digital identity verification and customer authentication services.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Web forms builder$q$, $q$Fill-and-sign web forms to collect data and signatures in a single digital flow.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Template-based workflows$q$, $q$Template-based document workflows for repeatable agreement processes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Scrive MCP server (beta)$q$, $q$A beta feature combining generative AI with verified identity and eIDAS-compliant signatures.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Qualified Trust Service Provider (QTSP) under EU eIDAS regulation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$ISO 27001 certified with EU-based data hosting$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Serves 13,000+ customers across 60+ countries$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Offers both API and portal-based signing options$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$14-day free trial with no credit card required$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Public pricing details are not published on the website; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Product lineup is split across multiple separate offerings (eSign Online, eSign GO, eSign API, eID Hub, ID Check, Forms), which can complicate plan selection$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$MCP/generative AI features are still in beta$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Is Scrive compliant with EU signature regulations?$q$, $q$Yes, Scrive is a Qualified Trust Service Provider (QTSP) under eIDAS and offers Qualified Electronic Signatures (QES).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Does Scrive offer a free trial?$q$, $q$Yes, Scrive offers a 14-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$How much does Scrive cost?$q$, $q$Scrive does not publish specific plan pricing; separate pricing tiers exist for eSign Online, eSign GO, eSign API, eID Hub, ID Check, and Forms, and pricing must be requested from Scrive.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$When was Scrive founded?$q$, $q$Scrive was founded in 2010 in Stockholm, Sweden by two university friends.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Does Scrive have an API?$q$, $q$Yes, Scrive offers eSign API for integrating electronic signatures directly into other systems.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Automotive sales agreements$q$, $q$Used for signing vehicle sales contracts, with Scrive noting a significant share of cars sold in the UK are signed using its platform.$q$, $q$Automotive dealerships$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Customer identity verification$q$, $q$Verifies and authenticates customers digitally via eID Hub and ID Check during onboarding.$q$, $q$Banks and financial services$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$Digital agreement signing$q$, $q$Enables businesses to sign agreements online through a portal, API, or managed service.$q$, $q$Enterprises and SMBs across the EU$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$overview$q$, $q$What is Scrive?$q$, 2, ARRAY[$q$Scrive, founded in 2010 and headquartered in Stockholm, Sweden, is a Qualified Trust Service Provider offering eIDAS-compliant electronic signatures, identity verification, and web forms.$q$, $q$The platform serves more than 13,000 customers across 60+ countries, processing over 100 million transactions per year, with clients including Volkswagen, Volvo, and Samsung.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', $q$who-its-for$q$, $q$Who Scrive is for$q$, 2, ARRAY[$q$Scrive is built for European businesses that need eIDAS-compliant signing and identity verification, from automotive dealerships to financial services conducting digital customer onboarding.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('285c3bc6-63b3-46e5-8de1-99baa6d03c1f', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Penneo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Penneo is a Copenhagen-based digital signing platform for legally binding e-signatures using European national eIDs like MitID and BankID.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$€88/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Copenhagen, Denmark$q$,
  languages = ARRAY[$q$English$q$, $q$Danish$q$, $q$Norwegian$q$, $q$French$q$, $q$Dutch$q$]::text[],
  seo_meta_description = $q$Sign documents digitally with Penneo, a European e-signature platform supporting MitID, BankID, and other national eIDs across the EU.$q$,
  og_description = $q$Sign documents digitally with Penneo, a European e-signature platform supporting MitID, BankID, and other national eIDs across the EU.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6d258a01-ef39-4b35-84fd-1f22985df12e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6d258a01-ef39-4b35-84fd-1f22985df12e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$National eID signing$q$, $q$Sign documents using nationally recognized eIDs including MitID/MitID Erhverv (Denmark), BankID (Norway/Sweden), itsme/.beID (Belgium), and AusweisApp (Germany), plus passport signing via ID Verifier.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$eIDAS-compliant signatures$q$, $q$Supports both Qualified Electronic Signatures (QES) and Advanced Electronic Signatures (AdES) as defined by the EU eIDAS regulation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Signing flow automation$q$, $q$Automate document signing processes through configurable signing flows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Document management$q$, $q$Manage documents and collect data through form-based document workflows, with a document archive included.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Tamper-proof audit trails$q$, $q$Every transaction generates a tamper-proof audit trail for compliance and verification.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Identity validation$q$, $q$Includes identity validation services alongside signing.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Open API and integrations$q$, $q$Offers an open API and pre-built integrations, with API sandbox access on the Pro plan.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Used by 3,500+ companies across Europe$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$84% customer satisfaction, versus a 75% industry average cited on the site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Average support response time of about 10 minutes$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Onboarding completed in under 5 business days$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Broad support for national eIDs across multiple European countries$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$No free plan — only a free trial is offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Pricing varies by country/region and isn't a single global rate$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Cancellation requires 3 months' notice$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Strongest adoption and eID coverage is concentrated in Nordic/European markets$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Does Penneo offer a free trial?$q$, $q$Yes, Penneo offers a free trial upon request; there is no free plan.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$What signature types does Penneo support?$q$, $q$Penneo supports both Qualified Electronic Signatures (QES) and Advanced Electronic Signatures (AdES) under the EU eIDAS regulation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Which national eIDs work with Penneo?$q$, $q$Penneo supports MitID/MitID Erhverv, BankID, itsme/.beID, AusweisApp, and passport verification via ID Verifier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$How many signatures are included in a plan?$q$, $q$All plans include 500 signatures annually, with additional signatures billed at a per-signature rate and volume discounts available.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$What is Penneo's cancellation policy?$q$, $q$Cancellation requires 3 months' notice, and standard payment terms are 14 days.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Signing audited financial documents$q$, $q$Accounting and audit firms use Penneo to collect legally binding signatures on annual reports and audit documentation.$q$, $q$Audit & accounting firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Financial and banking agreements$q$, $q$Finance and banking organizations use Penneo's eID-based signing for regulated document workflows.$q$, $q$Finance & banking teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Legal document execution$q$, $q$Legal service providers use Penneo to execute contracts and legal documents with qualified electronic signatures.$q$, $q$Legal services$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Real estate transactions$q$, $q$Real estate businesses use Penneo to manage signing for property-related documentation.$q$, $q$Real estate professionals$q$, 3);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$HR and administrative paperwork$q$, $q$HR and administration teams use Penneo to handle employee-related document signing.$q$, $q$HR & administration teams$q$, 4);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Sign Essential$q$, $q$€88/month$q$, $q$annual$q$, $q$["Basic document signing","SMS verification","Document archive","500 signatures/year included"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Sign Plus$q$, $q$€154/month$q$, $q$annual$q$, $q$["Industry-specific signing flows","Integrations","500 signatures/year included"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$Sign Pro$q$, $q$€629/month$q$, $q$annual$q$, $q$["Customized signing workflows","Dedicated support hotline","Personalized onboarding","Dedicated success resource","API sandbox access"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$overview$q$, $q$What is Penneo?$q$, 2, ARRAY[$q$Penneo is a certified digital trust platform based in Copenhagen, Denmark, that lets businesses send, sign, and manage documents digitally with legally binding signatures.$q$, $q$It supports nationally recognized eIDs such as MitID (Denmark), BankID (Norway/Sweden), itsme/.beID (Belgium), and AusweisApp (Germany), and complies with the EU eIDAS regulation for both Qualified and Advanced Electronic Signatures.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', $q$who-its-for$q$, $q$Who Penneo is for$q$, 2, ARRAY[$q$Penneo is used by over 3,500 companies across Europe, with particularly strong adoption in Denmark, Norway, Belgium, Germany, and Sweden, spanning audit & accounting, finance & banking, legal services, real estate, and HR.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6d258a01-ef39-4b35-84fd-1f22985df12e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Concord ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Concord is an AI-powered contract lifecycle management platform that manages contracts from intake through renewal.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$499/month (billed annually)$q$,
  founded_year = 2014,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Concord is an AI-powered CLM platform managing contracts from intake to renewal, used by legal, procurement, and sales teams.$q$,
  og_description = $q$Concord is an AI-powered CLM platform managing contracts from intake to renewal, used by legal, procurement, and sales teams.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0a0f2d3b-c073-4fa4-9c50-2b0847121c18';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0a0f2d3b-c073-4fa4-9c50-2b0847121c18' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$AI Copilot$q$, $q$AI automatically alerts users about deadlines, explains contract risks and obligations, and suggests edits.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Executive-ready reporting$q$, $q$AI builds executive-ready reports on contracts in minutes.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Redlining and version control$q$, $q$Built-in redlining, version control, and commenting for contract collaboration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$E-signature$q$, $q$Unlimited e-signatures are included across all plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Self-serve contract intake$q$, $q$Business teams can create compliant contracts on demand using legal-approved templates.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Integrations$q$, $q$Connects with tools including Salesforce, HubSpot, Google Drive, Box, Dropbox, and Zapier.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Approval workflows$q$, $q$Business-tier and above plans include configurable approval workflows.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$API access and clause library$q$, $q$Enterprise plan includes API access, a clause library, bulk send, and custom branding.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$AI Copilot included in every pricing tier$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Unlimited e-signatures on all plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Wide range of native integrations (Salesforce, HubSpot, Google Drive, Box, Dropbox, Zapier)$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Used by thousands of companies, per customer testimonials on the site$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Volume discounts available for larger organizations$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$No free plan is offered, only a free trial$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Entry-level Essentials plan starts at $499/month, higher than many CLM competitors$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Additional users cost extra on top of the 5 included per plan$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$API access, clause library, and custom branding are limited to the Enterprise tier$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Does Concord offer a free trial?$q$, $q$Yes, Concord offers a free trial; the pricing page includes an FAQ addressing whether a credit card is required to start one.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Does Concord have a free plan?$q$, $q$No, Concord does not offer a free plan, only paid plans with a free trial option.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$How many users are included in each plan?$q$, $q$Each plan (Essentials, Business, Enterprise) includes 5 users, with additional users billed per month at rates that increase by tier.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$What integrations does Concord support?$q$, $q$Concord integrates with Salesforce, HubSpot, Google Drive, Box, Dropbox, and Zapier, with deeper integrations available starting at the Business tier.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$When was Concord founded?$q$, $q$Concord launched its first end-to-end CLM product in 2014.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Legal contract review$q$, $q$Legal teams use Concord's AI to review contracts, understand risks and obligations, and manage redlining and version control.$q$, $q$Legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Procurement contract intake$q$, $q$Procurement teams use self-serve intake with legal-approved templates to generate compliant contracts on demand.$q$, $q$Procurement teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Sales agreement management$q$, $q$Sales teams use Concord to manage customer agreements with e-signature and deadline tracking.$q$, $q$Sales teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Executive contract reporting$q$, $q$Finance and operations leaders use AI-built reports to get executive-ready visibility into contract portfolios.$q$, $q$Finance & operations leaders$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Essentials$q$, $q$$499/month$q$, $q$annual$q$, $q$["5 users included ($49/mo per additional user)","AI Copilot","Unlimited e-signatures","Document storage and collaboration tools","Deadline reminders"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Business$q$, $q$$899/month$q$, $q$annual$q$, $q$["5 users included ($69/mo per additional user)","Integrations (Salesforce, HubSpot, Google Drive, Box, Dropbox, Zapier)","Approval workflows"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$Enterprise$q$, $q$$1299/month$q$, $q$annual$q$, $q$["5 users included ($89/mo per additional user)","API access","Clause library","Bulk send","Custom branding","Volume discounts available"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$overview$q$, $q$What is Concord?$q$, 2, ARRAY[$q$Concord is an AI-powered contract lifecycle management (CLM) platform that manages contracts from intake to renewal in one place.$q$, $q$It launched its first end-to-end CLM product in 2014 and has since introduced 'Horizon,' described on the site as an all-new AI-native platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', $q$who-its-for$q$, $q$Who Concord is for$q$, 2, ARRAY[$q$Concord serves Legal, Procurement, Finance, Sales, HR, Operations, and IT teams, and is used by thousands of companies across industries including construction, robotics, and education.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0a0f2d3b-c073-4fa4-9c50-2b0847121c18', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Juro ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Juro is an AI-native contract lifecycle management platform for creating, reviewing, negotiating, and managing contracts.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = NULL,
  headquarters = $q$London, UK and Boston, MA, US$q$,
  languages = '{}',
  seo_meta_description = $q$Juro is an AI-native CLM platform used by legal, sales, HR and finance teams to create, review, negotiate and manage contracts.$q$,
  og_description = $q$Juro is an AI-native CLM platform used by legal, sales, HR and finance teams to create, review, negotiate and manage contracts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b3138f4f-7b47-4597-bf67-8ea806a1edd0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b3138f4f-7b47-4597-bf67-8ea806a1edd0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Self-serve templates$q$, $q$Legal-controlled templates let sales, HR, finance and procurement teams generate contracts themselves.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$AI intake & review$q$, $q$AI agents handle contract intake, review and redlining automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Intelligent repository$q$, $q$Query the contract repository in natural language using Juro's AI Extract and Operator capabilities.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$AI Draft$q$, $q$AI-assisted drafting speeds up contract creation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Integrations$q$, $q$Connects with Salesforce, HubSpot, Slack, Word, Docusign, Zapier, Google Drive, ChatGPT, Claude, and a REST API.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Unlimited users & workflows$q$, $q$All Juro plans include unlimited users, unlimited workflows and unlimited templates.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$G2 rating of 4.8/5 and Capterra rating of 4.9/5$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$SOC 2 Type 2 certified with 99.9% platform uptime$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Rated #1 for ease of use & support on G2$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Unlimited users, workflows and templates included on all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Broad integration ecosystem including Salesforce, HubSpot, Slack, ChatGPT and Claude$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$No public pricing; requires a demo or consultation for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$No free trial or free plan mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Price scales with monthly contract volume and AI features used$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Deeper integrations such as Salesforce, HubSpot and Workday cost extra$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Does Juro offer a free trial?$q$, $q$Juro's website does not mention a free trial or free plan; pricing requires a demo or consultation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$How is Juro priced?$q$, $q$Pricing is based on monthly contract volume, the AI features selected (AI Extract, AI Draft, AI Review), and integration complexity, with billing available in USD, GBP or EUR.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$When was Juro founded?$q$, $q$Juro was founded in 2016 by a Magic Circle lawyer.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$What integrations does Juro support?$q$, $q$Juro integrates with Salesforce, HubSpot, Slack, Word, Docusign, Zapier, Google Drive, ChatGPT, and Claude, plus a REST API.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Is Juro's platform secure and reliable?$q$, $q$Juro is SOC 2 Type 2 certified and reports 99.9% platform uptime.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Sales contract self-service$q$, $q$Sales teams generate and send contracts from legal-approved templates without waiting on legal for every deal.$q$, $q$Sales teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Automated legal contract review$q$, $q$In-house legal teams use AI intake and review to redline and process incoming contracts faster.$q$, $q$In-house legal teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$Contract data search and reporting$q$, $q$Finance and procurement teams query the intelligent contract repository in natural language to find terms and obligations.$q$, $q$Finance and procurement teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$overview$q$, $q$What is Juro?$q$, 2, ARRAY[$q$Juro is an AI-native contract lifecycle management (CLM) platform for creating, reviewing, negotiating, approving and managing contracts end-to-end. It was founded in 2016 by a Magic Circle lawyer and has offices in London, UK and Boston, MA, US.$q$, $q$The platform reports processing 3 million contracts for customers in 85+ countries, and holds a 4.8/5 rating on G2 and 4.9/5 on Capterra, with SOC 2 Type 2 certification and 99.9% platform uptime.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', $q$who-its-for$q$, $q$Who Juro is for$q$, 2, ARRAY[$q$Juro is built for legal, sales, HR, finance and procurement teams that need to create, review and manage contracts collaboratively, with legal-controlled self-serve templates for non-legal teams and AI-assisted review and drafting for legal teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b3138f4f-7b47-4597-bf67-8ea806a1edd0', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── LinkSquares ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$LinkSquares is an agentic contract lifecycle management platform, powered by its LinkAI engine, for managing agreements from drafting to renewal.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$LinkSquares is an agentic CLM platform powered by LinkAI, helping legal teams draft, redline, analyze and manage contracts.$q$,
  og_description = $q$LinkSquares is an agentic CLM platform powered by LinkAI, helping legal teams draft, redline, analyze and manage contracts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '95bdcbb9-6021-42d0-a5e2-e06607c0d49b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '95bdcbb9-6021-42d0-a5e2-e06607c0d49b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Contract Intelligence$q$, $q$Extracts key terms, obligations and risks from agreements.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$AI Legal Assistant$q$, $q$LinkAI-powered assistant drafts, redlines and researches contract language.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Automation & Workflows$q$, $q$Streamlines contract approvals and task management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Playbooks & Libraries$q$, $q$Standardizes contracts using templates and clause libraries.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Analytics & Reporting$q$, $q$Tracks contract performance and surfaces insights.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$API & Integrations$q$, $q$Integrates with existing business tools via API, including a Word Add-in for redlining workflows.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$4.7/5 rating on G2 based on 300+ reviews$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Recognized as a G2 Enterprise Leader and Mid-Market Leader for Contract Lifecycle Management$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Named a G2 Contract Analytics Best Usability winner and G2 Top 50 Sales Products 2026$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Used by large organizations including Zywave, DraftKings, Propharma, TIME Magazine, Outsystems and Commvault$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$AI legal assistant (LinkAI) supports drafting, redlining and natural language contract queries$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$No public pricing; quotes are personalized and require a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$No free trial or free plan mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Founding year, headquarters and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Does LinkSquares offer a free trial?$q$, $q$The LinkSquares website does not mention a free trial or free plan; you must request a demo for pricing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$How is LinkSquares priced?$q$, $q$Pricing is personalized based on contract volume, number of users, selected modules, implementation/onboarding support, and any custom integrations or advanced features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$What is LinkAI?$q$, $q$LinkAI is LinkSquares' purpose-built AI that reads contracts, supports drafting and redlining, and answers natural language questions about contract terms.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$What recognition has LinkSquares received?$q$, $q$LinkSquares holds a 4.7/5 rating on G2 from 300+ reviews and has been named a G2 Enterprise Leader, G2 Mid-Market Leader, G2 Contract Analytics Best Usability winner, and G2 Top 50 Sales Products 2026.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Enterprise contract intelligence$q$, $q$Legal teams extract key terms, obligations and risks across large contract portfolios using Contract Intelligence.$q$, $q$Enterprise legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$AI-assisted drafting and redlining$q$, $q$Legal teams use the LinkAI assistant to draft, redline and research contract language, including within Word via the Word Add-in.$q$, $q$In-house legal teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$Contract approval workflows$q$, $q$Organizations automate contract approvals and task management using built-in workflow automation.$q$, $q$Mid-market and enterprise organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$overview$q$, $q$What is LinkSquares?$q$, 2, ARRAY[$q$LinkSquares is an agentic contract lifecycle management (CLM) platform powered by LinkAI, designed to centralize agreement management from drafting through renewal.$q$, $q$The platform holds a 4.7/5 rating on G2 from 300+ reviews and has been recognized as a G2 Enterprise Leader, G2 Mid-Market Leader, and G2 Contract Analytics Best Usability winner, with customers including Zywave, DraftKings, Propharma, TIME Magazine, Outsystems and Commvault.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', $q$who-its-for$q$, $q$Who LinkSquares is for$q$, 2, ARRAY[$q$LinkSquares serves enterprise and mid-market organizations across industries that need to centralize contract drafting, review, analytics and renewal management, with AI-assisted drafting and redlining for legal teams.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('95bdcbb9-6021-42d0-a5e2-e06607c0d49b', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── SpotDraft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-native contract lifecycle management (CLM) software for drafting, reviewing, e-signing, and renewing contracts.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SpotDraft is an AI-native CLM platform for contract drafting, review, e-signature, and renewals, trusted by 450+ companies.$q$,
  og_description = $q$SpotDraft is an AI-native CLM platform for contract drafting, review, e-signature, and renewals, trusted by 450+ companies.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e12cbfc9-d246-4893-93a6-78ac5fffa567';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e12cbfc9-d246-4893-93a6-78ac5fffa567' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Workflow automation$q$, $q$Set conditional templates and automate approval workflows across teams.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Collaboration tools$q$, $q$Shared review and redlining across Word, Slack, and the SpotDraft platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Contract repository$q$, $q$Centralized, secure contract storage with search and access controls.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Analytics$q$, $q$Insights on renewals, bottlenecks, and team workloads.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$E-signatures$q$, $q$Built-in digital signature capability with ESIGN, EIDAS, and GDPR compliance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$AI contract intelligence$q$, $q$AI-driven contract data extraction, red-flag detection, and compliance checking.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Recognized as a G2 Leader in Contract Management and CLM$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Named to Fast Company's Most Innovative Companies 2024 and Forbes 100 to Watch for 2025$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Trusted by 450+ companies including Abnormal Security, IPSY, Guideline, and Chaberton Energy$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$SOC 2 Type II, HIPAA, and GDPR compliant with ISO certification$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Includes dedicated customer success management and 24/7 multi-channel support$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$No public pricing; costs require contacting sales for a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$No free trial is mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Pricing is based on users or contract volume rather than fixed self-serve tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Does SpotDraft publish its pricing?$q$, $q$No. SpotDraft states plans are priced based on either users or contract volume, and pricing is obtained by requesting a demo or quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Does SpotDraft offer a free trial?$q$, $q$SpotDraft's website does not mention a free trial; the primary call-to-action is to request a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Is SpotDraft compliant with data security standards?$q$, $q$Yes. SpotDraft states it is ISO certified and SOC 2 Type II, GDPR, and HIPAA compliant.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Does SpotDraft integrate with other tools?$q$, $q$SpotDraft supports collaboration through Word, Slack, and Microsoft Teams.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$How long does implementation take?$q$, $q$SpotDraft describes an onboarding timeline starting with discovery in week 1 and going live by week 6, with in-house implementation included.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Legal team contract oversight$q$, $q$Centralize contract drafting, review, and approval workflows so legal remains in control of the process.$q$, $q$In-house legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Cross-functional contract collaboration$q$, $q$Enable sales, procurement, and other teams to redline and collaborate on contracts via Word and Slack.$q$, $q$Sales and procurement teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$Contract compliance monitoring$q$, $q$Use AI-driven data extraction and red-flag detection to monitor contracts for compliance and renewal risk.$q$, $q$Compliance and contract operations teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$overview$q$, $q$What is SpotDraft?$q$, 2, ARRAY[$q$SpotDraft is an AI-native contract lifecycle management (CLM) platform that covers the full contracting process, from drafting and review to e-signature and renewal. The company positions the product around keeping legal in charge while enabling faster turnaround through automation.$q$, $q$The platform includes a centralized, searchable contract repository, workflow automation with conditional templates, built-in e-signatures compliant with ESIGN, EIDAS, and GDPR, and AI features for contract data extraction and red-flag detection. It is SOC 2 Type II, HIPAA, and GDPR compliant, and reports being trusted by more than 450 companies, including Abnormal Security, IPSY, Guideline, and Chaberton Energy.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', $q$who-its-for$q$, $q$Who SpotDraft is for$q$, 2, ARRAY[$q$SpotDraft is built for legal teams that need to manage contracting workflows while collaborating with sales, procurement, and other departments through Word, Slack, and Microsoft Teams. Pricing is customized based on users or contract volume, with implementation, workflow setup, and dedicated customer success included, making it best suited for organizations willing to go through a sales-assisted onboarding process rather than self-serve signup.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e12cbfc9-d246-4893-93a6-78ac5fffa567', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Contractbook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Contractbook is contract management software to centralize agreements, extract data with AI, automate tasks, and e-sign.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$399/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Copenhagen, Denmark$q$,
  languages = ARRAY[$q$English$q$, $q$Danish$q$, $q$German$q$, $q$Swedish$q$, $q$Norwegian$q$]::text[],
  seo_meta_description = $q$Contractbook centralizes contracts, extracts data with AI, automates workflows, and offers e-signatures, with a 14-day free trial.$q$,
  og_description = $q$Contractbook centralizes contracts, extracts data with AI, automates workflows, and offers e-signatures, with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd2ccb15e-37d0-481d-a412-ddf5ab66d3dc';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd2ccb15e-37d0-481d-a412-ddf5ab66d3dc' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$AI Import$q$, $q$AI-assisted import and organization of existing contracts into the platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$AI Contract Assistant$q$, $q$Ask questions about contracts in plain English and get instant summaries of key terms and obligations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Contract templates$q$, $q$Templates across 9 categories for creating standardized contracts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$E-signature$q$, $q$Secure, unlimited e-signature functionality included across plans.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Data extraction and insights$q$, $q$Automated extraction of key contract data and risk/red-flag identification.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Renewal reminders$q$, $q$Automated reminders and deadline tracking for contract renewals.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Integrations and API$q$, $q$Integrates with HubSpot and Salesforce, plus a public API (api.contractbook.com) and Zapier/Make.com add-ons.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$G2 rating of 4.7 stars$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$14-day free trial with no credit card required, giving access to all features$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Supports English, Danish, German, Swedish, and Norwegian$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Integrates with HubSpot, Salesforce, Zapier, and Make.com, plus a public API$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Used by companies including Novo Nordisk, Ganni, Pleo, Avios, and Visma$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Entry-level plans cap users, templates, and contract uploads, requiring an upgrade as usage grows$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Custom/enterprise pricing with integrations and custom flows requires a quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Add-on features like automations, user provisioning, and API access cost extra on lower tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Does Contractbook offer a free trial?$q$, $q$Yes, Contractbook offers a 14-day free trial with access to all features and no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$What does Contractbook cost?$q$, $q$Published plans start at Centralize for $399/month billed annually, with Essential and Accelerate at $599/month billed annually; a custom enterprise plan is available on request.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Where is Contractbook based?$q$, $q$Contractbook is headquartered in Copenhagen, Denmark.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$What languages does Contractbook support?$q$, $q$Contractbook supports English, Danish, German, Swedish, and Norwegian.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Does Contractbook integrate with other software?$q$, $q$Yes, Contractbook integrates with HubSpot and Salesforce, and offers Zapier/Make.com connections and a public API as add-ons.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Centralizing company contracts$q$, $q$Bring existing and new agreements into a single, searchable repository with secure team access.$q$, $q$Small and mid-sized businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$AI-assisted contract review$q$, $q$Use the AI Contract Assistant to ask plain-English questions and get instant summaries of obligations and risk.$q$, $q$Legal and contract operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Sales and HR contract workflows$q$, $q$Create contracts from templates, route them for e-signature, and track renewal deadlines.$q$, $q$Sales, HR, and operations teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Enterprise custom rollouts$q$, $q$Set up tailored contract workflows with custom integrations and consultancy support.$q$, $q$Larger organizations with technical integration needs$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Essential$q$, $q$$599/month$q$, $q$annual$q$, $q$["1 user included","5 templates","50 contract uploads","Up to 100 signed contracts/year","Unlimited e-signatures"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Centralize$q$, $q$$399/month$q$, $q$annual$q$, $q$["5 users included","15 templates","5,000 contract uploads","Up to 350 signed contracts/year","AI data extraction","CSV export"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Accelerate$q$, $q$$599/month$q$, $q$annual$q$, $q$["10 users included","25 templates","5,000 contract uploads","Up to 500 signed contracts/year","Automations","Dynamic templates"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$Custom$q$, NULL, NULL, $q$["Tailored Contractbook setup with consultancy for initial setup","Custom flows and integrations","Quote required"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$overview$q$, $q$What is Contractbook?$q$, 2, ARRAY[$q$Contractbook is contract management software that lets teams centralize agreements, extract data with AI, automate contract-related tasks, and offer secure, permissioned access across the organization. It serves companies of varying sizes across industries including construction, healthcare, nonprofits, real estate, SaaS, and government.$q$, $q$Core capabilities include AI-assisted contract import and data extraction, an AI Contract Assistant for plain-English questions and instant summaries, template-based contract creation across 9 categories, built-in e-signatures, and renewal/deadline tracking. Contractbook is headquartered in Copenhagen, Denmark, and reports a 4.7-star rating on G2.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', $q$who-its-for$q$, $q$Who Contractbook is for$q$, 2, ARRAY[$q$Contractbook fits teams that want to move contract management out of email and file storage into a centralized, searchable platform, from solo operators on the Essential plan up to scaling companies on Accelerate, with a custom enterprise tier for organizations needing tailored integrations. Multi-language support (English, Danish, German, Swedish, Norwegian) and integrations with HubSpot, Salesforce, and a public API make it suited to teams that already rely on CRM tooling and want contract workflows connected to it.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d2ccb15e-37d0-481d-a412-ddf5ab66d3dc', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;

-- ── Sirion ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Sirion is an agentic AI CLM platform that helps enterprise legal, procurement, sales, and finance teams draft, negotiate, and manage contracts.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2012,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Sirion is an agentic AI CLM platform for enterprise legal, procurement, sales, and finance teams to draft, negotiate, and manage contracts.$q$,
  og_description = $q$Sirion is an agentic AI CLM platform for enterprise legal, procurement, sales, and finance teams to draft, negotiate, and manage contracts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8023eebe-e18e-4b41-9174-8eede636edf1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8023eebe-e18e-4b41-9174-8eede636edf1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$AskSirion conversational interface$q$, $q$A natural-language interface that lets users search contracts, draft documents, and get contract insights by simply asking.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Nine specialized AI agents$q$, $q$Purpose-built agents including Search, Draft, Redline, Issue Detection, Extraction, Obligations, Playbook, and Invoice, each automating a specific contract task.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$agentOS$q$, $q$A proprietary operating system that governs how Sirion's AI agents reason over enterprise data and collaborate with one another.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Playbook and template creation$q$, $q$Converts precedent agreements and internal policies into customizable playbooks and templates for faster drafting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Portfolio intelligence$q$, $q$Analyzes the full contract portfolio to surface risk exposure, spending patterns, and optimization recommendations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Obligation monitoring$q$, $q$Tracks contractual commitments and monitors compliance risk across active agreements after signature.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Microsoft Word integration$q$, $q$Supports AI-assisted contract negotiation and redlining directly inside Microsoft Word.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Multi-model AI stack$q$, $q$Combines more than 10 large language models with over 1,200 proprietary small language models to power its agents.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Named a Leader in the 2025 Gartner Magic Quadrant for Contract Life Cycle Management.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Recognized as a Gartner Peer Insights Customers' Choice for CLM.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Used by large global enterprises across more than 70 countries, including Citi, GE, Coca-Cola, IBM, and Chevron.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Offers nine specialized AI agents covering the contract lifecycle from drafting to invoice reconciliation.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Integrates AI-assisted redlining directly into Microsoft Word.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Pricing is not published; the /pricing page returns a 404 and prospects must contact sales for a custom quote.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$No free trial or free plan is advertised on the website.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Built for enterprise-scale contracting, which may be more complexity than smaller teams need.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Specific platform (mobile/desktop) and named language-support details are not published on the site.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Does Sirion publish pricing?$q$, $q$No. Sirion does not publish pricing plans; the /pricing page returns a 404, and prospective customers must contact Sirion directly for a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$What is Sirion best known for?$q$, $q$Sirion is known for its agentic CLM platform and AskSirion conversational interface, and it was named a Leader in the 2025 Gartner Magic Quadrant for Contract Life Cycle Management.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Which teams use Sirion?$q$, $q$Sirion is used by enterprise legal, procurement, sales, and finance teams.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Does Sirion integrate with Microsoft Word?$q$, $q$Yes, Sirion supports AI-assisted contract negotiation and redlining directly inside Microsoft Word.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$When was Sirion founded?$q$, $q$Sirion's website footer copyright notice ('© 2012-2026 Sirion') indicates the company dates back to 2012.$q$, 4);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Does Sirion offer a free trial?$q$, $q$Sirion's website does not advertise a free trial or free plan; access requires contacting sales.$q$, 5);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Enterprise contract drafting and negotiation$q$, $q$Legal and procurement teams use Sirion's Draft and Redline agents to generate negotiation-ready contracts and apply policy-backed clause revisions.$q$, $q$Enterprise legal and procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Contract portfolio risk analysis$q$, $q$Organizations use Sirion's portfolio intelligence to surface risk exposure and spending patterns across their full contract repository.$q$, $q$Enterprise risk and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Obligation and compliance tracking$q$, $q$Finance and legal teams use the Obligations agent to monitor contractual commitments and compliance risk after signature.$q$, $q$Finance and legal operations teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$Invoice-to-contract reconciliation$q$, $q$Procurement and finance teams use the Invoice agent to reconcile vendor invoices against agreed contract terms.$q$, $q$Procurement and finance teams$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$overview$q$, $q$What is Sirion?$q$, 2, ARRAY[$q$Sirion is an agentic AI contract lifecycle management (CLM) platform built for enterprise legal, procurement, sales, and finance teams. Marketed as 'Conversational AI for Enterprise Contracting,' it uses purpose-built AI agents to help organizations draft, review, negotiate, and monitor contracts.$q$, $q$At the core of the platform is agentOS, Sirion's proprietary operating system that governs how its AI agents reason over enterprise contract data and collaborate with each other. Sirion combines more than 10 large language models with over 1,200 proprietary small language models to power agents such as Search, Draft, Redline, Issue Detection, Extraction, Obligations, Playbook, and Invoice.$q$, $q$Sirion has been recognized as a Leader in the 2025 Gartner Magic Quadrant for Contract Life Cycle Management and as a Gartner Peer Insights Customers' Choice.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', $q$who-its-for$q$, $q$Who Sirion is for$q$, 2, ARRAY[$q$Sirion is built for large enterprises with complex contracting needs. Its website lists customers such as Citi, GE, Coca-Cola, IBM, Chevron, Bayer, Rolls-Royce, Saudi Aramco, PayPal, and Zalando, operating across more than 70 countries.$q$, $q$Legal, procurement, sales, and finance teams use Sirion to centralize contract repositories, automate drafting and redlining, monitor obligations, and reconcile invoices against contract terms.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8023eebe-e18e-4b41-9174-8eede636edf1', 'ee5576d4-5994-49f9-84c2-c9a84cc884f6') ON CONFLICT DO NOTHING;

-- ── Icertis ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Icertis is an AI-native contract intelligence platform used by Fortune 500 companies to draft, manage, and analyze contracts using its Vera AI.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$2,000+ employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Icertis is an AI-native CLM platform built around its Vera AI for Fortune 500 companies to draft, manage, and analyze contracts.$q$,
  og_description = $q$Icertis is an AI-native CLM platform built around its Vera AI for Fortune 500 companies to draft, manage, and analyze contracts.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b1e19ecc-4775-4332-8779-84e45195b570';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b1e19ecc-4775-4332-8779-84e45195b570' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Vera AI$q$, $q$Icertis's AI layer, providing context-driven contract accuracy, autonomous agents that operate within defined boundaries, and enterprise-grade validation.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Vera Copilot$q$, $q$An AI copilot that assists users throughout the contracting process.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Vera Obligations$q$, $q$Tracks and manages contractual obligations after a contract is signed.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Agent-powered drafting and redlining$q$, $q$Part of the platform's 'Engage' pillar, offering agent-powered drafting, redlining, and negotiation tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Structured contract operations$q$, $q$The platform's 'Operate' pillar turns contracts into a structured system with actionable data.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Portfolio-wide analytics$q$, $q$The 'Analyze' pillar provides continuous intelligence, including Standard and Advanced Analytics, across the entire contract portfolio.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Enterprise system integrations$q$, $q$Integrates with enterprise systems including SAP, Microsoft, and Salesforce.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Global language support$q$, $q$Supports 40+ languages across operations in 90+ countries.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Named a Leader in the Forrester Wave for Contract Lifecycle Management (2025).$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Recognized as a Gartner Peer Insights Customers' Choice for CLM (2025).$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Named one of the fastest-growing companies in the Americas by the Financial Times (2026).$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Backed by a large global organization with 2,000+ employees operating in 90+ countries.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Integrates with major enterprise systems (SAP, Microsoft, Salesforce) and is supported by system integrator partners including Accenture, PwC, Deloitte, and KPMG.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Pricing is not published; the /pricing page returns a 404 and prospects must contact sales for a quote.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$No free trial or free plan is advertised on the website.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Founding year and headquarters location are not published on the site.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Built for large, complex enterprise contracting programs, which may be more than smaller teams need.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Does Icertis publish pricing?$q$, $q$No. Icertis does not publish pricing; its /pricing page returns a 404, and pricing is provided by custom quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$What is Vera?$q$, $q$Vera is Icertis's AI layer, described as providing context-driven accuracy, autonomous agents that operate within set boundaries, and enterprise-grade validation.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Which industries does Icertis serve?$q$, $q$Icertis serves industries including healthcare, government, retail, media, telecom, automotive, manufacturing, technology, and energy, among others.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$How large is Icertis?$q$, $q$Icertis has 2,000+ employees and operates in more than 90 countries, supporting 40+ languages.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$What integrations does Icertis offer?$q$, $q$Icertis integrates with enterprise systems including SAP, Microsoft, and Salesforce, and works with system integrator partners such as Accenture, PwC, Deloitte, and KPMG.$q$, 4);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Has Icertis won any industry awards?$q$, $q$Yes. Icertis was named a Leader in the 2025 Forrester Wave for CLM, a 2025 Gartner Peer Insights Customers' Choice, and one of the Financial Times' fastest-growing companies in the Americas for 2026.$q$, 5);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Fortune 500 contract lifecycle management$q$, $q$Large global enterprises use Icertis to draft, negotiate, operationalize, and analyze contracts across their full portfolio.$q$, $q$Fortune 500 legal and procurement teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$AI-assisted contract drafting and negotiation$q$, $q$Legal teams use Vera's agent-powered drafting and redlining tools to speed up contract creation and negotiation.$q$, $q$Enterprise legal teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Contract obligation management$q$, $q$Teams use Vera Obligations to track and manage commitments after a contract is signed.$q$, $q$Contract operations and compliance teams$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$Portfolio-wide contract analytics$q$, $q$Organizations use Icertis's Standard and Advanced Analytics to gain continuous intelligence across their entire contract portfolio.$q$, $q$Enterprise operations and finance teams$q$, 3);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$overview$q$, $q$What is Icertis?$q$, 2, ARRAY[$q$Icertis is an AI-native contract intelligence platform built around Vera, its AI layer for contract drafting, management, and analytics. The platform is organized around three pillars: Engage (agent-powered drafting, redlining, and negotiation), Operate (a structured system for actionable contract data), and Analyze (continuous intelligence across the contract portfolio).$q$, $q$Icertis reports 2,000+ employees, operations in more than 90 countries, and support for 40+ languages. The company has been named a Leader in the 2025 Forrester Wave for Contract Lifecycle Management, a Gartner Peer Insights Customers' Choice for CLM, and one of the Financial Times' fastest-growing companies in the Americas for 2026.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', $q$who-its-for$q$, $q$Who Icertis is for$q$, 2, ARRAY[$q$Icertis targets Global Fortune 500 companies and large enterprises across industries such as healthcare, government, retail, media, telecom, automotive, manufacturing, technology, and energy. It serves legal, procurement, sales, finance, and IT departments, and integrates with enterprise systems including SAP, Microsoft, and Salesforce.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1e19ecc-4775-4332-8779-84e45195b570', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Agiloft ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Agiloft is an AI-powered contract lifecycle management (CLM) platform covering pre- and post-signature contracting, workflows, and reporting.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Redwood City, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Agiloft CLM: AI-powered contract lifecycle management with no-code workflows, e-signature integrations, and real-time dashboards.$q$,
  og_description = $q$Agiloft CLM: AI-powered contract lifecycle management with no-code workflows, e-signature integrations, and real-time dashboards.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '79e7a68c-5b55-4efb-8ebc-7627e27d0ded' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Pre- and post-signature contract management$q$, $q$Manage the full contract lifecycle from creation and negotiation through signature and renewal.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$AI-powered contract intelligence$q$, $q$Uses embedded AI ("AI on the inside") for autonomous contract review, risk analysis, and data extraction from agreements.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$No-code customizable workflows$q$, $q$Build and adjust contract workflows without writing code.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Real-time dashboards and reporting$q$, $q$Track contract status and metrics through live dashboards.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Obligation and renewal tracking$q$, $q$Monitor contractual obligations and upcoming renewals to reduce missed deadlines.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$E-signature integrations$q$, $q$Connects with DocuSign and Adobe Sign for signing workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Broad system integrations$q$, $q$Works with Salesforce, SAP, Oracle, and more than 1,000 other systems via pre-built connectors.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Recognized as a Gartner Magic Quadrant leader for CLM for six consecutive years.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Reports high customer retention (96%) and support satisfaction (96%).$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Used by large enterprises including Dell Technologies, Intel, Moderna, Roche, and Stripe.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Pre-built integrations with major systems (Salesforce, SAP, Oracle) and e-signature providers.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$No-code workflow customization.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$No public pricing is listed; prospects must schedule a demo or request a quote.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Founding year and company size are not disclosed on the site.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$No free trial or free plan is mentioned.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Does Agiloft publish its pricing?$q$, $q$No. The pricing page directs visitors to schedule a demo or contact the company for a quote rather than listing plan prices.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$What systems does Agiloft integrate with?$q$, $q$Agiloft integrates with Salesforce, SAP, Oracle, and more than 1,000 other systems, plus e-signature tools like DocuSign and Adobe Sign.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Where is Agiloft headquartered?$q$, $q$Agiloft's headquarters is listed as 303 Twin Dolphin Drive, Redwood City, CA 94065.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$What kind of companies use Agiloft?$q$, $q$Agiloft's customers include large enterprises such as Dell Technologies, Intel, Moderna, Roche, and Stripe.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Has Agiloft been recognized by industry analysts?$q$, $q$Yes, Agiloft has been named a Gartner Magic Quadrant leader for CLM for six consecutive years.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Enterprise contract lifecycle management$q$, $q$Manage contracts from creation through negotiation, signature, and renewal with AI-assisted review and tracking.$q$, $q$Legal and contracts teams at large enterprises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Sales contract automation$q$, $q$Automate contract workflows and integrate with CRM systems like Salesforce to speed up deal cycles.$q$, $q$Sales operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$Compliance and risk management$q$, $q$Use AI-powered risk analysis and obligation tracking to manage compliance risk across a contract portfolio.$q$, $q$Compliance and risk management teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$overview$q$, $q$What is Agiloft?$q$, 2, ARRAY[$q$Agiloft is a contract lifecycle management (CLM) platform that manages contracts from creation and negotiation through signature, obligation tracking, and renewal.$q$, $q$The platform embeds AI throughout the contract process, marketed as "AI on the inside," for tasks such as contract review, risk analysis, and data extraction, alongside no-code workflow customization and real-time dashboards.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', $q$who-its-for$q$, $q$Who Agiloft is for$q$, 2, ARRAY[$q$Agiloft is used by large enterprises across industries, with named customers including Dell Technologies, Intel, Moderna, Roche, and Stripe, and is positioned for organizations that need enterprise-grade CLM integrated with systems like Salesforce, SAP, and Oracle.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('79e7a68c-5b55-4efb-8ebc-7627e27d0ded', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Evisort ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Evisort's AI contract technology was acquired by Workday in 2024 and now powers Workday Contract Lifecycle Management, branded "powered by Evisort AI."$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Evisort's AI contract technology, acquired by Workday in 2024, now powers Workday Contract Lifecycle Management and Contract Intelligence.$q$,
  og_description = $q$Evisort's AI contract technology, acquired by Workday in 2024, now powers Workday Contract Lifecycle Management and Contract Intelligence.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '57b9a346-5643-4807-89c0-802cddc8a87c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '57b9a346-5643-4807-89c0-802cddc8a87c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$High-volume AI contract analysis$q$, $q$The contract AI can analyze 450,000 documents in just 24 hours, according to Workday.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Custom AI model creation$q$, $q$Supports building custom AI models for contract review as part of Workday Contract Intelligence.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Contract lifecycle management$q$, $q$Powers Workday's Contract Lifecycle Management product, covering the contract process end-to-end.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$E-signature integrations$q$, $q$Integrates with DocuSign and Adobe Sign.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Document storage integrations$q$, $q$Integrates with SharePoint, Box, and Google Drive.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$CRM integration$q$, $q$Integrates with Salesforce.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Responsible AI safeguards$q$, $q$Backed by ISO 42001, ISO 27001, and ISO 27701 certifications.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Workday has been recognized as a Visionary in the 2025 Gartner Magic Quadrant for Contract Life Cycle Management.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Reported customer outcomes include a 70% reduction in outside legal spend and a 65% reduction in contract execution time.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Can analyze up to 450,000 documents in 24 hours, with average deployment in 21 days.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Integrates with major e-signature, storage, and CRM tools (DocuSign, Adobe Sign, SharePoint, Box, Google Drive, Salesforce).$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Backed by Workday's enterprise platform following the 2024 acquisition.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Evisort no longer operates as a standalone product or website; evisort.com now redirects to Workday.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$No public pricing is available; access requires requesting a demo or contacting sales.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$No free trial or free plan is mentioned.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Founding year, headquarters, and company size are not disclosed on the current site.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Is Evisort still a standalone product?$q$, $q$No. Evisort was acquired by Workday in 2024, and its technology now powers Workday Contract Lifecycle Management and Workday Contract Intelligence, marketed as "powered by Evisort AI."$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Does this product offer a free trial?$q$, $q$The site does not mention a free trial; access requires requesting a demo or contacting sales.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$What can the Evisort-powered AI do?$q$, $q$According to Workday, its contract AI can analyze 450,000 documents in just 24 hours, with an average implementation time of 21 days.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$What systems does it integrate with?$q$, $q$It integrates with e-signature tools (DocuSign, Adobe Sign), storage systems (SharePoint, Box, Google Drive), and Salesforce.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Has this product been recognized by industry analysts?$q$, $q$Yes, Workday has been recognized as a Visionary in the 2025 Gartner Magic Quadrant for Contract Life Cycle Management.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Legal spend reduction$q$, $q$Use AI-powered contract review to reduce reliance on outside counsel, with reported reductions of up to 70% in outside legal spend.$q$, $q$Corporate legal departments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$High-volume contract analysis$q$, $q$Analyze large volumes of contracts quickly, with reported capacity to process 450,000 documents in 24 hours.$q$, $q$Enterprises with large contract portfolios$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$Contract lifecycle management within Workday$q$, $q$Manage contracts end-to-end within the Workday ecosystem, integrated with existing enterprise systems.$q$, $q$Existing Workday enterprise customers$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$overview$q$, $q$What is Evisort?$q$, 2, ARRAY[$q$Evisort was an AI contract technology company that was acquired by Workday in 2024. Its website now redirects to Workday, and its technology is offered as "Workday Contract Lifecycle Management" and "Workday Contract Intelligence," both marketed as "powered by Evisort AI."$q$, $q$The combined product performs AI-driven contract analysis, reportedly able to process 450,000 documents in 24 hours, and integrates with e-signature, storage, and CRM tools including DocuSign, Adobe Sign, SharePoint, Box, Google Drive, and Salesforce.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', $q$who-its-for$q$, $q$Who Evisort is for$q$, 2, ARRAY[$q$The Evisort-powered technology is positioned for enterprises with large contract volumes, including existing Workday customers looking for integrated contract lifecycle management and AI-driven contract analysis.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('57b9a346-5643-4807-89c0-802cddc8a87c', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Lexion ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Lexion is an AI-powered contract management platform for legal, sales, procurement, HR, and finance teams, now part of Docusign.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2019,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Lexion: AI-powered contract management for legal, sales, procurement, HR, and finance teams. Now part of Docusign. See features and reviews.$q$,
  og_description = $q$Lexion: AI-powered contract management for legal, sales, procurement, HR, and finance teams. Now part of Docusign. See features and reviews.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dcb87420-fbd7-430c-9df6-534d57e84b61';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dcb87420-fbd7-430c-9df6-534d57e84b61' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Centralized contract dashboard$q$, $q$A centralized dashboard brings contract management activity together for operations teams across departments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Email-driven intake$q$, $q$Contracts and requests can be captured through an email-driven intake workflow.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$No-code approval automation$q$, $q$No-code automation handles approval routing and document generation without custom development.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$AI-powered contract repository$q$, $q$An AI-powered repository automatically tracks key dates and terms extracted from contracts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$AI Contract Assist$q$, $q$AI Contract Assist supports contract drafting and negotiation.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Business tool integrations$q$, $q$Lexion integrates with Salesforce, HubSpot, Microsoft Word, Coupa, Slack, Microsoft Teams, and DocuSign, and offers API access.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Contract signature support$q$, $q$The platform includes contract signature capabilities as part of the workflow.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$AI-powered repository automatically extracts key contract terms and dates$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$No-code workflow automation for approvals and document generation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Integrates with widely used business tools including Salesforce, Slack, Microsoft Teams, and DocuSign$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Recognized with multiple G2 awards (Leader, Best Usability, Best Support/Enterprise) and a LegalTech Breakthrough Award$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Now backed by Docusign's resources following its acquisition$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Pricing is not publicly disclosed on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$No free trial or free plan is mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$No mobile app (iOS/Android) information is stated$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Now operates under Docusign ownership following its acquisition, which could affect independent product direction$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Is Lexion free to use?$q$, $q$Lexion's website does not publish pricing tiers, costs, or free trial information; pricing appears to require contacting the company directly.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Who owns Lexion?$q$, $q$Lexion's site announces that it has recently joined Docusign, while continuing to operate under the Lexion name.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$What departments does Lexion serve?$q$, $q$Lexion states it serves operations teams across legal, sales, procurement, HR, finance, and IT.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Does Lexion use AI?$q$, $q$Yes. Lexion describes AI built at the Allen Institute for AI (AI2) that powers automatic contract analysis, key term and date tracking, and its Contract Assist drafting and negotiation feature.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$What tools does Lexion integrate with?$q$, $q$Lexion lists integrations with Salesforce, HubSpot, Microsoft Word, Coupa, Slack, Microsoft Teams, and DocuSign, plus API access.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Centralizing contract intake and approvals$q$, $q$Teams route incoming contract requests via email-driven intake and use no-code automation to manage approvals and document generation.$q$, $q$Legal and operations teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Automated contract term and date tracking$q$, $q$Lexion's AI-powered repository automatically extracts and tracks key terms and dates across the contract portfolio.$q$, $q$Legal and contract operations teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$Cross-department contract collaboration$q$, $q$Sales, procurement, HR, and finance teams collaborate on contract workflows through a shared, centralized platform.$q$, $q$Sales, procurement, HR, and finance teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$overview$q$, $q$What is Lexion?$q$, 2, ARRAY[$q$Lexion describes itself as "the fastest way to get contracts done right," a platform built to help operations teams accelerate contract workflows across departments including sales, procurement, legal, HR, and finance.$q$, $q$The platform combines a centralized contract dashboard, email-driven intake, no-code approval automation, and an AI-powered repository that automatically tracks key contract terms and dates, alongside an AI Contract Assist feature for drafting and negotiation. Lexion was founded in 2019 by co-founders who met at the Allen Institute for AI (AI2), and its website states it has recently joined Docusign while continuing to operate under the Lexion name.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', $q$who-its-for$q$, $q$Who Lexion is for$q$, 2, ARRAY[$q$Lexion targets operations teams across legal, sales, procurement, HR, finance, and IT, and its site lists software, biotech and pharma, healthcare, and consumer goods among the industries it serves.$q$, $q$Organizations that need to route contracts through multiple departments and want automation for intake, approvals, and term tracking are the primary audience described on Lexion's site.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dcb87420-fbd7-430c-9df6-534d57e84b61', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Robin AI ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Robin AI is an AI-powered legal intelligence platform that reviews, analyzes, and helps finalize contracts for enterprise legal teams.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Robin AI: AI platform for contract review, search, and obligation tracking, used by Fortune 500 legal teams. See features and details.$q$,
  og_description = $q$Robin AI: AI platform for contract review, search, and obligation tracking, used by Fortune 500 legal teams. See features and details.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fb49326f-7c73-43d6-b58a-39f713485eed';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fb49326f-7c73-43d6-b58a-39f713485eed' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$AI document chat$q$, $q$A chat interface lets users discuss documents in searchable conversations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Advanced contract search$q$, $q$Advanced search finds contracts across thousands of documents, with automatic detection of contract types, signatures, and key terms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Obligation tracking$q$, $q$Smart alerts track obligations to help prevent missed deadlines and breaches.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Team workspaces$q$, $q$Workspaces give teams a structured, searchable space for collaboration on contracts.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$AI built with Anthropic and AWS$q$, $q$Robin AI states its platform is built in partnership with Anthropic and AWS for its AI and infrastructure.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$States it has processed 500k+ documents$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Claims 80% faster contract review on its site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$ISO27001 and SOC2 certified, and states GDPR compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$States it works with 13 Fortune 500 companies$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Backed by investors including Google, PayPal, and Temasek$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$No public pricing information is disclosed on the website$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$No free trial or free plan is mentioned on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$No mobile app (iOS/Android) information is stated$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Founding year and a single headquarters location are not clearly disclosed on the site$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$What does Robin AI do?$q$, $q$Robin AI's site describes an AI-powered platform that "reviews, analyses, and finalises contracts," offering document insights and legal intelligence.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$How many documents has Robin AI processed?$q$, $q$Robin AI's homepage states "500k+ Docs processed" and "80% Faster review."$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Does Robin AI have security certifications?$q$, $q$Robin AI states it is ISO27001 and SOC2 certified and compliant with GDPR.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Who does Robin AI partner with for its AI?$q$, $q$Robin AI's site states the platform is built in partnership with Anthropic and AWS.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Where does Robin AI have offices?$q$, $q$Robin AI's company page lists offices in London, New York, and Singapore, with teams also in the United States, United Kingdom, Singapore, and South Africa.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Contract review and finalization$q$, $q$Robin AI's platform reviews, analyzes, and helps finalize contracts using AI.$q$, $q$Enterprise legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Contract search and discovery$q$, $q$Advanced search helps teams find contracts across thousands of documents, with automatic detection of contract types and key terms.$q$, $q$Legal and compliance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$Obligation and deadline tracking$q$, $q$Smart alerts track contractual obligations to help prevent missed deadlines and breaches.$q$, $q$Legal operations teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$overview$q$, $q$What is Robin AI?$q$, 2, ARRAY[$q$Robin AI describes its platform as one that "reviews, analyses, and finalises contracts in the time it takes to finish this sentence," providing instant document insights through a legal intelligence platform.$q$, $q$The product includes a chat interface for discussing documents, advanced search across large document sets, obligation tracking with smart alerts, and team workspaces. Robin AI states its platform is built in partnership with Anthropic and AWS, and that it has processed over 500,000 documents for clients including 13 Fortune 500 companies.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', $q$who-its-for$q$, $q$Who Robin AI is for$q$, 2, ARRAY[$q$Robin AI targets enterprise legal teams, stating it works with organizations including 13 Fortune 500 companies and leading private equity firms.$q$, $q$The company maintains offices in London, New York, and Singapore, with teams also based in the United States, United Kingdom, Singapore, and South Africa, and states it is ISO27001 and SOC2 certified and GDPR compliant.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fb49326f-7c73-43d6-b58a-39f713485eed', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Spellbook ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI legal copilot that reviews, drafts, and compares contracts directly inside Microsoft Word.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Spellbook is an AI contract review and drafting copilot for Microsoft Word, used by 4,500+ legal teams in 80+ countries.$q$,
  og_description = $q$Spellbook is an AI contract review and drafting copilot for Microsoft Word, used by 4,500+ legal teams in 80+ countries.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '4518f944-7168-437d-a54e-83df3dc6c03e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '4518f944-7168-437d-a54e-83df3dc6c03e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Review$q$, $q$Redlines contracts and flags risks directly inside Microsoft Word.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Draft$q$, $q$Creates clauses and full documents from scratch or from an organization's precedent library.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Compare$q$, $q$Benchmarks a contract's terms against thousands of similar agreements.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Ask$q$, $q$Answers legal questions with cited sources pulled from relevant documents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Playbooks$q$, $q$Encodes an organization's negotiation standards so reviews stay consistent.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Associate$q$, $q$An AI agent that carries out multi-document legal workflows.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Integrations$q$, $q$Connects to email, Slack, and Salesforce alongside its Word add-in.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Works directly inside Microsoft Word, requiring no workflow change for lawyers$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Used by 4,500+ legal teams across 80+ countries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$SOC 2 Type II, GDPR, CCPA, and PIPEDA compliant with Zero Data Retention options$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Covers the full contract lifecycle: review, drafting, comparison, and Q&A$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Pricing is not published and requires booking a demo for a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Primarily built around a Microsoft Word workflow$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Per-seat licensing means costs scale with team size$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Is there a free trial for Spellbook?$q$, $q$Yes, Spellbook offers a 7-day free trial for lawyers and legal teams.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$How is Spellbook priced?$q$, $q$Pricing is determined by the number of team members on a license; a custom quote is provided after a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Where does Spellbook run?$q$, $q$Spellbook runs as an add-in inside Microsoft Word.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$What AI models power Spellbook?$q$, $q$Spellbook says it is powered by advanced large language models, including GPT-5 and Opus, tuned for commercial legal work.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Contract redlining at scale$q$, $q$In-house legal teams use Spellbook to review and flag risks in incoming contracts inside Word.$q$, $q$In-house legal departments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$Drafting from precedent$q$, $q$Law firms draft new clauses and documents using their own precedent libraries.$q$, $q$Law firms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$overview$q$, $q$What is Spellbook?$q$, 2, ARRAY[$q$Spellbook is an AI-powered legal copilot that works as an add-in inside Microsoft Word, helping lawyers review, draft, and compare contracts without leaving their existing document workflow.$q$, $q$The platform offers Review for redlining and risk-flagging, Draft for generating clauses and documents, Compare for benchmarking terms against similar agreements, Ask for cited legal Q&A, and Associate, an AI agent for multi-document workflows.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', $q$who-its-for$q$, $q$Who Spellbook is for$q$, 2, ARRAY[$q$Spellbook is aimed at in-house legal teams and law firms that want to speed up contract review and drafting. The company reports it is used by 4,500+ legal teams in 80+ countries, including teams at Dropbox, Atkins Realis, Asics, and Kennedys Law.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('4518f944-7168-437d-a54e-83df3dc6c03e', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Harvey ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI platform for law firms and in-house legal teams covering research, drafting, and document review.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Harvey is an AI platform for legal and professional services, used by 60+ AmLaw 100 firms for research, drafting, and review.$q$,
  og_description = $q$Harvey is an AI platform for legal and professional services, used by 60+ AmLaw 100 firms for research, drafting, and review.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '27da3ffe-16ca-4435-8f4c-af4532ecfbcd' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Assistant$q$, $q$Domain-specific AI for document analysis, legal research, and drafting.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Vault$q$, $q$Secure document storage, organization, and bulk analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Knowledge$q$, $q$Research across legal, regulatory, and tax domains.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Agents$q$, $q$Autonomous tools that execute complex legal workflows end-to-end.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Contract Intelligence$q$, $q$Extracts insights and accelerates contract review.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Command Center$q$, $q$Analytics and organizational AI usage insights.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Shared Spaces$q$, $q$Secure collaboration on matters across organizations.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Harvey Mobile$q$, $q$Mobile access to continue legal workflows away from a desktop.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Used by 60+ AmLaw 100 firms and named enterprise customers such as Vinson & Elkins, Reed Smith, and A&O Shearman$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Certified to SOC2 II, ISO 27001, ISO 27701, ISO 42001, GDPR, and CCPA standards$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Available in US, EU, and Australia regions with SAML SSO and enterprise access controls$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Customers report averaging 20+ hours saved per professional per month$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Pricing is not published; a demo request is required to get a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Positioning and named customers skew toward large law firms and enterprise legal teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$No public free trial or self-serve signup$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$How much does Harvey cost?$q$, $q$Harvey does not publish pricing; prospective customers must request a demo to get a quote.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Who uses Harvey?$q$, $q$Harvey is used by 60+ AmLaw 100 firms and legal teams, including Vinson & Elkins, Reed Smith, Deutsche Telekom, and A&O Shearman.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$What security certifications does Harvey have?$q$, $q$Harvey holds SOC2 II, ISO 27001, ISO 27701, and ISO 42001 certifications, and supports GDPR and CCPA compliance.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Is there a mobile version of Harvey?$q$, $q$Yes, Harvey Mobile provides mobile access to continue legal workflows.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Large-scale document review$q$, $q$AmLaw 100 firms use Harvey's Vault to organize and bulk-analyze large sets of documents.$q$, $q$Large law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$Multi-jurisdiction legal research$q$, $q$Legal teams use Harvey's Knowledge feature to research across legal, regulatory, and tax domains.$q$, $q$In-house legal departments$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$overview$q$, $q$What is Harvey?$q$, 2, ARRAY[$q$Harvey is an AI software platform built for legal and professional services, offering tools for document analysis, legal research, drafting, contract intelligence, and autonomous agent-driven workflows.$q$, $q$The platform includes Assistant, Vault, Knowledge, Agents, Contract Intelligence, Command Center, Shared Spaces, and a mobile app, and is certified against SOC2 II, ISO 27001, ISO 27701, and ISO 42001 standards.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', $q$who-its-for$q$, $q$Who Harvey is for$q$, 2, ARRAY[$q$Harvey targets law firms, including AmLaw 100 firms, in-house legal departments, and enterprise legal teams that need to automate research, drafting, and document review at scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('27da3ffe-16ca-4435-8f4c-af4532ecfbcd', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── Filevine ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based legal case management platform with firm-wide AI agents, built on the LOIS system.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = $q$850+ employees$q$,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Filevine is a legal case management platform with firm-wide AI agents (LOIS), serving 6,000+ clients and 100,000+ users.$q$,
  og_description = $q$Filevine is a legal case management platform with firm-wide AI agents (LOIS), serving 6,000+ clients and 100,000+ users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '15c3e1d1-3978-4b9a-82fd-8517048b2955';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '15c3e1d1-3978-4b9a-82fd-8517048b2955' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Firm-wide AI agents$q$, $q$AI agents that operate across multiple matters simultaneously, not just single tasks.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Structured legal graph$q$, $q$Built on 40M+ cases to support comprehensive case analysis.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Read/write AI actions$q$, $q$AI can generate documents, assign tasks, and manage deadlines directly in the system.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Document management$q$, $q$Centralized storage and organization of case documents.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Contract lifecycle management$q$, $q$Tools for managing contracts from drafting through execution.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Depositions$q$, $q$Scheduling, hosting, and analysis tools for depositions.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Vinesign$q$, $q$Built-in eSignature capability.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Medical record chronology$q$, $q$Tools to organize and summarize medical records for case work.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Free trial available before committing to a subscription$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Firm-wide AI agents work across multiple matters, not just individual tasks$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Structured legal graph built on 40M+ cases$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Serves 6,000+ clients and 100,000+ users across firm sizes and practice areas$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Pricing is not published; packages are custom-quoted after a sales conversation$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Broad, firm-wide feature set may be more than very small solo practices need$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Specific plan tiers and limits are not disclosed publicly$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Does Filevine offer a free trial?$q$, $q$Yes, Filevine offers a free trial so firms can evaluate the platform before subscribing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$How is Filevine priced?$q$, $q$Filevine does not publish prices; all packages are custom-built and quoted after a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$What is LOIS?$q$, $q$LOIS (Legal Operating Intelligence System) is Filevine's AI platform layer that powers firm-wide agents, drafting, and case analysis.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$What practice areas does Filevine support?$q$, $q$Filevine is used across practice areas including personal injury, family law, mass torts, immigration, insurance defense, criminal defense, and estate planning, as well as by government legal offices.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Firm-wide case operations$q$, $q$Law firms use Filevine's AI agents to manage tasks and deadlines across many matters at once.$q$, $q$Law firms of all sizes$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$Personal injury case tracking$q$, $q$Personal injury practices use Filevine to track medical records, deadlines, and settlement progress.$q$, $q$Personal injury law firms$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$overview$q$, $q$What is Filevine?$q$, 2, ARRAY[$q$Filevine is a legal case management and AI platform built around LOIS (Legal Operating Intelligence System), designed to operate across an entire firm's matters rather than one task at a time.$q$, $q$It combines document management, contract lifecycle management, depositions, eSignatures (Vinesign), and analytics, with AI agents that can read and write into the system to generate documents and manage deadlines.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', $q$who-its-for$q$, $q$Who Filevine is for$q$, 2, ARRAY[$q$Filevine serves law firms of all sizes, from solo practitioners to Big Law, across practice areas such as personal injury, family law, mass torts, immigration, insurance defense, and criminal defense, as well as government legal offices and in-house counsel.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('15c3e1d1-3978-4b9a-82fd-8517048b2955', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Litify ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Salesforce-built legal operations platform combining case management, billing, and AI-driven workflows.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2016,
  company_size = $q$170+ employees$q$,
  headquarters = $q$New York, NY, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Litify is a Salesforce-based legal operations platform for law firms and corporate legal departments, founded in 2016.$q$,
  og_description = $q$Litify is a Salesforce-based legal operations platform for law firms and corporate legal departments, founded in 2016.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'dc263e36-ce97-42d4-be53-04c312ae1484';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'dc263e36-ce97-42d4-be53-04c312ae1484' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Intake Management$q$, $q$Dynamic questionnaires and client portals for qualifying new cases.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Matter Management$q$, $q$Centralized case handling with built-in automation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Document Management$q$, $q$AI-powered document generation and PDF editing.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Time & Billing$q$, $q$Automated time capture and billing optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Spend Management$q$, $q$Legal expense tracking, budgeting, and invoice management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Reporting & Analytics$q$, $q$No-code reporting engine with customizable dashboards.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Litify AI$q$, $q$Agentic AI workflows embedded across the platform.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Built on the Salesforce platform, giving firms familiar CRM-style infrastructure$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$No-code reporting engine for customizable dashboards without IT support$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Founded in 2016 with 170+ employees across two US offices$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Embedded AI (Litify AI) spans intake, documents, and reporting$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Pricing is not published and requires a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Built on Salesforce, which may add platform overhead for firms unfamiliar with it$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$No public free trial mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$When was Litify founded?$q$, $q$Litify was founded in 2016.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Where is Litify headquartered?$q$, $q$Litify has offices in New York, NY and New Orleans, LA.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$What platform is Litify built on?$q$, $q$Litify is built on the Salesforce platform.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$How much does Litify cost?$q$, $q$Litify does not publish pricing; interested firms must request a demo for a quote.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Personal injury case management$q$, $q$Firms handling personal injury and insurance defense cases use Litify's matter management and automation.$q$, $q$Personal injury and insurance defense firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$Corporate legal operations$q$, $q$In-house legal departments use Litify's spend management and analytics to track legal costs and matters.$q$, $q$Corporate legal departments$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$overview$q$, $q$What is Litify?$q$, 2, ARRAY[$q$Litify is a cloud-based legal operations platform built on Salesforce, combining intake management, matter management, document management, time and billing, spend management, and reporting into one system.$q$, $q$Founded in 2016, the company describes Litify as a 'platform of action' that automates workflows and embeds agentic AI (Litify AI) across intake, document generation, and analytics.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', $q$who-its-for$q$, $q$Who Litify is for$q$, 2, ARRAY[$q$Litify is aimed at law firms handling personal injury, insurance defense, and immigration cases, as well as corporate legal departments and enterprise legal teams that need advanced analytics and compliance controls.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('dc263e36-ce97-42d4-be53-04c312ae1484', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── CosmoLex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud practice management software combining matter management with built-in trust and business accounting.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$West Palm Beach, FL, USA$q$,
  languages = '{}',
  seo_meta_description = $q$CosmoLex is cloud practice management software with built-in trust accounting, offering a free 10-day trial.$q$,
  og_description = $q$CosmoLex is cloud practice management software with built-in trust accounting, offering a free 10-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cee2123f-c1f7-4345-90bb-fd1586f42fd7' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Trust & business accounting$q$, $q$Built-in three-way reconciliation for trust and business accounts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Time and billable tracking$q$, $q$Automated time capture and billable hour tracking.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Matter-centric case management$q$, $q$Organizes documents, tasks, and communications around each matter.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Client intake automation$q$, $q$Automated lead tracking and intake workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Invoicing and payments$q$, $q$Invoice generation with integrated payment processing.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Document management$q$, $q$Secure document storage and client communication.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Financial reporting$q$, $q$100+ real-time financial reporting options with full audit trails.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Free 10-day trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Built-in trust accounting with three-way reconciliation, reducing the need for separate accounting software$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$100+ real-time financial reports with full audit trails for compliance$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Integrates with QuickBooks Online, Outlook, Google Workspace, Box, Dropbox, and NetDocuments$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Pricing is not published on the website; requires contacting sales or scheduling a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Website builder is only bundled in the Elite + Website tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$All named plans (Standard, Elite, Elite + Website) show identical core features, so differences are limited to add-ons$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Does CosmoLex offer a free trial?$q$, $q$Yes, CosmoLex offers a free 10-day trial with the same functionality as a paid subscription, aside from a single bank feed limitation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Where is CosmoLex based?$q$, $q$CosmoLex is based in West Palm Beach, Florida, and is part of ProfitSolv.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Does CosmoLex integrate with QuickBooks?$q$, $q$Yes, QuickBooks Online integration is available on the Standard and Elite tiers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$What plans does CosmoLex offer?$q$, $q$CosmoLex offers Standard, Elite, and Elite + Website plans; pricing for each requires contacting sales.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Trust accounting compliance$q$, $q$Solo and small firms use CosmoLex's built-in trust accounting to stay compliant without separate accounting software.$q$, $q$Solo practitioners and small law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Consolidating practice tools$q$, $q$Mid-sized firms use CosmoLex to replace multiple disconnected billing and case management tools with one system.$q$, $q$Mid-sized law firms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Standard$q$, $q$Contact sales$q$, NULL, $q$["Conflict checking and calendaring","Document management with secure sharing","Time and expense tracking","Trust accounting and compliance","Full accounting integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Elite$q$, $q$Contact sales$q$, NULL, $q$["All Standard features","Matter status boards","Workflow automation","Task logic","Matter budgets"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$Elite + Website$q$, $q$Contact sales$q$, NULL, $q$["All Elite features","CosmoLex website builder included"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$CosmoLex CRM (add-on)$q$, $q$$147/month$q$, $q$annual$q$, $q$["Up to 3 users","$177/month if billed month-to-month"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$CosmoLex Websites (add-on)$q$, $q$$149/month$q$, $q$annual$q$, $q$["$159/month if billed month-to-month"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$overview$q$, $q$What is CosmoLex?$q$, 2, ARRAY[$q$CosmoLex is a cloud-based practice management platform that combines matter management, trust and business accounting, billing, time tracking, and document management in one system.$q$, $q$It is part of ProfitSolv and is based in West Palm Beach, Florida. Distinguishing features across its Standard, Elite, and Elite + Website plans include matter status boards, workflow automation, and an optional bundled website builder.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', $q$who-its-for$q$, $q$Who CosmoLex is for$q$, 2, ARRAY[$q$CosmoLex is built for solo practitioners, small firms, and mid-sized law practices that want to consolidate case management, billing, and trust accounting into a single tool instead of using multiple disconnected systems.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cee2123f-c1f7-4345-90bb-fd1586f42fd7', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── TimeSolv ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Time tracking and billing software for law firms and hourly professionals, with iOS and Android apps.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$West Palm Beach, FL, USA$q$,
  languages = '{}',
  seo_meta_description = $q$TimeSolv is time and billing software with mobile apps, trust accounting, and a 10-day free trial for law firms.$q$,
  og_description = $q$TimeSolv is time and billing software with mobile apps, trust accounting, and a 10-day free trial for law firms.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'a06b1be4-eb20-4b50-a730-a18c95839a81';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'a06b1be4-eb20-4b50-a730-a18c95839a81' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Automatic time tracking$q$, $q$Mobile app timer with offline access and matter shortcuts.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Invoicing$q$, $q$Customizable invoice templates with auto-populated billing data.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$TimeSolvPay$q$, $q$Built-in payment processing accepting credit cards and ACH transfers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Trust accounting$q$, $q$Three-way reconciliation and trust reporting for compliance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Project management$q$, $q$Task assignment, timeline monitoring, and budget control.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Client portal$q$, $q$Secure access to documents and invoices for clients.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Reporting$q$, $q$30+ customizable performance and financial reports.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$10-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Native iOS and Android mobile apps with offline time entry$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Integrates with QuickBooks, NetDocuments, Dropbox, LawPay, AccountEdge, OneDrive, Outlook, and Xero$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Built-in trust accounting with three-way reconciliation$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Pricing for the Pro and Legal plans is not published; based on plan tier and add-ons$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Add-on modules (CRM, website, payments) are priced and billed separately from the core plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Full feature set (trust accounting, LEDES billing) is limited to the Legal plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Does TimeSolv offer a free trial?$q$, $q$Yes, TimeSolv offers a 10-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Does TimeSolv have a mobile app?$q$, $q$Yes, TimeSolv has native iOS and Android apps with a built-in timer and offline access.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$What is the difference between the Pro and Legal plans?$q$, $q$The Legal plan adds conflict checking, matter budgets, LEDES billing, split billing, and trust accounting on top of the Pro plan's features.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$What integrations does TimeSolv support?$q$, $q$TimeSolv integrates with QuickBooks, NetDocuments, Dropbox, LawPay, AccountEdge, OneDrive, Outlook, and Xero.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Billable hour tracking on the go$q$, $q$Professionals use TimeSolv's mobile app to track billable time with or without an internet connection.$q$, $q$Lawyers, consultants, and accountants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Trust accounting compliance$q$, $q$Law firms use TimeSolv's Legal plan for compliant three-way trust reconciliation and reporting.$q$, $q$Law firms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Pro$q$, $q$Contact sales$q$, $q$monthly$q$, $q$["Time & expense tracking","Calendaring","Task management","Mobile app","Document management","Integrations with Outlook, O365, LawPay, Xero, QuickBooks"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Legal$q$, $q$Contact sales$q$, $q$monthly$q$, $q$["All Pro features","Conflict check","Matter budgets","Custom data views","LEDES billing","Split billing","Trust accounting","Bulk payment collection"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Client Engagement CRM (add-on)$q$, $q$$147/month$q$, $q$annual$q$, $q$["Up to 3 users","$177/month if billed month-to-month","Intake forms","Automated workflows","Email/text campaigns","E-signatures"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$Professional Website (add-on)$q$, $q$$149/month$q$, $q$annual$q$, $q$["$159/month if billed month-to-month","SEO optimization","Mobile-friendly design","Practice-specific pages"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$overview$q$, $q$What is TimeSolv?$q$, 2, ARRAY[$q$TimeSolv is time tracking and billing software that helps professionals capture billable hours, generate invoices, process payments, and manage projects.$q$, $q$It offers Pro and Legal plans, native iOS and Android mobile apps, built-in TimeSolvPay payment processing, and add-ons for CRM and website building. TimeSolv is part of ProfitSolv, based in West Palm Beach, Florida.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', $q$who-its-for$q$, $q$Who TimeSolv is for$q$, 2, ARRAY[$q$TimeSolv is built for law firms, consultants, accountants, freelancers, PR firms, and other hourly, service-based businesses that need to track time and bill clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('a06b1be4-eb20-4b50-a730-a18c95839a81', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Bill4Time ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Legal time and billing software with per-user tiered pricing, trust accounting, and mobile apps.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/user/month (billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Bill4Time is legal time and billing software starting at $39/user/month, with a 14-day free trial and mobile apps.$q$,
  og_description = $q$Bill4Time is legal time and billing software starting at $39/user/month, with a 14-day free trial and mobile apps.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '20f8795e-e405-44d9-8790-07ffa387bbf6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '20f8795e-e405-44d9-8790-07ffa387bbf6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Time tracking$q$, $q$Desktop and mobile timers with calendar-based and manual time entry.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Billing & invoicing$q$, $q$Customizable templates and batch, matter-based invoicing.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Case management$q$, $q$Centralized file storage, task assignment, and client collaboration.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Online payments$q$, $q$Native processing for credit cards, eCheck, and ACH with payment links.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Trust accounting$q$, $q$Compliance tools for IOLTA and ABA requirements (Legal plans).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Reporting$q$, $q$Interactive dashboards for collections, aging invoices, and firm performance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Client portal$q$, $q$Secure document sharing and transparent billing access for clients.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Published, transparent per-user pricing across four tiers$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Legal-specific tiers add trust accounting, conflict checking, and LEDES export$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Available on web, desktop, iOS, and Android$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$No permanent free plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Trust accounting and conflict checking require the Legal Pro or Legal Enterprise tier$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Advanced reports and dedicated account management are reserved for Enterprise tiers$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$How much does Bill4Time cost?$q$, $q$Bill4Time starts at $39/user/month for Time & Billing when billed annually ($49/user/month billed monthly); Legal Pro and Enterprise tiers cost more.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Is there a free trial?$q$, $q$Yes, Bill4Time offers a 14-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Does Bill4Time support trust accounting?$q$, $q$Yes, trust accounting is included in the Legal Pro and Legal Enterprise plans.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Does Bill4Time have a mobile app?$q$, $q$Yes, Bill4Time offers iOS and Android mobile apps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Solo and small firm billing$q$, $q$Solo practitioners and small firms use Bill4Time's Time & Billing plan for time tracking and invoicing.$q$, $q$Solo practitioners and small law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Trust-compliant legal billing$q$, $q$Law firms use the Legal Pro or Legal Enterprise plans for IOLTA-compliant trust accounting and LEDES billing.$q$, $q$Law firms with trust accounting needs$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Time & Billing$q$, $q$$49/user/month ($39/user/month billed annually)$q$, $q$monthly$q$, $q$["Time tracking","Task management","Client management","Client portal","Invoicing","Payments","Reporting","Mobile app","QuickBooks integration"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Time & Billing Enterprise$q$, $q$$79/user/month ($69/user/month billed annually)$q$, $q$monthly$q$, $q$["All Time & Billing features","Customizable data fields","Dedicated account manager","Advanced data import","Advanced reports"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Legal Pro$q$, $q$$69/user/month ($59/user/month billed annually)$q$, $q$monthly$q$, $q$["All Time & Billing features","Trust accounting","Conflict checker","Contingency billing","LEDES export","Box/NetDocuments integration"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$Legal Enterprise$q$, $q$$99/user/month ($89/user/month billed annually)$q$, $q$monthly$q$, $q$["All Legal Pro features","Customizable data fields","Custom LEDES export","Dedicated success specialist","Advanced data import"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$overview$q$, $q$What is Bill4Time?$q$, 2, ARRAY[$q$Bill4Time is legal time and billing software that helps firms track billable hours, manage cases, invoice clients, and process payments in one platform.$q$, $q$It offers four published pricing tiers, from a general Time & Billing plan up to Legal Enterprise with trust accounting and custom LEDES export, plus web, desktop, iOS, and Android access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', $q$who-its-for$q$, $q$Who Bill4Time is for$q$, 2, ARRAY[$q$Bill4Time serves law firms of all sizes, from solo practitioners to larger firms, as well as other hourly professionals such as accountants, architects, consultants, contractors, and healthcare providers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('20f8795e-e405-44d9-8790-07ffa387bbf6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Actionstep ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based legal practice management platform for midsize law firms with AI-powered automation.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Denver, CO, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Actionstep is cloud practice management software for midsize law firms, used by 5,000+ firms with 50+ integrations.$q$,
  og_description = $q$Actionstep is cloud practice management software for midsize law firms, used by 5,000+ firms with 50+ integrations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '83af1af4-6221-4015-833c-810c8bd8d57f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '83af1af4-6221-4015-833c-810c8bd8d57f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Matter management & workflow automation$q$, $q$Automates case workflows alongside document and email management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Document automation$q$, $q$Template-based document generation across matter types.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Client portal & communications$q$, $q$Client-facing portal for communication and a firm knowledge center.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Billing & trust accounting$q$, $q$Time tracking, invoicing, payment processing, and trust accounting.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$CRM & client intake$q$, $q$Webforms, conflict checking, and marketing/business development tools.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$AI-powered automation$q$, $q$AI features for time capture, client intake assistance, and administrative tasks.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$50+ integrations$q$, $q$Connects with Microsoft Office 365, Xero, Zapier, DocuSign, and more.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Used by 5,000+ law firms worldwide$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$50+ integrations including Microsoft 365, Xero, Zapier, and DocuSign$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$AI features for time capture and client intake automation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Native iOS and Android mobile apps$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Pricing is not published; priced per user plus implementation fees, quote required$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$No free trial or free plan mentioned$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Pricing and availability vary by region (US, UK, AU, NZ, Canada)$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$How is Actionstep priced?$q$, $q$Actionstep is priced per user plus implementation fees, with a custom quote required; it does not publish specific rates.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Where is Actionstep headquartered?$q$, $q$Actionstep's office is located at 1743 Wazee St #200, Denver, CO 80202, and the company has 5 global offices.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Does Actionstep have a mobile app?$q$, $q$Yes, Actionstep offers iOS and Android mobile apps.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$What integrations does Actionstep support?$q$, $q$Actionstep offers 50+ integrations, including Microsoft Office 365, Xero, Zapier, DocuSign, and InfoTrack.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Scaling a midsize firm$q$, $q$Midsize law firms use Actionstep's workflow automation and CRM to manage growth without adding administrative headcount.$q$, $q$Midsize law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Multi-practice-area management$q$, $q$Firms spanning bankruptcy, family, real estate, and litigation practices use Actionstep's matter management across all case types.$q$, $q$Multi-practice-area law firms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Practice Management$q$, $q$Priced per user plus implementation fees$q$, NULL, $q$["Matter & case management","Client intake","Document management","CRM","Client portal","Accounting basics","Billing","Trust accounting","Workflow automation"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$Legal Accounting$q$, $q$Priced per user plus implementation fees$q$, NULL, $q$["General ledger","Banking","Accounts payable/receivable","Financial reporting","Revenue recognition","Forecasting","North America only"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$overview$q$, $q$What is Actionstep?$q$, 2, ARRAY[$q$Actionstep is a cloud-based legal practice management platform that combines matter management, workflow automation, billing, trust accounting, and CRM tools, with AI features for time capture and client intake.$q$, $q$The company operates 5 global offices, including its Denver, CO location, and offers 50+ integrations such as Microsoft Office 365, Xero, Zapier, and DocuSign.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', $q$who-its-for$q$, $q$Who Actionstep is for$q$, 2, ARRAY[$q$Actionstep is built for midsize law firms across practice areas including bankruptcy, business, criminal defense, employment, estate planning, family, immigration, intellectual property, litigation, personal injury, real estate, and tax law.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('83af1af4-6221-4015-833c-810c8bd8d57f', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── CASEpeer ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Practice management software built for personal injury law firms, with an AI writing assistant.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$79/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$8am CASEpeer is personal injury practice management software starting at $79/user/month with an AI writing assistant.$q$,
  og_description = $q$8am CASEpeer is personal injury practice management software starting at $79/user/month with an AI writing assistant.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2daef1f5-cac7-42ef-aa09-bc9e2945a78a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2daef1f5-cac7-42ef-aa09-bc9e2945a78a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Case & contact management$q$, $q$Centralizes case details, documents, deadlines, and liens.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Medical treatment tracking$q$, $q$Tracks treatment, medical records requests, and provider management.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Settlement negotiations$q$, $q$Tools to monitor and manage settlement progress.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$8am IQ writing assistant$q$, $q$AI tool for polishing case notes, correcting grammar, adjusting tone, and translating between English, Spanish, and Arabic (Pro tier and up).$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Client intake management$q$, $q$Manages incoming leads and intake investigator workflows (Pro and Advanced tiers).$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Reporting$q$, $q$50+ reports covering high-value cases, medical requests, and firm productivity.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$API access$q$, $q$Available on the Advanced plan for custom integrations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Purpose-built for personal injury law firms with pre-configured workflows$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$4.8/5 on Capterra and 4.7/5 on G2 across 400+ verified reviews$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$8am IQ AI writing assistant supports English, Spanish, and Arabic translation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$No long-term contract or setup fee; upgrade, downgrade, or cancel anytime$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$No free trial mentioned; only a free demo is offered$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Pricing is per active user and scales quickly for larger teams$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$API access and multi-office reporting are limited to the top Advanced tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$How much does CASEpeer cost?$q$, $q$CASEpeer starts at $79/user/month for the Basic plan, with Pro at $119/user/month and Advanced at $149/user/month, billed monthly.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Is there a free trial?$q$, $q$CASEpeer does not mention a free trial; a free demo is available instead.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$What is 8am IQ?$q$, $q$8am IQ is CASEpeer's AI writing assistant, available from the Pro plan up, that polishes case notes and can translate between English, Spanish, and Arabic.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$What practice areas does CASEpeer support?$q$, $q$CASEpeer is built specifically for personal injury law firms.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Intake-to-settlement case tracking$q$, $q$Personal injury firms use CASEpeer to manage cases from intake through settlement without custom configuration.$q$, $q$Personal injury law firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Multi-office reporting$q$, $q$Larger personal injury firms use the Advanced plan's multi-office reporting suite and API access for custom integrations.$q$, $q$Multi-office personal injury firms$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Basic$q$, $q$$79/user/month$q$, $q$monthly$q$, $q$["Case and contact management","Task management","Client portal","Automated statute alerts","Settlement negotiations","Medical treatment tracking","Unlimited document storage"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Pro$q$, $q$$119/user/month$q$, $q$monthly$q$, $q$["All Basic features","Client intake management","Unlimited 2-way texting with image support","Case stage management screens","50+ additional reports","20+ key integrations","8am IQ legal AI writing assistance"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$Advanced$q$, $q$$149/user/month$q$, $q$monthly$q$, $q$["All Pro features","Text scheduling capability","Multi-office reporting suite","Intake investigator portal","Case grades","API access"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$overview$q$, $q$What is CASEpeer?$q$, 2, ARRAY[$q$CASEpeer (8am CASEpeer) is a cloud-based practice management platform built specifically for personal injury law firms, covering case management from intake through settlement without requiring customization.$q$, $q$It offers three published pricing tiers, from $79 to $149 per user per month, and includes 8am IQ, an AI writing assistant that polishes case notes and supports English, Spanish, and Arabic translation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', $q$who-its-for$q$, $q$Who CASEpeer is for$q$, 2, ARRAY[$q$CASEpeer is aimed at personal injury law firms of various sizes, particularly those without dedicated IT resources who want pre-configured workflows and a fast rollout.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2daef1f5-cac7-42ef-aa09-bc9e2945a78a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;

-- ── CloudLex ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud case management platform built specifically for personal injury law firms, combining intake, matters, and built-in AI.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York City, NY, United States$q$,
  languages = '{}',
  seo_meta_description = $q$CloudLex is cloud case management software for personal injury firms, with intake, document, settlement tools and Lexee AI.$q$,
  og_description = $q$CloudLex is cloud case management software for personal injury firms, with intake, document, settlement tools and Lexee AI.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '963e1b92-071f-415e-9b5e-38f557ab5057';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '963e1b92-071f-415e-9b5e-38f557ab5057' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Intake management$q$, $q$Shareable intake forms and lead capture with one-click conversion of leads into matters.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Matter management$q$, $q$Centralizes case tasks, deadlines, documents, and contacts in a single record per case.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Document management$q$, $q$Organizes and shares case documents with AI-driven search across files.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Calendar and deadline tracking$q$, $q$Shared visibility into court dates and statute-of-limitations deadlines across the firm.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Medical records tracking$q$, $q$Requests and tracks medical records as part of the case file.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Settlement management$q$, $q$Tracks demands, offers, and fee calculations through case resolution.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Lexee AI$q$, $q$Built-in AI for demand drafting, medical record summaries, intake chatbots, and case Q&A.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Paralegal services$q$, $q$Add-on services including records retrieval, chronologies, document indexing, and a 24/7 bilingual call center.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Purpose-built for personal injury practice rather than general legal work$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Built-in Lexee AI handles demand drafting and medical summaries$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Optional paralegal services add records retrieval and a 24/7 bilingual call center$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Integrates with Microsoft 365, Gmail, Google Calendar, DocuSign, and Adobe Sign$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Hosted on Microsoft Azure with encryption and multi-factor authentication$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Focused on personal injury, so less suited to firms handling other practice areas$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$No free trial or free plan information available on the website$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$What is CloudLex used for?$q$, $q$CloudLex is case management software focused specifically on personal injury law firms, covering intake through settlement.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Does CloudLex include AI features?$q$, $q$Yes, its Lexee AI component handles demand drafting, medical record summaries, intake chatbots, and case Q&A.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$What does CloudLex integrate with?$q$, $q$It integrates with Microsoft Office 365, Gmail, Google Calendar, DocuSign, and Adobe Sign.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Is CloudLex pricing public?$q$, $q$No, pricing is not listed on the CloudLex website; firms need to contact the company directly.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Where is CloudLex based?$q$, $q$CloudLex's offices are located in New York City.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Solo personal injury attorney$q$, $q$Manage intake, deadlines, and settlements in one platform without separate case management tools.$q$, $q$Solo PI practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$Growing PI firm$q$, $q$Centralize case documents, medical records, and settlement tracking as caseload and staff grow.$q$, $q$Small to mid-size personal injury firms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$High-volume mass tort practice$q$, $q$Use Lexee AI and paralegal services to handle document-heavy caseloads such as mass tort and product liability.$q$, $q$Firms handling high case volumes$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$overview$q$, $q$What is CloudLex?$q$, 2, ARRAY[$q$CloudLex is case management software built specifically for personal injury law firms, unifying case operations from intake through settlement.$q$, $q$The platform combines case management tools, a built-in AI assistant called Lexee AI, and optional paralegal services within a single system, and supports practice areas such as motor vehicle accidents, slip-and-fall, product liability, mass tort, workers' compensation, and wrongful death.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', $q$who-its-for$q$, $q$Who CloudLex is for$q$, 2, ARRAY[$q$CloudLex is aimed at personal injury law firms of varying sizes, from solo practitioners to larger firms managing high case volumes, rather than general-purpose legal practices.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('963e1b92-071f-415e-9b5e-38f557ab5057', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Everlaw ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-native eDiscovery platform with AI-powered document review, priced by data volume with unlimited users.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Everlaw is an AI-powered eDiscovery platform for litigation and investigations, priced by data usage with unlimited users.$q$,
  og_description = $q$Everlaw is an AI-powered eDiscovery platform for litigation and investigations, priced by data usage with unlimited users.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '2ca87f00-e097-436b-b238-146a0f31af0e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '2ca87f00-e097-436b-b238-146a0f31af0e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Deep Dive$q$, $q$Analyzes large document sets to surface insights with direct citations, used on datasets of 10+ million documents.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Coding Suggestions$q$, $q$Automates first-pass document review with AI-driven categorization.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Writing Assistant$q$, $q$Helps synthesize evidence and brainstorm case strategy from reviewed material.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Predictive Coding and Clustering$q$, $q$AI tools that group and prioritize documents for review.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Storybuilder$q$, $q$Trial preparation tool for organizing evidence into a narrative.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Communication Visualizer$q$, $q$Provides analytics and visual insight into communication data during eDiscovery.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Usage-based pricing with no per-user fees or upload limits$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Single-document AI actions and the Writing Assistant included in subscriptions at no extra cost$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Used by law firms, corporate legal departments, and government agencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Deep Dive analysis has been used on datasets exceeding 10 million documents$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$No public pricing; quotes require scheduling a meeting or a phone call$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Batch AI actions require separately purchased credits, and unused committed credits can expire$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$No free trial or free plan mentioned on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$How is Everlaw priced?$q$, $q$Everlaw uses usage-based pricing tied to the amount of data managed, with no limits on users or uploads, offered as case-based or annual subscriptions.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Does Everlaw charge per user?$q$, $q$No, Everlaw states there are no per-user fees and unlimited user licenses are included.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Are AI features included in the subscription?$q$, $q$Single-document AI actions and the Writing Assistant are included at no extra cost; batch AI actions require separately purchased credits.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Who uses Everlaw?$q$, $q$Law firms, corporate legal departments, and government agencies use Everlaw for litigation, investigations, and FOIA requests.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Large-scale litigation discovery$q$, $q$Use Deep Dive and predictive coding to analyze millions of documents during litigation.$q$, $q$Law firms handling complex litigation$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Government investigations$q$, $q$Manage FOIA requests and internal investigations with unlimited users under one subscription.$q$, $q$Government agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$Corporate legal early case assessment$q$, $q$Reduce the volume of documents that reach active review before committing to full discovery.$q$, $q$Corporate legal departments$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$overview$q$, $q$What is Everlaw?$q$, 2, ARRAY[$q$Everlaw is a cloud-native eDiscovery platform used by legal professionals to manage litigation and investigations, with AI tools including Deep Dive document analysis, Coding Suggestions, and a Writing Assistant.$q$, $q$Pricing is usage-based, tied to the volume of data managed rather than the number of users, and is sold as case-based or annual subscriptions with quotes provided directly by Everlaw.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', $q$who-its-for$q$, $q$Who Everlaw is for$q$, 2, ARRAY[$q$Everlaw serves law firms, corporate legal departments, and state, local, and federal government agencies handling ediscovery, legal holds, trial preparation, and internal investigations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('2ca87f00-e097-436b-b238-146a0f31af0e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── RelativityOne ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered legal data platform used by law firms, enterprises, and government for eDiscovery and investigations.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Chicago, IL, United States$q$,
  languages = '{}',
  seo_meta_description = $q$RelativityOne is an AI-powered legal data platform for eDiscovery, investigations, and contract review at enterprise scale.$q$,
  og_description = $q$RelativityOne is an AI-powered legal data platform for eDiscovery, investigations, and contract review at enterprise scale.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6b59bfb3-5ea0-4d33-92fe-b141944faacf' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$aiR Assist$q$, $q$Conversational AI built into the platform for working with legal data.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$aiR for Review$q$, $q$Generative AI tool aimed at accelerating document review decisions.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$aiR for Privilege$q$, $q$AI-assisted workflow for identifying privileged documents.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$aiR for Case Strategy$q$, $q$AI tool aimed at supporting case strategy development.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$aiR for Data Breach Response$q$, $q$AI-assisted workflow for responding to data breach investigations.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Third-party AI integrations$q$, $q$Integrates with external AI tools including Claude, ChatGPT, and Gemini.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Security monitoring$q$, $q$Continuous monitoring and threat detection built into the platform.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Broad generative AI suite (Relativity aiR) covering review, privilege, strategy, and breach response$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Integrates with major third-party AI tools including Claude, ChatGPT, and Gemini$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Used by Fortune 500 companies, AmLaw 200 firms, and government agencies$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Company states it has been operating for 25 years$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$No public pricing; requires visiting a dedicated pricing page or contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Geared toward large-scale and enterprise use cases rather than solo practitioners$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Headquarters and company details beyond location are not detailed on the homepage$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$What is RelativityOne used for?$q$, $q$RelativityOne is a legal data platform used for eDiscovery, legal holds, investigations, contract review, and FOIA requests.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Does RelativityOne include AI tools?$q$, $q$Yes, its Relativity aiR suite includes aiR Assist, aiR for Review, aiR for Privilege, aiR for Case Strategy, and aiR for Data Breach Response.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Who uses RelativityOne?$q$, $q$Law firms, AmLaw 200 firms, Fortune 500 corporations, cyber insurers, academic institutions, and government agencies.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Where is RelativityOne headquartered?$q$, $q$The company's address listed is 231 South LaSalle Street, Chicago, Illinois.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Enterprise eDiscovery$q$, $q$Manage large-scale document review and productions using Relativity aiR tools.$q$, $q$AmLaw 200 firms and enterprise legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Data breach response$q$, $q$Use aiR for Data Breach Response to help manage investigation workflows after a breach.$q$, $q$Corporate legal and cyber insurance teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$Government FOIA processing$q$, $q$Handle FOIA and public records requests using the platform's review tools.$q$, $q$Federal, state, and local government agencies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$overview$q$, $q$What is RelativityOne?$q$, 2, ARRAY[$q$RelativityOne is an AI-powered legal data platform used for eDiscovery, investigations, and contract review, built around a generative AI suite called Relativity aiR.$q$, $q$The platform integrates with third-party AI tools including Claude, ChatGPT, and Gemini, and the company states it has been operating for 25 years.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', $q$who-its-for$q$, $q$Who RelativityOne is for$q$, 2, ARRAY[$q$RelativityOne serves law firms and litigators, AmLaw 200 firms, Fortune 500 corporations, government agencies, cyber insurers, and academic institutions handling complex legal data.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6b59bfb3-5ea0-4d33-92fe-b141944faacf', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Logikcull ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based eDiscovery platform for legal holds, FOIA requests, and document review with AI-powered search.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Logikcull is cloud eDiscovery software with automated processing, AI search, and per-GB or annual subscription pricing.$q$,
  og_description = $q$Logikcull is cloud eDiscovery software with automated processing, AI search, and per-GB or annual subscription pricing.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '440d249d-d889-40ff-bcf3-14b8168ba59e';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '440d249d-d889-40ff-bcf3-14b8168ba59e' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Rapid deployment$q$, $q$Start a new matter in under 30 seconds without IT support.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Automated processing$q$, $q$Runs 300+ processing steps including deduplication, OCR, email threading, and metadata extraction.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Logikcull ASK$q$, $q$Generative AI search feature that synthesizes facts and timelines from case data.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$PII detection$q$, $q$Automatically identifies SSNs, addresses, and phone numbers with claimed 99%+ accuracy.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Bulk redactions$q$, $q$Template-based redaction system for streamlined document production.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Direct integrations$q$, $q$Connects to Google Vault, Microsoft 365, Slack, Box, and Dropbox.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Legal hold management$q$, $q$Centralized tracking, reminders, and audit trails for legal holds.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Matters can be started in under 30 seconds without IT involvement$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Choice of pay-as-you-go per-GB pricing or annual subscription plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Direct integrations with Google Vault, Microsoft 365, Slack, Box, and Dropbox$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Recognized on G2, Capterra, Gartner Peer Insights, and TrustRadius$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Pay-as-you-go accounts include a sample matter for testing$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$No exact dollar pricing published; per-GB and annual rates require contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Pay-as-you-go plans have a 10 GB minimum$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Best suited to organizations with recurring eDiscovery needs rather than one-off use$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$How is Logikcull priced?$q$, $q$Logikcull offers pay-as-you-go monthly pricing based on GB of data stored (10 GB minimum) or annual subscription plans; exact dollar amounts require contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Is there a free trial?$q$, $q$Pay-as-you-go accounts include a sample matter that can be used to test the platform before committing to a paid matter.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$What does Logikcull ASK do?$q$, $q$It is a generative AI feature that synthesizes facts and timelines from uploaded case data.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$What does Logikcull integrate with?$q$, $q$It connects directly to Google Vault, Microsoft 365, Slack, Box, and Dropbox.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Who uses Logikcull?$q$, $q$Corporate legal departments, law firms, government agencies, educational institutions, and internal investigation teams.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Corporate legal cost reduction$q$, $q$Bring more eDiscovery work in-house instead of relying entirely on outside counsel.$q$, $q$Corporate legal departments$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Government FOIA and public records$q$, $q$Process public records and FOIA requests with automated redaction and search.$q$, $q$Government agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Internal HR investigations$q$, $q$Collect and review internal communications for HR or compliance investigations.$q$, $q$Internal investigation and compliance teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Pay As You Go$q$, $q$Priced per GB stored, 10 GB minimum$q$, $q$monthly$q$, $q$["Unlimited users, projects, and downloads","24/5 in-app support","Sample matter included for testing","No long-term commitment"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$Subscription (Annual)$q$, $q$Custom quote$q$, $q$annual$q$, $q$["ASK GenAI fact-finding","PII detection and global redactions","Premium support and training","Unlimited users, projects, and downloads"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$overview$q$, $q$What is Logikcull?$q$, 2, ARRAY[$q$Logikcull is a cloud-based discovery automation platform for eDiscovery, legal holds, FOIA requests, and public records management, with automated processing and an AI search feature called Logikcull ASK.$q$, $q$It offers either pay-as-you-go pricing based on data stored per month or an annual subscription plan, with both including unlimited users, projects, and downloads.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', $q$who-its-for$q$, $q$Who Logikcull is for$q$, 2, ARRAY[$q$Logikcull is used by corporate legal departments, law firms, government agencies, educational institutions, and internal investigation teams handling document collection and review.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('440d249d-d889-40ff-bcf3-14b8168ba59e', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── DISCO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-driven eDiscovery software and services platform for complex litigation, document review, and legal holds.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Austin, TX, United States$q$,
  languages = '{}',
  seo_meta_description = $q$DISCO is an AI-driven eDiscovery platform with Cecilia AI, Auto Review, and legal hold tools for complex litigation.$q$,
  og_description = $q$DISCO is an AI-driven eDiscovery platform with Cecilia AI, Auto Review, and legal hold tools for complex litigation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '046d5368-1873-461f-9ac4-29a6afeb6d0a';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '046d5368-1873-461f-9ac4-29a6afeb6d0a' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Cecilia AI$q$, $q$Generative AI legal intelligence tool built into the platform.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Auto Review$q$, $q$AI-powered document review claimed to process 32,000 documents per hour.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Legal hold management$q$, $q$Tools for issuing and tracking legal holds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Case Builder$q$, $q$Deposition management functionality.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Timelines$q$, $q$Tool for creating case timelines from reviewed evidence.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Data request management$q$, $q$Tools for managing incoming data and discovery requests.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Professional services$q$, $q$Includes forensic collections, managed review, and enterprise solutions.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Recognized by G2 as an eDiscovery Leader$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Combines software with professional services such as forensic collections and managed review$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Cecilia AI and Auto Review aim to speed up document review$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Received awards for fastest implementation and estimated ROI$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Used by Am Law 200 firms and corporate legal teams on complex matters$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$No public pricing; requires requesting a quote or demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Positioned for complex, high-volume litigation rather than small matters$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Company size and founding year are not stated on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$What is DISCO used for?$q$, $q$DISCO is an AI-driven eDiscovery platform used for document review, legal holds, deposition management, and data request handling in litigation.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$What is Cecilia AI?$q$, $q$Cecilia AI is DISCO's built-in generative AI tool for legal intelligence tasks.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Who uses DISCO?$q$, $q$Law firms including Am Law 200 firms, corporate legal teams, IP litigation practitioners, and plaintiffs in mass tort and class action litigation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Where is DISCO headquartered?$q$, $q$DISCO is headquartered in Austin, Texas.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Complex litigation document review$q$, $q$Use Auto Review and Cecilia AI to review large document sets faster.$q$, $q$Am Law 200 firms and corporate legal teams$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Mass tort and class action support$q$, $q$Manage discovery and deposition materials across large plaintiff litigation.$q$, $q$Plaintiff's firms in mass tort or class actions$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$Legal hold and data request management$q$, $q$Issue and track legal holds and manage incoming data requests.$q$, $q$Corporate legal departments$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$overview$q$, $q$What is DISCO?$q$, 2, ARRAY[$q$DISCO is an AI-driven eDiscovery software and services platform for litigation support, built around its Cecilia AI generative AI tool and Auto Review document review feature.$q$, $q$The company, headquartered in Austin, Texas, pairs its software with professional services including forensic collections and managed review, and has received G2 recognition as an eDiscovery Leader.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', $q$who-its-for$q$, $q$Who DISCO is for$q$, 2, ARRAY[$q$DISCO serves law firms including Am Law 200 firms, corporate legal teams, IP litigation practitioners, and plaintiffs in mass tort and class action litigation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('046d5368-1873-461f-9ac4-29a6afeb6d0a', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Reveal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-driven eDiscovery platform, founded in 2008, spanning document review, analytics, and legal hold tools.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2008,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Reveal is an AI-driven eDiscovery platform, founded in 2008, offering document review, analytics, and legal hold tools.$q$,
  og_description = $q$Reveal is an AI-driven eDiscovery platform, founded in 2008, offering document review, analytics, and legal hold tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '9f433b75-2930-48b2-9563-119f142dab72';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '9f433b75-2930-48b2-9563-119f142dab72' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$AI-powered document review$q$, $q$Uses AI to assist with document review and analysis during discovery.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Advanced analytics$q$, $q$Data visualization tools for analyzing large discovery datasets.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Legal hold automation$q$, $q$Tools for managing and automating legal holds.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Generative AI models$q$, $q$Includes reusable generative AI models for discovery workflows.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Multi-product suite$q$, $q$Includes Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold alongside the core Reveal platform.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Founded in 2008 with an established multi-product suite$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Covers the full discovery lifecycle from collection through trial presentation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Company states $300M in customer cost savings using the platform$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Serves corporate legal departments, law firms, ALSPs, government, and education$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Multiple industry awards and recognitions cited on the site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$No public pricing; requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Headquarters location is not stated on the homepage$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$The broad multi-product suite may require evaluation to identify the right components$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$When was Reveal founded?$q$, $q$Reveal was founded in 2008.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$What products does Reveal include?$q$, $q$The Reveal suite includes the core Reveal platform, Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Who uses Reveal?$q$, $q$Corporate legal departments, law firms, legal service providers (ALSPs), government agencies, and educational institutions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Does Reveal include AI features?$q$, $q$Yes, the platform includes AI-powered document review, analytics, and reusable generative AI models.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Multi-matter ALSP operations$q$, $q$Manage multiple client matters using the combined Reveal product suite.$q$, $q$Alternative legal service providers (ALSPs)$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Corporate ediscovery consolidation$q$, $q$Consolidate document review, analytics, and legal hold tools into one suite.$q$, $q$Corporate legal departments$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$Government investigations$q$, $q$Use AI-powered review and analytics for investigative discovery work.$q$, $q$Government agencies$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$overview$q$, $q$What is Reveal?$q$, 2, ARRAY[$q$Reveal is an AI-driven eDiscovery platform founded in 2008, offering document review, analytics, and legal hold tools through a multi-product suite that includes Logikcull, Trial Director, Brainspace, Onna, and Reveal Hold.$q$, $q$The company states its platform has contributed to $300M in customer cost savings and has received multiple industry awards.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', $q$who-its-for$q$, $q$Who Reveal is for$q$, 2, ARRAY[$q$Reveal serves corporate legal departments, law firms, legal service providers, government agencies, and educational institutions handling document review and legal investigations.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('9f433b75-2930-48b2-9563-119f142dab72', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Nextpoint ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based eDiscovery platform with per-user pricing, unlimited data hosting, and deposition management tools.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nextpoint is cloud eDiscovery software with per-user pricing, unlimited data hosting, and document review tools.$q$,
  og_description = $q$Nextpoint is cloud eDiscovery software with per-user pricing, unlimited data hosting, and document review tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b84747d-9c0b-41c9-af25-ea0cdbd81392' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Unlimited data upload$q$, $q$No per-document or per-GB processing and hosting fees across plans.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Document review$q$, $q$Fast search and bulk actions for reviewing case documents.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Electronic production$q$, $q$Secure file sharing for producing documents to opposing counsel or courts.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Deposition management$q$, $q$Transcript synchronization with video and exhibits.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Expert witness discovery$q$, $q$Tools for organizing expert witness materials.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Custom data analytics$q$, $q$Filtering tools for working with large datasets.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Presentation tools$q$, $q$Features for preparing materials for trial or hearings.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$No case fees, upload fees, or data hosting fees on any plan$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Simple per-user pricing model rather than per-document or per-GB charges$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Experts and co-counsel can be added to a matter at no extra cost$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Clients cited include Morgan & Morgan and McDermott Will & Emery$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Praised by Law.com for value relative to cost$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$No dollar pricing published for any of the three tiers$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Advanced analytics and auto-redaction features are limited to higher-tier plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Requires contacting sales for a quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$How is Nextpoint priced?$q$, $q$Nextpoint uses simple per-user pricing with no case fees, upload fees, or hosting fees; specific dollar amounts require contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$What plans does Nextpoint offer?$q$, $q$Nextpoint offers three tiers: Essential, Advanced, and Apex, each adding more analytics and review features.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Does Nextpoint charge for data storage?$q$, $q$No, all plans include zero data hosting charges regardless of case size.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Who uses Nextpoint?$q$, $q$Law firms and legal departments of varying sizes, including firms such as Morgan & Morgan and McDermott Will & Emery.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Small case management$q$, $q$Handle smaller matters on the Essential plan without data hosting fees.$q$, $q$Solo practitioners and small firms$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Advanced document review$q$, $q$Use advanced analytics and review templates on the Advanced plan for larger caseloads.$q$, $q$Mid-size law firms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Enterprise litigation support$q$, $q$Use the Apex plan's auto-redaction and dedicated customer success team for high-volume litigation.$q$, $q$Large firms and enterprise legal teams$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Essential$q$, $q$Custom quote$q$, NULL, $q$["Native & produced data import","Advanced search & filter","Electronic stamping & export","Chronology & timelines","Deposition transcript features","Zero data hosting charges"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Advanced$q$, $q$Custom quote$q$, NULL, $q$["All Essential features","Advanced data analytics","Advanced document review features","Advanced user permissions","Custom review and production templates"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$Apex$q$, $q$Custom quote$q$, NULL, $q$["All Advanced features","Near-duplicate scoring","Auto-redactions","Global account search","Offline presentation tool","Dedicated customer success team"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$overview$q$, $q$What is Nextpoint?$q$, 2, ARRAY[$q$Nextpoint is a cloud-based eDiscovery platform that charges per user rather than per document or by data volume, with unlimited data upload included on every plan.$q$, $q$It offers three tiers — Essential, Advanced, and Apex — that add advanced analytics, auto-redaction, and dedicated support as firms move up in plan level.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', $q$who-its-for$q$, $q$Who Nextpoint is for$q$, 2, ARRAY[$q$Nextpoint is used by law firms and legal departments of varying sizes, from solo practitioners to larger firms such as Morgan & Morgan and McDermott Will & Emery.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b84747d-9c0b-41c9-af25-ea0cdbd81392', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── TheraNest ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Mental health EHR and practice management platform for therapists, with AI-assisted notes and a 21-day free trial.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$]::text[],
  seo_meta_description = $q$TheraNest is mental health EHR software with AI progress notes, billing, and scheduling, offering a 21-day free trial.$q$,
  og_description = $q$TheraNest is mental health EHR software with AI progress notes, billing, and scheduling, offering a 21-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5fbb1de8-79fd-408f-ab12-959b5b74f712';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5fbb1de8-79fd-408f-ab12-959b5b74f712' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$AI Session Assistant$q$, $q$Generates automated progress notes from sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Automated insurance billing$q$, $q$Handles insurance claims processing automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Client portal$q$, $q$Lets clients complete intake forms and request appointments online.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Reporting and analytics$q$, $q$Built-in reports for tracking practice performance.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Intelligent scheduling$q$, $q$Scheduling with automated reminders to reduce no-shows.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Secure messaging$q$, $q$HIPAA-compliant messaging between practitioners and clients.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Multi-location management$q$, $q$Supports organizations operating across multiple practice locations.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Offers a 21-day free trial$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$AI Session Assistant automates progress note writing$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$HITRUST certified and HIPAA compliant$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Supports multi-location group practices, not just solo clinicians$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Backed by parent company Ensora Health$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Specific subscription pricing is not published on the product page$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Now operates under the Ensora Health umbrella, with its original theranest.com domain redirecting to ensorahealth.com$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$No stated headquarters or founding year on the current product page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Does TheraNest offer a free trial?$q$, $q$Yes, TheraNest offers a 21-day free trial.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Is TheraNest HIPAA compliant?$q$, $q$Yes, TheraNest is HITRUST certified and HIPAA compliant.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Does TheraNest use AI?$q$, $q$Yes, its AI Session Assistant automatically generates progress notes from sessions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Is TheraNest still an independent company?$q$, $q$TheraNest now operates as a product under parent company Ensora Health; its website redirects to the Ensora Health domain.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Who is TheraNest for?$q$, $q$Solo mental health practitioners and group practices, including therapists, counselors, psychiatrists, and marriage/family therapists.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Solo therapist documentation$q$, $q$Use the AI Session Assistant to speed up progress note writing after each session.$q$, $q$Solo mental health practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Group practice billing$q$, $q$Automate insurance claims processing across multiple clinicians.$q$, $q$Group therapy practices$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$Multi-location clinics$q$, $q$Manage scheduling and records across several practice locations.$q$, $q$Multi-location mental health organizations$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$overview$q$, $q$What is TheraNest?$q$, 2, ARRAY[$q$TheraNest is a mental health EHR and practice management platform covering documentation, scheduling, billing, and client management, including an AI Session Assistant that automates progress notes.$q$, $q$The product now operates under parent company Ensora Health, with its original theranest.com domain redirecting to the Ensora Health website, though the TheraNest brand name is retained on the product page.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', $q$who-its-for$q$, $q$Who TheraNest is for$q$, 2, ARRAY[$q$TheraNest is built for solo mental health practitioners and group practices, including therapists, counselors, psychiatrists, and marriage and family therapists.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5fbb1de8-79fd-408f-ab12-959b5b74f712', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Jane App ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cloud-based clinic management platform for health and wellness practitioners, priced per practitioner from CAD $54/month.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$CAD $54/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$North Vancouver, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Jane App is clinic management software for health and wellness practitioners, priced per practitioner from CAD $54/month.$q$,
  og_description = $q$Jane App is clinic management software for health and wellness practitioners, priced per practitioner from CAD $54/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e495d174-9d89-4a75-aaca-d48d89a2581f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e495d174-9d89-4a75-aaca-d48d89a2581f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Online booking and scheduling$q$, $q$Lets clients book appointments online directly into the practice calendar.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Telehealth$q$, $q$Secure video consultations built into the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$AI-assisted clinical documentation$q$, $q$AI Scribe add-on assists with generating clinical notes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Intake forms$q$, $q$Digital intake forms collected before or at the first appointment.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Billing and insurance processing$q$, $q$Handles invoicing and insurance billing, available as an add-on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Jane Payments$q$, $q$Built-in payment processing for the clinic.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Patient mobile app$q$, $q$Secure messaging and appointment access for patients.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Automated reminders$q$, $q$Email and SMS appointment reminders to reduce no-shows.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Transparent, published per-practitioner pricing starting at CAD $54/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Core practice management features included in every plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$AI Scribe available as an add-on for clinical documentation$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Serves multiple disciplines including physiotherapy, massage therapy, counselling, and midwifery$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Demo account available through support for exploring the platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$No free trial; only a demo account is offered instead$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$AI Scribe, group telehealth, insurance billing, and Jane Websites are paid add-ons on top of the base plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Pricing increases with additional practitioners beyond the plan's included seat$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Does Jane App offer a free trial?$q$, $q$No, Jane App does not offer a free trial; instead it provides access to a demo account through its community and support team.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$How much does Jane App cost?$q$, $q$Plans start at CAD $54/month for the Balance plan, with Practice at CAD $79/month and Thrive at CAD $99/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Is AI Scribe included in the base price?$q$, $q$No, AI Scribe is a paid add-on at $15/month per opted-in practitioner.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Where is Jane App based?$q$, $q$Jane App's home base is North Vancouver, Canada, with a remote-first team.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Who is Jane App for?$q$, $q$Health and wellness practitioners such as physiotherapists, massage therapists, counsellors, and midwives running interdisciplinary clinics.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Solo practitioner clinic$q$, $q$Manage bookings, notes, and payments on the entry-level Balance plan.$q$, $q$Solo physiotherapists or massage therapists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Interdisciplinary wellness clinic$q$, $q$Coordinate scheduling and billing across multiple practitioner types in one clinic.$q$, $q$Multi-practitioner wellness clinics$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Insurance-billing practices$q$, $q$Add the insurance billing add-on to handle claims alongside client payments.$q$, $q$Practices that bill insurance directly$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Balance$q$, $q$CAD $54/month$q$, $q$monthly$q$, $q$["Single practitioner profile","Up to 20 appointments/month","Core practice management features"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Practice$q$, $q$CAD $79/month$q$, $q$monthly$q$, $q$["1 full-time practitioner included","Unlimited appointments","Unlimited staff profiles","Additional practitioners at variable cost"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$Thrive$q$, $q$CAD $99/month$q$, $q$monthly$q$, $q$["Everything in Practice plan","Advanced scheduling tools","Advanced patient engagement tools"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$overview$q$, $q$What is Jane App?$q$, 2, ARRAY[$q$Jane App is cloud-based practice management software for health and wellness clinics, covering online booking, telehealth, clinical documentation, billing, and payments in one platform.$q$, $q$Pricing is based on the number of practitioners in a clinic, starting at CAD $54/month, with add-ons available for AI-assisted documentation, group telehealth, insurance billing, and clinic websites.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', $q$who-its-for$q$, $q$Who Jane App is for$q$, 2, ARRAY[$q$Jane App is built for health and wellness practitioners running interdisciplinary clinics, including physiotherapists, massage therapists, counsellors, and midwives.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e495d174-9d89-4a75-aaca-d48d89a2581f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Doctolib ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Doctolib is an online platform for booking appointments with doctors and healthcare providers and offers video consultations.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Levallois-Perret, France$q$,
  languages = '{}',
  seo_meta_description = $q$Book doctor and healthcare appointments online with Doctolib, including video consultations, across France, Germany, and Italy.$q$,
  og_description = $q$Book doctor and healthcare appointments online with Doctolib, including video consultations, across France, Germany, and Italy.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd3824531-7fee-4eb7-9d43-f3de065cb703';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd3824531-7fee-4eb7-9d43-f3de065cb703' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Online appointment booking$q$, $q$Patients can search for healthcare providers and book available appointment slots directly online.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Video consultations$q$, $q$Telemedicine video consultations are available directly through the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Specialist directory$q$, $q$Listings cover 30+ medical specialties, including general practitioners, dentists, pediatricians, gynecologists, dermatologists, and cardiologists.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Mobile apps$q$, $q$Dedicated iOS and Android apps let patients book and manage appointments on the go.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Health content and help center$q$, $q$The site provides help center resources and articles on health topics for patients.$q$, 4);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Covers 30+ medical specialties in a single directory$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Available as a website plus dedicated iOS and Android apps$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Offers video consultations alongside in-person appointment booking$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$B Corp certified$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Operates across multiple European countries (France, Germany, Italy)$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Primarily serves French, German, and Italian markets, with limited availability elsewhere$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Pricing for healthcare practitioners is not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$No integrations were disclosed in the publicly available content$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$What is Doctolib used for?$q$, $q$Doctolib lets patients search for and book appointments online with doctors and other healthcare providers, and it also offers video consultations.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Is Doctolib available outside of France?$q$, $q$Yes. In addition to France, Doctolib operates in Germany and Italy.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Does Doctolib have a mobile app?$q$, $q$Yes, Doctolib offers apps for both iOS and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Is Doctolib a certified company?$q$, $q$Doctolib is B Corp certified.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Booking a doctor's appointment$q$, $q$Patients search by specialty and location, then book an available appointment slot online.$q$, $q$Patients$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Telemedicine consultations$q$, $q$Patients and providers connect over video for remote visits booked through the platform.$q$, $q$Patients and healthcare providers$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$Finding specialists across multiple countries$q$, $q$Providers list their availability so patients in France, Germany, and Italy can find and book care.$q$, $q$Healthcare practitioners$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$overview$q$, $q$What is Doctolib?$q$, 2, ARRAY[$q$Doctolib is an online platform that lets patients search for doctors and other healthcare providers and book appointments directly, with support for video consultations for telemedicine visits.$q$, $q$The directory spans 30+ medical specialties, including general practitioners, dentists, pediatricians, gynecologists, dermatologists, and cardiologists, and the company is B Corp certified.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', $q$who-its-for$q$, $q$Who Doctolib is for$q$, 2, ARRAY[$q$Doctolib is built for patients in France, Germany, and Italy who want to find and book healthcare appointments online, as well as the healthcare practitioners who list their availability on the platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d3824531-7fee-4eb7-9d43-f3de065cb703', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Cliniko ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Cliniko is practice management software for clinics and allied health practitioners covering scheduling, records, invoicing, and payments.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$45/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Cliniko practice management software: scheduling, treatment records, invoicing, and payments for clinics, priced from $45/month with a free trial.$q$,
  og_description = $q$Cliniko practice management software: scheduling, treatment records, invoicing, and payments for clinics, priced from $45/month with a free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd221b5a0-51a9-4fa0-9bbd-a8dd91499f83' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Schedule management$q$, $q$Manage practitioner calendars and appointment scheduling for the clinic.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Treatment records$q$, $q$Document client treatment records within the platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Invoicing and payments$q$, $q$Create invoices and process payments directly in Cliniko.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Connected apps$q$, $q$Connects with third-party apps including MailChimp and Xero.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$SMS reminders$q$, $q$Send SMS messages to clients at a cost of 10 cents per message.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$24/7 support$q$, $q$Includes unlimited free support via chat and email.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Transparent, publicly listed pricing tiers based on practitioner count$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$30-day free trial available before committing to a paid plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Unlimited support included via 24/7 chat and email$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Donates 2% of subscription revenue to charity$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Integrates with tools such as MailChimp and Xero$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$SMS reminders are billed separately at 10 cents per message$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Pricing scales by number of practitioners, which can add up for larger clinics$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Specific mobile app and deeper integration details were not disclosed on the fetched pages$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$How much does Cliniko cost?$q$, $q$Cliniko is priced by practitioner count, starting at $45/month for 1 practitioner and scaling up to $395/month for 26-200 practitioners.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Does Cliniko offer a free trial?$q$, $q$Yes, Cliniko offers a 30-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Does Cliniko charge for SMS reminders?$q$, $q$Yes, SMS messages are billed at 10 cents per message.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$What integrations does Cliniko support?$q$, $q$Cliniko offers connected apps including MailChimp and Xero.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Running a single-practitioner clinic$q$, $q$A solo allied health practitioner manages scheduling, treatment records, and invoicing on the $45/month plan.$q$, $q$Solo practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Managing a multi-practitioner clinic$q$, $q$Clinics with several practitioners use tiered plans to manage shared scheduling, billing, and client records.$q$, $q$Clinic owners and administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$Sending appointment reminders$q$, $q$Clinics use paid SMS messaging to remind clients of upcoming appointments.$q$, $q$Front-desk and admin staff$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$1 Practitioner$q$, $q$$45/month$q$, $q$monthly$q$, $q$["Scheduling","Treatment records","Invoicing and payments","24/7 support"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$2-5 Practitioners$q$, $q$$95/month$q$, $q$monthly$q$, $q$["Scheduling","Treatment records","Invoicing and payments","24/7 support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$6-8 Practitioners$q$, $q$$145/month$q$, $q$monthly$q$, $q$["Scheduling","Treatment records","Invoicing and payments","24/7 support"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$9-12 Practitioners$q$, $q$$195/month$q$, $q$monthly$q$, $q$["Scheduling","Treatment records","Invoicing and payments","24/7 support"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$13-25 Practitioners$q$, $q$$295/month$q$, $q$monthly$q$, $q$["Scheduling","Treatment records","Invoicing and payments","24/7 support"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$26-200 Practitioners$q$, $q$$395/month$q$, $q$monthly$q$, $q$["Scheduling","Treatment records","Invoicing and payments","24/7 support"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$overview$q$, $q$What is Cliniko?$q$, 2, ARRAY[$q$Cliniko is practice management software built for clinics and allied health practitioners, covering scheduling, treatment record documentation, invoicing, and payments.$q$, $q$Pricing is tiered by the number of practitioners, ranging from $45/month for a single practitioner up to $395/month for 26-200 practitioners, with a 30-day free trial available.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', $q$who-its-for$q$, $q$Who Cliniko is for$q$, 2, ARRAY[$q$Cliniko is for allied health practitioners and clinic operators who need an integrated system for scheduling, client records, and billing, from solo practitioners to larger multi-practitioner clinics.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d221b5a0-51a9-4fa0-9bbd-a8dd91499f83', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Pabau ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Pabau is all-in-one practice management software for medical, aesthetic, and wellness clinics, covering scheduling, clinical, payments, and marketing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$£50/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Pabau practice management software for clinics: scheduling, clinical charting, payments, and marketing, with plans starting at £50/month.$q$,
  og_description = $q$Pabau practice management software for clinics: scheduling, clinical charting, payments, and marketing, with plans starting at £50/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fcc0d22f-68b0-41c4-80f4-5ebf02a902a9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Scheduling$q$, $q$Calendar, online booking, class booking, and waitlist management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Clinical tools$q$, $q$Digital forms, charting, labs, prescriptions, telehealth, and before/after photos.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Payments and billing$q$, $q$Point-of-sale via Pabau Pay, invoicing, insurance billing, and quotes.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Operations management$q$, $q$Team management, commissions, timesheets, and inventory tracking.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Marketing tools$q$, $q$Email and SMS campaigns, lead management, loyalty programs, and referrals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$AI agents$q$, $q$Includes a scribe agent for clinical notes, a prescribing agent with safety checks, and a letters agent.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Pabau GO mobile app$q$, $q$A dedicated iPhone and iPad app for managing the practice on the go.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Reports being used by 3,500+ practices worldwide$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Full feature access on every plan, including scheduling, payments, and marketing automation$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$No per-patient fees on any pricing tier$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Native integrations with tools such as HubSpot, Google Calendar, Xero, Stripe, Klarna, and Zapier$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Dedicated iOS app (Pabau GO) in addition to the web platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Only the entry-level Starter plan has published pricing; other tiers require a custom quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Founded year, headquarters, and company size are not disclosed on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$No Android app was mentioned in the fetched content$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$How much does Pabau cost?$q$, $q$The published Starter plan (1 user, up to 100 patients) is £50/month. Larger Solo, Team, Medium, Group, and Enterprise plans use custom pricing based on team size.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Does Pabau charge per patient?$q$, $q$No, Pabau states there are no per-patient fees on any tier; pricing is based on the number of logged-in users.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$What integrations does Pabau support?$q$, $q$Pabau natively integrates with Healthcode, HubSpot, Google Calendar, Xero, Stripe, Klarna, WhatsApp, and Zapier, and supports open APIs and webhooks.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Does Pabau include AI tools?$q$, $q$Yes, Pabau offers AI agents for clinical scribing, prescribing safety checks, and letter generation.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Is there a Pabau mobile app?$q$, $q$Yes, Pabau GO is available for iPhone and iPad.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Running a medical spa or aesthetic clinic$q$, $q$Practices use scheduling, before/after photos, and Pabau Pay for point-of-sale transactions.$q$, $q$Medical spas and aesthetic clinics$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Managing a multi-practitioner clinic$q$, $q$Team management, commissions, and timesheets support clinics with several staff members.$q$, $q$Practice managers and clinic owners$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Automating patient marketing$q$, $q$Clinics run email and SMS campaigns and manage loyalty and referral programs.$q$, $q$Marketing and front-desk staff$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$AI-assisted clinical documentation$q$, $q$Practitioners use the scribe and letters agents to speed up notes and correspondence.$q$, $q$Clinicians$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Starter$q$, $q$£50/month$q$, $q$monthly$q$, $q$["1 user","Up to 100 patients","10% discount on annual billing","Full platform access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Solo$q$, $q$Custom$q$, NULL, $q$["1 user","Unlimited patients","Full-time single clinician focus"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Team$q$, $q$Custom$q$, NULL, $q$["2-3 users","Unlimited patients","Calendar sharing","Coordinated staff scheduling"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Medium$q$, $q$Custom$q$, NULL, $q$["4-5 users","Unlimited patients","Automation features"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Group$q$, $q$Custom$q$, NULL, $q$["6-15 users","Unlimited patients","Inventory tracking"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["16+ users","Unlimited patients","Multi-location support and governance"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$overview$q$, $q$What is Pabau?$q$, 2, ARRAY[$q$Pabau is all-in-one practice management software that combines clinical care, business operations, and patient engagement tools for medical, aesthetic, and wellness practices.$q$, $q$It reports being trusted by 3,500+ practices worldwide, with pricing starting at £50/month for a single-user Starter plan and custom pricing for larger teams.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', $q$who-its-for$q$, $q$Who Pabau is for$q$, 2, ARRAY[$q$Pabau serves medical spas, aesthetic clinics, dermatology, cosmetic surgery, physiotherapy, mental health, wellness clinics, GP practices, and fertility clinics, from solo practitioners to enterprises.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fcc0d22f-68b0-41c4-80f4-5ebf02a902a9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Carepatron ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Carepatron is practice management and EHR software with a free plan, AI scribe, telehealth, scheduling, and billing for health practitioners.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free (paid plans from $31/month)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Carepatron practice management software: scheduling, telehealth, AI scribe, and billing for clinicians, with a free plan and paid plans from $31/month.$q$,
  og_description = $q$Carepatron practice management software: scheduling, telehealth, AI scribe, and billing for clinicians, with a free plan and paid plans from $31/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ff4be8dd-9512-4070-826b-f8b412c8fa01' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Online booking$q$, $q$Client booking with automatic appointment reminders.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Secure client messaging$q$, $q$SMS and email messaging with clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Telehealth video$q$, $q$Video sessions with in-session note-taking.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$AI Scribe$q$, $q$Automated clinical documentation generated during sessions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Treatment plan management$q$, $q$Tools for building and tracking client treatment plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$ePrescribe$q$, $q$Electronic prescribing available as an add-on.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Billing and claims$q$, $q$Invoicing, payment processing, and insurance claim management.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Free plan available with unlimited clients, telehealth, and AI scribe & note taker$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Reports serving 100,000+ clinicians in 120+ countries across 24 languages$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$4.8 rating on both G2 and Capterra$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$HIPAA, SOC 2, PIPEDA, and GDPR compliant$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$No credit card required to start, and no cancellation term or minimum contract$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Paid plan pricing shown includes limited-time promotional discounts (50% off for 6 months) alongside regular pricing$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Add-ons such as e-prescribe ($39/month per user) and SMS are billed separately$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Founded year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Does Carepatron have a free plan?$q$, $q$Yes, Carepatron offers a free plan with unlimited clients, telehealth, 1GB storage, a client portal, automated payments, and AI scribe & note taker.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$How much do paid Carepatron plans cost?$q$, $q$The Plus plan is $31/month and the Advanced plan is $39/month at regular pricing, both billed monthly or annually with a 20% annual discount; promotional pricing may reduce these further.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Does Carepatron include AI features?$q$, $q$Yes, Carepatron includes an AI scribe and note taker on every plan, including the free plan.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Who is Carepatron built for?$q$, $q$Carepatron serves behavioral health, medical, allied health, and wellness professionals.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Is Carepatron compliant with healthcare regulations?$q$, $q$Yes, Carepatron states it is HIPAA, SOC 2, PIPEDA, and GDPR compliant.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Running clinical documentation with AI$q$, $q$Clinicians use the AI scribe to auto-generate session notes during telehealth or in-person visits.$q$, $q$Clinicians and therapists$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Managing client billing$q$, $q$Practices handle invoicing, payments, and insurance claims within the platform.$q$, $q$Practice administrators$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Multilingual, multi-country practices$q$, $q$Practitioners across 120+ countries use the platform in one of 24 supported languages.$q$, $q$Global healthcare practitioners$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Free$q$, $q$$0/month$q$, $q$monthly$q$, $q$["Unlimited clients","Telehealth","1GB storage","Client portal","Automated online payments","AI scribe & note taker"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Plus$q$, $q$$31/month (regular price)$q$, $q$monthly$q$, $q$["Everything in Free","Unlimited storage","Advanced workflows","Group telehealth","Group scheduling & notes","Shared inbox","Custom branding"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$Advanced$q$, $q$$39/month (regular price)$q$, $q$monthly$q$, $q$["Everything in Plus","Roles & permissions","White labeling","Google Analytics integration","90-day deleted data retention","1:1 onboarding manager","Premium support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$overview$q$, $q$What is Carepatron?$q$, 2, ARRAY[$q$Carepatron is practice management and EHR software that handles scheduling, client messaging, telehealth, clinical documentation, treatment planning, prescribing, and billing.$q$, $q$It offers a free plan with an AI scribe and note taker, and reports serving over 100,000 clinicians across 120+ countries.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', $q$who-its-for$q$, $q$Who Carepatron is for$q$, 2, ARRAY[$q$Carepatron is built for behavioral health, medical, allied health, and wellness practitioners who need scheduling, documentation, and billing in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ff4be8dd-9512-4070-826b-f8b412c8fa01', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Healthie ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Healthie is a cloud-based EHR and practice management platform with AI scribe, telehealth, billing, and plans starting at $19/month.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$19/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Healthie EHR and practice management platform: scheduling, telehealth, billing, and AI scribe, with plans from $19/month and a 14-day free trial.$q$,
  og_description = $q$Healthie EHR and practice management platform: scheduling, telehealth, billing, and AI scribe, with plans from $19/month and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '8ca5d5be-9880-4ce7-94dd-56ab90d70f72' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Intake and onboarding$q$, $q$Digital intake and onboarding workflows for new clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Charting and documentation$q$, $q$Clinical charting tools for provider documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Scheduling$q$, $q$Appointment scheduling with support for multiple providers.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Telehealth and webinars$q$, $q$Video telehealth sessions and group webinars.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Patient messaging and portal$q$, $q$Secure messaging and a client-facing portal.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$AI Scribe$q$, $q$AI-assisted clinical documentation capability.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Billing and insurance$q$, $q$Billing tools and insurance management, including CMS 1500 forms on higher tiers.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Reports being trusted by 35,000 providers and high-growth businesses$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$14-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Integrates with Google Fit, Apple Health, and Fitbit through the Healthie Harbor marketplace$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$HIPAA and SOC 2 compliant on all plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Tiered pricing scales from solo practitioners up to team plans$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Entry-level Core plan is limited to 10 active clients$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Group messaging, custom forms, and CMS 1500s are only available from the Essentials tier and up$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Founded year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$How much does Healthie cost?$q$, $q$Plans start at $19/month (Core, 10 active clients) and scale to Essentials ($49/month), Plus ($129/month), and Group ($149+/month), with lower rates for annual billing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Does Healthie offer a free trial?$q$, $q$Yes, Healthie offers a 14-day free trial with no credit card required.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Does Healthie include AI features?$q$, $q$Yes, Healthie includes an AI Scribe capability for clinical documentation.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$What wearables does Healthie integrate with?$q$, $q$Healthie connects with Google Fit, Apple Health, and Fitbit through its Healthie Harbor marketplace.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Solo practice management$q$, $q$Individual practitioners use the Core plan for scheduling, charting, and billing with up to 10 active clients.$q$, $q$Solo practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Group practice collaboration$q$, $q$Teams use the Group plan for shared calendars, internal chat, and per-clinician add-on seats.$q$, $q$Group practices and clinics$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Digital health program delivery$q$, $q$Organizations run online programs and group telehealth sessions on the Plus plan.$q$, $q$Digital health startups and enterprise healthcare organizations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Core$q$, $q$$19/month ($18/month billed annually)$q$, $q$monthly$q$, $q$["10 active clients","Scheduling","Payment processing","Charting","Telehealth","Client portal","Mobile app"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Essentials$q$, $q$$49/month ($45/month billed annually)$q$, $q$monthly$q$, $q$["250 active clients","Free outbound fax","Custom form building","CMS 1500s","Group messaging","ClaimMD integration (from $30/month)"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Plus$q$, $q$$129/month ($115/month billed annually)$q$, $q$monthly$q$, $q$["Unlimited clients","Group telehealth","Online programs","Dedicated eFax (inbound/outbound)"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$Group$q$, $q$$149+/month ($135+/month billed annually)$q$, $q$monthly$q$, $q$["Unlimited clients","Shared calendar","Team member add-ons ($50/month per clinician)","Roles/permissions","Internal team chat"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$overview$q$, $q$What is Healthie?$q$, 2, ARRAY[$q$Healthie is a cloud-based EHR and practice management platform offering intake, charting, scheduling, telehealth, billing, and an AI scribe.$q$, $q$It reports being used by 35,000 providers and high-growth businesses, with pricing starting at $19/month and a 14-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', $q$who-its-for$q$, $q$Who Healthie is for$q$, 2, ARRAY[$q$Healthie serves private practices, group practices and clinics, digital health startups, and enterprise healthcare organizations across specialties such as behavioral health, nutrition, and chronic care.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('8ca5d5be-9880-4ce7-94dd-56ab90d70f72', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Practice Better ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Practice Better is EHR and practice management software for health and wellness practitioners, with a free plan and paid plans from $25/month.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$25/month (Starter plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Practice Better EHR and practice management software for wellness practitioners: scheduling, telehealth, billing, and AI tools, free plan available.$q$,
  og_description = $q$Practice Better EHR and practice management software for wellness practitioners: scheduling, telehealth, billing, and AI tools, free plan available.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3d1c8fab-760d-491b-9864-dafede147c46';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3d1c8fab-760d-491b-9864-dafede147c46' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Scheduling and telehealth$q$, $q$Appointment scheduling and telehealth video sessions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Secure messaging and client portal$q$, $q$Direct messaging and a branded client portal.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Charting and protocols$q$, $q$Clinical charting, protocols, and templates for client care.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Billing and payments$q$, $q$Integrated billing, insurance handling, and payment processing.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Programs and courses$q$, $q$Fixed-date, evergreen, and self-paced programs and courses for clients.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Practice Better AI$q$, $q$A suite of AI tools including an AI Charting Assistant billed at $0.60/hour.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$ePrescribe$q$, $q$Electronic prescribing available as a paid add-on ($49/month plus onboarding fee).$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Free Sprout plan available (3 clients, 100MB storage)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Reports over 50,000 practitioners using the platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$4.7-star rating from 250+ G2 reviews$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$No contracts and cancel-anytime policy across plans$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$HIPAA, PIPEDA, and GDPR compliant$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Free plan is limited to 3 clients and 100MB of storage$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Many features (SMS reminders, ePrescribe, PDMP, additional storage) carry separate add-on fees$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Founded year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Does Practice Better have a free plan?$q$, $q$Yes, the Sprout plan is free and includes 3 clients, 100MB storage, basic scheduling, telehealth, messaging, and a client portal.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$How much do paid Practice Better plans cost?$q$, $q$Paid plans range from $35/month (Starter, monthly) or $25/month (billed annually) up to $155/month (Team plan) for additional practitioners and clients.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Does Practice Better offer AI tools?$q$, $q$Yes, Practice Better AI includes an AI Charting Assistant billed at $0.60 per hour, with 600 minutes free.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Is there a free trial?$q$, $q$Paid plans include a 14-day free trial, and the Team plan includes a 30-day free trial.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Who uses Practice Better?$q$, $q$Mental health professionals, functional medicine practitioners, health coaches, medical doctors, nutritionists, dietitians, personal trainers, nurse practitioners, naturopathic doctors, and chiropractors.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Starting a solo wellness practice$q$, $q$New practitioners use the free Sprout plan or Starter plan to manage a small client base.$q$, $q$Solo practitioners and new practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Running client programs$q$, $q$Practitioners deliver fixed-date, evergreen, or self-paced programs and courses to clients.$q$, $q$Health coaches and wellness professionals$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Scaling a multi-practitioner team$q$, $q$Teams use the Team plan for shared scheduling, chat, and managed billing across multiple practitioners.$q$, $q$Group practices$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Sprout$q$, $q$Free$q$, NULL, $q$["3 clients","100MB storage","Basic scheduling","Telehealth","Secure messaging","Client portal","Forms"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Starter$q$, $q$$35/month ($25/month billed annually)$q$, $q$monthly$q$, $q$["1 practitioner","10 clients","1GB storage","Telehealth video chat","Integrated billing & payments","20+ integrations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Professional$q$, $q$$69/month ($59/month billed annually)$q$, $q$monthly$q$, $q$["1 practitioner","300 clients","5GB storage","Group scheduling & messaging","Fixed-date programs","PDF branding","Zapier integrations"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Plus$q$, $q$$99/month ($89/month billed annually)$q$, $q$monthly$q$, $q$["1 practitioner","3 admin licenses","Unlimited clients and storage","Evergreen and self-paced programs","750 SMS reminders/month","Dedicated fax number"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$Team$q$, $q$$155/month ($145/month billed annually)$q$, $q$monthly$q$, $q$["2 practitioners (up to 200 at $50 each)","Unlimited admin, clients, and storage","30-day free trial","Custom roles/permissions","Team scheduling and chat","2,000 SMS/month"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$overview$q$, $q$What is Practice Better?$q$, 2, ARRAY[$q$Practice Better is an EHR and practice management platform for health and wellness practitioners, covering scheduling, telehealth, billing, charting, and client programs.$q$, $q$It offers a free Sprout plan alongside paid tiers starting at $25/month (billed annually), and reports over 50,000 practitioners on the platform.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', $q$who-its-for$q$, $q$Who Practice Better is for$q$, 2, ARRAY[$q$Practice Better serves mental health professionals, functional medicine practitioners, health coaches, medical doctors, nutritionists and dietitians, personal trainers, nurse practitioners, naturopathic doctors, and chiropractors.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3d1c8fab-760d-491b-9864-dafede147c46', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Nutrium ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Nutrium is nutrition software connecting dietitians, patients, and companies for appointments, meal planning, and corporate wellness programs.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$15/month (10 Customers/Month plan, billed annually)$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Nutrium nutrition software for dietitians: appointments, meal planning, and telehealth, with plans from $15/month and a 14-day free trial.$q$,
  og_description = $q$Nutrium nutrition software for dietitians: appointments, meal planning, and telehealth, with plans from $15/month and a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3c10d8d2-81ae-4c01-b041-bf40e0c15cf4';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3c10d8d2-81ae-4c01-b041-bf40e0c15cf4' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Online nutrition appointments$q$, $q$Dietitians can conduct online appointments with clients.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Meal planning$q$, $q$Build personalized meal plans for clients.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Secure chat and telehealth$q$, $q$Telehealth integration and secure messaging with clients.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Dietary analysis$q$, $q$Nutrient breakdowns and dietary analysis tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Progress tracking$q$, $q$Visual reports for tracking client progress over time.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Payments and invoicing$q$, $q$Built-in tools for billing and invoicing clients.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Templates and resources$q$, $q$100+ templates, recipes, and infographics included.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Mobile app$q$, $q$A mobile app supports personalized nutrition monitoring for clients.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Reports 2.5 million lives improved and 350,000+ dietitians using the platform across 90 countries$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$14-day free trial on paid plans$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Includes 100+ templates, recipes, and infographics$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Serves both individual dietitians and corporate wellness clients such as Vodafone, Adidas, and Sodexo$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$HIPAA and GDPR compliant$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$The lower-priced plan caps usage at 10 customers per month$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Pricing varies by region (EUR and BRL pricing also shown), which can complicate comparisons$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Founded year, headquarters, and company size are not disclosed on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$How much does Nutrium cost?$q$, $q$The 10 Customers/Month plan starts at $15/month billed annually ($25/month billed monthly), and the Unlimited Clients plan starts at $25/month billed annually ($39/month billed monthly).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Does Nutrium offer a free trial?$q$, $q$Yes, both paid plans include a 14-day free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Who uses Nutrium?$q$, $q$Nutrium is used by companies offering employee nutrition benefits, individuals seeking nutrition guidance, dietitians managing client care, and health plans or benefit consultants.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Does Nutrium offer corporate wellness programs?$q$, $q$Yes, Nutrium provides corporate nutrition workshops and works with company clients such as Vodafone, Adidas, Wellhub, and Sodexo.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Is Nutrium available to students for free?$q$, $q$Yes, Nutrium offers academic partnerships with free access for students and faculty.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Running a nutrition practice$q$, $q$Dietitians manage appointment booking, meal planning, and client follow-up on the Unlimited Clients plan.$q$, $q$Dietitians and nutrition professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Corporate employee wellness$q$, $q$Companies offer employee nutrition benefits combining the platform with professional dietitians.$q$, $q$Employers and benefit consultants$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Managing a smaller caseload$q$, $q$Practitioners with fewer clients use the 10 Customers/Month plan to keep costs lower.$q$, $q$Part-time or smaller-caseload dietitians$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$10 Customers/Month$q$, $q$$15/month ($179/year) billed annually, or $25/month billed monthly$q$, $q$monthly$q$, $q$["Up to 10 customers per month","Personalized meal plans","Automated scheduling and reminders","Secure chat and telehealth","100+ templates, recipes, and infographics"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$Unlimited Clients$q$, $q$$25/month ($299/year) billed annually, or $39/month billed monthly$q$, $q$monthly$q$, $q$["Unlimited clients","Personalized meal plans","Dietary analysis with nutrient breakdowns","Progress tracking with visual reports","Payment and invoicing tools"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$overview$q$, $q$What is Nutrium?$q$, 2, ARRAY[$q$Nutrium is nutrition software that connects dietitians, patients, and companies for online appointments, meal planning, and corporate wellness programs.$q$, $q$It reports 2.5 million lives improved and 350,000+ dietitians using the platform in over 90 countries, with paid plans starting at $15/month and a 14-day free trial.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', $q$who-its-for$q$, $q$Who Nutrium is for$q$, 2, ARRAY[$q$Nutrium serves dietitians and nutrition professionals managing client care, companies offering employee nutrition benefits, and individuals seeking personalized nutrition guidance.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3c10d8d2-81ae-4c01-b041-bf40e0c15cf4', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Halaxy ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Free practice management software for health practitioners, covering scheduling, patient records, invoicing, and telehealth.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$Free$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Halaxy offers free practice management software for health practitioners, including scheduling, patient records, invoicing, and telehealth tools.$q$,
  og_description = $q$Halaxy offers free practice management software for health practitioners, including scheduling, patient records, invoicing, and telehealth tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fddf95b3-6124-4cb3-8919-8d1df1119657';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fddf95b3-6124-4cb3-8919-8d1df1119657' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Appointment scheduling$q$, $q$Calendar management, online bookings, automated reminders, and built-in telehealth for appointments.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Patient management$q$, $q$Stores patient records and health information, with an AI Scribe capability for clinical documentation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Clinical invoicing and rebates$q$, $q$Generates clinical invoices and processes funding body rebates such as Medicare, DVA, and NDIS.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Financial reporting$q$, $q$Tracks practice revenue and generates financial reports for practitioners.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Clinical tools and templates$q$, $q$Provides over 700 clinical tools and templates for practitioners.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Patient portal$q$, $q$Gives patients access to a personal health record portal.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Core practice management platform is free with no sign-up cost or credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Unlimited appointments, practitioners, and locations on the free plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Includes built-in telehealth and a patient health record portal$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Over 700 clinical tools and templates included at no cost$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Add-on features like SMS reminders, rebates, e-scripts, and AI Scribe are billed per credit$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Payment processing carries a 1.5%-1.9% transaction fee plus a flat fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Advanced features like white-label branding and API access require a paid subscription starting at 25 credits/month$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Is Halaxy free to use?$q$, $q$Yes, the core practice management platform — including scheduling, patient records, invoicing, and reporting — is free with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$How do Halaxy's add-on credits work?$q$, $q$Optional features like SMS messaging, funding body rebates, e-scripts, and AI Scribe are billed on a pay-as-you-go credit basis, at roughly AUD $0.15-$0.22 per credit.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Does Halaxy support telehealth?$q$, $q$Yes, telehealth is included as part of the appointment scheduling features.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Does Halaxy charge for payment processing?$q$, $q$Yes, processing patient payments carries a fee of 1.5%-1.9% plus a flat fee per transaction, depending on tier.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Solo practitioners$q$, $q$Individual practitioners can run scheduling, records, and invoicing at no cost using the free core platform.$q$, $q$Solo health practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Multi-practitioner clinics$q$, $q$Clinics with several practitioners and locations can use unlimited practitioners/locations on the free tier, adding paid credits for SMS or rebates as needed.$q$, $q$Multi-location health practices$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Free$q$, $q$Free$q$, NULL, $q$["Unlimited appointments","Unlimited practitioners","Unlimited locations","Patient management and records","700+ clinical tools and templates","Clinical invoicing","Financial reporting","Patient health record portal"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Add-on Credits$q$, $q$AUD $0.15-$0.22 per credit$q$, NULL, $q$["SMS messaging","Funding body rebates (Medicare, DVA, NDIS)","E-scripts","Telehealth extras","AI Scribe"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$Subscription$q$, $q$From 25 credits/month$q$, $q$monthly$q$, $q$["Two-way calendar sync","White-label branding","E-script integrations","Halaxy API","Dedicated practice phone number"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$overview$q$, $q$What is Halaxy?$q$, 2, ARRAY[$q$Halaxy is a practice management platform for health practitioners that combines appointment scheduling, patient records, clinical invoicing, and financial reporting in one free core system.$q$, $q$The platform includes over 700 clinical tools and templates, a patient health record portal, and built-in telehealth, with optional paid add-ons for SMS reminders, funding body rebates, e-scripts, and an AI Scribe feature.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', $q$who-its-for$q$, $q$Who Halaxy is for$q$, 2, ARRAY[$q$Halaxy suits solo health practitioners and multi-practitioner clinics that want free core practice management software and are willing to pay per-credit for optional extras like SMS reminders, rebate processing, or AI-assisted documentation.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fddf95b3-6124-4cb3-8919-8d1df1119657', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Spruce Health ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$HIPAA-compliant communication platform for healthcare teams, offering secure messaging, texting, video visits, and e-fax.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$24/user/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Spruce Health is a HIPAA-compliant platform for secure patient messaging, texting, video visits, and team communication, from $24/user/month.$q$,
  og_description = $q$Spruce Health is a HIPAA-compliant platform for secure patient messaging, texting, video visits, and team communication, from $24/user/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1de08da2-3fe6-4896-9da1-03448621c680';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1de08da2-3fe6-4896-9da1-03448621c680' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Secure messaging$q$, $q$Share files and audio notes with patients through HIPAA-compliant secure messaging.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Two-way SMS texting$q$, $q$Send and receive patient texts with a dedicated medical phone number, plus AI voicemail transcription.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Video telehealth visits$q$, $q$Conduct video visits directly with patients from the same platform used for messaging.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$E-fax$q$, $q$Send and receive faxes digitally without a physical fax machine.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Team messaging and tasks$q$, $q$Internal team chat with task assignment for staff collaboration.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$VoIP phone system$q$, $q$Call routing, self-service call flows (IVR), and after-hours triage on the Communicator plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Digital payments$q$, $q$Collect patient payments through the platform.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$14-day free trial with no credit card required$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Effectively unlimited usage with no per-text, per-call, or per-fax charges$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Available on web, iOS, and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$HIPAA BAA included on both pricing tiers$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Per-user pricing means costs rise with team size, and all users must be on the same plan$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$SMS texting requires a one-time $19.50 registration fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$API access and integrations require the higher-priced Communicator plan$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Does Spruce offer a free trial?$q$, $q$Yes, a 14-day free trial is available with no credit card required, covering all Basic plan features except SMS texting.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$How is Spruce priced?$q$, $q$Per user per month: $24 for Basic and $49 for Communicator, billed month-to-month, with annual contracts available for larger practices.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Is there a limit on messages or calls?$q$, $q$No, most practices can use texting, calling, and faxing in an effectively unlimited way without per-use charges.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$What platforms does Spruce support?$q$, $q$Spruce is available via web browser and native iOS and Android apps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Solo medical practices$q$, $q$Independent providers can manage patient messaging, calls, and video visits from one HIPAA-compliant inbox.$q$, $q$Solo practitioners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Team-based clinics$q$, $q$Multi-provider practices can add call routing, after-hours triage, and integrations with the Communicator plan.$q$, $q$Team-based healthcare practices$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Basic$q$, $q$$24/user/month$q$, $q$monthly$q$, $q$["HIPAA BAA","Medical phone, text, video, and fax","Customizable shared inbox","Auto-replies","AI voicemail transcription"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$Communicator$q$, $q$$49/user/month$q$, $q$monthly$q$, $q$["Everything in Basic","Self-service call flows (IVR)","Urgent escalation and after-hours triage","Integrations and API access","VoIP phone service","AI transcription and call summarization"]$q$::jsonb, 1);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$overview$q$, $q$What is Spruce Health?$q$, 2, ARRAY[$q$Spruce Health is a HIPAA-compliant communication platform that lets healthcare teams handle secure messaging, two-way SMS, video visits, e-fax, and internal team chat from a single inbox.$q$, $q$It is priced per user per month across two plans — Basic and Communicator — with the higher tier adding call routing, after-hours triage, and integrations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', $q$who-its-for$q$, $q$Who Spruce Health is for$q$, 2, ARRAY[$q$Spruce Health fits solo physicians, mental health practitioners, and team-based clinics that need HIPAA-compliant patient communication across text, phone, fax, and video in one place.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1de08da2-3fe6-4896-9da1-03448621c680', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── OhMD ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI patient communication platform for medical practices, featuring an AI voice agent, secure texting, and EHR integrations.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$300/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Vermont, United States$q$,
  languages = '{}',
  seo_meta_description = $q$OhMD provides AI-powered patient communication for medical practices, including an AI voice agent, secure texting, and integration with 85+ EHR systems.$q$,
  og_description = $q$OhMD provides AI-powered patient communication for medical practices, including an AI voice agent, secure texting, and integration with 85+ EHR systems.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0827d2c4-33ac-4c46-a57f-b360cc0f698b' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$AI voice agent (Nia)$q$, $q$An AI agent automatically answers, routes, and handles patient phone calls.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Two-way secure texting$q$, $q$Send and receive SMS through a text-enabled landline number.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Call-to-text conversion$q$, $q$Converts inbound phone calls into text conversations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Voicemail transcription$q$, $q$Transcribes voicemails automatically for staff review.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$EHR integration$q$, $q$Connects with 85+ electronic health record systems.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Appointment scheduling automation$q$, $q$Automates scheduling as part of the Automate plan.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Broadcast messaging and smart routing$q$, $q$Sends broadcast messages and routes patient conversations to the right staff member.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Used by 1,200+ medical practices, including major institutions like Dana-Farber and Memorial Sloan Kettering$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$AI voice agent (Nia) automates routine patient calls to reduce staff workload$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Integrates with 85+ EHR systems$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Includes a signed BAA and multi-factor authentication for HIPAA compliance$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Entry-level Communicate plan starts at $300/month, higher than some competitors$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Calling usage is billed separately on the Automate plan$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Enterprise tier requires custom, quote-based pricing$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Does OhMD offer a free plan or trial?$q$, $q$No free plan or free trial is mentioned on OhMD's pricing page.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$What does the Communicate plan include?$q$, $q$Two-way SMS, a text-enabled landline, voice/video calling, voicemail transcription, call-to-text, website chat, and team messaging, starting at $300/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$What does the Automate plan add?$q$, $q$Everything in Communicate plus the Nia AI voice agent for automated patient calls, EHR integration, and appointment scheduling, starting at $500/month, with calling usage billed separately.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Does OhMD integrate with EHR systems?$q$, $q$Yes, OhMD integrates with more than 85 EHR systems.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$High call-volume small practices$q$, $q$Practices needing two-way texting and call handling can start with the Communicate plan.$q$, $q$Small medical practices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Practices automating patient calls$q$, $q$Busy practices can use the Automate plan's Nia AI voice agent to handle routine calls and scheduling automatically.$q$, $q$Multi-provider medical practices$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Communicate$q$, $q$$300/month$q$, $q$monthly$q$, $q$["Two-way SMS","Text-enabled landline","Voice/video calling","Voicemail transcription","Call-to-text","Website chat","Team messaging","BAA"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Automate$q$, $q$$500/month$q$, $q$monthly$q$, $q$["Everything in Communicate","Nia AI patient call automation","Automatic message routing","Custom workflows","Appointment scheduling","EHR integration","Premium support"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Volume discounts","SSO","Custom onboarding","Dedicated support","Multi-location capabilities","Reporting and analytics","API extensions"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$overview$q$, $q$What is OhMD?$q$, 2, ARRAY[$q$OhMD is an AI-powered patient communication platform built for physician practices and multi-location healthcare networks, combining secure texting, call handling, and an AI voice agent called Nia.$q$, $q$Its Automate plan uses Nia to answer and route patient calls automatically, while integrating with more than 85 EHR systems for appointment scheduling and records access.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', $q$who-its-for$q$, $q$Who OhMD is for$q$, 2, ARRAY[$q$OhMD is aimed at physician practices and healthcare networks dealing with high call volumes that want to automate routine patient communication while staying HIPAA compliant.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0827d2c4-33ac-4c46-a57f-b360cc0f698b', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Luma Health ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Operational AI platform automating patient access, engagement, intake, and payments for healthcare organizations.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Luma Health is an AI platform automating patient access, engagement, intake, and payments for health systems, specialty groups, and clinics.$q$,
  og_description = $q$Luma Health is an AI platform automating patient access, engagement, intake, and payments for health systems, specialty groups, and clinics.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'd6bc44bb-56fc-4d52-8fe2-1b741120a0df' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Agentic Access$q$, $q$Automates order orchestration, referrals, fax processing, and waitlist management.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Agentic Engagement$q$, $q$Handles omnichannel messaging and conversational AI for two-way patient outreach.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Agentic Intake$q$, $q$Provides responsive digital forms, patient checklists, and clinic flow management.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Agentic Payments$q$, $q$Automates eligibility verification, prior authorization, and co-pay handling.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Spark$q$, $q$A healthcare-native AI core that coordinates the platform's automation capabilities.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$No-code workflow builder$q$, $q$Lets healthcare teams build custom automated workflows without developer support.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$EHR integrations$q$, $q$Connects with major EHRs including Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Trusted by 1,000+ healthcare organizations, including Banner Health and UAMS$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Integrates with major EHRs including Epic, Oracle Health, and Athenahealth$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$No-code workflow builder allows customization without developers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Includes two-way AI translation for patient communication$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$No free trial or free plan mentioned$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Built primarily for larger healthcare organizations, which may be more complex than very small practices need$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$What does Luma Health's platform do?$q$, $q$It automates patient access, engagement, intake, and payment workflows using an AI core called Spark.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Which EHR systems does Luma Health integrate with?$q$, $q$It integrates with Epic, Oracle Health, MEDITECH, eClinicalWorks, Athenahealth, NextGen, Greenway, and Nextech.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Is Luma Health's pricing public?$q$, $q$No, pricing is not disclosed on the website.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Does Luma Health support multiple languages?$q$, $q$It includes a two-way AI translation feature for patient communication, though a specific language list is not published.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Enterprise health systems$q$, $q$Large health systems can automate referral orchestration, waitlist management, and patient intake at scale.$q$, $q$Enterprise health systems$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$Specialty and rural care providers$q$, $q$Specialty groups and regional or rural providers can use no-code workflows and AI messaging to manage patient engagement with limited staff.$q$, $q$Specialty groups and rural/regional healthcare providers$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$overview$q$, $q$What is Luma Health?$q$, 2, ARRAY[$q$Luma Health is an operational AI platform for healthcare organizations that automates patient access, engagement, intake, and payment workflows through a set of 'Agentic' modules powered by its Spark AI core.$q$, $q$It integrates with major EHR systems such as Epic, Oracle Health, and Athenahealth, and includes a no-code workflow builder for customizing automation.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', $q$who-its-for$q$, $q$Who Luma Health is for$q$, 2, ARRAY[$q$Luma Health is built for enterprise health systems, specialty groups, and regional or rural care providers that want to automate patient-facing operations across access, intake, and payments.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', '87a92d11-ee13-4164-9910-61410254388a') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('d6bc44bb-56fc-4d52-8fe2-1b741120a0df', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Artera ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI agent platform for healthcare patient communication, automating scheduling, intake, and multi-channel outreach.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Artera, formerly WELL Health, uses AI agents to automate patient scheduling, intake, and multi-channel communication for healthcare organizations.$q$,
  og_description = $q$Artera, formerly WELL Health, uses AI agents to automate patient scheduling, intake, and multi-channel communication for healthcare organizations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ea7c3712-bfdd-4d8d-b737-f0af4c024576' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$AI voice agents$q$, $q$Automate scheduling, appointment management, and patient intake conversations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Multi-channel communication$q$, $q$Reaches patients via voice, rich text, and email from one platform.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$EHR integrations$q$, $q$Connects with major electronic health record systems.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$AI Service Squads$q$, $q$Provide custom automation solution development for healthcare organizations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Intelligent triage and warm handoff$q$, $q$Routes complex conversations from AI agents to human staff when needed.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$24/7 patient access$q$, $q$Supports after-hours care coordination and continuous patient access.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Serves 1,000+ healthcare organizations with 2B+ patient interactions a year$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Proprietary AI trained on 20B+ patient interactions without using PHI/PII for training$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Supports 13+ medical specialties, including behavioral health, cardiology, and oncology$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Offers 24/7 automated patient access and after-hours care coordination$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Pricing is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Company rebranded from WELL Health, which may create brand-recognition transition for existing customers$q$, 1);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Is Artera the same company as WELL Health?$q$, $q$Yes, Artera's site footer identifies it as '(Formerly WELL Health®)', indicating Artera is the rebranded successor to WELL Health.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$What does Artera's platform do?$q$, $q$It uses agentic AI voice, text, and email agents to automate patient scheduling, intake, and communication for healthcare organizations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$How many organizations use Artera?$q$, $q$Artera states it serves 1,000+ healthcare organizations with over 2 billion patient interactions a year.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Does Artera train its AI on patient data?$q$, $q$Artera states its AI does not use PHI/PII for model training.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Federally Qualified Health Centers$q$, $q$FQHCs can automate scheduling and intake communication with AI voice agents.$q$, $q$FQHCs and community health centers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$Specialty practices and health systems$q$, $q$Specialty practices across 13+ medical fields can use multi-channel AI communication for after-hours access and triage.$q$, $q$Specialty practices and health systems$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$overview$q$, $q$What is Artera?$q$, 2, ARRAY[$q$Artera is an AI agent platform for healthcare patient communication, formerly operating as WELL Health, that automates scheduling, intake, and multi-channel outreach across voice, text, and email.$q$, $q$Its AI is trained on more than 20 billion patient interactions and includes intelligent triage that hands off complex conversations to human staff.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', $q$who-its-for$q$, $q$Who Artera is for$q$, 2, ARRAY[$q$Artera is built for FQHCs, health systems, specialty practices, and federal agencies across 13+ medical specialties that want to automate patient scheduling and communication with AI agents.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ea7c3712-bfdd-4d8d-b737-f0af4c024576', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Weave ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$All-in-one communication and practice management platform with an AI receptionist for healthcare and small businesses.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$199/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Lehi, Utah, United States$q$,
  languages = '{}',
  seo_meta_description = $q$Weave is an all-in-one communication platform with an AI receptionist, scheduling, payments, and review management for practices, from $199/month.$q$,
  og_description = $q$Weave is an all-in-one communication platform with an AI receptionist, scheduling, payments, and review management for practices, from $199/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '122093a2-2cf8-46b9-8fcf-07070f5d37e2' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$AI Receptionist$q$, $q$Handles inbound voice calls and text messages automatically.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Appointment scheduling and reminders$q$, $q$Automates online scheduling and patient reminders.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Payment processing$q$, $q$Supports text-to-pay and buy-now-pay-later options for patient payments.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Call Intelligence$q$, $q$Analyzes call sentiment for insight into patient interactions.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Review management$q$, $q$Includes an AI Response Assistant for managing and replying to customer reviews.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Digital forms and email marketing$q$, $q$Sends digital intake forms and email marketing campaigns.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Team chat and missed-call text automation$q$, $q$Provides internal team chat and automatically texts back missed calls.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$AI Receptionist automates inbound calls and texts to reduce staff workload$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Headquartered in Lehi, Utah, with an established presence in the healthcare and dental market$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Available via web browser, desktop app, and mobile app$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Includes review management with AI-generated response suggestions$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Pricing for the Elite and Ultimate tiers is not published and requires contacting sales$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Entry-level Pro plan starts at $199/month, which may be high for very small offices$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$No free plan or free trial mentioned$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$How much does Weave cost?$q$, $q$The Pro plan starts at $199/month; pricing for the Elite and Ultimate plans requires contacting Weave directly.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$What does the AI Receptionist do?$q$, $q$It automatically answers inbound patient calls and texts, helping practices reduce missed calls and staff workload.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Where is Weave based?$q$, $q$Weave is headquartered in Lehi, Utah.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$What platforms is Weave available on?$q$, $q$Weave is accessible via web browser, a desktop app, and mobile apps.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Dental and medical practices$q$, $q$Practices can automate patient reminders, payments, and reviews from one platform.$q$, $q$Dental and medical practices$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Small businesses$q$, $q$Small businesses outside healthcare can use Weave's communication and review tools to manage customer interactions.$q$, $q$Small businesses$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Pro$q$, $q$$199/month$q$, $q$monthly$q$, $q$["1,500 bulk text messages monthly","Basic two-way texting","Appointment reminders","Online scheduling","Digital forms","Collections tracking"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Elite$q$, $q$Custom$q$, $q$monthly$q$, $q$["Everything in Pro","3,000 monthly messages","Call analytics","Team chat","Fax capabilities","Customer profiles"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$Ultimate$q$, $q$Custom$q$, $q$monthly$q$, $q$["Everything in Elite","15,000 monthly messages","Up to 15 VoIP phones","1:1 personalized training","Premium analytics tools"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$overview$q$, $q$What is Weave?$q$, 2, ARRAY[$q$Weave is an all-in-one communication and practice management platform for healthcare practices and small businesses, combining an AI Receptionist, scheduling, payments, and review management.$q$, $q$It offers three tiers — Pro, Elite, and Ultimate — with Pro starting at $199/month and higher tiers requiring a custom quote.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', $q$who-its-for$q$, $q$Who Weave is for$q$, 2, ARRAY[$q$Weave is aimed at dental and medical practices, along with other small businesses, that want to automate patient communication, scheduling, payments, and review management in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('122093a2-2cf8-46b9-8fcf-07070f5d37e2', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Birdeye ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Agentic AI marketing platform helping multi-location brands manage reviews, listings, social media, and search visibility.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Birdeye is an AI-powered platform for multi-location brands to manage online reviews, business listings, social media, and search visibility.$q$,
  og_description = $q$Birdeye is an AI-powered platform for multi-location brands to manage online reviews, business listings, social media, and search visibility.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '96e7ec06-f2ec-4702-94ef-ddc083739f48';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '96e7ec06-f2ec-4702-94ef-ddc083739f48' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Reviews AI$q$, $q$Generates, monitors, and manages customer reviews across 200+ sites.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Listings AI$q$, $q$Optimizes business information across 50+ listing platforms.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Social AI$q$, $q$Creates and schedules location-relevant social media content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Search AI$q$, $q$Manages brand visibility on AI search tools like ChatGPT and Perplexity, as well as Google.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Marketing Automation$q$, $q$Runs personalized email and SMS campaigns by location.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Insights AI$q$, $q$Measures reputation, sentiment, and benchmarks performance across locations.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Integrations$q$, $q$Connects with 3,000+ apps, including industry-specific PMS, EHR, POS, and DMS platforms.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Serves major multi-location brands like Aspen Dental, Cracker Barrel, and Smile Brands$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Manages reviews across 200+ sites and listings across 50+ platforms from one dashboard$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Includes AI-driven visibility management for AI search engines like ChatGPT and Perplexity$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Integrates with 3,000+ apps, including industry-specific PMS, EHR, POS, and DMS tools$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Pricing is custom and requires a location-based quote via a pricing configurator$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$No public free plan; only a free brand scan/demo is offered$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Built for multi-location brands, which may offer more than single-location businesses need$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$How is Birdeye priced?$q$, $q$Birdeye uses outcome-based, custom pricing based on the number of locations, available through a pricing configurator or by contacting sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Does Birdeye offer a free trial?$q$, $q$No traditional free plan or trial is mentioned; a free brand scan tool is available instead.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$How many review sites does Birdeye monitor?$q$, $q$Birdeye's Reviews AI covers 200+ review sites.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Does Birdeye help with AI search visibility?$q$, $q$Yes, its Search AI feature manages brand visibility on AI tools like ChatGPT and Perplexity in addition to Google.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Multi-location healthcare and dental brands$q$, $q$Chains can centralize review management, listings, and patient-facing communication across locations.$q$, $q$Multi-location healthcare and dental brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$Retail and restaurant chains$q$, $q$Retail and restaurant brands can manage location-specific social content and review responses at scale.$q$, $q$Multi-location retail and restaurant brands$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$overview$q$, $q$What is Birdeye?$q$, 2, ARRAY[$q$Birdeye is an agentic AI marketing platform that helps multi-location brands manage their online presence, including reviews, business listings, social media, and visibility on both traditional and AI search engines.$q$, $q$Pricing is customized based on the number of locations and is obtained through a pricing configurator or by contacting sales.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', $q$who-its-for$q$, $q$Who Birdeye is for$q$, 2, ARRAY[$q$Birdeye is built for multi-location brands and enterprises — including healthcare, dental, automotive, restaurant, and retail businesses — that need to manage reputation and visibility across many locations from one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('96e7ec06-f2ec-4702-94ef-ddc083739f48', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── Reputation ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$AI-powered reputation management platform for multi-location brands to manage reviews, listings, surveys, and local visibility.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$80/location/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = ARRAY[$q$English$q$, $q$French$q$, $q$German$q$]::text[],
  seo_meta_description = $q$Reputation.com is an AI-powered platform for multi-location brands to manage reviews, listings, and surveys, starting at $80/location/month.$q$,
  og_description = $q$Reputation.com is an AI-powered platform for multi-location brands to manage reviews, listings, and surveys, starting at $80/location/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '69e9043e-430d-4fc5-97c8-fc58de34946f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '69e9043e-430d-4fc5-97c8-fc58de34946f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Rep Score$q$, $q$A unified performance KPI that benchmarks reputation across locations.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Reviews management$q$, $q$Generates and monitors customer reviews across sites.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Business listings management$q$, $q$Manages business listing accuracy across the web.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Reputation IQ$q$, $q$AI-powered analytics and answers about brand reputation.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Survey collection and analysis$q$, $q$Collects customer surveys, with advanced templates on higher-tier plans.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Social media publishing and listening$q$, $q$Publishes and monitors social content from the platform.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Actions routing$q$, $q$Routes customer feedback and issues to the right team for accountability.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Transparent published pricing starting at $80/location/month$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Includes an AI Reputation Manager and Pulse Analytics on the mid-tier plan$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Supports English, French, and German$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Serves large multi-location clients like Kia UK and Greystar$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$No free plan or free trial mentioned$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Advanced survey and analytics features require higher-priced tiers$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Enterprise tier for 125+ locations requires a custom quote$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$How much does Reputation.com cost?$q$, $q$Plans start at $80/location/month for Rep Core, with Rep Core + Pulse at $115/location/month and Rep Core + Surveys at $150/location/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Does Reputation.com offer a free trial?$q$, $q$No free plan or trial is mentioned on the pricing page.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$What languages does Reputation.com support?$q$, $q$The platform is documented in English, French, and German.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$What is included in the Enterprise plan?$q$, $q$The Enterprise plan, for 125+ locations, includes custom pricing, dedicated infrastructure, and a customer success manager.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Automotive dealership groups$q$, $q$Dealership groups can track review sentiment and listing accuracy across multiple locations.$q$, $q$Automotive dealerships$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Healthcare and senior living networks$q$, $q$Multi-site healthcare and senior living organizations can monitor reputation and run patient/resident surveys.$q$, $q$Healthcare systems and senior living communities$q$, 1);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Rep Core$q$, $q$$80/location/month$q$, $q$monthly$q$, $q$["Reviews management","Business listings and SEO"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Rep Core + Pulse$q$, $q$$115/location/month$q$, $q$monthly$q$, $q$["Everything in Rep Core","Reputation insights","AI Reputation Manager","Pulse Analytics","Basic customer surveys"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Rep Core + Surveys$q$, $q$$150/location/month$q$, $q$monthly$q$, $q$["Everything in Rep Core","Advanced surveys (6 templates)","Email survey requesting","Targeted outreach campaigns","Deep experience insights"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom pricing","Dedicated infrastructure","Customer success manager"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$overview$q$, $q$What is Reputation?$q$, 2, ARRAY[$q$Reputation (reputation.com) is an AI-powered reputation management platform that helps multi-location brands manage reviews, business listings, surveys, and social media from one dashboard, scored through its Rep Score KPI.$q$, $q$Pricing is published per location, starting at $80/location/month and rising with added survey and analytics capabilities.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', $q$who-its-for$q$, $q$Who Reputation is for$q$, 2, ARRAY[$q$Reputation is built for multi-location businesses — including automotive dealerships, healthcare systems, senior living communities, retail chains, and financial institutions — that need to manage online reputation at scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('69e9043e-430d-4fc5-97c8-fc58de34946f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── ReviewTrackers ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Reputation management software for monitoring, analyzing, and responding to customer reviews across multiple platforms.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$ReviewTrackers helps multi-location businesses monitor, analyze, and respond to customer reviews and local listings across platforms.$q$,
  og_description = $q$ReviewTrackers helps multi-location businesses monitor, analyze, and respond to customer reviews and local listings across platforms.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '39c68560-090d-4a39-b278-5e450024c11c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '39c68560-090d-4a39-b278-5e450024c11c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Review monitoring and management$q$, $q$Tracks and manages customer reviews across multiple platforms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Local SEO optimization$q$, $q$Manages local listings to support search visibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Customer experience analytics$q$, $q$Analyzes review data for customer experience insights.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Competitor analysis$q$, $q$Benchmarks review performance against competitors.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Unified social and review monitoring$q$, $q$Combines social media and review monitoring in a single workflow.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Employer brand monitoring$q$, $q$Tracks employer review sites alongside customer reviews.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Review widgets$q$, $q$Displays customer reviews on business websites.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Trusted by well-known brands like OneMain Financial, Carvana, and Ashley Furniture$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Available on web, iOS, and Android$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Combines review, social, and local listing monitoring in one workflow$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Offices across the US, Australia, New Zealand, and Singapore support customers in multiple regions$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Pricing is not published and requires a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$No free plan or free trial mentioned$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$AI capabilities are not detailed on the website$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$How much does ReviewTrackers cost?$q$, $q$Pricing is tiered but not disclosed publicly; prospective customers must request a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Does ReviewTrackers have a mobile app?$q$, $q$Yes, it offers apps for both iOS and Android.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Where is ReviewTrackers based?$q$, $q$ReviewTrackers lists offices in Chicago, Salt Lake City, Sydney, Auckland, and Singapore.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$What kinds of businesses use ReviewTrackers?$q$, $q$It serves multi-location businesses across industries including retail, financial services, dental, furniture, and storage.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Multi-location retail and financial brands$q$, $q$Businesses with many locations can monitor and respond to reviews at scale while tracking local SEO performance.$q$, $q$Multi-location retail and financial services businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$Dental and furniture businesses$q$, $q$Service businesses can combine review collection, social monitoring, and competitor analysis in one workflow.$q$, $q$Dental, furniture, and storage companies$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$overview$q$, $q$What is ReviewTrackers?$q$, 2, ARRAY[$q$ReviewTrackers is online reputation management software that helps businesses monitor, analyze, and respond to customer reviews across multiple platforms, alongside local listing and social media monitoring.$q$, $q$It offers tiered subscription pricing that is not publicly disclosed, with mobile apps available for iOS and Android.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', $q$who-its-for$q$, $q$Who ReviewTrackers is for$q$, 2, ARRAY[$q$ReviewTrackers is designed for multi-location businesses and enterprises across industries like retail, financial services, dental, furniture, and storage that need to manage customer feedback at scale.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('39c68560-090d-4a39-b278-5e450024c11c', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;

-- ── GatherUp ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GatherUp is a review generation, monitoring, and reputation management platform for businesses and agencies.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GatherUp review management software: collect reviews, monitor 100+ sites, and reply with AI. Plans start at $99/month.$q$,
  og_description = $q$GatherUp review management software: collect reviews, monitor 100+ sites, and reply with AI. Plans start at $99/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'cb4b68ba-b4d4-4c0f-8fd7-b849bda16445';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'cb4b68ba-b4d4-4c0f-8fd7-b849bda16445' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Review Generation$q$, $q$Collects reviews through automated email and SMS requests, a website chat widget, and integrations with POS/CRM systems.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Centralized Review Monitoring$q$, $q$Tracks reviews across more than 100 review sites, including Google, Facebook, TripAdvisor, Trustpilot, and BBB, from one dashboard.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$AI-Generated Replies$q$, $q$Suggests on-brand responses to customer reviews to speed up reply workflows.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Fake Review Detection$q$, $q$Flags suspicious reviews and files disputes automatically as part of the platform's Defend tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Listings Hub$q$, $q$An add-on that syncs business information across 125+ directories for local SEO.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Agency White-Labeling$q$, $q$The Agency plan lets agencies resell the platform under their own brand.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Reporting & Sentiment Analysis$q$, $q$Performance dashboards and sentiment tagging on incoming reviews.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Monitors reviews across 100+ sites from a single dashboard$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$AI-generated reply suggestions speed up review responses$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Built-in fake review detection with automatic dispute filing$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Free trial requires no credit card$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Agency plan supports white-label reselling$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Review Defense add-on and Agency plan pricing require contacting sales for a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Multi-location pricing is charged per location ($60/month each), which can add up for larger chains$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Founding year, headquarters, and company size are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Does GatherUp offer a free trial?$q$, $q$Yes, GatherUp offers a free trial that does not require a credit card.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$How much does GatherUp cost?$q$, $q$The Small Business plan starts at $99/month for one location; Multi-Location pricing is $60/month per location for 2-10 locations, with volume pricing beyond that. Agency pricing requires a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Which review sites does GatherUp monitor?$q$, $q$GatherUp monitors more than 100 review sites, including Google, Facebook, TripAdvisor, Trustpilot, and BBB.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Does GatherUp use AI?$q$, $q$Yes, GatherUp provides AI-generated reply suggestions and AI-generated insights to help teams respond to and act on reviews faster.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Can agencies white-label GatherUp?$q$, $q$Yes, the Agency plan provides white-label reputation management software that agencies can resell to clients under their own brand.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Local business review generation$q$, $q$A single-location business uses email and SMS requests to collect more Google and Facebook reviews after each customer interaction.$q$, $q$Small, single-location businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Multi-location review monitoring$q$, $q$A multi-location brand consolidates review monitoring and reporting for all locations into one dashboard.$q$, $q$Multi-location businesses and franchises$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Agency reputation management reselling$q$, $q$A digital agency white-labels GatherUp to offer reputation management as a service to its clients.$q$, $q$Digital marketing agencies$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Review fraud defense$q$, $q$A business facing suspicious or fake reviews uses GatherUp's Defend features to detect and dispute them automatically.$q$, $q$Businesses dealing with review fraud$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Small Business$q$, $q$$99/month$q$, $q$monthly$q$, $q$["1 location","Up to 300 SMS + 3,000 email credits/month","Monitoring of 100+ review sites","AI-powered replies","NPS surveys","API access"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Multi-Location$q$, $q$$60/month per location$q$, $q$monthly$q$, $q$["2-10 locations (volume pricing up to 101+)","Same features as Small Business plan"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Agency$q$, $q$Request a quote$q$, NULL, $q$["White-label reputation management software for clients"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$Listings Hub (add-on)$q$, $q$$40/month per location$q$, $q$monthly$q$, $q$["Sync business info across 125+ directories","Local SEO optimization","Bulk updates"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$overview$q$, $q$What is GatherUp?$q$, 2, ARRAY[$q$GatherUp is a reputation management platform that helps businesses and agencies collect, monitor, and respond to online reviews. It combines review generation via email and SMS, centralized monitoring across more than 100 review sites, and AI-generated reply suggestions in one dashboard.$q$, $q$The platform also includes fake review detection and dispute filing tools, listings syndication through its Listings Hub add-on, and a white-label Agency plan that lets marketing agencies resell reputation management services under their own brand.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', $q$who-its-for$q$, $q$Who GatherUp is for$q$, 2, ARRAY[$q$GatherUp suits small businesses managing a single location, multi-location brands that need centralized review reporting across sites, and digital agencies that want to offer white-labeled reputation management to their clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('cb4b68ba-b4d4-4c0f-8fd7-b849bda16445', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Grade.us ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Grade.us is a white-label review management platform built for marketing agencies to manage client reviews.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Grade.us lets agencies generate, monitor, and market client reviews under white-label branding, from $99/month with a 14-day trial.$q$,
  og_description = $q$Grade.us lets agencies generate, monitor, and market client reviews under white-label branding, from $99/month with a 14-day trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b1a03e2a-1f45-466c-a273-8c8ac39242e0';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b1a03e2a-1f45-466c-a273-8c8ac39242e0' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Automated Review Generation$q$, $q$Sends automated requests to prompt customers to leave reviews.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Multi-Platform Review Monitoring$q$, $q$Aggregates reviews from Google, Facebook, Yelp, and industry-specific sites into one dashboard.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Review Marketing Widgets$q$, $q$Tools to display and leverage collected reviews on client websites.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$White-Label Branding$q$, $q$Agencies can rebrand the entire dashboard with their own logo and domain.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Multi-Location Listings Management$q$, $q$Organizes and manages multiple business locations from one account.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Reporting & Analytics$q$, $q$Tracks review performance across multiple brands and locations for client reporting.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Purpose-built for agencies with white-label branding on the entire dashboard$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$14-day free trial with no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Reseller-friendly plan structure aimed at agency profit margins$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Aggregates reviews from major platforms plus industry-specific sites (legal, healthcare, real estate, automotive, hospitality, restaurants)$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$No AI features are mentioned on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Agency-tier pricing requires a custom quote$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Multi-location pricing is charged per location ($60/month each)$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Premium white-label add-on costs $440/year unless on the highest seat tier$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Is there a free trial?$q$, $q$Yes, Grade.us offers a free 14-day trial with access to 3 seats and most platform features, no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$How much does Grade.us cost?$q$, $q$The Small Business plan is $99/month for one location, Multi Location pricing is $60/month per location for 2-10 locations, and Agency pricing requires a custom quote.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Can agencies white-label Grade.us?$q$, $q$Yes, all plans include basic white-label branding, and a Premium White Label add-on ($440/year) adds a custom domain and SSL.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Who owns Grade.us?$q$, $q$Grade.us is a product of Traject.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Which review sites does Grade.us monitor?$q$, $q$It monitors major platforms like Google, Facebook, and Yelp, plus industry-specific sites for sectors such as legal, healthcare, real estate, automotive, and hospitality.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Agency review management reselling$q$, $q$An agency manages review generation and monitoring for many clients from one white-labeled dashboard.$q$, $q$Marketing and SEO agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Multi-location reputation reporting$q$, $q$A multi-location brand consolidates review performance reporting across all its locations.$q$, $q$Multi-location businesses$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Industry-specific review monitoring$q$, $q$A legal or healthcare practice monitors reviews on industry-specific platforms alongside Google and Facebook.$q$, $q$Legal, healthcare, and real estate practices$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Small Business$q$, $q$$99/month$q$, $q$monthly$q$, $q$["1 location","14-day free trial","Basic white-label branding"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Multi Location$q$, $q$$60/month per location$q$, $q$monthly$q$, $q$["2-10 locations, volume pricing up to 101+","20% discount on annual billing"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$Agency$q$, $q$Custom quote$q$, NULL, $q$["White-label reputation management software for clients"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$overview$q$, $q$What is Grade.us?$q$, 2, ARRAY[$q$Grade.us is a review management platform built specifically for marketing agencies. It automates review generation, aggregates monitoring from major review sites like Google, Facebook, and Yelp plus industry-specific platforms, and provides review marketing tools, all wrapped in a white-label dashboard.$q$, $q$The platform, owned by Traject, lets agencies apply their own branding across the entire client-facing dashboard, with an optional Premium White Label add-on for a fully custom domain and SSL certificate.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', $q$who-its-for$q$, $q$Who Grade.us is for$q$, 2, ARRAY[$q$Grade.us is designed for marketing and SEO agencies that manage review generation and reputation reporting for multiple clients, as well as multi-location businesses that need centralized review monitoring.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b1a03e2a-1f45-466c-a273-8c8ac39242e0', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── NiceJob ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$NiceJob automates review requests, referrals, and social proof marketing for local service businesses.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$75/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$London, Ontario, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$NiceJob helps local businesses get more Google reviews and referrals with AI-powered automation. Plans start at $75/month.$q$,
  og_description = $q$NiceJob helps local businesses get more Google reviews and referrals with AI-powered automation. Plans start at $75/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Automated Review Requests$q$, $q$Sends review invitations via email and SMS after customer interactions.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$AI-Powered Review Replies$q$, $q$Automatically generates responses to customer reviews.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Referral Automation$q$, $q$Invites past customers to refer new business (available on the Pro plan).$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Social Proof Widgets$q$, $q$Displays reviews and customer activity on the business website.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$NPS Surveys$q$, $q$Collects customer satisfaction feedback.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Website Builder (Sites)$q$, $q$Builds and hosts a conversion-optimized business website as an add-on service.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Booking Reminders (Repeats)$q$, $q$Automated reminders to encourage repeat bookings.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$AI-generated review reply automation$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$14-day free trial, no credit card required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Integrates with more than 1,000 business apps$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Backed by Paystone Inc., an established business software company$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$No long-term contracts required$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Referral automation and booking reminders are only available on the higher-priced Pro plan ($125/month)$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Website builder (Sites) carries an extra $199 setup fee$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Enterprise/franchise pricing is not public and requires custom quoting$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Does NiceJob offer a free trial?$q$, $q$Yes, a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$How much does NiceJob cost?$q$, $q$The Reviews plan starts at $75/month; the Pro plan, which adds referrals and booking reminders, is $125/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Does NiceJob use AI?$q$, $q$Yes, it includes AI-powered review reply generation to help businesses respond to customer reviews faster.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Where is NiceJob based?$q$, $q$NiceJob is headquartered in London, Ontario, Canada, and is part of Paystone Inc.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Can NiceJob build a website?$q$, $q$Yes, its Sites product builds a custom business website, available standalone at $99/month plus a $199 setup fee, or bundled with the Grow plan for $174/month plus setup.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Home services review generation$q$, $q$An HVAC or plumbing company automates review requests after each job to build a stronger online reputation.$q$, $q$Home services businesses$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Referral-driven growth$q$, $q$A local business on the Pro plan automates customer referral invitations alongside review requests.$q$, $q$Local service businesses seeking referral growth$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Website plus reputation bundle$q$, $q$A business without an existing site uses the Grow + Sites bundle to get both a new website and review automation.$q$, $q$Businesses needing a new website and reputation tools$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Reviews$q$, $q$$75/month$q$, $q$monthly$q$, $q$["Automated review requests","Review monitoring","AI-powered reply generation","Social proof widgets"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Pro$q$, $q$$125/month$q$, $q$monthly$q$, $q$["All Reviews features","Referral automation","Booking reminders","NPS surveys","Competitor SEO insights"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Grow + Sites Bundle$q$, $q$$174/month + $199 setup fee$q$, $q$monthly$q$, $q$["Grow plan features","Custom website design","Personal coaching","Call tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$Sites (standalone)$q$, $q$$99/month + $199 setup fee$q$, $q$monthly$q$, $q$["Custom website design","Mobile optimization","SSL certificate","Call tracking"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$overview$q$, $q$What is NiceJob?$q$, 2, ARRAY[$q$NiceJob is a reputation marketing platform for local service businesses that automates review requests, referral invitations, and social proof. It uses AI to help generate review replies and offers NPS surveys, booking reminders, and a website builder as part of its product suite.$q$, $q$Owned by Paystone Inc. and headquartered in London, Ontario, Canada, NiceJob is built for home services, professional services, health and wellness, hospitality, and multi-location franchise businesses.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', $q$who-its-for$q$, $q$Who NiceJob is for$q$, 2, ARRAY[$q$NiceJob is aimed at local service businesses such as HVAC, plumbing, and landscaping companies, as well as professional and hospitality businesses that want to automate review generation, referrals, and customer communication.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('1be3dfb4-c5d4-45dd-8fe4-1cf5db30d72d', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Broadly ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Broadly is an AI platform that automates lead capture, reputation management, and marketing for local service businesses.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$799/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Boca Raton, Florida$q$,
  languages = '{}',
  seo_meta_description = $q$Broadly bundles an AI receptionist, review management, and social posting for local service businesses at $799/month.$q$,
  og_description = $q$Broadly bundles an AI receptionist, review management, and social posting for local service businesses at $799/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '6724785a-7009-4bc5-a8a9-4314ca7e5d4f';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '6724785a-7009-4bc5-a8a9-4314ca7e5d4f' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$AI Receptionist$q$, $q$Captures leads and books appointments automatically via phone, chat, and text.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$AI Reputation Specialist$q$, $q$Automates review response and review request generation.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$AI Social Media Manager$q$, $q$Drafts and schedules social media content.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$AI Sales Assistant$q$, $q$Transcribes meetings and analyzes sales calls.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Local Listings Management$q$, $q$Syncs business information across 70+ directories.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Unified Messaging Inbox$q$, $q$Consolidates communications from multiple channels into one inbox.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Professional Website$q$, $q$A business website is built and launched as part of the package.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Bundles an AI receptionist, reputation, social, and sales tools into a single package$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$No long-term contract required$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Integrates with ServiceTitan, Jobber, Clio, and QuickBooks$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Includes a professional website built within 7 days$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$No setup fees or per-user charges according to the site$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Single flat-rate package ($799/month) with no lower-cost tier for smaller budgets$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Full pricing details and discounts require speaking with a sales representative$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Founding year and company size are not published on the site$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$How much does Broadly cost?$q$, $q$Broadly's AI Workforce Package is $799/month, billed month-to-month with no long-term contract.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$What does the AI Receptionist do?$q$, $q$It captures leads and books appointments automatically through phone calls, text messages, and web chat.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Does Broadly manage online reviews?$q$, $q$Yes, its AI Reputation Specialist automates review responses and sends review requests to customers.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Which business tools does Broadly integrate with?$q$, $q$Broadly integrates with ServiceTitan, Jobber, Clio, and Intuit QuickBooks, among others.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Where is Broadly headquartered?$q$, $q$Broadly is headquartered in Boca Raton, Florida.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Missed-call lead recovery$q$, $q$A home services contractor uses the AI Receptionist to capture and follow up with leads from missed calls.$q$, $q$Home services contractors (HVAC, plumbing, electrical)$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$Automated review generation and response$q$, $q$A dental or law practice automates review requests and AI-generated responses to build its online reputation.$q$, $q$Dental practices and law firms$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$All-in-one local marketing$q$, $q$A local business consolidates its website, listings, social posting, and reputation management under one AI-driven package.$q$, $q$Local service businesses wanting a single vendor for marketing$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$AI Workforce Package$q$, $q$$799/month$q$, $q$monthly$q$, $q$["AI Receptionist","AI Reputation Specialist","AI Social Media Manager","Professional website built within 7 days","Listings synced to 70+ directories","Unified messaging inbox"]$q$::jsonb, 0);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$overview$q$, $q$What is Broadly?$q$, 2, ARRAY[$q$Broadly is an AI-powered platform for local service businesses that combines an AI receptionist, review response automation, social media posting, and sales call analysis into a single monthly package. It is headquartered in Boca Raton, Florida.$q$, $q$The platform's AI Workforce Package costs $799/month and includes a built website, listings syndication to more than 70 directories, and integrations with field service and practice management tools like ServiceTitan, Jobber, Clio, and QuickBooks.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', $q$who-its-for$q$, $q$Who Broadly is for$q$, 2, ARRAY[$q$Broadly targets local service businesses such as HVAC companies, plumbers, electricians, auto repair shops, dental practices, and law firms that want to consolidate lead capture, reputation management, and marketing into one AI-driven package.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('6724785a-7009-4bc5-a8a9-4314ca7e5d4f', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── SOCi ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$SOCi is an AI marketing platform that deploys autonomous agents to manage local SEO, social, and reputation for multi-location brands.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$SOCi uses autonomous 'Genius Agents' to automate local SEO, social media, and reputation management for multi-location brands.$q$,
  og_description = $q$SOCi uses autonomous 'Genius Agents' to automate local SEO, social media, and reputation management for multi-location brands.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Genius Search Agent$q$, $q$Automates local SEO optimizations based on monthly data analysis.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Genius Social Agent$q$, $q$Automatically builds social content calendars and manages engagement.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Genius Reputation Agent$q$, $q$Generates brand-appropriate responses to customer reviews.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Local Pages$q$, $q$SEO-optimized landing pages for individual business locations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Boost & Ads$q$, $q$Auto-generates hyper-localized ad campaigns.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Chat$q$, $q$24/7 localized chatbots across multiple channels.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Locator$q$, $q$Searchable location finder pages for multi-location brands.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Autonomous 'Genius Agents' automate SEO, social, and reputation tasks rather than just assisting with them$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Reports having deployed 200,000+ local agents across 500+ enterprise brands$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Mobile app ('SOCi Go!') available for iOS and Android$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Covers search, social, reputation, ads, and chat in a single platform$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$No public pricing; requires requesting a demo$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Founding year, headquarters, and company size are not published on the site$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Positioned for enterprise multi-location brands, which may not suit small single-location businesses$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$What is SOCi?$q$, $q$SOCi is an AI-powered marketing platform for multi-location brands that uses autonomous 'Genius Agents' to automate local SEO, social media, reputation management, and paid ads.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Does SOCi offer public pricing?$q$, $q$No, SOCi's website does not list public pricing; businesses must request a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$What are SOCi's 'Genius Agents'?$q$, $q$They are AI agents branded for specific functions: Genius Search Agent for local SEO, Genius Social Agent for social content, and Genius Reputation Agent for review responses.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Is there a mobile app?$q$, $q$Yes, SOCi offers a mobile app called 'SOCi Go!' for iOS and Android.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Who uses SOCi?$q$, $q$SOCi is built for enterprise brands and franchises managing multiple locations across industries like restaurants, retail, financial services, healthcare, and property management.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Multi-location local SEO automation$q$, $q$A multi-location retail or restaurant brand uses the Genius Search Agent to automate local SEO optimizations across all locations.$q$, $q$Multi-location retail and restaurant brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Automated social content at scale$q$, $q$A franchise brand uses the Genius Social Agent to generate and publish localized social content across hundreds of location pages.$q$, $q$Franchise and multi-location brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$Automated review response$q$, $q$An enterprise brand uses the Genius Reputation Agent to generate on-brand responses to customer reviews at scale.$q$, $q$Enterprise brands managing high review volume$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$overview$q$, $q$What is SOCi?$q$, 2, ARRAY[$q$SOCi is an AI-powered marketing platform built for multi-location and franchise brands. It deploys autonomous 'Genius Agents' that handle local SEO, social media publishing, and review response without requiring manual execution for every location.$q$, $q$The platform also includes local landing pages, hyper-localized ad generation, 24/7 chat, and location-finder pages. SOCi reports deploying more than 200,000 local agents across over 500 enterprise brands.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', $q$who-its-for$q$, $q$Who SOCi is for$q$, 2, ARRAY[$q$SOCi is designed for enterprise brands and franchises managing multiple locations in industries such as restaurants, retail, financial services, healthcare, and property management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0b996e8b-f5b7-4d6c-bf61-a709cd1c82cb', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Yext ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Yext is an enterprise platform for managing brand visibility, listings, and reputation across search engines and AI search.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Yext manages brand data, listings, and reviews across search engines and AI platforms for enterprise brands with many locations.$q$,
  og_description = $q$Yext manages brand data, listings, and reviews across search engines and AI platforms for enterprise brands with many locations.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'e37c82e0-4240-4f11-9aae-4a179e6cd032';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'e37c82e0-4240-4f11-9aae-4a179e6cd032' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Scout$q$, $q$Monitors AI search visibility and tracks competitors in real time.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Knowledge Graph$q$, $q$Centralizes and manages brand data for search and AI experiences.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Listings$q$, $q$Manages location information across the web.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Reviews$q$, $q$Reputation management and rating optimization tools.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Pages$q$, $q$Search-optimized local landing pages.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Social$q$, $q$Local social media management.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Hearsay Social/Relate$q$, $q$Compliance-focused engagement tools for financial advisors.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Actively monitors and manages brand visibility in AI search platforms, not just traditional search$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Used by large enterprises including Samsung, FedEx, Domino's, and IHG Hotels according to the site$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Direct publisher integrations with Google Business Profile, Apple Business, Facebook, OpenAI, Bing, and TripAdvisor$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Dedicated mobile app (Scout by Yext) for iOS and Android$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Covers 4M+ locations worldwide per company claims$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$No public pricing; sign-up requires a demo request$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Platform is enterprise-focused, which may be more complex than needed for very small businesses$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Founding year, headquarters, and company size are not published on the page reviewed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$What does Yext do?$q$, $q$Yext is an enterprise platform that manages brand data, listings, reviews, and content distribution across search engines and AI platforms.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Does Yext monitor AI search visibility?$q$, $q$Yes, its Scout product monitors AI search visibility and tracks competitors in real time.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Is Yext pricing public?$q$, $q$No, Yext does not publish pricing; businesses must request a demo.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Which platforms does Yext integrate with?$q$, $q$Yext has direct integrations with Google Business Profile, Apple Business, Facebook, OpenAI, Bing, and TripAdvisor.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Is there a mobile app?$q$, $q$Yes, Scout by Yext is available for iOS and Android.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Multi-location brand data management$q$, $q$An enterprise brand with thousands of locations uses Yext's Knowledge Graph to keep location data consistent across the web.$q$, $q$Enterprise brands with many locations$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$AI search visibility monitoring$q$, $q$A brand uses Scout to track how it appears in AI-driven search results and monitor competitors.$q$, $q$Marketing teams tracking AI search presence$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$Financial advisor compliance engagement$q$, $q$A financial services firm uses Hearsay Social/Relate to manage compliant social engagement for individual advisors.$q$, $q$Financial services and insurance advisors$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$overview$q$, $q$What is Yext?$q$, 2, ARRAY[$q$Yext is an enterprise platform that helps brands manage their data, listings, reviews, and content across traditional search engines and AI-driven search platforms. Its Knowledge Graph centralizes brand data, while products like Scout monitor AI search visibility and competitors in real time.$q$, $q$The platform includes listings management, reputation management, local landing pages, social media management, and compliance-focused tools for financial advisors through its Hearsay Social/Relate products. Yext reports supporting brands managing more than 4 million locations worldwide.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', $q$who-its-for$q$, $q$Who Yext is for$q$, 2, ARRAY[$q$Yext is built for large enterprise brands managing many locations, particularly in financial services, healthcare, retail, food service, and hospitality.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('e37c82e0-4240-4f11-9aae-4a179e6cd032', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Uberall ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Uberall is a multi-location marketing platform for managing listings, reviews, and social presence across search and AI channels.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = 2013,
  company_size = NULL,
  headquarters = $q$Berlin, Germany$q$,
  languages = '{}',
  seo_meta_description = $q$Uberall manages listings, reviews, and local social presence for multi-location brands, founded in 2013 in Berlin.$q$,
  og_description = $q$Uberall manages listings, reviews, and local social presence for multi-location brands, founded in 2013 in Berlin.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'b9771ecf-9807-4fa4-832a-c7fb0c45e484' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Listings Management$q$, $q$Publishes and optimizes business listings across 150+ directories including Google, Apple, and voice search.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Geo Studio$q$, $q$AI-powered optimization tool for multi-location visibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Review Management$q$, $q$Monitors, responds to, and analyzes customer reviews across all locations.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Local Pages & Locator$q$, $q$SEO-optimized location pages for discovery.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Local Social$q$, $q$AI-generated social content publishing across Facebook, Instagram, LinkedIn, Google, and Apple.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$UB-I$q$, $q$An agentic AI product described as continuously monitoring and orchestrating location performance improvements.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Founded in 2013 and headquartered in Berlin, Germany, with a documented track record$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Listings sync across 150+ directories including Google, Apple Maps, and voice search$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Integrates with Shopify, Salesforce, Zendesk, Tableau, Google BigQuery, Google Ads, and Semrush$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Includes an agentic AI product (UB-I) for autonomous location performance monitoring$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$No public pricing; the three tiers (Show Up, Stand Out, Connect) require requesting a quote$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Additional add-ons (Reviews Plus, Analytics Plus, Collaborate Plus, Geo Studio, Social Ads) are priced separately$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Company size is not disclosed$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$When was Uberall founded?$q$, $q$Uberall was founded in 2013 by Florian Hübner and David Federhen.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Where is Uberall headquartered?$q$, $q$Uberall is headquartered in Berlin, Germany.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Is Uberall pricing public?$q$, $q$No, Uberall's three plans (Show Up, Stand Out, Connect) require requesting pricing directly.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$What does UB-I do?$q$, $q$UB-I is described as an agentic AI product that continuously monitors and orchestrates improvements to location performance.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Which directories does Uberall publish listings to?$q$, $q$Uberall publishes and optimizes listings across more than 150 directories, including Google, Apple, and voice search platforms.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Multi-directory listings sync$q$, $q$A retail chain publishes and keeps consistent business listings across 150+ directories from one dashboard.$q$, $q$Multi-location retail and QSR brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Cross-location review management$q$, $q$A hospitality brand monitors and responds to reviews across all its locations in one place.$q$, $q$Hospitality and automotive brands$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$Automated local social publishing$q$, $q$A multi-location brand uses Local Social to publish AI-generated content across Facebook, Instagram, and LinkedIn for each location.$q$, $q$Multi-location marketing teams$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$overview$q$, $q$What is Uberall?$q$, 2, ARRAY[$q$Uberall is a multi-location marketing platform, founded in 2013 and headquartered in Berlin, Germany, that helps brands manage their digital presence across search, maps, AI, and social channels. It publishes and optimizes listings across more than 150 directories.$q$, $q$The platform also includes review management, SEO-optimized local pages, AI-generated local social content, and UB-I, an agentic AI product that continuously monitors and orchestrates location performance improvements.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', $q$who-its-for$q$, $q$Who Uberall is for$q$, 2, ARRAY[$q$Uberall serves enterprise and mid-market brands with multiple locations, particularly in retail, quick-service restaurants, automotive, and hospitality.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('b9771ecf-9807-4fa4-832a-c7fb0c45e484', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Synup ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Synup is an all-in-one operations platform for agencies to manage client acquisition, listings, reviews, and marketing.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$79/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$New York, New York$q$,
  languages = '{}',
  seo_meta_description = $q$Synup helps agencies manage sales, listings, reviews, social, and SEO for clients with white-label tools, from $79/month.$q$,
  og_description = $q$Synup helps agencies manage sales, listings, reviews, social, and SEO for clients with white-label tools, from $79/month.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ad9d61a8-318e-41aa-b413-59187e3567de';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ad9d61a8-318e-41aa-b413-59187e3567de' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Agency Operations$q$, $q$Lead generation, sales pipeline management, task tracking, and invoicing.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Listings Management$q$, $q$Manages client business listings across locations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Review Management$q$, $q$Monitors and responds to client reviews, including AI-assisted responses.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Social Media Management$q$, $q$Schedules and publishes social content for clients.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$White-Labeling$q$, $q$Customizable branding and client portals.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Sales AI, Client AI, and Marketing AI$q$, $q$AI tools for prospecting, client data analysis, and content/review-response generation.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Transparent, published tiered pricing starting at $79/month (annual billing)$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Combines agency back-office operations (sales, invoicing) with client marketing delivery in one platform$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$White-label client portals and embedded marketing applications for reselling$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$AI tools span sales prospecting, client analytics, and marketing content/review responses$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Site reports 5,000+ partners using the platform$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Overage fees apply for extra team members ($5) and client accounts ($1.50) beyond plan limits$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Add-on modules (Listings, Reviews, Social, SEO) are priced per location/connection on top of base plans$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Higher tiers (Scale plan) cost $799-$999/month, a significant jump from the Startup tier$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$How much does Synup cost?$q$, $q$The Startup plan is $79/month billed annually (or $99/month billed monthly); the Agency plan is $199/month annually ($249 monthly); and the Scale plan is $799/month annually ($999 monthly).$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$What does the Startup plan include?$q$, $q$It supports up to 5 team members, 25 client accounts, 50 client users, and listings/reviews management for 25 locations.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Does Synup use AI?$q$, $q$Yes, Synup includes Sales AI for prospecting, Client AI for data analysis, and Marketing AI for content and review responses.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Where is Synup headquartered?$q$, $q$Synup's address is listed as 101 Avenue of the Americas, New York, NY.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Are there costs beyond the base plan?$q$, $q$Yes, add-on products like Listings, Reviews, Social, and SEO are priced separately per location or connection, and overage fees apply for extra team members and client accounts.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Agency client acquisition and delivery$q$, $q$An SEO or web design agency manages its own sales pipeline while delivering listings, reviews, and SEO services to clients from one platform.$q$, $q$SEO and web design agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$White-label client portals$q$, $q$An agency gives clients access to a branded portal showing their listings and review performance.$q$, $q$Agencies reselling marketing services$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Scaling multi-location client management$q$, $q$A larger agency on the Scale plan manages up to 500 client locations across listings, reviews, and SEO.$q$, $q$Larger agencies with many client locations$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Startup$q$, $q$$79/month (annual) / $99/month (monthly)$q$, $q$annual$q$, $q$["Up to 5 team members","25 client accounts, 50 client users","Listings & Reviews for 25 locations"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Agency$q$, $q$$199/month (annual) / $249/month (monthly)$q$, $q$annual$q$, $q$["Up to 10 team members","100 client accounts, unlimited client users","Listings & Reviews for 100 locations"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$Scale$q$, $q$$799/month (annual) / $999/month (monthly)$q$, $q$annual$q$, $q$["Up to 50 team members","500 client accounts, unlimited client users","Listings & Reviews for 500 locations"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$overview$q$, $q$What is Synup?$q$, 2, ARRAY[$q$Synup is an operations platform for agencies that combines sales pipeline management, invoicing, and task tracking with client-facing marketing tools like listings, reviews, social media, and SEO management.$q$, $q$The platform is headquartered in New York and offers white-label client portals, embedded marketing applications, and AI tools branded as Sales AI, Client AI, and Marketing AI. Pricing is tiered by team size and number of client accounts, starting with the Startup plan at $79/month billed annually.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', $q$who-its-for$q$, $q$Who Synup is for$q$, 2, ARRAY[$q$Synup is built for agencies, including SEO agencies, web design agencies, and franchisees, that need to run their own sales operations while delivering listings, reviews, and marketing services to multiple clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ad9d61a8-318e-41aa-b413-59187e3567de', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── BrightLocal ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$BrightLocal is a local SEO platform for tracking rankings, managing listings, and monitoring reviews.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$31/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$BrightLocal tracks local search rankings, manages business listings, and monitors reviews. Plans start at $31/month, plus free tools.$q$,
  og_description = $q$BrightLocal tracks local search rankings, manages business listings, and monitors reviews. Plans start at $31/month, plus free tools.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '05db3079-f16d-4821-84d1-93a68b767ea8';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '05db3079-f16d-4821-84d1-93a68b767ea8' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Local Rank Tracking$q$, $q$Monitors search rankings at the neighborhood level via a Local Search Grid.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Listings Management$q$, $q$Keeps business information consistent across directories.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Review Monitoring$q$, $q$Tracks and manages customer reviews across platforms.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$AI Insights$q$, $q$Turns local SEO data into prioritized action recommendations.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Citation Builder$q$, $q$Manually builds and cleans up citations to improve listing consistency.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Rank Fluctuation Monitor$q$, $q$Alerts users to search algorithm changes affecting rankings.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$API & MCP Server$q$, $q$Allows third-party and AI tool integration with BrightLocal data.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Transparent public pricing starting at $31/month for the All-in-One Platform$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Free tools available without registration$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Site reports 15,000+ active customers$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Offers an MCP Server for integration with AI tools, in addition to a standard API$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Managed SEO services available for businesses wanting done-for-you work$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Managed SEO Services start at $1,299/month, a significant jump from the self-serve platform$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Citation building is billed per citation ($2 each) on top of the platform subscription$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Exact founding year and headquarters city are not clearly stated on the page$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$How much does BrightLocal cost?$q$, $q$The All-in-One Platform starts at $31/month; Build Citations starts at $2 per citation; Managed SEO Services start at $1,299/month.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Does BrightLocal offer free tools?$q$, $q$Yes, free tools are available with no registration required, alongside its paid platform.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$What is AI Insights?$q$, $q$AI Insights is a BrightLocal feature that turns local SEO data into clear, prioritized recommended actions.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Can I track rankings at a neighborhood level?$q$, $q$Yes, BrightLocal's Local Search Grid tracks rankings across specific geographic points to show neighborhood-level visibility.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Does BrightLocal support API access?$q$, $q$Yes, BrightLocal offers API solutions and an MCP Server for integrating its data with AI tools.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Local rank tracking for agencies$q$, $q$An SEO agency tracks neighborhood-level rankings for multiple clients using the Local Search Grid.$q$, $q$SEO agencies and consultants$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Listings consistency management$q$, $q$A local business keeps its name, address, and phone number consistent across directories using the listings tools.$q$, $q$Local businesses managing citations$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Managed local SEO$q$, $q$A business without an in-house SEO team hires BrightLocal's Managed SEO Services for done-for-you local optimization.$q$, $q$Businesses needing outsourced local SEO$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$All-in-One Platform$q$, $q$from $31/month$q$, $q$monthly$q$, $q$["Track local rankings","Manage listings","Monitor reviews","AI Insights"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Build Citations$q$, $q$from $2 per citation$q$, NULL, $q$["Manual citation building and cleanup"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$Managed SEO Services$q$, $q$from $1,299/month$q$, $q$monthly$q$, $q$["Done-for-you local SEO service"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$overview$q$, $q$What is BrightLocal?$q$, 2, ARRAY[$q$BrightLocal is a local search optimization platform that helps businesses and agencies track search rankings, manage business listings, and monitor online reviews. Its Local Search Grid shows neighborhood-level ranking visibility, and its AI Insights feature turns local SEO data into prioritized recommended actions.$q$, $q$The platform is offered as a self-serve All-in-One Platform starting at $31/month, alongside a la carte citation building and Managed SEO Services for businesses that want done-for-you work. BrightLocal also provides an API and MCP Server for integrating its data with other tools, including AI tools.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', $q$who-its-for$q$, $q$Who BrightLocal is for$q$, 2, ARRAY[$q$BrightLocal serves local businesses seeking better local search visibility and digital agencies or SEO consultants managing local SEO for multiple clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('05db3079-f16d-4821-84d1-93a68b767ea8', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Whitespark ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Whitespark provides local SEO software and services for Google Business Profile management, rank tracking, and citations.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$1/month per location$q$,
  founded_year = 2005,
  company_size = NULL,
  headquarters = $q$Edmonton, Alberta, Canada$q$,
  languages = '{}',
  seo_meta_description = $q$Whitespark offers local SEO tools and services: GBP management, rank tracking, citations, and reputation. Founded 2005 in Edmonton.$q$,
  og_description = $q$Whitespark offers local SEO tools and services: GBP management, rank tracking, citations, and reputation. Founded 2005 in Edmonton.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'ab7eacb8-b8b0-4ec2-9930-7d165f43051c';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'ab7eacb8-b8b0-4ec2-9930-7d165f43051c' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Platform$q$, $q$Manages Google Business Profiles, prevents unwanted edits, and supports bulk location edits.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Ranking Grids$q$, $q$Monitors local rankings across up to 225 geographical points.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Rank Tracker$q$, $q$Tracks local and organic search performance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Citation Finder$q$, $q$Identifies citation opportunities.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Reputation Builder$q$, $q$An automated review management platform.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Free Tools$q$, $q$Includes a Review Checker, Google Review Link Generator, Free Local Ranking Checker, and Freshness Distance Calculator.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Done-for-You Services$q$, $q$SEO Services, Listings Service, GBP Reinstatement Service, and a Yext Replacement Service.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Founded in 2005 in Edmonton, Alberta, Canada, with a long operating history in local SEO$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Site reports 150,000+ customers, including enterprises and established brands$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Offers several standalone free tools alongside paid software$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Wide range of point solutions (rank tracking, citations, GBP management, reputation) available a la carte$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Platform starts as low as $1/month per location$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$No AI capabilities are mentioned on the site$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Product line is split across many separate tools and pricing pages, which can make total cost less clear$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Professional services pricing spans a wide range ($499-$1,999/month for SEO Services), requiring a custom quote for exact cost$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$When was Whitespark founded?$q$, $q$Whitespark was founded in 2005 in Edmonton, Alberta, Canada.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$How much does Whitespark cost?$q$, $q$Pricing varies by product: Local Platform starts at $1/month per location, Local Ranking Grids from $10/month, Local Rank Tracker from $14-$200/month, and Local Citation Finder from $33-$149/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Does Whitespark offer free tools?$q$, $q$Yes, it offers free tools including a Review Checker, Google Review Link Generator, Free Local Ranking Checker, and Freshness Distance Calculator.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Does Whitespark manage Google Business Profiles?$q$, $q$Yes, its Local Platform product is built to manage Google Business Profiles, prevent unwanted updates, and support bulk edits.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Does Whitespark offer done-for-you SEO services?$q$, $q$Yes, its SEO Services range from $499-$1,999/month, and it also offers Listings, GBP Reinstatement, and Yext Replacement services.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local rank tracking$q$, $q$An agency uses the Local Rank Tracker and Local Ranking Grids to monitor client rankings across up to 225 geographic points.$q$, $q$SEO agencies and freelancers$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Google Business Profile management$q$, $q$A multi-location business uses the Local Platform to prevent unwanted GBP edits and make bulk updates across locations.$q$, $q$Multi-location enterprises$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Citation building and cleanup$q$, $q$A small business uses the Local Citation Finder and Listings Service to identify and fix inconsistent citations.$q$, $q$Small businesses and freelancers doing local SEO$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Done-for-you local SEO$q$, $q$A business without in-house SEO expertise hires Whitespark's SEO Services for full-service local optimization.$q$, $q$Businesses needing outsourced local SEO$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Platform$q$, $q$$1/month per location$q$, $q$monthly$q$, $q$["Manage Google Business Profiles","Prevent unwanted updates","Bulk location edits"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Ranking Grids$q$, $q$from $10/month$q$, $q$monthly$q$, $q$["Monitor rankings across up to 225 geographical points"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Rank Tracker$q$, $q$$14-$200/month$q$, $q$monthly$q$, $q$["Local and organic search performance tracking"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Local Citation Finder$q$, $q$$33-$149/month$q$, $q$monthly$q$, $q$["Citation opportunity identification and tracking"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$Reputation Builder$q$, $q$$79/month per location$q$, $q$monthly$q$, $q$["Automated review management"]$q$::jsonb, 4);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$SEO Services$q$, $q$$499-$1,999/month$q$, $q$monthly$q$, $q$["Done-for-you SEO service"]$q$::jsonb, 5);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$overview$q$, $q$What is Whitespark?$q$, 2, ARRAY[$q$Whitespark is a local SEO company, founded in 2005 in Edmonton, Alberta, Canada, that offers both software tools and professional services. Its software includes Google Business Profile management (Local Platform), rank tracking (Local Rank Tracker and Local Ranking Grids), citation discovery (Local Citation Finder), and automated review management (Reputation Builder).$q$, $q$Alongside its paid tools, Whitespark offers several free tools, including a Review Checker and a Google Review Link Generator, plus done-for-you services such as SEO Services, a Listings Service, GBP Reinstatement, and a Yext Replacement Service.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', $q$who-its-for$q$, $q$Who Whitespark is for$q$, 2, ARRAY[$q$Whitespark serves small businesses, agencies, freelancers, and multi-location enterprises doing local SEO, offering both self-serve software and full-service options depending on how much hands-on support they need.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('ab7eacb8-b8b0-4ec2-9930-7d165f43051c', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Local Falcon ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Local Falcon tracks Google Maps rankings and AI visibility across ChatGPT, Gemini and AI Overviews using geo-grid scans.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$24.99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Local Falcon: geo-grid rank tracking for Google Maps plus AI visibility monitoring across ChatGPT, Gemini and AI Overviews.$q$,
  og_description = $q$Local Falcon: geo-grid rank tracking for Google Maps plus AI visibility monitoring across ChatGPT, Gemini and AI Overviews.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'f3bfd847-c715-4e81-938c-aaa0b4445e79' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Local Rank Tracking$q$, $q$Geo-grid scans measure Google Business Profile and Apple Maps rankings on a grid from 3x3 up to 21x21 points.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$AI Visibility Tracking$q$, $q$Monitors how a brand appears in answers from ChatGPT, Google AI Overviews, Gemini, Grok, and AI Mode.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Falcon AI$q$, $q$Generates AI-written performance insights and optimization recommendations from scan data, at 25 credits per report.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Falcon Agent$q$, $q$Automates Google Business Profile tasks including review responses and post scheduling; included on the Premium plan.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Falcon Guard$q$, $q$Monitors critical Google Business Profile fields to flag unauthorized changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Reviews Analysis$q$, $q$AI-powered sentiment analysis of customer reviews.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Local Keyword Research$q$, $q$Identifies keywords relevant to both traditional local search and AI-driven search.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Campaign Reports$q$, $q$Schedules recurring visibility tracking across multiple business locations with CSV/PDF export.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Combines Google Maps geo-grid rank tracking with AI visibility tracking across ChatGPT, Gemini, and Google AI Overviews.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$New accounts get 100 free credits with no credit card required.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Integrates with Zapier, n8n, Slack, and Looker Studio, plus an API and MCP server on Basic plans and above.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Grid size is adjustable from 3x3 to 21x21 points for granular visibility.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$White-label reporting is available on the Premium plan for agencies.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Credit-based pricing can make costs harder to predict than flat-rate plans.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Falcon AI analysis and API access consume additional credits or require higher-tier plans.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Overage credits cost $0.05 each once a plan's monthly allotment is used.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Enterprise pricing isn't published and starts around $499/month.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Does Local Falcon offer a free trial?$q$, $q$New accounts receive 100 free credits with no credit card required, which can be used to test scans before subscribing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$What plans does Local Falcon offer?$q$, $q$Four standard tiers: Starter ($24.99/month), Basic ($49.99/month), Pro ($99.99/month), and Premium ($199.99/month), plus custom Enterprise packages starting around $499/month.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Can Local Falcon track AI search visibility, not just Google Maps?$q$, $q$Yes, its AI Visibility Tracking feature monitors how a business appears in ChatGPT, Google AI Overviews, Gemini, Grok, and AI Mode.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Does Local Falcon integrate with other tools?$q$, $q$Basic plans and above include API access, an MCP server, a Looker Studio connector, and Zapier/n8n integrations.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$What happens when I run out of credits?$q$, $q$Additional usage is billed at $0.05 per credit as a pay-as-you-go overage.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Multi-location rank tracking$q$, $q$Track Google Maps and Apple Maps rankings across many locations using geo-grid scans.$q$, $q$Multi-location businesses and franchises$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$AI search visibility monitoring$q$, $q$Monitor how a brand is represented in ChatGPT, Gemini, and Google AI Overviews responses.$q$, $q$Brands managing AI search presence$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$White-label client reporting$q$, $q$Generate white-label rank and visibility reports for clients on the Premium plan.$q$, $q$Local SEO agencies and consultants$q$, 2);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Automated GBP management$q$, $q$Use Falcon Agent to automate review responses and post scheduling for Google Business Profiles.$q$, $q$Businesses wanting hands-off GBP upkeep$q$, 3);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Starter$q$, $q$$24.99/month$q$, $q$monthly$q$, $q$["7,500 credits","Local rank tracking","AI visibility tracking","Keyword research","CSV/PDF export"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Basic$q$, $q$$49.99/month$q$, $q$monthly$q$, $q$["15,150 credits","Looker Studio connector","Zapier & n8n integrations","API access","MCP server"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Pro$q$, $q$$99.99/month$q$, $q$monthly$q$, $q$["31,250 credits","All Basic features"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Premium$q$, $q$$199.99/month$q$, $q$monthly$q$, $q$["63,150 credits","White-label reports","Falcon Agent automation"]$q$::jsonb, 3);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$Enterprise$q$, $q$Starting around $499/month$q$, NULL, $q$["Custom volume and features"]$q$::jsonb, 4);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$overview$q$, $q$What is Local Falcon?$q$, 2, ARRAY[$q$Local Falcon is an agentic AI search and local SEO platform that tracks how a business ranks on Google Maps and Apple Maps, and how it is represented by AI answer engines like ChatGPT, Gemini, and Google AI Overviews.$q$, $q$The platform runs geo-grid scans - arrays of simulated searches from a grid of points around a location - to visualize where a business ranks across a geographic area, alongside Falcon AI, which turns scan data into written optimization recommendations.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', $q$who-its-for$q$, $q$Who Local Falcon is for$q$, 2, ARRAY[$q$Local Falcon is built for local SEO agencies, multi-location brands, and local business owners who need to track Google Maps rankings and how they show up in AI-generated search answers.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('f3bfd847-c715-4e81-938c-aaa0b4445e79', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Places Scout ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Places Scout is a local SEO platform for rank tracking, GBP monitoring, reputation, and citation analysis with 400+ data points.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Places Scout: local SEO software for rank tracking, Google Business Profile monitoring, reputation, and citation analysis.$q$,
  og_description = $q$Places Scout: local SEO software for rank tracking, Google Business Profile monitoring, reputation, and citation analysis.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '48120309-810d-426d-85b1-0cc890be92d9';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '48120309-810d-426d-85b1-0cc890be92d9' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Search Performance$q$, $q$Tracks keyword rankings against named competitors.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Geo-Matrix$q$, $q$Visualizes local rankings geographically across a map grid.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$GBP Radar$q$, $q$Monitors Google Business Profile changes and status.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Reputation Monitoring$q$, $q$Tracks reviews across more than 30 review sites.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Citation Intel$q$, $q$Discovers business mentions and citations across the internet.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Listing Audit$q$, $q$Checks NAP (name, address, phone) consistency across listings.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Modular pricing lets clients pay only for the tools they use.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Analyzes over 400 data points per business.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Geo-Matrix provides a geographic view of ranking performance across a location grid.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Covers reputation monitoring across 30+ review sites in addition to rank tracking.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$No pricing is published; buyers must request a demo or custom quote.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$No free trial is advertised on the site.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Public information about integrations, supported platforms, and company details is limited.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$How is Places Scout priced?$q$, $q$It uses custom, modular packages so clients "pay for only the tools you use"; pricing isn't published and requires contacting the company.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Does Places Scout offer a free trial?$q$, $q$No free trial is advertised; prospective customers are directed to request a demo.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$What does Geo-Matrix do?$q$, $q$Geo-Matrix visualizes local search rankings across a geographic grid so users can see performance by location.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Can Places Scout monitor online reviews?$q$, $q$Yes, its Reputation Monitoring feature tracks reviews across more than 30 review sites.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Local rank tracking against competitors$q$, $q$Track keyword rankings against named competitors using the Search Performance tool.$q$, $q$Local SEO professionals$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Multi-location reputation monitoring$q$, $q$Monitor reviews across 30+ sites for businesses with multiple locations.$q$, $q$Multi-location brands and agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$Listing consistency audits$q$, $q$Audit NAP consistency across business listings using the Listing Audit tool.$q$, $q$Agencies managing client listings$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$overview$q$, $q$What is Places Scout?$q$, 2, ARRAY[$q$Places Scout is a local SEO platform that provides automated analysis across more than 400 data points for a business, covering rank tracking, Google Business Profile monitoring, reputation tracking, and citation discovery.$q$, $q$Rather than a single fixed subscription, Places Scout uses a modular pricing approach so clients can pay only for the specific tools - such as Search Performance, Geo-Matrix, or Reputation Monitoring - that they need.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', $q$who-its-for$q$, $q$Who Places Scout is for$q$, 2, ARRAY[$q$Places Scout targets marketing agencies and enterprise brands with multiple locations that need rank tracking, listing audits, and reputation monitoring in one platform.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('48120309-810d-426d-85b1-0cc890be92d9', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── GeoRanker ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$GeoRanker offers SERP, rank-tracking, and keyword data APIs for local search across Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$GeoRanker: SERP API and local rank tracking with keyword data across Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$,
  og_description = $q$GeoRanker: SERP API and local rank tracking with keyword data across Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5f976254-fda1-4e80-a22f-8c5674b5c9b6' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Rank Tracker API$q$, $q$Tracks local keyword rankings programmatically via API.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$SERP API$q$, $q$Delivers unlimited paid and organic SERP data across Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Keywords API$q$, $q$Provides search volume and competition data for keywords.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Merchant API$q$, $q$Retrieves shopping and product result data.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Competitive Intelligence$q$, $q$Tools for analyzing competitor search performance.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Keyword Research & Density Analysis$q$, $q$Analyzes keyword competition and on-page density.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Voice Search Data Extraction$q$, $q$Extracts data related to voice search queries.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Google Ads Audit$q$, $q$Audits Google Ads campaigns for performance issues.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Supports SERP data across six search engines: Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$API-first design suited to developers who need custom scraping or crawling at scale.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Tiered plans scale from Professionals to Enterprise with more campaigns, keywords, and crawls.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$7-day free trial available before any charge is made.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$The free trial requires a credit card up front.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Agencies and Enterprise plans cost $249-$490/month, which may exceed small-business budgets.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Founding year, headquarters, and company size aren't disclosed on the site.$q$, 2);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$AI capabilities aren't explicitly described.$q$, 3);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Does GeoRanker offer a free trial?$q$, $q$Yes, a 7-day free trial is available; a credit card is required but no charge occurs until the trial ends, with a two-day reminder before billing.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$What search engines does GeoRanker cover?$q$, $q$Its SERP API covers Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$What are GeoRanker's pricing tiers?$q$, $q$Professionals ($99/month), Agencies ($249/month), and Enterprises ($490/month), each with increasing campaign, keyword, and crawl limits.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Does GeoRanker integrate with other tools?$q$, $q$Google Sheets integration is available on the Agencies and Enterprise plans.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Local rank tracking via API$q$, $q$Pull local keyword ranking data programmatically using the Rank Tracker API.$q$, $q$Developers and SEO agencies$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Large-scale SERP data collection$q$, $q$Retrieve unlimited paid and organic SERP data across six search engines.$q$, $q$SEO tool builders and data teams$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Competitive keyword research$q$, $q$Analyze keyword competition and search volume with the Keywords API.$q$, $q$SEO professionals and agencies$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Professionals$q$, $q$$99/month$q$, $q$monthly$q$, $q$["5 campaigns","1,000 keywords","10,000 crawls"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Agencies$q$, $q$$249/month$q$, $q$monthly$q$, $q$["10 campaigns","2,000 keywords","50,000 crawls","Google Sheets integration"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$Enterprises$q$, $q$$490/month$q$, $q$monthly$q$, $q$["50 campaigns","10,000 keywords","100,000 crawls","Google Sheets integration"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$overview$q$, $q$What is GeoRanker?$q$, 2, ARRAY[$q$GeoRanker is an SEO data platform that provides unlimited paid and organic SERP data via an API, along with custom scraping and crawling services and local rank-tracking tools.$q$, $q$Its API suite covers rank tracking, keyword data, and merchant/shopping results across six search engines, including Google, Bing, Baidu, YouTube, Yahoo, and Naver.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', $q$who-its-for$q$, $q$Who GeoRanker is for$q$, 2, ARRAY[$q$GeoRanker serves SEO agencies, developers, and enterprises that need large-scale search data extraction and local rank tracking through an API rather than only a dashboard.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', '96595ec7-e449-4fd5-803d-e73ba922c0ca') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5f976254-fda1-4e80-a22f-8c5674b5c9b6', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Localo ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Localo automates Google Business Profile tracking, reviews, citations, and content for local SEO agencies and businesses.$q$,
  pricing_model = $q$Free Trial$q$,
  starting_price = $q$$39/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Wroclaw, Poland$q$,
  languages = ARRAY[$q$Polish$q$, $q$English$q$, $q$German$q$, $q$French$q$, $q$Spanish$q$, $q$Portuguese (Brazil)$q$]::text[],
  seo_meta_description = $q$Localo: automate Google Business Profile tracking, reviews, citations, and content, with a 14-day free trial.$q$,
  og_description = $q$Localo: automate Google Business Profile tracking, reviews, citations, and content, with a 14-day free trial.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '41237a9a-e783-4b00-96f5-d87ac34a53d1';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '41237a9a-e783-4b00-96f5-d87ac34a53d1' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Tracking$q$, $q$Monitors Google Business Profile rankings for selected keywords.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Audit$q$, $q$Identifies and flags issues affecting local visibility.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Content Publisher$q$, $q$Creates and schedules Google Posts with AI assistance.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Review Manager$q$, $q$Automates Google review collection and response management.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Citations Manager$q$, $q$Manages directory listings across multiple platforms.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Website Builder$q$, $q$Generates optimized local business websites using GBP data.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Protection$q$, $q$Safeguards business profile information from unauthorized edits.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$AI Agent$q$, $q$Chat-based insights about business performance and market trends, available on the Pro plan.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Covers GBP tracking, reviews, citations, content, and website generation in one platform.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Supports six languages, including Polish, English, German, French, Spanish, and Brazilian Portuguese.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Pro plan includes a dedicated account manager and local SEO training.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$30-day money-back guarantee on paid plans.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Advanced features like the AI Agent, Smart Tasks, and competitor tracking are limited to the Pro plan and above.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Enterprise pricing is custom and not published.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$The company's founding year isn't disclosed.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Does Localo offer a free trial?$q$, $q$Yes, a 14-day free trial with no credit card required.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$What does the Single Business plan cost?$q$, $q$$39/month when billed annually.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$What's included in the Pro plan?$q$, $q$Up to 60 active profiles, 30 optimization seats, AI Agent, Smart Tasks, competitor tracking, citations manager, audit, and team/client access, at $149/month billed annually.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Where is Localo based?$q$, $q$Localo's office is in Wroclaw, Poland.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$What languages does Localo support?$q$, $q$Polish, English, German, French, Spanish, and Brazilian Portuguese.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Single-location GBP management$q$, $q$Track rankings, manage reviews, and publish content for one Google Business Profile.$q$, $q$Small local business owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Agency multi-client management$q$, $q$Manage up to 60 client profiles with team seats, white-label reports, and an AI Agent.$q$, $q$Local SEO agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Automated review response$q$, $q$Collect and respond to Google reviews automatically.$q$, $q$Businesses wanting hands-off review management$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Single Business$q$, $q$$39/month$q$, $q$annual$q$, $q$["1 Google Business Profile","1 optimization seat","Tracking, reviews, content publisher, website builder, schema generator, protection, reports"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Pro$q$, $q$$149/month$q$, $q$annual$q$, $q$["Up to 60 active profiles","30 optimization seats","AI Agent","Smart Tasks","Competitor tracking","Citations manager","Dedicated account manager"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$Enterprise$q$, $q$Custom$q$, NULL, $q$["Custom profile and seat limits","Priority support"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$overview$q$, $q$What is Localo?$q$, 2, ARRAY[$q$Localo is a local SEO platform that automates Google Business Profile optimization, ranking tracking, review management, and citation building for local search visibility.$q$, $q$The platform also includes a website builder that generates local business websites from Google Business Profile data, and an AI Agent that answers questions about performance and market trends on the Pro plan.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', $q$who-its-for$q$, $q$Who Localo is for$q$, 2, ARRAY[$q$Localo is aimed at local SEO agencies, freelance SEO specialists, and local business owners who want to automate day-to-day Google Business Profile management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('41237a9a-e783-4b00-96f5-d87ac34a53d1', '610c2598-d057-4727-bf3b-e907b0daed7f') ON CONFLICT DO NOTHING;

-- ── Grid My Business ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Grid My Business is an AI-powered local SEO platform for geo-grid rank tracking and Google Business Profile automation.$q$,
  pricing_model = $q$Freemium$q$,
  starting_price = $q$$24/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Grid My Business: free geo-grid rank tracking plus AI-powered GBP management, reviews, and post automation.$q$,
  og_description = $q$Grid My Business: free geo-grid rank tracking plus AI-powered GBP management, reviews, and post automation.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'db5079b7-d737-4eb2-99fe-040725cc7508';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'db5079b7-d737-4eb2-99fe-040725cc7508' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Local Rank Tracking$q$, $q$Continuously monitors local map rankings every 3 days.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Geo-Grid Mapping$q$, $q$Flexible pin positioning to track rankings across specific locations.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$GBP Management$q$, $q$Profile optimization, citation tracking, and NAP distribution.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$AI Agents$q$, $q$Automates review responses, post creation, and ranking optimization.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Competitor Analysis$q$, $q$Monitors competitor performance and GBP changes.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$White-Label Reporting$q$, $q$Client-ready reports with custom branding.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$MCP Server Integration$q$, $q$Connects AI tools like Claude Desktop and Cursor for live data access.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Free Starter plan with 250 scan credits and 2 profiles at no cost.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Paid plans start at $24/month billed annually for the Growth tier.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Claims support for 195 countries and 127 languages.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Annual billing gives 2 months free versus monthly pricing.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$30-day money-back guarantee on paid plans.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$White-label reporting and full AI Agent features require paid tiers above Starter.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Founding year, headquarters, and company size aren't disclosed.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$The claimed 98.7% ranking accuracy rate isn't independently verifiable from the site alone.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Is there a free plan?$q$, $q$Yes, the Starter plan is free and includes 250 scan credits and 2 profiles.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$What does the Growth plan cost?$q$, $q$$24/month billed annually ($29/month if paid monthly), or $290/year.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$How often are rankings tracked?$q$, $q$Local map rankings are monitored every 3 days.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Does Grid My Business integrate with AI tools?$q$, $q$Yes, it offers an MCP server integration to connect tools like Claude Desktop, Claude Code, Codex, and Cursor.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Free local rank tracking$q$, $q$Start tracking Google Maps rankings for up to 2 business profiles at no cost.$q$, $q$Small businesses testing local SEO tools$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Multi-location scaling$q$, $q$Track and optimize rankings across many locations with paid plans.$q$, $q$Multi-location businesses and agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Automated review and post management$q$, $q$Use AI Agents to auto-respond to reviews and generate Google posts.$q$, $q$Businesses wanting automated GBP upkeep$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Starter$q$, $q$Free$q$, NULL, $q$["250 scan credits","2 profiles"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Growth$q$, $q$$24/month$q$, $q$annual$q$, $q$["$29/month if paid monthly","$290/year"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Scale$q$, $q$$58/month$q$, $q$annual$q$, $q$["$69/month if paid monthly","$690/year"]$q$::jsonb, 2);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$Dominate$q$, $q$$74/month$q$, $q$annual$q$, $q$["$89/month if paid monthly","$890/year"]$q$::jsonb, 3);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$overview$q$, $q$What is Grid My Business?$q$, 2, ARRAY[$q$Grid My Business is an AI-powered local SEO platform that tracks local map rankings using geo-grid scans and helps optimize Google Business Profiles.$q$, $q$It includes AI Agents that automate review responses, post creation, and ranking optimization, plus an MCP server integration for connecting tools like Claude Desktop and Cursor to live ranking data.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', $q$who-its-for$q$, $q$Who Grid My Business is for$q$, 2, ARRAY[$q$Grid My Business targets local SEO agencies, consultants, and small to enterprise multi-location businesses that want to track Google Maps rankings and automate GBP upkeep, starting from a free tier.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', 'd5f794d8-1509-49c9-ac15-6834dce260e9') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('db5079b7-d737-4eb2-99fe-040725cc7508', '326f20ae-646d-484a-96b8-335f75262ea9') ON CONFLICT DO NOTHING;

-- ── Merchynt ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Merchynt is an AI platform that automates Google Business Profile optimization, review management, and citations.$q$,
  pricing_model = $q$Paid$q$,
  starting_price = $q$$99/month$q$,
  founded_year = NULL,
  company_size = NULL,
  headquarters = $q$Santa Monica, California, USA$q$,
  languages = '{}',
  seo_meta_description = $q$Merchynt: AI automation for Google Business Profile optimization, reviews, and citations, from $99/month per business.$q$,
  og_description = $q$Merchynt: AI automation for Google Business Profile optimization, reviews, and citations, from $99/month per business.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '3b0618a9-c067-473b-869a-3d9864cb6eda';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '3b0618a9-c067-473b-869a-3d9864cb6eda' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Paige AI Assistant$q$, $q$Analyzes competitor profiles and automatically optimizes a Google Business Profile.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Automated Posting$q$, $q$Creates keyword-rich Google Posts automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Image & Video Optimization$q$, $q$Optimizes and uploads images and videos to a GBP.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Review Management$q$, $q$Manages reviews, including SMS review requests.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Citation Management$q$, $q$Manages citations across online directories as an add-on.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Multi-Channel Optimization$q$, $q$Targets visibility on YouTube, social media, ChatGPT, and Gemini.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$ProfilePro Chrome Extension$q$, $q$A free Chrome extension for auditing a Google Business Profile.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Paige AI assistant continuously analyzes competitor profiles to apply optimization strategies automatically.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Integrates with Zapier, Make, n8n, and webhooks, including Twilio for SMS.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Agencies get 50% discounts on the citation and reviews add-ons.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Offers a free Chrome extension (ProfilePro) and audit tools before purchase.$q$, 3);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Headquartered in Santa Monica, California, with public contact details.$q$, 4);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$The core Paige plan starts at $99/month per business, plus separate paid add-ons for citations ($40/month) and reviews ($50/month).$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$No ongoing free plan; only a low-cost trial is offered to new users.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Company size and founding year aren't disclosed.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$How much does Merchynt cost?$q$, $q$The Paige plan starts at $99/month per business, with citation software ($40/month) and reviews software ($50/month) available as add-ons.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Does Merchynt offer a free trial?$q$, $q$It offers a low-cost trial for new users rather than a free trial.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$What does Paige do?$q$, $q$Paige is an AI assistant that analyzes competitor Google Business Profiles and automatically applies optimization changes.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Where is Merchynt based?$q$, $q$Santa Monica, California.$q$, 3);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Are there discounts for agencies?$q$, $q$Yes, agencies get 50% off the citation ($20) and reviews ($25) add-ons.$q$, 4);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Automated GBP optimization$q$, $q$Let Paige AI continuously analyze and optimize a Google Business Profile.$q$, $q$Business owners without SEO expertise$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Agency multi-location management$q$, $q$Manage citations and reviews for multiple client locations with discounted agency add-on pricing.$q$, $q$Marketing agencies$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Automated review requests$q$, $q$Send SMS review requests and manage responses automatically.$q$, $q$Local businesses building review volume$q$, 2);

INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Paige$q$, $q$$99/month per business$q$, $q$monthly$q$, $q$["AI GBP optimization","Automated posting","Image/video optimization"]$q$::jsonb, 0);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Citation add-on$q$, $q$$40/month ($20/month for agencies)$q$, $q$monthly$q$, $q$["Citation management across directories"]$q$::jsonb, 1);
INSERT INTO tool_pricing_plans (tool_id, plan_name, price, billing_cycle, features, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$Reviews add-on$q$, $q$$50/month ($25/month for agencies)$q$, $q$monthly$q$, $q$["Review management and SMS requests"]$q$::jsonb, 2);

INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$overview$q$, $q$What is Merchynt?$q$, 2, ARRAY[$q$Merchynt is an AI-powered local SEO platform built around Paige, an AI assistant that analyzes competitor Google Business Profiles and automatically applies optimization changes.$q$, $q$Beyond core GBP optimization, it offers add-on modules for citation management and review management, plus a free Chrome extension called ProfilePro for auditing a business profile.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', $q$who-its-for$q$, $q$Who Merchynt is for$q$, 2, ARRAY[$q$Merchynt is built for small to medium-sized businesses, marketing agencies managing multiple client locations, and franchise operations that want automated, ongoing GBP optimization.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('3b0618a9-c067-473b-869a-3d9864cb6eda', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Chatmeter ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Chatmeter provides AI-powered listings and reputation management for multi-location businesses, now part of Alchemer.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Chatmeter: AI-powered listings and reputation management across Google, Apple Maps, and 70+ directories.$q$,
  og_description = $q$Chatmeter: AI-powered listings and reputation management across Google, Apple Maps, and 70+ directories.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '0be2db6b-44c2-4d2c-bc3d-01cd84786d78';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '0be2db6b-44c2-4d2c-bc3d-01cd84786d78' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Listings Management$q$, $q$Maintains accuracy across Google, Apple Maps, and 70+ directories.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Local Pages$q$, $q$Creates SEO-optimized landing pages for each business location.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Reputation Management$q$, $q$Enables businesses to respond to reviews at scale using purpose-built AI.$q$, 2);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Manages listings across 70+ directories including Google and Apple Maps.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Uses purpose-built AI to help respond to reviews at scale.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Now backed by Alchemer's broader customer intelligence platform following integration.$q$, 2);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$No public pricing or free trial information is available on the site.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Founding year, headquarters, and company size aren't disclosed.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Now operates as part of Alchemer, so it may be positioned within a broader suite rather than as a fully standalone product.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Is Chatmeter still a standalone product?$q$, $q$Chatmeter is now integrated into the Alchemer platform, described as a complete customer intelligence platform, though it retains its name.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$How many directories does Chatmeter cover?$q$, $q$Listings Management maintains accuracy across Google, Apple Maps, and more than 70 other directories.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Does Chatmeter use AI?$q$, $q$Yes, it uses purpose-built AI to help businesses respond to reviews at scale.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Where can I find Chatmeter's pricing?$q$, $q$Pricing isn't published on the site; prospective customers need to contact the company directly.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Multi-location listings accuracy$q$, $q$Keep business listings accurate across Google, Apple Maps, and 70+ directories.$q$, $q$Multi-location brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$Scaled review response$q$, $q$Respond to customer reviews at scale using purpose-built AI.$q$, $q$Businesses managing high review volume$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$overview$q$, $q$What is Chatmeter?$q$, 2, ARRAY[$q$Chatmeter is an AI-powered reputation and listings management platform for multi-location businesses, covering listings accuracy, review response, and local landing pages.$q$, $q$It is now integrated into the Alchemer platform, a customer intelligence platform, while continuing to operate under the Chatmeter name.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', $q$who-its-for$q$, $q$Who Chatmeter is for$q$, 2, ARRAY[$q$Chatmeter is aimed at multi-location businesses that need to manage listings accuracy and customer reviews across many locations and review sites from one place.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('0be2db6b-44c2-4d2c-bc3d-01cd84786d78', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Rio SEO ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Rio SEO's Local Experience platform manages listings, reviews, local landing pages, and feedback for enterprise brands.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Rio SEO Local Experience platform: enterprise listings management, reviews, local landing pages, and customer feedback.$q$,
  og_description = $q$Rio SEO Local Experience platform: enterprise listings management, reviews, local landing pages, and customer feedback.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = '5b222011-bf30-40f8-a823-ef6029be8ff5';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = '5b222011-bf30-40f8-a823-ef6029be8ff5' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Local Listing Management$q$, $q$Manages business listings across multiple platforms.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Local Landing Pages & Store Locators$q$, $q$Builds local landing pages and store locator tools.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Review Management$q$, $q$Manages and responds to customer reviews.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Voice of Customer (VoC)$q$, $q$Runs surveys and digital feedback collection.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Local Social Media Management$q$, $q$Manages social media at the local location level.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Local Ratings & Reporting$q$, $q$Reports on local ratings and performance.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Forsta AI$q$, $q$An AI component integrated into the platform.$q$, 6);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Integrates with Google, Apple, Bing, Yelp, Facebook, and Nextdoor, plus hundreds of other search engines, maps, and voice assistants.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Serves multiple verticals including retail, financial services, restaurants, hospitality, and healthcare.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Includes Voice of Customer surveys alongside standard reputation tools.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Offers a free local audit for prospective customers.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$No public pricing; requires a demo request or sales contact.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$No free trial is offered, only a free audit.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Founding year, headquarters, and company size aren't disclosed on the site.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Does Rio SEO publish pricing?$q$, $q$No, pricing isn't listed; prospects must request a demo or contact sales.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Is there a free trial?$q$, $q$No free trial is mentioned, but a free local audit is available.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$What is Forsta AI?$q$, $q$Forsta AI is an AI component of the Rio SEO platform, though the site doesn't detail its specific capabilities.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$What platforms does Rio SEO integrate with?$q$, $q$Google, Apple, Bing, Yelp, Facebook, and Nextdoor, among others.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Enterprise multi-location listings$q$, $q$Manage business listings across major platforms for large, multi-location brands.$q$, $q$Enterprise retail, restaurant, and healthcare brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$Customer feedback collection$q$, $q$Run Voice of Customer surveys alongside review management.$q$, $q$Brands measuring customer experience$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$overview$q$, $q$What is Rio SEO?$q$, 2, ARRAY[$q$Rio SEO offers the Local Experience (LX) platform, a suite of local marketing and customer experience tools covering listings management, local landing pages, review management, and Voice of Customer feedback.$q$, $q$The platform integrates with major search engines, maps applications, and directories including Google, Apple, Bing, Yelp, Facebook, and Nextdoor, and includes an AI component called Forsta AI.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', $q$who-its-for$q$, $q$Who Rio SEO is for$q$, 2, ARRAY[$q$Rio SEO is built for enterprise brands with multiple locations across retail, financial services, restaurants, hospitality, and healthcare that need centralized local marketing and customer experience management.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('5b222011-bf30-40f8-a823-ef6029be8ff5', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Marqii ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Marqii manages online listings, reviews, menus, and local SEO for restaurants, used by more than 15,000 locations.$q$,
  pricing_model = NULL,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Marqii: restaurant listings, AI review responses, menu sync, and SEO location pages, used by 15,000+ restaurants.$q$,
  og_description = $q$Marqii: restaurant listings, AI review responses, menu sync, and SEO location pages, used by 15,000+ restaurants.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'fd376b9a-76da-4d57-99b7-dede36f6af47';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'fd376b9a-76da-4d57-99b7-dede36f6af47' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Listings Management$q$, $q$Automates updates across 70+ platforms including Google, Yelp, Apple Maps, and Facebook.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Review Management$q$, $q$Uses AI to generate review responses automatically.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Menu Management$q$, $q$Integrates with POS systems to keep menus updated across listings.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Host$q$, $q$Creates SEO/GEO-optimized location pages with schema markup.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Social Management$q$, $q$Unifies social media interaction management.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$FAQ Widgets$q$, $q$Builds branded FAQ sections optimized for AI search.$q$, 5);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Used by more than 15,000 restaurants, including named brands like Tacodeli and Insomnia Cookies.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Automates listings updates across 70+ platforms including Google, Yelp, Apple Maps, and Facebook.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$AI-powered review responses reduce manual reply workload.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Offers a free AI Visibility Scan before purchase.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$No public pricing on the homepage; requires scheduling a demo.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$No free trial mentioned, only demos and a free scan.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Founding year and headquarters aren't disclosed on the pages reviewed.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$How many restaurants use Marqii?$q$, $q$More than 15,000, including brands like Tacodeli, Insomnia Cookies, Deschutes Brewery, and Cooper's Hawk.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Does Marqii offer a free trial?$q$, $q$No trial is mentioned; Marqii offers a free AI Visibility Scan and demo scheduling instead.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$What does Marqii's Host feature do?$q$, $q$It creates SEO/GEO-optimized location pages with schema markup for each restaurant location.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Can Marqii update menus automatically?$q$, $q$Yes, Menu Management integrates with POS systems to keep menus current across listings.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$Multi-location listings management$q$, $q$Keep menus, hours, and listings accurate across 70+ platforms for every location.$q$, $q$Multi-location restaurant brands$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$AI-assisted review responses$q$, $q$Use AI to respond to guest reviews at scale.$q$, $q$Independent restaurants and hospitality groups$q$, 1);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$AI search optimization$q$, $q$Add schema-marked location pages and FAQ widgets built for AI search visibility.$q$, $q$Restaurants optimizing for AI-driven search$q$, 2);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$overview$q$, $q$What is Marqii?$q$, 2, ARRAY[$q$Marqii is a digital hospitality platform that manages online discoverability and guest engagement for restaurants, centralizing listings, reviews, menus, and local SEO performance.$q$, $q$It is used by more than 15,000 restaurants, including brands like Tacodeli, Insomnia Cookies, Deschutes Brewery, and Cooper's Hawk, to keep listings and menus consistent across 70+ platforms.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', $q$who-its-for$q$, $q$Who Marqii is for$q$, 2, ARRAY[$q$Marqii serves independent restaurants, multi-location restaurant brands, ghost kitchens, and marketing agencies serving hospitality clients.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('fd376b9a-76da-4d57-99b7-dede36f6af47', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

-- ── Owner.com ──────────────────────────────────────────────
UPDATE tools SET
  short_description = $q$Owner.com is an AI-powered website, ordering, and marketing platform helping independent restaurants grow direct sales.$q$,
  pricing_model = $q$Custom/Enterprise$q$,
  starting_price = NULL,
  founded_year = NULL,
  company_size = NULL,
  headquarters = NULL,
  languages = '{}',
  seo_meta_description = $q$Owner.com: AI restaurant websites, commission-free online ordering, delivery, and marketing for independent restaurants.$q$,
  og_description = $q$Owner.com: AI restaurant websites, commission-free online ordering, delivery, and marketing for independent restaurants.$q$,
  status = 'published',
  noindex = false,
  sitemap_eligible = true,
  published_at = COALESCE(published_at, now()),
  updated_at = now()
WHERE id = 'af3ba62b-b530-4e1a-9d87-543bbbe2cc25';

UPDATE tools SET logo = 'https://www.google.com/s2/favicons?domain=' || regexp_replace(regexp_replace(website, '^https?://', ''), '/.*$', '') || '&sz=256' WHERE id = 'af3ba62b-b530-4e1a-9d87-543bbbe2cc25' AND logo IS NULL AND website IS NOT NULL;

INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$AI-Powered Restaurant Website$q$, $q$Builds an SEO-optimized restaurant website.$q$, 0);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Branded Mobile App$q$, $q$Provides a branded app with a rewards/loyalty program.$q$, 1);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Online Ordering System$q$, $q$An ordering system modeled after major restaurant brands.$q$, 2);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Direct Delivery$q$, $q$Offers delivery without third-party commission fees.$q$, 3);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Email & SMS Marketing$q$, $q$Automates marketing campaigns and push notifications.$q$, 4);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Kitchen Tablet & POS Integrations$q$, $q$Connects with kitchen tablets and POS systems.$q$, 5);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Reporting & Analytics$q$, $q$Provides a dashboard for tracking performance.$q$, 6);
INSERT INTO tool_features (tool_id, title, description, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Reviews Engine$q$, $q$Manages reviews and listings.$q$, 7);

INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Positions itself as an alternative to third-party delivery apps that charge 25-40% commission.$q$, 0);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Includes a branded iOS/Android mobile app with a loyalty program.$q$, 1);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Combines website, ordering, delivery, and marketing in one platform for restaurants.$q$, 2);
INSERT INTO tool_pros (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Includes a reporting and analytics dashboard.$q$, 3);

INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Pricing isn't published; the site directs visitors to request a demo.$q$, 0);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$No free trial mentioned.$q$, 1);
INSERT INTO tool_cons (tool_id, text, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Founding year, headquarters, and company size aren't disclosed on the pages reviewed.$q$, 2);

INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$How much does Owner.com cost?$q$, $q$Pricing isn't published on the site; prospective customers must request a demo.$q$, 0);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Does Owner.com replace third-party delivery apps?$q$, $q$It offers direct delivery without the 25-40% commissions typically charged by third-party delivery platforms.$q$, 1);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Does Owner.com have a mobile app?$q$, $q$Yes, it includes a branded mobile app with a rewards/loyalty program for iOS and Android.$q$, 2);
INSERT INTO tool_faqs (tool_id, question, answer, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Does Owner.com integrate with restaurant POS systems?$q$, $q$Yes, it offers kitchen tablet and POS integrations.$q$, 3);

INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Direct online ordering$q$, $q$Replace third-party delivery apps with a commission-free direct ordering system.$q$, $q$Independent restaurant owners$q$, 0);
INSERT INTO tool_use_cases (tool_id, title, description, audience, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$Customer retention$q$, $q$Use a branded app, loyalty program, and email/SMS marketing to bring back repeat customers.$q$, $q$Restaurants building repeat business$q$, 1);


INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$overview$q$, $q$What is Owner.com?$q$, 2, ARRAY[$q$Owner.com is an AI-powered platform that helps independent restaurants grow online sales through an optimized website, branded mobile app, online ordering, and direct delivery without third-party commissions.$q$, $q$It also includes email and SMS marketing automation, kitchen tablet and POS integrations, and a reporting dashboard, aiming to help restaurants compete with national chains.$q$]::text[], 0);
INSERT INTO tool_content_blocks (tool_id, block_key, heading, level, paragraphs, sort_order) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', $q$who-its-for$q$, $q$Who Owner.com is for$q$, 2, ARRAY[$q$Owner.com is built for independent restaurant owners who want to reduce reliance on third-party delivery apps and their high commission fees.$q$]::text[], 1);

INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', 'c296bd6a-c865-41d7-8807-5dce653dd3f5') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', '5e4d4807-cae2-410c-9e7a-df0798a917cb') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', '7336153f-a26b-491c-b927-faf4f5a8d103') ON CONFLICT DO NOTHING;
INSERT INTO tool_tag_links (tool_id, tag_id) VALUES ('af3ba62b-b530-4e1a-9d87-543bbbe2cc25', '4137e3dc-5b54-4d6a-adfa-85ce8104e38f') ON CONFLICT DO NOTHING;

